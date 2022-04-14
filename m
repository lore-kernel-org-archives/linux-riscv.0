Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23DDC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Apr 2022 07:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x82yzyS9HkI5lgnRSoQcpGJlp539y+YpamGmUFcULg8=; b=JXuMAxwV/xNF+p
	AQGHmub9G3iaYBzuaBbO8Zl4I0pg3qZiybqmfzpTjaVx0LF5dyKWWevfAlZqq79yLVnxsUILcufLp
	yfgBtI2ZXKuIFCeK/9nQ/+1+/XUuZbQthTbvAdWwEpo7S1v+BHMyxn1Q2Z8i6JeJoQkyNzaAxBdK6
	rhEb4HO0vKORJN6jXigRgvrQLUEy5PhhDdcK7JmFtpwMenICgkTB78NV4U+f+sBt8FOAIwoJ11Is8
	f7JIwaJGkdjAYI8ruQWB2zTn71KND3z25FOBUkhzOuTgu4h2fPqkSDzoO7kRtT9nUA6UAx7W5oqZV
	rWQv/6Pzm6aXOOYujmCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1netdP-004GzM-Pk; Thu, 14 Apr 2022 07:11:19 +0000
Received: from imap3.hz.codethink.co.uk ([176.9.8.87])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1netdF-004Grz-RX
 for linux-riscv@lists.infradead.org; Thu, 14 Apr 2022 07:11:11 +0000
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=[192.168.0.21])
 by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1netd6-0005jh-I9; Thu, 14 Apr 2022 08:11:00 +0100
Message-ID: <3acd20b2-5882-7cc0-8a7b-7b406b768c1c@codethink.co.uk>
Date: Thu, 14 Apr 2022 08:11:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [V3] PCI: fu740: Drop to 2.5GT/s to fix initial device probing on
 some boards
Content-Language: en-GB
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Alexandre Ghiti <alex@ghiti.fr>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Bjorn Helgaas <bhelgaas@google.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Rob Herring <robh@kernel.org>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>, Greentime Hu <greentime.hu@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 Neill Whillans <neill.whillans@codethink.co.uk>
References: <20220318152430.526320-1-ben.dooks@codethink.co.uk>
 <2442936e-a53e-59bf-488f-95eac26d1252@ghiti.fr>
 <85e864fd-762e-0780-f829-bfbb178ab24e@ghiti.fr>
 <bded4b1e-3404-6bcd-3289-dc8d5b4d713a@codethink.co.uk>
 <alpine.DEB.2.21.2204140048460.9383@angie.orcam.me.uk>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <alpine.DEB.2.21.2204140048460.9383@angie.orcam.me.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_001109_948213_02E390B4 
X-CRM114-Status: GOOD (  16.36  )
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

On 14/04/2022 01:10, Maciej W. Rozycki wrote:
> On Wed, 23 Mar 2022, Ben Dooks wrote:
> 
>>> FWIW, I have tested this and it solved my issue with nvme not being probed,
>>> so:
>>>
>>> Tested-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
>>
>> Ok, great. Our test rig seems to be still working with this.
> 
>   I ran simple verification of your change by interrupting U-Boot after a
> power-up and issuing:
> 
> => setenv boot_pci_enum true
> 
> at the command prompt before booting from the uSD card and curiously
> enough the root port comes up with the Link Capabilities Register
> reporting the lack of Link Bandwidth Notification Capability in this
> scenario, while it reports its presence if booted undisturbed, i.e.:
> 
> 		LnkCap: Port #0, Speed 8GT/s, Width x8, ASPM L0s L1, Exit Latency L0s <4us, L1 <4us
> 			ClockPM- Surprise- LLActRep+ BwNot- ASPMOptComp+
> 
> vs:
> 
> 		LnkCap: Port #0, Speed 8GT/s, Width x8, ASPM L0s L1, Exit Latency L0s <4us, L1 <4us
> 			ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
> 
> It is fully reproducible.
> 
>   Any idea what might be causing it?  I can't see it being explicitly set
> or cleared anywhere, be it in U-Boot or Linux, so it must be done by the
> device itself depending on something.  And the lack of this capability
> seems to me like non-compliance for a multiple-lane, multiple-speed
> device.

I'll see if we can reproduce this


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
