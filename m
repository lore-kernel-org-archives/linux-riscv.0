Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB5BC4167D
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 17:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ojjHNtSC3S4hrZ8gmilVUH1Duynv0xmrdVW6T4ijel0=; b=2w39RN1r6u1dze
	nd8+IO0oB+2kRHoJLZYOcgy2DLaqbiegOlTjBtbTXY3JNbgbqh15UCzbPkFneMiZQkLf7G+a3Q6aN
	2IKNtn03fUQxpCxxKR+sasN/e8fud0T5byBvSkV0yqkQ4XdHxincECV1dIXN2nf3xNtUGMS+qfgvN
	j+6acFXBBYyqlVAuGUNN1MPo0rA7Q8qaCJCCYpMDaBxr2JxcDkFT9ZirpIcJKykB92KpOXv8i+IgG
	rZeuB8yTit+dsrIxzMsuDgSUWSRtf9+I8T/KmKM2dRiWTinm5LbtlQq/whQsIWeafbiF/0jKXJ+4Z
	t2dxLuIn3s94twRsOKzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDpdX-000wNH-2Q;
	Thu, 14 Dec 2023 17:36:39 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDpdR-000wGC-1m;
	Thu, 14 Dec 2023 17:36:38 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Srfc62XW9z688KN;
	Fri, 15 Dec 2023 01:34:30 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id CC9911400DB;
	Fri, 15 Dec 2023 01:36:27 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 14 Dec
 2023 17:36:27 +0000
Date: Thu, 14 Dec 2023 17:36:26 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
CC: <linux-pm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<x86@kernel.org>, <acpica-devel@lists.linuxfoundation.org>,
	<linux-csky@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-ia64@vger.kernel.org>, <linux-parisc@vger.kernel.org>, Salil Mehta
	<salil.mehta@huawei.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<jianyong.wu@arm.com>, <justin.he@arm.com>, James Morse <james.morse@arm.com>
Subject: Re: [PATCH RFC v3 02/21] ACPI: processor: Add support for
 processors described as container packages
Message-ID: <20231214173626.00005062@Huawei.com>
In-Reply-To: <E1rDOfx-00Dvje-MS@rmk-PC.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
	<E1rDOfx-00Dvje-MS@rmk-PC.armlinux.org.uk>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_093633_871692_A29E04EE 
X-CRM114-Status: GOOD (  27.19  )
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

On Wed, 13 Dec 2023 12:49:21 +0000
Russell King (Oracle) <rmk+kernel@armlinux.org.uk> wrote:

> From: James Morse <james.morse@arm.com>
> 
> ACPI has two ways of describing processors in the DSDT. From ACPI v6.5,
> 5.2.12:
> 
> "Starting with ACPI Specification 6.3, the use of the Processor() object
> was deprecated. Only legacy systems should continue with this usage. On
> the Itanium architecture only, a _UID is provided for the Processor()
> that is a string object. This usage of _UID is also deprecated since it
> can preclude an OSPM from being able to match a processor to a
> non-enumerable device, such as those defined in the MADT. From ACPI
> Specification 6.3 onward, all processor objects for all architectures
> except Itanium must now use Device() objects with an _HID of ACPI0007,
> and use only integer _UID values."
> 
> Also see https://uefi.org/specs/ACPI/6.5/08_Processor_Configuration_and_Control.html#declaring-processors
> 
> Duplicate descriptions are not allowed, the ACPI processor driver already
> parses the UID from both devices and containers. acpi_processor_get_info()
> returns an error if the UID exists twice in the DSDT.
> 
> The missing probe for CPUs described as packages creates a problem for
> moving the cpu_register() calls into the acpi_processor driver, as CPUs
> described like this don't get registered, leading to errors from other
> subsystems when they try to add new sysfs entries to the CPU node.
> (e.g. topology_sysfs_init()'s use of topology_add_dev() via cpuhp)
> 
> To fix this, parse the processor container and call acpi_processor_add()
> for each processor that is discovered like this. The processor container
> handler is added with acpi_scan_add_handler(), so no detach call will
> arrive.
> 
> Qemu TCG describes CPUs using processor devices in a processor container.
> For more information, see build_cpus_aml() in Qemu hw/acpi/cpu.c and
> https://uefi.org/specs/ACPI/6.5/08_Processor_Configuration_and_Control.html#processor-container-device
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Tested-by: Jianyong Wu <jianyong.wu@arm.com>
> ---
> Outstanding comments:
>  https://lore.kernel.org/r/20230914145353.000072e2@Huawei.com
Looks like you resolved those (were all patch description things).

So I'm happy.
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Thanks,

J
>  https://lore.kernel.org/r/50571c2f-aa3c-baeb-3add-cd59e0eddc02@redhat.com
> ---
>  drivers/acpi/acpi_processor.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
> index 4fe2ef54088c..6a542e0ce396 100644
> --- a/drivers/acpi/acpi_processor.c
> +++ b/drivers/acpi/acpi_processor.c
> @@ -626,9 +626,31 @@ static struct acpi_scan_handler processor_handler = {
>  	},
>  };
>  
> +static acpi_status acpi_processor_container_walk(acpi_handle handle,
> +						 u32 lvl,
> +						 void *context,
> +						 void **rv)
> +{
> +	struct acpi_device *adev;
> +	acpi_status status;
> +
> +	adev = acpi_get_acpi_dev(handle);
> +	if (!adev)
> +		return AE_ERROR;
> +
> +	status = acpi_processor_add(adev, &processor_device_ids[0]);
> +	acpi_put_acpi_dev(adev);
> +
> +	return status;
> +}
> +
>  static int acpi_processor_container_attach(struct acpi_device *dev,
>  					   const struct acpi_device_id *id)
>  {
> +	acpi_walk_namespace(ACPI_TYPE_PROCESSOR, dev->handle,
> +			    ACPI_UINT32_MAX, acpi_processor_container_walk,
> +			    NULL, NULL, NULL);
> +
>  	return 1;
>  }
>  


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
