Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C079C46CD3
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Dec 2023 05:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AqQvLVgvyYQk1/4u2FpgPJgWU2gRNSS/WlY82z7L3cs=; b=P2KEnWDprPFPyU
	Yua+SzdFTwRcmCRYxjwz4cjv7EMrCwWz5dhnl50TQ0v0l1qPs2Og00agLaNWhkkM2UaBNQWz0RynI
	1gtTj7CCNoNbj3SFVHYjQIAUnJupcz58rcd5tw3uA/HVNo2hAwHSRORh+IzHjpsg1DayHT2SY4+sM
	dmRuEcQDZbXoTcBkuyRW1N9oD2URzPH3m3ISwaNzGJqcnDTrInjXe5fayHpb/032X4z0IgO9Cgh1R
	Up0C6Gy+K8PyWWqjFDCiCFlA5qw6vb1eN0pYGwVPUSiE9Un5Ji+LhtXmHWv1W68YcAy3ZadLNCN8J
	+Fqnqm8qQkBuAbe1dpDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rI07a-00Bias-0P;
	Tue, 26 Dec 2023 05:36:54 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rI07X-00BiaH-39
	for linux-riscv@lists.infradead.org;
	Tue, 26 Dec 2023 05:36:53 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6d99980b2e0so2019128b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 25 Dec 2023 21:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703569010; x=1704173810; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wt8Y6H9UYhlcK+Kq+g9t/n5C3ulwRlQUCahaLJRULwM=;
        b=UwEb48ghYY9GxgzDzMmoZGZ/u/xeC9k5P8orNsNxKyz/0JcE8UDSDlrithsX91zEr2
         oO5mwRKzno3UVR5kUYrunnLzG5OPHfQfaj5gEdNgsA+rtm7SZ76V+tLM4PPX+PXiH3NI
         Yo2RJNHEzJaZkUW8mRbX0G/F8ZakNDSuEXBt2X8oTrCNz9rZqy6DLjyM2qKGfhHdnLCK
         dcbZIDewMR/8hCnKAuqWIOGaY4Ry+N5U5GjIU5FYDxw/8cOOTOxJy9/aXkDIxQhGciTi
         ne4IEdq4mL9riOFuZgTe9TSjdIVo2yl755kp/PDTTUO4lfNlfgeDpjvxoZG0Eo9WygKn
         /Uyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703569010; x=1704173810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wt8Y6H9UYhlcK+Kq+g9t/n5C3ulwRlQUCahaLJRULwM=;
        b=E00eZ5s4EO64waisLvssdGTM+4pgRZjAMjNjCwtFfIY21Mvs22VOwTwDm51gRff0Wu
         qJFtUNrI+5WbKYPNmJvbEtbmKKBKJDoOQhFbPxWUB4uyLtZ4rPXFqXOlXSzCdKhIgIXd
         bVYbqwFuiV3xmdXzf4uEXXkF1D/W97rFJOCGOBQhhbCllKf13TxdLz2B8UDdO2yQY6v5
         1zmwbz/bYA8/JtKxozuztQoQ4cqP6+3fjDcvwcakUA1LA1ukXLtR0Bm8uLp1SlwaUgnH
         qyi/1MyKN2nDlSpQHzjjoHy/WSl2mxXO/sJ4RRE/aI9hN07mWBvp8B2kOB4QrciszHg1
         aOMA==
X-Gm-Message-State: AOJu0YzIGmOjWfcWaSBeFxhF3lwxzQbASuszCH1z+CS8zGfIqf+EwcY8
	qgVXYvgSf9gSphvn4F5VnuS6Zf42KGiLhg==
X-Google-Smtp-Source: AGHT+IEWpDU3OhwCcS4KqMR5BEt9i18xozZDMVXrBdzYqH1/mZXMMZY7yPJGFUrViMSlAQI50dwQjw==
X-Received: by 2002:a05:6a00:181e:b0:6d9:ba7f:8b02 with SMTP id y30-20020a056a00181e00b006d9ba7f8b02mr3323033pfa.32.1703569009897;
        Mon, 25 Dec 2023 21:36:49 -0800 (PST)
Received: from localhost ([122.172.86.168])
        by smtp.gmail.com with ESMTPSA id ff21-20020a056a002f5500b006cef5c09ca3sm9165969pfb.147.2023.12.25.21.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Dec 2023 21:36:49 -0800 (PST)
Date: Tue, 26 Dec 2023 11:06:47 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Brandon Cheo Fusi <fusibrandon13@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [RFC PATCH v3 3/3] riscv: dts: allwinner: Fill in OPPs
Message-ID: <20231226053647.kvrpn4pjtc2lhfcm@vireshk-i7>
References: <20231222111407.104270-1-fusibrandon13@gmail.com>
 <20231222111407.104270-4-fusibrandon13@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231222111407.104270-4-fusibrandon13@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231225_213652_065009_8A99B0F5 
X-CRM114-Status: GOOD (  15.30  )
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

On 22-12-23, 12:14, Brandon Cheo Fusi wrote:
> Specify two voltage ranges, in order of increasing stability,
> for each OPP.
> 
> Also define an nvmem cpu speed grade cell of length 2.
> 
> Link: https://github.com/Tina-Linux/linux-5.4/blob/master/arch/riscv/boot/dts/sunxi/sun20iw1p1.dtsi#L118-L133
> Link: https://github.com/mangopi-sbc/tina-linux-5.4/blob/0d4903ebd9d2194ad914686d5b0fc1ddacf11a9d/arch/riscv/boot/dts/sunxi/sun20iw1p1.dtsi#L118-L182
> 
> Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> ---
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> index 64c3c2e6c..7e2e015e0 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> @@ -39,16 +39,23 @@ cpu0_intc: interrupt-controller {
>  	};
>  
>  	opp_table_cpu: opp-table-cpu {
> -		compatible = "operating-points-v2";
> +		compatible = "allwinner,sun20i-d1-operating-points";
> +		nvmem-cells = <&cpu_speed_grade>;
> +		nvmem-cell-names = "speed";
> +		opp-shared;
>  
>  		opp-408000000 {
>  			opp-hz = /bits/ 64 <408000000>;
> -			opp-microvolt = <900000 900000 1100000>;
> +
> +			opp-microvolt-speed0 = <950000 950000 1100000>;
> +			opp-microvolt-speed1 = <900000 900000 1100000>;
>  		};
>  
>  		opp-1080000000 {
>  			opp-hz = /bits/ 64 <1008000000>;
> -			opp-microvolt = <900000 900000 1100000>;
> +
> +			opp-microvolt-speed0 = <1100000>;

I was expecting the above two lines to have same values. Why change
them ?

> +			opp-microvolt-speed1 = <950000 950000 1100000>;
>  		};
>  	};
>  
> @@ -115,3 +122,9 @@ pmu {
>  			<0x00000000 0x0000000f 0xffffffff 0xffffffff 0x00020000>;
>  	};
>  };
> +
> +&sid {
> +	cpu_speed_grade: cpu-speed-grade@0 {
> +		reg = <0x00 0x2>;
> +	};
> +};
> -- 
> 2.30.2

-- 
viresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
