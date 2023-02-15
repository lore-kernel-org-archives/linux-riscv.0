Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0C8C636CC
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 14:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oao7MltwJcRwgNqTj2qj2bhI4nfBq0z8lmsk2J/2QuM=; b=v8wnQR+7CbRfsV
	yJtUAea0ELpF5oIHDydCsaEdM9/cJ4EwxfA6Lq0RQNXVdSsR1LkQTnkDi9A2BkbU3Fx82jW/9SUJt
	s5SW91vXk2JPTWwocKH0QNj4iFxa92Csm1Dvny9juI9Gxmt7BUckE8vy1Yqq9shIxKLMeE8A+b+Bv
	fnaRkDLNApmK8LqHDcv4rNlsqD3rGcYccUWEuNkHzo0H7B/HAcR3qIskmo0r6dx7e4cGTbDL1xsuY
	TSyK6mjQmhxb1sX9NrxuIj0aqRdZnVLEn9JR0yaKZoXgDclsr4an8JFnO7ALRQpofTngwuicSZ1Ze
	MTMBGGJAADfaybE8I0og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSJ0T-006Fck-Lm; Wed, 15 Feb 2023 14:43:37 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSJ0Q-006Fbd-CD
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 14:43:35 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pSJ03-0007XS-A4; Wed, 15 Feb 2023 15:43:11 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Guenter Roeck <linux@roeck-us.net>, Conor Dooley <conor@kernel.org>
Cc: palmer@dabbelt.com, Conor Dooley <conor.dooley@microchip.com>,
 samuel@sholland.org, linux-riscv@lists.infradead.org, ajones@ventanamicro.com
Subject: Re: [PATCH v1] RISC-V: take text_mutex during alternative patching
Date: Wed, 15 Feb 2023 15:43:10 +0100
Message-ID: <1944134.usQuhbGJ8B@diego>
In-Reply-To: <Y+q8ZnZ2A8g7BNdS@spud>
References:  <20230212194735.491785-1-conor@kernel.org>
 <4658b0b0-dfd1-b5d8-f50a-3dbd81065cf1@roeck-us.net> <Y+q8ZnZ2A8g7BNdS@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_064334_447368_CF2C9C5D 
X-CRM114-Status: GOOD (  25.06  )
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

Hi Conor,

Am Montag, 13. Februar 2023, 23:40:38 CET schrieb Conor Dooley:
> +CC Heiko
> 
> On Sun, Feb 12, 2023 at 03:08:55PM -0800, Guenter Roeck wrote:
> > On 2/12/23 11:47, Conor Dooley wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > > 
> > > Guenter reported a splat during boot, that Samuel pointed out was the
> > > lockdep assertion failing in patch_insn_write():
> > > 
> > > WARNING: CPU: 0 PID: 0 at arch/riscv/kernel/patch.c:63 patch_insn_write+0x222/0x2f6
> > > epc : patch_insn_write+0x222/0x2f6
> > >   ra : patch_insn_write+0x21e/0x2f6
> > > epc : ffffffff800068c6 ra : ffffffff800068c2 sp : ffffffff81803df0
> > >   gp : ffffffff81a1ab78 tp : ffffffff81814f80 t0 : ffffffffffffe000
> > >   t1 : 0000000000000001 t2 : 4c45203a76637369 s0 : ffffffff81803e40
> > >   s1 : 0000000000000004 a0 : 0000000000000000 a1 : ffffffffffffffff
> > >   a2 : 0000000000000004 a3 : 0000000000000000 a4 : 0000000000000001
> > >   a5 : 0000000000000000 a6 : 0000000000000000 a7 : 0000000052464e43
> > >   s2 : ffffffff80b4889c s3 : 000000000000082c s4 : ffffffff80b48828
> > >   s5 : 0000000000000828 s6 : ffffffff8131a0a0 s7 : 0000000000000fff
> > >   s8 : 0000000008000200 s9 : ffffffff8131a520 s10: 0000000000000018
> > >   s11: 000000000000000b t3 : 0000000000000001 t4 : 000000000000000d
> > >   t5 : ffffffffd8180000 t6 : ffffffff81803bc8
> > > status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
> > > [<ffffffff800068c6>] patch_insn_write+0x222/0x2f6
> > > [<ffffffff80006a36>] patch_text_nosync+0xc/0x2a
> > > [<ffffffff80003b86>] riscv_cpufeature_patch_func+0x52/0x98
> > > [<ffffffff80003348>] _apply_alternatives+0x46/0x86
> > > [<ffffffff80c02d36>] apply_boot_alternatives+0x3c/0xfa
> > > [<ffffffff80c03ad8>] setup_arch+0x584/0x5b8
> > > [<ffffffff80c0075a>] start_kernel+0xa2/0x8f8
> > > 
> > > This issue was exposed by 702e64550b12 ("riscv: fpu: switch has_fpu() to
> > > riscv_has_extension_likely()"), as it is the patching in has_fpu() that
> > > triggers the splats in Guenter's report.
> > > 
> > > Take the text_mutex before doing any code patching to satisfy lockdep.
> > > 
> > > Fixes: ff689fd21cb1 ("riscv: add RISC-V Svpbmt extension support")
> > > Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
> > > Fixes: 1a0e5dbd3723 ("riscv: sifive: Add SiFive alternative ports")
> > > Reported-by: Guenter Roeck <linux@roeck-us.net>
> > > Link: https://lore.kernel.org/all/20230212154333.GA3760469@roeck-us.net/
> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > 
> > 
> > Applying this patch together with
> > 
> > riscv: Fix early alternative patching
> > riscv: Fix Zbb alternative IDs
> > 
> > _and_ disabling CONFIG_RISCV_ISA_ZBB fixes all problems observed with
> > riscv64 for me. With that,
> > 
> > Tested-by: Guenter Roeck <linux@roeck-us.net>
> > 
> > Unfortunately I still see boot failures when trying to boot riscv32
> > images, so something is still broken. I don't know yet if that is
> > a generic problem or if it is related to a riscv patch.
> > I am still trying to track that down ...
> 
> Heiko, would you be able to look at this please?
> There's some more information in the Link: above.

just for the record, I started looking into this now.

Starting with my own code [0] on top of 6.2-rc2 I was able to verify
- qemu-riscv32 without zbb
- qemu-riscv32 with zbb
- qemu-riscv64 without zbb
- qemu-riscv64 with zbb
to work.

So next up, I'll move over to the merged for-next branch to hopefully
see what changed between the above and the for-next code.


Heiko


[0] https://github.com/mmind/linux-riscv/tree/upstream/strcmp-v5



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
