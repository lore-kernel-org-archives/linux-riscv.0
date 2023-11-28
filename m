Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D340AC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 15:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vB0Jb7DtR+9dG3RTOzdWIhij8s708oz/Wd/oQ9nvmV4=; b=E71cfhNg7hB3TS
	12BtEkfXNRX+3tFbunGGcuAAB9fYk1pVf4cuu2bFPK350z+bsQ72csDk7EjjUdJzya5q+hoJznb/z
	6XDiqMCB2j6y1v0R5/pZZbYuvdaUGQOgtRMkSLeMenLneceCRD/pYjPjTWRqopHrYMWZaOWcWhofS
	ip2rT4UAxSW8BixMGIrayCxa2VvHMW9xyggOUX0GIjyaf+8fGhpq8niG80CYaeU7txqj+4VPTIBwB
	zhnfeQoi4SsJFWWgD0XOa8pG3v7ea1cw1t7NS1HDJ15e3qf7M/Ga/ll5OogvUUWweowjfSWAR6Keh
	E71UzxQxzitrWFUwTZIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zrC-005ecG-0I;
	Tue, 28 Nov 2023 15:18:38 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zr8-005eZY-2R;
	Tue, 28 Nov 2023 15:18:36 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4SfmLD0Yx2z6D8YZ;
	Tue, 28 Nov 2023 23:18:12 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 171B2140D30;
	Tue, 28 Nov 2023 23:18:29 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 28 Nov
 2023 15:18:28 +0000
Date: Tue, 28 Nov 2023 15:18:27 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
CC: <linux-pm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<x86@kernel.org>, <linux-csky@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-ia64@vger.kernel.org>, <linux-parisc@vger.kernel.org>, Salil Mehta
	<salil.mehta@huawei.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<jianyong.wu@arm.com>, <justin.he@arm.com>, James Morse
	<james.morse@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH RFC 17/22] x86/topology: convert to use
 arch_cpu_is_hotpluggable()
Message-ID: <20231128151827.0000689e@Huawei.com>
In-Reply-To: <E1r0JM5-00CTyD-Ri@rmk-PC.armlinux.org.uk>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
	<E1r0JM5-00CTyD-Ri@rmk-PC.armlinux.org.uk>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_071834_934580_04419336 
X-CRM114-Status: GOOD (  14.62  )
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

On Tue, 07 Nov 2023 10:30:45 +0000
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> Convert x86 to use the arch_cpu_is_hotpluggable() helper rather than
> arch_register_cpu().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

As with earlier set of related changes, could squash this down to avoid
churn and use Co-developed or similar. Up to you though.

Maybe a forwards reference to this being a later change in the patch 15
description might be good though!
> ---
>  arch/x86/kernel/topology.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/kernel/topology.c b/arch/x86/kernel/topology.c
> index 211863cb5b81..d42c28b8bfd8 100644
> --- a/arch/x86/kernel/topology.c
> +++ b/arch/x86/kernel/topology.c
> @@ -36,11 +36,8 @@
>  #include <asm/cpu.h>
>  
>  #ifdef CONFIG_HOTPLUG_CPU
> -int arch_register_cpu(int cpu)
> +bool arch_cpu_is_hotpluggable(int cpu)
>  {
> -	struct cpu *c = per_cpu_ptr(&cpu_devices, cpu);
> -
> -	c->hotpluggable = cpu > 0;
> -	return register_cpu(c, cpu);
> +	return cpu > 0;
>  }
>  #endif /* CONFIG_HOTPLUG_CPU */


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
