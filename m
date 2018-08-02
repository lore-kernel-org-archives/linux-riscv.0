From: hch@infradead.org (Christoph Hellwig)
Date: Thu, 2 Aug 2018 04:35:55 -0700
Subject: [PATCH v3 1/4] Extract FPU context operations from entry.S
In-Reply-To: <1533188391-5932-2-git-send-email-alankao@andestech.com>
References: <1533188391-5932-1-git-send-email-alankao@andestech.com>
 <1533188391-5932-2-git-send-email-alankao@andestech.com>
Message-ID: <20180802113555.GA17108@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

> diff --git a/arch/riscv/kernel/fpu.S b/arch/riscv/kernel/fpu.S
> new file mode 100644
> index 000000000000..3210ef502e55
> --- /dev/null
> +++ b/arch/riscv/kernel/fpu.S
> @@ -0,0 +1,105 @@
> +/*
> + * Copyright (C) 2012 Regents of the University of California
> + * Copyright (C) 2017 SiFive
> + *
> + *   This program is free software; you can redistribute it and/or
> + *   modify it under the terms of the GNU General Public License
> + *   as published by the Free Software Foundation, version 2.
> + *
> + *   This program is distributed in the hope that it will be useful,
> + *   but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *   GNU General Public License for more details.
> + */

It would be good to have SPDX headers fo every new file (and eventually
switch the other RISC-V code over).

Otherwise this looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
