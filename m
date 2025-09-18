Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559F9CA1013
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 19:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XIzh7+GHo+JApYXbs6zO180KsZyvoVuoxsmvM/xJejs=; b=beJMjP/zpqSAd9
	7vxuPZFhWjrJa19mY2Qo5Ipp7YBEkj2XBo2ISzUUktxG0pya3RP1i4eDdpUZN6+f0nnjzN0vFzc4v
	+iThylDEyanbNmD+IGfixoiZn0pMJIi319LpD+G5R4kNQjtXgzUwJm9PNsKQAuyjd9QG3zzVvmxrZ
	wbL78ejKtHELaZvd3k5nzwxfDsKUilCGE81ATuD2soDcz6ogvx+mzmKy47xY0eDt532tzhxXEcSrQ
	Ij6Id2n3LvoAzc57Tot3epcYKsrzbzwj0UATAfFdob78XR3wQzSZbi+V9ztgZAHuEAPqRQe2i0T6+
	EQwyThwu79eybYUT6Vtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKky-000000012pw-3ayT;
	Thu, 18 Sep 2025 19:57:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKkw-000000012pB-0o8G
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 19:57:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A273D417FA;
	Thu, 18 Sep 2025 19:57:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9913C4CEF0;
	Thu, 18 Sep 2025 19:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758225445;
	bh=mm1gEryd3OdYL9qRPSiR7N0OmJPd7syrgp/Mbp7JgJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qYazTVQ3FHABUPeeroHTguX3M7ItH4BTfzvcRwMIzdCwakVrYVsST1FB+zOvVi0jl
	 Pmhr5hOOY6kyhTxgnao8676c7MQU9HHhb2TgotogsyOD1AtwP7M+oX1whUQCr21sY+
	 5OfPF3wFGLze//KJ6QxcmURMKKF823gqP08Ox3adQIDDBHxijNE6GmiEcLe/FGZfdE
	 Rq+/1yzWgZTjHFciFmgb7RyP+AsV6pBV1p2PwwDXd2rHCYSF1z8UaW/PkIML4uJDc3
	 YPWRmzP9wTKB3gR3R/lNGt5oKE/+Y393DFnU2Y/WXJ71IdZ42DfTyBOQ/GyOuaRjDI
	 6jERCg0fTXHCA==
Date: Thu, 18 Sep 2025 14:57:16 -0500
From: Rob Herring <robh@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: Yixun Lan <dlan@gentoo.org>, broonie@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
Message-ID: <20250918195716.GA2521514-robh@kernel.org>
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-2-elder@riscstar.com>
 <20250917231520-GYA1269891@gentoo.org>
 <3b815302-21f2-4ee2-bf83-c1dba77ce3d1@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3b815302-21f2-4ee2-bf83-c1dba77ce3d1@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_125726_273017_05780BFD 
X-CRM114-Status: GOOD (  28.35  )
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

On Wed, Sep 17, 2025 at 06:40:31PM -0500, Alex Elder wrote:
> On 9/17/25 6:15 PM, Yixun Lan wrote:
> > Hi Alex,
> > 
> > On 17:07 Wed 17 Sep     , Alex Elder wrote:
> > > Add support for the SPI controller implemented by the SpacemiT K1 SoC.
> > > 
> > > Signed-off-by: Alex Elder <elder@riscstar.com>
> > > ---
> > >   .../bindings/spi/spacemit,k1-spi.yaml         | 94 +++++++++++++++++++
> > >   1 file changed, 94 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
> > > new file mode 100644
> > > index 0000000000000..5abd4fe268da9
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
> > > @@ -0,0 +1,94 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/spi/spacemit,k1-spi.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: SpacemiT K1 SoC Serial Peripheral Interface (SPI)
> > > +
> > > +maintainers:
> > > +  - Alex Elder <elder@kernel.org>
> > > +
> > > +description:
> > > +  The SpacemiT K1 SoC implements a SPI controller that has two 32-entry
> > > +  FIFOs, for transmit and receive.  Details are currently available in
> > > +  section 18.2.1 of the K1 User Manual, found in the SpacemiT Keystone
> > > +  K1 Documentation[1].  The controller transfers words using PIO.  DMA
> > > +  transfers are supported as well, if both TX and RX DMA channels are
> > > +  specified,
> > > +
> > > +  [1] https://developer.spacemit.com/documentation
> > > +
> > > +allOf:
> > > +  - $ref: /schemas/spi/spi-controller.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - spacemit,k1-spi
> > one enum is effectively equal to const..
> 
> OK.  That's an easy fix.
> 
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: Core clock
> > > +      - description: Bus clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: core
> > > +      - const: bus
> > > +
> > > +  resets:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  dmas:
> > > +    items:
> > > +      - description: RX DMA channel
> > > +      - description: TX DMA channel
> > > +
> > > +  dma-names:
> > > +    items:
> > > +      - const: rx
> > > +      - const: tx
> > > +
> > > +  spacemit,k1-ssp-id:
> > > +    description: SPI controller number
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > could you explain a little bit why this vendor specific property should
> > be introduced? I took a look at the code, and didn't get the reason
> > behind.. or what's the problem of simply using "pdev->id"?
> 
> This property was carried over from the vendor code.  It is
> optional, and if it isn't specified, the platform device ID (-1)
> will be used.  It's just intended to provide a well-defined ID
> for a particular SPI controller.
> 
> > we should really be careful to introduce vendor specific property..
> 
> If there were a standard way of doing this I'd love to use it.

The standard way is we don't define made up device indices in DT. Well, 
except /aliases allows you to do that.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
