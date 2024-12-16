Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3AFE7717F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 22:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uZBEeFJgQSIfqMSsVEa6Gd5xv9FioExgmFSxp7xlS7Q=; b=m2w7TB0dnWi2NA
	ct1r7D2KHPAN3i7xYvIOiFKWURZA/HMyNqv3iV9pms7z0AL88HneoMi4mHPfJgXcT1J9WVVyM2rwL
	8NL9E8ZHoWJ4nsx8CocQn+JxtqzBtMdULAf1G40BDlMfXzSqaYRaEmyXre+ARhFWKF6Dws+cncPcv
	ERGD4hUWSxKu/iA1l6phXSkTfzs3k1P/4ydPtY6k5IqgyWFVk6gi96Nrot6KUVmcXFphlYncLAEzJ
	PW5GcwOKT0ZqzET2ZczNuo6Sz+F1W5PAoHYcg97zKIsfD6iIOGGoafieKITRTWoQbqJEsmgl5P5uS
	/euRbP5coqDGl+ShzSKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNJ8I-0000000BVXU-2FrF;
	Mon, 16 Dec 2024 22:00:06 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNJ8G-0000000BVX6-1Dgu
	for linux-riscv@lists.infradead.org;
	Mon, 16 Dec 2024 22:00:05 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3a77980fe3aso15223285ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Dec 2024 14:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1734386403; x=1734991203; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M9GAPUOnO/AZAUr8mlWdqcXEUNfkQg4dQQPEXS1LGaw=;
        b=R7NiSKSWhHbClrZeJW0NH6xwpDTJqFUNBuR8Y6Ae4qbhMdwh+m39E8noLIBCqBuDdA
         yii5KcNHP3t2Xe1HOFtyxkl1uUaipNHW36c2npJKYPmhoQYqTr394nu9FtagybE27Nhn
         /0XBUkpRJJw1MkVWiY2UsfJSh+t2y1kNssH0iLydpJg03HaCB0KoSofaoMjAKnmc2Rh+
         tPENv3JK5esbFrcA+qbzq1OcKxDeWv6L7pUJf308qkC7ySMYzpQAuv8jOsTDbabTAIqK
         f7B/dIr7E8D7dEFGuvdjWcAF3Z9WgxGmiKnDf02NdHC5R1Z4v5xGB5p4naAwt7tuUkbW
         qh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734386403; x=1734991203;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M9GAPUOnO/AZAUr8mlWdqcXEUNfkQg4dQQPEXS1LGaw=;
        b=oIKkjUjSImLYH2IzC5kfGlQZW8PwgF1tId1uvC+YCUxaa+N57da45eIYAbtO8qZZQA
         qD7T1S82tUEEGnxEOEtgW0Vob3qkhGS/y8ncNnf4Ap+Kbyq3vugS1EO4gZj21NfaQ4vp
         mQ05ZuvgKmhyurtmcwkFmhHhulcy6o+wWWlA+9uRlL+GvjOhuqz1Bk7eSvvix9m0PvUo
         +x5J/YkO/Dzzh9l18zdleN3xTHsFMKemGfsRtrFuZT+uiCPKgUojWr2x3wZqQ3fkqwKi
         /l/4IZDoJR3F4FTqjvOW/isSpU/jrpawpNe/D5g4VxPF0Et3Ktb4El5NGSo9SjS3oVSM
         NLnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIzXcmCBVCfEZ5WRBC1jl4RhX/AHWwmCpb4/EQOBtoHzEvbXyz+Kkg6Ox1lCQ7jhf80MGsrsHa6kaIlg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFKyB6DWk88wXFBUZAMMHOjUCkG30LlOsdVuJV5DJEdgkwzWEO
	jyFAdGo9svvt3brvxWbBUD82zvSxrKaVm0P+xGRG2gCtr8fTGJ9kF2V+oss8yxI=
X-Gm-Gg: ASbGncvZwNItZDf7BNIa5oaLGu7D/ru+wJrfh9Wj0OUpo3/xYdPxPSpYDwuM5pX09TQ
	Ezbxx6Gj4kpBjwgj/FxuKiwo7FI2tzaakoxlbWt6xPy29X2puqXH6GZXJ9aVRfRivMUFru4AZFw
	LXK7hfwxk5pYGHjd0cVc3sJ82XyFwFjDgaNgYPAotWfhseo6EcHlOfb4hvPhyqh4lpMYpSoAcUd
	9npvzhhXZsNLMP5GVl+ioo42YcoiWu+QvAlN7WG+8mmZxBtE9YcchrbwQVpKtyVuyzW1kUT49zY
	PfGj9w==
