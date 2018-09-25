From: schwab@suse.de (Andreas Schwab)
Date: Tue, 25 Sep 2018 09:20:25 +0200
Subject: [PATCH 3/5] lib: Add umoddi3 and udivmoddi4 of GCC library
 routines
In-Reply-To: <CA+ZOyaiJv-NZWk3ec_3zhRTSn7G-NGgyaiPTXOmuWfTWD7KSJw@mail.gmail.com>
 (Zong Li's message of "Tue, 25 Sep 2018 10:19:55 +0800")
References: <cover.1537260207.git.zongbox@gmail.com>
 <2ccc6c0758624dbb22f6fe451a3e476a000108ef.1537260207.git.zongbox@gmail.com>
 <20180921070006.GC8401@infradead.org>
 <CA+ZOyaiJv-NZWk3ec_3zhRTSn7G-NGgyaiPTXOmuWfTWD7KSJw@mail.gmail.com>
Message-ID: <mvmefdicabq.fsf@suse.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Sep 25 2018, Zong Li <zongbox@gmail.com> wrote:

> The RV32 need the umoddi3 to do modulo when the operands are long long
> type, like other libraries implementation such as ucmpdi2, lshrdi3 and
> so on. I encounter the undefined reference 'umoddi3' when I use the in
> house dma driver, although it is in house driver, but I think that
> umoddi3 is a common function for RV32.

You probably should use the macros from <asm/div64.h> instead.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
