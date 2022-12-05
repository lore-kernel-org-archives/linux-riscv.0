Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC91C4321E
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 08:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ieWr1oVqvhmGeyOpb1eOY5xKBNJYCwN3vvJAj5ceepU=; b=nWN9Ejr+MKbGHF
	NdW584VdmVycyg7pweUpZnbt3h2fnDZaUN//zxeplJe4wJ2GC5pwVSOKbAuSrQwc2JX9mw9Z5KdIB
	2rBRA6zyPfawliC1c4jyBLrF51IW5IyIapPRfynpMDhoXSbkiu1LdEFKLrtWz5SeQ26ECTdE8kmVO
	m6LnfX+EGD1e0DidvgQ1/X1jCLdDwJctVtlysIDSH+mSuMD5cGUB4itATf785ctiJAD26Mol+Y0ci
	RItyPvO8+1P9TNe1WMlKuIXU0+yUu2qBr/D045U4S9CJF/LePjSA0sT2GHKjKeuU+IF6FCKEPWnuP
	QYhvARYgVx0akA07kcHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p26fl-00G4ur-I6; Mon, 05 Dec 2022 08:17:57 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p26fh-00G4kR-10
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 08:17:55 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 93A8F5C00E0;
	Mon,  5 Dec 2022 03:17:42 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 05 Dec 2022 03:17:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1670228262; x=
	1670314662; bh=DbK0El3J2ysxIBY+SS+MC9EwisdTLNeE+rzpvmvSsgE=; b=L
	J/W8a5r16P+SKOcJJr7w9Dsue7WjPq7Y3pUWTYcJd30sTHUzuMuKUrxSUAvpxBM6
	UbkmwvwFQIos+4YFnplNJl1VtAz6mypmr27IdaWZLDsQa+jedHbnPQfqqmbnCGhy
	+fw9Sw0KU+CLIhq0ty1gV8sirOhoDTod+tIRFM5AmgGcn4AqDFD5y+4+nEYZiFRV
	PNdQuXera0SvRcitlgbS31Dew1KX1Q31iQLE/BLF1j7LoYK3yI+pQdPrza6s/eFI
	rW8Yjb9+cP9uWZSjMBHUzFImPYWe20csSTg92zWTSiul0hX1AT/cLfcp6fiUlCYA
	sVlrJUAciHtwyTrZDFBcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670228262; x=
	1670314662; bh=DbK0El3J2ysxIBY+SS+MC9EwisdTLNeE+rzpvmvSsgE=; b=R
	iM7Q9HxIJgd6DIzyszZ6o+oirif+e7LBa2MPZTfrew/HALm3+UB/hjizFk04igh2
	9XaplI2sl1lEWhgm3+F7myLisERxXSoPzPr74s0m+zKzPQDDxgd9ob5Q8q7kUfDg
	1iL0iT0K0a0FlRBPyAao/ZsCyL8eiDryEjneVOpty3JndOOxa1DyRP4l00Y15l11
	iuftpiXxmUa17gsvsE2hLiChp7f3TgpP5kg+PQrc5z84xRLHR8Y/quzIW5adDPO8
	+8L9GhfCNZiqhoLTu/6TKCQz3e+p/Pp7d7baB22RCuZ3QZjB0laSTsZbLSZJhoph
	2jSYI8CDD5vh0fljbSM8w==
X-ME-Sender: <xms:JqmNY-2kStUdicFDQJesjm-WxQ7yl2n81UnEz9ga_N-WYLaEO5IFKw>
    <xme:JqmNYxFDZ7kD3aLHQ9wr9IBnIMu-sxqdu-JQ372ISMKoccG_xWAPWbW4g9oBXOZmK
    4gjYJBPqQ8rJNZPjw>
X-ME-Received: <xmr:JqmNY24sRUDIjhYATqSYKxNKAMjTvvTMQVTUw52u92twVhvU3BLri1WzWPRus5bawoKSJwHTbp8qcM9zDUhzxnJJkFa76iAK4U3uH8eNJAswgsabGOxF6SPqug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefgdduvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfvfevfhfhufgjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeehtedtfeegueduledvffeljeehjeeuleduudeivdekffegteeu
    vedvledvteefjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhl
    rghnugdrohhrgh
X-ME-Proxy: <xmx:JqmNY_0qqiEUUCAKkVR8PukKYHKMKLGvJ-a3cPMnCDhb-jVKe7niYw>
    <xmx:JqmNYxFgk3smL1TIovCKF-swPziEOA7wK9Y7ShvkRr0Ju8emnpbMhg>
    <xmx:JqmNY4_JodQv99xwDGn3t06_n8Gaaeqop0Swy8eQde1N_0ykfDu0QQ>
    <xmx:JqmNYzHEFZbfo2pnFH2RqfhF8JFJHMx55igLPRAObtI9DRBgtedyqg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Dec 2022 03:17:41 -0500 (EST)
Message-ID: <0515dc20-2e82-bd16-301a-6ffff010af13@sholland.org>
Date: Mon, 5 Dec 2022 02:17:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Anup Patel <apatel@ventanamicro.com>,
 Rob Herring <robh@kernel.org>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Andrew Jones
 <ajones@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>,
 Conor Dooley <conor.dooley@microchip.com>, Anup Patel <anup@brainfault.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
