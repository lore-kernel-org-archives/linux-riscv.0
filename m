Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF1FCCD194
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 12:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GZusDQxaUW778/feBi7NC/GXRHCANnyZZfnqLCc3qU8=; b=LhejcaeRSWUfTM
	hamqjSGe++hEsjC6SiQJFXKlffXtrgoa5TKY1Efx4unkxZ5gHLBq/bWj0+piGshTqBsjBUN7mhnWH
	jLrcbrHyraeK/6X3rxiXxjPEQkb4tg4JLHca1tcqtpsIqO2ghqJXc0zRaLM/L15FM8dKiDbPQI9tz
	4AES3Nwrc80Jj6nh0ITUtLVYdHxMlBxSkEdRitjyUMzPJCClxu6gNCcdpZrHNkJxhf2IlNzzgkqCE
	Glp8egWW3oatKEgmeoLGeopVrCX22HD0Y6LDy23GV1G5zgoIpVxTMKIewJaQCaHKJ1U91EpdwQGDE
	Be0sriSdyri9NBCG2d2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9NWS-00000004nau-3VUY;
	Thu, 16 Oct 2025 12:56:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9NWR-00000004naV-0hTL
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 12:55:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8307963F46;
	Thu, 16 Oct 2025 12:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97EA3C4CEF1;
	Thu, 16 Oct 2025 12:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760619358;
	bh=7Dmfv3gTVej609EwgF8zmpF2F/JwFF1MDizpIwAwxW8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Wm5DNpWKiyXCmb8pBnZf09ttGff7hmyRFqlylVnDywj8b2nARKejbvCd5ylHUsxKR
	 nAvMhrBFytg9mTttj0x7whpEupq1fonhaorr5bhTHdN7EQIWfcRmTQoAa2cMKXxZSd
	 i+X2iKjm+KOXSQUZONEepsMxwfHn6xJpAVd9nxc80LgMHX3r3GUfkL2vR7sDvvmUIS
	 xHuUxDyAOYsSj8Rf2i5+qEsBf/+Z7w79wzZGPE9DZQNee9lZyk3A1riGVms95OCExN
	 r9AKyHaBctfEulf1Fn4XQnWvZ8qQ7E5n8tHeDSe3BfujNn5Dx+PqQhnhk1haZkEDHd
	 y4mTn+p4ybWqw==
From: Vinod Koul <vkoul@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Yixun Lan <dlan@gentoo.org>, Guodong Xu <guodong@riscstar.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, elder@riscstar.com, 
 Naresh Kamboju <naresh.kamboju@linaro.org>, Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <20250918-mmp-pdma-simplify-dma-addressing-v1-1-5c2be2b85696@riscstar.com>
References: <20250918-mmp-pdma-simplify-dma-addressing-v1-1-5c2be2b85696@riscstar.com>
Subject: Re: [PATCH] dmaengine: mmp_pdma: fix DMA mask handling
Message-Id: <176061935426.510550.684278188506408313.b4-ty@kernel.org>
Date: Thu, 16 Oct 2025 18:25:54 +0530
MIME-Version: 1.0
X-Mailer: b4 0.13.0
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


On Thu, 18 Sep 2025 22:27:27 +0800, Guodong Xu wrote:
> The driver's existing logic for setting the DMA mask for "marvell,pdma-1.0"
> was flawed. It incorrectly relied on pdev->dev->coherent_dma_mask instead
> of declaring the hardware's fixed addressing capability. A cleaner and
> more correct approach is to define the mask directly based on the hardware
> limitations.
> 
> The MMP/PXA PDMA controller is a 32-bit DMA engine. This is supported by
> datasheets and various dtsi files for PXA25x, PXA27x, PXA3xx, and MMP2,
> all of which are 32-bit systems.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: mmp_pdma: fix DMA mask handling
      commit: 88ebb29d3244e515a92c2331434bb73fef7efdc6

Best regards,
-- 
~Vinod



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
