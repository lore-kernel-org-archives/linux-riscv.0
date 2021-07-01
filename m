Return-Path: <SRS0=MvPY=LZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9E1EC11F64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 06:40:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1C536148E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 06:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1C536148E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppZpKD5zOpgHsFVz1vcsLd4gdyKlWZN7BY9aiOgNlGI=; b=v1Otsnjxg2VjR/aGFElVoFexJ4
	zx4vbDWbFFuZS9LFo93GzbU/cbaeb/4RiYVvYrxNvw/uTrCU/SZl4+PWgq4+vupw5mYsPN6I0hXWx
	6bZcjBUWf24c7zkmP5vG7jvZifjZ9TwvMhUAPE6cyM5P5tDUZm+D0ChdmXBZaeWR4hw4TMmmuPm5J
	rnE7ryL8tiUysvl6X2coqoV3TqB2UldYGrjGEume6FJI/4xUfJHiB2E+66KIt4GMXhL6C0eduDijA
	UVjXOU/+zMuEkeKaUee4MtvMCXDu3RaIHn9ef48H5Ob+WlDhHL0r5I2M2TUVcpq1cAvBSyxkNVgHp
	YU4HRWiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyqMX-00GGo2-3H; Thu, 01 Jul 2021 06:39:49 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyqMU-00GGnT-Iz
 for linux-riscv@lists.infradead.org; Thu, 01 Jul 2021 06:39:48 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 1D10822205;
 Thu,  1 Jul 2021 08:39:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1625121582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kUQLL6Y7TeJ+8tLLPFCF8HC2GZgPhSFHdHVkUkxeCUY=;
 b=Zr1qZiN2J8wIoXFgX0jLOhT8V2L7JefaDIGmnzs2YO1Gy7MyfPn85MP2ENIDUPhtsaIIyU
 FGTKJktpDu1wg4aGgMJ4yM0GfaFiCMGqYiVvwR4bQip6yzHxzrKgomZz5oYxVyBANg2Iqb
 wgBNnm8nIFPaJAvKXlM4Z3xQji+SYcw=
MIME-Version: 1.0
Date: Thu, 01 Jul 2021 08:39:40 +0200
From: Michael Walle <michael@walle.cc>
To: Drew Fustini <drew@beagleboard.org>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Michael Zhu <michael.zhu@starfivetech.com>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Fu Wei <tekkamanninja@gmail.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Emil Renner
 Berthing <kernel@esmil.dk>, Huan Feng <huan.feng@starfivetech.com>
Subject: Re: [RFC PATH 2/2] gpio: starfive-jh7100: Add StarFive JH7100 GPIO
 driver
In-Reply-To: <20210701002037.912625-3-drew@beagleboard.org>
References: <20210701002037.912625-1-drew@beagleboard.org>
 <20210701002037.912625-3-drew@beagleboard.org>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <8c59105d32a9936f8806501ecd20e044@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_233946_833447_645A4DF5 
X-CRM114-Status: UNSURE (   5.89  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Drew,

Am 2021-07-01 02:20, schrieb Drew Fustini:
> Add GPIO driver for the StarFive JH7100 SoC [1] used on the
> BeagleV Starlight JH7100 board [2].
> 
> [1] https://github.com/starfive-tech/beaglev_doc/
> [2] https://github.com/beagleboard/beaglev-starlight
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>

Could this driver use GPIO_REGMAP and REGMAP_IRQ? See
drivers/gpio/gpio-sl28cpld.c for an example.

-michael

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
