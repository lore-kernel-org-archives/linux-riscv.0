From: hch@infradead.org (Christoph Hellwig)
Date: Thu, 12 Jul 2018 01:14:47 -0700
Subject: [PATCH v3 3/7] riscv: Delete asm/compat.h
In-Reply-To: <20180707054247.19802-4-deepa.kernel@gmail.com>
References: <20180707054247.19802-1-deepa.kernel@gmail.com>
 <20180707054247.19802-4-deepa.kernel@gmail.com>
Message-ID: <20180712081447.GA28806@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, Jul 06, 2018 at 10:42:43PM -0700, Deepa Dinamani wrote:
> riscv does not enable CONFIG_COMPAT in default configurations:
> defconfig, allmodconfig and allnoconfig.
> Remove the asm/compat.h as it does not seem to add any value to
> the architecture without CONFIG_COMPAT.

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

> 
> Now that time compat syscalls are being reused in non CONFIG_COMPAT
> modes, asm-generic/compat.h provides definitions for riscv 32 bit
> mode.
> 
> Alternative would be to make compat_time.h to be conditional on
> CONFIG_COMPAT_32BIT_TIME. But, since riscv does not does not need
> asm/compat.h, delete it instead.

Except that all this isn't relavant for this patch (and a horribly
bad idea, but ?'ll reply to it separately).
