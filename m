Return-Path: <SRS0=PU6a=FN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D403C4361B
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 20:22:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD38123A33
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 20:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD38123A33
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ri73wub6ycHz6SS0GkYWlRAXrVLxVOEc7k5DsX60QpE=; b=io2P7GESwSWVIePaxzNBlcN4Y
	LpMLsgc6atM7SmtYuX9/H7isP//ysQJPmnvsyHLq1un/pUFn2A2toBsSaew+24mYHb2D2MitGMMu7
	/no7dR79Uc8N/lboYKNnm+ifwAPWrMExtRwE97MqmFYl3jdLVAzkX3GOwvurnwMNjHdUxPmyiMkrz
	lV5kVjbCVToAyo/ci+nJ+pumDFLAVaCbxbQb1+KL+0vZMZbY7RKq2QAfOLoDX6KGgJLovZaVF6yYw
	GnnNBVu4yAlQDkEvy7mdBjTY+pApBrgvrNZN61QgwWpAgkVBNaKAj7WBmVAp158KClofT1CF7VaaL
	oaFNnYA0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn5z2-0001vF-6l; Wed, 09 Dec 2020 20:22:44 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn5yx-0001u2-Ne
 for linux-riscv@lists.infradead.org; Wed, 09 Dec 2020 20:22:41 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B9KMYrS093383;
 Wed, 9 Dec 2020 14:22:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607545354;
 bh=0YOr/KkSEFpTKDVBe5HkrfTXFveoPFaa5XWm7Svxg7A=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=nJBYIQZr0v6lufvH0ZaFAm1rXVXE8Y46IxZPkAIl62WLJ1VxUa2c66AtQB25EgYiV
 nL/a9qPUfn/JWmUpXk432xiAzXPWCSW+BNipBHHz1h0qVhdb2zU6coRwYG5Sla+gst
 JWg7Xk7Z6MfewE8yF3BpQi9dZr39egrZldmiauW0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B9KMYbu010807
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 9 Dec 2020 14:22:34 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 9 Dec
 2020 14:22:34 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 9 Dec 2020 14:22:34 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B9KMTT1020549;
 Wed, 9 Dec 2020 14:22:31 -0600
Subject: Re: Howto listen to/handle gpio state changes ? Re: [PATCH v2 2/2]
 drivers: gpio: add virtio-gpio guest driver
To: Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@kernel.org>
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <0080d492-2f07-d1c6-d18c-73d4204a5d40@metux.net>
 <CACRpkdb4R4yHcUV2KbGEC_RkU+QmH6Xg7X+qee8sEa9TURGr8A@mail.gmail.com>
 <51d3efb7-b7eb-83d7-673a-308dd51616d3@metux.net>
 <CACRpkdbqVoT56H88hoZwDqV0kW_8XTaE5TkMQsg-RRrPqgF=cQ@mail.gmail.com>
 <CAK8P3a1PRQGUXkjdSmqxXSONX_ZoCgsfx8hJBUdBUk14tyzErA@mail.gmail.com>
 <CACRpkdbNAeDsi9B14kbkAeoqX7NE_Ua_yOX1iNF75oNK0ELefQ@mail.gmail.com>
From: Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <2827855a-dc4f-2e17-aca3-4b1b9f0d5084@ti.com>
Date: Wed, 9 Dec 2020 22:22:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdbNAeDsi9B14kbkAeoqX7NE_Ua_yOX1iNF75oNK0ELefQ@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_152239_977046_B87840FC 
X-CRM114-Status: GOOD (  19.60  )
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Jason Wang <jasowang@redhat.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, "Enrico Weigelt,
 metux IT consult" <lkml@metux.net>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, "Enrico Weigelt,
 metux IT consult" <info@metux.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 09/12/2020 14:53, Linus Walleij wrote:
> On Wed, Dec 9, 2020 at 12:19 PM Arnd Bergmann <arnd@kernel.org> wrote:
>> On Wed, Dec 9, 2020 at 9:51 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>>> On Tue, Dec 8, 2020 at 3:07 PM Enrico Weigelt, metux IT consult <lkml@metux.net> wrote:
>>
>>> What we need to understand is if your new usecase is an outlier
>>> so it is simplest modeled by a "mock" irq_chip or we have to design
>>> something new altogether like notifications on changes. I suspect
>>> irq_chip would be best because all drivers using GPIOs for interrupts
>>> are expecting interrupts, and it would be an enormous task to
>>> change them all and really annoying to create a new mechanism
>>> on the side.
>>
>> I would expect the platform abstraction to actually be close enough
>> to a chained irqchip that it actually works: the notification should
>> come in via vring_interrupt(), which is a normal interrupt handler
>> that calls vq->vq.callback(), calling generic_handle_irq() (and
>> possibly chained_irq_enter()/chained_irq_exit() around it) like the
>> other gpio drivers do should just work here I think, and if it did
>> not, then I would expect this to be just a bug in the driver rather
>> than something missing in the gpio framework.
> 
> Performance/latency-wise that would also be strongly encouraged.
> 
> Tglx isn't super-happy about the chained interrupts at times, as they
> can create really nasty bugs, but a pure IRQ in fastpath of some
> kinde is preferable and intuitive either way.

In my opinion the problem here is that proposed patch somehow describes Front end, but
says nothing about Backend and overall design.

What is expected to be virtualized? whole GPIO chip? or set of GPIOs from different GPIO chips?
Most often nobody want to give Guest access to the whole GPIO chip, so, most probably, smth. similar to
GPIO Aggregator will be needed.

How is situation going to be resolved that GPIO framework and IRQ framework are independent, but intersect, and
GPIO controller drivers have no idea who and how requesting GPIO IRQ - threaded vs non-threaded vs oneshot.
So, some information need to be transferred to Back end  - at minimum IRQ triggering type.

Overall, it might be better to start from pure gpio and leave GPIO IRQ aside.
-- 
Best regards,
grygorii

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
