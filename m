Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1E8C7EE23
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 03:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s6g8kx8iUJqvwy3L/84Vi+RHTYkGRbw4wwIHdN5+vfs=; b=iHRJEbozSrbBaM
	2iBtnHmmfsNpvrs2jrqp3VIQT/yQLnMmqQNKGMkNxod2u3k6ANmFweifKUMnIQrkkWjOJklADbnBa
	sCFfzvo/bHztu1IvR2bqCsIjaGYWPDYQ6cGP8tIf0om9kS4vU+leSKjOpS5qKCTUmm+NuO681aZqP
	5haMidD20x/X/R8Onv863YK/7mE6CQHf90CCISBYqcU+mCGstpstepmv5aqqFAU4EVIWvwr0/RH37
	FnFhjOpkoPaotggTiuHDtSRx8bklS7GJaYhR9UzZJOvWWdpGbIgmQas/RRIpa+Eviyh4W/o9Hw0SZ
	wOzN4lwhc2K9J2ONn8vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXDLH-00F2OK-2w; Wed, 01 Mar 2023 03:41:23 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXDLC-00F2Kc-7z
	for linux-riscv@lists.infradead.org; Wed, 01 Mar 2023 03:41:21 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id E511C24E21E;
	Wed,  1 Mar 2023 11:40:41 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 1 Mar
 2023 11:40:41 +0800
Received: from [192.168.125.128] (113.72.145.171) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 1 Mar
 2023 11:40:40 +0800
Message-ID: <8b070b58-a031-5ff5-ea69-08bb750442cb@starfivetech.com>
Date: Wed, 1 Mar 2023 11:40:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/2] drivers: watchdog: Add StarFive Watchdog driver
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Guenter Roeck
	<linux@roeck-us.net>, Conor Dooley <conor.dooley@microchip.com>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Samin Guo <samin.guo@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, Conor Dooley <conor@kernel.org>
References: <20230220081926.267695-1-xingyu.wu@starfivetech.com>
 <20230220081926.267695-3-xingyu.wu@starfivetech.com>
 <CAJM55Z823iqUqD8enM0qJ_MA3Tw94Mn0mq71fbLT1Qjo2s2J3g@mail.gmail.com>
 <0ffb02d2-0bbd-fd0d-b0f6-cb5605570050@starfivetech.com>
 <CAJM55Z_hRpUYueZ-XuWUx1NfAsL9E+-4ry9TYeRWM_bKXvym-g@mail.gmail.com>
 <Y/3coFvMWOLaaY9p@wendy> <545c23f3-1d68-2bff-89d9-584e3ca31044@linaro.org>
 <Y/3hVlp/YPnWHDCX@wendy>
 <f9e380f6-334f-11fa-1118-8d6c3c9befaf@starfivetech.com>
 <d2aada79-61c4-0cc7-7b09-058564ed9fce@roeck-us.net>
 <CAJM55Z9G5omehjgDJncPmN6n7zUCVwrMuqDKLXCDs95LtN66MA@mail.gmail.com>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <CAJM55Z9G5omehjgDJncPmN6n7zUCVwrMuqDKLXCDs95LtN66MA@mail.gmail.com>
X-Originating-IP: [113.72.145.171]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_194118_641120_02FAD093 
X-CRM114-Status: GOOD (  20.99  )
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

On 2023/2/28 23:32, Emil Renner Berthing wrote:
> On Tue, 28 Feb 2023 at 16:10, Guenter Roeck <linux@roeck-us.net> wrote:
>> On 2/28/23 05:16, Xingyu Wu wrote:
>> > On 2023/2/28 19:11, Conor Dooley wrote:
>> >> On Tue, Feb 28, 2023 at 11:57:58AM +0100, Krzysztof Kozlowski wrote:
>> >>> On 28/02/2023 11:51, Conor Dooley wrote:
>> >>>> On Tue, Feb 28, 2023 at 11:36:49AM +0100, Emil Renner Berthing wrote:
>> >>>>> On Tue, 28 Feb 2023 at 10:44, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>> >>>>>> On 2023/2/26 22:14, Emil Renner Berthing wrote:
>> >>>>>>> On Mon, 20 Feb 2023 at 09:21, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>> >>>>
>> >>>>>> So the dt-bingdings need to rename, and which one could be better,
>> >>>>>> 'starfive,jh71x0-wdt.yaml' or 'starfive,jh-wdt.yaml'?
>> >>>>>
>> >>>>> Sure, starfive,jh71x0-wdt.yaml sounds good to me.
>> >>>>
>> >>>> I feel like a common comment I see from the dt folks is to not put
>> >>>> wildcards in filenames & just pick the first compatible.
>> >>>> I could very well be wrong on that front though...
>> >>>
>> >>> First compatible is a bit better, unless you are sure this will cover
>> >>> all such compatibles now and in the future. For many bindings the
>> >>> family/wildcards were fine in filename.
>> >>
>> >> Ahh cool, good to know what the specific policy is - thanks!
>> >
>> > If this watchdog driver is improved to also support JH7100 in next patch,
>> > it seems more reasonable to rename the dt-bingdings to 'starfive,jh71x0-wdt.yaml'.
>>
>>
>> Up to the devicetree maintainers to decide, but I for my part never accept
>> wildcards in file names. You can not guarantee that all of jh71[0-9]0 will
>> be supported by this set of bindings. On top of that, when / if you add
>> support for anything outside that range (say, jh7200 or jh8100 or jh7101
>> or whatever) you'd have an even worse problem. Are you then going to suggest
>> renaming the file to jhxxxx-wdt ? Or one digit at a time ?
> 
> Makes sense to me, in which case this should be called
> starfive,jh7100-wdt since that's the first SoC to feature this
> watchdog and will hopefully be supported in the next version of this
> patchset.
> 

Thanks for your suggestions. I will use starfive,jh7100-wdt and improve this
driver to support 7100 in the next patchset.

Best regards,
Xingyu Wu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
