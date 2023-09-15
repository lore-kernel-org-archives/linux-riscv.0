Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A97DEED619
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 16:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PYTjcJt+YqA08bCsJzwEfY7gc5aUsSJcGMHPRbY1EVg=; b=Wzrs9+KZ0lDkMZ
	fG7AquDXNVTo5n6HF+At3OjUt78irnuIkQdRnVNRihz2POyt6hpgdFSyxvI/pS7iOgrUZXsGD+Sls
	3NM24Zo4LRWtjMbYDXsypZYsSimi9x1tOB/xmXEjN2ccRla6ElMtnU5l6txiBpODmk2VH3MAMBs7J
	XgsLxiXJUjVcbJnT2de+Xn+03soQko+KHcR6grDXKdhwaL60tU1rG7oVk3z8ye2XUti54lFHlwdk4
	d3me0J29f/f+OASuRiTGsTJ9Qq+2vrM2yeUVjN3Ed8JSC7+9SfCzmU/IZTxEOy3rDZnfbuViP9OOx
	1S/o7+YcaHjixd3VKg3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhByL-00B4dY-1d;
	Fri, 15 Sep 2023 16:47:13 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhByH-00B4bX-07;
	Fri, 15 Sep 2023 16:47:11 +0000
Received: from lhrpeml100005.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RnKnn2zm4z67LX2;
	Sat, 16 Sep 2023 00:46:05 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100005.china.huawei.com (7.191.160.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 15 Sep 2023 17:46:45 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Fri, 15 Sep 2023 17:46:45 +0100
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
Thread-Index: AQHZ5mDqpYLh+nkhC0mj9mPBt3XEBLAZ5MMAgAB0lICAAAsFgIAAEfIQgADzSoCAABq9gIAAG4DQ////VACAAFZdgP///CGAgAAf/qA=
Date: Fri, 15 Sep 2023 16:46:45 +0000
Message-ID: <4ec689fa42474d0abc99a2f2055ddcff@huawei.com>
References: <20230913163823.7880-28-james.morse@arm.com>
	<CAMj1kXHRAt7ecB9p_dm3MjDL5wZkAsVh30hMY2SV_XUe=bm6Vg@mail.gmail.com>
	<20230914155459.00002dba@Huawei.com>
	<CAMj1kXFquiLGCMow3iujHUU4GBZx2t9KfKy1R9iqjBFjY+acaA@mail.gmail.com>
	<f5d9beea95e149ab89364dcdb0f8bf69@huawei.com>
	<ZQQDJT6MOaIOPmq5@shell.armlinux.org.uk>
	<CAJZ5v0jUQ+4G5ArYAtu1gvYF4356CK_QVTO4oWn0ukwdOiZaHA@mail.gmail.com>
	<80e36ff513504a0382a1cbce83e42295@huawei.com>
	<CAJZ5v0gou9Pdj_CPC=vLJ-6S-hz+0VY+GMgXcRJk=6t9mL1ykw@mail.gmail.com>
	<cec8f4ad16434c2daa0b5db7f6d60a6b@huawei.com>
 <ZQR1R+okAxfJrS0p@shell.armlinux.org.uk>
In-Reply-To: <ZQR1R+okAxfJrS0p@shell.armlinux.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.174.239]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_094709_363713_53E14CFE 
X-CRM114-Status: GOOD (  33.30  )
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
> Sent: Friday, September 15, 2023 4:16 PM
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
> On Fri, Sep 15, 2023 at 02:49:41PM +0000, Salil Mehta wrote:
> > I am not aware of any on x86. Maybe we can do it on ARM first and
> > let other Arch pitch-in their objection later? Afterall, there is
> > a legitimate use-case in case of ARM. Having mutually exclusive
> > bits breaks certain use-cases and we have to do the tradeoffs.
> 
> ... but let's not use that as an argument to delay the forward
> progress of getting aarch64 vCPU hotplug patches merged.


Why would anybody do that? We have been working with ARM for almost
3 years to get to the current point where we have overcome most of
the architecture issues and have made this feature viable at the
first place. It is totally out of wits that anyone of us would
want to delay its acceptance.


> 
> If we want to later propose that Enabled=1 Online-Capable=1 means
> that the CPU can be hot-unplugged, then that's something that can
> be added to the spec later, and added to the kernel later. There
> is no need to go through more iterations of patch sets to add this
> feature before considering that aarch64 vCPU hotplug is ready to
> be merged.

Absolutely but again these two things can be done in parallel.
And whether patch-set is ready to get accepted is up to the
Maintainers to decide and other community members as well.
Yourself, James, I and others have been making efforts in this
direction already.

But I understand your concern that maybe current discussion might
create a bit of a distraction and can be held.

> 
> Like I said in my other email, it's time to stop this "well, if we
> do this, then we can do that" cycle - stop playing games with what
> can be done.

Don't know which cyclic games are being referred here - really!

I will leave it up to James to answer that.

> Delaying merging this code means not only does the maintenance
> burden keep increasing (because more and more patches accumulate
> which have to be constantly forward ported) but those who *want*
> this feature are deprived for what, another year? two years?
> decades? before it gets merged.

It is good to know that there are customers waiting for this
feature at your side as well. Let us hope this can get accepted
quickly.

> So please, stop dreaming up new features. Let's get aarch64 vCPU
> hotplug that is compliant with the current ACPI spec, merged into
> upstream. If we _then_ want to consider additional features, that's
> the time to do it.


That's what I suggested earlier as well but the discussions for the
problem cannot be ignored.


> If you're not prepared to do that, do not be surprised if someone
> else (such as myself) decides to fork James' work in order to get
> it merged upstream - and yes, I _will_ do that if these games
> carry on. I have already started to do that by proposing a patch
> that is different from what James has to at least get some of
> James' desired changes upstream - and I will continue doing that
> all the time that (a) I see that there's a better way to address
> something in James' patch and (b) I think in the longer term it
> will reduce the maintenance burden of this patch set.

Are you changing the approach of the kernel?


Thanks
Salil.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
