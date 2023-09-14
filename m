Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C77EEAA4E
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 14:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pszXUyElhujg/BgGyuw26CADY2tXQYTUgqyGMMZblU0=; b=lNFxXdPuiqafYW
	yNOe8/6vsuGyseGdiWRMCoG61ziUHoRy4QZ/v5VUhgWHn5rnkyB2EJQWvzU8f0HrRAtIf7YXV+dKI
	b8Wavmhi2baZm8qTT5lHrcGGBGWYTQUXqGo/lw5WMuDhv5UTyXEFaqlMstM3BltYCOpASfU0D0wHl
	5i9T+ujIukPkZq4gRv+VZwBArOaI5rZp5Rfu5H2eZHD4G5pKuQG7q1lbrvZe8hcFwfE9PL8NVjcw+
	maz75tj+PL8Ogd+ozNdhx9cw/6MCAbkXL5qOyJgqfXpJS4FKgwOh/yuT8Uj2fep6ZIRmnD1/jFcXP
	rdM9bVVppy45EfVANtOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgndh-008gJG-0S;
	Thu, 14 Sep 2023 14:48:17 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgndd-008gGM-2U;
	Thu, 14 Sep 2023 14:48:15 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RmgCS0cnFz6K5mL;
	Thu, 14 Sep 2023 22:47:32 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 14 Sep
 2023 15:48:08 +0100
Date: Thu, 14 Sep 2023 15:48:07 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-pm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<x86@kernel.org>, Salil Mehta <salil.mehta@huawei.com>, Russell King
	<linux@armlinux.org.uk>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<jianyong.wu@arm.com>, <justin.he@arm.com>
Subject: Re: [RFC PATCH v2 27/35] ACPICA: Add new MADT GICC flags fields
 [code first?]
Message-ID: <20230914154807.0000710d@Huawei.com>
In-Reply-To: <20230913163823.7880-28-james.morse@arm.com>
References: <20230913163823.7880-1-james.morse@arm.com>
	<20230913163823.7880-28-james.morse@arm.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_074813_947851_1272CF10 
X-CRM114-Status: GOOD (  13.96  )
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

On Wed, 13 Sep 2023 16:38:15 +0000
James Morse <james.morse@arm.com> wrote:

> Add the new flag field to the MADT's GICC structure.
> 
> 'Online Capable' indicates a disabled CPU can be enabled later.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
Why [code first?] it's in ACPI 6.5
https://uefi.org/sites/default/files/resources/ACPI_Spec_6_5_Aug29.pdf

Spec reference would be good though. It's 6.5 Tabel 5.37: GICC CPU Interface Flags
I think

> ---
> This patch probably needs to go via the upstream acpica project,
> but is included here so the feature can be testd.
tested

> ---
>  include/acpi/actbl2.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
> index 3751ae69432f..c433a079d8e1 100644
> --- a/include/acpi/actbl2.h
> +++ b/include/acpi/actbl2.h
> @@ -1046,6 +1046,7 @@ struct acpi_madt_generic_interrupt {
>  /* ACPI_MADT_ENABLED                    (1)      Processor is usable if set */
>  #define ACPI_MADT_PERFORMANCE_IRQ_MODE  (1<<1)	/* 01: Performance Interrupt Mode */
>  #define ACPI_MADT_VGIC_IRQ_MODE         (1<<2)	/* 02: VGIC Maintenance Interrupt mode */
> +#define ACPI_MADT_GICC_CPU_CAPABLE      (1<<3)	/* 03: CPU is online capable */
bikeshed colour time....

It's capable of being a CPU?

ACPI_MADT_GICC_ONLINE_CAPABLE 

GICC already tells us it's a CPU (last C) despite the table in ACPI being labeled
Table 5.37: GICC CPU Interface table



>  
>  /* 12: Generic Distributor (ACPI 5.0 + ACPI 6.0 changes) */
>  


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
