Return-Path: <SRS0=g6PI=EJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6336C388F2
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 18:28:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 580FA2071A
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 18:28:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mMHjDxVB"
Authentication-Results: mail.kernel.org; dmarc=permerror header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jfgtAloi61yjnKqA5J/OLDqLwqzVSTLvr3tloUUItMY=; b=mMHjDxVBcSti+jeOdZI17XEq8
	TGOZA7AzBrqzXfDR82CVStC6juIdNVCMtGpFEpAci/rNWfL0CNIrYkO0denJKtIwQvKPUtggvg2pt
	EJW7yqXos1IoORb+j8XCXu1suxEzxjNHU+abHEkZzHT4pf2MyS6lnPGidFTEq+SxWONdwcQnYA7tI
	zXFOQMA0R2hVnBi8Z6XwzVDAdWSCcDr4SYOBbgAP6gVEeuPMpPcP5e4C3h+RXYUxmT2NL1k/86Kax
	dUc/5cmi4nqwWT053CWwEO4yewgwyn1aq0v70CsjXcXohAAf88S1lDLV8fI8M0a4+ib53Ro7hfNRb
	ZvOCsgaSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ka12Z-000546-E0; Tue, 03 Nov 2020 18:28:19 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ka12W-00053B-Qr
 for linux-riscv@lists.infradead.org; Tue, 03 Nov 2020 18:28:18 +0000
Received: from cpc79921-stkp12-2-0-cust288.10-2.cable.virginm.net
 ([86.16.139.33] helo=[192.168.0.10])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1ka12T-00016Z-4a; Tue, 03 Nov 2020 18:28:13 +0000
Subject: Re: [RFC PATCH 2/3] RISC-V: Initial DTS for Microchip ICICLE board
To: Cyril.Jean@microchip.com, atishp@atishpatra.org
References: <20201028232759.1928479-1-atish.patra@wdc.com>
 <20201028232759.1928479-3-atish.patra@wdc.com>
 <41f1248b-78c6-bac1-410b-9e222368c5f6@codethink.co.uk>
 <CAOnJCUJhQ=Zv0S4iCK4CDzQr_dfkw3J6ycdM=p6=5B2_sL1Ekg@mail.gmail.com>
 <2d7cc829-5df6-6b94-4c8f-9bae6080444e@codethink.co.uk>
 <CAOnJCULejyF9xyLk5M0TXqW_=nn0KM5aE8nhK+1h0Xayd2pKUg@mail.gmail.com>
 <fbe404b5-3bb1-dd00-e558-e4a55960b767@microchip.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <fe079b4a-5410-5cc8-3f5e-8a95b573078a@codethink.co.uk>
Date: Tue, 3 Nov 2020 18:28:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <fbe404b5-3bb1-dd00-e558-e4a55960b767@microchip.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_132816_894367_3706B726 
X-CRM114-Status: GOOD (  18.01  )
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 Daire.McNamara@microchip.com, anup.patel@wdc.com, linux-kernel@vger.kernel.org,
 atish.patra@wdc.com, robh+dt@kernel.org, alistair.francis@wdc.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, linux-riscv@lists.infradead.org,
 Padmarao.Begari@microchip.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 03/11/2020 18:10, Cyril.Jean@microchip.com wrote:
> On 11/3/20 3:07 PM, Atish Patra wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On Fri, Oct 30, 2020 at 2:20 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:

,snip[

>>>> @Cyril : Can we enable both eMMC & sdcard at the same time ?
>>> I would put /both/ in but only enable the one in use for the moment.
>>> Our boards are booting of eMMC as supplied, so this isn't going to work
>>> as well. The eMMC is 8bit wide, and thus is only delivering 11MB/sec
>>> instead of 22MB/sec. This performance is still not great, but losing
>>> half the data-rate is just not good.
>>>
>> I am not sure what should be enabled by default. Updating sdcard is much
>> easier than eMMC card and we use that approach.
>>
>> @Cyril: Is there a way that we can enable both ?
>>
> Yes, we can enable both but this requires a modification to the FPGA
> design. One of the guys prototyped this while I was away. We will move
> this along. This will require reprogramming the FPGA with a new design
> and HSS version.
> 
> Regards,
> 
> Cyril.

I either missed or couldn't find a way of forcing the boot mode to be
from the SD slot. Have I missed something? At the moment we'd like to
have more storage available as the ~7G free on the eMMC is not enough.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
