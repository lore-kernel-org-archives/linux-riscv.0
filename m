Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9BDC021AA
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 09:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NbRYpva8jE+BR2OroCL+30A+AjXiNRpvPPjryeuQZ6o=; b=DVCvlaVOXEhusw
	Ks7OBZLyAAtwY8/G0C5HTOJkfv24xoX5auh8vlwZOTs1wZlm9BHFVhu2SATplcMIqCSKc5yaUU5Kp
	ro5JcBwatLBvPZ9g0XyZJH0ZcUTvLc8zEiYUX+Z98u0I1cnmDRWm9vgBJt+yT6si3nW1bN6neiRF3
	OXJgCHPng+wsQsNV0KHfpMaDaP1Mz6DycBNe6VESx+59bdXtRb2XvgMv1wHGkHUXIjD1xEYH5HBMU
	X8fEbwjR/3JLZuHpE0Y30Um/ef7BL8vATHGJgJHWzpIv5KyJBZR1J6k7O8kmx1Y7wzHtHrDl8p5YA
	vKxyyWTFYJhm3WQenzMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlP4R-00000004rWP-0aBM;
	Fri, 21 Feb 2025 09:11:43 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlP4P-00000004rW8-3dz7
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 09:11:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 087A961182;
	Fri, 21 Feb 2025 09:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34D00C4CED6;
	Fri, 21 Feb 2025 09:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740129100;
	bh=OnhM+IngcbfTGE1ogRH7mwjuGlDyBD9XjnvZeiestVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m8zPwa7Xb55i7LAqI58OdJeShKNREpdDkpI1YATQdlyc5nCRDRdZN0I5YrBle66XN
	 VNc/7jANzsn07jLN8/IM74GX4QngHJx5RAPjeNrgQBfyauJJM3auB53GrOsjcjGU+j
	 gUYKsk63YZzIgkoX94R7rd52iMjRZTwSouG21VOjmPRw6F/kF+XRRAsHVDBNomPBzl
	 cfpQL3tJoumzj8Ic3A2bdn2V6dPqyr1bGqxDjKnu/2oKTTjjVdGbSEqaDSbF0p7hjO
	 ZC0JywTcJXnsDpdoNESpXVffOFF/HAmfvEXSFEqtUyz9bqsCSbqHCoD9fguLgLa29Z
	 DxZCFi5Naz+7Q==
Date: Fri, 21 Feb 2025 10:11:38 +0100
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
Subject: Re: [PATCH v5 09/21] dt-bindings: clock: thead: Add GPU clkgen reset
 property
Message-ID: <20250221-imaginary-ebony-macaque-aace8d@krzk-bin>
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140301eucas1p249b17ca44832eb8caad2e9ad0e4f8639@eucas1p2.samsung.com>
 <20250219140239.1378758-10-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250219140239.1378758-10-m.wilczynski@samsung.com>
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

On Wed, Feb 19, 2025 at 03:02:27PM +0100, Michal Wilczynski wrote:
> Add a mandatory reset property for the TH1520 VO clock controller that
> handles the GPU clocks. This reset line controls the GPU CLKGEN reset,
> which is required for proper GPU clock operation.
> 
> The reset property is only required for the "thead,th1520-clk-vo"
> compatible, as it specifically handles the GPU-related clocks.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../bindings/clock/thead,th1520-clk-ap.yaml      | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
> index 9d058c00ab3d..6ea8202718d0 100644
> --- a/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
> +++ b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
> @@ -40,6 +40,12 @@ properties:
>              (integer PLL) typically running at 792 MHz (FOUTPOSTDIV), with
>              a maximum FOUTVCO of 2376 MHz.
>  
> +  resets:
> +    maxItems: 1
> +    description:
> +      Required for "thead,th1520-clk-vo". This reset line controls the

You just added the compatible in other patch, so are you saying you
added knowingly incomplete code?

No, this must be squashed.

> +      GPU CLKGEN reset which is required for proper GPU clock operation.
> +
>    "#clock-cells":
>      const: 1
>      description:
> @@ -51,6 +57,16 @@ required:
>    - clocks
>    - "#clock-cells"
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: thead,th1520-clk-vo
> +    then:
> +      required:
> +        - resets

else:
? What's there? Also reset or no?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
