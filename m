Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D99C10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 22:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r5CTTBWpXXqrgjlwMfNStw8v3T5y1PUCJFLcIEplojo=; b=ISGjZh0bd0xr/0
	4v5+kTY1cH7wrdxqcFTGFsuLkxoAPfY/xFHjUdod8HPeD7vhdJIkCAAFMI0W8kaFm2M9eXViFmJSp
	7GvvOq023HKro6hreC8OKQlRhvzh3SrG/IDDGJQBFkBomuSmZdOThAnwoH4hdansnOGSRcO9sqDiQ
	KElNe7qp6dFubykPOno24XIjeNK8eAeOhzJKBmxkwGYttz6LaMOJH2DnMTVzyrF0Gr+f/BERZSH7r
	+EXJf7IpFwA5ublzYlvGcB6uZKSAzzkjq5rN8aawieak/b8wq8SJgobcgw0pe5l6L5RNmLFoWBCXs
	Q4zplcxNKTEL2QoQP+KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5C1R-000000034Go-3SQi;
	Thu, 09 May 2024 22:13:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5C1O-000000034FJ-3eBW
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 22:13:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0ADC261178;
	Thu,  9 May 2024 22:13:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9462BC116B1;
	Thu,  9 May 2024 22:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715292824;
	bh=HsXBbYKsnaH2cBNxCbmFsxNH4L35JJ8rnzTl2hLvMCA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nMIa1+9VKO+e1tZRZY1J27ygFKsItAYeEY0WnZ2gS4xAWON9xuiIzp5JHk14e4JVR
	 YCvpBBRmVL+ZcIfLdrAafXSiWdDLkOnVvgL+HKszgvlRpnrrxsJk/Ae+aQLoxI35Xj
	 BlamZ/Mmr/BReIi8DffdEfn+O2LcYk4n1JPTIUgiEZerM3kws7qi2PlOcMCtbcLKHk
	 3+BGzqu974gMMGcmR1qOnP7jpY/95gkF8jgC266QHH7fkER2qpocZrGJ5iOuj609J+
	 EHJl0GiO0z+InjRy3cZdNuMBFZck8h4IEv/Z7WF5HztSpzcXe2D87lzqjOC2Ehe7iq
	 P+STj6tLfJYsg==
Message-ID: <8dc03fdc36b72888bd1b59cec6feebad.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240506-th1520-clk-v3-2-085a18a23a7f@tenstorrent.com>
References: <20240506-th1520-clk-v3-0-085a18a23a7f@tenstorrent.com> <20240506-th1520-clk-v3-2-085a18a23a7f@tenstorrent.com>
Subject: Re: [PATCH RFC v3 2/7] dt-bindings: clock: Document T-Head TH1520 AP_SUBSYS controller
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
To: Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor+dt@kernel.org>, Drew Fustini <dfustini@tenstorrent.com>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Yangtao Li <frank.li@vivo.com>
Date: Thu, 09 May 2024 15:13:42 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_151350_978537_29E2B422 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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

Quoting Drew Fustini (2024-05-06 21:55:15)
> diff --git a/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
> new file mode 100644
> index 000000000000..d7e665c1534a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/thead,th1520-clk-ap.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: T-HEAD TH1520 AP sub-system clock controller
> +
> +description: |
> +  The T-HEAD TH1520 AP sub-system clock controller configures the
> +  CPU, DPU, GMAC and TEE PLLs.
> +
> +  SoC reference manual
> +  https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
> +
> +maintainers:
> +  - Jisheng Zhang <jszhang@kernel.org>
> +  - Wei Fu <wefu@redhat.com>
> +  - Drew Fustini <dfustini@tenstorrent.com>
> +
> +properties:
> +  compatible:
> +    const: thead,th1520-clk-ap
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: main oscillator (24MHz)
> +
> +  clock-names:
> +    items:
> +      - const: osc

I recommend dropping clock-names so that you don't rely on anything
besides the cell index when describing clk_parent_data.

> +
> +  "#clock-cells":
> +    const: 1
> +    description:
> +      See <dt-bindings/clock/thead,th1520-clk-ap.h> for valid indices.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names

If you can't drop it at least make it optional.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
