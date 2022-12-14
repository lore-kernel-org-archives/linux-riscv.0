Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C26C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Dec 2022 19:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b5/KLOwsjPfRbIKV9VjXoYrDaNMVXfQXRmAoDjqSpAE=; b=FTrGCmA2AKgstY
	e/dOcrcA/AaYZKIVkBBhFBTJPCzmCs7dW3uhTntpjUom8GdJA2IBJS/iPjmWOmjNH3wxY+rMrQgq+
	gREypT3lkxv7JTtdgmP/m7i3ft6bZhLEmkn3btgRFJIOcNq7P1+PowymHReNNGHqitPHbukFQRfkT
	nuQIJ6CNLU3py6XirsT3dqr/uHZk/wbeWcBCVZD5s4jOy9CbFCUPKXQt+d9AGTVfUfDbrp85YcHeu
	g3PbjxGUoXURGZEfbkQF/XQX4POo6XRUEua/eNrDj8Ss8G+EV97yevoPnufdlHEX2lsQS4g2p/5ZC
	ZdlSEqccML+yEM2CxFYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Xi5-002Hmx-3M; Wed, 14 Dec 2022 19:46:33 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Xi2-002Hk0-E2
	for linux-riscv@lists.infradead.org; Wed, 14 Dec 2022 19:46:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 17430B81A0A;
	Wed, 14 Dec 2022 19:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF99FC433D2;
	Wed, 14 Dec 2022 19:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671047186;
	bh=/g9jMPLRe2IrjPIOgu1rRx8LFMWlUSID9w6uDvMaQeo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=YVFG5eSNzAuZdCWJr+3U2UOKPR1wDfWO9+l121gOaqgjsv0Tl5xz8fWDKS+Hsv87p
	 wdLtRoA+nT/Ogxfcc2LI+IP0gN/40n/eWN90A7ZvhB+g3TndrA94A/1f7EVT1yUvGY
	 nG3Z5TuoI2g2JF1oVV0Qf4D1KKrwjk9cygzuw+e/hYv7tpKV6k2uWDOu6rk/AnbIce
	 bYClpcakHqyblj3QulCWIpN/87hjrhGPdfcv+ZR/YtTitDN1r3K2i1JbkbpcnLRkGK
	 qxjBHXNVvCnY1ahrV9BnvaUoguTzIsZ/TGPP7/nvCYLFmStPRYbYdT/QfBNPId9YGP
	 UTTPp/QNGGBug==
Date: Wed, 14 Dec 2022 11:46:26 -0800
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@rivosinc.com>,
 arnd@arndb.de, iommu@lists.linux.dev
CC: prabhakar.mahadev-lad.rj@bp.renesas.com
Subject: Re: [PATCH] RISC-V: Disable IPMMU_VMSA on rv32
User-Agent: K-9 Mail for Android
In-Reply-To: <20221214180409.7354-1-palmer@rivosinc.com>
References: <20221214180409.7354-1-palmer@rivosinc.com>
Message-ID: <8DACBAC8-F220-4DA7-BCC2-4E2ED9E3E03E@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_114630_663756_FB47296D 
X-CRM114-Status: GOOD (  11.28  )
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



On 14 December 2022 10:04:09 GMT-08:00, Palmer Dabbelt <palmer@rivosinc.com> wrote:
>Without this I get a Kconfig warning and then subsequent build failure
>when building allmodconfig on rv32.
>
>WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
>  Depends on [n]: IOMMU_SUPPORT [=y] && (ARM || ARM64 || COMPILE_TEST [=y] && !GENERIC_ATOMIC64 [=y])
>  Selected by [y]:
>  - IPMMU_VMSA [=y] && IOMMU_SUPPORT [=y] && (ARCH_RENESAS [=y] || COMPILE_TEST [=y]

This here is your problem afaict 
I got a report from lkp about it yesterday, "blaming" Prabhakar for it:
https://lore.kernel.org/all/202212142355.b7vf3Jh0-lkp@intel.com/

I hate selects, just ignores the dependency :(

 && !GENERIC_ATOMIC64 [=y])
>
>linux/drivers/iommu/io-pgtable-arm.c: Assembler messages:
>linux/drivers/iommu/io-pgtable-arm.c:330: Error: unrecognized opcode `lr.d s4,0(s1)'
>linux/drivers/iommu/io-pgtable-arm.c:332: Error: unrecognized opcode `sc.d.rl a5,s6,0(s1)'
>make[5]: *** [linux/scripts/Makefile.build:250: drivers/iommu/io-pgtable-arm.o] Error 1
>make[4]: *** [linux/scripts/Makefile.build:502: drivers/iommu] Error 2
>make[3]: *** [linux/scripts/Makefile.build:502: drivers] Error 2
>
>Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>
>---
>
>This one seems pretty ugly, but I like to at least have a workaround for
>the allmodconfig failures before sending up a PR.
>---
> arch/riscv/configs/32-bit.config | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/arch/riscv/configs/32-bit.config b/arch/riscv/configs/32-bit.config
>index f6af0f708df4..7a2fa9b37b1c 100644
>--- a/arch/riscv/configs/32-bit.config
>+++ b/arch/riscv/configs/32-bit.config
>@@ -2,3 +2,4 @@ CONFIG_ARCH_RV32I=y
> CONFIG_32BIT=y
> # CONFIG_PORTABLE is not set
> CONFIG_NONPORTABLE=y
>+CONFIG_IPMMU_VMSA=n

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
