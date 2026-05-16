Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CFFCD4F21
	for <linux-riscv@archiver.kernel.org>; Sat, 16 May 2026 14:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JuLOeKxC2xmecJABqj4cquoIjCtymbyWhpfTqwERXxg=; b=NdbSGbGEiS+vGC
	k5wniqqbSjcDTUf5ogfnS0PibgKEv9ObV3+Q9W/G7yqVxG3Hw5rRsjz66XMTxa8Wr+cBGwboTxvlZ
	lY46QUjSRB4spAe3daLOePieA/AEKUG03kSw3FbFDc7uaqng7HtEBWr5sw2HwRc2nXxxfK+90uDUb
	2Vv+6DK4Zcms82Niqzl7WcsSBKpDVj4Wukip0UlTUqfuxN/rttW0tXiGRwQa41AP/+C6JuPU9jXVx
	2hgPx+5dIwOe01emHsNfoQL7OcWKmXisALgTgmCNGjvBzvmRSds5k4IU1dkzpNHrqrpV/CKG5y1+0
	N1Gxox33ufGypgHl0fkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOFjS-0000000AqJ6-3Isa;
	Sat, 16 May 2026 14:11:10 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOFjP-0000000AqIA-2zer
	for linux-riscv@lists.infradead.org;
	Sat, 16 May 2026 14:11:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1778940640;
	bh=gl6h17IIH0vCWE5gXx+SMnqjSaIj3H6R4jAvrfOok/s=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=mlxvpyFnzbK3DFvybUsWoIBIVa8Qfja0e3gqLHisdV9JW1eAGO0YOSQ+F4aFOdbim
	 hBm04vC9FHY6OJyHjjE6HfsP8JMwSuPN1lwJyOYhRP6woLbb4L6Rnw+MfzeGY5KSnP
	 3m8YV3Q4YA1Wtm5hK4MS945z/nX8RsoMKKpm55YgxiG9+asRULIlhrVKSV2cgxYkOh
	 jFnEXvNCQKn4in/JVRz1jZQJuRLOHowB6LOGWmV+uViuZTplAUuM8QncSp3IUYA8Pm
	 GJKC7m/379kbvOnkdw8uv8IT+CyqlMuESugYs8M7a4+xWVJeYu6lHhph2VeEeseVkR
	 pNrizXHelklgw==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id BB048B220220;
	Sat, 16 May 2026 16:10:37 +0200 (CEST)
Message-ID: <57bd1600-fa0f-4387-b2fc-4dd17430ce5b@freeshell.de>
Date: Sat, 16 May 2026 07:09:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] riscv: dts: spacemit: enable eMMC on Milk-V Jupiter
To: Yixun Lan <dlan@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 "open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20260514160356.1642075-1-aurelien@aurel32.net>
 <20260514160356.1642075-4-aurelien@aurel32.net>
 <f52a821b-157a-467d-84ee-4d1d4a96f673@freeshell.de>
 <agbP0-OsfQRFJcr0@aurel32.net> <20260516053730-GKA3675990@kernel.org>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20260516053730-GKA3675990@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_071108_192816_EA5E0354 
X-CRM114-Status: GOOD (  21.42  )
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



On 5/15/26 22:37, Yixun Lan wrote:
> Hi Aurelien,
> 
> On 09:48 Fri 15 May     , Aurelien Jarno wrote:
>> On 2026-05-14 23:49, E Shattow wrote:
>>> On 5/14/26 08:56, Aurelien Jarno wrote:
>>>> The Milk-V Jupiter board has a connector for an eMMC module. Add an
>>>> entry for it in the device tree and alias it mmc0. As it is not
>>>> populated by default, do no mark it as non-removable.
>>>>
>>>
>>> The meaning of "non-removable" here is whether it is expected to be
>>> added and removed during use, requiring to be probed again; not whether
>>> it is a user configurable module or soldered down part.
>>
>> Not connecting the eMMC module and larking it as non-removable causes this info
>> message to appears in the logs:
>>
>> mmc0: SDHCI controller on d4281000.mmc [d4281000.mmc] using ADMA
>> mmc0: Failed to initialize a non-removable card
>>
> 
> I'm with E Shattow here, and would prefer to add "non-removable" property,
> Unlike SD card, the eMMC has no CD pin, some logic may be handled slightly
> differently.
> 
> For that failure message, I have no idea how to deal with it but might
> just ignore it.. Guess it's the price that have to pay if enabling the
> eMMC in DT but has no module soldered or plugged in?
> 

Yes in this situation the ideal measure would need an overlay to set the
status = "okay" or status = "disabled" dependent on the presence or
absence of the module, correctly representing the state of the hardware
- there is no module attached with which to configure. That is no
trivial amount of work though and the easier (and I think we agree
acceptable) approach is the driver will do what it does and inform that
the module is not initialized. I would agree that an error message is
the more useful outcome even if we would like to silence the error
message it is at least accurate information.

For comparison, Pine64 Star64 boot messages when SD Card is present and
eMMC module is not populated, as follows.

U-Boot:
Working FDT set to ff731a10
Hit any key to stop autoboot:  0
Card did not respond to voltage select! : -110
** Booting bootflow '<NULL>' with efi_mgr
Booting: Debian

Linux kernel (reverse timeline log):
dwmmc_starfive 16020000.mmc: IDMAC supports 32-bit address mode.
dwmmc_starfive 16020000.mmc: Using internal DMA controller.
dwmmc_starfive 16020000.mmc: Version ID is 290a
dwmmc_starfive 16020000.mmc: DW MMC controller at irq 26,32 bit host
data width,32 deep fifo
dwmmc_starfive 16020000.mmc: Got CD GPIO
dwmmc_starfive 16010000.mmc: IDMAC supports 32-bit address mode.
dwmmc_starfive 16010000.mmc: Using internal DMA controller.
dwmmc_starfive 16010000.mmc: Version ID is 290a
dwmmc_starfive 16010000.mmc: DW MMC controller at irq 25,32 bit host
data width,32 deep fifo
mmc_host mmc1: Bus speed (slot 0) = 45511111Hz (slot req 400000Hz,
actual 399220HZ div = 57)
mmc_host mmc0: Bus speed (slot 0) = 45511111Hz (slot req 400000Hz,
actual 399220HZ div = 57)
mmc_host mmc0: Bus speed (slot 0) = 45511111Hz (slot req 300000Hz,
actual 299415HZ div = 76)
mmc_host mmc1: Bus speed (slot 0) = 45511111Hz (slot req 50000000Hz,
actual 45511111HZ div = 0)
mmc1: new high speed SDXC card at address 0001
mmc_host mmc0: Bus speed (slot 0) = 45511111Hz (slot req 200000Hz,
actual 199610HZ div = 114)
mmc_host mmc0: Bus speed (slot 0) = 45511111Hz (slot req 100000Hz,
actual 99805HZ div = 228)

There "Card did not respond to voltage select! : -110" is repeated each
mmc interface that does not have media presently;  mmc1 is the eMMC
connection. This driver (for JH-7110 designware MMC controller) does not
complain about the eMMC module that is not attached.

I don't have an answer what should be done about that error message and
no opinion on making the driver less verbose or leaning into suggesting
an overlay (which is not trivial, so... feel free to ignore me on that)
however reporting on what is commonly true of 'non-removable' property.

Best regards,

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
