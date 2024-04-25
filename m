Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBF0C10F15
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 09:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VNUrR9aj+F0NB6rUhhNaO6af9mEAUJCgjhFa+bcVACE=; b=lFcuhmCAmv+lvR
	eHilbBX4F5CcMCAvznCnsUgWsxVSWhUMKaWaTSS3hnVH2qyfGAfqtdwzbJIUUPCmakQ+DpAwA55+A
	oQl9Kk0P0e6c5L1ODb16ikCmwBZB5ngc9xyNmWBFawELkphNH7xJfyjw7z+XmdS+A7HDsJgT2HwnL
	QW9W/KvIfDLaDLQIC3f6tT6hzjdVuFzcOiq6mdHodzksJ7DJ6Ct6XI6JXX8+deaYftpbh2hr+jsvI
	+4dnoWqX5RnaMlQZpQIL4iaFIEm5mXbhRlZPLEDRhL67VSQuXXRx9SbD42RpxFtsX/sYkJeP0vV3E
	mX6juuh9IMUdws8evJ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzvcY-00000007fSS-34TL;
	Thu, 25 Apr 2024 09:42:26 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzvcV-00000007fRF-3YP2
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 09:42:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C6B21BF206;
	Thu, 25 Apr 2024 09:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714038136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r3IJKX6YYOrWpRdOFBbgw2YGdZZtaDeVC9l9frr3qlM=;
	b=HGckbk8E/FnUpqauUFlW/BLyQd6u5rhkIC/Qnq3mXWzUv0BqcRm1UNi1ZwlqzpcR1lf5y+
	BZ0bd+V+rPX8/IitYi+rQMb8095bDihlh0QDkssdtANr3uQbj2beWTjSE2+pnIwSaRMvsw
	nG90Sbbd7TwwyFPzBfG+yl7kRQ6HpO0/l8g4oM7g09M22HukRXLOsM37mOy8dOXbg420ut
	qJVFTEQ2o3kDntr95ivu1D0Y6FwJEOC/HLVIXgbKwecvslRgn+eBrAgwCXTiItpmL1UxuA
	JInfxalOGUCmNPEp1J60asyhcvKZ3hRp3YUi/YHXBRljnICX4+zpVauMeEiYlg==
Message-ID: <5e52bbd6-d336-4101-8740-0f5cd759227b@bootlin.com>
Date: Thu, 25 Apr 2024 11:42:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add I2C support on TH1520
To: Conor Dooley <conor.dooley@microchip.com>
Cc: jszhang@kernel.org, guoren@kernel.org, wefu@redhat.com,
 andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, linux-riscv@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Drew Fustini <dfustini@tenstorrent.com>
References: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
 <20240425-boxcar-maroon-f07c5aba9272@wendy>
Content-Language: en-US
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
In-Reply-To: <20240425-boxcar-maroon-f07c5aba9272@wendy>
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_024224_068645_5158F83E 
X-CRM114-Status: GOOD (  12.74  )
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



On 4/25/24 11:00 AM, Conor Dooley wrote:
> On Thu, Apr 25, 2024 at 10:21:31AM +0200, Thomas Bonnefille wrote:
>> This adds I2C support in the device tree of the T-Head TH1520 RISCV-SoC
>> and a default configuration for the BeagleV-Ahead. It appears that the
>> TH1520 I2C is already supported in the upstream kernel through the
>> Synopsis Designware I2C adapter driver.
> 
>> As there is no clock driver for this board as of today, this patch
>> series uses a fixed-clock named i2c_ic_clk.
>> There is also no pinctrl driver yet so pinmux must be handled manually
>> for now.
> 
> https://lore.kernel.org/linux-riscv/20240103132852.298964-1-emil.renner.berthing@canonical.com/
> https://lore.kernel.org/linux-riscv/20240110-clk-th1520-v1-0-8b0682567984@tenstorrent.com/
> 
> These seem to be the most recent versions of each. I guess they're both
> just waiting for their authors to have the time to get another version
> written.

Yes, actually, I used Emil's patch with a custom pinctrl configuration 
to test the I2C. It appeared to be ready enough for my use.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
