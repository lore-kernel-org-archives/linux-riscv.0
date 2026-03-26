Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E03610AB822
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 20:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=acFS+mT7SKp32g6hY35XTcEhWaBJQ8Cr7uorwmKa/iw=; b=gn0vKQNwbPP0Da
	gqvmJkgNtqYd0rdS3tcUs6jdwoM56QLn0zO6UhmnYB5wALcSX+p5hvxLsU+KuyWeDLeT1NIrrwVt3
	+9+vbEjSVTC82Ch4X62RS7zQsL4A1g/UUesi0Zp597Qkq8vMqDGa2DkV7lYi7UC2Ia58dOnbmQDSJ
	673nBpkHQhwGc7bqOILk/YSNzrmDZIOpkxJ11ub5uiM0MdArk5l6TXpk8GYsu6H59Dkcf6nQqs0f2
	W6kyk45lIx//DavyFGWWQTGUQOgrKwa3pZLzLaiVQjCWNL2bqn0UFbpqmPnNhFrbhZuJoKai1ECJt
	w2itgk2MuLDW494DCgnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5rkg-00000006CO3-3i6v;
	Thu, 26 Mar 2026 20:56:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5rkd-00000006CNd-2D4M
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 20:56:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1774558583; x=1806094583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IfxOVsM11TzZ/YACGR8y36aBZMsODwPB8T/Tobcg3Ng=;
  b=XDjvKOoHNvx/kG0TNvsM5lxQ0weeSJ9Sf56FzgsYNAyjFxbmSPtkw3ED
   ii77mcTsR5jj1K8CtYP+X80eSgHAvs8dfP/PJTbcE0obLTWMOTqmpSY6b
   kplbWrfCUAtshcriGvY+bcO7e7MMsY68YfIDvD0o7DPVdSbconV+TPXSX
   wdqygKVG61wJkH7TCyu3aGaHYhAw9JYHGH3aRRPYJKzeuZwhzx14dXYK4
   JFtXHtNN4+gNHhW8dxhxI6GpmGRvV6zFJ/SWePn+pUY1Pci3eoghqdrWP
   dWjBM6cDhuZ2q7M2RzAmufD1tHUu5qqn8bmD+XVoZXRJQZidc73Ij9aj4
   g==;
X-CSE-ConnectionGUID: ryYn0vU3TMizFWwq7hZdbQ==
X-CSE-MsgGUID: XDZ+QS/ZQoGlOIovaEEMOw==
X-IronPort-AV: E=Sophos;i="6.23,142,1770620400"; 
   d="scan'208";a="55691398"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Mar 2026 13:56:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 26 Mar 2026 13:55:41 -0700
Received: from bby-cbu-swbuild03.eng.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58 via Frontend Transport; Thu, 26 Mar 2026 13:55:40 -0700
Date: Thu, 26 Mar 2026 13:55:38 -0700
From: Charles Perry <charles.perry@microchip.com>
To: Nick Hu <nick.hu@sifive.com>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
	<tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <charles.perry@microchip.com>
Subject: Re: [PATCH v3] dt-bindings: timer: Add SiFive CLINT2
Message-ID: <acWdSsAtmyTTFVHb@bby-cbu-swbuild03.eng.microchip.com>
References: <20250321083507.25298-1-nick.hu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250321083507.25298-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_135623_939798_AA13A0A5 
X-CRM114-Status: GOOD (  18.97  )
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

On Fri, Mar 21, 2025 at 04:35:06PM +0800, Nick Hu wrote:
> Add compatible string and property for the SiFive CLINT v2. The SiFive
> CLINT v2 is incompatible with the SiFive CLINT v0 due to differences
> in their control methods.

Hello Nick,

Can you help me understand what is this different control method? I've
found that both OpenSBI [1] and U-Boot [2] use the same match data in their
clint driver which would indicate that they are compatible.

Also, do you know if there's an easy way to tell if a sifive clint is a v0
or v2?

Thanks,
Charles

[1]: https://elixir.bootlin.com/opensbi/v1.8.1/source/lib/utils/timer/fdt_timer_mtimer.c#L163
[2]: https://elixir.bootlin.com/u-boot/v2026.01/source/drivers/timer/riscv_aclint_timer.c#L86

> 
> Signed-off-by: Nick Hu <nick.hu@sifive.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> - v3 changes:
>   - Add the reason for the incompatibility between sifive,clint2 and
>     sifive,clint0.
> - v2 changes:
>   - Don't allow sifive,clint2 by itself. Add '-{}' to the first entry
>   - Mark the sifive,fine-ctr-bits as the required property when
>     the compatible includes the sifive,clint2
> 
>  .../bindings/timer/sifive,clint.yaml          | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index 76d83aea4e2b..34684cda8b15 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -36,6 +36,12 @@ properties:
>                - starfive,jh7110-clint   # StarFive JH7110
>                - starfive,jh8100-clint   # StarFive JH8100
>            - const: sifive,clint0        # SiFive CLINT v0 IP block
> +      - items:
> +          - {}
> +          - const: sifive,clint2        # SiFive CLINT v2 IP block
> +        description:
> +          SiFive CLINT v2 is the HRT that supports the Zicntr. The control of sifive,clint2
> +          differs from that of sifive,clint0, making them incompatible.
>        - items:
>            - enum:
>                - allwinner,sun20i-d1-clint
> @@ -62,6 +68,22 @@ properties:
>      minItems: 1
>      maxItems: 4095
>  
> +  sifive,fine-ctr-bits:
> +    maximum: 15
> +    description: The width in bits of the fine counter.
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: sifive,clint2
> +then:
> +  required:
> +    - sifive,fine-ctr-bits
> +else:
> +  properties:
> +    sifive,fine-ctr-bits: false
> +
>  additionalProperties: false
>  
>  required:
> -- 
> 2.17.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
