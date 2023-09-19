Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE2ECD342C
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 00:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oHTIE3qYP4pYMHXL1OCC0vrOSxJtvtBGEe019OMEIlY=; b=oxEIX5Yunxo6xZ
	aPXrsM56PDHuPDACJ/f9zdNcBAgLweiAof7fNcpTj32doNzGOKXlvP1dgHg2xgENbkgPq+Na4kgXW
	pMAjOLL+MuVeUN+eo/9syBdup5WZiBJ1q3GdbNY1+sLeJkwLyWp2wDKPmcDJlQm3WTYlseCxuBiiV
	fTO8L9EfxWWgc/irkDW+O4T+hNtG+zwccQaJKotR2/X/pU6ui4uK4drWxgTYNQ0qP7bFW1/OnuKVn
	5p93tTQY1w+1QMWkny/akS4b6OlbcQeETDFUxz1RYwigtsMqJIL6RWLEnRbNzdnPjW9YQjZxd6wky
	n/oWZJyQwo70GBftH2iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiOeM-00GaRA-29;
	Tue, 19 Sep 2023 00:31:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiOeI-00GaQA-1o
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 00:31:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695083489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yt0ViDpjZ+25N6JQm0qkxgqk3PInKbbOQPzyPguJLGE=;
	b=XSeKs3Zbp5UBCx90WTU87kAfeNMO9bhfOkoLCFe3UCNq/PYUfctSkFN4kzg4RStOEPfHow
	+6ytqrWesu42fsKAUmumt2Zw3C7otdtjxMpjqTF496kK1AKm/5m/LqJZrI8pfaegRLhIMe
	yF0srjSFMSq2vU4tIOgcpA7/JDc1a/8=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-LqiP0TSqP6GDLcoplri78A-1; Mon, 18 Sep 2023 20:31:27 -0400
X-MC-Unique: LqiP0TSqP6GDLcoplri78A-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-274c4e3da1aso1405014a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 17:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695083486; x=1695688286;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yt0ViDpjZ+25N6JQm0qkxgqk3PInKbbOQPzyPguJLGE=;
        b=XjqupQ+BonROD/ui199VWS1y0QwO1DWg9MAdG/TKtjW6U/s6T1RXhemvJGWFvRleA3
         C3W/7H1snLJC/i8vu32fmXuCb5DwWqvrPw14cgY0y0N5EagM70MVu4JCVtLPkizccoXh
         /GoosOoTsRqnmzDWVTZgv97IVrJhxm5L9EJwzrOlG+lwSkbcaSvJdJYl3dM9swmhuyPc
         YK8QtG4onb015md3I7QvbnrOeUVeuHWoBJdiKbhQ2qDnxplwAD2XrejkqE/2FbD0h6H6
         YQAvNZ45Urmjq+PG1W5Rl197l1CT0YXq4zMlvRaWshvUkFJ1sAKZuUd6HLn3EjbObe4h
         HXrQ==
X-Gm-Message-State: AOJu0YxxZOWJzgQuaHRO6ZUxCysRj0ShG5pKm8CPxd5may35809qVYLP
	v2D3hWrOMj2qXirCzubtw4uEmwixVm1laABbZ/MlhVpAm23h5hAFSX6uyHifaUpCFYfxYxde/b/
	qftwARNgVsAOonwHOm/ZDdnoki9IY
X-Received: by 2002:a17:90a:f3d4:b0:274:6cd3:a533 with SMTP id ha20-20020a17090af3d400b002746cd3a533mr7710095pjb.20.1695083486654;
        Mon, 18 Sep 2023 17:31:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuRHNEswx8Y3CK9vB5Y6rtmqv1Vi3ahJ5e3s63VHLKH86N5qFHbQvQv+6fmLjVPhUNR76WEw==
