Return-Path: <SRS0=NJ9D=AF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DDA0C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jun 2020 09:25:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A6FB20857
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jun 2020 09:25:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C3ZbzHke"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A6FB20857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O6fYRsYFkLCkIuv80ZjPRulUc+0sfebituKIDPGK60c=; b=C3ZbzHkeTbBNUcPZVAHK6JjM7
	8zbhy/AfxJBwXTSB9RwW3JpF0SpZ/wQA4Y1waF0JmMZ+vESAfWvrMi8RvYqTuUB0KIh7sn22dqdQ3
	+Bgw/jfw5jWACMQe12iQGwQSv6hR34QSQm1I/tGT3LFbONemb7U4uXE3kaawXdZhjCyu6pKQfXJyG
	eirAFMcVI5Uizq4T8ALRzUxsliizxl1N3fZePXpxBxl6N1Bsi0Y886KdzFAx3735vsw0J68iMrCb3
	BSoVIeES7APLjFzeGwZLdPrqpf7zWwqugVtqbRJVvQzrDEZSnzsiLc0PcuS2P41e2WOreXlJ8+R4C
	hmbJ/d9/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jo1eO-0006Mh-DV; Wed, 24 Jun 2020 09:25:00 +0000
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jo1eK-0006Kq-VQ; Wed, 24 Jun 2020 09:24:59 +0000
Received: from [10.130.0.52] (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn97KG_NesDFJAA--.736S3;
 Wed, 24 Jun 2020 17:24:29 +0800 (CST)
Subject: Re: [PATCH 1/7] irqchip: Fix potential resource leaks
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <1592902276-3969-1-git-send-email-yangtiezhu@loongson.cn>
 <1592902276-3969-2-git-send-email-yangtiezhu@loongson.cn>
 <CAJKOXPc9QuDp+FEogVamf7x+4JEUw78MSKqSPFpRcyTYZ7HSMA@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <678f8927-3560-e55b-956f-3e197c7e3244@loongson.cn>
Date: Wed, 24 Jun 2020 17:24:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJKOXPc9QuDp+FEogVamf7x+4JEUw78MSKqSPFpRcyTYZ7HSMA@mail.gmail.com>
X-CM-TRANSID: AQAAf9Dxn97KG_NesDFJAA--.736S3
X-Coremail-Antispam: 1UD129KBjvJXoW7AF4UtF18Zr1UKw1fGw4fAFb_yoW8XF4kpF
 4UJ39IvrWrCFW2kr43Cr1jyFy5Jwn3tay7K3yxA3sxXr98W3srGF4UA34kXrn7GryfGw12
 9F4rXa45G3W5CFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUB214x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
 xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVAFwVW8uwCF04k20xvY0x0EwI
 xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
 Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7
 IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
 6cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r4UJVWxJr1lIxAIcVC2z280aV
 CY1x0267AKxVW0oVCq3bIYCTnIWIevJa73UjIFyTuYvjfUOqXHDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
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
Cc: Baruch Siach <baruch@tkos.co.il>, Tony Lindgren <tony@atomide.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, Huacai Chen <chenhc@lemote.com>,
 linux-riscv@lists.infradead.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Marc Zyngier <maz@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 linux-csky@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Xuefeng Li <lixuefeng@loongson.cn>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 06/24/2020 05:15 PM, Krzysztof Kozlowski wrote:
> On Tue, 23 Jun 2020 at 10:51, Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>> There exists some potential resource leaks in the error path, fix them.
> This should be split per driver and per bug (although mostly in driver
> it's just one bug). Otherwise it is difficult to review, backport and
> revert.

Thanks for your suggestion, I have split it into a patch series [1],
I will resend it some days later due to git send-email always failed.

[1] https://lore.kernel.org/patchwork/cover/1263192/

>
> Best regards,
> Krzysztof
>
>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>   drivers/irqchip/irq-ath79-misc.c      |  3 +++
>>   drivers/irqchip/irq-csky-apb-intc.c   |  3 +++
>>   drivers/irqchip/irq-csky-mpintc.c     | 26 ++++++++++++++++++++------
>>   drivers/irqchip/irq-davinci-aintc.c   | 17 +++++++++++++----
>>   drivers/irqchip/irq-davinci-cp-intc.c | 17 ++++++++++++++---
>>   drivers/irqchip/irq-digicolor.c       |  4 ++++
>>   drivers/irqchip/irq-dw-apb-ictl.c     | 11 ++++++++---
>>   drivers/irqchip/irq-loongson-htvec.c  |  5 ++++-
>>   drivers/irqchip/irq-ls1x.c            |  4 +++-
>>   drivers/irqchip/irq-mscc-ocelot.c     |  6 ++++--
>>   drivers/irqchip/irq-nvic.c            |  2 ++
>>   drivers/irqchip/irq-omap-intc.c       |  4 +++-
>>   drivers/irqchip/irq-riscv-intc.c      |  1 +
>>   drivers/irqchip/irq-s3c24xx.c         | 20 +++++++++++++++-----
>>   drivers/irqchip/irq-xilinx-intc.c     |  1 +
>>   15 files changed, 98 insertions(+), 26 deletions(-)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
