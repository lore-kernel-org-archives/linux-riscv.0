Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DFFC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 17:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n97VsfYWpgZOfvQf7qq2ou0wprVzY4tFzIML67c4ZSk=; b=En1Kw+rS3A6gHA
	FS0YrkTj9DGZ1RYOYwuwLGgwYyWEZc+OWMHuEu8c3ICLY4Dgzh2gl5u2bLZIJfKaB4wXascP2OmJt
	2xdn9trwzUGXR8UEqmM+W87hp6ZrwEwxZZDTbWZLjZqWSFtJifa2NU+2wzofgSfAPIzcc3p/PfZOu
	YHiiBK7+SFuE8RySRhkHNtYxk/jednyC5sbQ7C9Dd8O2j72Uw7CtOC1eKSaRFuWV8AYynydUlbo7r
	Lwl5tme9/1QKobVKfW9tJQIX8zNZlpMpBjJU/c6q5G31eC37S5AA8mwyMBgC6WigJlIyXIsKhx8nQ
	R918vBVB6KtM2uhVd2cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDpi2-000xI8-0L;
	Thu, 14 Dec 2023 17:41:18 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDphy-000xHC-2w;
	Thu, 14 Dec 2023 17:41:16 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4SrflK5yzwz6K61J;
	Fri, 15 Dec 2023 01:40:45 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 0FB9E1400DB;
	Fri, 15 Dec 2023 01:41:09 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 14 Dec
 2023 17:41:08 +0000
Date: Thu, 14 Dec 2023 17:41:07 +0000
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
Subject: Re: [PATCH RFC v3 05/21] ACPI: Rename ACPI_HOTPLUG_CPU to include
 'present'
Message-ID: <20231214174107.0000171f@Huawei.com>
In-Reply-To: <E1rDOgD-00Dvk2-3h@rmk-PC.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
	<E1rDOgD-00Dvk2-3h@rmk-PC.armlinux.org.uk>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_094115_092865_7C37DA1A 
X-CRM114-Status: GOOD (  14.06  )
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

On Wed, 13 Dec 2023 12:49:37 +0000
Russell King (Oracle) <rmk+kernel@armlinux.org.uk> wrote:

> From: James Morse <james.morse@arm.com>
> 
> The code behind ACPI_HOTPLUG_CPU allows a not-present CPU to become
> present. This isn't the only use of HOTPLUG_CPU. On arm64 and riscv
> CPUs can be taken offline as a power saving measure.
> 
> On arm64 an offline CPU may be disabled by firmware, preventing it from
> being brought back online, but it remains present throughout.
> 
> Adding code to prevent user-space trying to online these disabled CPUs
> needs some additional terminology.
> 
> Rename the Kconfig symbol CONFIG_ACPI_HOTPLUG_PRESENT_CPU to reflect
> that it makes possible CPUs present.
> 
> HOTPLUG_CPU is untouched as this is only about the ACPI mechanism.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Tested-by: Jianyong Wu <jianyong.wu@arm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Formatting nitpick inline. Either way FWIW:
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 4db54e928b36..36071bc11acd 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h

>  #ifdef CONFIG_ACPI_HOTPLUG_IOAPIC
>  int acpi_get_ioapic_id(acpi_handle handle, u32 gsi_base, u64 *phys_addr);
> @@ -629,7 +629,7 @@ static inline u32 acpi_osc_ctx_get_cxl_control(struct acpi_osc_context *context)
>  #define ACPI_GSB_ACCESS_ATTRIB_RAW_PROCESS	0x0000000F
>  
>  /* Enable _OST when all relevant hotplug operations are enabled */
> -#if defined(CONFIG_ACPI_HOTPLUG_CPU) &&			\
> +#if defined(CONFIG_ACPI_HOTPLUG_PRESENT_CPU) &&			\

Trivial but I think there is a tab to many before that \

>  	defined(CONFIG_ACPI_HOTPLUG_MEMORY) &&		\
>  	defined(CONFIG_ACPI_CONTAINER)
>  #define ACPI_HOTPLUG_OST


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
