Return-Path: <SRS0=lacq=HH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8DFDC433E0
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 03:41:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78EA264E27
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 03:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78EA264E27
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=ho+mlR1jWpiOEzzgpuNXtRulVz9o9yV1YZnLmGBg8hg=; b=wFE08kSf9+JnyDoOHFXPoeTP6
	ow5Knv/EwWo8MKXNH3G6mN6R3t3c0Jij/IvoQrKwpGLeUf8DkLiI5aFSkjDhcbJD58rrqhiNBKudR
	OGBQhv5k5X/OVIw/br3td/wvB/cEDOcLv7L6M2Ts45MZrBZe4VgAhxT/b3ODfoBulNMzUJEwrXudq
	4ChInivfo6N5wLRm7NIi12F4fgjCyQP5G/mcbYdgkjKurWdVwiSgJIhGAyF/4XjiM9IYUzk7j2oqH
	TkE9OrRbAJi16iPq+vmRLTheCmBBBfBXuoLPl+aygOTfIQx1SlMyL03Airisv/pwdaPTdTrg5+ZHi
	W57oXknFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7s03-0004g1-Uw; Fri, 05 Feb 2021 03:41:39 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7s00-0004fB-PL
 for linux-riscv@lists.infradead.org; Fri, 05 Feb 2021 03:41:38 +0000
Received: by mail-pf1-x42a.google.com with SMTP id x23so1944564pfn.6
 for <linux-riscv@lists.infradead.org>; Thu, 04 Feb 2021 19:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=QimgKicTVKB8CFOT6U4D26kkjK2yKouyNn4xr92QBo8=;
 b=Ba7vcpAlVVM1pKfdqd93MBTwNvK7yGzCSg1TeG7nS28L1EdiJOtLAg3adCFaWTvsgN
 aimv64cc7o9IBRiTSHNkjU7kULyC2G+hpfwLThdpLoMaxQPRBS2PA+Y8BajdpKZ1Pll6
 pFBLzP+MSbTybYYPhHFGArT0D1oJrFyC0+UC19VyxwC5pvHAfbMFSIdzP3p4GojTik9u
 YMi8aqekZiYUjUUNuSILoB+V7nUcAvaCi43cW1v2gn94Gwoz+c0Z6pj9Ag2HZ5EdIcNK
 CcW6n1IFYxLGcphv+Z08i+cwNfFGIqhNKmAWDdaAB1AQtwNWufk8FDsuMyiRbhwhi6P3
 XpKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=QimgKicTVKB8CFOT6U4D26kkjK2yKouyNn4xr92QBo8=;
 b=MH+blMmGJ1qgh7T6AK6aN9wJg+7U0jtAHCpGsdPGICkaglH2YCW4fxq+NYo+s6u8NW
 yXiY4CnlaYpEz9wkVmZX+8AAagE7B3sr8im5supaOiY1REe2p4fhIQ/7fQ834I1s1OnU
 L2BQYVVhxpxip4+6iKIBN+rkGki8uX9F0NcsLLtCYX7fR5EtjR2ufZv/PicD9rJIe7ps
 gqfj3KcRKsV8AWxr9SQZVIXqghRbvlzg2riuMj/0mS1xKf/yfRhD3k30pC2K6bZ7mihJ
 IYxd8DWegy+RfH9rK6vN3JLPmIiX7t4n96jS4an4eEwOAiGBmIB18jqFf6wPZJFaoyA2
 h8yA==
X-Gm-Message-State: AOAM53045BckzC7cmm5sZ1ZhW/sqfQx7fqlN8FJwRJ+KkmnfajPq0v76
 rKwTEk6m2eH3Cg0o+iJ1GTeGOQ==
X-Google-Smtp-Source: ABdhPJyNNCzLC06Wm9lm94zfSUL7kPoEc4canoGBm78Qn4OO3oRu1ZZtPD3JNaP4FFmuHULjYrx16w==
X-Received: by 2002:a63:5116:: with SMTP id f22mr2248678pgb.162.1612496492592; 
 Thu, 04 Feb 2021 19:41:32 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 73sm3788903pfa.178.2021.02.04.19.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 19:41:31 -0800 (PST)
Date: Thu, 04 Feb 2021 19:41:31 -0800 (PST)
X-Google-Original-Date: Thu, 04 Feb 2021 19:41:09 PST (-0800)
Subject: Re: [PATCH v2 0/3] fix macb phy probe failure if phy-reset is not
 handled
