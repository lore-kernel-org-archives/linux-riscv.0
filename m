Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA79EC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 16:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RqvSFN4zFR5jFOiynhfGDMYw4Vi+pjNx/hD3fQhsd9w=; b=KBvUgilFW7boRt
	dencoYVYjbfNWdy5jTt0QgZ78WOdBjj7AcI4ylgBwArhe27ZWqKt0EPVfX2BV6PA67u6tjybUbKoJ
	B7ZXXTj2igBdWeELtnFMBd4xCzfsDs0USOBgOlywI2cM5eTa7l2lx+TDoNbq7tJrj3gXKHn9YzX4/
	aF4mc1PJFOMp+UGP/L0OE4IWp6R+pAOKHG9IklL6lpRqN2SkCL1hv/3dTb1LkNBESdKyAXmKbAkWA
	ENLkXvD3LYQ0YaQmqAoTmXvXgXsUJrNefpxdzo7GQ2iYN4vVL2PfuIWynI5JitIbEUCMoUe4bJUKn
	5/ZvjHQJB+kE39J6gc2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8kDY-00BONF-0p;
	Thu, 30 Nov 2023 16:48:48 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8kDT-00BOLW-2I;
	Thu, 30 Nov 2023 16:48:45 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Sh2Cs19tDz6K9Bn;
	Fri,  1 Dec 2023 00:47:05 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id C919D140684;
	Fri,  1 Dec 2023 00:48:41 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 30 Nov
 2023 16:48:40 +0000
Date: Thu, 30 Nov 2023 16:48:40 +0000
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
	<james.morse@arm.com>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
	<kernel@xen0n.name>
Subject: Re: [PATCH 04/21] Loongarch: remove arch_*register_cpu() exports
Message-ID: <20231130164840.0000465f@Huawei.com>
In-Reply-To: <E1r5R2w-00Csyn-E2@rmk-PC.armlinux.org.uk>
References: <ZVyz/Ve5pPu8AWoA@shell.armlinux.org.uk>
	<E1r5R2w-00Csyn-E2@rmk-PC.armlinux.org.uk>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_084843_890549_052E8D5D 
X-CRM114-Status: GOOD (  13.81  )
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

On Tue, 21 Nov 2023 13:44:10 +0000
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> arch_register_cpu() and arch_unregister_cpu() are not used by anything
> that can be a module - they are used by drivers/base/cpu.c and
> drivers/acpi/acpi_processor.c, neither of which can be a module.
> 
> Remove the exports.
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  arch/loongarch/kernel/topology.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/loongarch/kernel/topology.c b/arch/loongarch/kernel/topology.c
> index 3fd166006698..ae860fe81536 100644
> --- a/arch/loongarch/kernel/topology.c
> +++ b/arch/loongarch/kernel/topology.c
> @@ -25,7 +25,6 @@ int arch_register_cpu(int cpu)
>  
>  	return ret;
>  }
> -EXPORT_SYMBOL(arch_register_cpu);
>  
>  void arch_unregister_cpu(int cpu)
>  {
> @@ -34,7 +33,6 @@ void arch_unregister_cpu(int cpu)
>  	c->hotpluggable = 0;
>  	unregister_cpu(c);
>  }
> -EXPORT_SYMBOL(arch_unregister_cpu);
>  #endif
>  
>  static int __init topology_init(void)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
