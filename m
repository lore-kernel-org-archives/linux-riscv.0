Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC35F357DA
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 10:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R5KtIUK2z9b0Wwplu7HHLZlhxeCanouNildmO+aWffg=; b=Xa4m6yFX+5LVG4
	P+lD3g5+bcxK3Ta+h8DoIJOlEs5Q6aMHMd2rZIP+tQAaplCRHvLaNazq2rn9PdQp32bynagDD//cU
	rj/EVE0H/jL7vk6sVyImKRPpOsYTUMzQ10r7F1fxyZjP09ZtqOmCsOuFnG/iFj+4kVeA0g7vmfw3K
	RNlJbs0LsD0yrp2fB5b3pxG/OUSMy4lxnbZNkY+veOAB/7g8DhpOUgLFoAFfEQAwnfmbiHMDYVrtH
	qjFlgNZ+jYVdVmfqoT3Dd5vGxpa/O6ola0MkFKKKNNl91v5V9bKmp/IV2z+dDiau422CMG3W+cG9X
	1EgZqHXjWibuAV113Low==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvC9j-00000003moL-0ggk;
	Wed, 25 Feb 2026 10:30:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvC9h-00000003mno-2dCz
	for linux-riscv@lists.infradead.org;
	Wed, 25 Feb 2026 10:30:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F2E9C43FF3;
	Wed, 25 Feb 2026 10:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 203BAC116D0;
	Wed, 25 Feb 2026 10:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772015408;
	bh=yvsBqcgbBxN3PsC9TQJxXhhlhJlGMx/bZ4A6gDi5mYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MAsB6zgEa3O9fbPh7dwCcqqTclghdnqipBOuMPspWVWuoNxQDb3//fq8tRK8ArZmq
	 0CUZxHj4fr33OgI2iG3/4ZHFr+1uh2vNlhTzaHqgmWSmkTD/PT8/Wxvuz+LvVAamH0
	 xtDUT64UKE2u0xQBZdLJfyD8w8NRDotV8r9xKJYP5r78sa7UB3zDNVI2Pw1/MBOMxg
	 Pl/tV2Rx/AfRRppX5INg0Vzju3JCCAoMPeoGWCTU1jOWcFGSg+r3kZbdsQg2LULAGA
	 OlB5Bdf43aCqAOo9uix2itads2FzNKm0dCOAKaLH+wpf3BoxrUMwlZ2Ia7NaiVkhA3
	 ra/C1ac+C0j2A==
Date: Wed, 25 Feb 2026 16:00:04 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>, Ze Huang <huangze@whut.edu.cn>,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B
 compatible
Message-ID: <aZ7PLPFVnWjaBDpa@vaman>
References: <20260120013706.436742-1-inochiama@gmail.com>
 <20260120013706.436742-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260120013706.436742-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_023009_682453_0CBC8FAB 
X-CRM114-Status: GOOD (  13.13  )
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

On 20-01-26, 09:37, Inochi Amaoto wrote:
> The DMA controller on CV1800B needs to use the DMA phandle args
> as the channel number instead of hardware handshake number, so
> add a new compatible for the DMA controller on CV1800B.

Applied this manually, please check if that is okay after push

> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> index a393a33c8908..0b5c8314e25e 100644
> --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> @@ -20,6 +20,7 @@ properties:
>      enum:
>        - snps,axi-dma-1.01a
>        - intel,kmb-axi-dma
> +      - sophgo,cv1800b-axi-dma
>        - starfive,jh7110-axi-dma
>        - starfive,jh8100-axi-dma
>  
> -- 
> 2.52.0

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
