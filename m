Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF9EEEAA45
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 14:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U1baWf872+tKfycJ537mqS3kvXCTbdJzZMYSy3VA/w4=; b=iu1cmlqSV+TmAC
	3RBM0N6poIdr+SKXbvzjkh1pr8+FRCLSWp5jYjBhKqz0Vuo/qNpZP37+Gyzg3zxxZ2ubpnDdGJHQA
	ciZoiiXxpjHJv/PNSxO6cNzSsjQ1unUIqVanQGA77UXz8GsbaHUJjV8MNlZZ4m+O0hSuvEFvbfvsL
	ysp8y905JGF1uju8NPkU2BJruF8i6dMXZbAYEMvB3OntACS08IJj9MiR98jNePMRLBANvVdA0Nrhy
	G2OhtPeLkIuywvDFKCiHWuv/brEQ7OKNZctRJdSbSzvCyJ5QtCTdD5bdd+CtFJkm+QLZXl9QKDwv3
	cyQH5jzxBAQ9DIBDHrVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnOA-008dwe-1f;
	Thu, 14 Sep 2023 14:32:14 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnO8-008dvY-0O;
	Thu, 14 Sep 2023 14:32:13 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RmfmH4clgz67KXG;
	Thu, 14 Sep 2023 22:27:27 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 14 Sep
 2023 15:32:08 +0100
Date: Thu, 14 Sep 2023 15:32:07 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-pm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<x86@kernel.org>, Salil Mehta <salil.mehta@huawei.com>, Russell King
	<linux@armlinux.org.uk>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<jianyong.wu@arm.com>, <justin.he@arm.com>
Subject: Re: [RFC PATCH v2 23/35] ACPI: Warn when the present bit changes
 but the feature is not enabled
Message-ID: <20230914153207.00006492@Huawei.com>
In-Reply-To: <20230913163823.7880-24-james.morse@arm.com>
References: <20230913163823.7880-1-james.morse@arm.com>
	<20230913163823.7880-24-james.morse@arm.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_073212_300858_BF0C6231 
X-CRM114-Status: GOOD (  17.90  )
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

On Wed, 13 Sep 2023 16:38:11 +0000
James Morse <james.morse@arm.com> wrote:

> ACPI firmware can trigger the events to add and remove CPUs, but the
> OS may not support this.
> 
> Print a warning when this happens.
> 
> This gives early warning on arm64 systems that don't support
> CONFIG_ACPI_HOTPLUG_PRESENT_CPU, as making CPUs not present has
> side effects for other parts of the system.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
Seem like a good idea to me.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/acpi/acpi_processor.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
> index 2cafea1edc24..b67616079751 100644
> --- a/drivers/acpi/acpi_processor.c
> +++ b/drivers/acpi/acpi_processor.c
> @@ -188,8 +188,10 @@ static int acpi_processor_make_present(struct acpi_processor *pr)
>  	acpi_status status;
>  	int ret;
>  
> -	if (!IS_ENABLED(CONFIG_ACPI_HOTPLUG_PRESENT_CPU))
> +	if (!IS_ENABLED(CONFIG_ACPI_HOTPLUG_PRESENT_CPU)) {
> +		pr_err_once("Changing CPU present bit is not supported\n");
>  		return -ENODEV;
> +	}
>  
>  	if (invalid_phys_cpuid(pr->phys_id))
>  		return -ENODEV;
> @@ -462,8 +464,10 @@ static void acpi_processor_make_not_present(struct acpi_device *device)
>  {
>  	struct acpi_processor *pr;
>  
> -	if (!IS_ENABLED(CONFIG_ACPI_HOTPLUG_PRESENT_CPU))
> +	if (!IS_ENABLED(CONFIG_ACPI_HOTPLUG_PRESENT_CPU)) {
> +		pr_err_once("Changing CPU present bit is not supported");
>  		return;
> +	}
>  
>  	pr = acpi_driver_data(device);
>  	if (pr->id >= nr_cpu_ids)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
