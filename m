Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46638E7B611
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 13:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jrB/q7sLK0ZRVDpGU09JRqnY97ZQLJJ+to5+bjY2JW0=; b=wlcxLfiV//PNsM
	iIpTQyedglLzx52wIpeVbxed+ExU5rE6kDJULh9sThIcY33Uq0L0hrj6stduTt/sp+OtszdE77TC5
	yYKa+RVLFpAGDc0X9Ds75aCkJiK6I1DrwhE6uVMDd5FPZIIiGnkiyNMy4FPQ2t40ZLQhvvjfPGX/n
	/y73215ZMcB/tFoFPBGtskM67e3hfaYjccD7s+BvCK8iNbAE5baoGYwU7CsfWn+il04e4vvxR3vWu
	hWgbgmSBpL9cThrzDKTS6qSZPpawkAEOourcZNchAf+s5mjrd3v9eCDjnA7O/Bt1/jy0ezewMubkH
	0dOVHKsDveX7LtaEqWGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo1xN-0007xM-0O;
	Wed, 04 Oct 2023 13:30:29 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo1xK-0007w8-0L
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 13:30:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 9B5E3B81D11;
	Wed,  4 Oct 2023 13:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA32BC433C8;
	Wed,  4 Oct 2023 13:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696426224;
	bh=aJVniq+g35ZseQJZAGkIBzb7ufaQ4aP0ZCjtBHrm/hE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JHyi7tX99vVdzsJMQXpWs9xJM8JqAe8UVCFgCr1+jn8VyY9G7ZUiy2OMV99FyYbI/
	 9D/91JmtqIi3B5u2Bgfl++OVCgNrrB1kL1PCnn0xfEQg3Iw9Ycy+B8XQrfPhDPsval
	 fWbtbwurTKuZLbkDHw5iCoy1DfuhBafozyS8z9IYqIOG5J/jAJFo+PbtcnN/whIVjP
	 hQb/YK/DAOI1qHF7czLo+bo5IedvtDwQXidg4sMhVQx/R/XTUCcw6I0B9dZvTyPDSc
	 kNiDk/2ZGTHfCupwaaKbZ0KouUMZuGwGksHBjpByPDO9f0392I495pyCfgqJtxuq/r
	 jGLtT3L8mNT9w==
Received: (nullmailer pid 2755166 invoked by uid 1000);
	Wed, 04 Oct 2023 13:30:21 -0000
Date: Wed, 4 Oct 2023 08:30:21 -0500
From: Rob Herring <robh@kernel.org>
To: shravan chippa <shravan.chippa@microchip.com>
Cc: green.wan@sifive.com, vkoul@kernel.org, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, paul.walmsley@sifive.com, conor+dt@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, nagasuresh.relli@microchip.com, praveen.kumar@microchip.com, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: dma: sf-pdma: add new compatible name
Message-ID: <20231004133021.GB2743005-robh@kernel.org>
References: <20231003042215.142678-1-shravan.chippa@microchip.com>
 <20231003042215.142678-3-shravan.chippa@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231003042215.142678-3-shravan.chippa@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_063026_282258_6C1E2D25 
X-CRM114-Status: GOOD (  12.86  )
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

On Tue, Oct 03, 2023 at 09:52:13AM +0530, shravan chippa wrote:
> From: Shravan Chippa <shravan.chippa@microchip.com>
> 
> Add new compatible name microchip,mpfs-pdma to support
> out of order dma transfers
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> ---
>  .../bindings/dma/sifive,fu540-c000-pdma.yaml         | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> index a1af0b906365..974467c4bacb 100644
> --- a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> +++ b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> @@ -27,10 +27,14 @@ allOf:
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - sifive,fu540-c000-pdma
> -      - const: sifive,pdma0
> +    oneOf:
> +      - items:
> +          - const: microchip,mpfs-pdma # Microchip out of order DMA transfer
> +          - const: sifive,fu540-c000-pdma # Sifive in-order DMA transfer

This doesn't really make sense. microchip,mpfs-pdma is compatible with 
sifive,fu540-c000-pdma and sifive,fu540-c000-pdma is compatible with 
sifive,pdma0, but microchip,mpfs-pdma is not compatible with 
sifive,pdma0? (Or replace "compatible with" with "a superset of")

Any fallback is only useful if an OS only understanding the fallback 
will work with the h/w. Does this h/w work without the driver changes?

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
