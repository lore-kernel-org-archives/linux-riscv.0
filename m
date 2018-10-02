From: palmer@sifive.com (Palmer Dabbelt)
Date: Tue, 02 Oct 2018 08:02:48 -0700 (PDT)
Subject: [PATCH v3 3/5] lib: Add umoddi3 and udivmoddi4 of GCC library
 routines
In-Reply-To: <20181002145041.GC3889@infradead.org>
Message-ID: <mhng-2b0c98e6-298b-4fc4-842c-809002de3451@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 02 Oct 2018 07:50:41 PDT (-0700), Christoph Hellwig wrote:
>> The udivmoddi4 and umoddi3 are copies from libgcc in gcc. There are other
>> functions use the udivmoddi4 in libgcc, so I separate the umoddi3 and
>> udivmoddi4 for flexible extension in the future.
>
> Can you please mention which exact version of an external projected
> you imported things from?  That will generally help if/when someone
> has to dig into diverging versions.
>
>> +++ b/lib/udivmoddi4.c
>> @@ -0,0 +1,310 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +/*
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program; if not, see the file COPYING, or write
>> + * to the Free Software Foundation, Inc.
>> + */
>
> The SPDX tag was supposed to replace this boiler plate.  On the other
> hand I'm surpriced there is no Copyright statement here - the FSF is
> usually very good about having them uptodate in every GNU project.

I suggested he import the gcc-4.2.1 version, which has a big copyright notice

    /* More subroutines needed by GCC output code on some machines.  */
    /* Compile this one with gcc.  */
    /* Copyright (C) 1989, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999,
       2000, 2001, 2002, 2003, 2004, 2005  Free Software Foundation, Inc.
    
    This file is part of GCC.
    
    GCC is free software; you can redistribute it and/or modify it under
    the terms of the GNU General Public License as published by the Free
    Software Foundation; either version 2, or (at your option) any later
    version.
    
    In addition to the permissions in the GNU General Public License, the
    Free Software Foundation gives you unlimited permission to link the
    compiled version of this file into combinations with other programs,
    and to distribute those combinations without any restriction coming
    from the use of this file.  (The General Public License restrictions
    do apply in other respects; for example, they cover modification of
    the file, and distribution when not linked into a combine
    executable.)
    
    GCC is distributed in the hope that it will be useful, but WITHOUT ANY
    WARRANTY; without even the implied warranty of MERCHANTABILITY or
    FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
    for more details.
    
    You should have received a copy of the GNU General Public License
    along with GCC; see the file COPYING.  If not, write to the Free
    Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
    02110-1301, USA.  */

so it looks like something went wrong here.  Zong: did you go back and 
re-construct this function from the GPLv2 source?
