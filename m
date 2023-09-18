Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF81BCD37B0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 04:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4TLo7vOb/2dhFsGpyahY0YNIj+aIeFxopWEhSBqASpU=; b=UMmY93c1Kd8KyW
	q4p/Dq9nznCFYiGxo291nqpE7jd6lBJdBl3jtvulWOJLHU3vDkjB9sNxL6bMNgGOxdVvwpwdxVm2Y
	Lg2KOCwAefeKDrpUARID5FxSvEEDfzs76yH4PY5KqB865oAnYMVFWx+70AUveECipH+UXd7gQEVZw
	tDiuKeDRqzFxlZLb8oDFY5q1FvbOBDkEUE+KUS0ikloChugzHiqHF6bLZe/jGhNWQDmhBCelTdqJx
	CR9zoKCNSP4MWrYjdQGIeVOYq9YdP+Jnw3+Jy4QvMbTCmvevdONs+wDB2xCyoID3ClUCqBzGL8ALl
	DhYxXU9AYKwbfHCflouQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi5eG-00EMRy-0H;
	Mon, 18 Sep 2023 04:14:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi5eC-00EMQ1-1G
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 04:14:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695010445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+naNdgA3bFvfUIv4tJXTTMUwzR4YQ9euXBZfFED9oXc=;
	b=bl3l2u1XqElK6jVzafWBPtI31I0ra3u+VMoFEAOOl63/FZT9tlCg9ax7O70Q5mt7xaTJOv
	gkSqvhhHJ+EFj1yi8LW/lFFBFMX0InTZ+ZH5vNFXXn4IxmNKKk0RphOZ/JDJfRVKgxE3aF
	GSDIE7RCLwwdq5le0/HB/NfYzRYvvlo=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-jGjIWXQkPiqYjIEAxYSCzQ-1; Mon, 18 Sep 2023 00:13:59 -0400
X-MC-Unique: jGjIWXQkPiqYjIEAxYSCzQ-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-274d83f0f5fso1314220a91.1
        for <linux-riscv@lists.infradead.org>; Sun, 17 Sep 2023 21:13:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695010438; x=1695615238;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+naNdgA3bFvfUIv4tJXTTMUwzR4YQ9euXBZfFED9oXc=;
        b=EXlN6hO4n2rvg05m/axEPmw1H2W3zrz+r0PexxIZPro4jFhtDQ/IFp8KCpBnceGio2
         yMhBgAFsmXuGzgR7QIdLtpafqRnDmWQOPshdVU00NbQHIGwCAbI6lRl5Ds0eKPQoYWNz
         t7pNAQlKsPIOy/VsH242wwH445APvYo8K+Jc2RvbyU+eyZ2RfV3TSHCfd56u3n6wbuHz
         E8RI+aGfnhwI0AjrQkePAfbrmAG8dLgBLEWCpPxuj/dP2EE85/o/KftEqhrLdPNWoPny
         Kfhbm/CEAHLdH06fYbOmCHyOUY6yPEA3gVpgrlTaoB4nRRAi9MaE4XfpS8/w0OCsqQA9
         V37w==
X-Gm-Message-State: AOJu0YwjeJea2mPrUGMbaAGIMBoJBe92CJBHwORI6JoDAPDOkNCzyZyC
	KhCSpZc65XTCIoWa838UIFmBg1dpgAGD682igk434r1CFD3MWLiH9gxiOW6T4DXpZV3pagQ4NoX
	SDHANU4uXFNgsZbQHI6f3ecgXTYK1
X-Received: by 2002:a17:90b:a4a:b0:268:d05c:2d7e with SMTP id gw10-20020a17090b0a4a00b00268d05c2d7emr7199790pjb.14.1695010438620;
        Sun, 17 Sep 2023 21:13:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1foMotPOeb/U6/yukF28+ks3ZQRkPSCrKuGwYeHbXeH4thsw0w9Gpz7n9powcJl9wMU41Zg==
X-Received: by 2002:a17:90b:a4a:b0:268:d05c:2d7e with SMTP id gw10-20020a17090b0a4a00b00268d05c2d7emr7199783pjb.14.1695010438337;
        Sun, 17 Sep 2023 21:13:58 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id s8-20020a17090a074800b00262eb0d141esm6923176pje.28.2023.09.17.21.13.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Sep 2023 21:13:57 -0700 (PDT)
Message-ID: <e364c6e3-4900-404e-54e9-a634eca4384a@redhat.com>
Date: Mon, 18 Sep 2023 14:13:50 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH v2 13/35] ACPI: Rename acpi_scan_device_not_present()
 to be about enumeration
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
 <20230913163823.7880-14-james.morse@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230913163823.7880-14-james.morse@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_211408_691873_80DCF6FA 
X-CRM114-Status: GOOD (  19.45  )
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
> acpi_scan_device_not_present() is called when a device in the
> hierarchy is not available for enumeration. Historically enumeration
> was only based on whether the device was present.
> 
> To add support for only enumerating devices that are both present
> and enabled, this helper should be renamed. It was only ever about
> enumeration, rename it acpi_scan_device_not_enumerated().
> 
> No change in behaviour is intended.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>   drivers/acpi/scan.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index ed01e19514ef..17ab875a7d4e 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -289,10 +289,10 @@ static int acpi_scan_hot_remove(struct acpi_device *device)
>   	return 0;
>   }
>   
> -static int acpi_scan_device_not_present(struct acpi_device *adev)
> +static int acpi_scan_device_not_enumerated(struct acpi_device *adev)
>   {
>   	if (!acpi_device_enumerated(adev)) {
> -		dev_warn(&adev->dev, "Still not present\n");
> +		dev_warn(&adev->dev, "Still not enumerated\n");
>   		return -EALREADY;
>   	}
>   	acpi_bus_trim(adev);
> @@ -327,7 +327,7 @@ static int acpi_scan_device_check(struct acpi_device *adev)
>   			error = -ENODEV;
>   		}
>   	} else {
> -		error = acpi_scan_device_not_present(adev);
> +		error = acpi_scan_device_not_enumerated(adev);
>   	}
>   	return error;
>   }
> @@ -339,7 +339,7 @@ static int acpi_scan_bus_check(struct acpi_device *adev, void *not_used)
>   
>   	acpi_bus_get_status(adev);
>   	if (!acpi_device_is_present(adev)) {
> -		acpi_scan_device_not_present(adev);
> +		acpi_scan_device_not_enumerated(adev);
>   		return 0;
>   	}
>   	if (handler && handler->hotplug.scan_dependent)

Thanks,
Gavin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
