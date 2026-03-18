Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281F7103E176
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 13:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h8QIc34RTJhZaKZGavMR6HT2zknQj2S4KLMj94yBtwQ=; b=wCb1yGPnPs/vYU
	nhOxuDg+CYzowdi9U7jyghF44L7XhcZiqHpjx78VMCd81aGFPTm0I1NbuoY9J9p6+nsvf4daRcsTT
	ivK1vTPfFZ5uDl8siHKH8kUbU1WmxgXb4237CcLWtj428wEoZjbqhjEjGgjEla07kIus5C2PiJBD5
	icSrXatqf8yYJYN2vBWDEeuRjxHTrLQyvGiIWvGkFJHnazWMhlquJmuhGMNaExZAb5jzmN++fHFOa
	Loa8+5SICssLPBSmW49NOjvQ4w7O5cBdX67Ix6auRxMeTnmKr8iEIOsL56yMTct3VP+dKlbGl9nnt
	3bZvpyhEq2CQ7mBnTbVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qfi-00000008S7K-04sk;
	Wed, 18 Mar 2026 13:10:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qff-00000008S6q-0eZw
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 13:10:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AF9E4441BC;
	Wed, 18 Mar 2026 13:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CC7AC2BCAF;
	Wed, 18 Mar 2026 13:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773839445;
	bh=gPU1ClQ6+Ep52PUchjVnFrsFHmBmnXK3sRcxeJG3IDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KmSr1DaXiYWC5S/3tZLCUuKwaDRgXiBt1JieiZDmmWkS11a/UWK4V3w5wWWl649AL
	 DZz9sTq1DKuyqntEdeUBoUsfL2/2QI3VmHvHR7Dnqi+0ZS7MXksktFqdq9P134BcXg
	 UaYRoNLlpL2Ll+CX0IVWPfJMo5SpaIbMNFHTZoM2HCqLUeQ23pfHtZugDgIyGL2Ev7
	 0z/80suLcti3bxCgdS/kI2oqm3+mHCHyfdrby7jkdCDS4J0a8x/rDgotoaiqBxsWOA
	 laUOaiZTJdXfaVn0bEsWkjAH9m+i6BhDBCpNTz/g4jvUpfXQHn95klDLbEauzdGMn5
	 5t/GPal069AaA==
Date: Wed, 18 Mar 2026 21:10:43 +0800
From: Yixun Lan <dlan@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Junzhong Pan <junzhong.pan@spacemit.com>,
	Guodong Xu <guodong@riscstar.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH v3] reset: spacemit: k3: Decouple composite reset lines
Message-ID: <20260318131043-GKA488271@kernel.org>
References: <20260317-01-k3-reset-usb-pci-v3-1-e4b9a43c7d45@kernel.org>
 <3e9022faae3dc6f5066a1e7cc3752a0193a55bc9.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3e9022faae3dc6f5066a1e7cc3752a0193a55bc9.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_061047_258536_B8898AC7 
X-CRM114-Status: GOOD (  22.21  )
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

Hi Philipp,

On 13:39 Wed 18 Mar     , Philipp Zabel wrote:
> On Di, 2026-03-17 at 02:36 +0000, Yixun Lan wrote:
> > Instead of grouping several different reset lines into one composite
> > reset, decouple them to individual ones which make it more aligned
> > with underlying hardware. And for DWC USB driver, it will match well
> > with the number of the reset property in the DT bindings.
> > 
> > The DWC3 USB host controller in K3 SoC has three reset lines - AHB, VCC,
> > PHY. The PCIe controller also has three reset lines - DBI, Slave, Master.
> > Also three reset lines each for UCIE and RCPU block.
> > 
> > As an agreement with maintainer, the reset IDs has been rearranged as
> > contiguous number and pushed as a fix for the driver, and reason is that
> > there isn't any consumer of reset driver so far,
> 
> Unfortunately that does not seem to be the case for all APMU resets.
> A lore query for all changed IDs [1] yields a patch that adds ethernet
> device nodes using RESET_APMU_EMAC[012] [2].
> 
Yes, although the ethernet use this ID, but I don't think we should worry
about that, since the ethernet patch is still under review, and ideally it
will be merged after this reordering patch, unless you disagree? and insist
the RESET_APMU_EMAC should not be changed?