In-Reply-To: <87a6skw31l.fsf@igel.home>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: schwab@linux-m68k.org
Message-ID: <mhng-5072e618-a4fa-4982-a3ba-e395cde8a145@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_224136_958672_7A7E866B 
X-CRM114-Status: GOOD (  26.90  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, kernel@esmil.dk,
 anup@brainfault.org, linux-kernel@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, yash.shah@sifive.com, robh+dt@kernel.org,
 Alistair Francis <Alistair.Francis@wdc.com>, sagar.kadam@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 04 Feb 2021 02:16:54 PST (-0800), schwab@linux-m68k.org wrote:
> On Jan 13 2021, Palmer Dabbelt wrote:
>
>> On Tue, 10 Nov 2020 07:22:09 PST (-0800), sagar.kadam@sifive.com wrote:
>>> HiFive Unleashed is having VSC8541-01 ethernet phy device and requires a
>>> specific reset sequence of 0-1-0-1 in order to use it in unmanaged mode.
>>> This series addresses a corner case where phy reset is not handled by boot
>>> stages prior to linux.
>>> Somewhat similar unreliable phy probe failure was reported and discussed
>>> here [1].
>>> The macb driver fails to detect the ethernet phy device if the bootloader
>>> doesn't provide a proper reset sequence to the phy device or the phy itself
>>> is in some invalid state. Currently, the FSBL or u-boot-spl is resetting
>>> the phy device, and so there is no issue observed in the linux network
>>> setup.
>>>
>>> The series is based on linux-5.10-rc5.
>>> Patch 1: Add the OUI to the phy dt node to fix issue of missing mdio device
>>> Patch 2 and 3:
>>> 	Resetting phy needs GPIO support so add to dt and defconfig.
>>>
>>> [1] https://lkml.org/lkml/2018/11/29/154
>>>
>>> To reproduce the issue:
>>> Using FSBL:
>>> 1. Comment out VSC8541 reset sequence in fsbl/main.c
>>>    from within the freedom-u540-c000-bootloader.
>>> 2. Build and flash fsbl.bin to micro sdcard.
>>>
>>> Using u-boot:
>>> 1. Comment out VSC8541 reset sequence in board/sifive/fu540/spl.c
>>>    from mainline u-boot source code.
>>> 2. Build and flash u-boot binaries to micro sdcard.
>>>
>>> Boot the board and bootlog will show network setup failure messages as:
>>>
>>> [  1.069474] libphy: MACB_mii_bus: probed
>>> [  1.073092] mdio_bus 10090000.ethernet-ffffffff: MDIO device at address 0
>>> 	       is missing
>>> .....
>>> [  1.979252] macb 10090000.ethernet eth0: Could not attach PHY (-19)
>>>
>>> 3. Now apply the series build, and boot kernel.
>>> 4. MACB and VSC8541 driver get successfully probed and the network is set
>>>    without any failure.
>>>
>>>
>>> So irrespective of whether the prior stages handle the phy reset sequence,
>>> the probing is successful in both the cases of cold boot and warm boot.
>>>
>>> Change History:
>>> ===============================
>>> V2:
>>> -Rebased v1 on linux kernel v5.10-rc3.
>>>
>>> V1:
>>> -Ignore 4th patch as suggested and so removed it from the series.
>>> -Verified this series on 5.7-rc5.
>>>
>>> V0: Base RFC patch. Verified on 5.7-rc2
>>>
>>> Sagar Shrikant Kadam (3):
>>>   dts: phy: fix missing mdio device and probe failure of vsc8541-01
>>>     device
>>>   dts: phy: add GPIO number and active state used for phy reset
>>>   riscv: defconfig: enable gpio support for HiFive Unleashed
>>>
>>>  arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 2 ++
>>>  arch/riscv/configs/defconfig                        | 2 ++
>>>  2 files changed, 4 insertions(+)
>>
>> David pointed out I missed these, they're on fixes.  Thanks!
>
> This is now on 5.10.12, and breaks ethernet on the Hifive Unleashed:
>
> [   12.777976] macb 10090000.ethernet: Registered clk switch 'sifive-gemgxl-mgmt'
> [   12.784559] macb 10090000.ethernet: GEM doesn't support hardware ptp.
> [   12.791629] libphy: MACB_mii_bus: probed
> [   12.919728] MACsec IEEE 802.1AE
> [   12.984676] macb 10090000.ethernet eth0: Cadence GEM rev 0x10070109 at 0x10090000 irq 16 (70:b3:d5:92:f1:07)
> [   14.030319] Microsemi VSC8541 SyncE 10090000.ethernet-ffffffff:00: phy_poll_reset failed: -110
> [   14.038986] macb 10090000.ethernet eth0: Could not attach PHY (-110)

Sorry about that.  Looks like we forgot to add the special reset sequence to
the VSC8541, which the driver doesn't yet support (there's a thread about it,
but I guess I forgot to clean up the patch).  IIUC this should manifest on
master as well, so my guess is that nobody is testing the HiFive Unleashed any
more (probably a bad sign).

I'll send out a revert.  I looked at the GPIO driver and can't tell if it's
twiddling GPIO lines when probed, in which case just enabling the GPIO would
break the ethernet.  Hopefully we're OK with the GPIO driver enabled.

Thanks for testing this.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
