Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6153D5B161
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 05:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qXjq7PECPo6yM+WNXGEfAZYeb5NcOxzcU3bQgbU0hEg=; b=gBDfrUmBLHpj8X
	npoKbrBXCP82fhPTG2vvKYN/oqCZWBz5kCaSXcg8D9OIOuHJkrlxoKRlsef1wtaT6/biJqpYaBb42
	Y0ZeWs5n3Wp3CSqe5TZh5HJTKFRqxWU6xcd6krS9f2iC2ia+F1OPAJqHZdJPo9e508A2g6BhsqIF8
	Do6xdoNGcJTU8lKGLBmlFakff5ClWu0FsABLYxFO+tXd//SuNNYkbJhFQxG9eBXRQrF3KkXh1fkHA
	PeTPvv5hawRRQFEZ/7drKh1P/9fSm9961jsUy9RYYxg+7n1NLiPofmMo/NTjHsrDRSF5blBKCCi5l
	lZ3M9quADiUVE40sBSig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVNkZ-00000004is6-0bR2;
	Tue, 16 Dec 2025 05:37:31 +0000
Received: from mail1.out.titan.email ([3.93.85.209])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVNkW-00000004iri-0li6
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 05:37:29 +0000
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4dVm0P2kWVz2x9p;
	Tue, 16 Dec 2025 05:37:25 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=e+1r86P5HAFAF4tmTh17hZ9dWoicuDdYMgvJbIXPz64=;
	c=relaxed/relaxed; d=ziyao.cc;
	h=from:subject:mime-version:in-reply-to:to:cc:references:date:message-id:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1765863445; v=1;
	b=N/FLnSUr35vYGMSmYsL4FIlNhq75xVLuF7IJyhPSC7LlfUnYFFWzbNIZAwnhi7f/mb3wD79i
	ctZr08srNhABusuKKJ8uEWWCFNCi2Mrbn7p0j/qNwEtglZB1e+RwJdwQWZxeHfvyAPAifviazui
	KWT8bPQuZPjAXc1/GzHKhmv8=
Received: from pie (unknown [117.171.66.90])
	by smtp-out.flockmail.com (Postfix) with ESMTPA id 4dVm0L4DW0z2xCT;
	Tue, 16 Dec 2025 05:37:22 +0000 (UTC)
Date: Tue, 16 Dec 2025 05:37:18 +0000
Feedback-ID: :me@ziyao.cc:ziyao.cc:flockmailId
From: Yao Zi <me@ziyao.cc>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Yixun Lan <dlan@gentoo.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add i2c buses on OrangePi RV2
Message-ID: <aUDwDkd8k_4gD1yc@pie>
References: <20251215-k1-boards-add-mmc-v1-0-d68dc87d4aab@rootcommit.com>
 <20251215-k1-boards-add-mmc-v1-1-d68dc87d4aab@rootcommit.com>
 <aUAF4iNjuP5AWJaf@pie>
 <4acfc5d8-d8d9-4c9b-99eb-09c7b82ddd04@rootcommit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4acfc5d8-d8d9-4c9b-99eb-09c7b82ddd04@rootcommit.com>
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1765863445215998306.27573.7974967081414755406@prod-use1-smtp-out1001.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=a8/K9VSF c=1 sm=1 tr=0 ts=6940f015
	a=rBp+3XZz9uO5KTvnfbZ58A==:117 a=rBp+3XZz9uO5KTvnfbZ58A==:17
	a=kj9zAlcOel0A:10 a=MKtGQD3n3ToA:10 a=CEWIc4RMnpUA:10 a=2wmZI80qAAAA:8
	a=m09C00ilCGA78TySx9AA:9 a=CjuIK1q_8ugA:10 a=3z85VNIBY5UIEeAh_hcH:22
	a=NWVoK91CQySWRX1oVYDe:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_213728_297989_89BDE9E3 
X-CRM114-Status: GOOD (  27.13  )
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