> [1] https://lore.kernel.org/all/?q=dfb%3ARESET_APMU_USB2+OR+dfb%3ARESET_APMU_USB3_PORTA+OR+dfb%3ARESET_APMU_USB3_PORTB+OR+dfb%3ARESET_APMU_USB3_PORTC+OR+dfb%3ARESET_APMU_USB3_PORTD+OR+dfb%3ARESET_APMU_QSPI+OR+dfb%3ARESET_APMU_QSPI_BUS+OR+dfb%3ARESET_APMU_DMA+OR+dfb%3ARESET_APMU_AES_WTM+OR+dfb%3ARESET_APMU_MCB_DCLK+OR+dfb%3ARESET_APMU_MCB_ACLK+OR+dfb%3ARESET_APMU_VPU+OR+dfb%3ARESET_APMU_DTC+OR+dfb%3ARESET_APMU_GPU+OR+dfb%3ARESET_APMU_ALZO+OR+dfb%3ARESET_APMU_MC+OR+dfb%3ARESET_APMU_CPU0_POP+OR+dfb%3ARESET_APMU_CPU0_SW+OR+dfb%3ARESET_APMU_CPU1_POP+OR+dfb%3ARESET_APMU_CPU1_SW+OR+dfb%3ARESET_APMU_CPU2_POP+OR+dfb%3ARESET_APMU_CPU2_SW+OR+dfb%3ARESET_APMU_CPU3_POP+OR+dfb%3ARESET_APMU_CPU3_SW+OR+dfb%3ARESET_APMU_C0_MPSUB_SW+OR+dfb%3ARESET_APMU_CPU4_POP+OR+dfb%3ARESET_APMU_CPU4_SW+OR+dfb%3ARESET_APMU_CPU5_POP+OR+dfb%3ARESET_APMU_CPU5_SW+OR+dfb%3ARESET_APMU_CPU6_POP+OR+dfb%3ARESET_APMU_CPU6_SW+OR+dfb%3ARESET_APMU_CPU7_POP+OR+dfb%3ARESET_APMU_CPU7_SW+OR+dfb%3ARESET_APMU_C1_MPSUB_SW+OR+dfb%3ARESET_APMU_MPSUB_DBG+OR+dfb%3ARESET_APMU_UCIE+OR+dfb%3ARESET_APMU_RCPU+OR+dfb%3ARESET_APMU_DSI4LN2_ESCCLK+OR+dfb%3ARESET_APMU_DSI4LN2_LCD_SW+OR+dfb%3ARESET_APMU_DSI4LN2_LCD_MCLK+OR+dfb%3ARESET_APMU_DSI4LN2_LCD_DSCCLK+OR+dfb%3ARESET_APMU_DSI4LN2_DPU_ACLK+OR+dfb%3ARESET_APMU_DPU_ACLK+OR+dfb%3ARESET_APMU_UFS_ACLK+OR+dfb%3ARESET_APMU_EDP0+OR+dfb%3ARESET_APMU_EDP1+OR+dfb%3ARESET_APMU_PCIE_PORTA+OR+dfb%3ARESET_APMU_PCIE_PORTB+OR+dfb%3ARESET_APMU_PCIE_PORTC+OR+dfb%3ARESET_APMU_PCIE_PORTD+OR+dfb%3ARESET_APMU_PCIE_PORTE+OR+dfb%3ARESET_APMU_EMAC0+OR+dfb%3ARESET_APMU_EMAC1+OR+dfb%3ARESET_APMU_EMAC2+OR+dfb%3ARESET_APMU_ESPI_MCLK+OR+dfb%3ARESET_APMU_ESPI_SCLK
> [2] https://lore.kernel.org/all/20260318035542.517554-1-inochiama@gmail.com/
> 
> Please reorder the resets such that only the decoupled lines get new
> numbers. Especially EMAC resets should keep the same value.
> 
> > so should not cause any ABI breakage.
> >
> > Also, the changes of DT binding header file and reset
> > driver are merged together as one single commit to avoid git-bisect
> > breakage.
> 
> This addresses the only remaining checkpatch-warning:
> 
>   WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
> 
> which is ignored on purpose to avoid a bisection hazard.
> 
> > Fixes: 938ce3b16582 ("reset: spacemit: Add SpacemiT K3 reset driver")
> > Fixes: 216e0a5e98e5 ("dt-bindings: soc: spacemit: Add K3 reset support and IDs")
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> 
> regards
> Philipp

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
