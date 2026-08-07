Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCC5C2A09B
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 13:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=42L55JSwTy4+o/RfaarQAViP0nv2i74y4QxeC0eULPU=; b=Ao0dCjakbldaYjitmwMCjxjbsU
	Td+KPEDxtha8uj0frTCRVYTn02NNZ4k2gzlXrV37eLiljqYnga5e3qZq3iJiPyL4Eja0GbhhBE7ta
	Fc/mvxLCc0TlwEMQ7dVcV2h0tCNi2WG7k7EF4AQSFV8bUU2xPg+Kp1GTevlPIbA1yWSAAFPC/o7EP
	OIrWdH/cpj9CJ48D+cLNbVeI6l50wY2+98yZ4RdK6DYVoLcA2G33R081G9isBbg+13tdOxJ37FEGw
	gvJAEhNYwV5fEQs8nBV+uCrnwX6hcaqkctDr2TLwHSjO+Gmlv5J7GxhIq0ef8VPQa6fOjCPrmOUCP
	07yZ3nlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKDa-000000083eX-0hOz;
	Fri, 07 Aug 2026 13:02:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKDZ-000000083eP-0xPq
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 13:02:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CBEA5419C6;
	Fri,  7 Aug 2026 13:02:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 864B01F000E9;
	Fri,  7 Aug 2026 13:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786107752;
	bh=1ojP9lXDTsgxo+kBprRZYnvCdgavnn52UswOqgtr3nc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=OecVw22taBzl2gw5knEc7KAsRSOu+xy7WrSl5VJa24e6O4sz1Y6duJxpWBx4xAj00
	 SxwiVPTLg9TcQZjSpGqD7plpJalJalll0HQP8DDfJWoEbueZPFIiPg4ulIVvdPBonw
	 K1X8wRNrppJpXuxm0HfMG+kJevTJtd/JyRuwnp5mxcbvJgg93Nuadmj++VtZ+0AbFd
	 jmRTVO3RY2Se7UzN4HgipbbPMpcjR4guz+7xvEZF6yXh45P7R89orLAyBaV2ATDDij
	 QVFc4Hma0dAnVVIb//MUH7uVMc8W7eEeLmrohv/eczvy/UyaQI/lMoQYDnxe5b/yuL
	 2puGqJ6IXaEjw==
Date: Fri, 07 Aug 2026 08:02:31 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Hal Feng <hal.feng@starfivetech.com>, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>, 
 linux-hardening@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, 
 linux-clk@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Kees Cook <kees@kernel.org>, 
 Albert Ou <aou@eecs.berkeley.edu>, 
 "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org
To: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260807112923.191627-16-changhuang.liang@starfivetech.com>
References: <20260807112923.191627-1-changhuang.liang@starfivetech.com>
 <20260807112923.191627-16-changhuang.liang@starfivetech.com>
Message-Id: <178610775180.4069377.7068076405963189133.robh@kernel.org>
Subject: Re: [PATCH v3 15/22] dt-bindings: clock: Add StarFive JHB100
 Peripheral-1 clock and reset generator
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


On Fri, 07 Aug 2026 04:29:16 -0700, Changhuang Liang wrote:
> Add bindings for the Peripheral-1 clock and reset generator (PER1CRG)
> on the JHB100 RISC-V SoC by StarFive Ltd.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../clock/starfive,jhb100-per1crg.yaml        | 70 +++++++++++++++++++
>  .../dt-bindings/clock/starfive,jhb100-crg.h   | 60 ++++++++++++++++
>  .../dt-bindings/reset/starfive,jhb100-crg.h   | 19 +++++
>  3 files changed, 149 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100-per1crg.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-tdshp.example.dtb: tdshp@321e0000 (mediatek,mt8196-disp-tdshp): 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8196-tdshp.yaml
Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.example.dtb: display0: fsl,pcr: b'\xf0\xc8\x80\x80' is not of type 'object', 'integer', 'array', 'boolean', 'null'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260807112923.191627-16-changhuang.liang@starfivetech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
