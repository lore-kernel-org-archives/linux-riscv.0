Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58576E8FDD9
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Dec 2025 11:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TYIlwo89o8EH1kHsumhv9NYbWRB+VeutRRffkOFUB6c=; b=c3kgN4In1dF+xd
	LRaPhq+SVHi3wSEQmT1/FODLbtgHEP19L9/1PpK3LDx0HN9Hh3uI+8ipujJptSXN08mMUzVnJduKP
	61BPOjAM597HCF0Ztw80DvkTHF+dEZebr+eCqP+lB1gKK+EB2g/jptoM++gUz2eGlPUaDSdKyjnbJ
	R3lxriU+emET/+yCRTzB3BD1QSE++OB5T28fwVxzVp1gYAe1RqSCRYLcGoIoWh4qsue+sBj/17ppJ
	hkROPJc25Q79hZGj6L81i0sGPkDMJ/lovBgc3islaQhQuo8xztdVFOIxQpfx3GYtE1yWzGbHcc0Fm
	zCF0j/X9NxUV0byplFvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZSQB-00000001tIR-14vZ;
	Sat, 27 Dec 2025 11:25:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZSQ7-00000001tIH-1IoW
	for linux-riscv@lists.infradead.org;
	Sat, 27 Dec 2025 11:25:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3386A60007;
	Sat, 27 Dec 2025 11:25:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 558CFC4CEF1;
	Sat, 27 Dec 2025 11:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766834713;
	bh=8kGUYYmACHqbfyv/84HV3f5JbyVZmQjIEIeVSleHFXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ukx2DgGuJJW8VM0jkB5y54tMYE+yR5zUT5DlW3aP2nFAn36KzQ3f4p+WO1XQIJPQA
	 qKHKRR2LM3VFXPQqZWE/V4yloNs/7P4C1QBl5/dgEoO62JbyWr9IfKbBPo827bWAH2
	 RYkhchHY79Ln7No3atWXIebFoBaUYn1tylRnx5Tl2TiZ+ZPczhsTcu3ve3nelkbkjY
	 fq3K69Fpg67sgOLFegbiz7BsOikvBHxT37gp4zisUeW1C6SG5bgDG6gqqj4EGd/ZEL
	 8/gokM+Ww/KEtkhW+5cPbQH6EraPLeytne7tSUWUOmUpbE0rG7CVriMjYex1Prmj1U
	 Mh1TsMbSMSpAg==
Date: Sat, 27 Dec 2025 12:25:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@4d2.org>, Guodong Xu <guodong@riscstar.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Yao Zi <me@ziyao.cc>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: soc: spacemit: add k3 syscon
 compatible
Message-ID: <20251227-glaring-aromatic-raven-cbe30c@quoll>
References: <20251226-k3-clk-v3-0-602ce93bb6c3@gentoo.org>
 <20251226-k3-clk-v3-1-602ce93bb6c3@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251226-k3-clk-v3-1-602ce93bb6c3@gentoo.org>
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

On Fri, Dec 26, 2025 at 07:01:16PM +0800, Yixun Lan wrote:
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
> diff --git a/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml b/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
> index 06bafd68c00a..02ebbe4061e3 100644
> --- a/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
> +++ b/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
> @@ -4,14 +4,17 @@
>  $id: http://devicetree.org/schemas/clock/spacemit,k1-pll.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: SpacemiT K1 PLL
> +title: SpacemiT K1/K3 PLL
>  
>  maintainers:
>    - Haylen Chu <heylenay@4d2.org>
>  
>  properties:
>    compatible:
> -    const: spacemit,k1-pll
> +    contains:

No drop, there is no such syntax for this property, so you copied here
something completely different.

> +      enum:
> +        - spacemit,k1-pll
> +        - spacemit,k3-pll

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
