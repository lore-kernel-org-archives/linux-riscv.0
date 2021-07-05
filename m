Return-Path: <SRS0=OdZr=L5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCED6C07E99
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jul 2021 14:33:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AFBA613BD
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jul 2021 14:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AFBA613BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X5JNP7Nc4lcrqOcNZtuUMlp6UIQ2COwB62myzsISOmY=; b=vCWS2SMnW9xlmP
	MVA2DxRXnzFxlDODi2cBK+vO9tWNM7pQKAK2tmq+Q9Wbi+TjvhZGEJIdQP96gXRJggI1EyhxCUB47
	JEo3NM5n6vsAlh6qMgODHYoqMyjhmAUoF6Vxgq7K4O5i8Ac4VYtPAKt9TK7FgeLdVObaMWooea5fZ
	SjDS3TAXDrUK8OcxSfF/+38K66UP9AXLqX9rBUo1L0xeyTbowkew1PauV6UhCF9Pze4On4aDR2Zbg
	NWBg5V895Or5tUULpBVKDHKZq6gf0aNPaqYiR47lwQfm6EfLad/KCo4AIRQTOvLXT8XquaaSAGMdN
	DTnmKLMzei+1hArpjwOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0Pf1-0097bL-Iz; Mon, 05 Jul 2021 14:33:23 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0Pey-0097aP-MC
 for linux-riscv@lists.infradead.org; Mon, 05 Jul 2021 14:33:22 +0000
Received: by mail-lj1-x22e.google.com with SMTP id r20so10326515ljd.10
 for <linux-riscv@lists.infradead.org>; Mon, 05 Jul 2021 07:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=i+utG97jaWLbSw6GtvymEyma5n0QceYYYcL0QZrM+K0=;
 b=LMDBO8vopAYlQ5RE/k0rqJbg2Lof4F7VcfrlSatlRA6OiVmsg0XFeRO3ttpq8y7XXy
 tT7XUFAVfYK/DjclGtpF26OrL48I1xmIJGpYl0cS4qMSP49P4zQ4CS3I4ESXGBhJuTvQ
 MUCYY/LXD5iIxXC00/gJd3pUueDCepbbIh7vaWddTYZjpkfJKAEicQATM3x/glfPAJCj
 cc/iNTtcvnYjHnK8eLgKTvMI2Gpe53kabgrTJWp5AcbbtPsI2tDKm8GF30AL/rnAiSTW
 YIZ/OKzJZ3QJplBbimqKm9BJqGA+5CShlMK3S5pt9HRuZB1EcPXTdEWoxnH1QoLEW4Ze
 NqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=i+utG97jaWLbSw6GtvymEyma5n0QceYYYcL0QZrM+K0=;
 b=fFd0CtzwXbEEyq62fsdT6ZpVA4suXb+PZ9AWHatAzUV03TORrNNEiU0DTCAIMfPC3C
 z1lRVPBvD8lvW7Wkwg+aYlypZLfvbZ0YKn9usOH9nM+xrN5UFijbGDUUjsOKy69sI8/8
 J4ff+UyDdDuN7EsPLfzgfRmguqEqwwK6ndgm5JTOv+3IfbSZhZ8QmE1K0mRszZYq3FLA
 WlgVf4sfuOQzSC4yKt1wm6olcpi9p/R8sGqCW8y1zynMi67/1CrWGDN7cxYhU7QHXHZ3
 qhsug2dJnkUstsdDjrtskCahr2FGUV08lS0IinsewPKycTaImEMASmOZEhnGuNnVGtdK
 XuAA==
X-Gm-Message-State: AOAM532aiumYYKN/BIVIwcn0ZTrcJm+vaPxeUcemrRT3Dx8awxjhGbcs
 w/3zTchRA6DnBZbYRZzAGpU=
X-Google-Smtp-Source: ABdhPJwBxVU+K9bjigfPk+jbTac/NdSFFo7VBcAaWjm2aDFdnquAjxVcedwJB+wUU8apv/YN/OvCvw==
X-Received: by 2002:a2e:9210:: with SMTP id k16mr10367590ljg.508.1625495597763; 
 Mon, 05 Jul 2021 07:33:17 -0700 (PDT)
