Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001EFC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 15:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+02MvNhB/vtTJTiU5R8LHi5WNzDCkS/WxvVXGXCDqBU=; b=uMl7BoZtPbniZf
	oe8WHfBuduTDb3zqWzjsr9IgOG8pGt22UEfr/e2PIb/bGG2rCck2ozdpBpufrYYqjkueYbpjz2/qP
	Al2YCJ8ptRRQyb0elbqo2+3oQyt30mqZ4k5ynqgTUbEclv8M0vimAt7vFLu5NsGHHT6hYswACa5FI
	FFKIdC01sOqyL3dgOoH3xMuUUUkPZ22TvihZyBMyuRAaRhJJllL0LKCi2nKTrpX0tBo/lF6gRCsMq
	HJdDg4D/2CCnREn3oLGQFd9pMGC/qKEdvStRHVy8ji+E4bJ4DGmWIcZb6RXMrtdpuZVb7lJ3zANZz
	63c2gx2YhYOmNK3CbEjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovKCi-0057Tb-3q; Wed, 16 Nov 2022 15:19:56 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovKCd-0057Hd-II
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 15:19:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D6543B81DC1;
	Wed, 16 Nov 2022 15:19:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E83D0C433C1;
	Wed, 16 Nov 2022 15:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668611988;
	bh=lqmI8EdUh2H0o0VABEygiFBMe3KsYR9v64AOL7Is7Dc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J7jIYwWIlBlxBCL6G3scI/5BVg4tzIbThr4qXSItYpTx99xvJ7x0NWi59cr3t6/81
	 7/QhBJ8SC7zhcwLB8N9Y6ag78d8DxTNTHkNL7FSXoz14JTeO9ngLvBQkVnx+JLtVQl
	 hcF/U93KSkA5Ic5pMGxNKnwnJ8ozxURCBqepygR539gFXdN81Jyf1IxGUXlXOkaruj
	 /SWLYhdRnfLM16UJYmra1IUtgVmJasbfKjemoh6C6LY1JYupH9E9z4daswz6wUp2zh
	 an8Qdujmu9x9nqjISnjLjIfyYcYdy/LnQ0NIscAdsqhGH/8WHy6v7Rj/wZZl0ueFfZ
	 bC8bs3n/hB5Kw==
Date: Wed, 16 Nov 2022 15:19:43 +0000
From: Conor Dooley <conor@kernel.org>
To: daire.mcnamara@microchip.com
Cc: conor.dooley@microchip.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, lpieralisi@kernel.org,
	kw@linux.com, bhelgaas@google.com, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v1 2/9] PCI: microchip: Correct the DED and SEC interrupt
 bit offsets
Message-ID: <Y3T/j4P6SERh5O4j@spud>
References: <20221116135504.258687-1-daire.mcnamara@microchip.com>
 <20221116135504.258687-3-daire.mcnamara@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221116135504.258687-3-daire.mcnamara@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_071951_773078_DE7B5702 
X-CRM114-Status: GOOD (  15.62  )
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
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Hey Daire,
I assume my SoB here is a hang over from me applying to our tree?
It'll need dropping for whenever you send a v2, sorry for not noticing
when you sent it to me before sending here.
Conor.

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
