Return-Path: <SRS0=mXjn=FO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81896C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 03:56:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B92023BA7
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 03:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B92023BA7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S6IKexSO2DxvloazZB7pGuRWLSdZO+nSlQKi3Ezn/yk=; b=dz+jk4w5hyXQlE4tNpqRC9VkU
	TGhm9h3hSpC2X7G6QP+T9mx3+uYu8fg68MnGNUbzu8Hcue0eWz78tAPbYBvbt27+RJKEth0OxwWun
	wPLQ4Tq8iMVKZd9TXL6Dqnw5zM8zqbe2FOkFvvkx5rw10kdEZXfI3c0Sooc/QgNKZikKpR8uO5kTh
	KMkvlj/VGYgG3f8Ozc4x+3+9AkZ7igXGhyVsteFJWU0s9WMOfYhy+g2B2pc5+oI1ZzZIIQ535u8Q8
	AjvCXxVrZGXJ8Jkh/GRWomKwvSJN8DrNUFE4mqM5tzZDWxmfpcWSlkICZ+B9J9yqLA/k5myv2c/b7
	STHqDLsdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knD4U-0007Th-Jc; Thu, 10 Dec 2020 03:56:50 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knD4S-0007TH-G4
 for linux-riscv@lists.infradead.org; Thu, 10 Dec 2020 03:56:49 +0000
Received: by mail-ot1-f65.google.com with SMTP id q25so3645791otn.10
 for <linux-riscv@lists.infradead.org>; Wed, 09 Dec 2020 19:56:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XtgXKp72oglbFgMKvdSmrdvqmjrEw3HulhGPrudWit8=;
 b=Hiznomb/i25EjvBqwxX9F6v03dUJiXDcm7taEUIZivONzxubTElBuxK5NogMox3/Sv
 6ljzFEIflD9soEVwvCtF+aYL0RK+LLsAFtEYxXqLnSKrVj5LCs9t236zjqXm8SSxAYps
 DX7M1JcB3aFCng+v40yXjmI+1j9vWXQQXXe65NaaysaNWg0FeSDsBZum+0aKvV5oknRG
 ZdLZC97+bIAkL4kDyrkeSWD4Ala2F2giUFJ4vUJYx08geRTO50plpehV6iR+I22bLZHP
 o47D1v1sbTnLf/PEpKcVa7cXAoqqPIA3Q1v2rdcJEGJlWhjNKSC/bmDpw4nWFBijPWxA
 6ulQ==
X-Gm-Message-State: AOAM532M3ZJbvVjdMdrZr4aTxOg8tKn2LVMB6EhnDWztv3BIWSR6m/xs
 ZanzqsV/Rhmhhr9l8hfzYg==
X-Google-Smtp-Source: ABdhPJwF+nB/RMncluIRA2teA/Ygf1vGV5BQp4zYvTL+YR0/LAFf2ZKZWtKezQ2tAQo45UiQ9rIG5g==
X-Received: by 2002:a05:6830:1d0:: with SMTP id
 r16mr4509553ota.54.1607572607747; 
 Wed, 09 Dec 2020 19:56:47 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q18sm763803ood.35.2020.12.09.19.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 19:56:46 -0800 (PST)
Received: (nullmailer pid 1634187 invoked by uid 1000);
 Thu, 10 Dec 2020 03:56:45 -0000
Date: Wed, 9 Dec 2020 21:56:45 -0600
From: Rob Herring <robh@kernel.org>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v2 3/9] dt-bindings: pwm: Update DT binding docs to
 support SiFive FU740 SoC
Message-ID: <20201210035645.GA1633151@robh.at.kernel.org>
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
 <1607403341-57214-4-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607403341-57214-4-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_225648_656113_272FF19D 
X-CRM114-Status: GOOD (  16.28  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-pwm@vger.kernel.org, peter@korsgaard.com, aou@eecs.berkeley.edu,
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 bgolaszewski@baylibre.com, paul.walmsley@sifive.com,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, andrew@lunn.ch,
 linux-gpio@vger.kernel.org, broonie@kernel.org, thierry.reding@gmail.com,
 linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
 u.kleine-koenig@pengutronix.de, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org, lee.jones@linaro.org,
 linus.walleij@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Dec 08, 2020 at 10:25:35AM +0530, Yash Shah wrote:
> Add new compatible strings to the DT binding documents to support SiFive
> FU740-C000.
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  Documentation/devicetree/bindings/pwm/pwm-sifive.yaml | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml b/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
> index 5ac2527..84e6691 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
> +++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
> @@ -25,12 +25,15 @@ description:
>  properties:
>    compatible:
>      items:
> -      - const: sifive,fu540-c000-pwm
> +      - enum:
> +          - sifive,fu540-c000-pwm
> +          - sifive,fu740-c000-pwm
>        - const: sifive,pwm0
>      description:
>        Should be "sifive,<chip>-pwm" and "sifive,pwm<version>". Supported
> -      compatible strings are "sifive,fu540-c000-pwm" for the SiFive PWM v0
> -      as integrated onto the SiFive FU540 chip, and "sifive,pwm0" for the
> +      compatible strings are "sifive,fu540-c000-pwm" and
> +      "sifive,fu740-c000-pwm" for the SiFive PWM v0 as integrated onto the
> +      SiFive FU540 and FU740 chip respectively, and "sifive,pwm0" for the

Better if you reword this so we don't have to update it for every new 
compatible.

>        SiFive PWM v0 IP block with no chip integration tweaks.
>        Please refer to sifive-blocks-ip-versioning.txt for details.
>  
> -- 
> 2.7.4
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
