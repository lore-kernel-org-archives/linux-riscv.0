Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65427C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 11:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XkK9Lumgw8XG9qrbQ5OMNnKBUL50F/Kd++1WYgoa3xo=; b=2Heh7yYefwXLKr
	2KQ6ouPH3mqMQgHNqhwdSYEQfcFQ+5wd/vNmeMStIsqcD/friiL36tsrPkyHtWFyEYwOWXxOKWaMT
	+B7KsCw0X6vnTSrEGDbofujM5xK6TWe2fEcUT/oKJ3PMb2JI+Z7K6tW7OGfxhk16yZ2YSo2TmNB21
	1VcD6MgY60uGJPz0gqVdvBRed2M07gkG0ps60FAeVSLmedSiIaXIfE9hk+C2vukyAcKSvBxzRXvKq
	elHLs0r6mqYbbZqeb3rucIIk92ii59kVCxzsHL/lOfswGjZXGjtuRjU9TAyXDyXgMY7/12KenRO9g
	TsKJFvr67Pilp8x/L4Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox4xQ-00Cut2-Vz; Mon, 21 Nov 2022 11:27:24 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox4xO-00CupR-3y
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 11:27:23 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ox4xC-00017p-8k; Mon, 21 Nov 2022 12:27:10 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu, ajones@ventanamicro.com, emil.renner.berthing@canonical.com
Subject: Re: [PATCH 5/7] RISC-V: fix auipc-jalr addresses in patched alternatives
Date: Mon, 21 Nov 2022 12:27:09 +0100
Message-ID: <2756003.PYKUYFuaPT@diego>
In-Reply-To: <CA+V-a8tNjE+eeZEafnCXbXMdhEdzOXcft2UJNYbXxs0+Pag58Q@mail.gmail.com>
References: <20221110164924.529386-1-heiko@sntech.de> <20221110164924.529386-6-heiko@sntech.de> <CA+V-a8tNjE+eeZEafnCXbXMdhEdzOXcft2UJNYbXxs0+Pag58Q@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_032722_191195_77A1ACF7 
X-CRM114-Status: GOOD (  24.66  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

Am Montag, 21. November 2022, 10:50:09 CET schrieb Lad, Prabhakar:
> On Thu, Nov 10, 2022 at 4:50 PM Heiko Stuebner <heiko@sntech.de> wrote:
> >
> > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> >
> > Alternatives live in a different section, so addresses used by call
> > functions will point to wrong locations after the patch got applied.
> >
> > Similar to arm64, adjust the location to consider that offset.
> >
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > ---

[...]

> I have the below assembly code which I have tested without the
> alternatives for the RZ/Five CMO,
> 
> #define ALT_CMO_OP(_op, _start, _size, _cachesize, _dir, _ops)        \
> asm volatile(".option push\n\t\n\t"                    \
>          ".option norvc\n\t"                    \
>          ".option norelax\n\t"                    \
>          "addi sp,sp,-16\n\t"                    \
>          "sd    s0,0(sp)\n\t"                    \
>          "sd    ra,8(sp)\n\t"                    \
>          "addi    s0,sp,16\n\t"                    \
>          "mv a4,%6\n\t"                        \
>          "mv a3,%5\n\t"                        \
>          "mv a2,%4\n\t"                        \
>          "mv a1,%3\n\t"                        \
>          "mv a0,%0\n\t"                        \
>          "call rzfive_cmo\n\t"                    \
>          "ld    ra,8(sp)\n\t"                    \
>          "ld    s0,0(sp)\n\t"                    \
>          "addi    sp,sp,16\n\t"                    \
>          ".option pop\n\t"                        \
>          : : "r"(_cachesize),                    \
>          "r"((unsigned long)(_start) & ~((_cachesize) - 1UL)),    \
>          "r"((unsigned long)(_start) + (_size)),            \
>          "r"((unsigned long) (_start)),                \
>          "r"((unsigned long) (_size)),                \
>          "r"((unsigned long) (_dir)),                \
>          "r"((unsigned long) (_ops))                \
>          : "a0", "a1", "a2", "a3", "a4", "memory")
>
> Now when integrate this with ALTERNATIVE_2() as below,
> 
> #define ALT_CMO_OP(_op, _start, _size, _cachesize, _dir, _ops)        \
> asm volatile(ALTERNATIVE_2(                        \
>     __nops(14),                            \
>     "mv a0, %1\n\t"                            \
>     "j 2f\n\t"                            \
>     "3:\n\t"                            \
>     "cbo." __stringify(_op) " (a0)\n\t"                \
>     "add a0, a0, %0\n\t"                        \
>     "2:\n\t"                            \
>     "bltu a0, %2, 3b\n\t"                        \
>     __nops(8), 0, CPUFEATURE_ZICBOM, CONFIG_RISCV_ISA_ZICBOM,    \
>     ".option push\n\t\n\t"                        \
>     ".option norvc\n\t"                        \
>     ".option norelax\n\t"                        \
>     "addi sp,sp,-16\n\t"                        \
>     "sd    s0,0(sp)\n\t"                        \
>     "sd    ra,8(sp)\n\t"                        \
>     "addi    s0,sp,16\n\t"                        \
>     "mv a4,%6\n\t"                            \
>     "mv a3,%5\n\t"                            \
>     "mv a2,%4\n\t"                            \
>     "mv a1,%3\n\t"                            \
>     "mv a0,%0\n\t"                            \
>     "call rzfive_cmo\n\t"                \
>     "ld    ra,8(sp)\n\t"                        \
>     "ld    s0,0(sp)\n\t"                        \
>     "addi    sp,sp,16\n\t"                        \
>     ".option pop\n\t"                        \
>     , ANDESTECH_VENDOR_ID,                        \
>             ERRATA_ANDESTECH_NO_IOCP, CONFIG_ERRATA_RZFIVE_CMO)    \
>     : : "r"(_cachesize),                        \
>     "r"((unsigned long)(_start) & ~((_cachesize) - 1UL)),    \
>     "r"((unsigned long)(_start) + (_size)),            \
>     "r"((unsigned long) (_start)),                \
>     "r"((unsigned long) (_size)),                \
>     "r"((unsigned long) (_dir)),                \
>     "r"((unsigned long) (_ops))                \
>     : "a0", "a1", "a2", "a3", "a4", "memory")
> 
> I am seeing kernel panic with this change. Looking at the
> riscv_alternative_fix_auipc_jalr() implementation it assumes the rest
> of the alternative options are calls too. Is my understanding correct
> here?

The loop walks through the instructions after the location got patched and
checks if an instruction is an auipc and the next one is a jalr and only then
adjusts the address accordingly.

So it _should_ leave all other (non auipc+jalr) instructions alone.
(hopefully)


> Do you think this is the correct approach in my case?

It does look correct on first glance.

As I had that passing thought, are you actually calling
	riscv_alternative_fix_auipc_jalr()
from your errata/.../foo.c after doing the patching?

I.e. with the current patchset, that function is only called from the
cpufeature part, but for example not from the other patching locations.
[and a future revision should probably change that :-) ]


After making sure that function actually runs, the next thing you could try
is to have both the "original" code and the patch be identical, i.e.
replace the cbo* part with your code as well and then just output the
instructions via printk to check what the addresses do in both.

After riscv_alternative_fix_auipc_jalr() ran then both code variants
should be identical when using the same code in both areas.


> Note, I wanted to test with ALTERNATIVE_2() first to make sure
> everything is okay and then later test my ALTERNATIVE_3()
> implementation.

sounds like a very sensible idea to use the existing macros
first for verification :-)


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
