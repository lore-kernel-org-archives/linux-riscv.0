Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26033C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 21:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UCEUJ08FHh0sFYiY/e/f3YB5Svaq43raUSKC0jz0rVI=; b=4q2drvZ2jz0WOD
	+ugo95DFICePj3AGhwXOb9aRT2XIyp1t3ty3zJ901gG/oAD4sVtjd2U43e+OyAcWimh5w/EliPHQ6
	WcGvE4NUrE2cuURSJQBrcp7Xxo1WQ7JKrvhMCz1Uh5f/f/GUifxjRapBSA9jAPtkjROb0RHBMeKQW
	50DPF0gtCtxbdYTYoqG/xdTelhqfUi3JNgboBdq8UgWiYBRDOPtRs/0ATCkxj/1+b6+BXLBA35VQY
	B/AI6UyrzC/s96T3s2PpUtYq4OGUpTGWvW4GL0gtau1ZVaLaJVzCMLp7dNUg86yK2GLxARzoaOa6T
	01SfAIn9NW0J/6q/nhrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxxI0-002VzP-0f; Wed, 23 Nov 2022 21:28:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxxHw-002Vxp-Cu
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 21:28:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A9B4A61F31;
	Wed, 23 Nov 2022 21:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B049C433D6;
	Wed, 23 Nov 2022 21:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669238891;
	bh=aXYuVL56OUqCkmkuBtTiGlD0vJDEW1H10E3zF/4GBnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eW3PAD8vvRz1vpgKL+baw0/U0ISwR6jtuzN+bRUUr9GPUE1B0IWowOl8cxG7mepPB
	 08vsCMWuB8+O8SZ7V0zIen0I33ZSENkSPUVTcCFzq+3wrF5lw7QdSqGzBuT6WsL/Y4
	 5hNlXuj2d16Tf8qofl8IiKG/2pUCLKof4ysE843L+L8rQDrrOApsR97vgow+BQGdZV
	 G/ooHLf7diRnXDH0HpBelkbXWRqAY/+1x1oeAXStfh7eUYubBwtspSd/LE1iLf4Ndj
	 CFW9Z2S/WLvA+klxhEESdD4TzRSKx2bMMI8LlWsj7RB9U5emK2968/fIJXSlD4mIfD
	 fZV1oN0wRC7IQ==
Date: Wed, 23 Nov 2022 21:28:06 +0000
From: Conor Dooley <conor@kernel.org>
To: daire.mcnamara@microchip.com
Cc: conor.dooley@microchip.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, lpieralisi@kernel.org,
	kw@linux.com, bhelgaas@google.com, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v1 2/9] PCI: microchip: Correct the DED and SEC interrupt
 bit offsets
Message-ID: <Y36QZt1bsfsroIjM@spud>
References: <20221116135504.258687-1-daire.mcnamara@microchip.com>
 <20221116135504.258687-3-daire.mcnamara@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221116135504.258687-3-daire.mcnamara@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_132812_494894_AC871EBD 
X-CRM114-Status: GOOD (  17.26  )
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

On Wed, Nov 16, 2022 at 01:54:57PM +0000, daire.mcnamara@microchip.com wrote:
> From: Daire McNamara <daire.mcnamara@microchip.com>
> 
> The SEC and DED interrupt bits were the wrong way round so the SEC
> interrupt handler attempted to mask, unmask, and clear the DED interrupt
> and vice versa. Correct the bit offsets so each interrupt handler
> operates properly.

Firstly, does this need a fixes tag for backporting?
If it does, then you should probably put this as patch #1 in the series.


> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/pci/controller/pcie-microchip-host.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/controller/pcie-microchip-host.c
> index 80e7554722ca..30153fd1a2b3 100644
> --- a/drivers/pci/controller/pcie-microchip-host.c
> +++ b/drivers/pci/controller/pcie-microchip-host.c
> @@ -165,12 +165,12 @@
>  #define EVENT_PCIE_DLUP_EXIT			2
>  #define EVENT_SEC_TX_RAM_SEC_ERR		3
>  #define EVENT_SEC_RX_RAM_SEC_ERR		4
> -#define EVENT_SEC_AXI2PCIE_RAM_SEC_ERR		5
> -#define EVENT_SEC_PCIE2AXI_RAM_SEC_ERR		6
> +#define EVENT_SEC_PCIE2AXI_RAM_SEC_ERR		5
> +#define EVENT_SEC_AXI2PCIE_RAM_SEC_ERR		6

The order in the registers is:
TX_RAM, RX_RAM, PCIE2AXI_RAM, AXI2PCIE_RAM
Fix looks correct to me on that basis:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

>  #define EVENT_DED_TX_RAM_DED_ERR		7
>  #define EVENT_DED_RX_RAM_DED_ERR		8
> -#define EVENT_DED_AXI2PCIE_RAM_DED_ERR		9
> -#define EVENT_DED_PCIE2AXI_RAM_DED_ERR		10
> +#define EVENT_DED_PCIE2AXI_RAM_DED_ERR		9
> +#define EVENT_DED_AXI2PCIE_RAM_DED_ERR		10
>  #define EVENT_LOCAL_DMA_END_ENGINE_0		11
>  #define EVENT_LOCAL_DMA_END_ENGINE_1		12
>  #define EVENT_LOCAL_DMA_ERROR_ENGINE_0		13
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
