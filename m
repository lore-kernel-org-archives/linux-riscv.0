Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62732EEAA40
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 14:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hB0Q2PF7bVhDtg2KvneqPBtYuIPWWtiZtj6rKrFJA7Q=; b=0SLn+G8QRFGFB+
	UF28ZiD88FVYbmiCUK//3RpOC2bT0R4ybFB6KT8Wv/OVrb/Aym6M6Hjdnks4A+QBsQ1nZMo+Zi+a3
	fuFr++17oo6R7O10Vjwn8CoS7QCHut/tDrus8KmU8pNwvRoaFJG9MC/w3Yqcu3kVAPcYYa7yBbks/
	8AKQoqD+mGzEzsrfMvT6XdZ93salthYNmMlJuQsPPiAW54GyNq+h+JnDl8jhXoeB18DEF0AKR9zGy
	ozhWWC99wvc+8kkScTNgabbkb0u5P1K2qW6cC4Y2SsJnCoNBDuxCEhmy3s6qleSl8EiF7lZw+aTNZ
	ynaVAyeTFi6SKyEL8A3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgn3F-008bHP-1T;
	Thu, 14 Sep 2023 14:10:37 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgn3B-008bFr-2J;
	Thu, 14 Sep 2023 14:10:35 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RmfMy0jWJz67Q1Y;
	Thu, 14 Sep 2023 22:09:50 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 14 Sep
 2023 15:10:26 +0100
Date: Thu, 14 Sep 2023 15:10:25 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-pm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<x86@kernel.org>, Salil Mehta <salil.mehta@huawei.com>, Russell King
	<linux@armlinux.org.uk>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<jianyong.wu@arm.com>, <justin.he@arm.com>
Subject: Re: [RFC PATCH v2 19/35] ACPI: Move acpi_bus_trim_one() before
 acpi_scan_hot_remove()
Message-ID: <20230914151025.00003cef@Huawei.com>
In-Reply-To: <20230913163823.7880-20-james.morse@arm.com>
References: <20230913163823.7880-1-james.morse@arm.com>
	<20230913163823.7880-20-james.morse@arm.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_071034_034227_42D9DEB1 
X-CRM114-Status: GOOD (  20.58  )
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

On Wed, 13 Sep 2023 16:38:07 +0000
James Morse <james.morse@arm.com> wrote:

> A subsequent patch will change acpi_scan_hot_remove() to call
> acpi_bus_trim_one() instead of acpi_bus_trim(), meaning it can no longer
> rely on the prototype in the header file.
> 
> Move these functions further up the file.
> No change in behaviour.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
FWIW
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/acpi/scan.c | 76 ++++++++++++++++++++++-----------------------
>  1 file changed, 38 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index f898591ce05f..a675333618ae 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -244,6 +244,44 @@ static int acpi_scan_try_to_offline(struct acpi_device *device)
>  	return 0;
>  }
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
>  static int acpi_scan_hot_remove(struct acpi_device *device)
>  {
>  	acpi_handle handle = device->handle;
> @@ -2506,44 +2544,6 @@ int acpi_bus_scan(acpi_handle handle)
>  }
>  EXPORT_SYMBOL(acpi_bus_scan);
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
>  int acpi_bus_register_early_device(int type)
>  {
>  	struct acpi_device *device = NULL;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
