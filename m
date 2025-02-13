Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3625DC021A0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 10:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JkJ8vpie9l4kUEEW/5A1tQNBo4zEQ3m2Vb33i3P3v+Q=; b=YBQkwxUGTkUxwo
	qZuyotq8KlepHD2q6tOa6Su3Kn1Zf0+UT+xM+Qb+g8JsVCYtHW9DR4ab04JdFWXZtid7dlT+XBJoc
	DIB4DFWTdY7ERXfwPCe/pBYjtRuQvzhfNjq3g9WUHIlBDvPlMLq5rATbYHoi0yjVuVZD94CZVngWC
	OoJAwlfQtlLlAEhDX8FpnJ6kAuD/ZFfEDV6JW7N1ZLqmNDns9knP3GBRZg8eGYQoCaduYuuAbKgW4
	iEcIqxtOKBjVNpN8wwPDhIlwc33jwzifmIFs1utbPDKmee86kcGtwAwtDshuX7/sEzj4rH1bbEqlj
	s/jOFIwzjf3IV3wpXkdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiW9n-0000000Ab7N-132t;
	Thu, 13 Feb 2025 10:09:19 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiW9k-0000000Ab2d-1Stk
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 10:09:17 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tiW9T-00079j-E1; Thu, 13 Feb 2025 11:08:59 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tiW9T-000jXg-0a;
	Thu, 13 Feb 2025 11:08:59 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tiW9T-0002x5-0P;
	Thu, 13 Feb 2025 11:08:59 +0100
Message-ID: <de7dedf98e2085c895a93ba56c4e5fa50e298d05.camel@pengutronix.de>
Subject: Re: [PATCH 1/4] dt-bindings: reset: add generic bit reset controller
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,  Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, Yixun Lan
	 <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Date: Thu, 13 Feb 2025 11:08:59 +0100
In-Reply-To: <20250213020900.745551-2-inochiama@gmail.com>
References: <20250213020900.745551-1-inochiama@gmail.com>
	 <20250213020900.745551-2-inochiama@gmail.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_020916_388603_49A6C837 
X-CRM114-Status: GOOD (  21.06  )
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

On Do, 2025-02-13 at 10:08 +0800, Inochi Amaoto wrote:
> Some SoCs from Aspeed, Allwinner, Sophgo and Synopsys have
> a simple reset controller by toggling bit. It is a hard time
> for each device to add its own compatible to the driver.
> Since this device share a common design, it is possible to
> add a common device to reduce these unnecessary change.
> 
> Add common binding for these kind generic reset controller.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../bindings/reset/reset-simple.yaml          | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/reset-simple.yaml
> 
> diff --git a/Documentation/devicetree/bindings/reset/reset-simple.yaml b/Documentation/devicetree/bindings/reset/reset-simple.yaml
> new file mode 100644
> index 000000000000..77584e23e8e8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/reset-simple.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/reset-simple.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic BIT Reset Controller
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@gmail.com>
> +
> +description:
> +  Some reset controller devices uses a simple method to perform
> +  assert/deassert by toggling bit. Some SoCs from Aspeed, Allwinner,
> +  Sophgo and Synopsys have this kind of reset controller instances.

I think some properties should be documented that make reset
controllers "simple" according to this binding.

For example, right now, the reset-simple driver assumes the following:

  - There is a single, contiguous range of 32-bit registers.
  - All bits in each register directly control a reset line.
     - There are no self-deasserting resets.
     - There are no timing requirements.
     - The bits are exclusively resets, nothing else.
  - All bits behave the same, so all reset bits are either
    active-high or all are active-low.
  - The bits can be read back, but the read status may
    be active-low independently from the writes.

> +properties:
> +  compatible:
> +    enum:
> +      - reset-simple-high
> +      - reset-simple-low

I wonder if it would be better to have a single

  compatible:
    const: reset-simple

and a boolean property, e.g.

  active-low:
    type: boolean

like in leds/common.yaml. Also it should be documented clearly what
this means for reads and writes.

> +  reg:
> +    maxItems: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#reset-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    reset-controller@1000000 {
> +        compatible = "reset-simple-high";

The example should probably include a SoC specific compatible?

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
