Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FF9D637AE
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 21:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtc3mBXfy1ybTcX9pYpscYHqxOgN5SnMu8dgoizb4ls=; b=DO0ascJeXhy9Dmj7+szOp8/hI3
	TIZS2y/frsIQrNk1m5AnFgwnTuZg0QSrnR4yMOSU9If8Za1fM7IG6u+0U88c4qlSLT9szwL6QOj9o
	Fivfkk7Qp/WgNLNVT0D2iLsZSYfkIcLV0LTVq/DwUfq/hx+XdYZe/Y4xR0N6S6+XpuDaMni34f9Ve
	1Xy1G1LCciWnxZdC5ikbMYmn/9g9mfUXvcdQNJw4jPHXmAQcPUK7+TC4FFKZMOmNKSaltZ6oGh/Tg
	NiBmLZFnbHPHXMMHpQ16tCRTK396v+S9QJ5bhk8EwkwL4iTDS0BMW1aQxbfdbV4PSpelrcrSe/P3p
	iWUCn6FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcEu-00000005pER-1NYk;
	Tue, 16 Dec 2025 21:05:48 +0000
Received: from cichlid.ash.relay.mailchannels.net ([23.83.222.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcEq-00000005pDz-3Bha
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 21:05:46 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 16E19562335;
	Tue, 16 Dec 2025 21:05:42 +0000 (UTC)
Received: from de-fra-smtpout7.hostinger.io (trex-green-9.trex.outbound.svc.cluster.local [100.103.179.169])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 6DEF8562715;
	Tue, 16 Dec 2025 21:05:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1765919141;
	b=7zXKCUAiR/HEYtHw/fHmF7isW/YMJlOIfEy9DAPMAlJvYBFEJVTYgkR8WezB1vo3I5dn5K
	ge0wZTUkyEwBuDNUI/V7Bl1bN45qsnEy/RxidhIVmkYGBjWUGxUFywR3uEFqwQkqOCmY7R
	daYuTIsBIzEaSSmvS+Sxe0x+S52p1Gp/pXUc23TjtF0mb0vjSzkPgcOZmP9JKGctwlW8d/
	8j2+nb/kcwbnNltslhTSUUbYKvM9PXo13fymaL7nFhS+BQpkIyySAB9kWdMAGlJsv1VN+o
	regFnlS9Ktzv0XXTFEJNTZsiPMsVbDRWT56U+ljHVnC1PLN8a5UpuvUcXEkORQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1765919141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=eTIrfuDhr24TI2lSZux/GGADITfOggiET8mFqMQX6js=;
	b=iYhltbd72EvbW3HUkySf3Q5A5zdV6WpJz6Phdgrhs3Y7X5s8uHXgoX71Gg5385Hta/nBMS
	IfzGY7dqiiRndr31/PXusnppO59C3O3wOZGno8d1ze00Cofbri53+6Kf0PkNb35R/MfgLa
	IG066Paa82g0j/k2IUeWXNrt2rEczWFRzKXnJZ6VbGpgTzMz6L6I2u/AfAUPDqitlC95gh
	IYJvo+Wg7gJkRT8e/UjE992aaj4o1X9YFaW+I408KLA9ayayJv8pAubNqYmtNj1YvA1eM2
	esNBsZGmTpFFVpGbvYO3HJEn0K2blVBu5fjhmYADoZnnzl9SeRlcmMkbyn0aHQ==
ARC-Authentication-Results: i=1;
	rspamd-659888d77d-jcnb4;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Abiding-Cooing: 063ffa2f50f88687_1765919141814_2820594378
X-MC-Loop-Signature: 1765919141814:3717057727
X-MC-Ingress-Time: 1765919141814
Received: from de-fra-smtpout7.hostinger.io (de-fra-smtpout7.hostinger.io
 [148.222.55.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.103.179.169 (trex/7.1.3);
	Tue, 16 Dec 2025 21:05:41 +0000
Received: from [IPV6:2001:861:4450:d360:30d8:94c5:9529:bfd5] (unknown [IPv6:2001:861:4450:d360:30d8:94c5:9529:bfd5])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dW8bP3ypjz3wjX;
	Tue, 16 Dec 2025 21:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1765919138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eTIrfuDhr24TI2lSZux/GGADITfOggiET8mFqMQX6js=;
	b=UKNLg8pXXoeAuakJeFqoK+ULNQZRigp0iHQY1LrOcj1LlyjCNmZa/LoXXs1IZ9ew6ZEtf8
	CmitUHZfOlGgEQxWkOW24iJIV4t7HTyC4EIDLVlPoZAKKt/Ph+i5NFYN99koIyoKrHVQxw
	FUvjTXQ15UTztak95hzfioMkL8V9XOARENY5qaciTSowv0orteZEjLwUztLKCRPgZj5574
	0NH1ETZQuL0xM9ozgK6NaIC9YBerVgMiGP9IT5f9Gzh8c/s1bWvosBT6nEC4yXI/Evunrh
	1O3Apw6Y/zWDNXJrgrfJ/Eaxban5rpTixlLwKLWtpmWci6ducINCtiqOE3YBKA==
Message-ID: <29600710-fc66-41d0-b399-1b635d0789d9@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Binbin Zhou <zhoubinbin@loongson.cn>, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add i2c buses on OrangePi RV2
To: Yao Zi <me@ziyao.cc>, Yixun Lan <dlan@gentoo.org>
References: <20251215-k1-boards-add-mmc-v1-0-d68dc87d4aab@rootcommit.com>
 <20251215-k1-boards-add-mmc-v1-1-d68dc87d4aab@rootcommit.com>
 <aUAF4iNjuP5AWJaf@pie> <4acfc5d8-d8d9-4c9b-99eb-09c7b82ddd04@rootcommit.com>
 <aUDwDkd8k_4gD1yc@pie>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <aUDwDkd8k_4gD1yc@pie>
Date: Tue, 16 Dec 2025 21:05:37 +0000 (UTC)
X-CM-Envelope: MS4xfF5Vy1L1KouG49QIlLe5kFFaXNS6TCn6EH+qUk1Sff+7pUTB5PALKx2/986sedZ/CpYlJBEMbNbEqnJGpcWbKwcczUoTHni66kVNztVM/R7p0sglBT36 CSkRnhk3RJfH19FzmLnZ8Tr0MsCqFvusJ5Ipxjm5YhyAwvdsiBNMw91oU82GVtWgRjzJBgxvXtdfh9432MU6siiFl4qIXC6/iqNQJGU1laDfeiyeVueY3lPS u8OMRNJv1OmnNOsFunYZU1370GGSNSsaPgu0/IwogzSzPftmpXcSzBf5mcl8+1rST5OHM/ldHIvgMc76gzmJWcI8B+QjfpUEwlNqRL/q9/EokhoHNJqX+o0I H4/08Z0UKHie0MFEc4dekOiCwfL2uH0kPDVavoRMfrs+JgKLRG4qS70nlCXD/vGkykHPkQa2SKp36XiX5zKYRnjddJqUaL/EJ9W8MTDr2s3QHR5nnMwTktOG S9WrGF8kLnZ1JTw6QMEkPnc9hiAmZFh+jNTHqEfdZTmw2XvBQYi/icN9qQo=
X-CM-Analysis: v=2.4 cv=Ceda56rl c=1 sm=1 tr=0 ts=6941c9a2 a=txFWH1vTMWaEHP0dv8CF8Q==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=lv0vYI88AAAA:8 a=d70CFdQeAAAA:8 a=VJnbNgQhEQg3sspumF4A:9 a=QEXdDO2ut3YA:10 a=9qqun4PRrEabIEPCFt1_:22 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_130545_167729_443AE817 
X-CRM114-Status: GOOD (  32.81  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Yao

Thanks a lot for your help and tips, much appreciated!

On 12/16/25 06:37, Yao Zi wrote:
> On Mon, Dec 15, 2025 at 03:00:52PM +0000, Michael Opdenacker wrote:
>> Hi Yao
>>
>> Thanks for your helpful questions!
>>
>> On 12/15/25 13:58, Yao Zi wrote:
>>> On Mon, Dec 15, 2025 at 10:10:14AM +0000, Michael Opdenacker wrote:
>>>> The OrangePi RV2 board exposes i2c2 and i2c8 buses
>>>> from the Spacemit K1 SoC.
>>>>
>>>> This declares devices present on such buses, in particular
>>>> the at24 eeprom to store MAC addresses and the regulators
>>>> attached to the PMIC on i2c8.
>>> This series is named as "Attempt to enable MMC on SpacemiT K1 boards",
>>> what's the relationship between MMC and PMIC/I2C bus? You didn't make
>>> use of any regulators in the second patch, either (which seems wrong to
>>> me).
>> I expected that declaring the regulators under the PMIC on i2c8 was enough
>> to enable them, but I'm happy to be corrected.
> Declaring them doesn't mean enable them. Regulator subsystem maintains a
> enable reference count, and when it downcounts to zero, the regulator
> gets disabled.
>
> If no driver acquires one regulator, it gets disabled after 30s since
> the regulator subsystem is initialized, see regulator_init_complete()
> and regulator_init_complete_work_function.
>
> On BPI F3, SD is supplied by buck4 of the PMIC. It's marked as
> regulator-always-on, so wouldn't be disabled and then cause issues for
> the SD card, but this doesn't mean it's okay to omit the correct
> regulator supplier of SD.

Good to know!
Surprisingly, when I add this to the "sdhci0" node:

vmmc-supply = <&buck4_3v3>;

(after creating the label, of course), the device and its partition no 
longer show up in /proc/partitions!

I was hopeful because read-only mode already seems to work, but maybe 
indeed things are more complicated.
>
>>> vmmc-supply specifies the card's power supply. And if you want to enable
>>> SDR modes which mandate 1.8v IO level, vqmmc-supply is also necessary
>>> for switching between 1.8v and 3.3v.
>>
>> I was thinking to get started without the SDR modes first, to make sure
>> basic operation works first. Would that work?
> Yes.
>
> FYI, for SDR104 mode, you may need to implement some tuning logic[1] as
> indicated by vendor driver,
>
> 	/*
> 	 * Tuning is required for SDR50/SDR104, HS200/HS400 cards and
> 	 * if clock frequency is greater than 100MHz in these modes.
> 	 */
>
> Though in mainline the eMMC on BPI-F3 already makes use of HS400 mode
> without tuning. No idea what happened here, or it just happens to work
> well.
>
> Also, the pin controller on K1 SoC seems to have some undocumented
> registers to select the IO voltage of SD pins, which should be adjusted
> when switching IO voltage[2].
>
> I think these pins should be implemented in the pinctrl driver, then you
> could create two pinctrl states, one for 1.8v operation, one for 3.3v,
> and switch between them through pinctrl_lookup_state() when changing IO
> voltage.
>
> The last thing to mention is that the three MMC controllers on K1 aren't
> same, The one used for eMMC is the only one that has a phy (both SD and
> SDIO controllers are marked as SDHCI_QUIRK2_BROKEN_PHY_MODULE[3]), thus
> have different reset and tuning logics.

Wow, that's surprising. 
https://developer.spacemit.com/documentation?token=WZNvwFDkYinYx0k9jzPcMK5WnIe#12.5-sd%2Femmc 
doesn't seem to mention this (though I didn't check very carefully yet).
>
> You probably need to create new compatibles for the SD and SDIO
> controllers instead of re-using spacemit,k1-sdhci, and write correct
> sdhci_spacemit_reset() for controllers without phy. This is probably
> necessary even if you don't implement SDR modes.
>
>> Would you have board examples to recommend, with an MMC controller operating
>> in a way similar to the one on SpacemiT K1?
> All sd/emmc controllers work similarly... you may want to take a look at
> mmc-controller-common.yaml for common properties.

Right, I'm already using it :)

I'll be patient and try to progress step by step. My time is quite 
limited these days, so everyone is welcome to try and make this work.
Thanks again for everything
Cheers
Michael.

-- 
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
