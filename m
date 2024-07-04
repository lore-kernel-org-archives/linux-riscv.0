Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CB6C2BD09
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 00:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q//40cqH0/k20HyPLsHg/+Mw/KiHp6rDi7GIBUSrjhQ=; b=Urj5jJMVenouis
	1rgCVeXnJQjhZScxXc/zIArz2d0OwO31J5TV3zAV0LYJAnoNyapNWJL3pJ0z7Lm1IobyzNES2bCCp
	5v5+beTMtrtszWXvT0HPy+VMV0RzfMTZVbeeYzIZ4xqK8RIXQTLRyjOYXO/fIZOgHnSIcWT8P1UcM
	o17wYcfOFsbyGQL/2rQng3uOur8cPB8Lot0ggISo60YXTukuPrcoBZue1CRRiMhzkkj/M5ODS8Wtu
	DD/M9inBjVjokxtevRHMK4csP3hTe8AFzDf9rH4fk+CqQbUJdx5gkYEH7T+6PaD3btC+fm6La0GAg
	zDPgPuWeX1GTb6nUG/6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPAeT-0000000BoTC-0AWW;
	Thu, 04 Jul 2024 00:48:45 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPAeP-0000000BoSU-274H
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jul 2024 00:48:43 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1f4a5344ec7so926445ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jul 2024 17:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720054120; x=1720658920; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j8cn2ejmCXJ6G+eZPnZq9ZYI/4KIpY2mI/Ezi+jalfM=;
        b=ZTIU2g6sx2qW1uows7/dFR4YoNy9jiB4ON2m4Pr2d4cYd2jRSI2QZXRRPA6zm9zP6v
         gBDfDgqsIThRKK+zoxnr/ffsPE4TJVA7n7mZil0rRTSeLcdGoiSbv5qnlXrnMFxXmzk+
         IhnG45E5Tdv8IHqWtohRmi2iCY9mYrICcRuB4P6k1XAjQyDcbLDNCTKCCAnr32hZi4MS
         ORDfIQOOjPrLf7ISxUlH2VBCh5QcsrbMZagIGH/1SyMMZu5kYkn6pZ8uTs0y3WSdrYvn
         jPCGMTkU/NveRFGU/icc5HO3ooLp61rSVAki+QYzjqMaevafqc93R8qced8lUJZDy9Bm
         k5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720054120; x=1720658920;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j8cn2ejmCXJ6G+eZPnZq9ZYI/4KIpY2mI/Ezi+jalfM=;
        b=O8o2IPpm6QPYyCmYjncpjgAI7+Brbh32KLqHos35mX+Wxn5LygGfJ22QRjExR7uk81
         fhxYdG2xqk+lqWd+0MlX7Lan2mxGpTZhIgXpWak+BmavuNYZnprQ4ljbU5GuUks6z+1Y
         S1O+uiGL/PHHtyNZg6eac3jRI103e0+TRpc6urk1aEOhbFIS6Y2I6zX6m9sHL6/UdvY9
         Vbcy9iLFQZISgiMBgqKGWfgGter4uZ/KfwKIJ+fw1djHjFUJ0uGQAbgtyGEyfkqJitpK
         4vvGyCpFQrJESKDVBluJwGgU8ZC+DZKFrt9tpuYBv5lJUOy+JyDAAOUCMDIwuqHpKYs5
         kWhw==
X-Forwarded-Encrypted: i=1; AJvYcCXpnVCqqdQSICExO0vcLIZqGWvwoPwpNF4cCp9zjpIzLbjSLLT/yIFG/K2PFfFV8ZcDZcelSY4ImSoWDOiFwJQDx0bwWjFBFtrlhK08H+GA
X-Gm-Message-State: AOJu0Yxq7PLg6cSrf8oF30A+2WvZgKGot+jWE+CU2Kv879T7s3Ow0p6E
	S2qkxQhTjR3HBNTe23m/s7YuPkY02fLhZ5Bj7azUSkbH6d/2prel1dI5jD+Jb10=
X-Google-Smtp-Source: AGHT+IFZ3U86C/lboDH2rxZfJ1yaega9D0tCmZ+SV9C8fIfhnpir2evwRGIG7EXufs9qWN9lYP/GPg==
X-Received: by 2002:a17:902:d583:b0:1f7:1d71:25aa with SMTP id d9443c01a7336-1fb345044a2mr2175645ad.6.1720054120423;
        Wed, 03 Jul 2024 17:48:40 -0700 (PDT)
Received: from [10.4.10.38] (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb18b1fde8sm20274345ad.297.2024.07.03.17.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 17:48:40 -0700 (PDT)
Message-ID: <6be424e0-c746-48e8-94fe-8d5d2eb6cc03@rivosinc.com>
Date: Wed, 3 Jul 2024 20:48:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/11] riscv: defconfig: enable SpacemiT SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yangyu Chen <cyy@cyyself.name>, Anup Patel <anup@brainfault.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Samuel Holland <samuel.holland@sifive.com>,
 Lubomir Rintel <lkundrak@v3.sk>, devicetree@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-serial@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Inochi Amaoto <inochiama@outlook.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Meng Zhang <zhangmeng.kevin@spacemit.com>
References: <20240703-k1-01-basic-dt-v3-0-12f73b47461e@gentoo.org>
 <20240703-k1-01-basic-dt-v3-10-12f73b47461e@gentoo.org>
Content-Language: en-US
From: Jesse Taube <jesse@rivosinc.com>
In-Reply-To: <20240703-k1-01-basic-dt-v3-10-12f73b47461e@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_174841_802341_8EFDA04B 
X-CRM114-Status: GOOD (  13.27  )
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



On 7/3/24 10:55, Yixun Lan wrote:
> From: Yangyu Chen <cyy@cyyself.name>
> 
> Enable SpacemiT SoC config in defconfig to allow the default upstream
> kernel to boot on Banana Pi BPI-F3 board.
> 
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
Tested-by: Jesse Taube <jesse@rivosinc.com>

Thanks,
Jesse Taube
> ---
>   arch/riscv/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 12dc8c73a8acf..5287ae81bbb78 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -29,6 +29,7 @@ CONFIG_ARCH_MICROCHIP=y
>   CONFIG_ARCH_RENESAS=y
>   CONFIG_ARCH_SIFIVE=y
>   CONFIG_ARCH_SOPHGO=y
> +CONFIG_ARCH_SPACEMIT=y
>   CONFIG_SOC_STARFIVE=y
>   CONFIG_ARCH_SUNXI=y
>   CONFIG_ARCH_THEAD=y
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