X-Received: by 2002:a17:90a:f3d4:b0:274:6cd3:a533 with SMTP id ha20-20020a17090af3d400b002746cd3a533mr7710080pjb.20.1695083486322;
        Mon, 18 Sep 2023 17:31:26 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id f93-20020a17090a706600b0026fa1931f66sm8310527pjk.9.2023.09.18.17.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 17:31:25 -0700 (PDT)
Message-ID: <c3ef8123-1fcc-7289-c475-c753de44d564@redhat.com>
Date: Tue, 19 Sep 2023 10:31:17 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH v2 21/35] ACPI: Add post_eject to struct
 acpi_scan_handler for cpu hotplug
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
 <20230913163823.7880-22-james.morse@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230913163823.7880-22-james.morse@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_173130_695227_9F84C031 
X-CRM114-Status: GOOD (  33.99  )
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
> struct acpi_scan_handler has a detach callback that is used to remove
> a driver when a bus is changed. When interacting with an eject-request,
> the detach callback is called before _EJ0.
> 
> This means the ACPI processor driver can't use _STA to determine if a
> CPU has been made not-present, or some of the other _STA bits have been
> changed. acpi_processor_remove() needs to know the value of _STA after
> _EJ0 has been called.
> 

It's helpful to mention which ACPI processor driver needs to use _STA
to determine the status here. I guess the ACPI processor driver will
behave differently depending on the status.

