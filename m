Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FE7EB64DD
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 06:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xFA7bngIpRaNVwiwytlTdpZdKUsoLqJmXPyjEXupCyA=; b=AFfHvHb8K1hn9o
	EhgFHN2Y7hce3iamJV2vm6m7XW4IjmlwvfQfmmot/zEzzjCZBg1zO00Sdm2CV5EdTT17vRjv4hHtH
	SEd37lPvpXrJlkVCn+7dUVwQGSQP5SaxS8yEHYeO0UMa3oMFr7CdJ4GgqS/ToLO9hvfQqh8zwODqO
	8hv4sWYhf8EBScVD5rZLY99NVCedZAygqgsSF3HHcBT39XEWVEXe6y8nyh6TbkO+v41c0ehuLBBqL
	r51k8it9aIF3kj4nNThFnJ53mV1IpfGQFB2jCjdx9L7DgXth6VO+EeMsOciErExKXE9RwrYYXtJvx
	3BAwTzRMet9aqiuUyiug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qStkA-00GGmo-0M;
	Mon, 07 Aug 2023 06:29:30 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qStk7-00GGm8-2a
	for linux-riscv@lists.infradead.org;
	Mon, 07 Aug 2023 06:29:29 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fe4b45a336so19112675e9.1
        for <linux-riscv@lists.infradead.org>; Sun, 06 Aug 2023 23:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691389764; x=1691994564;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z7rnWNHFUneQ3py2i1MBfIqg4WaLvrT3ZVmHSN5iKRs=;
        b=f8insg7X86ppQ5F6Ftef+QhplHoXoRQAMzFMVl2RdeVQ2Cn675LFV6uigapurhe9JF
         HldFfIEGHpm9b5MvBSH7/C8CfgQfXb8onmWizItMbRzFPNLH3NxRQxq2YoAxV/QUj+gj
         Xq/Plk9HWec7x3LlQUT7TSRVzSUprBMMD8NPtiMDhZybAJ00NaRZGmqzJvPR8Gk0Lxbr
         Uyl7qo33UrJBbDk3TSZiA2siPMr1VQVzjZH8dyblNByvz3N/Qc/V+KcDivWTUqazW/N+
         k8TCdZah0Ccmqhavl0s9AF+IwPvXKNFH+mx+WROAMFNaWNvOy4uRJJ1zIA+VaI+NQv/q
         Qlmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691389764; x=1691994564;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7rnWNHFUneQ3py2i1MBfIqg4WaLvrT3ZVmHSN5iKRs=;
        b=NkrUltba0BiHkt4EPNeGldWZTMowwJPbPicN8TBzG+EED1oL3VwS4QAvuSNmTZcO+g
         YcBidu7LU1CwaQXijtAaoV1h0ZVqjOJA5PtZsUwMV68FjwwjXTYnC+9Qs9kRo/Fp/Ih7
         cDe2Fvy2GSdp9U6H2x6/sdY9nn0JJgeEb2/Eqg9Uu3mkZWsvZJ/q0TYMDAgdmIGj61Iv
         Nhlf370Lw3/yUKqthV3jfz+ngRkwP5bm1aYtsvGIOLJvQ9+BVXJMLWW8QP/avzAzbWbU
         B++fjNtS/2bKgBe5Z0zJlXueiFL6jsELpWzHEEcYfuxoulnA4RcZnBSTL3jRLGGmHBbD
         88OQ==
X-Gm-Message-State: AOJu0Yw8Iac+oneBu0ED2SznI+yhYd5K3V/t0BLtRYdFixqkGFGM2KIr
	BkWg/cDXC17tkvlgh3NlP/lDaQ==
X-Google-Smtp-Source: AGHT+IHoV4+y4ygwE201jI1n35hdg8Xn3ESUU/xDOlVSMzH8Nm0HJsqGqZvTNuNydoy+mLFZinL9WQ==
X-Received: by 2002:a5d:6509:0:b0:313:ef57:5bde with SMTP id x9-20020a5d6509000000b00313ef575bdemr4758869wru.42.1691389764237;
        Sun, 06 Aug 2023 23:29:24 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id b3-20020adfee83000000b0031773e3cf46sm9393070wro.61.2023.08.06.23.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Aug 2023 23:29:23 -0700 (PDT)
Message-ID: <ca0b9a19-d7d7-80e5-f47e-f74615cdac86@linaro.org>
Date: Mon, 7 Aug 2023 08:29:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH RFC v2 1/4] dt-bindings: mmc: sdhci-of-dwcmhsc: Add T-Head
 TH1520 support
Content-Language: en-US
To: Drew Fustini <dfustini@baylibre.com>, Jisheng Zhang <jszhang@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 Robert Nelson <robertcnelson@beagleboard.org>,
 Jason Kridner <jkridner@beagleboard.org>
References: <20230724-th1520-emmc-v2-0-132ed2e2171e@baylibre.com>
 <20230724-th1520-emmc-v2-1-132ed2e2171e@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230724-th1520-emmc-v2-1-132ed2e2171e@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230806_232927_863628_1463C678 
X-CRM114-Status: GOOD (  14.63  )
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

On 05/08/2023 05:14, Drew Fustini wrote:
> Add compatible value for the T-Head TH1520 dwcmshc controller and
> thead,io-fixed-1v8 and thead,pull-up properties.
> 
> Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> ---
>  Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> index a43eb837f8da..57602c345cab 100644
> --- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> @@ -19,6 +19,7 @@ properties:
>        - rockchip,rk3568-dwcmshc
>        - rockchip,rk3588-dwcmshc
>        - snps,dwcmshc-sdhci
> +      - thead,th1520-dwcmshc
>  
>    reg:
>      maxItems: 1
> @@ -60,6 +61,14 @@ properties:
>      description: Specify the number of delay for tx sampling.
>      $ref: /schemas/types.yaml#/definitions/uint8
>  
> +  thead,io-fixed-1v8:
> +    description: SoC PHY pad is fixed 1.8V
> +    type: boolean

Isn't this duplicating existing properties for MMC modes with 1.8 V?

> +
> +  thead,pull-up:
> +    description: True if pull-up, false if pull-down

This explains me nothing. No clue what you are pulling and why do you
need it. Pin pulls should be done via pin controller, not MMC.

Anyway you should have here allOf:if:then (move the allOf: from top to
behind "required:") which will disallow these properties for other variants.

> +    type: boolean
> +
>  
>  required:
>    - compatible
> 

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
