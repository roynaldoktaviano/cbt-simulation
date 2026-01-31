"use client";
import { ColumnDef } from "@tanstack/react-table";

export const columns: ColumnDef<any>[] = [
    {
        accessorKey: "name",
        header: "Nama Ujian",
    },
    {
        accessorKey: "jenis",
        header: "Jenis Ujian",
    },
    {
        accessorKey: "tipe",
        header: "Tipe Ujian",
    },
    {
        accessorKey: "tanggal",
        header: "Tanggal Ujian",
    },
    {
        id: "actions",
        header: "Aksi",
        cell: ({ row }) => {
            return <div>Aksi</div>;
        },
    }
     
]