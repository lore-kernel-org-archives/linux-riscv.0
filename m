Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF4DEDE9A1
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 10:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7pJLm5ORnFVduCTceuxHDdzKfj65u+Tz78afo0b4kVk=; b=uRsW+hjuEAp5tV
	UyE7pYG6aFWzO8xZXHmXxLVHThWInCvezD7/c0Zofjdu/3t6o0aG1GomzH2uohOV2N8IbvOVRQGHp
	M3fC44XzE1oBewdMsnYWat78d2vrHPumjHHNcvsP3rtsc18gEnkpjC+o/UpmWdozT4E9AX24QrNGa
	bjNmUoUMmM3hLZB7Tkb7wYWHPtQgKDS4dEB0+r1PlN/G9BB4rslM722rhfKgURI6XFvXQJ7lbUgqZ
	VoKMML4BjeobvsCqwinAyGTZIV7gYqsNVWmLtFR7DBXPqZkGSu/KBW1N3I2Ebgu7b7FnxqVn5A9+o
	mCvxIcu26kbNvYh1cSbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgk1O-0083nb-0B;
	Thu, 14 Sep 2023 10:56:30 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgk1K-0083fy-1O;
	Thu, 14 Sep 2023 10:56:28 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RmZ3v01jqz6K5v5;
	Thu, 14 Sep 2023 18:55:38 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 14 Sep
 2023 11:56:14 +0100
Date: Thu, 14 Sep 2023 11:56:13 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: James Morse <james.morse@arm.com>, <linux-pm@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linux-acpi@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <x86@kernel.org>, Salil Mehta
	<salil.mehta@huawei.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<jianyong.wu@arm.com>, <justin.he@arm.com>
Subject: Re: [RFC PATCH v2 02/35] drivers: base: Use present CPUs in
 GENERIC_CPU_DEVICES
Message-ID: <20230914115613.0000778e@Huawei.com>
In-Reply-To: <ZQLCZsw+ZGbTM8oK@shell.armlinux.org.uk>
References: <20230913163823.7880-1-james.morse@arm.com>
	<20230913163823.7880-3-james.morse@arm.com>
	<ZQLCZsw+ZGbTM8oK@shell.armlinux.org.uk>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_035626_777547_383BB443 
X-CRM114-Status: GOOD (  24.27  )
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

On Thu, 14 Sep 2023 09:20:54 +0100
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Wed, Sep 13, 2023 at 04:37:50PM +0000, James Morse wrote:
> > Three of the five ACPI architectures create sysfs entries using
> > register_cpu() for present CPUs, whereas arm64, riscv and all
> > GENERIC_CPU_DEVICES do this for possible CPUs.
> > 
> > Registering a CPU is what causes them to show up in sysfs.
> > 
> > It makes very little sense to register all possible CPUs. Registering
> > a CPU is what triggers the udev notifications allowing user-space to
> > react to newly added CPUs.
> > 
> > To allow all five ACPI architectures to use GENERIC_CPU_DEVICES, change
> > it to use for_each_present_cpu(). Making the ACPI architectures use
> > GENERIC_CPU_DEVICES is a pre-requisite step to centralise their
> > cpu_register() logic, before moving it into the ACPI processor driver.
> > When ACPI is disabled this work would be done by
> > cpu_dev_register_generic().
> > 
> > Of the ACPI architectures that register possible CPUs, arm64 and riscv
> > do not support making possible CPUs present as they use the weak 'always
> > fails' version of arch_register_cpu().
> > 
> > Only two of the eight architectures that use GENERIC_CPU_DEVICES have a
> > distinction between present and possible CPUs.
> > 
> > The following architectures use GENERIC_CPU_DEVICES but are not SMP,
> > so possible == present:
> >  * m68k
> >  * microblaze
> >  * nios2
> > 
> > The following architectures use GENERIC_CPU_DEVICES and consider
> > possible == present:
> >  * csky: setup_smp()
> >  * parisc: smp_prepare_boot_cpu() marks the boot cpu as present,
> >    processor_probe() sets possible for all CPUs and present for all CPUs
> >    except the boot cpu.  
> 
> However, init/main.c::start_kernel() calls boot_cpu_init() which sets
> the boot CPU in the online, active, present and possible masks. So,
> _every_ architecture gets the boot CPU in all these masks no matter
> what.
> 
> Only of something then clears the boot CPU from these masks (which
> would be silly) would the boot CPU not be in all of these masks.
Hi Russel,

Upshot is that the code in parisc smp_prepare_boot_cpu() can be dropped?
Seems like another useful simplification to add to front of this series.
The function will end up with just a print then. 
Seems there are lots of other empty implementations of smp_prepare_boot_cpu()
maybe worth making that optional whilst here and dropping all the empty ones?

There seem to be some other architectures setting at least some of the cpu masks
that could perhaps be tidied up a little via same logic?

Jonathan

> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
