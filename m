Return-Path: <SRS0=o9Ga=MP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F142C4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 21:05:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB52260F23
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 21:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB52260F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nWpmUgNuHMRjj9yKM7OirQtVR51frI4JnHGz8D6pP0Q=; b=E/bbqbblu+TYBb
	Mt/7r0C2in5VlPvxdBqR5pu0vwySjEqByPxRIe8ZYins/Bj40Y8nwI9MGtz73RdTxcQiQMPggAq42
	y6d5AQQu1HQ0DXIF5WgD2xjdjkb43Ibsv4wXwrkghg0uAWFdDNq/beTgLOtKp3oUuBx5UXr+AAJIq
	5a9/ErcqEAKZ1Dlsa8Z85TYbJITQ4sx7cLkMCYo34/yBNE5GdJUw4GWb+MutvUJ9KldQeWVxMbM8o
	7zxG9DpZ0K6VT6DMwQ+0Mlf8NgAOhCyNK2h/n69Y3eknuxlLMWWN1fB17Vmb7p+7HqITcbFM3E9uM
	9P/LSaGarMDvdvwvjyFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m72Lz-005w31-Dr; Fri, 23 Jul 2021 21:05:07 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m72Lm-005w1p-Ao
 for linux-riscv@lists.infradead.org; Fri, 23 Jul 2021 21:04:56 +0000
Received: by mail-lj1-x234.google.com with SMTP id e5so3240104ljp.6
 for <linux-riscv@lists.infradead.org>; Fri, 23 Jul 2021 14:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+du+0LHLfACLmN4y/oi02W5K+tfyhYdkNu9bdamCZoA=;
 b=PU8ExjLpqbQ7v0/Tet2GfCUlvlxrEFfeIpx99CC6Xk5+aELtn+8O2bULpwHlEZGAvn
 NnHZbXmI78vEHdBxHtZdyoo4dhMLlT2nPyNgRDVcWyxKJotHDsvBsAI/8Q/F8l4YOnBQ
 AyrT7aqeEglidsG7hJLMiRgyvgQ3JRMk5SYfTEVV7ThBCZJm5KFsOk5f+lvBLw0btP4d
 42l2xOo19oJRKfeJBplz2KKkTKwgw9DGVyLxFvfQXjpTCqIQwObnvEaazH8ZHwd4Oykv
 zukRN0buICPccVlmtRqHaOmhc4TWJsks2Iy/oXmqVOytYVEv4MmzD+t8N/9ISPqhEy9e
 2cog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+du+0LHLfACLmN4y/oi02W5K+tfyhYdkNu9bdamCZoA=;
 b=P0isqltpeZJtQcQ1OW1lzLJLRgDyCl4/P9/McJ3SJcy+BVH9ZwISfdbRGEZ3hsnAPG
 q5hdKTglVa/xQHkMxQ3eSV8AQ9A6J5UG3jzF+sTCyxXSMB7JU3UtW5X98Uicu97qvky8
 0etDph9lhGpRRONm8s7/OP2wxJp93QfXCt4nSqP8cqwioaW4nJaBqkmfylh8DaVEdfwq
 LUk5GyzhNO8K0qIlUdwXDSKpAwYMD8va/LOe9GsfMw3eLiii3dF+XaOPFp7VR0DGO0IK
 Z6KKWur/KWRDN8WYLoPBneLw587tyRzanJgjKRqohwKksfOgEbuopBNr1QJisR3pX182
 vIYg==
X-Gm-Message-State: AOAM531nEE9INNxyZRylo6MyXLXOSEVHdf09tw0iIpyEJdcueuxQV5XZ
 yy9AiS5n6S3B7/+EjHUVaiJBnSz18wR8xFtjGvzxog==
X-Google-Smtp-Source: ABdhPJxQWYsOWFLVby006xkxrHiuFL3EnCGftMH8g5GForQjSavZnil4OEtYwmjZFYh8qrp4mdkJspxPgo3NmEIWfGc=
X-Received: by 2002:a2e:9d15:: with SMTP id t21mr4501765lji.200.1627074292231; 
 Fri, 23 Jul 2021 14:04:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210701002037.912625-1-drew@beagleboard.org>
 <20210701002037.912625-3-drew@beagleboard.org>
 <8c59105d32a9936f8806501ecd20e044@walle.cc>
In-Reply-To: <8c59105d32a9936f8806501ecd20e044@walle.cc>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Jul 2021 23:04:41 +0200
Message-ID: <CACRpkdbhKsuXZiLCh_iajJQWDdQQOZ87QF3xDr5Vc66SoVCnxQ@mail.gmail.com>
Subject: Re: [RFC PATH 2/2] gpio: starfive-jh7100: Add StarFive JH7100 GPIO
 driver
To: Michael Walle <michael@walle.cc>
Cc: Drew Fustini <drew@beagleboard.org>, Rob Herring <robh+dt@kernel.org>, 
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Zhu <michael.zhu@starfivetech.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Fu Wei <tekkamanninja@gmail.com>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, 
 Huan Feng <huan.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_140454_424620_746E27EC 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jul 1, 2021 at 8:39 AM Michael Walle <michael@walle.cc> wrote:
> Am 2021-07-01 02:20, schrieb Drew Fustini:
> > Add GPIO driver for the StarFive JH7100 SoC [1] used on the
> > BeagleV Starlight JH7100 board [2].
> >
> > [1] https://github.com/starfive-tech/beaglev_doc/
> > [2] https://github.com/beagleboard/beaglev-starlight
> >
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> > Signed-off-by: Drew Fustini <drew@beagleboard.org>
>
> Could this driver use GPIO_REGMAP and REGMAP_IRQ? See
> drivers/gpio/gpio-sl28cpld.c for an example.

To me it looks just memory-mapped?

Good old gpio-mmio.c (select GPIO_GENERIC) should
suffice I think.

Drew please look at drivers/gpio/gpio-ftgpio010.c for an example
of GPIO_GENERIC calling bgpio_init() in probe().

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