Received: from dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi
 (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
 by smtp.gmail.com with ESMTPSA id o10sm1096781lfk.271.2021.07.05.07.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 07:33:17 -0700 (PDT)
Message-ID: <68dc9bba14776ecd07d1b9e6fe53956b892a4b56.camel@gmail.com>
Subject: Re: [RFC PATH 2/2] gpio: starfive-jh7100: Add StarFive JH7100 GPIO
 driver
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Michael Walle <michael@walle.cc>, Drew Fustini <drew@beagleboard.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <bgolaszewski@baylibre.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Michael
 Zhu <michael.zhu@starfivetech.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Fu Wei <tekkamanninja@gmail.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>, linux-riscv
 <linux-riscv@lists.infradead.org>,  devicetree
 <devicetree@vger.kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Huan
 Feng <huan.feng@starfivetech.com>
Date: Mon, 05 Jul 2021 17:33:10 +0300
In-Reply-To: <991dddfee40c5b358c07257b58a316f3@walle.cc>
References: <20210701002037.912625-1-drew@beagleboard.org>
 <20210701002037.912625-3-drew@beagleboard.org>
 <CAHp75Vc7kFk_SC8MSmFE5mBt53=4yUnxpSpr=cxZ+7eA-t1r5g@mail.gmail.com>
 <20210702210622.GC1035183@x1> <991dddfee40c5b358c07257b58a316f3@walle.cc>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_073320_780542_C8BDF5F8 
X-CRM114-Status: GOOD (  36.25  )
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

Hi deee Ho Drew, Michael, All

On Mon, 2021-07-05 at 15:29 +0200, Michael Walle wrote:
> Hi Drew,
> 
> Am 2021-07-02 23:06, schrieb Drew Fustini:
> > On Fri, Jul 02, 2021 at 07:03:19PM +0300, Andy Shevchenko wrote:
> > > On Thu, Jul 1, 2021 at 3:23 AM Drew Fustini <drew@beagleboard.org
> > > > 
> > > wrote:
> > > > Add GPIO driver for the StarFive JH7100 SoC [1] used on the
> > > > BeagleV Starlight JH7100 board [2].
> > > > 
> > > > [1] https://github.com/starfive-tech/beaglev_doc/
> > > > [2] https://github.com/beagleboard/beaglev-starlight
> > > > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > > > Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> > > > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> > > 
> > > Seems some Co-developed-by are missing.
> > 
> > Thank you for suggesting this.  Huan Feng originally wrote the
> > driver.
> > Emil and I have made some changes to reorganize and clean it up for
> > submission.
> > 
> > Do you think all three of us should list Co-developed-by: for our
> > names
> > in addition to the SOB?
> > 
> > > Brief look into the code brings the Q. Can't you utilize gpio-
> > > regmap
> > > here? Why not?
> > 
> > Michael Walle asked about this yesterday and it was my first time
> > looking at regmap and gpio-regmap.  I've been reading the code and
> > it
> > does look like I should try convert this driver over to using
> > gpio-regmap.
> > 
> > The open question in my mind is how to handle the interrupt type
> > (edge
> > trigged on positive or negative, level triggered on high or low).
> > Hopefully I can find some other examples that can help me think
> > about
> > how to do that correctly.

> regmap_irq_type".
> If you're lucky, you can just supply the corresponding values that
> fits
> your hardware.

I added some level IRQ type-configuration support to regmap_irq back
when I wrote the BD70528 support. You should be able to just fill the
bit-mask indicating IRQ types supported by your GPIO controller
hardware, and then the corresponding type register values. As far as I
remember the supported types and values are given "per IRQ". If my
memory serves me right there was a limitation that the regmap-IRQ does
not distinguish setup where GPIO controller supports rising and falling
edges - but not both. That would have required adding another type
flag.

>  If it doesn't match your hardware at all, then you can
> keep your own functions, or if its slightly different, then maybe you
> can add support for your quirk in regmap-irq. You don't necessarily
> have
> to use regmap-irq together with gpio-regmap. You can also just use
> regmap-irq or gpio-regmap independently.
> 
> A quick grep for "type_rising_" lists drivers/mfd/max77650.c and
> drivers/mfd/rohm-bd70528.c for example.

The BD70528 has not been used too much and is scheduled for removal. It
may have received only limited testing but it *should* be functional
though.

Best Regards
	Matti Vaittinen


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
