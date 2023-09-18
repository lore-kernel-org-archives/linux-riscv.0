Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED5DC46CA1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 05:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SChRZvQmdmBbUtiiUFshiyKaE85I+LH3XrGeE7Mp/9I=; b=EbON2RgOzQ1AaU
	FMGW/EC4nebra21UmBNd+QW4FnN6EUAj7NpqcyupBel6t4guvUI6OevtCJkC+/UJ28xSyWPcDfH1q
	l8lh1BTwSgjrDubkwOkPfUQt5p8hqKVJ03c85fKjlZD0dq6KQHwpgqFknCOIKlqWdoNa0xvt8AkZz
	8wAckBM29+5J/R0tg2Zko0uAcpVnSQBvYeHQpQyCHw2oh4g9VM5SgmfqYPs1auyfLZ8Lm7KVW01hk
	/BhabmKvK1UkE96XM9aHqJov9F+nCj0ycqRaHxeEuXtyIXlRY27YDOx3UJ3SHSVsnIRF3rcLMIRTb
	4y/SfPXsMXcd+EFczErg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi6wZ-00ETYL-2h;
	Mon, 18 Sep 2023 05:37:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi6wX-00ETXK-2a
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 05:37:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695015428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y6uwQw2TQzRDCyynk3SluHNCszt0yuiUGbPEkJxyENg=;
	b=AO1p/gpySITLVlB7xfkyF4Qdri+I0hDBDY0Lo0g6XvK24gKrm0k0zFlpCXC0x82lVapmn6
	zt7i+mKaxMoIcAf9QEaXNLGCG8T9AJANOt4LBMS3k2HFfdsg1b43WPAn0CTSQEOUE75qKO
	iZq0Gb8AR0l22gC6Pdttq6Thnvku/QQ=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-pZPz-pdtNl6JeoZJcNX-EA-1; Mon, 18 Sep 2023 01:37:07 -0400
X-MC-Unique: pZPz-pdtNl6JeoZJcNX-EA-1
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-577af71a2a8so4116172a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 17 Sep 2023 22:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695015426; x=1695620226;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6uwQw2TQzRDCyynk3SluHNCszt0yuiUGbPEkJxyENg=;
        b=cEh4cTEkU8o0G3TYTfbZfIofof74xQkL2aSGvwy1BCQOsHNZydwwVx3ts16rX9v+W7
         Udw2svqS3Mf+dKjqDFXin1dIOD//7F8LQzBTJpHFPMT/IH7ND1VqhC8/0lUXACww6M4t
         NrV2iK9b2YRVjOhzzu7RFZd7l3VRwi6x8G7Wu7hBDm77HjiE1KeZIqzmsxme2Jr8F7ta
         dKKN25+fhi078nzHcKrsLa3QL0ZB/4NxueS7Uatj1cDVnQL+jZHSDr0VGI6njksWk0PR
         DVArJhiSPKzM0o1yoaYv0kGHlxE2WH8kFJg6X8DSeXk/zNDhoQd6AAa0dp8hYxzUB48T
         vlfw==
X-Gm-Message-State: AOJu0Yzb88wq8T28/WY7F1iweXgvUgcSGewxzCAMIYQ6t1iIsh60eLvg
	IaZcdtyPHa+O6uF3ae2jl6PhV0USOUVLKj5fbnI0VUU32ZQOVSAeRj6xL+4/4zN247uECCUn+d/
	rIsV7Ew2DYA4DhGYJKsM2RTNz931B
X-Received: by 2002:a17:902:ab12:b0:1c3:df77:3159 with SMTP id ik18-20020a170902ab1200b001c3df773159mr7962018plb.50.1695015426138;
        Sun, 17 Sep 2023 22:37:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4LA6vy59tdBGF7Ljgoach/YoGNT9CDJsVEh22V2F8alWKcyjdRZQRbNbCFRoo5eBTb6guIw==
X-Received: by 2002:a17:902:ab12:b0:1c3:df77:3159 with SMTP id ik18-20020a170902ab1200b001c3df773159mr7962003plb.50.1695015425836;
        Sun, 17 Sep 2023 22:37:05 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id n5-20020a170902e54500b001b9d95945afsm7488399plf.155.2023.09.17.22.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Sep 2023 22:37:05 -0700 (PDT)
