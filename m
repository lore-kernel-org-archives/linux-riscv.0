Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB73C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 02:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/BZhSECfs1xL8iz5/H0MedzdSf2V2MDBrseycfSIUrw=; b=tOrYQy8AxePwgd
	Uzco/sY1hGQSq8Q1DevhxNU3dhT/lRGWZVsOpCefUmUee0bvanmUCCtVNkkXmKTOSd5yGreE0Qo6K
	ztM5uQbRoXW5SjE8/x3rgCE3GG46BU1hWsIoFj8h6MmXtgWGAVnt7M1n6X7PogzJb0kfjc2rfoayR
	UdLgwHQgzBVqfcJvbWw1ayso3cAm5nmNsZu4mOtEO38GpGEICiM2mNED0oE7AuY622oSnB8vm32Cr
	14vaGsCxj2eF/0lbh5I15NiNeI3XOn+5zwNrE1T7CcM4RkZTDI6jjv1Bo/5lkl96ZzTHnr5ecgRx6
	F6dCVUOhRxEwcSRfiVMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2MfB-00D4XF-3D;
	Mon, 13 Nov 2023 02:26:58 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Mf7-00D4TS-1E
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 02:26:56 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 1C44F24E004;
	Mon, 13 Nov 2023 10:26:18 +0800 (CST)
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 13 Nov
 2023 10:26:17 +0800
Received: from [192.168.125.131] (113.72.144.54) by EXMBX161.cuchost.com
 (172.16.6.71) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 13 Nov
 2023 10:26:16 +0800
Message-ID: <f1d39129-c4ae-4264-a414-fd18f1d66e9f@starfivetech.com>
Date: Mon, 13 Nov 2023 10:19:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] clocksource: Add JH7110 timer driver
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Samuel Holland
	<samuel.holland@sifive.com>
CC: Thomas Gleixner <tglx@linutronix.de>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Walker Chen
	<walker.chen@starfivetech.com>, Samin Guo <samin.guo@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, Conor Dooley <conor@kernel.org>
References: <20231019053501.46899-1-xingyu.wu@starfivetech.com>
 <20231019053501.46899-3-xingyu.wu@starfivetech.com>
 <3f76f965-7c7b-109e-2ee0-3033e332e84b@linaro.org>
 <bb819333-52d3-49fc-9bb9-1a227bd5ca8f@starfivetech.com>
 <d0e70434-e273-4799-c5ec-bbee1b3f5cc7@linaro.org>
 <540136d4-6f8f-49a6-80ff-cc621f2f462b@starfivetech.com>
 <65c38717-3e0c-46d3-a124-29cae48f1a2e@linaro.org>
 <72ad5029-42b2-481a-887f-8f6079d8859b@starfivetech.com>
 <a8f0011c-5689-4071-b5e0-90bd6b7c66bc@linaro.org>
 <b402eb4d-a770-4988-8274-8a2544362229@starfivetech.com>
 <1dd3d765-c583-4db9-a0aa-303bfcf871db@linaro.org>
 <7c2e9b70-201c-45f8-9871-a823cc2ded16@starfivetech.com>
 <a37be8f7-64a4-4cec-8692-28ad92a02b00@sifive.com>
 <bbd2ee8d-4349-4752-859a-02fb0252d496@linaro.org>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <bbd2ee8d-4349-4752-859a-02fb0252d496@linaro.org>
X-Originating-IP: [113.72.144.54]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX161.cuchost.com
 (172.16.6.71)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_182653_731740_C5191E21 
X-CRM114-Status: GOOD (  24.18  )
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

On 2023/11/11 2:02, Daniel Lezcano wrote:
> 
> Hi Samuel,
> 
> On 10/11/2023 18:40, Samuel Holland wrote:
>> On 2023-11-08 11:51 PM, Xingyu Wu wrote:
>>> On 2023/11/8 17:10, Daniel Lezcano wrote:
>>>> On 08/11/2023 04:45, Xingyu Wu wrote:
>>>>> On 2023/11/2 22:29, Daniel Lezcano wrote:
>>>>
>>>> [ ... ]
>>>>
>>>>> Thanks. The riscv-timer has a clocksource with a higher rating but a
>>>>> clockevent with lower rating[1] than jh7110-timer. I tested the
>>>>> jh7110-timer as clockevent and flagged as one shot, which could do some
>>>>> of the works instead of riscv-timer. And the current_clockevent changed
>>>>> to jh7110-timer.
>>>>>
>>>>> Because the jh7110-timer works as clocksource with lower rating and only
>>>>> will be used as global timer at CPU idle time. Is it necessary to be
>>>>> registered as clocksource? If not, should it just be registered as
>>>>> clockevent?
>>>>
>>>> Yes, you can register the clockevent without the clocksource.
>>>>
>>>> You mentioned the JH7110 has a better rating than the CPU architected
>>>> timers. The rating is there to "choose" the best timer, so it is up to the
>>>> author of the driver check against which timers it compares on the
>>>> platform.
>>>>
>>>> Usually, CPU timers are the best.
>>>>
>>>> It is surprising the timer-riscv has a so low rating. You may double check
>>>> if jh7110 is really better. If it is the case, then implementing a
>>>> clockevent per cpu would make more sense, otherwise one clockevent as a
>>>> global timer is enough.
>>
>> The timer-riscv clockevent has a low rating because it requires a call to
>> firmware to set the timer, as well as a trap to firmware to handle the
>> interrupt, which both add overhead. Implementations which support the Sstc
>> extension[1] do not require firmware assistance to implement the clockevent, so
>> in that case we register the clockevent with a higher rating.
>>
>> [1]: https://github.com/riscv/riscv-time-compare
> 
> Thanks for the pointer and the clarification.
> 
>>>> Unused clocksource, clockevents should be stopped in case the firmware let
>>>> them in a undetermined state.
>>>
>>> The interrupts of jh7110-timer each channel are global interrupts like
>>> SPI(Shared Peripheral Interrupt) not PPI (Private Peripheral Interrupt). They
>>> are up to PLIC to select which core to respond to. So it is hard to implement
>>> a clockevent per cpu core. I tested this with request_percpu_irq() and it
>>> failed.
>>
>> You cannot use request_percpu_irq(), but the driver should be able to set the
>> affinity of each IRQ to a separate CPU.
> 
> Absolutely. And given the bad rating of the local timers, it may be worth to implement this driver in a per CPU (affinity set) basis.
> 
> At the first glance, the arm_global_timer can be used as an example.
> 
> Note in this case, you may want to double check what does with an idle state with a local timer stop flag and this timer which is always on.
> 
> 
> 

Hi Daniel and Samuel,

Thanks for your pointers. I will check it. If it works, I will send the new version of this patch.

Best regards,
Xingyu Wu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
