Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A92ACD98C6
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 05:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=arw8969bT8R5uHUCfBp2ZemZbYp3GgwrkL19J2EY+wI=; b=Q1FBtFQmYuPM+1
	7j0pgkywCrD1PY0ryWOxh/tL2KKkHoFubL9u8nG2pQNE3Ka7CXRMFjvBUYVBLnKCToPs4XXnXuseG
	31OldBBCnMUN+0NF9rkI0Nx18zTDzAV3vYY9dUaslCnjK8XsdPJQ0DUOos+RR7tZtcRz3iZhcSqbM
	VTIIOPw2RdZALINj+eYu3zt6i7Khih/kS1p6pRtUjH2umVY5v8JReyZc6N1XxRioBw2EBdloFBz6w
	NF0AmhFgz3Hvl/3fHDnvCvTedr4GXsa7DFDEeAhannEM6kYXZUndJyOXwtRQUriorPdDWRNcX7jhL
	0EVo+Z0vKx8PuafAYPwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXYKR-00000008lSc-3pAG;
	Thu, 11 Jun 2026 05:51:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXYKR-00000008lSL-2evW
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jun 2026 05:51:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1261F41804;
	Thu, 11 Jun 2026 05:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9BAA1F00893;
	Thu, 11 Jun 2026 05:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781157106;
	bh=S23IQtI+0tBaqos80d73BR9DJks0cOyIqYTP5LT43OU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fV4a9xpbGgjpXYucAriw0MR4zES15K73fOTJ7woaPNhczfKJF2/iCCbBualBPzIaQ
	 YxJfyqhMhLqqORx5xpXnLYgvoxoAheqj3vWAGbpJsPyv5gAUzZuz3ilDRYF0UFQxg3
	 Z/ouqYRohzFJj9n6WO8Lw2HtoKYtB8pGr/Ue1v+/gBQPVZnSwQgvxbtMXoTAgLck7K
	 mfzrqsuLBzcubFYj4Pm19fbzaOcelXbiNOUXjBucRn2fD7UiehoXxfT27xFF9w/85U
	 q1SQCW29f8JR7rWfCD93jKLYrPlikTv2By/KMf8Gw3uXi5pus6iTgMhxqyqov83K56
	 /LfctOd12e2GQ==
From: Vinod Koul <vkoul@kernel.org>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
 Longbin Li <looong.bin@gmail.com>, Yixun Lan <dlan@kernel.org>, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, Yixun Lan <dlan@kernel.org>
In-Reply-To: <20260511063818.463877-1-inochiama@gmail.com>
References: <20260511063818.463877-1-inochiama@gmail.com>
Subject: Re: (subset) [PATCH v6 0/2] riscv: sophgo: allow DMA multiplexer
 set channel number for DMA controller
Message-Id: <178115710130.468137.1246445545709441202.b4-ty@kernel.org>
Date: Thu, 11 Jun 2026 11:21:41 +0530
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


On Mon, 11 May 2026 14:38:15 +0800, Inochi Amaoto wrote:
> As the DMA controller on Sophgo CV1800 series SoC only has 8 channels,
> the SoC provides a dma multiplexer to reuse the DMA channel. However,
> the dma multiplexer also controlls the DMA interrupt multiplexer, which
> means that the dma multiplexer needs to know the channel number.
> 
> Change the DMA phandle args parsing logic so it can use handshake
> number as channel number if necessary.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: dma: snps,dw-axi-dmac: Add fallback compatible for CV1800B
      commit: 7524fe142b5a772f8421aeee2132cf7e21a00103

Best regards,
-- 
~Vinod



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
