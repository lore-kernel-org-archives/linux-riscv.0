Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015EEC77B73
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 11:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UT8piRCKrPdUk4001vtiuYs0Y1zLfBZLC4UsMqrMnSY=; b=ETgqoiTMvmIk5c
	ELmLDPrShALSrH+NSs437rGpxYtVJuCwrF85vAaS/ILLIRvXREItNkAh6qlFbfC/KbJWHdzVcT07J
	Ac9/Grv0e1CojNXZE9wRKAXklbDlkwuit778lAZ80MtDxvmw0M+YMsu5VhglhXHhulKlb6F1pABal
	kHiNVZ17a6IoaBI9Mt7vfcUAYlx0kNAcaJW4e0rGu3gScO1hM13OkNM5+3bmi7ZP/d0w1Iw0tJw0R
	0eqxv1XPX3LVfhlB2rv16OXuHEkoFtzmkFLIS5SJ3QT0/a8GifLdvPulge626Kcq5wXkeieBGFLgi
	6XEL8W5XJ3cmTXXKSUnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6UXs-001OV5-2W;
	Tue, 06 Jun 2023 11:08:12 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6UXq-001OU9-1O
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 11:08:11 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-543c6a2aa07so970676a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 Jun 2023 04:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686049687; x=1688641687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qVSJj1sRiRvqAoJoUbfYZTV6sidf/krCZCWHmgJCGhk=;
        b=oWir6YuIJqL+Gp4V0Fk0VI2xVPrF4usjZ6/Xlw+2+DQYHFSkQ2ZrlnS4VOYaSXcis8
         nqoM/nTyzPQ2MYzMhjiIIh19XVfHEh9KpH1WCL8f38Dp+u5ck7Zn1FwhJustPdB+tTvY
         TYkYoeZ/yrCzMuh8Anlqo19kkZgwUoqXdkKMjn7i5plWwRwtCG7Qk3ubLmw0OUB5WPTq
         eVKVGWKcnhaflts7Cbq0wBv3kUiFyi8cQca5vJLxMEdamv4UCTAP9/LB0EtrmQJb5qkb
         6BqxjmXwvcY3Qqcxqmmq0DepdnshiPMXzKz6OLMtkNZG5TtsT0Xrv39548SbG/nrv9vD
         9+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686049687; x=1688641687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVSJj1sRiRvqAoJoUbfYZTV6sidf/krCZCWHmgJCGhk=;
        b=ksDWAquqtbcH5gOz5mUqJR9KSd0dVMvEb1h7GSuHXyfzd4/MkeZZQz1rKV5o83qDSx
         IW/wYjb7Hv9rB1n9gY50vVDFmhHeA7LUSCV6eTqnEUXnr+Iszh3HmO9akY78sOzG0RHK
         rVG+pj+D4iojUmRJwybU/fBBY36wmB7a4PX8GT3468RdVwbQojTg2ifkp8tUa5/+3nnQ
         RBPd5waY9+jr2vqkLLy/nt4ifDPgXm7QfMso8dp4XPdGTryj06KpHZhcv2CKg+DgMnu9
         haqexD2UKAw/j4LJIYJHFkvzyZve6SSYlBEd3Nq6B7YITfKSszJmabna0Y7OnbFx/aYy
         BKIA==
X-Gm-Message-State: AC+VfDzcpc4R8MjkqF2RGbuh+zIjb8GGweXkC4UKQyVqwEHROh8g+1Am
	C55E7zZwF8k1OF/RBH553c3HOQ==
X-Google-Smtp-Source: ACHHUZ6mVC+QRBEFN/QISRGq+0SEodzIsqkq5FhAjV/IBoQmblkm6QfiIf/q/U5ysSZwmO7ec2umTg==
X-Received: by 2002:a17:902:da8c:b0:1b0:5ca0:41a8 with SMTP id j12-20020a170902da8c00b001b05ca041a8mr609279plx.39.1686049687471;
        Tue, 06 Jun 2023 04:08:07 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id s22-20020a170902989600b0019c13d032d8sm8229012plp.253.2023.06.06.04.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 04:08:06 -0700 (PDT)
Date: Tue, 6 Jun 2023 16:38:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Mason Huo <mason.huo@starfivetech.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shengyu Qu <wiagn233@outlook.com>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 2/3] cpufreq: dt-platdev: Add JH7110 SOC to the
 allowlist
Message-ID: <20230606110804.qns4rolrrj2gku6w@vireshk-i7>
References: <20230606105656.124355-1-mason.huo@starfivetech.com>
 <20230606105656.124355-3-mason.huo@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230606105656.124355-3-mason.huo@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_040810_504598_F3EA71E0 
X-CRM114-Status: GOOD (  14.83  )
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

On 06-06-23, 18:56, Mason Huo wrote:
> Add the compatible strings for supporting the generic
> cpufreq driver on the StarFive JH7110 SoC.
> 
> Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index 338cf6cc6596..14aa8281c7f4 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -85,6 +85,8 @@ static const struct of_device_id allowlist[] __initconst = {
>  	{ .compatible = "st-ericsson,u9500", },
>  	{ .compatible = "st-ericsson,u9540", },
>  
> +	{ .compatible = "starfive,jh7110", },
> +
>  	{ .compatible = "ti,omap2", },
>  	{ .compatible = "ti,omap4", },
>  	{ .compatible = "ti,omap5", },

I thought I already merged it ?

-- 
viresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
