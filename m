From: zongbox@gmail.com (Zong Li)
Date: Wed, 26 Sep 2018 15:12:45 +0800
Subject: [PATCH 3/5] lib: Add umoddi3 and udivmoddi4 of GCC library
 routines
In-Reply-To: <mvmefdicabq.fsf@suse.de>
References: <cover.1537260207.git.zongbox@gmail.com>
 <2ccc6c0758624dbb22f6fe451a3e476a000108ef.1537260207.git.zongbox@gmail.com>
 <20180921070006.GC8401@infradead.org>
 <CA+ZOyaiJv-NZWk3ec_3zhRTSn7G-NGgyaiPTXOmuWfTWD7KSJw@mail.gmail.com>
 <mvmefdicabq.fsf@suse.de>
Message-ID: <CA+ZOyagnA=NRjRH4qWw8FgOTBr1uAvDvK1Pk8MAw8ysQdgdfPA@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Andreas Schwab <schwab@suse.de> ? 2018?9?25? ?? ??3:20???
>
> On Sep 25 2018, Zong Li <zongbox@gmail.com> wrote:
>
> > The RV32 need the umoddi3 to do modulo when the operands are long long
> > type, like other libraries implementation such as ucmpdi2, lshrdi3 and
> > so on. I encounter the undefined reference 'umoddi3' when I use the in
> > house dma driver, although it is in house driver, but I think that
> > umoddi3 is a common function for RV32.
>
> You probably should use the macros from <asm/div64.h> instead.

Hi Andreas,

This doesn't work for me, the divisor of my case is also long long type.
