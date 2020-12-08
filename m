Return-Path: <SRS0=oC46=FM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D527C4361B
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 16:16:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C2A620780
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 16:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C2A620780
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6MkyhXJvyzrlimW1rXUjxdu7lIlZVDGvVJ8SD8tgjI8=; b=0MleHSmlAlX1QshGYt/vWgfnb
	8WyrJFLKZsG0H0M5Dkc4Y7QxQH91t7tBW12cMhnEUF13LmvMiYs2otec1bpOXbVJlGFbXPjbliNxs
	KUz4VlfJim1qH+S5NH5qG30WWt0WQ1KP1aYqIZYarA3QYKTuYzhcJ/5IN+TB2DW+rsSvyRjXPQD8j
	en6ov0PsI9mYbXRjHBn43B+yfh3mmE1802rCCddufwmIeydG+b9B6JJ+tK7/VNYIBxTFJumEPtcey
	voAW3bZ8PFK1lpvf0iZRHUL9kJ8T7ZhQP7rNe+vyXjA2JZZZbp/RPzE96oDz936ISO+D31ykUlCmx
	jyPuvGO7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmfem-0007Bm-9R; Tue, 08 Dec 2020 16:16:04 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmfeg-00079c-DH
 for linux-riscv@lists.infradead.org; Tue, 08 Dec 2020 16:16:00 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B8GFuO1021516;
 Tue, 8 Dec 2020 10:15:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607444156;
 bh=WiNdks4Je7o7SD1jGll8k06315J6vHdjJNp9aadg/FE=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=pxeiPtRq2cgW5M5HSIcjk/wHXc19JmfrO43OO3mADZmzxaw3kio/xvlUVPZeIAhPe
 i7IYVQxyjWgceDqu6gUJD4Nhxq2nS7iIAVCJqtgluJuOI8dq9sP85vGbcf+l9FUHWo
 ngPoLPjEDOqxMv+nMe5hycuqLNjRKpqcwE8tsmQw=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B8GFul6048136
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Dec 2020 10:15:56 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Dec
 2020 10:15:55 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Dec 2020 10:15:55 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B8GFqYm050075;
 Tue, 8 Dec 2020 10:15:52 -0600
Subject: Re: Howto listen to/handle gpio state changes ? Re: [PATCH v2 2/2]
 drivers: gpio: add virtio-gpio guest driver
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <0080d492-2f07-d1c6-d18c-73d4204a5d40@metux.net>
 <CACRpkdb4R4yHcUV2KbGEC_RkU+QmH6Xg7X+qee8sEa9TURGr8A@mail.gmail.com>
 <51d3efb7-b7eb-83d7-673a-308dd51616d3@metux.net>
From: Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <87a486d8-70a0-89f7-1ae4-cd408d0e31be@ti.com>
Date: Tue, 8 Dec 2020 18:15:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <51d3efb7-b7eb-83d7-673a-308dd51616d3@metux.net>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_111558_616261_B8173B2C 
X-CRM114-Status: GOOD (  20.08  )
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
Cc: Jonathan Corbet <corbet@lwn.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-riscv@lists.infradead.org, "Enrico Weigelt,
 metux IT consult" <info@metux.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 08/12/2020 16:04, Enrico Weigelt, metux IT consult wrote:
> On 08.12.20 10:38, Linus Walleij wrote:
> 
> Hi,
> 
>> This is Bartosz territory, but the gpio-mockup.c driver will insert
>> IRQs into the system, he went and added really core stuff
>> into kernel/irq to make this happen. Notice that in Kconfig
>> it does:
>>
>> select IRQ_SIM
>>
>> Then this is used:
>> include/linux/irq_sim.h
>>
>> This is intended for simulating IRQs and both GPIO and IIO use it.
>> I think this inserts IRQs from debugfs and I have no idea how
>> flexible that is.
> 
> Oh, thx.
> 
> It seems to implement a pseudo-irqchip driver. I've already though about
> doing that, but didn't think its worth it, just for my driver alone.
> I've implemented a few irq handling cb's directly the driver. But since
> we already have it, I'll reconsider :)
> 
> BUT: this wasn't exactly my question :p
> 
> I've been looking for some more direct notification callback for gpio
> consumers: here the consumer would register itself as a listener on
> some gpio_desc and called back when something changes (with data what
> exactly changed, eg. "gpio #3 input switched to high").

But this is exactly why there is GPIO IRQs in the first place,
which are used to notify consumers.

More over most consumers doesn't know where the IRQ came from - on one HW it can be gpio,
while on another HW - direct interrupt controller line.

-- 
Best regards,
grygorii

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
