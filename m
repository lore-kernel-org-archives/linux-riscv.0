Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3633EB64D9
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 16:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZWj2nff0g/6FOhXxGSdYjIKokiYLd0KQfgU2u9l1IMo=; b=fYlqBLGk/QxsK5
	waE1ZE3+wL44hpksP5LfyBP0OySgP+7bclgyM9YJACq/KM9FVKLqEqD9JIYEGYD2z8rgQHMCGGWWM
	HgOs8WxFsEzWmLUUa1MQP2DVHrN4GSfj/eD75W62jAR7PkWchPGgYcUvZ8Arol4FFHq4T54GkV6wN
	kktl6U6xn8Ouwc0CjbAL/keyIPsvw2uwXG4cnsHNROTfgi/ylVJLWaj0iP0cfhqKH/V36Mv9lZGPO
	fkcxbeEw0fPVEnEu/y17sApxVCyCFLcRnQ7PlFhh/pMJCoaQtfkH5qHlIABSFdvuxlUFxPViB1/ZX
	B5dct0i7SnSjVSS7IAcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9TUh-00CE7y-1G;
	Wed, 14 Jun 2023 16:37:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9TUf-00CE75-0L
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jun 2023 16:37:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E4F0663FB4;
	Wed, 14 Jun 2023 16:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2413C433C0;
	Wed, 14 Jun 2023 16:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686760629;
	bh=Bs+EyfsO2p9fJ/uqqvy28thI6wPfslvdFWG010Lc/Ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YefGG52yVCQf3IypRiZPtyZ7PvmCO+Kdc2xodNzcw7+v5J6HaCpn0lu1wYeVgv6B+
	 mj9gLO4vnTF99DdR2O/wyhsXvhnIm5KcwCJYE7ooevgccwXczE/2FNEYu2nCX6wPFt
	 +/yrM8HKUUV2gLoLaApRLTjJF7UE54oDIVF3nJLckn8SaO8CCR2DqFIaOBlzvYOW/5
	 hZ+eteDS3bzfgf7ql3+U1DEHXs4SrIy7t53ljQcXEi3JyVXeyL12JDz4fFg3SHkfUH
	 89LHGk6N95J2D7jn1cAXKKUyBrX/z0bL1yPQdJL8Usn7k+hhhZsvRPUDRabsB6J2qh
	 cAEiWwrW7Gc0g==
Date: Thu, 15 Jun 2023 00:25:49 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v2 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
Message-ID: <ZInqDdXh6wNK3NHq@xhacker>
References: <20230523165502.2592-1-jszhang@kernel.org>
 <mhng-4483745f-f356-454c-8c2a-5f0e5b6c9739@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-4483745f-f356-454c-8c2a-5f0e5b6c9739@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_093713_234986_49EFE458 
X-CRM114-Status: GOOD (  23.12  )
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


On Wed, Jun 14, 2023 at 07:49:17AM -0700, Palmer Dabbelt wrote:
> On Tue, 23 May 2023 09:54:58 PDT (-0700), jszhang@kernel.org wrote:
> > When trying to run linux with various opensource riscv core on
> > resource limited FPGA platforms, for example, those FPGAs with less
> > than 16MB SDRAM, I want to save mem as much as possible. One of the
> > major technologies is kernel size optimizations, I found that riscv
> > does not currently support HAVE_LD_DEAD_CODE_DATA_ELIMINATION, which
> > passes -fdata-sections, -ffunction-sections to CFLAGS and passes the
> > --gc-sections flag to the linker.
> > 
> > This not only benefits my case on FPGA but also benefits defconfigs.
> > Here are some notable improvements from enabling this with defconfigs:
> > 
> > nommu_k210_defconfig:
> >    text    data     bss     dec     hex
> > 1112009  410288   59837 1582134  182436     before
> >  962838  376656   51285 1390779  1538bb     after
> > 
> > rv32_defconfig:
> >    text    data     bss     dec     hex
> > 8804455 2816544  290577 11911576 b5c198     before
> > 8692295 2779872  288977 11761144 b375f8     after
> > 
> > defconfig:
> >    text    data     bss     dec     hex
> > 9438267 3391332  485333 13314932 cb2b74     before
> > 9285914 3350052  483349 13119315 c82f53     after
> > 
> > patch1 and patch2 are clean ups.
> > patch3 fixes a typo.
> > patch4 finally enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION for riscv.
> > 
> > NOTE: Zhangjin Wu firstly sent out a patch to enable dead code
> > elimination for riscv several months ago, I didn't notice it until
> > yesterday. Although it missed some preparations and some sections's
> > keeping, he is the first person to enable this feature for riscv. To
> > ease merging, this series take his patch into my entire series and
> > makes patch4 authored by him after getting his ack to reflect
> > the above fact.
> > 
> > Since v1:
> >   - collect Reviewed-by, Tested-by tag
> >   - Make patch4 authored by Zhangjin Wu, add my co-developed-by tag
> > 
> > Jisheng Zhang (3):
> >   riscv: move options to keep entries sorted
> >   riscv: vmlinux-xip.lds.S: remove .alternative section
> >   vmlinux.lds.h: use correct .init.data.* section name
> > 
> > Zhangjin Wu (1):
> >   riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
> > 
> >  arch/riscv/Kconfig                  |  13 +-
> >  arch/riscv/kernel/vmlinux-xip.lds.S |   6 -
> >  arch/riscv/kernel/vmlinux.lds.S     |   6 +-
> >  include/asm-generic/vmlinux.lds.h   |   2 +-
> >  4 files changed, 11 insertions(+), 16 deletions(-)
> 
> Do you have a base commit for this?  It's not applying to 6.4-rc1 and the
> patchwork bot couldn't find one either.

Hi Palmer,

Commit 3b90b09af5be ("riscv: Fix orphan section warnings caused by
kernel/pi") touches vmlinux.lds.S, so to make the merge easy, this
series is based on 6.4-rc2.

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
