Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6F0CA5FA2
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 18:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lj3RtXdUW1XaMaOl29mPPqhGwtfUlMA7s/R5qJ3jYN8=; b=3Bolvl8l/bp0bA
	NCkcx1HOJkgb3NNfK2lIFxhgIu2jKInkMq7RYbxVd0x/LCJyKeW24AYah7op/e779St1Aipr+2NoF
	NWJR4YyaxkgpwLpeQpCSjIsz23hEzSOXHJnll5Ed/UV8hMWVyDPxkoUjSo5UfOhFZzTSjgCTsdvpf
	nkCfmQTEQGGB3FhYSLr54QV9SxNHmuS9vbRdxLHtS4I99bHai9WXh2NnLlQcLF5e2y9s0/RyfI4Xz
	jZQoaZYe7wIq/e23PkHY9vt25PdPd9j9LBRQDkA3XJjHld+eUzIK6znYThgC9BG8yxHOjhnE256L2
	aMiqhLWwgr6B+yGn44nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBG7T-00000001KYP-1TJe;
	Mon, 28 Sep 2026 18:30:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBG7R-00000001KYD-3wnY
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 18:30:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 06B4060120;
	Mon, 28 Sep 2026 18:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803661F000FF;
	Mon, 28 Sep 2026 18:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790620228;
	bh=WcqjPQGfmSN4aaf9xy/4ayNG9PspGR26tXpmCJnxJJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sq8Y3eCSAuDhH+OQq3T83rFPJbzAzozQjMr6D+FsLlgNEfiRr15TqqJ82LhPukgCq
	 RxmrD0SalntQV8KHjT0w4QAaB2G786S/76g3pezYGB6NHBEZfWFUkQjTx/43h2UFXM
	 pPsI/S8XBUqljPalELxlZ00KPMKgpN8cOvEBVPUuQVjsR4b+klL7XuomPEtxV7CVpQ
	 lLBKy5NNbe6X0JKyNzzBPZcJmjFdX7k4lYOsbVqrkZ3QqtqWmxRXIK/v6A/ZunNG2Y
	 DGRD6CJf0NpK2rdsuH1TtbqkADjvs71Id81uOPlTO+xGUZxcF2YwJm7WfLSVFpfyqa
	 liXkHmgQD3OuA==
Date: Mon, 28 Sep 2026 13:30:26 -0500
From: Rob Herring <robh@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: power: spacemit: Add power domain
 controller
Message-ID: <20260928183026.GA211865-robh@kernel.org>
References: <20260918-04-k3-pm-support-v1-0-0acd2b36b96f@kernel.org>
 <20260918-04-k3-pm-support-v1-1-0acd2b36b96f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260918-04-k3-pm-support-v1-1-0acd2b36b96f@kernel.org>
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

On Fri, Sep 18, 2026 at 02:40:13AM +0000, Yixun Lan wrote:
> Add initial power domain driver support for SpacemiT K1/K3 SoC, The Power
> Domain Controller is SoC internal module which is part of APMU (Advanced
> Power Management Unit), it is responsible for managing power across multi
> power domains, which includes power on/off, isolation, power-on sequence.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  .../bindings/power/spacemit,power-controller.yaml  | 43 ++++++++++++++++++++++
>  include/dt-bindings/power/spacemit,k1-power.h      | 14 +++++++
>  include/dt-bindings/power/spacemit,k3-power.h      | 12 ++++++
>  3 files changed, 69 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/spacemit,power-controller.yaml b/Documentation/devicetree/bindings/power/spacemit,power-controller.yaml
> new file mode 100644
> index 000000000000..f869285f84da
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/spacemit,power-controller.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/spacemit,power-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SpacemiT Power Domains Controller
> +
> +maintainers:
> +  - Yixun Lan <dlan@kernel.org>
> +
> +description: |
> +  SpacemiT processors include support for multiple power domains which can be
> +  powered on/off by software based on different application scenes to save power.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - spacemit,k1-power-controller
> +      - spacemit,k3-power-controller
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +  spacemit,apmu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle to APMU syscon to control registers for power domain

Sounds like the APMU should be the power-domain provider directly. You 
don't seem to have any other registers for this node.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
