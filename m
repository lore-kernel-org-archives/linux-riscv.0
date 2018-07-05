From: hch@infradead.org (Christoph Hellwig)
Date: Thu, 5 Jul 2018 15:21:10 -0700
Subject: [PATCH v2 3/7] riscv: Include asm-generic/compat.h
In-Reply-To: <20180705213604.18883-4-deepa.kernel@gmail.com>
References: <20180705213604.18883-1-deepa.kernel@gmail.com>
 <20180705213604.18883-4-deepa.kernel@gmail.com>
Message-ID: <20180705222110.GA5698@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Jul 05, 2018 at 02:36:00PM -0700, Deepa Dinamani wrote:
> defconfig, allmodconfig and nomodconfig.
> And hence does not inlude definitions for compat data types.
> 
> Now that time syscalls are being reused in non CONFIG_COMPAT
> modes, include asm-generic definitions for riscv.
> 
> Alternative would be to make compat_time.h to be conditional on
> CONFIG_COMPAT_32BIT_TIME. But, since riscv is already has an
> asm/compat.h include the generic version instead.

Two comments here:

First I think the current riscv compat.h is completely bogus.
As you mentioned riscv does not actually have a compat mode, so
having a compat.h makes no sensse at all, and the COMPAT_UTS_MACHINE
override which is the only thing implemented is included in that
statement.

Second I think abusing compat.h for old syscall compatibility of any
form is a really bad idea.  I think you need to split that part out,
and preferably not using compat in the name, but something like
old-time.h or time32.h for the name.
