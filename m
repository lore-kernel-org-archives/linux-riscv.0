Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6359EC4828F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 16:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=27Su6hPohKTkpP0+GfzxZ4XKdegPRxWjfP/92CcFiAE=; b=qPquLTx3z0dws4
	dIEdFuUwE0GQoQQVy8kMDLvNcy4ufV9eTiz0bKAJyk0/6Z033Q9wZn1khADy12OVeswSkG80yQhdl
	IfzEDa2vMfVqWNv+gF/T02cMhSEE/qsEjXXx1KODg9JSkc4bcGedrmiD5cqTOsjywOH7GO3MByJGC
	BvfGyrza6G6mhwgsGD6BEG6esf3eWDJzOq+yW8NhHUjnXv3zdI8DhXBY+gqyYkifBdvnGH0hskT9t
	rWiYma9ZCroIvtLqhIvuHDP930owGKZS9YbsJKBZbTJvkXzM5rLC+ZP5SxxxE8yBOh6dBTRLbSA1t
	/7EnnnorBxTYtJ2QTBsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVwhA-0000000CP7n-3iTL;
	Fri, 02 Feb 2024 16:47:16 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVwh7-0000000CP5I-1D73;
	Fri, 02 Feb 2024 16:47:14 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TRM6d5P4Bz6K7G4;
	Sat,  3 Feb 2024 00:43:53 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 822581400CD;
	Sat,  3 Feb 2024 00:47:03 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 2 Feb
 2024 16:47:02 +0000
Date: Fri, 2 Feb 2024 16:47:02 +0000
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
	<jianyong.wu@arm.com>, <justin.he@arm.com>, James Morse
	<james.morse@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH RFC v4 11/15] irqchip/gic-v3: Add support for ACPI's
 disabled but 'online capable' CPUs
Message-ID: <20240202164702.00001c5b@Huawei.com>
In-Reply-To: <E1rVDnE-0027ZI-VR@rmk-PC.armlinux.org.uk>
References: <Zbp5xzmFhKDAgHws@shell.armlinux.org.uk>
	<E1rVDnE-0027ZI-VR@rmk-PC.armlinux.org.uk>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_084713_514261_81666C87 
X-CRM114-Status: GOOD (  17.95  )
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

On Wed, 31 Jan 2024 16:50:32 +0000
Russell King (Oracle) <rmk+kernel@armlinux.org.uk> wrote:

> From: James Morse <james.morse@arm.com>
> 
> To support virtual CPU hotplug, ACPI has added an 'online capable' bit
> to the MADT GICC entries. This indicates a disabled CPU entry may not
> be possible to online via PSCI until firmware has set enabled bit in
> _STA.
> 
> This means that a "usable" GIC is one that is marked as either enabled,
> or online capable. Therefore, change acpi_gicc_is_usable() to check both
> bits. However, we need to change the test in gic_acpi_match_gicc() back
> to testing just the enabled bit so the count of enabled distributors is
> correct.
> 
> What about the redistributor in the GICC entry? ACPI doesn't want to say.
> Assume the worst: When a redistributor is described in the GICC entry,
> but the entry is marked as disabled at boot, assume the redistributor
> is inaccessible.
> 
> The GICv3 driver doesn't support late online of redistributors, so this
> means the corresponding CPU can't be brought online either. Clear the
> possible and present bits.
> 
> Systems that want CPU hotplug in a VM can ensure their redistributors
> are always-on, and describe them that way with a GICR entry in the MADT.
> 
> When mapping redistributors found via GICC entries, handle the case
> where the arch code believes the CPU is present and possible, but it
> does not have an accessible redistributor. Print a warning and clear
> the present and possible bits.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
