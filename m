Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5B4CD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 12:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OqYnksQPtJk2QFtcyWRY247Jfv759sZXqn2CCLs7LyM=; b=CXjKpCjTb/+dIy
	oPJaIw6uzHDKtKyLqQHmStKzthSfE+hxmmQdQ8k2sG8YxnJCEn6nH2VH5aJNWuSe5PzAXWV4NVrDY
	f6aX8QB/MhofyBigI7/gQMPPf+dinS4+tIVSFAwV1Py5szt59ky0yJcLc163BUknbahAY2xjkqG4Q
	as+skjSJvhDRGSwq/WpY0O8CXfnrStpBgqIIPmraRAqyuvaNkts8tdbdhvdbB2Xv2N7NMXnDGYimb
	9+lhxLVL/V7xAan/itfvZn0sY1fsxl7XNzSCFKd/0Yg4Z58A+TRzSRERZbczLboTTPT2KzAjI7xcF
	mI2RpBeQ43IckDCj2UhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruXIa-00000006vjA-00nz;
	Wed, 10 Apr 2024 12:43:32 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruXIU-00000006vgC-2PWo;
	Wed, 10 Apr 2024 12:43:29 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4VF2Wn6z5Vz6K6Cs;
	Wed, 10 Apr 2024 20:41:41 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id AB478140DD4;
	Wed, 10 Apr 2024 20:43:19 +0800 (CST)
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 10 Apr
 2024 13:43:19 +0100
Date: Wed, 10 Apr 2024 13:43:18 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
CC: Russell King <rmk+kernel@armlinux.org.uk>, <linux-pm@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linux-acpi@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <x86@kernel.org>,
	<acpica-devel@lists.linuxfoundation.org>, <linux-csky@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-ia64@vger.kernel.org>,
	<linux-parisc@vger.kernel.org>, Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>, <jianyong.wu@arm.com>,
	<justin.he@arm.com>, James Morse <james.morse@arm.com>
Subject: Re: [PATCH RFC v4 02/15] ACPI: processor: Register all CPUs from
 acpi_processor_get_info()
Message-ID: <20240410134318.0000193c@huawei.com>
In-Reply-To: <20240322185327.00002416@Huawei.com>
References: <Zbp5xzmFhKDAgHws@shell.armlinux.org.uk>
	<E1rVDmU-0027YP-Jz@rmk-PC.armlinux.org.uk>
	<CAJZ5v0iiJpUWq5GMSnKFWQTzn_bdwoQz9m=hDaXNg4Lj_ePF4g@mail.gmail.com>
	<20240322185327.00002416@Huawei.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_054327_045966_CE017A45 
X-CRM114-Status: GOOD (  17.94  )
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

> >   
> > > diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
> > > index 47de0f140ba6..13d052bf13f4 100644
> > > --- a/drivers/base/cpu.c
> > > +++ b/drivers/base/cpu.c
> > > @@ -553,7 +553,11 @@ static void __init cpu_dev_register_generic(void)
> > >  {
> > >         int i, ret;
> > >
> > > -       if (!IS_ENABLED(CONFIG_GENERIC_CPU_DEVICES))
> > > +       /*
> > > +        * When ACPI is enabled, CPUs are registered via
> > > +        * acpi_processor_get_info().
> > > +        */
> > > +       if (!IS_ENABLED(CONFIG_GENERIC_CPU_DEVICES) || !acpi_disabled)
> > >                 return;    
> > 
> > Honestly, this looks like a quick hack to me and it absolutely
> > requires an ACK from the x86 maintainers to go anywhere.  
> Will address this separately.
> 

So do people prefer this hack, or something along lines of the following?

static int __init cpu_dev_register_generic(void)
{
        int i, ret = 0;

        for_each_online_cpu(i) {
                if (!get_cpu_device(i)) {
                        ret = arch_register_cpu(i);
                        if (ret)
                                pr_warn("register_cpu %d failed (%d)\n", i, ret);
                }
        }
	//Probably just eat the error.
        return 0;
}
subsys_initcall_sync(cpu_dev_register_generic);

Which may look familiar at it's effectively patch 3 from v3 which was dealing
with CPUs missing from DSDT (something we think doesn't happen).

It might be possible to elide the arch_register_cpu() in
make_present() but that will mean we use different flows in this patch set
for the hotplug and initially present cases which is a bit messy.

I've tested this lightly on arm64 and x86 ACPI + DT booting and it "seems" fine.

Jonathan

> >   
> > >
> > >         for_each_present_cpu(i) {
> > > --    
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
