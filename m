Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1ABD3B7D3
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 11:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eBPtjNd5p0Hu7TMVIOF7T7vYK83TdG9v4n3WVJQoOLs=; b=G/8NxrzNHChNaR
	Y2NziPRR7DdKhsqItyElaqLRZvGtGrwND92NR0Uo94aHWTlGienFx7dTwUoX44eRXSy4/ZZL9PKo/
	clTgQMnCY7Tzf4FVTO/zYBzj9zJTO8GXtE1agAoG6IO8VVOtS5bhDMyWpdlUhSFZwkNr8isnnaR8c
	RjLad/nbd1SuROB8ckaxpstZpKytDqAu/cAtdLLYsT1CUu+ktHmMOKc1GmczjWEZClFvQZbTnDQvI
	UxyQWyghRboDLriB6dUi7eiWqy0uxr62e1VglG1SU9D7U9ZnI+C6mYXtsBY+lFM6JjegtsjrYWViE
	/HMj+ZW/obhvAEQNGb1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRqJB-0000000ArMs-0ioy;
	Sat, 06 Dec 2025 11:18:37 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRqJ9-0000000ArMT-1nmK
	for linux-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 11:18:36 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-42e2ddb8a13so1411461f8f.0
        for <linux-riscv@lists.infradead.org>; Sat, 06 Dec 2025 03:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1765019913; x=1765624713; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SbIrykIurPy4cu/aMennF9ioW6dMGtNcboFPZcYKwp0=;
        b=GAZz80YiesrlOA3ckgrtyx1Efcjx9n4kti2CThr+nuA4GhTFUZVQU2c3961xn5K6PR
         DlKM3QTi+a6ZkfYqSkVZDKv0HeZUHcel/2dqz6oOkZvuWsoXzS4kSSPAAB2IWyY59t6d
         +fg0go0qjnos8Ghn8ej9mbI5Pg9+OYlyM2I3L8mLFO/pBjleSjwAGzeSjxiu+nEExhxM
         /JiDnzwGJLk78hLyTnK0HO1F04GLaYAfmiqUAIWCUzhdoB4LQyqS4B0tCBQLOKr7fq4N
         XvpoNIZ3Nuc8ZOJVaf/TchAYdH6zffyBL0WfMvD1fR+jG9pbS0pmZX+lOUY8SP9ouiZH
         gW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765019913; x=1765624713;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SbIrykIurPy4cu/aMennF9ioW6dMGtNcboFPZcYKwp0=;
        b=d6Hrwdo4n/IflF6nRBUYeBgt+I3xH4Qzd+Zutj7EKXX3scjp356TliZ5NumznrvRf+
         65/eDbYR4psBTPIj5OHzIxMztIqnPYl4NTkAW6txd0vJKFXPVpNaSZZPjH/O8qXqwlGy
         xIwpPv7G6ZEzx9mX2V+Lrm1orca/29TOsECv+CAQuk0FfyKriTFbOETerLYiuXN9AYwu
         oEMKKKJPV3nbapwah2zDl0ONsehciwPzRlaKSrFJxqdlccYFL+WOHy40VswXVrek8nt4
         crvvbYC1UiRKH2eVDUSBqxc5raWFHGcQSbj6suVmXcV7KIn/4drbF4oNkwN6K+xn2RXf
         NdbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXE1OZE09swbeF4mnJ36npnH5LNLbj6Vgwe9d52IdKduBc+b24NJY7Y4ACHOBCQ94G5PTpRSoN7fUQfBw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yykey1pY8RLFc4IvfKRvR8ycK+E8Qoc/60c/pkSM5GHDPHC38z0
	crZwJDWBoEHrlbAL4RVLycIeUKYzVGyD3KI788KeGS05PxaMzIZQJobB8/EANFk6YUc=
X-Gm-Gg: ASbGncsVCbcFTKIQyd0rB+v8X2LjIH2ejBJg3x55WQFNiJqlGKL+vcxEATWeEDYeJkd
	0Gz1s3ib8NpY+aFUpzU5cpgfvVsxmwkVY2CkDgJDrLxsJwFEC5dCzWB0A8WtP07x7UqDCnJehhD
	4CJxhmWgMnDqL3ezr5u2dV8NAwopBRGvSWSZlTD1dSB5q27tm/jwYsFDvt59ZvkzGDrBT8Psedq
	m5lE52XIO5uhZpM34n9927pT3XqolHeOAPXUleC21CpDbOFi0340k3NKx0yOIxxVnR7WBdSfEBC
	yU1+uy2f+Wi3GXj1JbDbK80Y5RpE41TBeYsPUdRimBovM8Z6jdLO/ApKmAVwKyvjpspQny+uONQ
	8s4JmIL3wcl7V69cpWB9WJAygwNvYfQGMZzvH43mIXZO/Q4gVTuAuIwYnbFGa6hEtDHIQk21hND
	wZH3eb9c6tYJokmQZF538=
X-Google-Smtp-Source: AGHT+IHr7mdkZZdTGhGHXhCyqOpNz/L+eCosT1VVgSOrplrijDQwbTIlvnGL9FzVzlG1uTFmo3H5MQ==
X-Received: by 2002:a05:6000:290a:b0:429:d565:d7df with SMTP id ffacd0b85a97d-42f89f54886mr2311030f8f.42.1765019913538;
        Sat, 06 Dec 2025 03:18:33 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d353f75sm14403593f8f.42.2025.12.06.03.18.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 03:18:32 -0800 (PST)
Message-ID: <86bd75e7-1191-458d-b71e-c3cecb960700@tuxon.dev>
Date: Sat, 6 Dec 2025 13:18:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] clk: microchip: drop POLARFIRE from
 ARCH_MICROCHIP_POLARFIRE
To: Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20251121-tartar-drew-ba31c5ec9192@spud>
 <20251121-prude-dilation-79d275fec296@spud>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251121-prude-dilation-79d275fec296@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_031835_515091_0D449C8E 
X-CRM114-Status: GOOD (  13.74  )
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



On 11/21/25 15:44, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> This driver is used by non-polarfire devices now, and the ARCH_MICROCHIP
> symbol has been defined for some time on RISCV so drop it without any
> functional change.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/clk/microchip/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kconfig
> index cab9a909893b..a0ef14310417 100644
> --- a/drivers/clk/microchip/Kconfig
> +++ b/drivers/clk/microchip/Kconfig
> @@ -5,8 +5,8 @@ config COMMON_CLK_PIC32
>  
>  config MCHP_CLK_MPFS
>  	bool "Clk driver for PolarFire SoC"
> -	depends on ARCH_MICROCHIP_POLARFIRE || COMPILE_TEST
> -	default ARCH_MICROCHIP_POLARFIRE
> +	depends on ARCH_MICROCHIP || COMPILE_TEST
> +	default y
>  	depends on MFD_SYSCON
>  	select AUXILIARY_BUS
>  	select COMMON_CLK_DIVIDER_REGMAP

OK, I found v2 in my inbox. Same symptom here. It doesn't apply on top of
the current at91-next either.

Thank you,
Claudiu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
