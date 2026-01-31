"use client"

import { ColumnDef } from "@tanstack/react-table";

export const columns: ColumnDef<any>[] = [
    {
        accessorKey: "name",
        header: "Nama Blok",
    },
    {
        accessorKey: "createdAt",
        header: "Tanggal Buat",
    },
    {
        accessorKey: "updatedAt",
        header: "Tanggal Terakhir Update",
    }, 
    {
        id: "actions",
        header: "Aksi",
        cell: ({ row }) => {
            return <div>Aksi</div>;
        },
    }
]