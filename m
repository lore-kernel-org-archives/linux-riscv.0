Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6976ECAC59A
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 14:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3806Z+5HjIY3RU5p8qEfZhT689MXrSFAQXfllERBqtM=; b=DzbNizszGL5igD
	67/jX0ZU2l7985XNq3MkV7wRkE+d58PCmd7l5sWCopvoRDEZmhmjGHKLAeS2XmirSsU33/LuMC7o7
	1z1FpAKj9mOtxJcPCOZQs3aW7/hRVtV17qU8j/gA9LoAlV3MSkFij+ebD/ZQzyQ3LebvIkRPwIU9x
	GO0qWh3mpQaROwXEBmfqmRg6Go/EoA3qoqlZqQw9R+1N3LN+ZUofNUGM9ZGrz+oE8GBL2dgh0MQ9G
	Gu6JOWJNFT+FQf5jn4KlCGk774pgQ1cuiu7UU088PkAReOFIlktqi1LaUWi5GvDiNjttXflxqoYLF
	KRGkqB/QxrY9sX7C9g3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysqF-0000000C3gD-48jr;
	Wed, 17 Sep 2025 14:09:03 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysqC-0000000C3dd-2kO7
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 14:09:02 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-8876de33c86so484383239f.3
        for <linux-riscv@lists.infradead.org>; Wed, 17 Sep 2025 07:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1758118138; x=1758722938; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BwXs810vPVolctqhE5kX1kHC5K5g0mvG5ftVgYqmopk=;
        b=RKzz/LyPFWF+RC9oT/4UQ+76sVbxUYHSVd73Wk5V+tPiugQ5nLt1O8RZjjrDf6hWmI
         7Q+ZKqqHC5NfV7OzfxWXhJJC4fyT3NlWnem+3YHklzUaeMldMuR9C416oIJxbBpyC3fG
         /cK4FH4wxfgjhuNOjiJotXDr/5MsJqjkIxXVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758118138; x=1758722938;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BwXs810vPVolctqhE5kX1kHC5K5g0mvG5ftVgYqmopk=;
        b=sNakJOphZyNf+tRqEqvMBCZ6kon0Hw9Q1FSYjAusVB1dWvuW2u201lmVFNaldpw7/k
         tS7zyZfzpDmRZb3BxxgaC69xjT9dhromWlddX0rgyQ07gP9xLJzwB9U1uviIy1qKYrJ+
         SVyLcCzpD0a51lz11WeVkk6pBgdfusALrW1mujiZXy1HQWMunBHWntmb1eSIRW4UbVmw
         rZFZDbsKphDF7bDA//Gs78+esKg/rPtlTy7vURTpGuwrgWPARGO4KtehXyUmUooZPc7d
         7F//tfhjPmaFinDJ/DuNPecccxYEerYqEPvG3Stcd58ZQOMMOf9HyV2q0/K4ms5f1zYy
         /aCA==
X-Forwarded-Encrypted: i=1; AJvYcCWLR79kxhHqAcbiCEjUa9S3ZAstr07YEHww3OeYDJquxiBr7QC9EYf0OnozK4+F1RlHyecsVDXl9owB4A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGMUyIqcJed18Y6brsS2ip1bpUG3cBPICMFhZ0JwqzswxZEVTi
	KfqcloovrG+Ji7ysny/rNi/JzhPwOVZ5301FYS7cEqjBSxelqyntx/uUyAvaQtybJg==
X-Gm-Gg: ASbGncvmRfRlW1C/Wbjc7hkr74XbNnZ7NbK96MvCFcKu6UWfCscbX4bjfuzJEimFggd
	y5Y/5gmE4OywzMCZHSlXPcX1dO3fzd4/0ZdQlyrMEljMS1a7xYpdoTq58lXj/NtTTXN1G3KASQN
	ZQpSMlS9LavRO73NXBPJb+TWJ1SJ5q03PcrWIg/x8VPJpS0dQiCNOp2NdtuCSyFVe/L0i6Y03CT
	GI451sUkKWvDCpJTBM3dSDeqS48LCaSNJQsq/Qr6u8w39QIRGtaYaCWs2G+e8vTohSzw9YMRXMs
	56jEJ1XJz9EKFGH1lUFuQ/wykWIN4Qg044/oLzjh44KRM3zK/J9j7cfVvR63EOWB8vLVIg9u4y4
	B3+iaQjW+FaY+YiU+dF8krAWIniV3OxaqzU2S8FQUbM+nP2eu5DAMEI4378R7qck=
X-Google-Smtp-Source: AGHT+IF/fBkdFTD3FTvzdS8tc8bIkj0IKqMAIt/hH+T2GkDeQwHL7JRVqgSvOipa21x1SDVuYYQNaA==
X-Received: by 2002:a05:6602:3412:b0:890:1f62:492c with SMTP id ca18e2360f4ac-89d1bfab247mr324144039f.8.1758118137550;
        Wed, 17 Sep 2025 07:08:57 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.googlemail.com with ESMTPSA id ca18e2360f4ac-88f2fabe0bcsm648019239f.25.2025.09.17.07.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 07:08:56 -0700 (PDT)
Message-ID: <99168e94-9f32-458d-ae3a-55d0dcee3dc7@ieee.org>
Date: Wed, 17 Sep 2025 09:08:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: i2c: spacemit: extend and validate all
 properties
To: Yixun Lan <dlan@gentoo.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Troy Mitchell <troymitchell988@gmail.com>, Alex Elder <elder@riscstar.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250917-01-k1-i2c-schema-v1-1-bd276b366d9c@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250917-01-k1-i2c-schema-v1-1-bd276b366d9c@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_070900_795097_DF42AB53 
X-CRM114-Status: GOOD (  12.22  )
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

On 9/16/25 10:38 PM, Yixun Lan wrote:
> Extend the K1 I2C properties by including generic i2c-controller schema.
> and this will enable it to do the DT validation check later.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

Tested-by: Alex Elder <elder@riscstar.com>

> ---
> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: i2c@d401d800: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'pmic@41' were unexpected)
> 
> Link: https://lore.kernel.org/all/20250825172057.163883-6-elder@riscstar.com/ [1]
> ---
>   Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> index 3d6aefb0d0f185ba64e414ac7f5b96cd18659fd3..226c600deae142413277117e25baae09f0918381 100644
> --- a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> @@ -9,6 +9,9 @@ title: I2C controller embedded in SpacemiT's K1 SoC
>   maintainers:
>     - Troy Mitchell <troymitchell988@gmail.com>
>   
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
>   properties:
>     compatible:
>       const: spacemit,k1-i2c
> 
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250917-01-k1-i2c-schema-faf6715d7b88
> 
> Best regards,


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
