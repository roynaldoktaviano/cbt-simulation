"use client"

import { ColumnDef } from "@tanstack/react-table";

export const columnsBlok: ColumnDef<any>[] = [
    {
        accessorKey: "name",
        header: "Nama Blok",
    },
    {
        accessorKey: "ketua",
        header: "Ketua Blok",
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