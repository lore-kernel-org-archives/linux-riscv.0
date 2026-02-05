Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C3CEE9129A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 09:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rDNe/Xsy6sW/tjoPwDeCP4Nnb3tohZVq68bT5GyjIm4=; b=vblfg357tmJdOU
	MPD8vYGe6hy++Sb1Y32dEAiUI6i3xqhrlJV1Q91K858bQPN/pQkx7lFALLMPIDOXWKlIVAL8/L8tN
	u6K41CS7G2ShR5nXgBwnyT9iCUVWeZ+7Y7DLTN5KXUm4/lyRL/hOS1sgZ8FlRmBSgudEUwbJJ4eyU
	Rk7fp5uL9TxQTQc9GTWY54i08vs/Yth0b4kbM1N816Pa281p8IcaCO4CPukl5g5Uf8/FrZWwpwzl4
	K/aWRnMcIA7isY5vc3eeWKXnHGXAL4n3xfPXUEMp+WzqdxHAXxifHpJqnheRUNmZobbrI6V9RDw4g
	nWQHnmiJhfhSAE5R7vJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvaU-00000009h9A-0s4i;
	Thu, 05 Feb 2026 09:23:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvaR-00000009h8o-3wXg
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 09:23:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6056143FC9;
	Thu,  5 Feb 2026 09:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1135C19424;
	Thu,  5 Feb 2026 09:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770283423;
	bh=E/fTeLbfqctiMfvtIIsD2A13p3FJxkamI/aB67QXm90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZY0VV/YmQw9o3HykKI5oDkB8+0FGY59+TgUOhOg3fTxPl2mWD82zfitDPj8fnTgGe
	 iXePQbf1JmtXQyVZoEh18wv+dLiyc7Gwnlfw5BmrncDORENE68PpFIJ+s/qhDazbBC
	 z38/+ZW7yEEDn7kPx/vJ32EkCZF+NiK0Qz8dnRh4TnWBtZrZIKO7fc2ToqCR+bnVyz
	 H2DnFQMM9d1R9DKoJDzv+j0O3wynB4L+m231TkYQt0lzQlb/sVAXDHw3TtN1P8RU3l
	 y+Q/IyvvrWsFpC+AA3Ip2IIhnQWNzU1vFAfaODaK+2qbFp4pLGUZCzghYUxya2734M
	 tsUIKe8Vbjrrw==
Date: Thu, 5 Feb 2026 10:23:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, 
	Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, 
	mpe@kernel.org, mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, 
	agross@kernel.org, agross@oss.tenstorrent.com, bmasney@redhat.com
Subject: Re: [PATCH v5 1/3] dt-bindings: clk: tenstorrent: Add
 tenstorrent,atlantis-prcm
Message-ID: <20260205-upbeat-tortoise-of-admiration-b3c0eb@quoll>
References: <20260202-atlantis-clocks-v5-0-0922e43acaba@oss.tenstorrent.com>
 <20260202-atlantis-clocks-v5-1-0922e43acaba@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260202-atlantis-clocks-v5-1-0922e43acaba@oss.tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_012344_023548_3DCA1ACE 
X-CRM114-Status: GOOD (  17.03  )
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

On Mon, Feb 02, 2026 at 01:46:49PM -0600, Anirudh Srinivasan wrote:
> Document bindings for Tenstorrent Atlantis PRCM that manages clocks
> and resets. This block is instantiated multiple times in the SoC.
> This commit documents the clocks from the RCPU PRCM block.
> 
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  .../bindings/clock/tenstorrent,atlantis-prcm.yaml  |  54 +++++++++++
>  MAINTAINERS                                        |   2 +
>  .../dt-bindings/clock/tenstorrent,atlantis-prcm.h  | 103 +++++++++++++++++++++
>  3 files changed, 159 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm.yaml b/Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm.yaml
> new file mode 100644
> index 000000000000..0f3e18f5ea1a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm.yaml

Still wrong name. Look how is your compatible called.

> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/tenstorrent,atlantis-prcm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Tenstorrent Atlantis PRCM (Power, Reset, Clock Management) Module
> +
> +maintainers:
> +  - Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> +
> +description:
> +  Multifunctional register block found in Tenstorrent Atlantis SoC whose main
> +  function is to control clocks and resets. This block is instantiated multiple
> +  times in the SoC, each block controls clock and resets for a different
> +  subsystem. RCPU prcm serves low speed IO interfaces.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - tenstorrent,atlantis-prcm-rcpu

Nothing in the changelog explained why 2 other compatibles were dropped.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1
> +    description:
> +      See <dt-bindings/clock/tenstorrent,atlantis-prcm.h> for valid indices.
> +
> +  "#reset-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - "#clock-cells"
> +  - "#reset-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@a8000000 {
> +      compatible = "tenstorrent,atlantis-prcm-rcpu";
> +      reg = <0xa8000000 0x10000>;
> +      clocks = <&osc_24m>;
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dc731d37c8fe..0fc7bc6d0458 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22534,8 +22534,10 @@ M:	Joel Stanley <jms@oss.tenstorrent.com>
>  L:	linux-riscv@lists.infradead.org
>  S:	Maintained
>  T:	git https://github.com/tenstorrent/linux.git
> +F:	Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm.yaml
>  F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
>  F:	arch/riscv/boot/dts/tenstorrent/
> +F:	include/dt-bindings/clock/tenstorrent,atlantis-prcm.h
>  
>  RISC-V THEAD SoC SUPPORT
>  M:	Drew Fustini <fustini@kernel.org>
> diff --git a/include/dt-bindings/clock/tenstorrent,atlantis-prcm.h b/include/dt-bindings/clock/tenstorrent,atlantis-prcm.h
> new file mode 100644
> index 000000000000..3820781127c3
> --- /dev/null
> +++ b/include/dt-bindings/clock/tenstorrent,atlantis-prcm.h

Still wrong name... Look at your compatible.

Please read writing bindings doc in DT dir.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
