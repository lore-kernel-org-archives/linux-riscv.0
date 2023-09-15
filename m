Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2785EED603
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 15:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gmbUcfk6++VZPrU37q201Fi6X9nfuFKMHXTie9mB/BU=; b=dnoeXIkHClIef+
	2YFtTXBUDk5BxlFQIOZrC4w3++R3b82fFnVlAuvL6r9Cqyvm58mgZA0nuNFN1GtAgWPZ+nGF0FbXr
	igIDxdOmAplULgjYAhET4M3N356wMiWfoBgSHWgm9XpcrgOUjXz/Ptjd0MPSb2UlKj0A8MZoqKrjQ
	EGYOFR5JbNPMaRtHP67+vxBvl0DQJMTi+0skXlZBTFYehnKZEB7qggyw/VAr/r+1tFLnr8XTq+vmO
	ULPFnWFUknNU+6jIX1cc8RjPF8P2rmU81XgSgmhDxfjd7MDK/i10Xd3xKS+jGeTYOPalUa+SoN1vS
	WkTWW/5C9jw0K8bHQCdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhAZa-00AxfS-1x;
	Fri, 15 Sep 2023 15:17:34 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhAZV-00AxeE-36;
	Fri, 15 Sep 2023 15:17:32 +0000
Received: from lhrpeml500004.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RnHnK2q72z6HJbP;
	Fri, 15 Sep 2023 23:15:33 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500004.china.huawei.com (7.191.163.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 15 Sep 2023 16:17:21 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Fri, 15 Sep 2023 16:17:21 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Russell King <linux@armlinux.org.uk>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>, James Morse
	<james.morse@arm.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
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
Thread-Index: AQHZ5mDqpYLh+nkhC0mj9mPBt3XEBLAZ5MMAgAB0lICAAAsFgIAAEfIQgADzSoCAABq9gIAAG4DQgAA3wICAACNmMA==
Date: Fri, 15 Sep 2023 15:17:21 +0000
Message-ID: <9e327ad1128045fa80eebf327abaa8f0@huawei.com>
References: <20230913163823.7880-1-james.morse@arm.com>
	<20230913163823.7880-28-james.morse@arm.com>
	<CAMj1kXHRAt7ecB9p_dm3MjDL5wZkAsVh30hMY2SV_XUe=bm6Vg@mail.gmail.com>
	<20230914155459.00002dba@Huawei.com>
	<CAMj1kXFquiLGCMow3iujHUU4GBZx2t9KfKy1R9iqjBFjY+acaA@mail.gmail.com>
	<f5d9beea95e149ab89364dcdb0f8bf69@huawei.com>
	<ZQQDJT6MOaIOPmq5@shell.armlinux.org.uk>
	<CAJZ5v0jUQ+4G5ArYAtu1gvYF4356CK_QVTO4oWn0ukwdOiZaHA@mail.gmail.com>
	<80e36ff513504a0382a1cbce83e42295@huawei.com>
 <ZQRfaYYwrYQEfICN@shell.armlinux.org.uk>
In-Reply-To: <ZQRfaYYwrYQEfICN@shell.armlinux.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.174.239]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_081730_285331_FA8D9A7E 
X-CRM114-Status: GOOD (  31.01  )
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
Thanks for highlighting your concerns.

> From: Russell King <linux@armlinux.org.uk>
> Sent: Friday, September 15, 2023 2:43 PM
> To: Salil Mehta <salil.mehta@huawei.com>
> Cc: Rafael J. Wysocki <rafael@kernel.org>; Ard Biesheuvel
> <ardb@kernel.org>; Jonathan Cameron <jonathan.cameron@huawei.com>; James
> Morse <james.morse@arm.com>; linux-pm@vger.kernel.org;
> loongarch@lists.linux.dev; linux-acpi@vger.kernel.org; linux-
> arch@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-riscv@lists.infradead.org;
> kvmarm@lists.linux.dev; x86@kernel.org; Jean-Philippe Brucker <jean-
> philippe@linaro.org>; jianyong.wu@arm.com; justin.he@arm.com
> Subject: Re: [RFC PATCH v2 27/35] ACPICA: Add new MADT GICC flags fields
> [code first?]
> 
> On Fri, Sep 15, 2023 at 09:34:46AM +0000, Salil Mehta wrote:
> > > > Note that the ACPI spec says enabled + online-capable isn't defined.
> > > >
> > > > "The information conveyed by this bit depends on the value of the
> > > > Enabled bit. If the Enabled bit is set, this bit is reserved and
> > > > must be zero."
> > > >
> > > > So, if x86 is doing something with the enabled && online-capable
> > > > state (other than ignoring the online-capable) then technically it
> > > > is doing something that the spec doesn't define
> > >
> > > And so it is wrong.
> >
> > Or maybe, specification has not been updated yet. code-first?
> 
> What is the point in speculating. If you want to speculate about it,
> fine, but please don't use speculation as a reason that "oh we need
> to sort this out before we can merge the patches".

[already replied in other thread but repeating it here]

Sorry, I am not aware but I was suggesting this. Can we have this
done for ARM first because there is a legitimate use-case. This
can be done in parallel while other patches are getting reviewed.
It would be great if they get accepted even in the current form.


> This is precisely why engineers are bad at producing products. They
> like to continually tweak the design, and the design never gets out
> the door. You need someone who is a project manager to tell engineers
> when to stop. Without a project manager to do that, eventually the
> project fades into insignificance because it becomes no longer relevant
> or has its funding cut.
> 
> Hotplug VCPU on aarch64 feels exactly like that - it seems to be an
> engineer project that is just going to for-ever rumble on and never
> actually see the light of day.


Sometimes things are not in single persons control. Yes, it is
frustrating, I do understand that.


> So please - stop speculating and lets get vCPU hotplug *actually*
> delivered and usable. Even if it's not 100% perfect.

We need to decide what is the criteria of acceptability and it can
vary across organizations. It depends upon internal requirements.
The issues what I pointed are,

1. Legacy OS will not boot on latest platform with hotplug support.
   - Try running older windows on ARM platform with hotplug support.
     - older windows will only see boot cpu with online-capable bit.
     - Will windows use _OSC to check compatibility?
   - We have verified this with older Linux and it only shows 1 CPU.
2. Hot(un)plug of cold-booted CPUs.  
   - Its use-case is subjective. Maybe you can throw light on this.

With current composition of bits both 1 & 2 cannot be supported
simultaneously. 

It is perfectly okay to live with them while clearly indicating
what we intend to support or are in process of supporting it.
But we do need an open discussion about how to proceed. This is
to avoid surprises later on.

BTW, I am just trying to make every one aware of the problems.

Many thanks!

Best regards
Salil.




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
