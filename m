Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65957C47074
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 09:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3tuoNA57LhaMG1YHKzjlsYbVgoZLVdhw0j9ZChBdPqo=; b=mm298KNg5l2tSy
	1Xo60ib4yA/+TwIRfDDR1t+DEpH2msAPjXak9JoVbDwRcplTaRyPgAuZokfcJl6DSUiwANdLlEkul
	H0hETPk9QnBVcoGuBL6xayoH15msAsZ3lqIiXYAr7zTwX5qh4E+Kq/NgQKkcSdc41a5yi3CedzEnU
	U5p9LBGuZ5x0FG73R4DYfDI4PGtTSZNi20gF63mBgjKTQE2NZthmZIUl1rJ8H4nRawZOICc4sJ98A
	LsVMIes/OOF2mU3zJSEA22dglo/DTIRPtoUH2eXy5fujrQ60kOiyN838p1LyazQKmkt2QCretPXn3
	blrbUW1HZndbQeI7UnmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLK2Z-00DNpe-33;
	Thu, 04 Jan 2024 09:29:27 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLK2X-00DNoU-1o
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 09:29:26 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a28a997f3dfso23644866b.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 01:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704360564; x=1704965364; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sxCSOtgIuTCmDMgckUR1KMBV4DlQWWFk6eRZHQf9FiI=;
        b=YrZpshb2p8jPsWdPhfnavIVOLC68eXBCvRt1UIAz3X5tzw3wMF+PJvXDIt/Odnc+KR
         dK6CQWn21vrNisynF5O+haSSnaBogqBabGENgt3+AjZSyrMiYHyFeQ3DvycOqRCse+cG
         XbT+mvK7dpcaKeo7qiaPq1xySzDB8p954lporVt8amzSWxgb31YxUw+Qb34Aq16zkoxe
         bPpGmjHLMIzyoXdiUpz6WGSniu9yKZGzOFihorVkUyKH07qm/p3oOOLah7cQpv8T+D7E
         dujZNf4Qq/zdwM8Z4tMlMfEbbmqyAC/QaGQfnHAfByWN5UPDlALa74gfNaz05oZEihsu
         uPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704360564; x=1704965364;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sxCSOtgIuTCmDMgckUR1KMBV4DlQWWFk6eRZHQf9FiI=;
        b=qWUoeXXYl8awiezt1IGyjM4K7omIjtjqrUZEqvdjLPzjgdOlAt8W7Gt7OwVSCtIjfD
         WozZLgP0PCJ05gB1AqzS95V1wIkT+1EsQEfvMRlv2yHpkjJ0IpgvxblbZQaPRxAFqhFR
         nUN9NzYy9E16DHRGUR2RZS+nDCny8gdnbuc1N/ehhZX8AxakpwCueUotI5/ieRcx5F7M
         t9prsS3Ta/B4jiz2y7Sxgm3jmropYCvJ3fNMWL2T1JKC1epfdKPF3U8cZvOibMAHPhYs
         wsz02jZAQgZKr6ozhB9dZBygfz0UYX48bCqpA1tA93KIX02/JHzRpHBTxgXAusA2r8ry
         DELg==
X-Gm-Message-State: AOJu0YznD18n3L9eGV0w8+OehqAEP03LCS2HrejYS5W4G6gh9gGWNT9c
	1Zt/bhW05/+7G2YtpNT81v77q4vG9XjCow==
X-Google-Smtp-Source: AGHT+IFajqTWmTnMMBn/8bztmTnBY8FlKldSofq+dadysBPgbVWftwgMb7NUtZMZv1WH36cUoeyBGg==
X-Received: by 2002:a17:906:cf83:b0:a27:4c43:ad3 with SMTP id um3-20020a170906cf8300b00a274c430ad3mr193833ejb.8.1704360563957;
        Thu, 04 Jan 2024 01:29:23 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id f17-20020a170906495100b00a26b057df46sm9910107ejt.126.2024.01.04.01.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 01:29:23 -0800 (PST)
Message-ID: <0adf22be-bbab-48d5-909e-ad43ccf4ff5f@linaro.org>
Date: Thu, 4 Jan 2024 10:29:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mmc: sdhci-cadence6: add Cadence SD6HC support
Content-Language: en-US
To: Alex Soo <yuklin.soo@starfivetech.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter
 <adrian.hunter@intel.com>, Yangtao Li <frank.li@vivo.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20231228065322.1176351-1-yuklin.soo@starfivetech.com>
 <20231228065322.1176351-3-yuklin.soo@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231228065322.1176351-3-yuklin.soo@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_012925_600089_E53E7938 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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

On 28/12/2023 07:53, Alex Soo wrote:
> Add a driver for the Cadence SD6HC SD/SDIO/eMMC controller.
> 
> Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
> ---
>  MAINTAINERS                           |   6 +
>  drivers/mmc/host/Kconfig              |  11 +
>  drivers/mmc/host/Makefile             |   2 +
>  drivers/mmc/host/sdhci-cadence6-phy.c | 384 +++++++++++++++++++
>  drivers/mmc/host/sdhci-cadence6.c     | 531 ++++++++++++++++++++++++++
>  drivers/mmc/host/sdhci-cadence6.h     | 148 +++++++
>  6 files changed, 1082 insertions(+)
>  create mode 100644 drivers/mmc/host/sdhci-cadence6-phy.c
>  create mode 100644 drivers/mmc/host/sdhci-cadence6.c
>  create mode 100644 drivers/mmc/host/sdhci-cadence6.h

Please work with existing submissions:

https://lore.kernel.org/all/?q=sd6hc

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
