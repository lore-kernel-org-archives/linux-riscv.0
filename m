Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA15C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 19:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2dPZu/LprRFjno0v6i89Ym01xxeN4CSXI8HoVUbT9kE=; b=F8l7N7Hy/VIu2Y
	wCLDYiKadof1yfmT+MesPyczF/9ZFOL9OT6aJfTxhyWVvUSvs2ur65X4iysCn+DAvG4mdG3uSao6m
	nJlrqZVAE7BqmuQdDcb0LtZc2OVqOiULtxTLfF6z2yoyvgdu5aVquJCX88ZteP9hBrdi5b1svG6iD
	CKagvc8wt95IWg9nx9tMN19RU91FgEodnS6UdpWMrrQaii3tOSwAWldMsq3/AQNFBMGBngZz1iDEs
	23qCjWMb/kmRio5dG7MvizxkOGAiwkmERADScOSlzbHViP8t/z7dSkj98yKt3HuB1oHLMvifkwMP5
	Z38phwAEBjSj26OMZFYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLpWq-00000000SHx-2pIh;
	Mon, 24 Jun 2024 19:39:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLpWn-00000000SHM-3kXf
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 19:39:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4775D6108E;
	Mon, 24 Jun 2024 19:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A47B1C2BBFC;
	Mon, 24 Jun 2024 19:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719257940;
	bh=fIpxGxErBMjwvYV2I4WkYrRQiLydJH1phwFbI+ji4G0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wa7gIXEAi/WfFBiYP6sYL4YJ9C7vmuVsgWLzu3PkrQLSdAg91ODgzJzQMxrcw5HYk
	 JzSDEo+2Bv0UqHHrHBWtWyeGe2qfcFTwc2LUxCF6EF1OH7UwmSvzQicSZAPTscPNUc
	 FPkItYLIyozBc78h0aBRh0MgGCOCw/N3Wtz5LvqUYdTD/5bC/Ioy/Pw/K3Mn9bsiH6
	 GWKYv8reakThPKtlxjrYLodKDrID5eBSkxKIfeZmKHyWmIzFS8t4KTc5wLoe5qlLD0
	 3ViKxv2KAKpH9PUBInb2mHCcWdOkuv84/vTJiiAPFG8vaky6wzYII/JKg/k6n79nRz
	 lU7w1NIFA8KXg==
Date: Mon, 24 Jun 2024 13:38:58 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: daire.mcnamara@microchip.com
Cc: linux-kernel@vger.kernel.org, conor.dooley@microchip.com, kw@linux.com,
	krzk+dt@kernel.org, devicetree@vger.kernel.org,
	lpieralisi@kernel.org, bhelgaas@google.com,
	linux-pci@vger.kernel.org, conor+dt@kernel.org,
	linux-riscv@lists.infradead.org, ilpo.jarvinen@linux.intel.com
Subject: Re: [PATCH v4 3/3] dt-bindings: PCI: microchip,pcie-host: allow
 dma-noncoherent
Message-ID: <171925793172.267714.8378615377109046130.robh@kernel.org>
References: <20240621112915.3434402-1-daire.mcnamara@microchip.com>
 <20240621112915.3434402-4-daire.mcnamara@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240621112915.3434402-4-daire.mcnamara@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_123902_020655_9CCDB521 
X-CRM114-Status: UNSURE (   8.06  )
X-CRM114-Notice: Please train this message.
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


On Fri, 21 Jun 2024 12:29:15 +0100, daire.mcnamara@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> PolarFire SoC may be configured in a way that requires non-coherent DMA
> handling. On RISC-V, buses are coherent by default & the dma-noncoherent
> property is required to denote buses or devices that are non-coherent.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> ---
>  Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
