Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE724103E171
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 12:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N3fFokGylSqaP1SqL79p7yQZgiD25sW/hlrSkjJuP+E=; b=gzZlxjWYmXUt+P
	sG23ywup+DQZrvTjMaakt++swfor8G0Mt7q2o9GxzPd8I0Kr5AtVml8/7uen3rhlqx+mioejZJr78
	YQAO9KA4YkKF033Jbu3jmhp+x0y4R/yMOWC3ybS4DmevMgSQiK2XW9F88ptkUjXzAIBAjU+BsjJyI
	Mw+dKac0PGO23cGkTg84XTLthd2hwBt8idoo3RXZ+Pwmbtw3qLTCkzb3pvZSLT7AvCXbIdU5tXueh
	1KYMu5j3AJsf43xZOkcsmd+G0CcPdsTAkA27hNrfQCbLsbWq9rbCs2KzepBxr3vmq54b3sd6kNJOv
	vqbcHqrcHSELT80lcohg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qBv-00000008Pgh-0E9B;
	Wed, 18 Mar 2026 12:40:03 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qBs-00000008Pcw-0APz
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 12:40:01 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w2qBf-0001Qv-Cj; Wed, 18 Mar 2026 13:39:47 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w2qBe-000uRl-2b;
	Wed, 18 Mar 2026 13:39:46 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w2qBe-000000009ES-30Jx;
	Wed, 18 Mar 2026 13:39:46 +0100
Message-ID: <3e9022faae3dc6f5066a1e7cc3752a0193a55bc9.camel@pengutronix.de>
Subject: Re: [PATCH v3] reset: spacemit: k3: Decouple composite reset lines
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Junzhong Pan <junzhong.pan@spacemit.com>, Guodong Xu
 <guodong@riscstar.com>, 	devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, 	spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, Inochi Amaoto	 <inochiama@gmail.com>
Date: Wed, 18 Mar 2026 13:39:46 +0100
In-Reply-To: <20260317-01-k3-reset-usb-pci-v3-1-e4b9a43c7d45@kernel.org>
References: <20260317-01-k3-reset-usb-pci-v3-1-e4b9a43c7d45@kernel.org>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_054000_079559_26360976 
X-CRM114-Status: GOOD (  13.47  )
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

On Di, 2026-03-17 at 02:36 +0000, Yixun Lan wrote:
> Instead of grouping several different reset lines into one composite
> reset, decouple them to individual ones which make it more aligned
> with underlying hardware. And for DWC USB driver, it will match well
> with the number of the reset property in the DT bindings.
> 
> The DWC3 USB host controller in K3 SoC has three reset lines - AHB, VCC,
> PHY. The PCIe controller also has three reset lines - DBI, Slave, Master.
> Also three reset lines each for UCIE and RCPU block.
> 
> As an agreement with maintainer, the reset IDs has been rearranged as
> contiguous number and pushed as a fix for the driver, and reason is that
> there isn't any consumer of reset driver so far,

Unfortunately that does not seem to be the case for all APMU resets.
A lore query for all changed IDs [1] yields a patch that adds ethernet
device nodes using RESET_APMU_EMAC[012] [2].

[1] https://lore.kernel.org/all/?q=dfb%3ARESET_APMU_USB2+OR+dfb%3ARESET_APMU_USB3_PORTA+OR+dfb%3ARESET_APMU_USB3_PORTB+OR+dfb%3ARESET_APMU_USB3_PORTC+OR+dfb%3ARESET_APMU_USB3_PORTD+OR+dfb%3ARESET_APMU_QSPI+OR+dfb%3ARESET_APMU_QSPI_BUS+OR+dfb%3ARESET_APMU_DMA+OR+dfb%3ARESET_APMU_AES_WTM+OR+dfb%3ARESET_APMU_MCB_DCLK+OR+dfb%3ARESET_APMU_MCB_ACLK+OR+dfb%3ARESET_APMU_VPU+OR+dfb%3ARESET_APMU_DTC+OR+dfb%3ARESET_APMU_GPU+OR+dfb%3ARESET_APMU_ALZO+OR+dfb%3ARESET_APMU_MC+OR+dfb%3ARESET_APMU_CPU0_POP+OR+dfb%3ARESET_APMU_CPU0_SW+OR+dfb%3ARESET_APMU_CPU1_POP+OR+dfb%3ARESET_APMU_CPU1_SW+OR+dfb%3ARESET_APMU_CPU2_POP+OR+dfb%3ARESET_APMU_CPU2_SW+OR+dfb%3ARESET_APMU_CPU3_POP+OR+dfb%3ARESET_APMU_CPU3_SW+OR+dfb%3ARESET_APMU_C0_MPSUB_SW+OR+dfb%3ARESET_APMU_CPU4_POP+OR+dfb%3ARESET_APMU_CPU4_SW+OR+dfb%3ARESET_APMU_CPU5_POP+OR+dfb%3ARESET_APMU_CPU5_SW+OR+dfb%3ARESET_APMU_CPU6_POP+OR+dfb%3ARESET_APMU_CPU6_SW+OR+dfb%3ARESET_APMU_CPU7_POP+OR+dfb%3ARESET_APMU_CPU7_SW+OR+dfb%3ARESET_APMU_C1_MPSUB_SW+OR+dfb%3ARESET_APMU_MPSUB_DBG+OR+dfb%3ARESET_APMU_UCIE+OR+dfb%3ARESET_APMU_RCPU+OR+dfb%3ARESET_APMU_DSI4LN2_ESCCLK+OR+dfb%3ARESET_APMU_DSI4LN2_LCD_SW+OR+dfb%3ARESET_APMU_DSI4LN2_LCD_MCLK+OR+dfb%3ARESET_APMU_DSI4LN2_LCD_DSCCLK+OR+dfb%3ARESET_APMU_DSI4LN2_DPU_ACLK+OR+dfb%3ARESET_APMU_DPU_ACLK+OR+dfb%3ARESET_APMU_UFS_ACLK+OR+dfb%3ARESET_APMU_EDP0+OR+dfb%3ARESET_APMU_EDP1+OR+dfb%3ARESET_APMU_PCIE_PORTA+OR+dfb%3ARESET_APMU_PCIE_PORTB+OR+dfb%3ARESET_APMU_PCIE_PORTC+OR+dfb%3ARESET_APMU_PCIE_PORTD+OR+dfb%3ARESET_APMU_PCIE_PORTE+OR+dfb%3ARESET_APMU_EMAC0+OR+dfb%3ARESET_APMU_EMAC1+OR+dfb%3ARESET_APMU_EMAC2+OR+dfb%3ARESET_APMU_ESPI_MCLK+OR+dfb%3ARESET_APMU_ESPI_SCLK
[2] https://lore.kernel.org/all/20260318035542.517554-1-inochiama@gmail.com/

Please reorder the resets such that only the decoupled lines get new
numbers. Especially EMAC resets should keep the same value.

> so should not cause any ABI breakage.
>
> Also, the changes of DT binding header file and reset
> driver are merged together as one single commit to avoid git-bisect
> breakage.

This addresses the only remaining checkpatch-warning:

  WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst

which is ignored on purpose to avoid a bisection hazard.

> Fixes: 938ce3b16582 ("reset: spacemit: Add SpacemiT K3 reset driver")
> Fixes: 216e0a5e98e5 ("dt-bindings: soc: spacemit: Add K3 reset support and IDs")
> Signed-off-by: Yixun Lan <dlan@kernel.org>

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
