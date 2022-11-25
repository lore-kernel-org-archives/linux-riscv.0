Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B95DC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 13:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sbFhngSm2K+Dir0sVCr0KPFmtfAa9rwbcE63aru+c40=; b=2x2+pqaO45/pcW
	L2VEmAPTb5UakwOpFE7yJbbNn1bGvb00M6ACWubHmCV1eF0k4wGdK0Ckbb6myFTy184Gn1h+56NsO
	rmzq5DbQbwfDwNSkF1BZjyQMk6NYS6EZe/jy4MDT8IstUBvZXAwlgpbIV0H3T2SBWc7b0/G/uNtlO
	dotwuTqr97R9Jeac4Pm5njF3F5+RjE5HXftbqDXeicxqS+pTv2ydVfUoJPJaJaUSZz7P7k0T2CQdm
	GlkPX5YyYSn9HbVxuFlsZG2ZrMcM7LsEKcLGEOMHjA8NJUgpkMjJ98sQBmEf3jc/EU+B4d/9ZbWPJ
	ihQDJJuFAAhn6ApjMIxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyYSz-00GbSh-RH; Fri, 25 Nov 2022 13:10:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyYSw-00GbRd-2o
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 13:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669381801; x=1700917801;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nHHNQkkTSvWPra268e5xRIEmlNkhUo8hFOPoiAYY6nA=;
  b=ik7aXBunC+sMzoxdMs776ImqUVIXHZsWb0jRl30dIsIDVNMT2cM3ZWPC
   IhqDbVH1z8tsJcjFhJi0FAjk6JWFTAL5dqzTnibBhMrteJWv7mCUQ95g+
   xEIuLddjI70dNoUzNkr/J39ceuCyQclzvFtvM93rLILynoYOXx035nVYo
   rCaGZIRgAG3Rk57jvaZiSpLGNpApyz/80E7OV8o3Uhj2A6JB2j1sL4DUw
   M3ukKnkdHqaVZiJGvBZUtvus1fr5KTv5YUTic5UrILjn6BD73PlZfRUEr
   OoIFdiBAZBhazvc2bjAMcXWRu1Om26EUAxt31vXtnbGA6mTax/Kfws5/Y
   A==;
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; 
   d="scan'208";a="190541512"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Nov 2022 06:09:59 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 25 Nov 2022 06:09:59 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 25 Nov 2022 06:09:57 -0700
Date: Fri, 25 Nov 2022 13:09:39 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Anup Patel <apatel@ventanamicro.com>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew
 Jones <ajones@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>, Samuel
 Holland <samuel@sholland.org>, Anup Patel <anup@brainfault.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: timer: Add bindings for the RISC-V
 timer device
Message-ID: <Y4C+kwLdMYkkrm/2@wendy>
References: <20221125112105.427045-1-apatel@ventanamicro.com>
 <20221125112105.427045-3-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221125112105.427045-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_051002_157251_30930494 
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

Hey Anup,

For the future, could you please CC me on all patches in a series that I
have previously reviewed?

On Fri, Nov 25, 2022 at 04:51:04PM +0530, Anup Patel wrote:
> We add DT bindings for a separate RISC-V timer DT node which can
> be used to describe implementation specific behaviour (such as
> timer interrupt not triggered during non-retentive suspend).
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../bindings/timer/riscv,timer.yaml           | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/riscv,timer.yaml
> 
> diff --git a/Documentation/devicetree/bindings/timer/riscv,timer.yaml b/Documentation/devicetree/bindings/timer/riscv,timer.yaml
> new file mode 100644
> index 000000000000..cf53dfff90bc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/riscv,timer.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/riscv,timer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V timer
> +
> +maintainers:
> +  - Anup Patel <anup@brainfault.org>
> +
> +description: |+
> +  RISC-V platforms always have a RISC-V timer device for the supervisor-mode
> +  based on the time CSR defined by the RISC-V privileged specification. The
> +  timer interrupts of this device are configured using the RISC-V SBI Time
> +  extension or the RISC-V Sstc extension.
> +
> +  The clock frequency of RISC-V timer device is specified via the
> +  "timebase-frequency" DT property of "/cpus" DT node which is described
> +  in Documentation/devicetree/bindings/riscv/cpus.yaml
> +
> +properties:
> +  compatible:
> +    enum:
> +      - riscv,timer
> +
> +  interrupts-extended:
> +    minItems: 1
> +    maxItems: 4096   # Should be enough?
> +
> +  riscv,timer-cant-wake-cpu:
> +    type: boolean
> +    description:
> +      If present, the timer interrupt can't wake up the CPU from
> +      suspend/idle state.

I'm really not sure about this... I would be inclined to think that if
someone does not specify then we should assume that they took the
scroogiest view of the spec and so do not get events during suspend.

I suppose you could then argue that their DT is wrong & it's their fault
though. Plus the existing platforms behave this way & we avoid having to
retrofit stuff here.

> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - interrupts-extended
> +
> +examples:
> +  - |
> +    timer {
> +      compatible = "riscv,timer";
> +      interrupts-extended = <&cpu1intc 5>,
> +                            <&cpu2intc 5>,
> +                            <&cpu3intc 5>,
> +                            <&cpu4intc 5>;
> +    };
> +...
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
