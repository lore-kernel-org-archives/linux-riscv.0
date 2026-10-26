Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E4D606A33D
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2026 16:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ivx5gaSg;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=V5N6cRfv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=m6qYbPUFJYLCPucVtFX4Ud9HWkIaRgPL/XxXl2C3XjQ=; b=ivx5gaSgcrlAMvQyIkCHApSOK8
	TfrNG8eaIcBJdIV5vw9MtoRIxaHmvtDLX0JtiOL6/J+39q1gdxZ5n/c3JF724uARaFlH0GBknBoDP
	OICmXpIqP+mR/rpykzKwSmAjfVibD4cHKM8DD+m+SQfTawmGY1t+/8taJb8tbz0N19moqR8rDi6hU
	lpJpcfqa7aicbWgNg+BAJPph4dS7zgpUkh7t4faU0mg31YM/duidjeMSA3Ew3HeIX8e6P4ZNWf0SZ
	zcXwBexMuQsRZ2m8sQ6xD6AeIOKQ1rQJdaGf5SO+7fmGQX+FHJ9D2gXyxM9Qx/29MY9+FSLdJ5ncc
	fA8JYQxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNX8-00000002sMb-1Qmp;
	Mon, 26 Oct 2026 16:26:50 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNX4-00000002sLf-1iPX
	for linux-riscv@lists.infradead.org;
	Mon, 26 Oct 2026 16:26:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1793031979;
	bh=ANAaz8c+22RJYJaWGVW0QrQPpeeNnCFIvngIi19CeD8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V5N6cRfvWRSdhIqboQ7GDT+fSljzlIXWXYotD1A8/OEosA2wkR53uLSdlji/kL07F
	 ole4JYQwWQTcApIMmvdJvbmpYD4zU7IGSnMTTnt9K5W2+NvBSWS1CjqpsmK+gKWOWV
	 kD3TPDxoWLPTqy/UYLm3VFi8vOw2X4QoU9qsTFWl0F00993IOF6oVoZnlk483x9/72
	 DVOkA75LfGV7/XRK84cXpY449WEc20rbc5UdhqH3uW179qVDMEjQe0POvSHa8s3jDU
	 Yr3aSTfI30B5lsLt4YfJ+XOzcyn9zfydDQZ2/SZJs7dijYpkV+TPiel8NAeOY/slhc
	 RvpAwiEvHzXbg==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id E6365B2272DB;
	Mon, 26 Oct 2026 17:26:16 +0100 (CET)
Message-ID: <a678fbd3-10cc-4a31-a847-81a6c0e21c39@freeshell.de>
Date: Mon, 26 Oct 2026 09:26:14 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] riscv: dts: spacemit: mark K1 boot nodes
 bootph-pre-ram
To: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Cc: dlan@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com>
 <813d3f4a-66a9-48df-b9de-6a46b9388d0a@freeshell.de>
 <20261026033813.432250-1-alan.tseng.cs@gmail.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20261026033813.432250-1-alan.tseng.cs@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_092646_925859_232D05AA 
X-CRM114-Status: GOOD (  22.94  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/25/26 20:38, Hung-Chun Tseng wrote:
> Hi E,
> 
> On 10/24/26 07:45, E Shattow wrote:
>> Split the patches in this series so we have a clearly defined initial
>> changeset that does "Extend the BootROM configured peripherals to device
>> tree bootph-pre-ram hints for any SPL loaded by that BootROM in SD,
>> eMMC, and SPI NOR boot modes".
> 
> Thanks, that makes sense. For v4 I plan this split:
> 
> 1. BootROM: the fixed clocks, the clock and reset controllers, uart0,
>    sdhci0, emmc and qspi in k1.dtsi, and the SPI NOR flash@0 in the
>    board files.
> 
> 2. DRAM setup, as an add-on for Yixun to take or leave: i2c2 and i2c8
>    in k1.dtsi, and the EEPROM, the PMIC and its buck1, buck3 and aldo1
>    in the board files.
> 
>> Capture all the BootROM SPL loader flows
>> that we can understand (USB missing currently? please add this)
> 
> USB download mode goes through the OTG port (FDL button, then
> "fastboot stage"), but mainline has no node for the USB2 OTG
> controller behind it yet. The DWC3 is a different controller. So there
> is nothing to tag for USB today, and I'd add it once that node lands.

Is "[PATCH v4 0/8] Add SpacemiT K1 USB2.0 controllers support" what you
refer to?:

https://lore.kernel.org/lkml/20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com/

"The SpacemiT K1 SoC has two USB2.0 controllers, one has Dual-Role
support, but the hardware has no internal OTG registers, the other is
Host only. These controllers are compatible with Chipidea USB2 driver
with some flags set and reset control support."

Looking briefly at the design guide section 1.4.1 "USB 2.0"

https://cdn-resource.spacemit.com/file/chip/K1/K1_Hardware_Design_Guide_en.pdf

quote "USB2.0-0 serves as the Download interface." and "A self-powered
USB device/hub is needed to test the host function of the dual-role
controller on Banana Pi F3, a MINI-PCIe USB2.0 module (a cellular module
e.g.) is needed to test the host only controller."

That looks to me like the target to hint. You could ask for the hints to
be added on that (USB 2.0) series, or note as a dependency for this
series and do so here.

Note also "[PATCH] riscv: dts: spacemit: enable USB2.0 controllers on
Milk-V Jupiter"
https://lore.kernel.org/all/20261009-jupiter-usb2-v1-1-ab84a00d3b64@redhat.com/

"On Milk-V Jupiter boards, usb2_0 is connected to a Type-C connector
which cannot act as a power source."

More of the same, I think, adding bootph-pre-ram hints to phy@c0940000
and usb@c0900000 or by label references per-board whatever shape of that
is best. Per-board is more useful to potential users of this at SPL
phase but may introduce inaccuracies (as it pertains to describing
hardware) as the decisions to default to "host" mode and not "otg" are
common sense things that are (looking at history of these decisions)
permissible to be different than default hardware state after possible
BootROM configuration. I do wonder if the SPL environment directly
following BootROM is something we should perhaps be describing in Linux
devicetree as its own distinct thing. Well, don't forget about USB
anyway I think there's an actionable there and it's just a coordination
issue which series should take that change.

> 
> Yixun, could you confirm that the BootROM uses that OTG controller for
> USB download, and that it does not touch the DWC3?
> 

...

> Does this split look right to you? I'll send v4 after the merge window.>
> Thanks,
> Hung-Chun

Yes, thank you -E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
