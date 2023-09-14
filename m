Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C117BEEAA50
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 14:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Csz1A1U8+Imss+5kCF/yCTFcIiwXGKLYt7IVrl4ZAw=; b=eiYuk9sYxb0epl
	e7+p/+7Rv6copiaHHGsClJeOrlFWZIne65kGDiWzwLDSbqokw7zVa4HoG8B5U2pJMjIZ322MbUheD
	1uHB7Z6uiEchkCKhQz0eaqgVyBusR/rtWeTSq0W/J094t2HIta3bvyGUBanFz9bOFIin4JYyB/+Rz
	S1JBN5OJvTkGneY8vfrz8jycAvQ8AZtYtx3ri0e0WMZQB+8MfL2Ubt9mRrqv7wYmKI5Y3nvC6SuOk
	RR8MgrJSXf+RzWY0vW5eIT0tqi3pOqco113Il1BhJxe4oJKKGcuj8IcnU6B3+lycGUa6xpqXkRdDq
	Ycp7+O35EZTpZhC2sPyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnWw-008fAg-0P;
	Thu, 14 Sep 2023 14:41:18 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnWs-008f9U-25;
	Thu, 14 Sep 2023 14:41:15 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Rmfyl2yvtz6J7Pn;
	Thu, 14 Sep 2023 22:36:31 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 14 Sep
 2023 15:41:12 +0100
Date: Thu, 14 Sep 2023 15:41:11 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-pm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<x86@kernel.org>, Salil Mehta <salil.mehta@huawei.com>, Russell King
	<linux@armlinux.org.uk>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<jianyong.wu@arm.com>, <justin.he@arm.com>
Subject: Re: [RFC PATCH v2 25/35] LoongArch: Use the __weak version of
 arch_unregister_cpu()
Message-ID: <20230914154111.0000189d@Huawei.com>
In-Reply-To: <20230913163823.7880-26-james.morse@arm.com>
References: <20230913163823.7880-1-james.morse@arm.com>
	<20230913163823.7880-26-james.morse@arm.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_074114_823022_59E8827A 
X-CRM114-Status: GOOD (  11.72  )
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

On Wed, 13 Sep 2023 16:38:13 +0000
James Morse <james.morse@arm.com> wrote:

> LoongArch provides its own arch_unregister_cpu(). This clears the
> hotpluggable flag, then unregisters the CPU.
> 
> It isn't necessary to clear the hotpluggable flag when unregistering
> a cpu. unregister_cpu() writes NULL to the percpu cpu_sys_devices
> pointer, meaning cpu_is_hotpluggable() will return false, as
> get_cpu_device() has returned NULL.

Thought that looked odd earlier but didn't care enough to dig.
Seem unlikely state would persist for an unregistered cpu.
Great to see confirmation.

> 
> Remove arch_unregister_cpu() and use the __weak version.
> 
> Signed-off-by: James Morse <james.morse@arm.com>

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>


> ---
>  arch/loongarch/kernel/topology.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/arch/loongarch/kernel/topology.c b/arch/loongarch/kernel/topology.c
> index 8e4441c1ff39..5a75e2cc0848 100644
> --- a/arch/loongarch/kernel/topology.c
> +++ b/arch/loongarch/kernel/topology.c
> @@ -16,13 +16,4 @@ int arch_register_cpu(int cpu)
>  	return register_cpu(c, cpu);
>  }
>  EXPORT_SYMBOL(arch_register_cpu);
> -
> -void arch_unregister_cpu(int cpu)
> -{
> -	struct cpu *c = &per_cpu(cpu_devices, cpu);
> -
> -	c->hotpluggable = 0;
> -	unregister_cpu(c);
> -}
> -EXPORT_SYMBOL(arch_unregister_cpu);
>  #endif


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
