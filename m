Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C2BC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 15:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hjwutEdgzVzYOo8uUb+/yFG9wBYwwRRX4hVE4qhE9fw=; b=Elitw02RuDP4Ti
	zZBLKAYdcMW2tBGK5OUnqqGSmEHgS5kJUHjxzuzRBTzpDKMpbGQiX5V/KBRk3IT1QKrdfi31+hvNp
	qaqYBCMffFnzYoTOm1gz3sbYNWYz2GVwaWgJmpdTY0tL6fm7CK+xyGcux+7sTfSO/So80f74Ig0wC
	PlCNsPgfoWljX8O8Vwzxm0WVqd5ibP3X3ZW6n8F9SzdM1vhHJTkZst3BghdGiCOP01B0ZyKoI9mF0
	H8cALxklDvnJAB9l5uVYGhOtfiu4zq6H/zlmtITCBvcEHtJVgGPRSj1cNRe74faOw/qb8bkzj9iDE
	rhEftqNuwBGyk4c+UpqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zkx-005dCp-0v;
	Tue, 28 Nov 2023 15:12:11 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zkt-005dAq-23;
	Tue, 28 Nov 2023 15:12:08 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4SfmBn0tR3z6D8Wd;
	Tue, 28 Nov 2023 23:11:45 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 1E0A5140A9C;
	Tue, 28 Nov 2023 23:12:02 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 28 Nov
 2023 15:12:01 +0000
Date: Tue, 28 Nov 2023 15:12:00 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
CC: <linux-pm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<x86@kernel.org>, <linux-csky@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-ia64@vger.kernel.org>, <linux-parisc@vger.kernel.org>, Salil Mehta
	<salil.mehta@huawei.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<jianyong.wu@arm.com>, <justin.he@arm.com>, James Morse
	<james.morse@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
	<will@kernel.org>
Subject: Re: [PATCH RFC 13/22] arm64: setup: Switch over to
 GENERIC_CPU_DEVICES using arch_register_cpu()
Message-ID: <20231128151200.0000737c@Huawei.com>
In-Reply-To: <20231128150854.00005370@Huawei.com>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
	<E1r0JLl-00CTxk-7O@rmk-PC.armlinux.org.uk>
	<20231128150854.00005370@Huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_071207_819548_8489DF5C 
X-CRM114-Status: GOOD (  17.40  )
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

On Tue, 28 Nov 2023 15:08:54 +0000
Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:

> On Tue, 07 Nov 2023 10:30:25 +0000
> Russell King <rmk+kernel@armlinux.org.uk> wrote:
> 
> > From: James Morse <james.morse@arm.com>
> > 
> > To allow ACPI's _STA value to hide CPUs that are present, but not
> > available to online right now due to VMM or firmware policy, the
> > register_cpu() call needs to be made by the ACPI machinery when ACPI
> > is in use. This allows it to hide CPUs that are unavailable from sysfs.
> > 
> > Switching to GENERIC_CPU_DEVICES is an intermediate step to allow all
> > five ACPI architectures to be modified at once.
> > 
> > Switch over to GENERIC_CPU_DEVICES, and provide an arch_register_cpu()
> > that populates the hotpluggable flag. arch_register_cpu() is also the
> > interface the ACPI machinery expects.
> > 
> > The struct cpu in struct cpuinfo_arm64 is never used directly, remove
> > it to use the one GENERIC_CPU_DEVICES provides.
> > 
> > This changes the CPUs visible in sysfs from possible to present, but
> > on arm64 smp_prepare_cpus() ensures these are the same.
> > 
> > This patch also has the effect of moving the registration of CPUs from
> > subsys to driver core initialisation, prior to any initcalls running.
> > 
> > Signed-off-by: James Morse <james.morse@arm.com>
> > Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>  
> 
> Given this series adds an arch_cpu_is_hotpluggable() callback we probably
> want something in this patch description to say why this
> isn't using that, but instead overriding arch_register_cpu()
> 
As per comment on next patch I'm fine with this slight dance.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
