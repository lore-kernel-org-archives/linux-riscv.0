Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89EEC531F9
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 11:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=odaLFAOEOfOhOAB97vWOJ/B8brKqrMcS0qF8W8idRM4=; b=CuakN+7qG3VqLK
	9am+O1bkklC7ACzQf+lpNouoa5VpgB/POodYjZV6uiUlyEscBI0xRWsH5nRZ73UL7oxE94m5He95m
	RPQnHOP015RdGJ3UvnIeP8qK1yI5nUqdMkWKEkUvOa7kFHWTBYnw+MTRnHZ5ug3sPzmeBol8TNxzp
	Kefe86BCC78bnSxiEGRcy7bveeWGRYBZ6E5YUjtdi5CPWYVFopLyfF6x27U522GAVaxrKNo9MSggz
	2eq2Jm6nZeL6DYMzAfgExvZXXUZdidYy2+VBwON/hSoKnZSpIc+buaHHnAf1WTGIvMr4k0zwe2bbl
	eNx4gYNMkDHRmsHmuZ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogHi-000000057w6-0LFY;
	Tue, 28 Jul 2026 11:47:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogHg-000000057vm-2p32
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 11:47:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EE9E360051;
	Tue, 28 Jul 2026 11:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77761F000E9;
	Tue, 28 Jul 2026 11:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785239263;
	bh=d1kX/2BkcFPx00SzT9s8BBrA//d/t9d2pxkdmPH02XM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=etQeWE0ZOjyJqTVlDWQbq5PZbsEw/jGbJ7o2iN1SX7Zhy7Mw8DMzIKD21YRPN2+rX
	 CPKcV5T306U77NWVVkYX0UGW9TZY854Ob9JfRUKw7iXsqnOTI7TMcU9g3hlbIlPc16
	 3vPDw8C2G7usSz4BQ0R1/HDJW1UJe/DdgxPhF2SHX66DijysZcsVeJlULzXVKEcjQk
	 Q/r/gMf0FlR1A+o5y5loJQCisFASow3ORcjosHXV8pw14gfL2OWtbDPcc9beRDjEVa
	 W19rBW41tBBVGXXTun5OUKXBKEzkRph0lHTKUbCVh2UMCWC5RtN0Yc0Nu0qU9lqjzx
	 EPtrqPNcP1ehQ==
Date: Tue, 28 Jul 2026 11:47:39 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] clk: spacemit: k3: fix i2s clock topology and
 divider rates
Message-ID: <20260728114739-GKD76518@kernel.org>
References: <20260717-k3-clk-fix-i2s-v1-0-e95001a692ee@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260717-k3-clk-fix-i2s-v1-0-e95001a692ee@linux.spacemit.com>
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

On 00:26 Fri 17 Jul     , Troy Mitchell wrote:
> The K3 i2s clock tree was modelled on the K1 layout but does not match
> the actual K3 hardware topology, leading to incorrect clock rates being
> reported and programmed.
> 
> Three fixes are provided in dependency order:
> 
> First, the MPMU_ISCCR syscon register is renamed to MPMU_ISCCR1 to
> match the hardware register name, and MPMU_ISCCR0 (offset 0x0040) is
> added. This prepares the header for the clock topology corrections that
> follow.
> 
> Second, the clock topology is reworked to reflect the real hardware:
> the common i2s_sysclk DDN at MPMU_ISCCR1 is renamed from "i2s1_sysclk",
> an implicit 1/2 factor (i2s_bclk_factor) is introduced before i2s_bclk,
> and the dedicated i2s1 clock path (i2s1_sysclk_src MUX + i2s1_sysclk
> DDN backed by MPMU_ISCCR0) is added. CLK_MPMU_I2S1_SYSCLK keeps its
> existing ID but now refers to the real per-instance i2s1 clock; no
> in-tree user references this ID so the semantic change is contained.
> 
> Third, the per-instance i2s sysclk DDNs (i2s{0,2,3,4,5}_sysclk_div)
> are corrected to account for the hardware-internal 1/2 factor by setting
> pre_div to 2 instead of 1, so clk_get_rate() and clk_set_rate() report
> and program the real hardware rate.
> 
For the series, looks good
Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
> Troy Mitchell (3):
>       dt-bindings: soc: spacemit: k3: add i2s_sysclk, i2s_bclk_factor and i2s1_sysclk_src IDs
>       clk: spacemit: k3: fix i2s clock topology
>       clk: spacemit: k3: fix missing /2 factor in i2s sysclk dividers
> 
>  drivers/clk/spacemit/ccu-k3.c                  | 31 +++++++++++++++++---------
>  include/dt-bindings/clock/spacemit,k3-clocks.h |  3 +++
>  include/soc/spacemit/k3-syscon.h               |  3 ++-
>  3 files changed, 26 insertions(+), 11 deletions(-)
> ---
> base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
> change-id: 20260615-k3-clk-fix-i2s-5e278a472061
> 
> Best regards,
> --  
> Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
