Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C339C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 11:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GTxeeStaKvbSwCjY9ThHu2A7R35de3i5Utr9wMZp/Ok=; b=o9vPrJCrXiM4fK
	2zm35P0ARyKL5VdCU+ckK90AET2UncvM4g+4Pblny2BpTOlMkLb/VLVj5SW1bWf/XZP6TM9/+XDH+
	QE4vIIQq8JzM77DVC9gzjncZOdX5YFt0xql8Gnv6VKoynFA5vX2z/K3m5DD3W3UxaNpF8eP/GQ33p
	pS3VSuOvi0qhzTsizjF6UY/sIKMXhZR8+PMypcweAvNtGhFvqjf1i1cJZCdZcqFnhAmlnSGRab+4h
	hu6g2dfYa/oaoxs3FcxKVM+O5UPflRgwRW1EPfFncOtDyGai1t+IVu9Oh68yby3JkuEw7qrwg7gpA
	Vqq+9dVWEpR2zOalkINw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDjg7-0000Db-2M;
	Thu, 14 Dec 2023 11:14:55 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDjg4-0000CY-00
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 11:14:53 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1d075392ff6so3829745ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Dec 2023 03:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702552489; x=1703157289; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FVPTp88lkoUNclLNyMQ28Q4aUPFrbO4VyJ2R1jHccBw=;
        b=SwjuEk1h/I3ONeOXtlh235dYbFbqQcQVHJgWQcUomX/B7aoXT0BnXCvCAjerf8Vpus
         aUKAEOp6720PS4uD5CfWj7QII5RiI8oGnGhltwefQyXrDavAGMBSD278DkrQSNdWnWyV
         UUzYFNlTlKG+mfiqUgEfuEcca58wTc/Brl+MTmnQ/2udNv6jxSegz7GzsxsWo27mtVws
         xQup3fpja1Ck6WV/BZDb5nR6vyC01ZMGdeZS5SJoDvq+8qB51vJSEVe3tK6WVPDpccex
         35nz7wJaGJx4Npypvhv+OyZXkjjHHY72NOojj3FPNwS4ssXSE4E1AcJv/BlLGfLg5xtk
         AJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702552489; x=1703157289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVPTp88lkoUNclLNyMQ28Q4aUPFrbO4VyJ2R1jHccBw=;
        b=UKZggmvbJj3MrBLcct+vc4sOtWyDpFnQeJzHo0O2UtTY6Spg0SGjZfNOlikk54XQlO
         mquoKppUIdW4PNmRAY2qyUw+00kpGwfu7/yr+liCMWzYD2dgE/DqSQOB1Tb2CnQaNBlE
         +0oWec+Sp4MeODkBq0bkIj5Ctvg7bQjfWNbPUROvuWC46UfoYkogLWsl3e6x8YCNjvZN
         pfE9+tXAXUuIKr2yiGNPGofwE4DX6EqHiSytcrsTeCs2N8m4hGgd8WhBHilL/dNR8ITN
         OxMC1E46YWYoiuoyWyH1DNmfq6BeL2QTMk70fR88MB1E/QLCYcscfE+xfIj+Yfx4VE+h
         BMOQ==
X-Gm-Message-State: AOJu0YxIvq/RHBP6kR7sk8g4KrxNRSWeh2xyfQEdpzdQqVqAzgq8FRiZ
	9T0kRNnwiMJlFMIxy83asa4q1g==
X-Google-Smtp-Source: AGHT+IGOq6hMOmxs2rxUvcaHRqnepK0+YXJSK1x4rZ1t/yLDbiZCF+pmSCx8HAr3XtqPRa+sDOje9g==
X-Received: by 2002:a17:902:ce86:b0:1d3:7368:663 with SMTP id f6-20020a170902ce8600b001d373680663mr343871plg.7.1702552488925;
        Thu, 14 Dec 2023 03:14:48 -0800 (PST)
Received: from localhost ([122.172.82.6])
        by smtp.gmail.com with ESMTPSA id j4-20020a170902da8400b001d072591d77sm12200392plx.247.2023.12.14.03.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 03:14:48 -0800 (PST)
Date: Thu, 14 Dec 2023 16:44:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Brandon Cheo Fusi <fusibrandon13@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Yangtao Li <tiny.windzz@gmail.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/5] riscv: dts: allwinner: Update opp table to allow CPU
 frequency scaling
Message-ID: <20231214111446.camz2krqanaieybh@vireshk-i7>
References: <20231214103342.30775-1-fusibrandon13@gmail.com>
 <20231214103342.30775-2-fusibrandon13@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231214103342.30775-2-fusibrandon13@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_031452_038159_60DAF0F7 
X-CRM114-Status: GOOD (  21.77  )
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

On 14-12-23, 11:33, Brandon Cheo Fusi wrote:
> Two OPPs are currently defined for the D1/D1s; one at 408MHz and
> another at 1.08GHz. Switching between these can be done with the
> "sun50i-cpufreq-nvmem" driver. This patch populates the opp table
> appropriately, with inspiration from
> https://github.com/Tina-Linux/linux-5.4/blob/master/arch/riscv/boot/dts/sunxi/sun20iw1p1.dtsi
> 
> The supply voltages are PWM-controlled, but support for that IP
> is still in the works. So stick to a fixed 0.9V vdd-cpu supply,
> which seems to be the default on most D1 boards.
> 
> Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> ---
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> index 64c3c2e6c..e211fe4c7 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> @@ -39,16 +39,22 @@ cpu0_intc: interrupt-controller {
>  	};
>  
>  	opp_table_cpu: opp-table-cpu {
> -		compatible = "operating-points-v2";
> +		compatible = "allwinner,sun20i-d1-operating-points",

I don't think you should add a new compatible for every SoC that needs
to be supported by a DT bindings and cpufreq driver. Maybe you should
just reuse "allwinner,sun50i-h6-operating-points" and it will work
fine for you ?

Rob ?

> +				 "allwinner,sun50i-h6-operating-points";
> +		nvmem-cells = <&cpu_speed_grade>;
> +		nvmem-cell-names = "speed";
> +		opp-shared;
>  
>  		opp-408000000 {
> +			clock-latency-ns = <244144>; /* 8 32k periods */
>  			opp-hz = /bits/ 64 <408000000>;
> -			opp-microvolt = <900000 900000 1100000>;
> +			opp-microvolt-speed0 = <900000>;

The separate property name thing was required when you could have
different values for different SoC instances, which can be read from
efuses, like in your case.

But all I see is speed0 here, why don't you always set opp-microvolt
then ?

Also why degrade from min/max/target type to just target ?

>  		};
>  
>  		opp-1080000000 {
> +			clock-latency-ns = <244144>; /* 8 32k periods */
>  			opp-hz = /bits/ 64 <1008000000>;
> -			opp-microvolt = <900000 900000 1100000>;
> +			opp-microvolt-speed0 = <900000>;
>  		};
>  	};
>  
> @@ -115,3 +121,8 @@ pmu {
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
