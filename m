From: hch@infradead.org (Christoph Hellwig)
Date: Wed, 26 Sep 2018 07:11:59 -0700
Subject: [PATCH v2 3/5] lib: Add umoddi3 and udivmoddi4 of GCC library
 routines
In-Reply-To: <7a24493868f29559a1628eed44af15dc10a9940a.1537949825.git.zongbox@gmail.com>
References: <cover.1537949825.git.zongbox@gmail.com>
 <7a24493868f29559a1628eed44af15dc10a9940a.1537949825.git.zongbox@gmail.com>
Message-ID: <20180926141159.GA28142@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Sep 26, 2018 at 04:31:12PM +0800, Zong Li wrote:
> diff --git a/lib/udivmoddi4.c b/lib/udivmoddi4.c
> new file mode 100644
> index 0000000..6518b3a
> --- /dev/null
> +++ b/lib/udivmoddi4.c
> @@ -0,0 +1,309 @@

needs and SPDX tag.

> +/*
> + * This program is free software; you can redistribute it and/or modify it under
> + * the terms of the GNU General Public License as published by the Free
> + * Software Foundation; either version 3, or (at your option) any later
> + * version.

We can't take GPLv3 code for the kernel.

> + * Under Section 7 of GPL version 3, you are granted additional
> + * permissions described in the GCC Runtime Library Exception, version
> + * 3.1, as published by the Free Software Foundation.
> + *
> + * You should have received a copy of the GNU General Public License and
> + * a copy of the GCC Runtime Library Exception along with this program;
> + * see the files COPYING3 and COPYING.RUNTIME respectively.

unless this exception somehow counts (which I doubt), but for that we'd
actually need it in the tree.
