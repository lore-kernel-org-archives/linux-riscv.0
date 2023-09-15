Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618ECEE644B
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 09:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0mpWCSc/+kTFpIDG+MK+SGYbhmQi6ExcxlNiXYb0k7g=; b=GVhTlMZYtpkVvc
	8g3wl+MnI3jJlQMp9XeJb8DkmGSNyYOU/jjaVp3jzwTyLn3jU37SnimOlKP5JFMHiaEX9GQAecuan
	hLKuEuG4/gAb1wSYI0Mac7KdRYrVzpAFpUq+X/k1z9kgfYcnzun2YgctEVHvAu3EfZn/HppMr+gK7
	0vG6Vc0/fhoUFASYEai0RROv66dnrxX212FS73HEizN1uhGHsUhPUr1zQQzRWDUJqg5sisJVONQzP
	Wn7uA9qRaFMO4gUXOg8qFxUm9c9HjuZV0kdI5V4kDq5/DYVs6ksT2edRMba0btxwIRoriR4xnwEuV
	VgmVjoHoxJ02YRZfHyTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh51r-00AGc2-2I;
	Fri, 15 Sep 2023 09:22:23 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh51J-00AG9X-2y;
	Fri, 15 Sep 2023 09:21:57 +0000
Received: from lhrpeml100002.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Rn7wH5Jlrz6K6nl;
	Fri, 15 Sep 2023 17:21:03 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100002.china.huawei.com (7.191.160.241) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 15 Sep 2023 10:21:42 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Fri, 15 Sep 2023 10:21:42 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Russell King <linux@armlinux.org.uk>
CC: Ard Biesheuvel <ardb@kernel.org>, Jonathan Cameron
	<jonathan.cameron@huawei.com>, James Morse <james.morse@arm.com>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "x86@kernel.org" <x86@kernel.org>, "Jean-Philippe
 Brucker" <jean-philippe@linaro.org>, "jianyong.wu@arm.com"
	<jianyong.wu@arm.com>, "justin.he@arm.com" <justin.he@arm.com>
Subject: RE: [RFC PATCH v2 27/35] ACPICA: Add new MADT GICC flags fields [code
 first?]
Thread-Topic: [RFC PATCH v2 27/35] ACPICA: Add new MADT GICC flags fields
 [code first?]
Thread-Index: AQHZ5mDqpYLh+nkhC0mj9mPBt3XEBLAZ5MMAgAB0lICAAAsFgIAAEfIQgADzSoCAAC7oAA==
Date: Fri, 15 Sep 2023 09:21:42 +0000
Message-ID: <e91f1c42c6b643a4a8227d1bac895747@huawei.com>
References: <20230913163823.7880-1-james.morse@arm.com>
	<20230913163823.7880-28-james.morse@arm.com>
	<CAMj1kXHRAt7ecB9p_dm3MjDL5wZkAsVh30hMY2SV_XUe=bm6Vg@mail.gmail.com>
	<20230914155459.00002dba@Huawei.com>
	<CAMj1kXFquiLGCMow3iujHUU4GBZx2t9KfKy1R9iqjBFjY+acaA@mail.gmail.com>
	<f5d9beea95e149ab89364dcdb0f8bf69@huawei.com>
 <ZQQDJT6MOaIOPmq5@shell.armlinux.org.uk>
In-Reply-To: <ZQQDJT6MOaIOPmq5@shell.armlinux.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.174.239]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_022150_266276_EC8D7D13 
X-CRM114-Status: GOOD (  18.96  )
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

Hi Russel,

> From: Russell King <linux@armlinux.org.uk>
> Sent: Friday, September 15, 2023 8:09 AM
> To: Salil Mehta <salil.mehta@huawei.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>; Jonathan Cameron
> <jonathan.cameron@huawei.com>; James Morse <james.morse@arm.com>; linux-
> pm@vger.kernel.org; loongarch@lists.linux.dev; linux-acpi@vger.kernel.org;
> linux-arch@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-riscv@lists.infradead.org;
> kvmarm@lists.linux.dev; x86@kernel.org; Jean-Philippe Brucker <jean-
> philippe@linaro.org>; jianyong.wu@arm.com; justin.he@arm.com
> Subject: Re: [RFC PATCH v2 27/35] ACPICA: Add new MADT GICC flags fields
> [code first?]
> 
> On Fri, Sep 15, 2023 at 02:29:13AM +0000, Salil Mehta wrote:
> > On x86, during init, if the MADT entry for LAPIC is found to be
> > online-capable and is enabled as well then possible and present
> 
> Note that the ACPI spec says enabled + online-capable isn't defined.
> 
> "The information conveyed by this bit depends on the value of the
> Enabled bit. If the Enabled bit is set, this bit is reserved and
> must be zero."
> 
> So, if x86 is doing something with the enabled && online-capable
> state (other than ignoring the online-capable) then technically it
> is doing something that the spec doesn't define - and it's
> completely fine if aarch64 does something else (maybe treating it
> strictly as per the spec and ignoring online-capable.)


I would suggest that we should concentrate on what is actually
required. The fact of the matter is there is no need to keep
ACPI MADT.GICC.Enabled and ACPI MADT.GICC.online-capable bits
mutually exclusive. (please correct my understanding here
if I am wrong here)

It is a different matter that x86 has implemented above
requirement first for their x2APIC and spec are still not
reflecting what has been implemented as part of the code.
(I would add, for whatever reasons)

On ARM we have copied something from x86 ACPI Specification
which has not been updated yet. (why it is not updated? Maybe
x86 folks can clarify more on this?). Even on ARM, mutual
exclusiveness of the bits is not required. But does it breaks
anything on ARM to *not* have mutual exclusiveness. 
AFAICS, no, but ARM Arch guys can confirm this?)

If bits are *not* required to be mutually exclusive on either
platforms x86/ARM then, I think, it makes sense to update
ACPI specification for both of the platforms.


Thanks
Salil.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
