Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70B0C43334
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 12:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GUWzt3PHozX4ZcGMIjtEey7JkRXsql4hCDaiAbtc1pI=; b=PmvrNFdBpMMyba
	JX/kqo96OLGEmR14AssJq+7bKtrhfLewo01H35S24hv/ldUpq1LanK+ux6LME5pdNh6ijiEmnPNAp
	slDAvoDFezHOQcaFAALZKJP4IkUWAQ/Ien8zMk6HryWo+mMHjl+rizaupI6jmg89zQ1Tdgoz518V3
	lIFv2a31TtE2GCv/5FEPXFwEY6bBFPr0yvXKRO3XEXx9LTzqno3bFBLaWXHcpXTQpBqb2ocBXDHBz
	E66haBjXaiZOC/tIAoCyT5NukMNdLoQ6EY25S17V0A2M59gXUOLzwyxPxhQCFd6l9FTiyzCzpg/bo
	EjneDby9EOUbeUEvzR3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8hwU-000GNH-5u; Tue, 05 Jul 2022 12:46:14 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8hwQ-000GLk-FW
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 12:46:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CB1F0B817D3;
	Tue,  5 Jul 2022 12:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9A7BC341CB;
	Tue,  5 Jul 2022 12:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657025167;
	bh=wAEDIpJKEpqow07OA5pbiA0C6VtRvMKO1qtrFbDdCFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F1zWy3llLirCMHGf9oUncrDC/YFjZyTLRq8g3aGTJpZatIfnJET0NC0gnzAOEdr2n
	 LBKUBdh5gaukjcT6H01UyFyR1g3lElraTjEWOXwlu3L+XH1FqHxwkoz84MEHbDLZZS
	 eZ7WTHq7q/c3I0uPyb7wS7aieCwKK84nmRl7LaVwFRCiR7/fpeSy+ezZvVLR5oazeo
	 +8rDVpEmi2KIs/N5QTg7RoE7sDKNODVpStI+T1WWd9jlCgJ2LwPqsLi629VFCOdZNa
	 34Q7G2rXUbrzbjGnEGGG6k9533cawbC447VyAxsPMu9Lq8RQf5jfsUjcD80ZuDWNNB
	 mQCzFe7dd4CQQ==
Date: Tue, 5 Jul 2022 18:16:03 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Dillon Min <dillon.minfei@gmail.com>,
	Jose Abreu <joabreu@synopsys.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 04/14] dt-bindings: dma: dw-axi-dmac: extend the
 number of interrupts
Message-ID: <YsQyi3Mx99m8fnGu@matsya>
References: <20220701192300.2293643-1-conor@kernel.org>
 <20220701192300.2293643-5-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220701192300.2293643-5-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_054610_846069_FF7F773B 
X-CRM114-Status: GOOD (  21.99  )
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

On 01-07-22, 20:22, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The Canaan k210 apparently has a Sysnopsys Designware AXI DMA
> controller, but according to the documentation & devicetree it has 6
> interrupts rather than the standard one. Support the 6 interrupt
> configuration by unconditionally extending the binding to a maximum of
> 8 per-channel interrupts thereby matching the number of possible
> channels.
> 
> Link: https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf #Page 51
> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/dma/snps,dw-axi-dmac.yaml          | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> index 4324a94b26b2..98c2ab18d04f 100644
> --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> @@ -34,7 +34,12 @@ properties:
>        - const: axidma_apb_regs
>  
>    interrupts:
> -    maxItems: 1
> +    description: |

rob asked you to drop this in last patch, pls fix that and send with his
ack

> +      If the IP-core synthesis parameter DMAX_INTR_IO_TYPE is set to 1, this
> +      will be per-channel interrupts. Otherwise, this is a single combined IRQ
> +      for all channels.
> +    minItems: 1
> +    maxItems: 8
>  
>    clocks:
>      items:
> -- 
> 2.37.0

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
