Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92061D5B854
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Dec 2025 16:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=57/dH33YgN+U+37yWLJOyuWcqeNr1NRH8A+QfSWHgts=; b=S5MkmV2P/MFTLxvTkFitzH0Uvj
	V5xpm1gs6BSe1DAr1F24v1hgvKuhbnCHTPjmUa59VDhh1ukVtYUoonuyTE18oKxJna1V6qVUKU/Nv
	a+wWJRDfyVcq7nGx8KhjVTiMvE3CJNe4vXh005mzYVs2KnCy1dqGBzRL0M6AgJAORRL4pjNCg/mBa
	7oGHUY+GC1igbsf/z0zlpRMZ6zuCvmiogCnB22epFKSvqBbWCV3rC0sXLXClMDb6+DPyM+qdxpx1L
	QpwFwQYjpPjgiZF4miUMfYeMWltV9Kt05rDqwkDo6HBjAJsjaSTv4V2GSeC6mo10rs/2RjEYIoQBD
	qXO+ktew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVBZq-000000040MC-10yU;
	Mon, 15 Dec 2025 16:37:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVBZn-000000040L6-0aM9
	for linux-riscv@lists.infradead.org;
	Mon, 15 Dec 2025 16:37:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 028BD442AF;
	Mon, 15 Dec 2025 16:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1D5C4CEF5;
	Mon, 15 Dec 2025 16:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765816653;
	bh=povrRVnkD4sb2LJU1Tc1rqf66LNEj9/0BEQW1JVluXY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=r9ROIy/BQFY1qK0HZgSL55FBi5gKYbThyKkqHb/z3PxqTcthn9rk9CiOsc03iBwjB
	 /4E8qynsP2r8iFoLXTa5uj7VZdzTzb9d65Buqv/TKrHUUr36bQd4oPlFYUt2+LmJ7N
	 8DSjl3coqXd+gEXXOGpKMDq03gwxN39Y5SZ3ZEuuKplqGmvoR7fv8uWfHt1amaj3kr
	 MurFmFhuuHXGT2x/ZEtpdH1Nnyg/NaBNqrt8i5fp66VXNOMBy0uzKtfkXfymb5Xhr9
	 3zjRKQRcXsm2fm37o1QeuAQSiS52MeRLSIlgD+Y+Qoq2TVNzSQ6cpwKNLEfhWtXZ+s
	 oRNlEe+nXAAmQ==
Date: Mon, 15 Dec 2025 10:37:32 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Haylen Chu <heylenay@4d2.org>, Inochi Amaoto <inochiama@gmail.com>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org, 
 spacemit@lists.linux.dev, devicetree@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Conor Dooley <conor+dt@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
In-Reply-To: <20251211-k3-clk-v1-1-8ee47c70c5bc@gentoo.org>
References: <20251211-k3-clk-v1-0-8ee47c70c5bc@gentoo.org>
 <20251211-k3-clk-v1-1-8ee47c70c5bc@gentoo.org>
Message-Id: <176581665051.3026304.8004386594880695878.robh@kernel.org>
Subject: Re: [PATCH RFC 1/4] dt-bindings: soc: spacemit: add k3 syscon
 compatible
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_083735_195750_029152B3 
X-CRM114-Status: GOOD (  10.06  )
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


On Thu, 11 Dec 2025 09:19:41 +0800, Yixun Lan wrote:
> The SpacemiT K3 SoC clock IP is scattered over several different blocks,
> which are APBC, APBS, APMU, DCIU, MPMU, all of them are capable of
> generating clock and reset signals. APMU and MPMU have additional Power
> Domain management functionality.
> 
> Following is a brief list that shows devices managed in each block:
> 
> APBC: UART, GPIO, PWM, SPI, TIMER, I2S, IR, DR, TSEN, IPC, CAN
> APBS: various PPL clocks control
> APMU: CCI, CPU, CSI, ISP, LCD, USB, QSPI, DMA, VPU, GPU, DSI, PCIe, EMAC..
> DCID: SRAM, DMA, TCM
> MPMU: various PLL1 derived clocks, UART, WATCHDOG, I2S
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../devicetree/bindings/clock/spacemit,k1-pll.yaml |   9 +-
>  .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |  13 +-
>  include/dt-bindings/clock/spacemit,k3-clocks.h     | 390 +++++++++++++++++++++
>  3 files changed, 407 insertions(+), 5 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml:14:7: [warning] wrong indentation: expected 4 but found 6 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251211-k3-clk-v1-1-8ee47c70c5bc@gentoo.org

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
