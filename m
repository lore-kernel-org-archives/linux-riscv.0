Return-Path: <SRS0=/4Ev=SD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8946CC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Apr 2019 16:36:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DF6320883
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Apr 2019 16:36:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cl8cAyDj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DF6320883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yBonj9rhJSfdjFaEJt3nuGKTBG9YllXrMXd6vENnhz4=; b=cl8cAyDjjqt+kc
	XYV3vjOOwU0FB3SbTX1C8gbq2RfpdNUK84W9euzp9Olr61nW3/AbyTMsD8QMwVZqSP7ApqI43EN1p
	HUTvd8nQ1UsapJecrVs2561tvJOwdRJvkiYdHXJ0eNArDBj9U0p5fklBIqyMcqvPstgiTJN0HvCip
	unzxnUMmO7rrlrhgmqW4hkDLC6cn9s+Q4+3S405e9vrExMUlhrTOZkmWShB6ElITngeqb/TiMXMi2
	C55oGqaO4KZO8iMuksmcdqbc1+cSBkJt1bdtC+nD+Oc6gHx3g/CXXrz8I9zhA7wmT58zIm0vvZzSf
	6FXPAIz/7Oo9TopCn5Eg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAzus-0002A4-KY; Mon, 01 Apr 2019 16:36:10 +0000
Received: from foss.arm.com ([217.140.101.70])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAzuq-00025F-HS
 for linux-riscv@lists.infradead.org; Mon, 01 Apr 2019 16:36:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3C1CA78;
 Mon,  1 Apr 2019 09:36:04 -0700 (PDT)
Received: from [10.1.196.105] (eglon.cambridge.arm.com [10.1.196.105])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DDDB83F690;
 Mon,  1 Apr 2019 09:36:02 -0700 (PDT)
Subject: Re: [PATCH 1/2] edac: sifive: Add DT documentation for SiFive L2
 cache Controller
To: Rob Herring <robh@kernel.org>
References: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
 <1552382461-13051-2-git-send-email-yash.shah@sifive.com>
 <20190328131657.GA9056@bogus> <be7246a0-2426-995d-0a24-f104c173d752@arm.com>
 <CAL_Jsq+s77J=Bwiyow2d7Q=e+z+5d64i_cL6xaYn0xdvJDb4Vg@mail.gmail.com>
From: James Morse <james.morse@arm.com>
Message-ID: <8e574cfa-29d9-0f0a-d670-c4869bd262c4@arm.com>
Date: Mon, 1 Apr 2019 17:36:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+s77J=Bwiyow2d7Q=e+z+5d64i_cL6xaYn0xdvJDb4Vg@mail.gmail.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_093608_586780_13F6AA6B 
X-CRM114-Status: GOOD (  22.33  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yash Shah <yash.shah@sifive.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Rob,

On 29/03/2019 14:11, Rob Herring wrote:
> On Thu, Mar 28, 2019 at 1:47 PM James Morse <james.morse@arm.com> wrote:
>> On 28/03/2019 13:16, Rob Herring wrote:
>>> On Tue, Mar 12, 2019 at 02:51:00PM +0530, Yash Shah wrote:
>>>> DT documentation for L2 cache controller added.

>>>> diff --git a/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt b/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt
>>>> new file mode 100644
>>>> index 0000000..abce09f
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt
>>>> @@ -0,0 +1,31 @@
>>>> +SiFive L2 Cache EDAC driver device tree bindings
>>>> +-------------------------------------------------
>>>> +This driver uses the EDAC framework to report L2 cache controller ECC errors.
>>>
>>> Bindings are for h/w blocks, not drivers. (And Boris may want a single
>>> driver, but bindings should reflect the h/w, not what Linux (currently)
>>> wants.
>>
>> For h/w block compatibles and edac, I think all we need now is to ensure the DT contains
>> the three compatible strings: platform (if there is one), soc and ip-name (if its a
>> re-usable thing).
>> This is so that linux can pick the biggest of the three (usually platform) to probe the
>> driver from, as this lets us capture platform properties we only find out about later.
> 
> DT is not the only what to instantiate drivers. If the OS really wants
> to have a single driver for multiple h/w blocks, then it needs to
> instantiate a driver itself (based on the top-level compatible
> probably) and then that driver can find the DT nodes it needs itself.

I think this is where we are heading. (but I need to get my head round this top-level thing).

Can the OS do both, depending on the platform?
e.g. on a system with one component the driver runs 'standalone', whereas on a bigger
system with multiple components the same driver is used as a library by something else.

I don't see how this would work if the common component's DT entry looks the same on both
platforms. Wouldn't this depend on the order stuff is done in, or 'but not this one'
checks in the driver?


> In any case, it's all irrelevant to the DT binding. We don't design
> bindings around what some particular OS wants.

I agree.

What we want to do is spot the problems on the horizon so we either have the right
information in the DT today, or at least know what it looks like so we don't cause a
regression when a new platform makes previous behaviour generic/a-library.


Thanks,

James

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
