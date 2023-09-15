Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8D3EE645C
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 13:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rolmyMuI0IklraxH+WC1he/NEJujyDCeOUCSc3QlFr4=; b=eCK+EO01FDDaan
	y45r6Zi++pyLNOyN0aEMgeaA3IAeegQ5/PSOgzUsJaAU5G0QtwBZ6/+uXQscXzQa7SW3KtVr7qFjy
	FPIOr8pRf5wsKNERvr9H0YIw2Cb7g58GODG2EWNHmomHxuz6wm9mMeusMHB8Gs5fiZV1rw7GOFN/n
	fSItQ3eI90PvB2MLjnFfDnFZiDysgk+sQmD5RxMrnBwgVC6+BXTOLyEbs5k+A5mAMEDvxtKeqOS59
	JUqqjbcsEQxGy246AL84DLXjUW/vaWjJb6ksVJU2eC9S8wdlEaHx27rVoNH68BKO7qCcq5/JJgTvT
	OY5tEWJtgZ/thOvCrxwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh98Y-00AppR-2i;
	Fri, 15 Sep 2023 13:45:34 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh98V-00ApfE-0F;
	Fri, 15 Sep 2023 13:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MDmOVUGFw7psqGT5ektePsIj1IbCfn8TY/XxeJGVNTw=; b=rtC74pAlfCcyhcB3Wyl8LKCPB0
	Xwz14Qd36TL0PKhw7Zk+LHnxUd5XgAmKuJEe7akvV+FC/sROu11SxSxKI+0wEMV+5tyG+iCX3Olrr
	lO0y6WnYO8QsojbcRYxX9UrQdN/L/OAffvM0kt7yypxuwclbo3I2J8b4RIOb+s/+WUwGejgTGc/Xo
	dStNDrPrXV6sXo2DJ/ln2JUAiLUi/5f/0lMGJHd3Kav6/MEdvhDb63mrP0ECRMh5DT6Wb67I6BORS
	s9AtdfQyX3WJB4LjYZCrgQaddENsVW+TeUjrQddQqbbbUdsUALBFXgdcFgNaR305NNyFce8J7knKh
	AzEeS2ng==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40636)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qh96C-0005hw-0w;
	Fri, 15 Sep 2023 14:43:08 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qh969-0005qV-Do; Fri, 15 Sep 2023 14:43:05 +0100
Date: Fri, 15 Sep 2023 14:43:05 +0100
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
Message-ID: <ZQRfaYYwrYQEfICN@shell.armlinux.org.uk>
References: <20230913163823.7880-1-james.morse@arm.com>
 <20230913163823.7880-28-james.morse@arm.com>
 <CAMj1kXHRAt7ecB9p_dm3MjDL5wZkAsVh30hMY2SV_XUe=bm6Vg@mail.gmail.com>
 <20230914155459.00002dba@Huawei.com>
 <CAMj1kXFquiLGCMow3iujHUU4GBZx2t9KfKy1R9iqjBFjY+acaA@mail.gmail.com>
 <f5d9beea95e149ab89364dcdb0f8bf69@huawei.com>
 <ZQQDJT6MOaIOPmq5@shell.armlinux.org.uk>
 <CAJZ5v0jUQ+4G5ArYAtu1gvYF4356CK_QVTO4oWn0ukwdOiZaHA@mail.gmail.com>
 <80e36ff513504a0382a1cbce83e42295@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <80e36ff513504a0382a1cbce83e42295@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_064531_133451_82615301 
X-CRM114-Status: GOOD (  18.05  )
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

On Fri, Sep 15, 2023 at 09:34:46AM +0000, Salil Mehta wrote:
> > > Note that the ACPI spec says enabled + online-capable isn't defined.
> > >
> > > "The information conveyed by this bit depends on the value of the
> > > Enabled bit. If the Enabled bit is set, this bit is reserved and
> > > must be zero."
> > >
> > > So, if x86 is doing something with the enabled && online-capable
> > > state (other than ignoring the online-capable) then technically it
> > > is doing something that the spec doesn't define
> > 
> > And so it is wrong.
> 
> Or maybe, specification has not been updated yet. code-first?

What is the point in speculating. If you want to speculate about it,
fine, but please don't use speculation as a reason that "oh we need
to sort this out before we can merge the patches".

This is precisely why engineers are bad at producing products. They
like to continually tweak the design, and the design never gets out
the door. You need someone who is a project manager to tell engineers
when to stop. Without a project manager to do that, eventually the
project fades into insignificance because it becomes no longer relevant
or has its funding cut.

Hotplug VCPU on aarch64 feels exactly like that - it seems to be an
engineer project that is just going to for-ever rumble on and never
actually see the light of day.

So please - stop speculating and lets get vCPU hotplug *actually*
delivered and usable. Even if it's not 100% perfect.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
