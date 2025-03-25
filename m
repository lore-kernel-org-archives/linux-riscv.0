Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA81DC36008
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 08:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+UAxt+mrv3EDoFJth0FdslGEDvyL9aSmmbTTlwXpPMU=; b=sJi8zuQGI9MBQW
	0nQO/CxT5T6GVgU2zPKJHkpEQzIaeVGQJIELG6UlZyez5I7ICXKn1Fe3TBPgGMrBW2jYO+WByZP5O
	+zdciH4lFKOQGZ3G30J3HjZUBToUjDTqAqwvIJT5nDYElvzW/GHBIui82AdVq7D8qIrMaZqD2O0nw
	X8pF7ieTP7f1lDlQorzPHx5QaD/CAYL+STR5+GOlf9UQuCIAtrJfyCJ0pKMCm8kq+VVGbOw1ArJGG
	oA8ufkkcGCtbm1D7Je0PeENo86AXtMUf+tSWd9jUwTopXbUL4XWAs33fQHtklnwBvObubrrqMm/zf
	u+4Bzlezhtw50rDH1otg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twzPd-00000005Aqt-3J6S;
	Tue, 25 Mar 2025 08:13:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twzPa-00000005AqY-3TDz
	for linux-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 08:13:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1B3CCA4A5EE;
	Tue, 25 Mar 2025 08:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB913C4CEE4;
	Tue, 25 Mar 2025 08:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742890405;
	bh=f6XJAegToS0M5tfF5z+5zMcVYoym5F06kRgni6qPdOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=baEVxmc3M4Wz1Zex6nUZ6qxP+swaMOjHIO3FB4/csR5/EO+pEs+wJiHME3ZnE1fSa
	 D7wpUsUNVxOFeyCtB0DT4hcxGOHEF4tHVYaCVN9fIq3bmd6FUPMXcbY7u7gZw5xEd4
	 QMd/uIbZSH4vmVvEj7vq9wu77t/i7XUBAJsMxIOofygKG9Q1Klsi8zveL878QqYVK0
	 l++w4HGhe8xpU2Sl65wzo/lBvI9pkiFXERmljUUq6vecU+hn3XmFbdkhYfGzMdDmVc
	 uWBe7eNddDEEDIJurJvEIQ5yFRquLENP+JbXs35afdO6OAJzQAoCCwGNwnSqcbN58w
	 jve2gNPx5FYag==
Date: Tue, 25 Mar 2025 09:13:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	pierre-henry.moussay@microchip.com, valentina.fernandezalanis@microchip.com, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Lee Jones <lee@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 2/9] dt-bindings: soc: microchip: document the
 simple-mfd syscon on PolarFire SoC
Message-ID: <20250325-quiet-waxbill-of-realization-675469@krzk-bin>
References: <20250321-cuddly-hazily-d0ab1e1747b5@spud>
 <20250321-ramrod-scabby-a1869f9979b6@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250321-ramrod-scabby-a1869f9979b6@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_011326_926599_B64A7FBA 
X-CRM114-Status: GOOD (  11.13  )
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

On Fri, Mar 21, 2025 at 05:22:35PM +0000, Conor Dooley wrote:
> +title: Microchip PolarFire SoC Microprocessor Subsystem (MSS) sysreg register region
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>
> +
> +description:
> +  An wide assortment of registers that control elements of the MSS on PolarFire
> +  SoC, including pinmuxing, resets and clocks among others.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: microchip,mpfs-mss-top-sysreg
> +      - const: syscon
> +      - const: simple-mfd

You need to list the children if you use simple-mfd. Commit msg
mentioned clock controller, so where is it?


> +
> +  reg:
> +    maxItems: 1
> +
> +  '#reset-cells':
> +    description:
> +      The AHB/AXI peripherals on the PolarFire SoC have reset support, so
> +      from CLK_ENVM to CLK_CFM. The reset consumer should specify the
> +      desired peripheral via the clock ID in its "resets" phandle cell.
> +      See include/dt-bindings/clock/microchip,mpfs-clock.h for the full list
> +      of PolarFire clock/reset IDs.
> +    const: 1

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
