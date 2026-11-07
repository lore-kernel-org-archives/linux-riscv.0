Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4DD606A32D
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 14:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lpq0bkVe;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=eoFXYN0Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=N8lJhYzrio5vwwI+uk+PMG0MB5yvQxnXa5oRs3gfrA0=; b=lpq0bkVepb42nXFmwUdLi7IGlx
	pGC/g96lfo54d7eK5ypMtcaAOpCW4Bv5IuTMe9DxwUoppUCnUJpDhuSnNE1HJ3zUlTXRxKHIbVcni
	YzVTrVZbf9mPQZML7xY2EW9S+NA93/eqL42ppLuuHuqjKlhZzPOKetq953XfJ5nFG4HyQAhMx++le
	WpsYKouY+EF2XHJM2kB/ZC1YjsleX32wipETctsDfKZtaW/SMI+oc/YYK+YnDUw0fUaVmdrrZULSs
	52f+fsm/VGy0vBfNRB3B4fwJep6GFeRt3P/4JCCnk2i+o5uAdaWRJuLzzG0XkwkTVLeqzZGOAbj+W
	eJnhwmdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPh3X-0000000Emp5-2x7w;
	Sat, 07 Nov 2026 14:06:07 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPh3U-0000000Emoe-2e3v
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 14:06:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1794060344;
	bh=37JzzP5fNzIUh/YU3t2M86Gp4vaqjCgfVRMIoUNIwJI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eoFXYN0Y++/qdFYJkfB53JqRJcdyYNIw4017Vx3FuuYGYC7geVZtZq/wPNdLRLPde
	 RBcZVgGBgHoX/bDTEpCciovjbWadXCMQo1SusxvKDO4BM2FuRABIxBpxX6cs6UnZSb
	 GDVLS7XbxBqssjB61mKay3bFcixK7YB8HM2XFMI6mWVw/rhqxEIMsxe0H2Gsb6KYsn
	 zBhA6L8O8uvZ+wQ6Ijss/DqhqXObGwRjL5NMxYSR3w8LSKXY1vknfui0QdGVfS5d+0
	 V0ukUev+0HTyy/I+9u7G7xQku0cmnkoeqTRHzeJphzrQS2dCVatKNWT3GO9rBDBWJV
	 kiLHNge1jD5nw==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 922C3B2218C0;
	Sat,  7 Nov 2026 15:05:41 +0100 (CET)
Message-ID: <7f285558-2301-46aa-a4bc-c6ddb25cf20c@freeshell.de>
Date: Sat, 7 Nov 2026 06:05:40 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: keep the status
 power LED on
To: Conor Dooley <conor@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Owen O'Hehir
 <oo.hehir@gmail.com>, Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261106184055.3891621-1-oo.hehir@gmail.com>
 <179399127414.1902073.729566010968054971.b4-ty@microchip.com>
 <181fdcd8-80ff-4486-ab16-9cbce16b0a29@freeshell.de>
 <20261106-tumble-hurt-d1a0be3fddae@spud>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20261106-tumble-hurt-d1a0be3fddae@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_060605_131739_69501185 
X-CRM114-Status: GOOD (  24.07  )
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
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Conor,

On 11/6/26 13:15, Conor Dooley wrote:
> On Fri, Nov 06, 2026 at 11:06:22AM -0800, E Shattow wrote:
>> Hi Conor,
>>
>> On 11/6/26 10:54, Conor Dooley wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> On Fri, 06 Nov 2026 18:40:55 +0000, Owen O'Hehir wrote:
>>>> The firmware turns the status power LED on, but the node has no
>>>> default-state, so the LED switches off when leds-gpio probes and the
>>>> board looks powered down.
>>>>
>>>> Default the LED to on.
>>>>
>>>> Tested on a VisionFive 2 v1.3B.
>>>>
>>>> [...]
>>>
>>> Applied to riscv-dt-fixes, thanks!
>>>
>>> [1/1] riscv: dts: starfive: jh7110-common: keep the status power LED on
>>>       https://git.kernel.org/conor/c/68dbe2550bd4
>>>
>>> Thanks,
>>> Conor.
>>
>> I replied this a moment earlier:
>> https://lore.kernel.org/lkml/179fe9e8-322b-4745-8734-d5de5f1e8487@freeshell.de/
>>
>> This disagrees with VisionFive 2 Lite schematic; if when this node is
>> consumed by a bootloader it will be evident we are not describing the
>> hardware correctly, no?
> 
> I am not sure if that's actually relevant though? If the visionfive2lite
> needs this gpio then it shouldn't be listed in a leds node. Changing the
> default status of it doesn't affect the fact that it is wrong to begin
> with, wrong before the patch and wrong afterwards. If there are some
> boards that include this common.dtsi but don't have these leds, they're
> not common and should be moved to the relevant dts files. If you know
> what those are, please send a patch doing the move.

All JH-7110 boards with published schematics have this configurable LED.
Some board(s) have this same RGPIO also connected to an input jumper for
fastboot selection. Some board(s) have an additional power LED that is
not configurable and so not represented in device tree.

> 
>> If you want the light on and it wasn't on at reset or due to boot ROM,
>> then that is userland stuff and not hardware description... but that is
>> your decision to make as maintainer.
> 
> It's a power status led, I think it's pretty reasonable for it to
> actually represent power status without intervention in userspace, the
> alternative I guess could be something like setting the function
> property to "power" - but I'm not sure if that does anything for
> gpio-leds.

Sure, if this is updated as a per-board user-LED function property by
reference to published hardware description (silkscreen or published
schematics) then that's at least verifiable; Vendor firmware that
showcases as heartbeat or whatever less convincingly-so.

Debian users should be reminded that these LED functions are compiled as
modules for Debian kernel config and so the setting of property to
"power" or "heartbeat" e.g. is further dependent on whether the initrd
was generated with including those modules. The LED function mode (or
lack thereof) from passed fdt structure can be set with an override on
the corresponding kernel command line argument.

> 
> Cheers,
> Conor.

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
