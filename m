Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B1ECEACEF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 21:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XRQ8TIlN4d7x21+1aEzFfS/ZZH0Z6MGVWDZIjwTjhvU=; b=Jy7xGkD6bStnkG
	654aGD0982XA8WwFylZzc8/yoqdvaTi3ygWRzjE+x+M+yF6bJ7J9NAtkhfq4wYUmsEORtcK6y5zGB
	U3/QPECllM7rMhGpawtq3vj68sOqVk51NRg2/ccyJZcjjfFW7jnPRHbkstVk7XBvf6lx8CVQBj7hB
	IFD/vdrb8t89K+m+2wtU0Rp5vks8TQZ2qzzGkBeWyS22JosEPh6dg03iN68TDrCGCraXnY4KtGC7p
	FdHRDAcsIDpRGSv9NKJLkL4s3wbTHI99YzRJKQGsySbaRnN6yPksLWXHkRYsavGosqop48OtGZ4Um
	3GBC7REyQkCCqwg+tvRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7CP-0000000Gutg-1ZLL;
	Mon, 17 Nov 2025 21:55:49 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7CL-0000000Gusp-2SuY
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 21:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1763416502;
	bh=8MP+ohbjpzWqDDplARlqKxte/5mjGTVGQt7b/ZV67b8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ACnituW5RTw/m6wGLI4bMmm3px6/WXWT+mCv/T+4D9FMjDg0VE7r2AJ/8eGyOB+gZ
	 JPLWj33LO4H5Rxd7ZE41ex9AR5QfPOCWtKLeV9fZeHumT8aX3DD7JL365ni7tK45Ly
	 /1ktXtneNZByq62h8AQfziZcgmXiGAYhfRtj4+GwmB0/UzpZBT+WoA0Em0xH87Jrde
	 VSebe0Mr9pUpHNItrWDMc5HOK5w9LLn2VyVpbGQbz8tqy57bjC7vYxuMHwrKEHeGMg
	 Z9Fh4/Asabv5gdE26qjI+aUpppCOsfu6NsQT72BHigxwm7tr4ODS+FVz44BCxJRGhk
	 JzUSVQklqeQZQ==
Received: from [192.168.2.54] (unknown [98.97.26.103])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id D5163B2201A3;
	Mon, 17 Nov 2025 22:54:58 +0100 (CET)
Message-ID: <b33919e9-e100-4629-92cb-d1ec3dd756a7@freeshell.de>
Date: Mon, 17 Nov 2025 13:54:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] Add support for StarFive VisionFive 2 Lite board
To: Hal Feng <hal.feng@starfivetech.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Bjorn Helgaas <bhelgaas@google.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20251107095530.114775-1-hal.feng@starfivetech.com>
 <CAJM55Z_rczBo4D3HsC90QW1=fp3NWgK-tsEo6LHTZNXEBHTDqA@mail.gmail.com>
 <ZQ2PR01MB13076544E2136E7E7C2EEDA1E6CD2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <CAJM55Z9KyNK1n4i9FxbLor4HTQKqK8WKA2svjPVvKXihw_E+sg@mail.gmail.com>
 <4a55301a-ef7e-4b47-8151-621cfba36ddd@freeshell.de>
 <CAJM55Z-bRdNmnRZ7wi3PMOkzGYrxQEGk+7F67Pdu4WXwKmTjCQ@mail.gmail.com>
 <ZQ2PR01MB13075CDDEFC2F03C837E1B31E6C92@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <ZQ2PR01MB13075CDDEFC2F03C837E1B31E6C92@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_135546_153488_4C28D28D 
X-CRM114-Status: GOOD (  37.54  )
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



