Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829E3EED604
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 15:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TkJ4mt0faiSG19BQA32vFfx7BNKsQEjO9SbY9pdJRHA=; b=WozMLYhmFZXevb
	mB6UhV4eX8fYKeHoMeEBA3IMLetAgtALIxrt4E4xifVZ0ROx0zL9tMg4TDWO6Ku1gn8dtVAEf9PcV
	n9RYNcmLdvZArTBDyOmofIKQPOls6XxxV48YBnmNptN3Dw9NwDBLM679TpwHFDADJIJaqkqpVxlv2
	b+ovD+69J95THKsh2IVn++vdnRI9cVthE8FOpiyqbQ9x0ZVlrd/q1kVbsC6iSSPQ/d3d9LnKC39h3
	7mT5wuWxgdrqX0IpCGqBFFVhiPUaPPDoUrCvgYM1NuGuH0ByaEmJX/uMsKv2VCgXdtEYHpmm6YOeb
	oNiM8Drz29gH2bncMWiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhAYn-00Axa7-0r;
	Fri, 15 Sep 2023 15:16:45 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhAYj-00AxZ1-1n;
	Fri, 15 Sep 2023 15:16:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UOiyQ0tdZAGc1P6pnaM1XhDTukLQhBrH8Z/l/V1nSz0=; b=OMVJ9mkqZe3HMOFA1ea27odBxI
	cNPtMwnyBfMxgm+ny9zHU4Qk2sm5a8BKOL7j1meKXZ5iCm0fkQdsfhuz48Dakr6PY9gRXb5vnvxSb
	8jeyKQw7DRz8PgrzCL6y4TD8rDkDVj9eT1Wubi7XRIQFGx8QTiaNnhkZ35Wgo0j2tXBlQ1fz2HBf6
	1p1YVXgdzVGMXljBV3BjlvKlJLjkwOKgzoC9pHro+dtG05g+4uFO7KprAoJXLB2zeaoTD0y6Gy8kQ
	KuXLTnmhzfk8osSJY9663oTMHxzRfCgy3aR2V4muXsyVbbIbcmdHEzBGEkfW8pjCkUp4+6az4D3nh
	ZXDHjY+A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53798)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qhAYR-0005mC-26;
	Fri, 15 Sep 2023 16:16:23 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qhAYR-0005to-Dr; Fri, 15 Sep 2023 16:16:23 +0100
Date: Fri, 15 Sep 2023 16:16:23 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	James Morse <james.morse@arm.com>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"x86@kernel.org" <x86@kernel.org>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	"jianyong.wu@arm.com" <jianyong.wu@arm.com>,
	"justin.he@arm.com" <justin.he@arm.com>
Subject: Re: [RFC PATCH v2 27/35] ACPICA: Add new MADT GICC flags fields
 [code first?]
Message-ID: <ZQR1R+okAxfJrS0p@shell.armlinux.org.uk>
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cec8f4ad16434c2daa0b5db7f6d60a6b@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_081641_597367_6464C47F 
X-CRM114-Status: GOOD (  17.17  )
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

On Fri, Sep 15, 2023 at 02:49:41PM +0000, Salil Mehta wrote:
> I am not aware of any on x86. Maybe we can do it on ARM first and
> let other Arch pitch-in their objection later? Afterall, there is
> a legitimate use-case in case of ARM. Having mutually exclusive
> bits breaks certain use-cases and we have to do the tradeoffs. 

... but let's not use that as an argument to delay the forward
progress of getting aarch64 vCPU hotplug patches merged.

If we want to later propose that Enabled=1 Online-Capable=1 means
that the CPU can be hot-unplugged, then that's something that can
be added to the spec later, and added to the kernel later. There
is no need to go through more iterations of patch sets to add this
feature before considering that aarch64 vCPU hotplug is ready to
be merged.

Like I said in my other email, it's time to stop this "well, if we
do this, then we can do that" cycle - stop playing games with what
can be done.

Delaying merging this code means not only does the maintenance
burden keep increasing (because more and more patches accumulate
which have to be constantly forward ported) but those who *want*
this feature are deprived for what, another year? two years?
decades? before it gets merged.

So please, stop dreaming up new features. Let's get aarch64 vCPU
hotplug that is compliant with the current ACPI spec, merged into
upstream. If we _then_ want to consider additional features, that's
the time to do it.

If you're not prepared to do that, do not be surprised if someone
else (such as myself) decides to fork James' work in order to get
it merged upstream - and yes, I _will_ do that if these games
carry on. I have already started to do that by proposing a patch
that is different from what James has to at least get some of
James' desired changes upstream - and I will continue doing that
all the time that (a) I see that there's a better way to address
something in James' patch and (b) I think in the longer term it
will reduce the maintenance burden of this patch set.

People are getting sick and tired of waiting for this feature.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
