Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CFEC021AA
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 09:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+bg2MiyhiPCJS/+O3M/GOf859PtmitlQcISUZmCxWmc=; b=j0FlBXcbv/SI4N
	LnzowzyZfagz6wqwQ9ZQRLws8ya5LSoji2uiUGrUmuqswf+kwsSpQfwI0lHClvX/FwdWsLUEpKrgJ
	qEZHq0Ar/K0SlbCX1EC0n4LD89BqlicxQiyezVMGKEB5CFfPVj80d8hYK+5vMEs4k6e/TbsX2AZJO
	sLyUbbx1CHBfXLQlU6ojar+t0zkHfRpwqqY2a5S4wqOZ4tIx+rw4Qgb9us0CwzMHy3spW3BKWj1fU
	HgnKUMpLlAohPEn72UDknIKYQaZrX2nFztkEjJLT3wfhSirJa+d4JAVIuXok1FbSOhTGDuFv8vbzh
	I+uqD1l7RTJxpxGrN5zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPAd-00000004tFl-1jqS;
	Fri, 21 Feb 2025 09:18:07 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlP8u-00000004sqB-0Vcy
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 09:16:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A95761184;
	Fri, 21 Feb 2025 09:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC04C4CED6;
	Fri, 21 Feb 2025 09:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740129379;
	bh=v4duxCBt31nnMKSAT2iTqhqPuTqDH0EcdtbEtxT5aeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VINOrWZ0MlUK8m4ViqyGszczMyknnwNDy1cX7Of0w9PFryWoN6z7k0/JPV/1ysj75
	 iFXW2hjpcurfgMZtpyccXSeUa2fjzkvI4wxV0OwSjmr48Vkz8LCixF+LxySC+DdM1s
	 5LRKP1R8WgRkclg9lf5i1Sjb0pQS2npaJS7ltxBVZame8ZtZkBILQdlvdxjrCLuAYS
	 rEkcRctogB0dwhmdJ9jDXO+rcOd7qerQCf6FHAsHpMrp2dGwF0i+dlcTybyNDLas49
	 EURRBLSAPtBNQnQclY5NzJtmxLDFNcFB9UpKuF9a9oCseJajZGe0XPoPruGwH7pU+R
	 zV2aEAciRde8g==
Date: Fri, 21 Feb 2025 10:16:16 +0100
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
Subject: Re: [PATCH v5 15/21] dt-bindings: gpu: Add support for T-HEAD TH1520
 GPU
Message-ID: <20250221-adaptable-tamarin-of-variation-ad6dc6@krzk-bin>
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140310eucas1p1297441a3da276569cd86b6b9e4544242@eucas1p1.samsung.com>
 <20250219140239.1378758-16-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250219140239.1378758-16-m.wilczynski@samsung.com>
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

On Wed, Feb 19, 2025 at 03:02:33PM +0100, Michal Wilczynski wrote:
>    reg:
>      maxItems: 1
> @@ -60,6 +65,16 @@ allOf:
>          clocks:
>            maxItems: 1
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: thead,th1520-gpu
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3

Missing constraint for clock-names. They *always* go together.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
