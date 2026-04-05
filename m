Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5F7E64002
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Apr 2026 07:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N6wt4vVzYC0GdyGEt1jeKJ6Z5zdBc8uH66Duf+UuhFg=; b=DbmAbedl3f2S4B
	Pzrqn4QAHmLMXu1G8wLbobb4x5KUqpESZVTS4197z0NxZ+4+BwFey7MpEpD6tmfSQ002+YO8glVlS
	1FeDfLauvvumZudVTzKzyGYzzTVUn0uANiDn+P/omzO/y2thSZln5LrbRAQrgrk0X7A2oJhzAJ7ol
	W5lmvRNULadxjUYsocPKwPBWMerplrMupOfD9WByNRuF6CHC39SffkNE7x83bn9hP5hiA3ZQNtjUD
	4j5XMCi4Yj6kx4/GYyiRyq+ncRxyfzJZTAXncbQK5BR6SFr+wgL7cO28OMWYt02KItJtMZexFKDjA
	XGj5Va5i30quhhJ6QkqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9Hlq-000000041oq-3iqu;
	Sun, 05 Apr 2026 07:19:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9Hlp-000000041ob-1uoW
	for linux-riscv@lists.infradead.org;
	Sun, 05 Apr 2026 07:19:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E0D3C60018;
	Sun,  5 Apr 2026 07:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 170F0C116C6;
	Sun,  5 Apr 2026 07:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775373584;
	bh=ckiG+3OZzq8XEXstz3w9cYTewnPogJTO5MvDE7rmOMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JI0Ur9O7x0p/j1X/zg1bGzYItenxXwTAhhhRe6KJ4gvOpsUe4cizD6ZTdkbnBgrFZ
	 X9MXBgbnaFyyV/GdX9d52DKhdej4JgSHNfoaARyQkZn/gt6hBC3ouHfK5YZL2QpQdY
	 id2oNhGFlq6m4G+x8/fRG6tHWHrqNJ5zpcjGtgu6JBJ7YCyCzK7nf9G2j8dMpWwK8l
	 93AahzdrsuFy/5oTcJkPWxaW2zbsaTU+yf341l5wLD4KFJ9w/aDpn4hANP27G+11cX
	 KKNowE1AaCOw/3U/BXNI9KBcbhahzB9p8oVS0UcaJo/cQ7SRHvTwni0nJAjjiW38uE
	 3FqAHBBOPnqGw==
Date: Sun, 5 Apr 2026 09:19:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Emil Renner Berthing <kernel@esmil.dk>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Alexey Charkov <alchark@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Keguang Zhang <keguang.zhang@gmail.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Ley Foon Tan <leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH v1 11/13] dt-bindings: hwinfo: Add starfive,jhb100-socinfo
Message-ID: <20260405-strong-watchful-marmot-fdfad6@quoll>
References: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
 <20260403054945.467700-12-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260403054945.467700-12-changhuang.liang@starfivetech.com>
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

On Thu, Apr 02, 2026 at 10:49:43PM -0700, Changhuang Liang wrote:
> Add starfive,jhb100-socinfo for StarFive JHB100 SoC.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../hwinfo/starfive,jhb100-socinfo.yaml       | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwinfo/starfive,jhb100-socinfo.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwinfo/starfive,jhb100-socinfo.yaml b/Documentation/devicetree/bindings/hwinfo/starfive,jhb100-socinfo.yaml
> new file mode 100644
> index 000000000000..cc6b7d5a4c91
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwinfo/starfive,jhb100-socinfo.yaml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwinfo/starfive,jhb100-socinfo.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JHB100 SoC platform chipid module
> +
> +maintainers:
> +  - Changhuang Liang <changhuang.liang@starfivetech.com>
> +
> +description:
> +  StarFive JHB100 SoC platform chipid module is represented by JHB100_PRODUCT_ID
> +  register which contains information about revision. This register is located
> +  under the syscon.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: starfive,jhb100-socinfo

No, not a separate device.

> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    chipid@38 {
> +        compatible = "starfive,jhb100-socinfo";
> +        reg = <0x38 0x4>;

One register is not a device. NAK.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