On 11/16/25 22:54, Hal Feng wrote:
>> On 16.11.25 00:29, Emil Renner Berthing wrote:
>> Quoting E Shattow (2025-11-13 16:16:12)
>>>
>>>
>>> On 11/13/25 02:42, Emil Renner Berthing wrote:
>>>> Quoting Hal Feng (2025-11-13 04:42:05)
>>>>>> On 12.11.25 21:54, Emil Renner Berthing wrote:
>>>>>> Quoting Hal Feng (2025-11-07 10:55:22)
>>>>>>> VisionFive 2 Lite is a mini SBC based on the StarFive JH7110S
>>>>>>> industrial SoC which can run at -40~85 degrees centigrade and up
>>>>>>> to 1.25GHz.
>>>> [...]
>>>>>> Currently the JH7110 device trees are layed out like this, with a
>>>>>> nice separation between the SoC description and board descriptions:
>>>>>>
>>>>>> jh7110.dtsi               # JH7110 SoC description
>>>>>> |- jh7110-common.dtsi     # Peripherals common to all JH7110 boards
>>>>>>    |- jh7110-starfive-visionfive-2.dtsi # Peripherals common to VF2
>> boards
>>>>>>    |  |- <VF2 boards>     # Final VF2 board descriptions
>>>>>>    |- jh7110-milkv-marscm.dtsi # Peripherals common to Mars CM
>> boards
>>>>>>    |  |- <Mars CM boards> # Final Mars CM board descriptions
>>>>>>    |- <other boards>      # Other JH7110 board descriptions
>>>>>>
>>>>>> With this series it moves to
>>>>>>
>>>>>> jh711x.dtsi
>>>>>> |- jh711x-common.dtsi
>>>>>>    |- jh7110-common.dtsi
>>>>>>    |  |- <jh7110 boards>
>>>>>>    |- jh7110s-common.dtsi
>>>>>>       |- <jh7110s boards>
>>>>>>
>>>>>> ..which I can't even give clear labels like above. In other words
>>>>>> when new patches are sent in it would not be easy to explain
>>>>>> exactly where each change should go and why.
>>>>>> I'm also worried that you'll find that more of the peripherals on
>>>>>> the JH7110S need special handling and a new jh7110s-... compatible
>>>>>> string. Then I guess they'll need to jump from jh7110x.dtsi two
>>>>>> levels down to jh7110{,s}- common.dtsi which then both describe SoC
>> and board properties.
>>>>>>
>>>>>> If you're serious about calling this a new SoC then I'd expect
>>>>>> something more like this:
>>>>>>
>>>>>> jh711x.dtsi                  # Peripherals common to both SoCs
>>>>>> |- jh7110.dtsi               # JH7110 SoC description
>>>>>> |  |- jh7110-common.dtsi     # Peripherals common to all JH7110 boards
>>>>>> |     |- jh7110-starfive-visionfive-2.dtsi # Peripherals common to VF2
>> boards
>>>>>> |     |  |- <VF2 boards>     # Final VF2 board descriptions
>>>>>> |     |- jh7110-milkv-marscm.dtsi # Peripherals common to Mars CM
>> boards
>>>>>> |     |  |- <Mars CM boards> # Final Mars CM board descriptions
>>>>>> |     |- <other boards>      # Other JH7110 board descriptions
>>>>>> |- jh7110s.dtsi              # JH7110S SoC description
>>>>>>    |- jh7110s-common.dtsi    # Peripherals common to all JH7110S
>> boards
>>>>>>       |- <JH7110S boards>    # Final JH7110S board descriptions
>>>>>>
>>>>>> I know this will mean some duplication in jh7110{,s}-common.dtsi,
>>>>>> but I would prefer that to not having a clear explanation of what each file
>> describes.
>>>>>>
>>>>>> Do you think this layout could work for you?
>>>>>
>>>>> Yeah, it is clearer for developers and maintainers.
>>>>>
>>>>> Considering Conor's suggestion, what about:
>>>>>
>>>>> jh7110.dtsi               # JH7110 SoC description
>>>>> |- jh7110-common.dtsi     # Peripherals common to all JH7110 boards
>>>>>    |- jh7110-starfive-visionfive-2.dtsi # Peripherals common to VF2 boards
>>>>>    |  |- <VF2 boards>     # Final VF2 board descriptions
>>>>>    |- jh7110-milkv-marscm.dtsi # Peripherals common to Mars CM boards
>>>>>    |  |- <Mars CM boards> # Final Mars CM board descriptions
>>>>>    |- <other boards>      # Other JH7110 board descriptions
>>>>> |- <JH7110S boards>
>>>>>
>>>
>>> JH-7110 and JH-7110I reference docs are listed (not any JH-7110S) at:
>>> https://doc-en.rvspace.org/Doc_Center/datasheet_0.html
>>>
>>> Does the JH-7110I use the OPP table for JH-7110 or JH-7110S?
>>>
>>>>> Move the opp table from jh7110.dtsi to jh7110-common.dtsi.
>>>>> Remove jh7110s-common.dtsi, because only one board uses JH7110S
>> now.
>>>>
>>>> This patchset adds 2 different boards. Has this changed?
>>>>
>>>> Also this would mean that you're not using the starfive,jh7110s
>>>> compatible or any other starfive,jh7110s-.. compatible strings, so
>>>> effectively you're not treating it as a new chip, but just a board that needs a
>> different opp table.
>>>>
>>>> I see now that the opp table is effectively the only difference
>>>> between the two chips in this patchset, so if that's closer to
>>>> reality then what you suggest is fine with me.
>>>>
>>>> /Emil
>>>
>>> Are we now re-visiting Hal's suggestion then (during code review for
>>> Milk-V Mars CM and Mars CM Lite) to split out the OPP tables and make
>>> them per-board, as before introduction of the StarFive VisionFive 2
>>> Lite
>>> board(s) ?
>>>
>>> Can we then do as from where we are now before this series:
>>>
>>> - Move "the JH-7110" OPP table into jh7110-common-opp-1500.dtsi
>>>
>>> - Each board jh7110-{deepcomputing,milkv,pine64,starfive}*.dts
>>> includes said OPP dtsi file.
>>>
>>> and for this series:
>>>
>>> - Drop the adding of a new compatible
>>>
>>> - Add "the JH-7110S" OPP table into jh7110-common-opp-1250.dtsi
>>>
>>> - Use existing jh7110-* prefix for "JH-7110S" board dtsi and dts,
>>> include jh7110-common.dtsi as usual, and include
>>> jh7110-common-opp-1250.dtsi
>>>
>>> The exact filename pattern for the OPP tables I suggest here are
>>> approximations, however that idea is my suggestion if we're just doing
>>> a breakout of the tables and not a new compatible.
>>>
>>> I am positive on having the 1250MHz OPP tables split out into dtsi
>>> instead of stuffing them into the VisionFive 2 Lite common dtsi.
>>> That's all it is?
>>
>> I think this suggestion makes sense if we're 100% sure the JH7110 and
>> JH7110S will only ever differ by the opp table. If there is any chance we'll need
>> to add different compatible string for some peripheral then I think Hal's
>> suggestion will be easier untangle. We'll even be able to do it without touching
>> all the board dts files once again.
>>
>> I'm interested to hear Hal's opinion on this. Hopefully they'll have more details
>> on the two version of the JH7110.
> 
> Here are the differences between JH7110 and JH7110S: 
> JH7110 supports 0~70 degrees centigrade and up to 1.5GHz.
> JH7110S supports -40~85 degrees centigrade and up to 1.25GHz.
> 
> I prefer to keep "starfive,jh7110s" compatible, because "JH7110S" is the chip name
> in StarFive documents and the name printed on the chip. It is easier for the users to
> know which chip they are using and select the correct device tree.
> 
> And patch [1] and [2] had accepted the "starfive,jh7110s" compatible.
> [1] https://lore.kernel.org/all/jurnfpufll4twv2hfp2dv6qk6d3gr7gfmek5czigb5bcon636q@opb6hrdb424p/
> [2] https://lore.kernel.org/all/CAAhSdy2Jr+EoW9AZooRDa12Kx9MSSaBaDXbJUoVym1qTt3r0-Q@mail.gmail.com/
> 
> Best regards,
> Hal

