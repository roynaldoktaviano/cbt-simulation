-- CreateEnum
CREATE TYPE "JenisUjian" AS ENUM ('UTAMA', 'REMIDIAL');

-- CreateEnum
CREATE TYPE "TipeUjian" AS ENUM ('PRAKTIKUM', 'TEORI');

-- CreateEnum
CREATE TYPE "StatusPartisipasi" AS ENUM ('BELUM_MULAI', 'BERLANGSUNG', 'SELESAI');

-- CreateEnum
CREATE TYPE "Periode" AS ENUM ('GANJIL', 'GENAP');

-- CreateTable
CREATE TABLE "LecturerProfile" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "nik" TEXT NOT NULL,
    "block_id" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LecturerProfile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PeriodeAkademik" (
    "id" TEXT NOT NULL,
    "nama_periode" "Periode" NOT NULL,
    "tahun_akademik" TEXT NOT NULL,
    "is_active" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PeriodeAkademik_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Block" (
    "id" TEXT NOT NULL,
    "nama_blcok" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Block_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BidangIlmu" (
    "id" TEXT NOT NULL,
    "nama_bidang" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BidangIlmu_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Soal" (
    "id" TEXT NOT NULL,
    "block_id" TEXT NOT NULL,
    "text_soal" TEXT NOT NULL,
    "image_soal" TEXT,
    "bidang_ilmu_id" TEXT NOT NULL,
    "jawaban_benar" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Soal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Jawaban" (
    "id" TEXT NOT NULL,
    "soal_id" TEXT NOT NULL,
    "label" TEXT NOT NULL,
    "text_jawaban" TEXT,
    "gambar_jawaban" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Jawaban_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Ujian" (
    "id" TEXT NOT NULL,
    "nama_ujian" TEXT NOT NULL,
    "jenis_ujian" "JenisUjian" NOT NULL,
    "tipe_ujian" "TipeUjian" NOT NULL,
    "waktu_mulia" TIMESTAMP(3) NOT NULL,
    "durasi" INTEGER NOT NULL,
    "nilai_minumum" INTEGER NOT NULL,
    "lihat_hasil" BOOLEAN NOT NULL DEFAULT false,
    "block_id" TEXT NOT NULL,
    "periode_akademik_id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Ujian_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PartisipasiUjian" (
    "id" TEXT NOT NULL,
    "ujian_id" TEXT NOT NULL,
    "student_id" TEXT NOT NULL,
    "status" "StatusPartisipasi" NOT NULL DEFAULT 'BELUM_MULAI',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PartisipasiUjian_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "JawabanStudent" (
    "id" TEXT NOT NULL,
    "partisipasi_id" TEXT NOT NULL,
    "soal_id" TEXT NOT NULL,
    "pilihan_jawaban" TEXT NOT NULL,
    "isCorrect" BOOLEAN NOT NULL,
    "isFlagged" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "JawabanStudent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "HasilUjian" (
    "id" TEXT NOT NULL,
    "partisipasi_id" TEXT NOT NULL,
    "total_soal" INTEGER NOT NULL,
    "jumlah_benar" INTEGER NOT NULL,
    "nilai_akhir" DOUBLE PRECISION NOT NULL,
    "staus_lulus" BOOLEAN NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "HasilUjian_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "LecturerProfile_userId_key" ON "LecturerProfile"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "LecturerProfile_nik_key" ON "LecturerProfile"("nik");

-- CreateIndex
CREATE UNIQUE INDEX "LecturerProfile_block_id_key" ON "LecturerProfile"("block_id");

-- CreateIndex
CREATE UNIQUE INDEX "Block_nama_blcok_key" ON "Block"("nama_blcok");

-- CreateIndex
CREATE UNIQUE INDEX "BidangIlmu_nama_bidang_key" ON "BidangIlmu"("nama_bidang");

-- CreateIndex
CREATE UNIQUE INDEX "Soal_block_id_key" ON "Soal"("block_id");

-- CreateIndex
CREATE UNIQUE INDEX "Soal_text_soal_key" ON "Soal"("text_soal");

-- CreateIndex
CREATE UNIQUE INDEX "Jawaban_soal_id_key" ON "Jawaban"("soal_id");

-- CreateIndex
CREATE UNIQUE INDEX "Ujian_nama_ujian_key" ON "Ujian"("nama_ujian");

-- CreateIndex
CREATE UNIQUE INDEX "HasilUjian_partisipasi_id_key" ON "HasilUjian"("partisipasi_id");

-- AddForeignKey
ALTER TABLE "LecturerProfile" ADD CONSTRAINT "LecturerProfile_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LecturerProfile" ADD CONSTRAINT "LecturerProfile_block_id_fkey" FOREIGN KEY ("block_id") REFERENCES "Block"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Soal" ADD CONSTRAINT "Soal_block_id_fkey" FOREIGN KEY ("block_id") REFERENCES "Block"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Soal" ADD CONSTRAINT "Soal_bidang_ilmu_id_fkey" FOREIGN KEY ("bidang_ilmu_id") REFERENCES "BidangIlmu"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Jawaban" ADD CONSTRAINT "Jawaban_soal_id_fkey" FOREIGN KEY ("soal_id") REFERENCES "Soal"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ujian" ADD CONSTRAINT "Ujian_block_id_fkey" FOREIGN KEY ("block_id") REFERENCES "Block"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ujian" ADD CONSTRAINT "Ujian_periode_akademik_id_fkey" FOREIGN KEY ("periode_akademik_id") REFERENCES "PeriodeAkademik"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PartisipasiUjian" ADD CONSTRAINT "PartisipasiUjian_ujian_id_fkey" FOREIGN KEY ("ujian_id") REFERENCES "Ujian"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PartisipasiUjian" ADD CONSTRAINT "PartisipasiUjian_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "StudentProfile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JawabanStudent" ADD CONSTRAINT "JawabanStudent_partisipasi_id_fkey" FOREIGN KEY ("partisipasi_id") REFERENCES "PartisipasiUjian"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JawabanStudent" ADD CONSTRAINT "JawabanStudent_soal_id_fkey" FOREIGN KEY ("soal_id") REFERENCES "Soal"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "HasilUjian" ADD CONSTRAINT "HasilUjian_partisipasi_id_fkey" FOREIGN KEY ("partisipasi_id") REFERENCES "PartisipasiUjian"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
