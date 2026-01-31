"use client"

import { Button } from "@/components/ui/button";
import { ColumnDef } from "@tanstack/react-table";
import { ArrowUpDown } from "lucide-react";

export const columnsUjian: ColumnDef<any>[] = [
    {
        accessorKey: "name",
        header:"Nama Ujian",
    },
    {
        accessorKey: "jenis",
        header: "Jenis Ujian",
    },
    {
        accessorKey:"tipe",
        header: "Tipe Ujian"
    },
    {
        accessorKey: "tanggalUjian",
        header: ({column}) => {
            return (
        <Button
          variant="ghost"
          onClick={() => column.toggleSorting(column.getIsSorted() === "asc")}
        >
          Tanggal Ujian
          <ArrowUpDown className=" h-1 w-1 text-gray-300" />
        </Button>
      )
        },
    },
    {
        accessorKey:"periode",
        header:"Semester"
    },
    {
        id: "actions",
        header: "Aksi",
        cell: ({ row }) => {
            return <div>Aksi</div>;
        },
    }
]