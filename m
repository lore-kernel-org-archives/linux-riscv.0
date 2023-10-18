Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA04ACDB482
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 12:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CRfk0EKk3Uj+HOSpncNAJ13gmrgI2fyTqWB59KW6Gw0=; b=ddrZBV5i5UcTIa
	CX0GXiVRtBZ3AG6XgwhgBoyncELq9lxv1jG07mouVqNrcgUArbbfOrQ1WQ0elPWkclh1dJQgrnRMb
	dmKRxwkNmWavc0Z2DyVJ7cHmuCOzcm6ropRFeFH/4a7kB16FVnGqRQABL4Oxk/rQ8mrZe5cwDyGcL
	HAs5FcNN5zK2lhPDvCS/jLyBmannX+6KuERkauPxJmquSJ5RVZV+7GzLQm1qZ8G6EM3Qe3K+qZmhE
	jNzIJXZ7Aa2Z0rvzwD3lYWkKqXbO+KkoqNv9iFioQZT+0GO7rmTQNVj/7FJFysw9p7slOIqxN3jSM
	+FvpfxpS0RpTSdSq1N+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt650-00EiFw-1a;
	Wed, 18 Oct 2023 12:55:18 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt64y-00EiF8-1R
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 12:55:17 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c16757987fso89392251fa.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 05:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697633711; x=1698238511; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uP/iQJcAmUdu68ssZHPZrdd4ptBVUKj68nXmBCMtBxU=;
        b=ffHQvn2MyG2WYLgV8+HS1pRjJ0seymvcx+Pe7k8yL0YVbebQm5uBm+3t6XDj5KdGCK
         Wul/i4uX6z8BMuxgioNnoSbPvP46Hii+jn3iOrneL3goqEQSRzZHJxccxrfd8//t8zar
         a0xLubdl31+G/fPBrzU+BAN8ZfBiftVQptFKV/FWr6SFtH834lNIb2TAhqJ8agKpDjhJ
         SZFCdqwMmE7sTtuyAl0hVn2dpS565wKNO8hLjxonbQrfVcoPP2UOo4miHUHuH8LAE+cS
         Q57M9KOL3L6YdwwFrLGBi5YZSNFpIH9FqEa0HCv7PHj3z3Vde9Z5XHMRAbdpYa6IWRXO
         TV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697633711; x=1698238511;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uP/iQJcAmUdu68ssZHPZrdd4ptBVUKj68nXmBCMtBxU=;
        b=sHvK7lfuTGggMWOXmbFY7eWiwuZ+lq0tdRLUJjLWxtGTPkFNKuX8TA2gryDWwQg4eO
         MX1ukqhwUF4BD7/96KOCv9oxnyq5mwUiDSxZVJ0TztqVmQaNIouu8Ttti51mSJccqDZn
         J0QxgbBGQABevP4aoruZUUZaPrU/c8ASZJMoWAWldTFAlg94y+HuSD2H8hW38jo4OxnC
         yuwrfx1MG1Nnd23/V2tGECO4qzJ4o74pMw0QWik498tnrHSoLsoJiMl7EiSFnTlPKI9F
         27uVLY98rLgxb1Dl6kNwJuMaOXueUnSCAqFKOFBrULV/n+m67XELfZLFCpHm93bAk+c3
         wmtg==
X-Gm-Message-State: AOJu0YxpbTDkjsKNpqAFJrDWKgalijnonTXVTeEsaP5V0UdVrrVBEpH8
	R3PP5TOd8Zb/FA+uIY544hjvbA==
X-Google-Smtp-Source: AGHT+IFWumGLHPWcP+7vt0SmuyKIIGiylgJlngVINwzYBdklitj10I81dEsWPihspKesXCMdojQUGw==
X-Received: by 2002:a2e:9b53:0:b0:2c5:1e3f:7379 with SMTP id o19-20020a2e9b53000000b002c51e3f7379mr4260744ljj.48.1697633711578;
        Wed, 18 Oct 2023 05:55:11 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.154])
        by smtp.gmail.com with ESMTPSA id i18-20020a05600c355200b00407752bd834sm1642433wmq.1.2023.10.18.05.55.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 05:55:11 -0700 (PDT)
Message-ID: <d2b099c7-fd62-46af-b592-525b69aa8726@linaro.org>
Date: Wed, 18 Oct 2023 14:55:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] riscv: dts: sophgo: Rename cv1800b device tree
 file
Content-Language: en-US
To: Inochi Amaoto <inochiama@outlook.com>, Chao Wei <chao.wei@sophgo.com>,
 Chen Wang <unicorn_wang@outlook.com>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <4d98aa3b-003b-45e8-9a85-db07af73aa8a@linaro.org>
 <IA1PR20MB49530B8580E22AE664B8D59FBBD5A@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <IA1PR20MB49530B8580E22AE664B8D59FBBD5A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_055516_495538_375F6C6A 
X-CRM114-Status: GOOD (  15.46  )
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

On 18/10/2023 14:37, Inochi Amaoto wrote:
>> On 18/10/2023 13:31, Inochi Amaoto wrote:
>>> As CV180x and CV181x have the identical layouts, it is OK to use the
>>> cv1800b basic device tree for the whole series.
>>>
>>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
>>> ---
>>>  arch/riscv/boot/dts/sophgo/{cv1800b.dtsi => cv18xx.dtsi} | 0
>>>  1 file changed, 0 insertions(+), 0 deletions(-)
>>>  rename arch/riscv/boot/dts/sophgo/{cv1800b.dtsi => cv18xx.dtsi} (100%)
>>>
>>
>> If nothing breaks by this commit, means the file is not used, so how did
>> it end up in the kernel?
>>
> 
> This commit breaks the including file cv1800b-milkv-duo.dts, which is
> fixed in the next patch. For cv1800b, it only needs to set compatible
> strings. The cv1800b and cv1812h have identical layout.

You must preserve bisectability.

> 
> I use this commit to avoid wired output provided by git and make the
> change more clear.

Don't do this. Previous patch was ok and readable. I don't understand
how this split helps (except breaking bisectability).

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
