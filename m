From: tglx@linutronix.de (Thomas Gleixner)
Date: Thu, 5 Jul 2018 22:33:55 +0200 (CEST)
Subject: [PATCH 3/6] timex: prepare compat helpers for y2038 changes
In-Reply-To: <CABeXuvoXX2=0XrnpDjxu74QBK3zd6qEk46tzYrMuRD+-FKjbZw@mail.gmail.com>
References: <20180703054422.12089-4-deepa.kernel@gmail.com>
 <201807051322.sUohKhUO%fengguang.wu@intel.com>
 <CABeXuvoXX2=0XrnpDjxu74QBK3zd6qEk46tzYrMuRD+-FKjbZw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1807052232310.1771@nanos.tec.linutronix.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, 5 Jul 2018, Deepa Dinamani wrote:

> The error is fixed with the following patch that goes in before patch
> 3/6 above in the series.
> Let me know if I should post a v2 instead.
> 
> Thanks,
> Deepa
> 
> 
> commit bfe4b046ed7f01154aef44fcb77d3f172929ccc2
> Author: Deepa Dinamani <deepa.kernel@gmail.com>
> Date:   Thu Jul 5 11:47:25 2018 -0700
> 
>     riscv: Include asm-generic/compat.h
> 
>     riscv does not enable CONFIG_COMPAT in default configurations:
>     defconfig, allmodconfig and nomodconfig.
>     And hence does not inlude definitions for compat data types.
> 
>     Now that time syscalls are being reused in non CONFIG_COMPAT
>     modes, include asm-generic definitions for riscv.
> 
>     Alternative would be to make compat_time.h to be conditional on
>     CONFIG_COMPAT_32BIT_TIME. But, since riscv is already has an
>     asm/compat.h include the generic version instead.
> 
>     Signed-off-by: Deepa Dinamani <deepa.kernel@gmail.com>
>     Cc: palmer at sifive.com
>     Cc: linux-riscv at lists.infradead.org

Post a real patch please instead of something which I have to cleanup
manually. A V2 of the series is probably the simplest way.

Thanks,

	tglx
