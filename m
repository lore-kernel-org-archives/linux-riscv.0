Return-Path: <SRS0=OdZr=L5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1606FC07E99
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jul 2021 13:30:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3063613FC
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jul 2021 13:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3063613FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gw+VeR52zMtIN/hiMztqmECN/0VhuJOtiLjCNtxYsYc=; b=iVX+mw7MlqAy8WdoQMW/D679LV
	r82MtP5PcfQR8X5BZyf4MjEFjqAZGybfFa70oAAXMPdzDpaQTjxu75oEoWwFBrdpJ84XN+Hl2q8HG
	dpM8EFL+hflnuXeHwwpUAF+wosiPKLMA8uMI3F3CJ4yb1uVD2VR8M1mVFdaReKPBgJ0pVaZEUH9N0
	nxjcdp5yFBns7cXMbmcq5bE4V3FelOLp9RqEuzHrJfEkvnJoz6aQuHTmQupvkgB2lBHsLjaP0b+Ly
	+KkAIwbz8vHOyQopqKzsSPeM6w9ClTPgrorccdMxiSteNoYwaMvxR/1Kk3zCL03X2KuO8RsBhJvAo
	L1U6gfsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0OfV-0090qn-S7; Mon, 05 Jul 2021 13:29:49 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0OfN-0090pj-UV
 for linux-riscv@lists.infradead.org; Mon, 05 Jul 2021 13:29:43 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 5364D2224A;
 Mon,  5 Jul 2021 15:29:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1625491776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ddqwepprvqFiaW8VYgzbLNgNvkfzv1fsbM9mR4tb2MU=;
 b=KlKc6cuymWilnEHSiZybjsBCb7lqFMoM0B0qntA5wAIa83ZClp/T+yO2jhPZO3P097HPyx
 I9LJ4cgHjYs5tbZ1GkoFxLOWaMPYXOA7xBLcq+czcgCMWb6barEtcJBGF1+1tR/jQQHk1w
 GDVJF5uW3DqrkflWRAWNDdHoOV/WFvs=
MIME-Version: 1.0
Date: Mon, 05 Jul 2021 15:29:35 +0200
From: Michael Walle <michael@walle.cc>
To: Drew Fustini <drew@beagleboard.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <bgolaszewski@baylibre.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Michael Zhu
 <michael.zhu@starfivetech.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Fu Wei <tekkamanninja@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, Emil Renner Berthing
 <kernel@esmil.dk>, Huan Feng <huan.feng@starfivetech.com>
Subject: Re: [RFC PATH 2/2] gpio: starfive-jh7100: Add StarFive JH7100 GPIO
 driver
In-Reply-To: <20210702210622.GC1035183@x1>
References: <20210701002037.912625-1-drew@beagleboard.org>
 <20210701002037.912625-3-drew@beagleboard.org>
 <CAHp75Vc7kFk_SC8MSmFE5mBt53=4yUnxpSpr=cxZ+7eA-t1r5g@mail.gmail.com>
 <20210702210622.GC1035183@x1>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <991dddfee40c5b358c07257b58a316f3@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_062942_192301_F1F73ED4 
X-CRM114-Status: GOOD (  24.36  )
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

Hi Drew,

Am 2021-07-02 23:06, schrieb Drew Fustini:
> On Fri, Jul 02, 2021 at 07:03:19PM +0300, Andy Shevchenko wrote:
>> On Thu, Jul 1, 2021 at 3:23 AM Drew Fustini <drew@beagleboard.org> 
>> wrote:
>> >
>> > Add GPIO driver for the StarFive JH7100 SoC [1] used on the
>> > BeagleV Starlight JH7100 board [2].
>> >
>> > [1] https://github.com/starfive-tech/beaglev_doc/
>> > [2] https://github.com/beagleboard/beaglev-starlight
>> 
>> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> > Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
>> > Signed-off-by: Drew Fustini <drew@beagleboard.org>
>> 
>> Seems some Co-developed-by are missing.
> 
> Thank you for suggesting this.  Huan Feng originally wrote the driver.
> Emil and I have made some changes to reorganize and clean it up for
> submission.
> 
> Do you think all three of us should list Co-developed-by: for our names
> in addition to the SOB?
> 
>> Brief look into the code brings the Q. Can't you utilize gpio-regmap
>> here? Why not?
> 
> Michael Walle asked about this yesterday and it was my first time
> looking at regmap and gpio-regmap.  I've been reading the code and it
> does look like I should try convert this driver over to using
> gpio-regmap.
> 
> The open question in my mind is how to handle the interrupt type (edge
> trigged on positive or negative, level triggered on high or low).
> Hopefully I can find some other examples that can help me think about
> how to do that correctly.

Have a look at include/linux/regmap.h, there is "struct 
regmap_irq_type".
If you're lucky, you can just supply the corresponding values that fits
your hardware. If it doesn't match your hardware at all, then you can
keep your own functions, or if its slightly different, then maybe you
can add support for your quirk in regmap-irq. You don't necessarily have
to use regmap-irq together with gpio-regmap. You can also just use
regmap-irq or gpio-regmap independently.

A quick grep for "type_rising_" lists drivers/mfd/max77650.c and
drivers/mfd/rohm-bd70528.c for example.

-michael

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
