From: hch@infradead.org (Christoph Hellwig)
Date: Fri, 21 Sep 2018 00:00:06 -0700
Subject: [PATCH 3/5] lib: Add umoddi3 and udivmoddi4 of GCC library
 routines
In-Reply-To: <2ccc6c0758624dbb22f6fe451a3e476a000108ef.1537260207.git.zongbox@gmail.com>
References: <cover.1537260207.git.zongbox@gmail.com>
 <2ccc6c0758624dbb22f6fe451a3e476a000108ef.1537260207.git.zongbox@gmail.com>
Message-ID: <20180921070006.GC8401@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Sep 18, 2018 at 05:19:15PM +0800, Zong Li wrote:
> Add umoddi3 and udivmoddi4 support for 32-bit.

This probably wants a better explanation of why you need them.

> index 0000000..69f2d36
> --- /dev/null
> +++ b/lib/udivmoddi4.c
> @@ -0,0 +1,291 @@
> +// SPDX-License-Identifier: GPL-2.0

Who wrote this code, where does it come from?
