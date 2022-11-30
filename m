Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AB7C4321E
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 21:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ebYh02qXQdj/dajPIjVyRIGBtfsx+Of77EA2/wJVAE=; b=wtVibF+5Z6nZgi
	wloLOW2z+2UCTEIbeSzgqV2ar+33tHlTjZtqSvU4nG7Jzq1Hnqxryavim+RpUJY0wEpfGIA2MpYOh
	RrTB33cZpIpYkvf/JNzxcFHp1UwtVstGf7PPkvH+iNUwX+34tgYIyE57rtc1TNiUla3vfc7Yplgmc
	V6LC/sJP3qMCzbycoIYe97ubZ+FlzD0worM19KWSLrqvrgqK+eyuW0yCll/KUOfopsF5NsOozESik
	+vbG555xdwDJA6FpfqahD9M1/3ilAEa6a1ymeUM57hHARopgaL8++bpeWrl/zi1C5CV8hkWa9kvMB
	e+VEaZpTyGNfQvNXnV+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Ud3-002p3k-O2; Wed, 30 Nov 2022 21:28:29 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Ud0-002p0l-7j
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 21:28:28 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p0Uct-0004zf-Ph; Wed, 30 Nov 2022 22:28:19 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com, philipp.tomsich@vrull.eu, ajones@ventanamicro.com, emil.renner.berthing@canonical.com
Subject: Re: [PATCH v2 13/13] RISC-V: add zbb support to string functions
Date: Wed, 30 Nov 2022 22:28:19 +0100
Message-ID: <24615393.6Emhk5qWAg@diego>
In-Reply-To: <Y4ePiTIwJJfx9qS4@spud>
References: <20221128102632.435174-1-heiko@sntech.de> <20221128102632.435174-14-heiko@sntech.de> <Y4ePiTIwJJfx9qS4@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_132826_374303_FCE2B5A3 
X-CRM114-Status: GOOD (  21.82  )
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

Am Mittwoch, 30. November 2022, 18:14:49 CET schrieb Conor Dooley:
> On Mon, Nov 28, 2022 at 11:26:32AM +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > 
> > Add handling for ZBB extension and add support for using it as a
> > variant for optimized string functions.
> > 
> > Co-developed-by: Christoph Muellner <christoph.muellner@vrull.eu>
> > Signed-off-by: Christoph Muellner <christoph.muellner@vrull.eu>
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> > +config TOOLCHAIN_HAS_ZBB
> > +	bool
> > +	default y
> > +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbb)
> > +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbb)
> > +	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
> > +
> > +config RISCV_ISA_ZBB
> > +	bool "Zbb extension support for bit manipulation instructions"
> > +	depends on TOOLCHAIN_HAS_ZBB
> > +	depends on !XIP_KERNEL && MMU
> > +	select RISCV_ALTERNATIVE
> > +	default y
> > +	help
> > +	   Adds support to dynamically detect the presence of the ZBB
> > +	   extension (basic bit manipulation) and enable its usage.
> > +
> > +	   The Zbb extension provides instructions to accelerate a number
> > +	   of bit-specific operations (count bit population, sign extending,
> > +	   bitrotation, etc).
> > +
> > +	   If you don't know what to do here, say Y.
> 
> /stuff/linux/arch/riscv/lib/strncmp_zbb.S:23:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax'
> .option arch,+zbb
>         ^
> /stuff/linux/arch/riscv/lib/strncmp_zbb.S:56:2: error: instruction requires the following: 'Zbb' (Basic Bit-Manipulation) or 'Zbp' (Permutation 'Zb' Instructions)
>  orc.b t3, t0
>  ^
> /stuff/linux/arch/riscv/lib/strncmp_zbb.S:67:2: error: instruction requires the following: 'Zbb' (Basic Bit-Manipulation) or 'Zbp' (Permutation 'Zb' Instructions) or 'Zbkb' (Bitmanip instructions for Cryptography)
>  rev8 t0, t0
>  ^
> /stuff/linux/arch/riscv/lib/strncmp_zbb.S:68:2: error: instruction requires the following: 'Zbb' (Basic Bit-Manipulation) or 'Zbp' (Permutation 'Zb' Instructions) or 'Zbkb' (Bitmanip instructions for Cryptography)
>  rev8 t1, t1
>  ^
> make[4]: *** [/stuff/linux/scripts/Makefile.build:382: arch/riscv/lib/strncmp_zbb.o] Error 1
> 
> So there's something wrong in 13/13 somewhere, but the failure itself is
> a bit odd? At least, at odds with your support stuff here.


Thanks to google I now know that llvm doesn't support the arch
directive yet [0]. The rest is of course just fallout, because of the
not-enabled zbb support.

That review over there also seems to be going slowly, so I guess for
the time being I need way stricter depends, limiting this to binutils.


[0] https://reviews.llvm.org/D123515


> CONFIG_CC_VERSION_TEXT="ClangBuiltLinux clang version 15.0.4 (5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)"
> CONFIG_CC_IS_CLANG=y
> CONFIG_CLANG_VERSION=150004
> CONFIG_AS_IS_LLVM=y
> CONFIG_AS_VERSION=150004
> CONFIG_LD_IS_LLD=y
> CONFIG_LLD_VERSION=150004
> 
> Thanks,
> Conor.
> 
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
