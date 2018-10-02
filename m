From: hch@infradead.org (Christoph Hellwig)
Date: Tue, 2 Oct 2018 07:50:41 -0700
Subject: [PATCH v3 3/5] lib: Add umoddi3 and udivmoddi4 of GCC library
 routines
In-Reply-To: <2144f372b95f236afe47da4fc575a42ec95e8239.1538470103.git.zongbox@gmail.com>
References: <cover.1538470103.git.zongbox@gmail.com>
 <2144f372b95f236afe47da4fc575a42ec95e8239.1538470103.git.zongbox@gmail.com>
Message-ID: <20181002145041.GC3889@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

> The udivmoddi4 and umoddi3 are copies from libgcc in gcc. There are other
> functions use the udivmoddi4 in libgcc, so I separate the umoddi3 and
> udivmoddi4 for flexible extension in the future.

Can you please mention which exact version of an external projected
you imported things from?  That will generally help if/when someone
has to dig into diverging versions.

> +++ b/lib/udivmoddi4.c
> @@ -0,0 +1,310 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see the file COPYING, or write
> + * to the Free Software Foundation, Inc.
> + */

The SPDX tag was supposed to replace this boiler plate.  On the other
hand I'm surpriced there is no Copyright statement here - the FSF is
usually very good about having them uptodate in every GNU project.
