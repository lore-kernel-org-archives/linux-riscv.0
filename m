Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13C8E7E636
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 13:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jnoDsZpSn9brA5fBKZiMRWxFCodjfjxirFCUiw6uasg=; b=B10t5kQMDZBn4f
	wNK1i95N37rIBEn5Duf3pgTWkll4IEKczwfJfZd8+oA6vRbpbSgPz8gyWtDrhLz5J66s05UEvAzfH
	AZhc5oRBOSnvYyJ+564xNfkTC3Ow7AQBzcCWLsDq+hBh+aCoBPyIIkEcp/yUaWI55kJtWniS/7wAZ
	p9qIn6QWjSw6uijRVayHEH78HH4+mWq3OewWZizihCeQe30sdNZ1f9AvqpvZEfVEQg2RZC7gPpdDK
	tAtsU/bt4kJVeBmCwe7hfLDqFvJC0SMJk/1SyXRT7w1yDitK4u+jwDv72Tr5jXcLoXJ/bLNAPWNBQ
	5WtUsCiqn4hQnRBrfz/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql7vv-00GRxy-1O;
	Tue, 26 Sep 2023 13:16:59 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql7vr-00GRvX-0s;
	Tue, 26 Sep 2023 13:16:57 +0000
Received: from lhrpeml500002.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Rw0bh0SMmz6K7vG;
	Tue, 26 Sep 2023 21:15:28 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500002.china.huawei.com (7.191.160.78) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 14:16:41 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Tue, 26 Sep 2023 14:16:41 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: James Morse <james.morse@arm.com>, "linux-pm@vger.kernel.org"
	<linux-pm@vger.kernel.org>, "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>, "linux-acpi@vger.kernel.org"
	<linux-acpi@vger.kernel.org>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>
CC: "x86@kernel.org" <x86@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>, "jianyong.wu@arm.com"
	<jianyong.wu@arm.com>, "justin.he@arm.com" <justin.he@arm.com>
Subject: RE: [RFC PATCH v2 00/35] ACPI/arm64: add support for virtual
 cpuhotplug
Thread-Topic: [RFC PATCH v2 00/35] ACPI/arm64: add support for virtual
 cpuhotplug
Thread-Index: AQHZ5mDIR7JMF2KEeEGQTVeJuAX/8LAtKYMg
Date: Tue, 26 Sep 2023 13:16:41 +0000
Message-ID: <622a39bda12a4b75a6da84f4566b4238@huawei.com>
References: <20230913163823.7880-1-james.morse@arm.com>
In-Reply-To: <20230913163823.7880-1-james.morse@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.174.16]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_061655_609504_F465C340 
X-CRM114-Status: GOOD (  20.80  )
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

> From: James Morse <james.morse@arm.com>
> Sent: Wednesday, September 13, 2023 5:38 PM

[...]

> 
> Hello!
> 
> Changes since RFC-v1:
>  * riscv is new, ia64 is gone
>  * The KVM support is different, and upstream - no need to patch the host.
> 
> ---
> 
> This series adds what looks like cpuhotplug support to arm64 for use in
> virtual machines. It does this by moving the cpu_register() calls for
> architectures that support ACPI out of the arch code by using
> GENERIC_CPU_DEVICES, then into the ACPI processor driver.
> 
> The kubernetes folk really want to be able to add CPUs to an existing VM,
> in exactly the same way they do on x86. The use-case is pre-booting guests
> with one CPU, then adding the number that were actually needed when the
> workload is provisioned.
> 

[...]

> 
> I had a go at switching the remaining architectures over to
> GENERIC_CPU_DEVICES,
> so that the Kconfig symbol can be removed, but I got stuck with powerpc
> and s390.
> 
> I've only build tested Loongarch and riscv. I've removed the ia64 specific
> patches, but left the changes in other patches to make git-grep review of
> renames easier.
> 
> If folk want to play along at home, you'll need a copy of Qemu that
> supports this.
> https://github.com/salil-mehta/qemu.git salil/virt-cpuhp-armv8/rfc-v2-rc6


Please use the latest pushed RFC V2 instead:
https://lore.kernel.org/qemu-devel/20230926100436.28284-1-salil.mehta@huawei.com/T/#m523b37819c4811c7827333982004e07a1ef03879

Repository:
https://github.com/salil-mehta/qemu.git  virt-cpuhp-armv8/rfc-v2


Thanks
Salil.


[...]

> Why is this still an RFC? I'm still looking for confirmation from the
> kubernetes/kata folk that this works for them. Because of this I've culled
> the CC list...
> 
> 
> This series is based on v6.6-rc1, and can be retrieved from:
> https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/virtual_cpu_hotplug/rfc/v2

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
