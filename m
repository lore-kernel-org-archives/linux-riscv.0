Return-Path: <SRS0=5ZKR=FJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5442BC433FE
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Dec 2020 05:47:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0832C22D58
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Dec 2020 05:47:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0832C22D58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lSqV5pZlQ1CXtujDOzjOnUMbqXbY0f9wAFpZR+N/Mmg=; b=CpR92Pt75smNTRc08Dy1ZvRDs
	OsTJIqC0Pk2BXlLqGSwHp323JVsLyJitEwgpqtAnetyk8y5E2vkNSmAs5RenwZcSeJ8SUuX3+XBA/
	s/z0tD1bABLg3yAfNE4+ruk+UGfabJM+MLF7sfGWI9Iu18UMw1+AlTNGAicYCjQ1+Fs06XMCR8Blg
	32u93hWK/5Z6C28J1Q/FhcufQTc3HvsEkqGl/4kXtcSTQ3O33kTT/dSOnKLzpxcjBsVWz4uP4nCWG
	iZZZjBFo6/X1NnPfcPsZShTUlsUB6KNDMgj/CveD+HffnP7XMEMV4KL+Cqf8AZa0VJi+wuRAZACZE
	XJwY+Aocw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klQPF-0006Cp-1E; Sat, 05 Dec 2020 05:46:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klQPA-0006C5-VE
 for linux-riscv@lists.infradead.org; Sat, 05 Dec 2020 05:46:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607147207;
 bh=N9944AoUzOF/flZHzHrrl01FA35Tkc7qrcy9VwvBa84=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=EjQZW4pQHa+WwewOqtB4/JLvvH2kll+61Eynml0eR3moC2QcR9IgwB0ChVGSv2UZI
 cyHMcn5X8P76u87HjP+r9oMYJUTVQhcznOa6vKzqO5nJN4X9RLD2tgQmLCDe48sjeU
 0TLWt2HyBWar1nLu5yNoyjb3snc26/T3/mosIEFc7zyULFzTMu12+uXInYPNLLQho3
 cE8K5UucVEc52demwnAmZKOodffzEzajr3iLZOBYt23smAv6DY9kEtMQ6wEtRYVCDq
 xrUQtsYPpnIWBiA3NzVbt8Ins9KgT2cuSg5lgByo55h8ia8FQqKwtnBwlL+zWnw9hx
 WVL7f3SrDCodA==
MIME-Version: 1.0
In-Reply-To: <20201202032500.206346-8-damien.lemoal@wdc.com>
References: <20201202032500.206346-1-damien.lemoal@wdc.com>
 <20201202032500.206346-8-damien.lemoal@wdc.com>
Subject: Re: [PATCH v4 07/21] dt-binding: clock: Document canaan,
 k210-clk bindings
From: Stephen Boyd <sboyd@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>,
 Linus Walleij <linus.walleij@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Fri, 04 Dec 2020 21:46:46 -0800
Message-ID: <160714720649.1580929.10979600141579296560@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_004649_086291_CAF9350C 
X-CRM114-Status: UNSURE (   8.18  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Damien Le Moal (2020-12-01 19:24:46)
> diff --git a/Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml b/Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml
> new file mode 100644
> index 000000000000..3547916a2421
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/canaan,k210-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Canaan Kendryte K210 Clock Device Tree Bindings
> +
> +maintainers:
> +  - Damien Le Moal <damien.lemoal@wdc.com>
> +
> +description: |
> +  Canaan Kendryte K210 SoC clocks driver bindings. The clock
> +  controller node must be defined as a child node of the K210
> +  system controller node.
> +
> +  See also:
> +  - dt-bindings/clock/k210-clk.h
> +
> +properties:
> +  compatible:
> +    const: canaan,k210-clk
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      System fixed rate oscillator clock.

Is it optional? I suspect not and it can always be specified, so drop
maxItems.

> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - '#clock-cells'
> +  - clocks

Maybe also add clock-names as an optional property, but doesn't really
matter if there's only one clk.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
