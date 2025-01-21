Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3A3C02182
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 10:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8poUql5f6amQESgyBBeYibihGGTqX7ng/1uzXxJdQAs=; b=C6Um51ytNjPBsW
	DqergzNvLsAbaYjRCz4+i7SRUvTit5Ehd8TjAoWtY0wkn6aP+BHfWy8HnpTkjfHHI0esFmBAwxY5z
	xA1HI0hD+rEhiA2A1BuhSY+y9uO5kzo4U0ucY7J6Qgy2uqpx5EuwrcoGlAIzYBt3V1SVzvaOnrRmJ
	MF7Ppi7cj2BOwX1KlGKdvEhqZh3FRz9MRVg+EpN7cco9tMLoow+hRWdpX6smMJo58+a8yC2ZvdT46
	bLFuu4yFhG+cdANL2vZnFukInU5AMta/EUhUf+Du6qQgQ5GKBdnwwgaf/O6Ul6/H6gsFksAEaOAxZ
	gNp+H8YIBKaXU+5L8naQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taBBc-00000007Weh-0Kjl;
	Tue, 21 Jan 2025 10:08:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taBBZ-00000007We5-2QO6
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jan 2025 10:08:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8EEF55C4B49;
	Tue, 21 Jan 2025 10:08:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CB28C4CEDF;
	Tue, 21 Jan 2025 10:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737454120;
	bh=ENLFzy2bE8WWpAn62FWGklWq2J5NXPzsV7mwFUV66PY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JCRBH20svciWwvTa1Did37XrBO0s064B/DTFoypK1t6MGJT27w12BeFGtHmYxV/as
	 Odlu0WA8tRCdm7psEPen+TsZFqLn0UeVZYRUxEio7Yk6Kq1cjB0Vtx80OibDX0Y4wE
	 AaRb+IxQGAJYbrccGynrYdSQLoKxXr6U2MoveJsF/FpyAcclzvOvwegFdDJmPtLOrc
	 XmWBTm9SghFul+y1OV88u+wVxBQ7i2HdSjwhPpkDwOcI6FrfIcW2EKdhIIkQU7V/4U
	 DLy0MOxumGpT8ESf4cG1G+R+BJqMIcOWJsah9f6MrNTdT/CVR7kSBZ/EGBVRxBZaTx
	 l1CsnM4qWBSZg==
Date: Tue, 21 Jan 2025 11:08:38 +0100
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
Subject: Re: [RFC v3 11/18] dt-bindings: gpu: Add compatibles for T-HEAD
 TH1520 GPU
Message-ID: <20250121-tiny-crazy-goshawk-dce1dc@krzk-bin>
References: <20250120172111.3492708-1-m.wilczynski@samsung.com>
 <CGME20250120172134eucas1p18cbf29a4ade281df10efce210cc8893e@eucas1p1.samsung.com>
 <20250120172111.3492708-12-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250120172111.3492708-12-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_020841_660551_0C2C3EFA 
X-CRM114-Status: GOOD (  10.03  )
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

On Mon, Jan 20, 2025 at 06:21:04PM +0100, Michal Wilczynski wrote:
>    reg:
>      maxItems: 1
> @@ -25,11 +30,8 @@ properties:
>      maxItems: 3
>  
>    clock-names:
> -    items:
> -      - const: core
> -      - const: mem
> -      - const: sys
>      minItems: 1
> +    maxItems: 3

So what is the third item? It cannot be anything, but must be
constrained.

I understand that you clean it up and maybe the cleaning is correct, but
it should be separate commit with its own explanation.

>  
>    interrupts:
>      maxItems: 1
> @@ -47,8 +49,6 @@ required:
>    - clock-names
>    - interrupts
>  
> -additionalProperties: false
> -
>  allOf:
>    - if:
>        properties:
> @@ -58,7 +58,28 @@ allOf:
>      then:
>        properties:
>          clocks:
> +          minItems: 1

Drop minItems here.

>            maxItems: 1
> +        clock-names:
> +          items:
> +            - const: core
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: thead,th1520-gpu
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +        clock-names:
> +          items:
> +            - const: core
> +            - const: sys
> +
> +unevaluatedProperties: false

That's not explained. Does not look correct, either, unless you fix some
issue, but then again: separate commit.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
