Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0E0C04FFE
	for <linux-riscv@archiver.kernel.org>; Sat, 11 May 2024 18:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rj2c4OdrX0JrL2IinQT6+4l7KibgbJlZWpyrdh5i80g=; b=pS5Y88hPZrECjo
	9I5+dOlsQljvPNKDODHM0WVnLHicA9f1ybLc36+110V7pAtSmCH3Gm+82yDiL07XqGgQ3zjeWDHvM
	yHvkE90R5AYTRD5vbpA81O7qNWvBJ4HXngkKzjTFjmt611cCKHt89DuTArP+9NQIqJtoRNWqaARGF
	NSSDcDsqqxDqTRK1IkLB9FrNYaOPRjNPbR0/0jgGpxkQ9FrCiXDgP0QNvT9K6KTJknan4g7xAB4ZR
	Y4RWA6AwvvvaFBC/lqa8gX3oDpm/rz/aVqzs8Z6dn6MZhAlfeDXdAYw70xYh7jSfHeA9IOMnsLLN1
	jwK6gvPxDHIfuYVHMS2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5rkc-00000008URA-2Kz6;
	Sat, 11 May 2024 18:47:18 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5rkY-00000008UQc-3RwZ
	for linux-riscv@lists.infradead.org;
	Sat, 11 May 2024 18:47:16 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-36cca20ae15so5661345ab.2
        for <linux-riscv@lists.infradead.org>; Sat, 11 May 2024 11:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715453232; x=1716058032; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aOG++vk1i0/Hd88Qn0YDT0yQo3hdTXW2k/18QZW7zOU=;
        b=mb4UXk78wRdn7uetXoJGXhUC3mYo44MvW6HW/yeJ/BL0l+xVrE0UL5yvLtqZ4ERVU4
         tTeP3CWnqymWPgyspycE+19rRlw6e0CziATNqQlHxvM6XOv/GnJc7X2BTsxq5p+i+/AO
         s4mPh16zIjbObnBS/HrGpnYJo30YD1AoUMMg5DecVXubRz2sNDyeqvj7VXJozO3O9sXc
         ViMnuM5Id0SUhj6acN3EAgiQ0xM2WYPms4ybiwFNvOBOKQoajfpFNmF88R0e6Nd0iH8J
         Me+QHRAXCqKe3IB6mfZUlIz5KpqDuC1pL2hYyXBx5J7NRUJD3+panC0XN9nVDxwaPpNQ
         9TKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715453232; x=1716058032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aOG++vk1i0/Hd88Qn0YDT0yQo3hdTXW2k/18QZW7zOU=;
        b=bV0nkg1flP46oUeKe/Qu8QlAonOP2e1GtMPHScQ/t6+8vua5bDxA3gLkSqpMCINLHS
         OXxyHBN4zWUOGNIjCsLd3ItXle+9wig5ykbuNCay55XvGXt2bdjYE8/pVGEVQskfoGa8
         KZK31MXz/eByXD/7V/QM75e6WoHb/63GzbhxPTk6mBx1Ea7BFxHoepSOA0gqONLMP7P1
         fKYOJPi4ZT2nOt0lnLTxvqA6KPbhmgjoiUfPkg/p/aO+tjPdbDl04lrNNYlNyn354Zz/
         bR6fqX9xbqDY88PbfhBqgWENEbCZKoZiVIS8KfGKuJg3WDputgYDAdSZbDm4uLIN1K6D
         rVjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjL/Zw7LwLBxgAn677H8Rx3lVBs9fdNADArmzqeOhpkw23yEAzv4UImk2WZ313/pSQPOUe44Y73/l2wmrQLdN6zzqBl2kCf9x8c8iFHzTx
X-Gm-Message-State: AOJu0YxDocjfqGn03d5r74KfqKT3NCg0fSn1ZtZSOZFglR5uji7I7oyh
	XZ1k8DttclaSo7xq0LVAPbUWo7orNqzZqRqiiu7FEv4daADgmv+JmmWjD2mSyKadwTuJr6LFaE+
	6
X-Google-Smtp-Source: AGHT+IFupAf3+PzUtciCUtAMd59M9Bh2uNrFENRRy+veiFORUG52P2gIZyNwUtsiccta6zle1s1HIQ==
X-Received: by 2002:a92:cda1:0:b0:36c:c6d:54ba with SMTP id e9e14a558f8ab-36cc1487041mr73054875ab.9.1715453232512;
        Sat, 11 May 2024 11:47:12 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.179])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4893700de56sm1575232173.22.2024.05.11.11.47.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 May 2024 11:47:11 -0700 (PDT)
Message-ID: <b970012b-c078-4c8d-995d-e2789afa3e4c@sifive.com>
Date: Sat, 11 May 2024 13:47:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] riscv: dts: starfive: visionfive-2: Fix lower rate
 of CPUfreq by setting PLL0 rate to 1.5GHz
To: Xingyu Wu <xingyu.wu@starfivetech.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20240507065319.274976-1-xingyu.wu@starfivetech.com>
 <20240507065319.274976-3-xingyu.wu@starfivetech.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240507065319.274976-3-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240511_114715_000688_6FC06710 
X-CRM114-Status: GOOD (  15.14  )
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

On 2024-05-07 1:53 AM, Xingyu Wu wrote:
> CPUfreq supports 4 cpu frequency loads on 375/500/750/1500MHz.
> But now PLL0 rate is 1GHz and the cpu frequency loads become
> 333/500/500/1000MHz in fact.
> 
> The PLL0 rate should be default set to 1.5GHz and set the
> cpu_core rate to 500MHz in safe.

Can this be accomplished by instead setting the CLK_SET_RATE_PARENT flag on the
CPU_CORE clock? That way PLL0 is automatically set when cpufreq tries to change
the CPU core frequency. Then there is no DT change and no compatibility issue.

Regards,
Samuel

> Fixes: e2c510d6d630 ("riscv: dts: starfive: Add cpu scaling for JH7110 SoC")
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi     | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index 45b58b6f3df8..28981b267de4 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -390,6 +390,12 @@ spi_dev0: spi@0 {
>  	};
>  };
>  
> +&syscrg {
> +	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>,
> +			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
> +	assigned-clock-rates = <500000000>, <1500000000>;
> +};
> +
>  &sysgpio {
>  	i2c0_pins: i2c0-0 {
>  		i2c-pins {


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
