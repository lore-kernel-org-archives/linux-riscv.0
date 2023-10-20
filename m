Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1111C001DF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 15:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vZHG1Woa1zewzoV4GKto7PK2NMjQKivmS7CgvbVJH4M=; b=sXtnY3jFxLP5Hh
	K65lQkGKovEoJnDP6TKAJchSRoqsy8hKuE4PydoHhBfqXLmSi3ZZuSXRzwx0cFl747c9IIl1c4gr7
	7aZ7gBV38jatIlrPfHmD6ObQ6eucuabnMzfkQ6pWcAUOngI7r0gZ1/aO7yl2nMnY6Xy7yG6gYbtgA
	ygqbqQadw3mnLB/9oQpQFKMLv+H7pmP1wIinBwV8H5m1gZvsOYQ9Yyu+hG4vg66H3FjZqu85zsU1Z
	tQNWFWlpAprW5/rcg1ZDfhA13niBx0C5gvpyKZTjKgcNqXIi4H/sBwOx4cKJ0gypApwuIJ4X/+6Wo
	Hj3Oa1mjNJHRSZqC9FTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtrgu-002dVC-30;
	Fri, 20 Oct 2023 15:45:36 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtrgr-002dUR-13;
	Fri, 20 Oct 2023 15:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xIKKUjcH/qIC5BsSUPE/DncbhPOe3xXoX+eKN1YVw6I=; b=0p6w5hEafrSWaGfgk1H2QdUv/d
	eaeQUYuSUMmQt1NCpQ7r2N1dVlBcE+b1vGg09q5+cIVbdXb/5Ugh+JEXAqQA5RSDITYfuhCvBwciM
	n7V5RUoowAW0boyNBEf+Aww9K/BLHdUSnLe23higeruw8rbQQpfcNXYt2NFHIyX/LjCrlxfA9qlZy
	v0N7hRLe2HyXHWIQ6VP8tnOZwng7hNXpmMUbbzuBc3fuUZkjwV3TO3hNntpgN/jCFd4ZgjzcfAJKM
	kcxGQErzQ9uL1DJPilPyo6s5QA8hxNX71g7k0Mu9XRhXGNNJ5/g/Q39GM20miBrHMtaYAsReZVARS
	F6HoD1iA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48332)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qtrgk-0000bl-0a;
	Fri, 20 Oct 2023 16:45:26 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qtrgl-0001fB-0I; Fri, 20 Oct 2023 16:45:27 +0100
Date: Fri, 20 Oct 2023 16:45:26 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Gavin Shan <gshan@redhat.com>
Cc: James Morse <james.morse@arm.com>, linux-pm@vger.kernel.org,
	loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com
Subject: Re: [RFC PATCH v2 14/35] ACPI: Only enumerate enabled (or
 functional) devices
Message-ID: <ZTKglklxz8PN9VmI@shell.armlinux.org.uk>
References: <20230913163823.7880-1-james.morse@arm.com>
 <20230913163823.7880-15-james.morse@arm.com>
 <ebfa8b5c-c09f-a1e6-e6ec-f4f3cda9de03@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ebfa8b5c-c09f-a1e6-e6ec-f4f3cda9de03@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_084533_368835_591E8448 
X-CRM114-Status: GOOD (  20.44  )
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

On Tue, Sep 19, 2023 at 09:43:46AM +1000, Gavin Shan wrote:
> On 9/14/23 02:38, James Morse wrote:
> > +	if (!device->status.present && !device->status.enabled)
> > +		return device->status.functional;
> > +
> > +	return device->status.present && device->status.enabled;
> >   }
> >   EXPORT_SYMBOL_GPL(acpi_dev_ready_for_enumeration);
> 
> Looking at Salil's latest branch (vcpu-hotplug-RFCv2-rc7), there are 3 possible statuses:
> 
>   0x0       when CPU isn't present
>   0xD       when CPU is present, but not enabled
>   0xF       when CPU is present and enabled
> 
> Previously, the ACPI device is enumerated on 0xD and 0xF. We want to avoid the enumeration
> on 0xD since the processor isn't ready for enumeration in this specific case. The changed
> check (device->status.present && device->status.enabled) can ensure it. So the addition
> of checking @device->state.functional seems irrelevant to ARM64 vCPU hot-add? I guess we
> probably want a relaxation after the condition (device->status.present || device->status.enabled)
> becomes a more strict one (device->status.present && device->status.enabled)

Okay, I'm confused by your comment.

As mentioned in my reply to Jonathan, the current code tests for
device->status.present || device->status.functional, not
device->status.present || device->status.enabled.

Digging back in the history, the acpi_device_is_present() helper
was added in 202317a573b2 "ACPI / scan: Add acpi_device objects for all
device nodes in the namespace". The commit description states:

    Modify the ACPI namespace scanning code to register a struct
    acpi_device object for every namespace node representing a device,
    processor and so on, even if the device represented by that namespace
    node is reported to be not present and not functional by _STA.

It seems the code originally used this test

-       if (!(sta & ACPI_STA_DEVICE_PRESENT) &&
-           !(sta & ACPI_STA_DEVICE_FUNCTIONING)) {

So this commit is just continuing that "tradition".

Digging further back, we find:

778cbc1d3abd ACPI: factor out device type and status checking

-       case ACPI_BUS_TYPE_PROCESSOR:
-       case ACPI_BUS_TYPE_DEVICE:
...
-               /*
-                * When the device is neither present nor functional, the
-                * device should not be added to Linux ACPI device tree.
-                * When the status of the device is not present but functinal,
-                * it should be added to Linux ACPI tree. For example : bay
-                * device , dock device.
-                * In such conditions it is unncessary to check whether it is
-                * bay device or dock device.
-                */
-               if (!device->status.present && !device->status.functional) {

and that comment seems to indicate where the !present && functional
case comes from.

So, I think it's necessary to continue supporting the !present &&
functional case otherwise it seems to me that we'll be regressing some
platforms.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
