Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AA8C02192
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jan 2025 07:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0NCey8Rna6rl1WLSFZH8Qq3h6FRggYJbEiTY3ZYBkS4=; b=uGJnrjqP0hDyoW
	40hJqt228g0m8h8kyaAWkPC2dYwceK7pCObKJRUj5KMYktrbwZmPpbthstOSR6A1OoC82C0T/3GII
	djeXo9nILstNGquxjP5LgyiRlnwY/mn5mPfLl2d3oARLP2dUBsPw/xkBxRZEs/rfE0oUVpB445uyk
	T374y9MqlPBgeBjqwNDEMrCoDeoVlrUowbvsyBCIjejrV4EBchYrzoVLTDLw6SBcreX7RzjpBvMOw
	M4E4JOWc4wZcu9dqiSTZ+js/H6ibugcaaE/HAtpcyI3cKlCn282Jfc+9WZSgU0kFQj7GqR4XuIaq7
	fZD+e6w8hLZP5zaRI1Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td2Yh-00000006U7i-0ETh;
	Wed, 29 Jan 2025 07:32:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td2Ye-00000006U6P-46W4
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jan 2025 07:32:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 685B0A40249;
	Wed, 29 Jan 2025 07:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0791BC4CED3;
	Wed, 29 Jan 2025 07:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738135939;
	bh=edf6GahyS4kb1UUMjT6wYRelLIajZBKgtmSAla2YLgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kjv8wCD2xyOyOzx6Ndz/9YmNXJrbfN0QJI5XzsYL/xBliwLXKzqYaleXdo7ByuVJa
	 QTJBzwtwN46kGOat1zK6Wsg0FRh7OfdUa+IL1j+ZhOtg2Av8dCXtcQSIRpvBUq3vr/
	 zlmXZKObadkO9d7vZsOQLTKC994XxA1LLd0vcwrLTCByse9TaVJWHqdN6Q9CtbKlSm
	 RKDYE8QKFskkBoWsEuHllVQESs5ofolRAZ4cuBoR/gikHpPPfQPeyannm4PXskLZUC
	 7+wAxRXTJxCMaknotTf3cp0QXyN8NESG39PJ81pxKiG4FAfEAo45IFhxsbGIvIXyEu
	 wEzzJqrDpRZFA==
Date: Wed, 29 Jan 2025 08:32:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org, 
	wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com, 
	matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, ulf.hansson@linaro.org, 
	jszhang@kernel.org, p.zabel@pengutronix.de, m.szyprowski@samsung.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 08/18] dt-bindings: reset: Add T-HEAD TH1520 SoC Reset
 Controller
Message-ID: <20250129-stereotyped-just-sponge-c8ffab@krzk-bin>
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194835eucas1p29b16bee72365f321e1056fc4d9d44345@eucas1p2.samsung.com>
 <20250128194816.2185326-9-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250128194816.2185326-9-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_233221_079443_05EAD6E9 
X-CRM114-Status: UNSURE (   9.55  )
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

On Tue, Jan 28, 2025 at 08:48:06PM +0100, Michal Wilczynski wrote:
> Add a YAML schema for the T-HEAD TH1520 SoC reset controller. This
> controller manages resets for subsystems such as the GPU within the
> TH1520 SoC.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../bindings/reset/thead,th1520-reset.yaml    | 44 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +
>  .../dt-bindings/reset/thead,th1520-reset.h    | 15 +++++++
>  3 files changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
>  create mode 100644 include/dt-bindings/reset/thead,th1520-reset.h

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
