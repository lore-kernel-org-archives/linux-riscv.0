Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44232C021AA
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 22:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6js7Q3Fp+K8AGXv/Si9+NgI74lMP5lx5lke4QWjMFtw=; b=IqOdtHF6SEmqum
	5WZMsc6iBx7YZBRwPjhKC3H7bH4OSIGWY2W2nJW9EpQy7rrti6IqUul3n1FTZwqggLiO+B539VAsB
	t7JwZht9gOKfo0O3GZllBlH+SdVEUnbLqvbWGpeu27Eh0FXZyz2dYCw7KGYf6oxLp2EXHFpJaLuhh
	auwXupQ5sTxy1n/ewRGnrdYNkSbKbK+S+qwIBNTcpmiOq4DENkbenaOFesuITWFuSTZoUFC0RJvn3
	a+QiowGPiCOOj7wIIXneFR+LjyW5md+M1miKDt93hBlO/ynnG+oOTkN1gBRoLffJDRBI4JgshW7T9
	rZsmzIoTh3GAlqCW/4DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkVer-0000000A5VW-1CJV;
	Tue, 18 Feb 2025 22:01:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkVUg-0000000A419-3IC2
	for linux-riscv@lists.infradead.org;
	Tue, 18 Feb 2025 21:51:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8202B5C628D;
	Tue, 18 Feb 2025 21:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50BCAC4CEE2;
	Tue, 18 Feb 2025 21:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739915465;
	bh=9e3XyBz54l22mh0Z3FsfCVrraHqX7Xy0MXFHgJzUHyk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Ld4zujNyZaTn0X+NtO1cF13Gc8hagFAAIuoEnmIlBmzXumpc2CjzlfSVJl9ZzOj8m
	 GTIemwv4b4O86mmintNBA02I/sASkaNyr62sD1Cu8UZpJK4qa3Ylbq+ioKNVJeeqSI
	 lUxWHl+dgsBOIPCHxInnbMeO0wypIb5lQDX1OgLSgVmmgMJUjFWpAEdbj6I0op+Xrk
	 bM1ueQNOSemSICC9p1e55Kuj4aoWqINKMFrFCqcza+nviFYkIv+YA9K2MkenHt+9Re
	 XcshSTxMHL/xxpfNfQb0PtVCYnMiC+oGtNaKtukrwiTGxKNe3eE1CwRId02VvQhQiY
	 1Ne7lc9V9IqhA==
Message-ID: <c68c14422c7d27278f6fc75f285db7c7.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250217-b4-k230-clk-v4-1-5a95a3458691@zohomail.com>
References: <20250217-b4-k230-clk-v4-0-5a95a3458691@zohomail.com> <20250217-b4-k230-clk-v4-1-5a95a3458691@zohomail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: clock: Add bindings for Canaan K230 clock controller
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Samuel Holland <samuel.holland@sifive.com>, Troy Mitchell <TroyMitchell988@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>, Xukai Wang <kingxukai@zohomail.com>
Date: Tue, 18 Feb 2025 13:51:03 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_135106_882255_DF07D979 
X-CRM114-Status: GOOD (  10.20  )
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

Quoting Xukai Wang (2025-02-17 06:45:16)
> diff --git a/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml b/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..d7220fa30e4699a68fa5279c04abc63c1905fa4a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/canaan,k230-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Canaan Kendryte K230 Clock
> +
> +maintainers:
> +  - Xukai Wang <kingxukai@zohomail.com>

Is this missing a description of the device?

> +
> +properties:
> +  compatible:
> +    const: canaan,k230-clk
> +
> +  reg:
> +    items:
> +      - description: PLL control registers.
> +      - description: Sysclk control registers.
> +
> +  clocks:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@91102000 {
> +        compatible = "canaan,k230-clk";
> +        reg = <0x91102000 0x1000>,

Is there a reason why the PLL range comes first? What's at 0x91101000?
More clk hardware?

> +              <0x91100000 0x1000>;
> +        clocks = <&osc24m>;
> +        #clock-cells = <1>;
> +    };

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
