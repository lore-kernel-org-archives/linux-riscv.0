Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302EBC83F17
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 03:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NeWlFcb4mE0zHSRWruL7Tjy/dVZB78GYjj7HuXubdMQ=; b=qVPsNi6dOLvGx1
	cx8V1gSRaxoJRMx1TSeBmtSUf7WAd3JU8SuKYWduDREtzGCDoDKUTB0vXStqZSF8Dg7Y2NvvmvpfI
	e4kelF+cU+q6acKxHRtE0Br/BPifZj0FofC1095DgYiwi49ndCo9psXHLFWiQ9ghwH43YL9eqsMMY
	lsxyvmaQgm7DcZ0zt2XfTLZ10+PEp62lFze06hs1joKi/ccB7dhcN+CUHkV/exp4f9oHRA+9ftg9E
	HFQ/KwbSHyBoYxYbXZmdZZIkGI4Ldsncvl+IjgVGAsDpweIF9Co6zUQuymrbUdKkcyHwrQyDnBekS
	aGNhQWHV07+EgElsd0qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugEvA-0000000DY9y-1j42;
	Mon, 28 Jul 2025 03:53:04 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugEv6-0000000DY85-32wA
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 03:53:02 +0000
Received: from [192.168.2.54] (unknown [98.97.27.23])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 50E99B4E0003;
	Mon, 28 Jul 2025 05:52:52 +0200 (CEST)
Message-ID: <8841923c-cbb6-4cce-97f4-a851783b6102@freeshell.de>
Date: Sun, 27 Jul 2025 20:52:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: drop no-sdio
 property from mmc1
To: Conor Dooley <conor@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, William Qiu <william.qiu@starfivetech.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hal Feng <hal.feng@starfivetech.com>,
 Minda Chen <minda.chen@starfivetech.com>
References: <20250724075600.239522-1-e@freeshell.de>
 <20250724-equal-limb-2922f240961e@spud>
 <43c5908c-c478-4e00-b1e5-955296e4ec24@freeshell.de>
 <20250725-disorder-graceless-23c95454244d@spud>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20250725-disorder-graceless-23c95454244d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_205300_950843_35F70B91 
X-CRM114-Status: GOOD (  39.75  )
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

Adding CC: Hal Feng, Minda Chen

On 7/25/25 11:10, Conor Dooley wrote:
> On Thu, Jul 24, 2025 at 10:13:47PM -0700, E Shattow wrote:
>> On 7/24/25 09:51, Conor Dooley wrote:
>>> On Thu, Jul 24, 2025 at 12:55:53AM -0700, E Shattow wrote:
>>>> Drop no-sdio property avoids a delete-property on variant board dts
>>>> having an SDIO wireless module connected to mmc1.
>>>
>>> I'm struggling to understand why this change is correct.
>>>
>>> If there are specific boards that have wireless modules connected
>>> instead of using sdcards, how come the no-sdio property isn't moved to the
>>> the boards that do have sdcard slots?
>>
>> Why is 'no-sdio' property there to begin with...
>>
>>> The property was added for the visionfive 2, and only on mmc1, so should
>>> it be retained for boards that match the visionfive 2 in terms of how
>>> they use mmc?
>>
>> Ref.:
>> https://lore.kernel.org/lkml/20221207131731.1291517-4-william.qiu@starfivetech.com/
>>
>> My theory is VisionFive2 board hardware can support connecting up some
>> SDIO module there with ready-made available adapters, it may be possible
>> (if unusual) that would work? SDIO is 4-wide and some voltage
>> requirements, and a couple of GPIO, so I'm aware that's a stretch of a
>> statement but it could be done without soldering. I wouldn't expect it,
>> but why restrict this everywhere inheriting from jh7110-common.dtsi with
>> 'no-sdio' and then (needs testing!) if it doesn't matter one way or the
> 
> In case it was not clear, I am not questioning removing it from the
> common file, just that you're removing it entirely.
> 
>> other for VisionFive2 just drop it I think as being inaccurate/unnecessary?
>>
>> JH7110 CPU supports two interfaces of SDIO3.0/eMMC so it's not clear to
>> me if there's some reason for 'no-sdio' property to be there. Does
>> allowing SDIO (?) break eMMC and SD Card devices, is it destructive?
>>
>> Not knowing what 'no-sdio' does technically I dropped the property and
>> tested with the hardware I do have. The 'no-sdio' property
>> present/absent does not appear to do anything user-impactful on Pine64
>> Star64 that has SD Card slot on mmc1, and as would be expected on Milk-V
>> Mars CM Lite WiFi when there's an SDIO module at mmc1 it then fails to
>> initialize if 'no-sdio' property is present.
> 
> The original addition looks very intentional - however I didn't look at
> the commit message itself last night, just the diff. I wonder if "no-sdio"
> and "no-mmc" were just added because William intended to restrict SD
> cards since sdio1 is the SD card slot, rather than because the use of
> sdio or mmc commands during init would cause problems. The wording of "Set
> sdioo node to emmc and set sdio1 node to sd" is what makes me think
> that.
> 
>>> Could you add an explanation for why removing this entirely is the right
>>> thing to do, rather than only removing it for these variant boards?
>>
>> Yes, I can rephrase a bit like "relax no-sdio restriction on mmc1 for
>> jh7110 boards", or else reconsider the approach. I was going to approach
>> with `/delete-property/ no-sdio;` later elsewhere but after testing on
>> Pine64 Star64 with similar configuration to VisionFive2 mmc interfaces,
>> and knowing that Milk-V Mars CM Lite WiFi detects AP6256 SDIO peripheral
>> at mmc1 when this property is dropped (and with a few additional
>> things)... I prefer to reduce the problems that would need to be avoided.
> 
> I think using /delete-property/ would be unwise, properties shouldn't be
> in the common dtsi if they are not, in fact, common.
> 

Ack, you wanted these moved out into each board dts? That would be okay
with me. I suspected that `no-sdio` `no-mmc` don't belong so I'm still
in favor of dropping them overall. I think nothing will break but I want
more data from users.

>> I have done all the testing I can do with hardware I have. As-is it's
>> just like I wrote, we'll have to solicit some testing feedback on that
>> and wait to learn what this does for the other boards.
> 
> I'd kinda be inclined to apply this diff, with a better commit message,
> shortly after -rc1, unless someone comes forward with a justification
> for it being there on the vf2. I figure it's only in the common dtsi
> because it was not problematic until now cos noone tried to use the sdio
> aspect.
> 

I will revise the commit message v2 and send soon, just for dropping the
`no-sdio`...  and actively seek testing reports from users of all the
JH7110 boards to drop `no-sdio` and then also `no-mmc` properties for a
follow-up.

>> Aside, anyone want to chime in what is the utility of 'no-sdio'
>> property, how do you know from a schematic if it is appropriate, can it
>> be simply dropped as I suggest for JH7110 boards?
> 
> My (limited) understanding, mostly from looking at the caps in
> mmc/host.h because I find the binding description obtuse, is that these
> properties (no-sdio and no-mmc) block the use of commands that would
> cause a device to malfunction. They don't appear to be required at all just
> because the board layout doesn't support these types of devices.
> 
> Conor.

Hal and/or Minda (from StarFive) any comment about this? I would ask
William but they are not involved anymore. Can we drop some of these
suspicious mmc properties, what are the reasons for these?  -E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
