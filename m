Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E948C25B06
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 21:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=gDShYbmRFC9gGuEyePcft22HbdXv3e3S+M/NlPI8bWk=; b=ssAEm8T70oDLNHqwKKV/R7ALnX
	Fw1K1LxBfPcQ1HuPhotIe74Ch3YIYk8XfxaB3CEYu6RsZJr4e/zwqC8dFCSi9VCTfRFXb4BIOLvY5
	w5GZsNy8rKEghzBMSrP3VOEXuhYp8PR15892GxuGbNxHhcXSDXAkhBB/d6snho1wwoCct7E2GW0QV
	zJAznVDnhpdnqDV/gesIoDn8U/YGeA4XpTU4g7isRgLaagYRrVAuQSXItbA8dneH2j7WPcYpYoDDw
	BhFI0iWULYHBQunFYFgdmWXaN8gn47A31/vcMb/Vo8U1dB8Ld2oEnLYtapOZjJItyMBDwohImMdIL
	uunfw7pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMFOY-005KQx-AJ; Thu, 11 Aug 2022 21:07:10 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMFOS-005KFp-Gy
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 21:07:06 +0000
Received: by mail-pl1-x634.google.com with SMTP id d16so17937220pll.11
        for <linux-riscv@lists.infradead.org>; Thu, 11 Aug 2022 14:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=fYIwfWDqXvJTpIZp6wWu1QnQ1p5fYHmeOm5er300uW0=;
        b=bCRcnoMd0iKE/9LgGvS5U9Khr9pMfS0mzU8SLvpNVACCVJqJPmsDOjWtSWl5n9N/yS
         3JFou+HII01bQrn62nQVHgVrYehTqkwoV41tt8IRH+EhAQA8FXu4eaz635W9hKAyyBT1
         85dX/QZz6Mfp8pA43pHm4uZF2LB9G58Bhmr80hx2nEcKlEnvd3wdo8BlqgCymspxvYFU
         J1N38sMn+8GPiFZ7D5bCBr0Ia9e7/oizTh84yL2voY4yF8YBkfZEqZCyrgTduwQo0u5M
         NYgqfBi5vLoTXmYF9Pp51zxNvyJgq91C8E0M7nVGDpEq7OLcEdpYQFjrWcbD+6SjsBI+
         q/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=fYIwfWDqXvJTpIZp6wWu1QnQ1p5fYHmeOm5er300uW0=;
        b=AipxPnzlmDNPc3zrA4cGIGyL8+h2mjMfSjw3StqSp0livdnAk7ea+ZLT1TvDS8dS/v
         UQcB2mzDdYlidmoJyXdPZRlRx1EHIWfetS+iEgxDiwoJKk0Ey+XW0ITC24Py5wETPUr1
         5u1/ocxKvrW7JIwZDIOqwquezbI1Ye/VFXKYOPYFsOUt0pO9i/fR/Gm+buK78XghjfXB
         SyBjV7b9cU+rbWQGO0ARkwgk1s7gBzG+94+ibTl3RrJQWXVXLDRhfu3lCEWBSVhRkcZv
         dk099i1JTchlGIqCbvBC1Oby7rd0tyUaz/+RgKr6hYcf8+POdkfVt/317xcChwHRJaeq
         ytvw==
X-Gm-Message-State: ACgBeo2BIBlUG2uriJJVPk9IFmCHAnp0S6l1dptzIFMaAJI4+ERMzyvw
	9SVRliUpbijvDj5oA9LjQjRVkg==
X-Google-Smtp-Source: AA6agR593So6RKlwX2FqLk3gn4GVQrawLohvig5Nzam1xISqzzknSaCSE53kgSNdccIYbd1IrYZ1SQ==
X-Received: by 2002:a17:90b:38cb:b0:1f5:2321:63cb with SMTP id nn11-20020a17090b38cb00b001f5232163cbmr10757573pjb.110.1660252021424;
        Thu, 11 Aug 2022 14:07:01 -0700 (PDT)
Received: from localhost ([50.221.140.186])
        by smtp.gmail.com with ESMTPSA id x190-20020a6231c7000000b0052def2e20dasm122957pfx.167.2022.08.11.14.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 14:07:00 -0700 (PDT)
Date: Thu, 11 Aug 2022 14:07:00 -0700 (PDT)
X-Google-Original-Date: Thu, 11 Aug 2022 14:00:19 PDT (-0700)
Subject: Re: [PATCH] dt-bindings: riscv: fix SiFive l2-cache's cache-sets
In-Reply-To: <20220803185359.942928-1-mail@conchuod.ie>
CC: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, conor.dooley@microchip.com, atulkhare@rivosinc.com,
  sagar.kadam@sifive.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mail@conchuod.ie
Message-ID: <mhng-4240f01d-9505-4ae9-9406-4e44b772a551@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_140705_332286_0162D6A9 
X-CRM114-Status: GOOD (  25.29  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 03 Aug 2022 11:54:00 PDT (-0700), mail@conchuod.ie wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Fix device tree schema validation error messages for the SiFive
> Unmatched: ' cache-sets:0:0: 1024 was expected'.
>
> The existing bindings allow for just 1024 cache-sets but the fu740 on
> Unmatched the has 2048 cache-sets. The ISA itself permits any arbitrary
> power of two, however this is not supported by dt-schema. The RTL for
> the IP, to which the number of cache-sets is a tunable parameter, has
> been released publicly so speculatively adding a small number of
> "reasonable" values seems unwise also.
>
> Instead, as the binding only supports two distinct controllers: add 2048
> and explicitly lock it to the fu740's l2 cache while limiting 1024 to
> the l2 cache on the fu540.
>
> Fixes: af951c3a113b ("dt-bindings: riscv: Update l2 cache DT documentation to add support for SiFive FU740")
> Reported-by: Atul Khare <atulkhare@rivosinc.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> I split this off from the existing series as there is no dependancy
> between this cache change and the gpio patch. The prior series can
> be found at:
> https://lore.kernel.org/all/20220726170725.3245278-2-mail@conchuod.ie/
> ---
>  .../devicetree/bindings/riscv/sifive-l2-cache.yaml          | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> index e2d330bd4608..69cdab18d629 100644
> --- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> +++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> @@ -46,7 +46,7 @@ properties:
>      const: 2
>
>    cache-sets:
> -    const: 1024
> +    enum: [1024, 2048]
>
>    cache-size:
>      const: 2097152
> @@ -84,6 +84,8 @@ then:
>        description: |
>          Must contain entries for DirError, DataError and DataFail signals.
>        maxItems: 3
> +    cache-sets:
> +      const: 1024
>
>  else:
>    properties:
> @@ -91,6 +93,8 @@ else:
>        description: |
>          Must contain entries for DirError, DataError, DataFail, DirFail signals.
>        minItems: 4
> +    cache-sets:
> +      const: 2048
>
>  additionalProperties: false

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