Message-ID: <add60819-1d36-9b96-7bfa-148907dc44ce@redhat.com>
Date: Mon, 18 Sep 2023 15:36:58 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH v2 19/35] ACPI: Move acpi_bus_trim_one() before
 acpi_scan_hot_remove()
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
 <20230913163823.7880-20-james.morse@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230913163823.7880-20-james.morse@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_223709_913489_8D74575F 
X-CRM114-Status: GOOD (  22.78  )
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
> A subsequent patch will change acpi_scan_hot_remove() to call
> acpi_bus_trim_one() instead of acpi_bus_trim(), meaning it can no longer
> rely on the prototype in the header file.
> 
> Move these functions further up the file.
> No change in behaviour.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>   drivers/acpi/scan.c | 76 ++++++++++++++++++++++-----------------------
>   1 file changed, 38 insertions(+), 38 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index f898591ce05f..a675333618ae 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -244,6 +244,44 @@ static int acpi_scan_try_to_offline(struct acpi_device *device)
>   	return 0;
>   }
>   
> +static int acpi_bus_trim_one(struct acpi_device *adev, void *not_used)
> +{
> +	struct acpi_scan_handler *handler = adev->handler;
> +
> +	acpi_dev_for_each_child_reverse(adev, acpi_bus_trim_one, NULL);
> +
> +	adev->flags.match_driver = false;
> +	if (handler) {
> +		if (handler->detach)
> +			handler->detach(adev);
> +
> +		adev->handler = NULL;
> +	} else {
> +		device_release_driver(&adev->dev);
> +	}
> +	/*
> +	 * Most likely, the device is going away, so put it into D3cold before
> +	 * that.
> +	 */
> +	acpi_device_set_power(adev, ACPI_STATE_D3_COLD);
> +	adev->flags.initialized = false;
> +	acpi_device_clear_enumerated(adev);
> +
> +	return 0;
> +}
> +
> +/**
> + * acpi_bus_trim - Detach scan handlers and drivers from ACPI device objects.
> + * @adev: Root of the ACPI namespace scope to walk.
> + *
> + * Must be called under acpi_scan_lock.
> + */
> +void acpi_bus_trim(struct acpi_device *adev)
> +{
> +	acpi_bus_trim_one(adev, NULL);
> +}
> +EXPORT_SYMBOL_GPL(acpi_bus_trim);
> +
>   static int acpi_scan_hot_remove(struct acpi_device *device)
>   {
>   	acpi_handle handle = device->handle;
> @@ -2506,44 +2544,6 @@ int acpi_bus_scan(acpi_handle handle)
>   }
>   EXPORT_SYMBOL(acpi_bus_scan);
>   
> -static int acpi_bus_trim_one(struct acpi_device *adev, void *not_used)
> -{
> -	struct acpi_scan_handler *handler = adev->handler;
> -
> -	acpi_dev_for_each_child_reverse(adev, acpi_bus_trim_one, NULL);
> -
> -	adev->flags.match_driver = false;
> -	if (handler) {
> -		if (handler->detach)
> -			handler->detach(adev);
> -
> -		adev->handler = NULL;
> -	} else {
> -		device_release_driver(&adev->dev);
> -	}
> -	/*
> -	 * Most likely, the device is going away, so put it into D3cold before
> -	 * that.
> -	 */
> -	acpi_device_set_power(adev, ACPI_STATE_D3_COLD);
> -	adev->flags.initialized = false;
> -	acpi_device_clear_enumerated(adev);
> -
> -	return 0;
> -}
> -
> -/**
> - * acpi_bus_trim - Detach scan handlers and drivers from ACPI device objects.
> - * @adev: Root of the ACPI namespace scope to walk.
> - *
> - * Must be called under acpi_scan_lock.
> - */
> -void acpi_bus_trim(struct acpi_device *adev)
> -{
> -	acpi_bus_trim_one(adev, NULL);
> -}
> -EXPORT_SYMBOL_GPL(acpi_bus_trim);
> -
>   int acpi_bus_register_early_device(int type)
>   {
>   	struct acpi_device *device = NULL;

Thanks,
Gavin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