References: <20221201123954.1111603-1-apatel@ventanamicro.com>
 <20221201123954.1111603-4-apatel@ventanamicro.com>
 <20221202000603.GA1720201-robh@kernel.org>
 <CAK9=C2VbM+CP0Y9Xx-SM9O4TFrQmOKvVWy-u5mxdPxrhacK4JQ@mail.gmail.com>
 <Y40ueQiTZK6hi7RS@spud>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v5 3/3] clocksource: timer-riscv: Set
 CLOCK_EVT_FEAT_C3STOP based on DT
In-Reply-To: <Y40ueQiTZK6hi7RS@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_001753_454640_D656431B 
X-CRM114-Status: GOOD (  32.41  )
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

On 12/4/22 17:34, Conor Dooley wrote:
> Hey Rob, Anup, Prabhakar,
> 
> On Fri, Dec 02, 2022 at 12:03:05PM +0530, Anup Patel wrote:
>> On Fri, Dec 2, 2022 at 5:36 AM Rob Herring <robh@kernel.org> wrote:
>>>
>>> On Thu, Dec 01, 2022 at 06:09:54PM +0530, Anup Patel wrote:
>>>> We should set CLOCK_EVT_FEAT_C3STOP for a clock_event_device only
>>>> when riscv,timer-cannot-wake-cpu DT property is present in the RISC-V
>>>> timer DT node.
>>>>
>>>> This way CLOCK_EVT_FEAT_C3STOP feature is set for clock_event_device
>>>> based on RISC-V platform capabilities rather than having it set for
>>>> all RISC-V platforms.
>>>>
>>>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>>>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>>>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>>>> ---
>>>>  drivers/clocksource/timer-riscv.c | 12 +++++++++++-
>>>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
>>>> index 969a552da8d2..1b4b36df5484 100644
>>>> --- a/drivers/clocksource/timer-riscv.c
>>>> +++ b/drivers/clocksource/timer-riscv.c
>>>> @@ -28,6 +28,7 @@
>>>>  #include <asm/timex.h>
>>>>
>>>>  static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
>>>> +static bool riscv_timer_cannot_wake_cpu;
>>>>
>>>>  static int riscv_clock_next_event(unsigned long delta,
>>>>               struct clock_event_device *ce)
>>>> @@ -51,7 +52,7 @@ static int riscv_clock_next_event(unsigned long delta,
>>>>  static unsigned int riscv_clock_event_irq;
>>>>  static DEFINE_PER_CPU(struct clock_event_device, riscv_clock_event) = {
>>>>       .name                   = "riscv_timer_clockevent",
>>>> -     .features               = CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_C3STOP,
>>>> +     .features               = CLOCK_EVT_FEAT_ONESHOT,
>>>
>>> A platform that depended on CLOCK_EVT_FEAT_C3STOP being set will break
>>> with this change because its existing DT will not have the new property.
>>>
>>> It needs to be the other way around which would effectively be the
>>> existing 'always-on' property.
>>
>> There are no RISC-V platforms using C3STOP. The patch which
>> added C3STOP has been reverted.
>> (Refer, https://lore.kernel.org/lkml/a218ebf8-0fba-168d-6598-c970bbff5faf@sholland.org/T/)
>>
>> I just need to rebase this patch upon the C3STOP revert patch.
> 
> I guess you could say that the C3STOP addition was done spec-ulatively*,
> as the platform that actually exhibits that behaviour does not use the
> riscv-timer & its maintainer acked the revert (allwinner d1 family).

For clarity: that doesn't mean the platform will _never_ use the SBI
timer facility, just that Linux happens to not use it right now.

> *The spec does not make any guarantees about whether events arrive
> during suspend, only the behaviour *if* they arrive.
> 
> Switching the property to "always-on" would require retrofitting that
> property to every other existing platform (and therefore regressing some
> behaviour there, no?).
> 
> Most of the existing platforms are "toys" or demo platforms though, so
> it would not, I guess, be the end of the world to do so. Doubly so since
> none of them actually implement any sleep states that making it an
> "always-on" property.

Specifically, only sleep states with a "local-timer-stop" property would
be inhibited by the C3STOP flag, so there is only possibility of a
regression if some DT declaring such a sleep state exists anywhere.

Regards,
Samuel

> I've said since the start that defaulting to C3STOP is the "safer" thing
> to do, and although we disagreed on this last time Anup, I think the
> better outcome of someone missing a DT property is inaccessible sleep
> states rather than going into sleep states they cannot get out of.
> 
> For PolarFire SoC, which I guess is one of the few "commerical"
> platforms, I'd be willing to accept retrofitting, since we have not yet
> implemented such sleep states yet.
> 
> Maybe Prabhakar knows whether the RZ/Five has either a) implemented
> sleep states and b) which side of the "timer events arrive in suspend"
> divide their platform lies on.
> I'm particular interested here since that is not a SiFive core complex.
> 
> I would like to get DT maintainer approval of an approach here soon-ish
> so that we can something sorted for the jh7110 stuff and for the
> bouffalolabs SoC - the latter of which may very well be in the "no
> events in suspend" camp as it also uses thead stuff.
> 
> Sorry for kinda rowing back on my previous acceptance of the approach,
> but I am really between two minds on this.
> 
> Thanks,
> Conor.
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
