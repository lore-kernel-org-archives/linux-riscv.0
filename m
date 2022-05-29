Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B40C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 29 May 2022 15:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AnG55O+2DBTQzBTM4A8gHV19nMrBf1PyDhI0YpR/RVk=; b=yn6QM5dyJXql+y
	OAM15k3Xx2TwaAvMgHxW+TeM+7sq7ILc6slm9EaEQez7ohbuvIU2udTDVeIcn+lR8+HZeJe4GRwHW
	gewiRIPZaQsJueVWCcpDUgXK/myLT5BrfqDati5HG15WCba/JAtAZmC7tdsE5Wjs6omWg7f3dp2DB
	suqLIk0W3NfwklP3Fbp49Zy+bhaDzM2zBj8V9lyBs7/8W2rG8jqIEbNlXJrU+l0KqMupixu+fdnOJ
	DYI3Y+jxAAjBFDfivaBVFFs5rNwPLAi5pscMjTIyCR6LvX6B/Cn+EDoPbL3uefZWYmCR1xx/rP4s+
	O/AA1EFFnsQUwgf2A2Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvLHh-004DWF-9u; Sun, 29 May 2022 15:56:53 +0000
Received: from imap3.hz.codethink.co.uk ([176.9.8.87])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvLHe-004DUy-Ke
	for linux-riscv@lists.infradead.org; Sun, 29 May 2022 15:56:52 +0000
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net ([86.15.83.122] helo=[192.168.0.17])
	by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1nvLHZ-0005f7-KS; Sun, 29 May 2022 16:56:45 +0100
Message-ID: <ddc1462c-be74-420a-6809-c868fa056fa7@codethink.co.uk>
Date: Sun, 29 May 2022 16:56:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
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
 <3acd20b2-5882-7cc0-8a7b-7b406b768c1c@codethink.co.uk>
 <alpine.DEB.2.21.2205020049130.9383@angie.orcam.me.uk>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <alpine.DEB.2.21.2205020049130.9383@angie.orcam.me.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220529_085650_723363_3F2C861F 
X-CRM114-Status: GOOD (  13.24  )
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

On 02/05/2022 12:46, Maciej W. Rozycki wrote:
> Hi Ben,
> 
>>>    Any idea what might be causing it?  I can't see it being explicitly set
>>> or cleared anywhere, be it in U-Boot or Linux, so it must be done by the
>>> device itself depending on something.  And the lack of this capability
>>> seems to me like non-compliance for a multiple-lane, multiple-speed
>>> device.
>>
>> I'll see if we can reproduce this
> 
>   Have you been able to look into it?
> 

I can't see anything obvious from the code, however my SD card image
does not have lspci on it and I have not had time to make a new image
to test.

I wonder if anyone at SiFive can comment on this?

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
