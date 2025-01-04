Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B0BE77188
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Jan 2025 10:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JFV+cvwdDnyoCprGCStus/G8U4OTL4LVBtUPiWuPwMI=; b=Ft1Z/VK8652ApK
	BvxdUQ2Re7zLCT/8gGttSeNyn9DctN8GThNmw9khbXzbxf5XCg6tBEN7oKJIn1ht5R5d7JLQh8e+k
	o0JdK4Rh3LEc3kiyVwRayWS1DL6uTIT8Gy9F7NqeCiL91e8fkDrFsPe/KOX0WI0zXFQ7g/WuVJ2dI
	8gHZmFiQjjnKFwcRfXWze/O1pzOEUL/SCPxzTfToOHerQHlK1faKsdJ9b2xnsBvdUXf32p5fQyLYG
	PVmKUWRnKD1XOa5l6/MTy6ycRFSIIf/DFN2b1S/KsCdIHMD3Qf/fKk2NynnSNN3U7fy3XJvNQr3hm
	WBlCdMtYZAubbKKzC/dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU14o-0000000EqKh-27OF;
	Sat, 04 Jan 2025 10:08:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU14c-0000000EqIO-3Mlr
	for linux-riscv@lists.infradead.org;
	Sat, 04 Jan 2025 10:08:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A2165A403D2;
	Sat,  4 Jan 2025 10:06:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD11BC4CED1;
	Sat,  4 Jan 2025 10:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735985281;
	bh=bdlCv3xMXychMOB2F4laWYG2SD5KM7Q3azOB1+sT4xs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OUOfghYBu2ue548isEp6fx1XbxNXtMR11lecjaYlQA2g441w6qql6rtIXNgLi+OSM
	 nszu5SU6TgEbd0BMIgOHpCPzoYbuqgjiU/kSnyzSO0uo0Dm8svI0jgvx/oamjgscDw
	 s2uV7M67UBDisEan3IrcV5KE6POpiUcv4Ql2q8DZJz8t12kRMsJss+L2Vm4Ow8mK7B
	 fhDTBwf3zt96FvN+d0P/ZMXh9Y2srQinR3pTat9MhTSjuJUzdshQuVOqwgTgnMqnuY
	 9z6jSycUN3s0vXO7Z1I89qA2HWlpH6+ghhliZRMpHe2Cbh3FJ9OYMXHrCbQo5eTisO
	 B9bL+i6smjUJA==
Date: Sat, 4 Jan 2025 11:07:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haylen Chu <heylenay@4d2.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>, linux-riscv@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: soc: spacemit: Add spacemit,k1-syscon
Message-ID: <aw2vqnz5vcccqqvrrhz5tgawj7fnzzg3tds7nnepuorit37a7r@jcj3wrs7d73h>
References: <20250103215636.19967-2-heylenay@4d2.org>
 <20250103215636.19967-4-heylenay@4d2.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250103215636.19967-4-heylenay@4d2.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_020802_980830_CF6EF9F0 
X-CRM114-Status: GOOD (  17.92  )
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

On Fri, Jan 03, 2025 at 09:56:35PM +0000, Haylen Chu wrote:
> Add documentation to describe Spacemit K1 system controller registers.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>
> ---
>  .../soc/spacemit/spacemit,k1-syscon.yaml      | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> new file mode 100644
> index 000000000000..79c4a74ff30e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/spacemit/spacemit,k1-syscon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Spacemit K1 SoC System Controller
> +
> +maintainers:
> +  - Haylen Chu <heylenay@4d2.org>
> +
> +description:
> +  The Spacemit K1 SoC system controller provides access to shared register files
> +  for related SoC modules, such as clock controller and reset controller.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - spacemit,k1-apbc-syscon
> +          - spacemit,k1-apbs-syscon
> +          - spacemit,k1-apmu-syscon
> +          - spacemit,k1-mpmu-syscon
> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +  clock-controller:
> +    $ref: /schemas/clock/spacemit,k1-ccu.yaml#
> +    type: object

So now we see the full picture and it leads to questions.

1. Why spacemit,k1-apbc-syscon with spacemit,k1-ccu-apmu child is a
correct combination?

2. Why having this split in the first place? Please confirm that clock
controller is really, really a separate device and its child in
datasheet. IOW, fake child for your Linux is a no-go. Fake child while
devices are independent is another no-go.

Actual answer for 1+2 above would be to fold the child into parent,
assuming clock controller split is fake in terms of datasheet.

If it is real device, then allOf:if:then: narrowing the compatibles of
child might not be worth the complexity.

3. Why using different naming, look:

spacemit,k1-XXXX-syscon
spacemit,k1-ccu-XXXX


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
