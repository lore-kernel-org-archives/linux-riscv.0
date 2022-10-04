Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CADFC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Oct 2022 07:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k/MV/q9Y836z10TaTwwafux0oMOQ6s0NG+jbnhE9Qz4=; b=YhgC8ALiPZKz3z
	CEOpqDRlgETA/hKLxmF4K3ntUoZKvR9LDqsWRFMXwfgEDVDJIp/pko8LeMQZqp51gEF2ZydVp9GMf
	oRgj2rfzTDAh3kvlu6TzPXVKqlXwG89F89Egt3MRqm64CDRdacc7WHBxq2gK8f5rxcr64fiN7qiJh
	4SjrWejVbaFkjlevd9LanMIDgDaHOXNwBOWw8n+mmD/TzhlXyBQL5QfgOsd8nCva6vhqlCstyrujG
	d1LWcctoGnNl7T7XuXqRCi6nSbJWwCBoPAdda9PIAflG3yPt2mUIbJGsmyj3LYtiU1CDPFHpJyEUX
	h4nVCDqZy1lhrRlWcKwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofcQz-008lXo-SI; Tue, 04 Oct 2022 07:33:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofcQw-008lWw-Ef
	for linux-riscv@lists.infradead.org; Tue, 04 Oct 2022 07:33:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664868822; x=1696404822;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G5KIpEIDhqaUWyMXWoDFVdVD5/ppaS/z+I6O/1nD/cE=;
  b=eUf/w4HILBxAsknaeuHx2o1x2hJ6IdN4NbHCWx865HKnBZoSyd2dHoTb
   kLawZsEf8mkCfyZZCUlmEJgwCpOsXPxuOg/bmeBMGHKDiYrP1p5Qn2rRO
   YMarEi3f2R37UBdDBTp40QEdjn6GRuywm7D7L+SkeGO7z8jzZHq+QQ3CQ
   BYgDqnlNGrYR0/Sa04vMoebBDyjUKF++rMlkd456R3mKf0CvvhF6Vq0jl
   41S3w03D1zwOiyQfo4m35Xc59xPGOSpdBqT6BNbzFruBoo9x8Lcf7kDmF
   2Q5lzmobamxsdvW1VsyR3wuimMYfDp9brhXMxKWWkF5B/82xCK4DodErH
   w==;
X-IronPort-AV: E=Sophos;i="5.93,367,1654585200"; 
   d="scan'208";a="193695323"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Oct 2022 00:33:41 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 4 Oct 2022 00:33:41 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 4 Oct 2022 00:33:38 -0700
Date: Tue, 4 Oct 2022 08:33:16 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Magnus Damm
	<magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Guo Ren
	<guoren@kernel.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>, Nathan
 Chancellor <nathan@kernel.org>, Atish Patra <atishp@rivosinc.com>, Anup Patel
	<apatel@ventanamicro.com>, <linux-renesas-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>, Lad
 Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [RFC PATCH v2 1/2] dt-bindings: soc: renesas:
 r9a07g043f-l2-cache: Add DT binding documentation for L2 cache controller
Message-ID: <YzvhvFeUVLm3DnYb@wendy>
References: <20221003223222.448551-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221003223222.448551-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221003223222.448551-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_003342_576106_13A6E751 
X-CRM114-Status: GOOD (  20.12  )
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

On Mon, Oct 03, 2022 at 11:32:21PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add DT binding documentation for L2 cache controller found on RZ/Five SoC.
> 
> The Renesas RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP
> Single) from Andes. The AX45MP core has an L2 cache controller, this patch
> describes the L2 cache block.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../soc/renesas/r9a07g043f-l2-cache.yaml      | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml b/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
> new file mode 100644
> index 000000000000..f96eeffa58ce
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (C) 2022 Renesas Electronics Corp.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/renesas/r9a07g043f-l2-cache.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiFive L2 Cache Controller
> +
> +maintainers:
> +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> +
> +description:
> +  A level-2 cache (L2C) is used to improve the system performance by providing
> +  a larger amount of cache line entries and reasonable access delays. The L2C
> +  is shared between cores, and a non-inclusive non-exclusive policy is used.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: andestech,ax45mp-cache
> +      - const: cache

I think preemptively adding a "renesas,r9a07g043f-l2-cache" here is a
good idea, just in case something crops up down the line.

Thanks,
Conor.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  cache-line-size:
> +    const: 64
> +
> +  cache-level:
> +    const: 2
> +
> +  cache-sets:
> +    const: 1024
> +
> +  cache-size:
> +    enum: [131072, 262144, 524288, 1048576, 2097152]
> +
> +  cache-unified: true
> +
> +  next-level-cache: true
> +
> +  pma-regions:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    minItems: 1
> +    maxItems: 16
> +    description: Optional array of memory regions to be set as non-cacheable
> +                 bufferable regions which will be setup in the PMA.
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - cache-line-size
> +  - cache-level
> +  - cache-sets
> +  - cache-size
> +  - cache-unified
> +  - interrupts
> +  - reg
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    cache-controller@2010000 {
> +        reg = <0x13400000 0x100000>;
> +        compatible = "andestech,ax45mp-cache", "cache";
> +        interrupts = <508 IRQ_TYPE_LEVEL_HIGH>;
> +        cache-line-size = <64>;
> +        cache-level = <2>;
> +        cache-sets = <1024>;
> +        cache-size = <262144>;
> +        cache-unified;
> +        pma-regions = <0x00000000 0x10000000>,
> +                      <0x10000000 0x04000000>,
> +                      <0x20000000 0x10000000>,
> +                      <0x58000000 0x08000000>;
> +    };
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
