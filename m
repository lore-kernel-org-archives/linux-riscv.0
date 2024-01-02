Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A50C47074
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 14:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KssUhui2jUdenXucHRIPBP/Pq5pX8rkjjZD8JCvzMKY=; b=PYzbx/v865S7qF
	PH0qGYecAwSWVy9ldsyPp/G6xbtxfFGNtADMqUt+0lTMjtgJfUXr+P1UzvUN69oonvUmagLYlGDCZ
	SUoucNFPFbbD9Or65cmcRDld6AQfCeoebl9R/qLFNFHyZyGAasr7fgP7AlxmCZ1pY0B8m4qKJf3Cu
	hJesEAbB7INOQuKlLuDhTedilIjQltrzClWMgF0PiIJWxzYyTQh8JvOoulpXniSH8V9BTw0h22jdw
	JPL6L28jCoD0UzVVGKzwyIr7462ahXfOLwaQ5Nyvp94/qzgjtSvMx8VfvLVtcXt1jqFIvtw95MPPy
	ooBQgyv6oX/aGyFQLZqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKg98-008IZz-2b;
	Tue, 02 Jan 2024 14:53:34 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKg94-008IX6-1m;
	Tue, 02 Jan 2024 14:53:32 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4T4G5q1Xwbz6K5pD;
	Tue,  2 Jan 2024 22:51:59 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id D4BBB1400DB;
	Tue,  2 Jan 2024 22:53:22 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 2 Jan
 2024 14:53:22 +0000
Date: Tue, 2 Jan 2024 14:53:20 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: <linux-pm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<x86@kernel.org>, <acpica-devel@lists.linuxfoundation.org>,
	<linux-csky@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-ia64@vger.kernel.org>, <linux-parisc@vger.kernel.org>, Salil Mehta
	<salil.mehta@huawei.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<jianyong.wu@arm.com>, <justin.he@arm.com>, James Morse <james.morse@arm.com>
Subject: Re: [PATCH RFC v3 17/21] ACPI: add support to register CPUs based
 on the _STA enabled bit
Message-ID: <20240102145320.000062f9@Huawei.com>
In-Reply-To: <ZYBDJG1g7SH7AiM1@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
	<E1rDOhC-00DvlI-Pp@rmk-PC.armlinux.org.uk>
	<ZYBDJG1g7SH7AiM1@shell.armlinux.org.uk>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_065330_907024_DA539EAD 
X-CRM114-Status: GOOD (  22.84  )
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

On Mon, 18 Dec 2023 13:03:32 +0000
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Wed, Dec 13, 2023 at 12:50:38PM +0000, Russell King wrote:
> > From: James Morse <james.morse@arm.com>
> > 
> > acpi_processor_get_info() registers all present CPUs. Registering a
> > CPU is what creates the sysfs entries and triggers the udev
> > notifications.
> > 
> > arm64 virtual machines that support 'virtual cpu hotplug' use the
> > enabled bit to indicate whether the CPU can be brought online, as
> > the existing ACPI tables require all hardware to be described and
> > present.
> > 
> > If firmware describes a CPU as present, but disabled, skip the
> > registration. Such CPUs are present, but can't be brought online for
> > whatever reason. (e.g. firmware/hypervisor policy).
> > 
> > Once firmware sets the enabled bit, the CPU can be registered and
> > brought online by user-space. Online CPUs, or CPUs that are missing
> > an _STA method must always be registered.  
> 
> ...
> 
> > @@ -526,6 +552,9 @@ static void acpi_processor_post_eject(struct acpi_device *device)
> >  		acpi_processor_make_not_present(device);
> >  		return;
> >  	}
> > +
> > +	if (cpu_present(pr->id) && !(sta & ACPI_STA_DEVICE_ENABLED))
> > +		arch_unregister_cpu(pr->id);  
> 
> This change isn't described in the commit log, but seems to be the cause
> of the build error identified by the kernel build bot that is fixed
> later in this series. I'm wondering whether this should be in a
> different patch, maybe "ACPI: Check _STA present bit before making CPUs
> not present" ?

Would seem a bit odd to call arch_unregister_cpu() way before the code
is added to call the matching arch_registers_cpu()

Mind you this eject doesn't just apply to those CPUs that are registered
later I think, but instead to all.  So we run into the spec hole that
there is no way to identify initially 'enabled' CPUs that might be disabled
later.

> 
> Or maybe my brain isn't working properly (due to being Covid positive.)
> Any thoughts, Jonathan?

I'll go with a resounding 'not sure' on where this change belongs.
I blame my non existent start of the year hangover.
Hope you have recovered!

Jonathan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