On Mon, Dec 15, 2025 at 03:00:52PM +0000, Michael Opdenacker wrote:
> Hi Yao
> 
> Thanks for your helpful questions!
> 
> On 12/15/25 13:58, Yao Zi wrote:
> > On Mon, Dec 15, 2025 at 10:10:14AM +0000, Michael Opdenacker wrote:
> > > The OrangePi RV2 board exposes i2c2 and i2c8 buses
> > > from the Spacemit K1 SoC.
> > > 
> > > This declares devices present on such buses, in particular
> > > the at24 eeprom to store MAC addresses and the regulators
> > > attached to the PMIC on i2c8.
> > This series is named as "Attempt to enable MMC on SpacemiT K1 boards",
> > what's the relationship between MMC and PMIC/I2C bus? You didn't make
> > use of any regulators in the second patch, either (which seems wrong to
> > me).
> 
> I expected that declaring the regulators under the PMIC on i2c8 was enough
> to enable them, but I'm happy to be corrected.

Declaring them doesn't mean enable them. Regulator subsystem maintains a
enable reference count, and when it downcounts to zero, the regulator
gets disabled.

If no driver acquires one regulator, it gets disabled after 30s since
the regulator subsystem is initialized, see regulator_init_complete()
and regulator_init_complete_work_function.

On BPI F3, SD is supplied by buck4 of the PMIC. It's marked as
regulator-always-on, so wouldn't be disabled and then cause issues for
the SD card, but this doesn't mean it's okay to omit the correct
regulator supplier of SD.

> > 
> > vmmc-supply specifies the card's power supply. And if you want to enable
> > SDR modes which mandate 1.8v IO level, vqmmc-supply is also necessary
> > for switching between 1.8v and 3.3v.
> 
> 
> I was thinking to get started without the SDR modes first, to make sure
> basic operation works first. Would that work?

Yes.

FYI, for SDR104 mode, you may need to implement some tuning logic[1] as
indicated by vendor driver,

	/*
	 * Tuning is required for SDR50/SDR104, HS200/HS400 cards and
	 * if clock frequency is greater than 100MHz in these modes.
	 */

Though in mainline the eMMC on BPI-F3 already makes use of HS400 mode
without tuning. No idea what happened here, or it just happens to work
well.

Also, the pin controller on K1 SoC seems to have some undocumented
registers to select the IO voltage of SD pins, which should be adjusted
when switching IO voltage[2].

I think these pins should be implemented in the pinctrl driver, then you
could create two pinctrl states, one for 1.8v operation, one for 3.3v,
and switch between them through pinctrl_lookup_state() when changing IO
voltage.

The last thing to mention is that the three MMC controllers on K1 aren't
same, The one used for eMMC is the only one that has a phy (both SD and
SDIO controllers are marked as SDHCI_QUIRK2_BROKEN_PHY_MODULE[3]), thus
have different reset and tuning logics.

You probably need to create new compatibles for the SD and SDIO
controllers instead of re-using spacemit,k1-sdhci, and write correct
sdhci_spacemit_reset() for controllers without phy. This is probably
necessary even if you don't implement SDR modes.

> Would you have board examples to recommend, with an MMC controller operating
> in a way similar to the one on SpacemiT K1?

All sd/emmc controllers work similarly... you may want to take a look at
mmc-controller-common.yaml for common properties.

> Thanks again
> Michael.

That's it! I've struggled for hours with the MMC driver, and these are
all strange points which I've figured out. Hope it's helpful, and feel
free to ask me if I am not clear.

Regards,
Yao Zi

[1]: https://gitee.com/spacemit-buildroot/linux-6.6/blob/k1-bl-v2.2.y/drivers/mmc/host/sdhci-of-k1x.c#L1203
[2]: https://gitee.com/spacemit-buildroot/linux-6.6/blob/k1-bl-v2.2.y/drivers/mmc/host/sdhci-of-k1x.c#L923
[3]: https://gitee.com/spacemit-buildroot/linux-6.6/blob/k1-bl-v2.2.y/arch/riscv/boot/dts/spacemit/k1-x_deb1.dts#L670

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
