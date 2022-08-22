Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F74EC28D13
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 11:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZiCngg8/YFSCgP5FgGdpstj8fyQUkIQJnRVPgayJxo=; b=j04VHGxrAS7VKs
	JfLcWhGyCYX/7z1rHO/Dg6WxIpCEU4kGZRUK8RTgQ2Ywhdv7my50wvDX29TskzdBMoAHSIRivBmyh
	fx+piufpMVVfzVP/OsIvyQFR3fxY/E9xftKPABZvV63pNhbVPY5UCgVBZjbBsHpqSymyJgh6dQ9zD
	e6bQlrP7jpMHvOE1r0j532UrV0WncBpRCf+H40wJErzSg6zELRqlj++EVzT9hYQCIZKxb6B69otFG
	t29PlUkfuDrDELMb8q3M/069y6UovLv95woBMT6/rpzTJTqEMWFpqc5DpNXDd4JPCRQ4cxs4wwEkn
	O63wPY2V74umpz2NaEWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ5bo-008EvN-2q; Mon, 22 Aug 2022 11:28:44 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ5bk-008Etk-Up
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 11:28:42 +0000
Received: by mail-ej1-x62f.google.com with SMTP id gt3so8088131ejb.12
        for <linux-riscv@lists.infradead.org>; Mon, 22 Aug 2022 04:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=RILhH6Aq9u12AHXrJLapVf/35ykvKgXZJJKhDUJ3u5o=;
        b=W/FLeb+GN/UehRVpHTVUl3UWfEaP4LnB1oyOCWYS3tUzt43GdMgRFKogbJL7ZyFvpF
         QbhKRwjCvxpZqfapq8M8QbKjv0NDNTRs+xo6F1FSw/pUQtHppxwGh3pYGTh4PZ00g0IR
         eyynmLwtdeajoNl4zUfaZnL166+WdYZUzKF7iYxMlKQ/6KI8spXmN1cvFlFZh6BUIWJz
         0Epw9Q4bwqe+QbZ9KNvLFPd+O/HauG5nfdywKF+YUck869jCfl1c+k5qKC0kEojyf6rF
         XeCvoAGFCrAtawgmoXnlyJy4QqWLDUQp4FGvOf6jBtmtjAK8PE8tD+lR4DcegAgoY6dw
         wbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=RILhH6Aq9u12AHXrJLapVf/35ykvKgXZJJKhDUJ3u5o=;
        b=Gze1XKGxb1QlyMdYk2an1J/wmARHe5/wSmBWrGqWXQs2AodolD0zShm6gwTYzOiIu8
         MqFRbkvpGwxPzeqQu2tKZi/6JTuh5VkXOewu7Xsr0Bypc1impRijsB0KpjIijnb0HqcY
         lGS/ZKOUCYsRr51egMHKnxjZ8YFfwR5ldn7Zu/UoWZQz1z+k4OH5q6NZl+de181s68sC
         b0FYlxA0zjSOJJ//f6wad5cZi8WVqJ5pw0nxk5+TkZ4anV3p5Wlg1NXguhZ9mLvxNDWO
         t7pOsuy15j10EvRo9hIsmFa+/93QysmupdtMnoLaV4WJfzD3ETN57LduGF0JAq0SvGGd
         jSGA==
X-Gm-Message-State: ACgBeo3t5YvPGPDgEjYJ3D2Mu6h2wEkC3jH92amCIeQTdoFimCuBsIWc
	J04dDHE0vnZunbrcxGXuKILe6akU8oZqYtlZIQPUgw==
X-Google-Smtp-Source: AA6agR4oXIhMWvyTykV73Rd+VMMf8KizpzG+NuEN/NiSVIDY85ROM3a/ErCmdsahH06lkeq0eo3hUDt62A3a1KcpM9A=
X-Received: by 2002:a17:907:9686:b0:73d:1de0:7fbe with SMTP id
 hd6-20020a170907968600b0073d1de07fbemr9625140ejc.500.1661167719419; Mon, 22
 Aug 2022 04:28:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220815120834.1562544-1-lewis.hanly@microchip.com> <20220815120834.1562544-2-lewis.hanly@microchip.com>
In-Reply-To: <20220815120834.1562544-2-lewis.hanly@microchip.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 22 Aug 2022 13:28:28 +0200
Message-ID: <CACRpkdbk_ZqYnDzXgmbnAxhs+mEe9f2X-y++9HDS-O=UO_tUmg@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] gpio: mpfs: add polarfire soc gpio support
To: lewis.hanly@microchip.com
Cc: linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, brgl@bgdev.pl, 
	linux-kernel@vger.kernel.org, palmer@dabbelt.com, maz@kernel.org, 
	conor.dooley@microchip.com, daire.mcnamara@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_042841_017613_2C4E52FE 
X-CRM114-Status: GOOD (  11.91  )
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

On Mon, Aug 15, 2022 at 2:08 PM <lewis.hanly@microchip.com> wrote:

> From: Lewis Hanly <lewis.hanly@microchip.com>
>
> Add a driver to support the Polarfire SoC gpio controller
>
> Signed-off-by: Lewis Hanly <lewis.hanly@microchip.com>

This looks like  textbook example of a driver that can use
CONFIG_GPIO_GENERIC

> +config GPIO_POLARFIRE_SOC
> +       bool "Microchip FPGA GPIO support"
> +       depends on OF_GPIO
> +       select GPIOLIB_IRQCHIP

select GPIO_GENERIC

See e.g. drivers/gpio/gpio-ftgpio010.c for an example
of how to use bgpio_init() to set up the helper library to handle
the GPIO side of things and combine it with an irqchip.
You get get/set_multiple() for free with this approach.
Also see documentation for bgpio_init() in
drivers/gpio/gpio-mmio.c.

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
