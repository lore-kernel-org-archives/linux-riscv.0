Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695B3EDE9A8
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 11:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z0kvh2gMaNsow+J9DN+CcJtKVPh6H+FdYUyfAsjQPPc=; b=eR/r+zqgDgc623
	yYfYrSQQi3iKzM2kdBH00UPjk/LlvUnyft9rkuBkkFNE7xW/0HiL+tgJAciiJPw3FU9RdB6zuEFN5
	Ny1QjPpjF2B+sfwqSkddq9T0QQ5wrJJxXUbjJ62Mj8PnucjvGKDA93ZUAiPwcyRuPllE+Ok/N7CUZ
	QhqVmmnwYyf4Zujry6jkRSRE0dNrxpSBv6b4NgEtqKvPwhUOzpK5qmTHM9cYwCYad7LkfHQUixOJW
	Ea5TkL5EwlvPNAfuuXlwMN0BVOrepXk4vXKfW/QUTpolzp87T4s1UUwLjh3T+b6Izl+DAuiHdoKwx
	mGMByq13AcBqrGokpfBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgki4-008FqK-0l;
	Thu, 14 Sep 2023 11:40:36 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgkhz-008Fp5-2I;
	Thu, 14 Sep 2023 11:40:33 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RmZy93y83z6J6kK;
	Thu, 14 Sep 2023 19:35:45 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 14 Sep
 2023 12:40:25 +0100
Date: Thu, 14 Sep 2023 12:40:25 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-pm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<x86@kernel.org>, Salil Mehta <salil.mehta@huawei.com>, Russell King
	<linux@armlinux.org.uk>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<jianyong.wu@arm.com>, <justin.he@arm.com>
Subject: Re: [RFC PATCH v2 08/35] x86/topology: Switch over to
 GENERIC_CPU_DEVICES
Message-ID: <20230914124025.00006396@Huawei.com>
In-Reply-To: <20230913163823.7880-9-james.morse@arm.com>
References: <20230913163823.7880-1-james.morse@arm.com>
	<20230913163823.7880-9-james.morse@arm.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_044031_897303_2EA483B8 
X-CRM114-Status: GOOD (  16.13  )
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

On Wed, 13 Sep 2023 16:37:56 +0000
James Morse <james.morse@arm.com> wrote:

> Now that GENERIC_CPU_DEVICES calls arch_register_cpu(), which can be
> overridden by the arch code, switch over to this to allow common code
> to choose when the register_cpu() call is made.
> 
> x86's struct cpus come from struct x86_cpu, which has no other members
> or users. Remove this and use the version defined by common code.
> 
> This is an intermediate step to the logic being moved to drivers/acpi,
> where GENERIC_CPU_DEVICES will do the work when booting with acpi=off.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ----
> Changes since RFC:
>  * Fixed the second copy of arch_register_cpu() used for non-hotplug

Hi James,

See below for comment on this.  Upshot - I think you can delete that
function instead and rely on the weak version.

If you can't because of a later change, useful to call that out
in this patch description for those like me who read an review
in a linear fashion!

...

>  EXPORT_SYMBOL(arch_unregister_cpu);
>  #else /* CONFIG_HOTPLUG_CPU */
>  
> -int __init arch_register_cpu(int num)
> +int arch_register_cpu(int num)
>  {
> -	return register_cpu(&per_cpu(cpu_devices, num).cpu, num);
> +	return register_cpu(&per_cpu(cpu_devices, num), num);
>  }

Looks like the weak version introduced in patch 3.  Can this
implementation go away and fallback to that?

>  #endif /* CONFIG_HOTPLUG_CPU */
> -
> -static int __init topology_init(void)
> -{
> -	int i;
> -
> -	for_each_present_cpu(i)
> -		arch_register_cpu(i);
> -
> -	return 0;
> -}
> -subsys_initcall(topology_init);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
