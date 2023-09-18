Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03965CD37B0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 04:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nhki+ijLD3T6PUQOa6+uhrjjuDRdnVzejTOnFrx4Upg=; b=FhhsgREV7FWXfj
	GYDNnpVSW1jwaWYRiCO4q2uvnSuk7N0+YtyrcOIFnFiiNVA+HWFg8Vlr2ta3hzBB0tQG9i+QHt6lt
	qD0MRVH4YCZ4xCR4nT051eMjHYIVEYzEYvVjoT7shltjVGaLTbuW/y9yqtCfp3ZAqJAa/hYFHyR4S
	EAR5MAzj/7lnbCBWj5JlSwvmizbw2lXrTkyXBqH6npvFfreN/S6HOJLX+UHWkb/VPxsR8kmZ8EbXw
	FhY78TXQLMLT9H0DGT8tpkdH/nWP31O8YdBLBdBWBkUxMJBbVNRad96TPRV/B9mU44BjUvmo0jtRk
	F4nHQY3WTuMS7EgMjQVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi5X2-00ELDI-0s;
	Mon, 18 Sep 2023 04:06:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi5Wy-00ELCX-2j
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 04:06:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695009999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RyEnCFT5C38bhUURLkGzvUajSXRR1/fSXXPcrqWJ/i0=;
	b=Sx38KtqaNLgedsFfbIOY//4AFSkSAAWhG2kIPULbdOvkEWUHgkWHlWpNt/7EeGiDf3AY37
	iyV1P56pM4BW/c8wZgSAwQToP7oa+9fzqjZkJP8dq9aRlrZ37ZkD2Ea1iRbl5TgGAvbr1O
	U/N00cyNvYPRYFsSS16Tmjd+OdiyG30=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-iHLRlKI6MOCQvoLKrqqYLQ-1; Mon, 18 Sep 2023 00:06:38 -0400
X-MC-Unique: iHLRlKI6MOCQvoLKrqqYLQ-1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-1c41392a0a2so28196475ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 17 Sep 2023 21:06:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695009997; x=1695614797;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RyEnCFT5C38bhUURLkGzvUajSXRR1/fSXXPcrqWJ/i0=;
        b=oEbNZmQ8fnLXUYSkroSHvEugLHV/E6DNb5CcohRiusJWzoq933TDGWkIT4z5FTjYAr
         Y5BXpg+pVHEa8t14xM7V4f8kqoDQHmnKTVDFTsLTCPUVcw5OyOolFxqU7NOfB2nf7MEv
         VWdMC8Mm1TjYpsD4MHwo+KdLXcR6PmPBUli/gABtyMf5/DIW48+cIwi+jVenVucssbkN
         QqGTtK33+ViGxiRt+o/HS5z2bbnouESutF90Hbo8ZiBnBF9niQskC2eze2WfUH8pWrf+
         fpJFUiN5ohuk4ahNh0+IJvupGf+JlbDQvsyaDkbzz2u3IIC0UGac3XE74rW/yKMIuazT
         JNyA==
X-Gm-Message-State: AOJu0YzlDursgpCqcMQkaQkAc+pTsRHuHuIyojwl8QybixqbBtbr6iFO
	a5hYYGM08wcTnukBVQU1J+gHQHd4hOtxk0fs4DPHLecoRmiJlQb9aoXJHT/CpWQb1ivJGVarUA3
	veaIDoRZvQF5+L0dJtBiZrUeNH3GG
X-Received: by 2002:a17:902:ed13:b0:1c4:2639:fcac with SMTP id b19-20020a170902ed1300b001c42639fcacmr6826550pld.44.1695009997183;
        Sun, 17 Sep 2023 21:06:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF065/Z94SfXDjWgy8eNRhRV8ONjtcc1kg9eJW1xxYmQI4hKUxuHGFuBMDdEioAhl0IB04WA==
X-Received: by 2002:a17:902:ed13:b0:1c4:2639:fcac with SMTP id b19-20020a170902ed1300b001c42639fcacmr6826541pld.44.1695009996903;
        Sun, 17 Sep 2023 21:06:36 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id ju3-20020a170903428300b001bdb8c0b578sm5892366plb.192.2023.09.17.21.06.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Sep 2023 21:06:36 -0700 (PDT)
Message-ID: <4e5aaed1-bf7d-18a8-0f77-8f29bb2e43bc@redhat.com>
Date: Mon, 18 Sep 2023 14:06:28 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH v2 12/35] ACPI: Use the acpi_device_is_present()
 helper in more places
To: James Morse <james.morse@arm.com>, linux-pm@vger.kernel.org,
 loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 kvmarm@lists.linux.dev
Cc: x86@kernel.org, Salil Mehta <salil.mehta@huawei.com>,
 Russell King <linux@armlinux.org.uk>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com,
 justin.he@arm.com
References: <20230913163823.7880-1-james.morse@arm.com>
 <20230913163823.7880-13-james.morse@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230913163823.7880-13-james.morse@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_210640_961053_6BC2D45F 
X-CRM114-Status: GOOD (  14.79  )
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



On 9/14/23 02:38, James Morse wrote:
> acpi_device_is_present() checks the present or functional bits
> from the cached copy of _STA.
> 
> A few places open-code this check. Use the helper instead to
> improve readability.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>   drivers/acpi/scan.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 691d4b7686ee..ed01e19514ef 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -304,7 +304,7 @@ static int acpi_scan_device_check(struct acpi_device *adev)
>   	int error;
>   
>   	acpi_bus_get_status(adev);
> -	if (adev->status.present || adev->status.functional) {
> +	if (acpi_device_is_present(adev)) {
>   		/*
>   		 * This function is only called for device objects for which
>   		 * matching scan handlers exist.  The only situation in which
> @@ -338,7 +338,7 @@ static int acpi_scan_bus_check(struct acpi_device *adev, void *not_used)
>   	int error;
>   
>   	acpi_bus_get_status(adev);
> -	if (!(adev->status.present || adev->status.functional)) {
> +	if (!acpi_device_is_present(adev)) {
>   		acpi_scan_device_not_present(adev);
>   		return 0;
>   	}


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
