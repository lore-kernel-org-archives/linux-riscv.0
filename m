Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90105C531D0
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 07:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lJlobDzdCMeCH7PSUnmspJEH5wmkPU51FDItxayT+aw=; b=hS4/smeuEM1r9V
	Xts/F20I3TJRsC+EqumLXnKq3hBje9loE0FGrd9RDrwdK1mLCHvAXwmohCgDz6Q9cUOGsBOb4/awO
	VSPXWVatCLP9O8N3RpIn0PMjc6P4CNMTymVBlaNMQUNn/BXDza1+m/f/1zq3lwburLpS3hck1WDRd
	yv+SnuAMrdC6e6MQVdhkJxJzlHDA/4uvQTKs/fyG2OkTwa+dl+OmKBeIGd0MHe39qRaKRp40V6imU
	6r3Y/q/9HQjx1HoF2JOr+FYvYQ10AWptVaov9reKBuKGes8h841p0Mc/JlpNM4Q2o/O7wrlLr66Mb
	MMKtvKPfOn1PvuYgOR6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFiX-000000027Bi-3rZd;
	Mon, 27 Jul 2026 07:25:41 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFiU-000000027B1-0Weg
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jul 2026 07:25:40 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785137135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hrajy83uZbAEZ4QXrdneOBkHt4WwSHMSLCICN+iSQXA=;
	b=fi90h6msLZL7tSozgaiuR1Ijvk7duvQC8bR42WDPPplaECbDFvk4gHk1r29dC5ZTqXL+46
	+cyULThIQsp41/GbfUkRxxbXkLgchGfexbfb5EVb+KewWpocx4ruS606a5g+UoEWgikZC6
	F+JEFZ+c3Nw7+20SyXYqKVAqwzObms0=
Date: Mon, 27 Jul 2026 00:25:28 -0700
Message-Id: <DK96ARC1DRG7.185G42UPDTMCY@linux.dev>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: vendor-prefixes: Add Sensylink
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Troy Mitchell" <troy.mitchell@linux.dev>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Guenter Roeck" <linux@roeck-us.net>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>
In-Reply-To: <20260722-devious-seventh-9859bb3741b3@spud>
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
	<20260721-ctl2301-v2-1-ef5fb342872a@linux.dev>
	<20260721-dill-dab-df15585090d2@spud>
	<673be23a-2a84-43b7-9be7-a661cf0e7935@roeck-us.net>
	<20260722-devious-seventh-9859bb3741b3@spud>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_002538_370339_94429E98 
X-CRM114-Status: GOOD (  15.30  )
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

> On Tue, Jul 21, 2026 at 10:56:36AM -0700, Guenter Roeck wrote:
>> On 7/21/26 08:49, Conor Dooley wrote:
>>> On Tue, Jul 21, 2026 at 02:48:27AM -0700, Troy Mitchell wrote:
>>>> Add the vendor prefix for Sensylink Microelectronics.
>>>>
>>>> [...]
>>>>
>>>> +  "^sensylink,.*":
>>>> +    description: Sensylink Microelectronics Technology Co., Ltd.
>>>
>>> Googling the company to see what their website is, I seem to see a
>>> different name for the company: Shanghai Sensylink Microelectronics Inc.
>>> Their website has that with the Shanghai dropped.
>>>
>>> Also, probably the commit message should contain
>>> Link: https://en.sensylink.com/
>>
>> Asking Google search: "Why the two names ? Did they rename themselves at
>> some point ?"
>
> The google search "AI" response was what showed me the different name,
> sounds like I should have questioned it some more!
>
>> [...]
>>
>> I don't know if Linux has a policy about Legal vs. Marketing names.
>> Personally I don't have an opinion. Your call, really.
>
> I don't know what the policy is, or if there is one, but personally I
> wouldn't use the westernised abbreviation since they may decide to rebrand
> that etc and the vendor prefix information should remain static.
>
> So this is probably fine as-is, just I'd like to see that link added to
> their website.

Understood. I will keep the current vendor name and add the following link
to the commit message in the next version:

  Link: https://en.sensylink.com/

                                            - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
