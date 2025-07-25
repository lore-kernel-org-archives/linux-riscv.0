Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894E8C83F26
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 06:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sH1i2r+Vtih9j+7WFFL2BJV5wjU9teIKcOyieN5wtwE=; b=VTcDl2rgsf1AGO
	APMsgUHr4WxNyfcPuKVAIIVuw0ED0mmivtV9PxLbAdyl5BxE36PtkIKp1Urcfht21ZLrmVOu+cRX7
	mHIRnuR0iXDLjFZSgQKz/ASeFW7dJvmn1l0F4TKyR2Jtb4CujQFUHQ/YS5QV8HV0Ppj9rXqmTdTuU
	dbie55Voc3OdiAD5wLjAc7C75ouvXqzMJZJ1veiG0f3omB1SYeQpI/LSC70JX4WKOifEE7uwvFbBt
	RNjV133PR3HxUvYOfQNiCvZj/ZFMNJt0KdU5TmPQoGwHO9RMUjv1gjbSiYt71Ls9Xm2vOLbyB/GLp
	rN06o3+dSaWjeqGkdAPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCOu-00000009Cyb-1HP5;
	Fri, 25 Jul 2025 06:59:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCOr-00000009Cxp-47cv
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 06:59:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD53A5C5F5A;
	Fri, 25 Jul 2025 06:59:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7BCC4CEE7;
	Fri, 25 Jul 2025 06:59:23 +0000 (UTC)
Date: Fri, 25 Jul 2025 08:59:22 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
	Matt Coster <matt.coster@imgtec.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v8 2/4] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU compatible
Message-ID: <20250725-gainful-saluki-of-mathematics-3c0dd0@kuoka>
References: <20250724-apr_14_for_sending-v8-0-0714bef83c59@samsung.com>
 <CGME20250724141911eucas1p17071ea620f183faff7ca00cad25cf824@eucas1p1.samsung.com>
 <20250724-apr_14_for_sending-v8-2-0714bef83c59@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250724-apr_14_for_sending-v8-2-0714bef83c59@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_235926_100567_30802A4D 
X-CRM114-Status: GOOD (  21.70  )
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

On Thu, Jul 24, 2025 at 04:18:59PM +0200, Michal Wilczynski wrote:
> Update the img,powervr-rogue.yaml to include the T-HEAD TH1520 SoC's
> specific GPU compatible string.
> 
> The thead,th1520-gpu compatible, along with its full chain
> img,img-bxm-4-64, and img,img-rogue, is added to the
> list of recognized GPU types.
> 
> While the BXM-4-64 GPU IP is designed with two distinct power domains,
> the TH1520 SoC integrates it with only a single, unified power gate that
> is controllable by the kernel.
> 
> To model this reality correctly while keeping the binding accurate for
> other devices, add conditional constraints to the `allOf` section:
>  - An if block for thead,th1520-gpu enforces a maximum of one
>    power domain and disallows the power-domain-names property.

Why?

This solves nothing, because you did not change the meaning of power
domain entry.

>  - A separate if block applies to other B-series GPUs
>    img,img-bxm-4-64 and img,img-bxs-4-64. A not clause within this
>    block excludes the thead,th1520-gpu compatible, ensuring this rule
>    requires a minimum of two power domains only for non TH1520 B-series
>    GPU's.
> 
> This makes the binding strict and correct for both the specific TH1520
> implementation and for other SoCs that use the B-series Rogue GPUs.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 32 +++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 4450e2e73b3ccf74d29f0e31e2e6687d7cbe5d65..2c5c278b730145a983d1ddfa4014b3c5046bcd52 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -21,6 +21,11 @@ properties:
>            # work with newer dts.
>            - const: img,img-axe
>            - const: img,img-rogue
> +      - items:
> +          - enum:
> +              - thead,th1520-gpu
> +          - const: img,img-bxm-4-64
> +          - const: img,img-rogue
>        - items:
>            - enum:
>                - ti,j721s2-gpu
> @@ -84,11 +89,29 @@ allOf:
>          compatible:
>            contains:
>              const: img,img-rogue
> +      not:

Previous patch was completely different!

You cannot keep tags when you completely rewrite the patch. Drop all
reviews and all acks.

Above code is confusing and not correct, you just stuffed multiple if
causes.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