X-Google-Smtp-Source: AGHT+IHIM+DoAUO4uH+jY49Cft/09OtchiEcCTITNYy9jOukvV//rMl/YNzathv8XDZ/7POhKMPjZQ==
X-Received: by 2002:a05:6e02:18ca:b0:3a9:d0e6:abf2 with SMTP id e9e14a558f8ab-3bb0ac12780mr11516415ab.10.1734386403225;
        Mon, 16 Dec 2024 14:00:03 -0800 (PST)
Received: from [100.64.0.1] ([165.188.116.15])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e5e3c69e2asm1403241173.138.2024.12.16.14.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 14:00:02 -0800 (PST)
Message-ID: <5e878b5b-b49d-4757-8f7e-4b323a4998b3@sifive.com>
Date: Mon, 16 Dec 2024 16:00:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: riscv: add bfloat16 ISA extension
 description
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Chen Wang <unicorn_wang@outlook.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <cleger@rivosinc.com>, Evan Green <evan@rivosinc.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>, Jesse Taube <jesse@rivosinc.com>,
 Andy Chiu <andybnac@gmail.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
References: <20241206055829.1059293-1-inochiama@gmail.com>
 <20241206055829.1059293-2-inochiama@gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20241206055829.1059293-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_140004_351191_915E6BBA 
X-CRM114-Status: GOOD (  15.58  )
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

On 2024-12-05 11:58 PM, Inochi Amaoto wrote:
> Add description for the BFloat16 precision Floating-Point ISA extension,
> (Zfbfmin, Zvfbfmin, Zvfbfwma). which was ratified in commit 4dc23d62
> ("Added Chapter title to BF16") of the riscv-isa-manual.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index 9c7dd7e75e0c..0a1f1a76d129 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -329,6 +329,12 @@ properties:
>              instructions, as ratified in commit 056b6ff ("Zfa is ratified") of
>              riscv-isa-manual.
>  
> +        - const: zfbfmin
> +          description:
> +            The standard Zfbfmin extension which provides minimal support for
> +            16-bit half-precision brain floating-point instructions, as ratified

I think you mean "binary" here and in the entries below, not "brain".

> +            in commit 4dc23d62 ("Added Chapter title to BF16") of riscv-isa-manual.
> +
>          - const: zfh
>            description:
>              The standard Zfh extension for 16-bit half-precision binary
> @@ -525,6 +531,18 @@ properties:
>              in commit 6f702a2 ("Vector extensions are now ratified") of
>              riscv-v-spec.
>  
> +        - const: zvfbfmin
> +          description:
> +            The standard Zvfbfmin extension for minimal support for vectored
> +            16-bit half-precision brain floating-point instructions, as ratified
> +            in commit 4dc23d62 ("Added Chapter title to BF16") of riscv-isa-manual.
> +
> +        - const: zvfbfwma
> +          description:
> +            The standard Zvfbfwma extension for vectored half-precision brain
> +            floating-point widening multiply-accumulate instructions, as ratified
> +            in commit 4dc23d62 ("Added Chapter title to BF16") of riscv-isa-manual.
> +
>          - const: zvfh
>            description:
>              The standard Zvfh extension for vectored half-precision
> @@ -663,6 +681,33 @@ properties:
>          then:
>            contains:
>              const: zca
> +      # Zfbfmin depends on F
> +      - if:
> +          contains:
> +            const: zfbfmin
> +        then:
> +          contains:
> +            const: f
> +      # Zvfbfmin depends on V or Zve32f
> +      - if:
> +          contains:
> +            const: zvfbfmin
> +        then:
> +          oneOf:
> +            - contains:
> +                const: v
> +            - contains:
> +                const: zve32f
> +      # Zvfbfwma depends on Zfbfmin and Zvfbfmin
> +      - if:
> +          contains:
> +            const: zvfbfwma
> +        then:
> +          allOf:
> +            - contains:
> +                const: zfbfmin
> +            - contains:
> +                const: zvfbfmin
>  
>  allOf:
>    # Zcf extension does not exist on rv64


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
