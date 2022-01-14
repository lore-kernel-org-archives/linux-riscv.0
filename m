Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D872C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jan 2022 16:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:From:To:Date:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SfoaYzHlPuTt2expBIACeewfRr98kG/33mw28qrTAEU=; b=4EWP/HkwOE1FQf
	9KP9QxgHPFZGqIOYpB68i0sOGn5HiPTAuWD2JyAnPzwl4oD4UsA6t9MY4xUuKVkeerWA4siXWCdin
	LkUuIgVXau2qX5BOE2RbtgqBaIgOL8FihFQhOav6ny+vx4nH4Ba+H8zceoT3ohDU1C7ZFJv/Tz0qp
	o6AcrtstMsDSiR3U6Ao3ty2QlmaIZyOYunrvXjA5ZfsInLmMyyDlrT7VEucaiXMrp67wGDfguiiBe
	TWBjz1308J3mNX/LBxCrdARFDrPLhoiOgxdF5XRomVR648fy+rCaENF8ItURUWeA0gL8C7WXsxNRg
	XtpxdTM5NlDuJnte03Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8PFK-009iQw-2U; Fri, 14 Jan 2022 16:16:10 +0000
Received: from mail-4022.proton.ch ([185.70.40.22])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8PFG-009iPV-QT
 for linux-riscv@lists.infradead.org; Fri, 14 Jan 2022 16:16:08 +0000
Date: Fri, 14 Jan 2022 16:15:58 +0000
Authentication-Results: mail-4018.proton.ch; dkim=none
To: Geert Uytterhoeven <geert@linux-m68k.org>
From: conor dooley <mail@conchuod.ie>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mark Brown <broonie@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Linux PWM List <linux-pwm@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Linux Crypto Mailing List
 <linux-crypto@vger.kernel.org>, linux-rtc@vger.kernel.org,
 linux-spi <linux-spi@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Bin Meng <bin.meng@windriver.com>, Heiko Stuebner <heiko@sntech.de>,
 Lewis Hanly <lewis.hanly@microchip.com>, daire.mcnamara@microchip.com,
 ivan.griffin@microchip.com, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v3 03/15] mailbox: change mailbox-mpfs compatible string
Message-ID: <MzSOUvHzeH0svo7uoPc_rfCs1BVTByRKAZ_EftQ5Qk2sheETSbE_NFPRVzFd8YmKMQ_9uIggomOqyQUD9clIwabiKrVp4F2Gw4nOnJkXv2M=@conchuod.ie>
In-Reply-To: <CAMuHMdUXD8CHqoaygXzcC0YpsbRT_KAUni1hD4sMn=k=WD+DuQ@mail.gmail.com>
References: <20220114151727.2319915-1-conor.dooley@microchip.com>
 <20220114151727.2319915-4-conor.dooley@microchip.com>
 <CAMuHMdUXD8CHqoaygXzcC0YpsbRT_KAUni1hD4sMn=k=WD+DuQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_081607_058687_BBB9DF62 
X-CRM114-Status: GOOD (  23.88  )
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
Reply-To: conor dooley <mail@conchuod.ie>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> Hi Conor,
>
> On Fri, Jan 14, 2022 at 4:16 PM <conor.dooley@microchip.com> wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > The Polarfire SoC is currently using two different compatible string
> > prefixes. Fix this by changing "polarfire-soc-*" strings to "mpfs-*" in
> > its system controller in order to match the compatible string used in
> > the soc binding and device tree.
> >
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>
> This is already upstream, commit f10b1fc0161cd99e ("mailbox: change
> mailbox-mpfs compatible string").

I would say great, but that means the new string is now in the driver
but the new dt-binding is not (and I just noticed contains an error).
Conor.

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
