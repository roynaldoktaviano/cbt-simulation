"use client"

import { ColumnDef } from "@tanstack/react-table";

export const columnsPeriode: ColumnDef<any>[] = [
    {
        accessorKey: "name",
        header: "Nama Tahun Ajaran",
    },
    {
        accessorKey: "status",
        header: "Status Periode",
    },
    {
        accessorKey: "semester",
        header: "Semester",
    },
    {
        accessorKey: "createdAt",
        header: "Tanggal Buat",
    },
    {
        id: "actions",
        header: "Aksi",
        cell: ({ row }) => {
            return <div>Aksi</div>;
        },
    },
]