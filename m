Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92956C77B73
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 13:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gb6zW7SRtLEy+Oj1f1ggKZ7Bn/F1pkTkIfs+fS5qMaY=; b=YeJLIn6AszFWpR
	UcZZfp0D6J/vm3hJnw8oL6XcabnraIcRGnVk4ZCPF9FczUA3I58Y3T22Tzj0ULwKjpXhEuR2/66nd
	9SHvDWcezVuyUJSSbr0GqGmXN5DxRCYaUmDedd0S27ssdB+00TXhFN/UkTRgjUd+WwHITaSVEVVla
	SU2JAEju7HZA2Pp8bPPeFUtEqYnz8xIZe8MvS06GhbCQwfQRS3d1MKRXcCd08TtkMq47oNtRcCL55
	QKWQWK/hEPiuJytPofSteGJ1N/64q23yQIa55UPf6YPkCeAlZQrHEA+1haHxL8jX3tXcEdgFPW8Ra
	jnFGBEaNo3KuU5gzmeTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3z5I-00DzXz-1d;
	Tue, 30 May 2023 13:08:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3z5D-00DzWH-28
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 13:08:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 440F562691;
	Tue, 30 May 2023 13:08:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F3E7C433D2;
	Tue, 30 May 2023 13:08:13 +0000 (UTC)
Date: Tue, 30 May 2023 14:08:10 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] riscv: allow kmalloc() caches aligned to the
 smallest value
Message-ID: <ZHX1OqjQQRheIvv+@arm.com>
References: <20230526165958.908-1-jszhang@kernel.org>
 <20230526165958.908-6-jszhang@kernel.org>
 <20230529-fidelity-booted-0d4055d1f559@wendy>
 <ZHXJDevEVwUEoOq4@arm.com>
 <20230530-gyration-handheld-ef4e44e89d61@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230530-gyration-handheld-ef4e44e89d61@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_060815_735914_42B1F128 
X-CRM114-Status: GOOD (  26.34  )
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

On Tue, May 30, 2023 at 11:34:06AM +0100, Conor Dooley wrote:
> On Tue, May 30, 2023 at 10:59:41AM +0100, Catalin Marinas wrote:
> > On Mon, May 29, 2023 at 12:17:46PM +0100, Conor Dooley wrote:
> > > On Sat, May 27, 2023 at 12:59:57AM +0800, Jisheng Zhang wrote:
> > > > After this patch, a simple test of booting to a small buildroot rootfs
> > > > on qemu shows:
> > > > 
> > > > kmalloc-96           5041    5041     96  ...
> > > > kmalloc-64           9606    9606     64  ...
> > > > kmalloc-32           5128    5128     32  ...
> > > > kmalloc-16           7682    7682     16  ...
> > > > kmalloc-8           10246   10246      8  ...
> > > > 
> > > > So we save about 1268KB memory. The saving will be much larger in normal
> > > > OS env on real HW platforms.
> > > > 
> > > > [1] Link: https://lore.kernel.org/linux-arm-kernel/20230524171904.3967031-1-catalin.marinas@arm.com/
> 
> While I think of it, Link: goes at the start of the line, the [1] should
> go at the end (although I don't think you actually reference the link
> anywhere in the text & it'll probably not be particularly relevant if a
> subsequent revision of that patchset is applied.

I plan to post at least one more. I'd suggest the risc-v patchset to
only go in once my series landed.

> > > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > 
> > > Fails to build chief, with loads of:
> > > linux/dma-mapping.h:546:19: error: redefinition of 'dma_get_cache_alignment'
> > > 
> > > And for 32-bit there's also a rake of:
> > > include/linux/slab.h:239:9: warning: 'ARCH_KMALLOC_MINALIGN' macro redefined [-Wmacro-redefined]
> > > 
> > > At the very least, reproducable with rv32_defconfig.
> > 
> > Have you this it on top of the KMALLOC_MINALIGN preparation series?
> > 
> > https://lore.kernel.org/r/20230524171904.3967031-1-catalin.marinas@arm.com/
> 
> Oh, no. Thanks for pointing that out.
> Our automation stuff only uses what is in riscv/{for-next,master,fixes}.
> Unless my reading comprehension is particularly bad of late it was
> non-obvious that this depended on something that had not yet been
> applied - it sounded like your series had already been merged last year.

Yeah, it was only obvious to me since it was my series ;).

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