> Add a post_eject callback to struct acpi_scan_handler. This is called
> after acpi_scan_hot_remove() has successfully called _EJ0. Because
> acpi_bus_trim_one() also clears the handler pointer, it needs to be
> told if the caller will go on to call acpi_bus_post_eject(), so
> that acpi_device_clear_enumerated() and clearing the handler pointer
> can be deferred. The existing not-used pointer is used for this.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>   drivers/acpi/acpi_processor.c |  4 +--
>   drivers/acpi/scan.c           | 52 ++++++++++++++++++++++++++++++-----
>   include/acpi/acpi_bus.h       |  1 +
>   3 files changed, 48 insertions(+), 9 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
> index 22a15a614f95..00dcc23d49a8 100644
> --- a/drivers/acpi/acpi_processor.c
> +++ b/drivers/acpi/acpi_processor.c
> @@ -459,7 +459,7 @@ static int acpi_processor_add(struct acpi_device *device,
>   
>   #ifdef CONFIG_ACPI_HOTPLUG_PRESENT_CPU
>   /* Removal */
> -static void acpi_processor_remove(struct acpi_device *device)
> +static void acpi_processor_post_eject(struct acpi_device *device)
>   {
>   	struct acpi_processor *pr;
>   
> @@ -627,7 +627,7 @@ static struct acpi_scan_handler processor_handler = {
>   	.ids = processor_device_ids,
>   	.attach = acpi_processor_add,
>   #ifdef CONFIG_ACPI_HOTPLUG_PRESENT_CPU
> -	.detach = acpi_processor_remove,
> +	.post_eject = acpi_processor_post_eject,
>   #endif
>   	.hotplug = {
>   		.enabled = true,
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index a675333618ae..b6d2f01640a9 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -244,18 +244,28 @@ static int acpi_scan_try_to_offline(struct acpi_device *device)
>   	return 0;
>   }
>   
> -static int acpi_bus_trim_one(struct acpi_device *adev, void *not_used)
> +/**
> + * acpi_bus_trim_one() - Detach scan handlers and drivers from ACPI device
> + *                       objects.
> + * @adev:       Root of the ACPI namespace scope to walk.
> + * @eject:      Pointer to a bool that indicates if this was due to an
> + *              eject-request.
> + *
> + * Must be called under acpi_scan_lock.
> + * If @eject points to true, clearing the device enumeration is deferred until
> + * acpi_bus_post_eject() is called.
> + */
> +static int acpi_bus_trim_one(struct acpi_device *adev, void *eject)
>   {
>   	struct acpi_scan_handler *handler = adev->handler;
> +	bool is_eject = *(bool *)eject;
>   
> -	acpi_dev_for_each_child_reverse(adev, acpi_bus_trim_one, NULL);
> +	acpi_dev_for_each_child_reverse(adev, acpi_bus_trim_one, eject);
>   
>   	adev->flags.match_driver = false;
>   	if (handler) {
>   		if (handler->detach)
>   			handler->detach(adev);
> -
> -		adev->handler = NULL;
>   	} else {
>   		device_release_driver(&adev->dev);
>   	}
> @@ -265,7 +275,12 @@ static int acpi_bus_trim_one(struct acpi_device *adev, void *not_used)
>   	 */
>   	acpi_device_set_power(adev, ACPI_STATE_D3_COLD);
>   	adev->flags.initialized = false;
> -	acpi_device_clear_enumerated(adev);
> +
> +	/* For eject this is deferred to acpi_bus_post_eject() */
> +	if (!is_eject) {
> +		adev->handler = NULL;
> +		acpi_device_clear_enumerated(adev);
> +	}
>   
>   	return 0;
>   }
> @@ -278,15 +293,36 @@ static int acpi_bus_trim_one(struct acpi_device *adev, void *not_used)
>    */
>   void acpi_bus_trim(struct acpi_device *adev)
>   {
> -	acpi_bus_trim_one(adev, NULL);
> +	bool eject = false;
> +
> +	acpi_bus_trim_one(adev, &eject);
>   }
>   EXPORT_SYMBOL_GPL(acpi_bus_trim);
>   
> +static int acpi_bus_post_eject(struct acpi_device *adev, void *not_used)
> +{
> +	struct acpi_scan_handler *handler = adev->handler;
> +
> +	acpi_dev_for_each_child_reverse(adev, acpi_bus_post_eject, NULL);
> +
> +	if (handler) {
> +		if (handler->post_eject)
> +			handler->post_eject(adev);
> +
> +		adev->handler = NULL;
> +	}
> +
> +	acpi_device_clear_enumerated(adev);
> +
> +	return 0;
> +}
> +
>   static int acpi_scan_hot_remove(struct acpi_device *device)
>   {
>   	acpi_handle handle = device->handle;
>   	unsigned long long sta;
>   	acpi_status status;
> +	bool eject = true;
>   
>   	if (device->handler && device->handler->hotplug.demand_offline) {
>   		if (!acpi_scan_is_offline(device, true))
> @@ -299,7 +335,7 @@ static int acpi_scan_hot_remove(struct acpi_device *device)
>   
>   	acpi_handle_debug(handle, "Ejecting\n");
>   
> -	acpi_bus_trim(device);
> +	acpi_bus_trim_one(device, &eject);
>   
>   	acpi_evaluate_lck(handle, 0);
>   	/*
> @@ -322,6 +358,8 @@ static int acpi_scan_hot_remove(struct acpi_device *device)
>   	} else if (sta & ACPI_STA_DEVICE_ENABLED) {
>   		acpi_handle_warn(handle,
>   			"Eject incomplete - status 0x%llx\n", sta);
> +	} else {
> +		acpi_bus_post_eject(device, NULL);
>   	}
>   
>   	return 0;
> diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
> index 254685085c82..1b7e1acf925b 100644
> --- a/include/acpi/acpi_bus.h
> +++ b/include/acpi/acpi_bus.h
> @@ -127,6 +127,7 @@ struct acpi_scan_handler {
>   	bool (*match)(const char *idstr, const struct acpi_device_id **matchid);
>   	int (*attach)(struct acpi_device *dev, const struct acpi_device_id *id);
>   	void (*detach)(struct acpi_device *dev);
> +	void (*post_eject)(struct acpi_device *dev);
>   	void (*bind)(struct device *phys_dev);
>   	void (*unbind)(struct device *phys_dev);
>   	struct acpi_hotplug_profile hotplug;

Thanks,
Gavin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