Hal,

OpenSBI development can accept a revert for that 1-liner of code if
needed, and anyways that new compatible was not tagged in any release
yet while also being moot because if you do use it somewhere else and
OpenSBI keeps this around it has no effect on upstream Linux using the
compatible for JH7110.

Devicetree in Linux describes hardware not related to the feelings of
customers so that should not be a concern here.

The data given for JH7110 and JH7110S does not make sense from what can
be found in published technical documentation. The technical
documentation is however lacking a chart for JH7110 from which to derive
any useful comment here.

All,

I repeat that the suggestion was made months ago (by Hal) to split out
the OPP tables per-board from the period of time when I was complaining
about 1.5GHz JH-7110 operation pushing TDP into over-temperature thermal
limit on Milk-V Mars CM SoM.

Whether or not JH7110S is a new compatible should follow precedence in
Linux development. JH-7110S is evidently the same tape-out as JH-7110
and however you deal with that in Linux is the appropriate way to deal
with that here. Selection of OPP table for correct operation will be
determined by bootloader, where, it is demonstrated by patch series sent
to U-Boot upstream to be selected ** per-board ** based on EEPROM
content as if it was any other JH-7110 board deciding dts based on
EEPROM content. Given that it is the same tape-out I do not find a valid
justification for a new compatible in the stack of adjacent software
besides going along with some kind of marketing-driven answer about
whether or not this is a new SoC.

What I care about now is that the VisionFive 2 Lite series is in good
enough shape and there's a possibility to act on this months-old
suggestion to split out the OPP tables which as we have confirmed the
JH7110S is the same SoC as JH7110 it makes a lot of sense to do.

How is it supposed to work for binned silicon in Linux?

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
