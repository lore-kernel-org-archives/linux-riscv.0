Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99739C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 09:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FmVXie4MzZI/cBFrJDZ/DBgKOPE187H/8WqPO6aTHbA=; b=EIQQbKA4wa6D7n
	OM2z3/YDlQYdprF+DBGrZP1usvwMMVlwpftljMD5cuUbPycALIbjwFlOysVlZTPjlS8nHoPsBwOhW
	6628jT0QogSc5Kf7QzCGq/k/V6GTNrcXo0dJZFjo7B6p/ZbeG79UumRTtbNaJTnAMaoCUMCJFSiRj
	ADMNKDGScm0/KmM9KE9mEIZuxO6TJFL+taIk8fGkGmx7M7VdImLSpwBdVWEyNJ1zI39cKJNrBXhBa
	8ikCMdX7QioVYXsLbX1sUeBOAvk3xtcU80vmyxu5GznP2U2300d2rj9b6K9xQfZfVJlZXv1yz9EQ3
	Qz0cMUZKhGsZnMKflJfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1my9rO-009Ivs-HD; Fri, 17 Dec 2021 09:49:06 +0000
Received: from mail-ua1-f42.google.com ([209.85.222.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1my9rK-009IsT-TG
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 09:49:04 +0000
Received: by mail-ua1-f42.google.com with SMTP id t13so3228889uad.9
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 01:49:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pV3wufp8Dvr2hDhjItQtnYu6eMKRgXVIFNhbTAtUVzU=;
 b=TQttpk+lntlBWhfRow1vtjLDUQz7A0r2wLGChIUlmsE92Janx1vfZPDddt6ZeEimTB
 1p65dz+O4eMK3ywd8WKWFdQtixGIk76KdXjliH4sHWo22qOOyIQXd6uvBFQloQkVvc7q
 qXD+2rrGsFwHjCAOoC89GmnK5knf2DvMElcWkZ7xO6vANU0pI9vJCAKio8GfA4IOPUFT
 SJVpRJ395UJmbc3Xm+18c/3U2OsEdO3VZlJMaVzWnfrkDOnZoX052t1Wxi5IzLOJLzho
 gEC+lHaH3fn6e94ug8dtSCm+lpnRyCfHyisvevw8+I/nc0sRbIO2L3zyehaDhWT1YKep
 l7Lw==
X-Gm-Message-State: AOAM533l+9eNF0vprMSm1fbWU04HqIHKpq7la1Ad7Os50cL1dLDgecQt
 AJnh9n45h2ecKZv/fd1V1Nz5kCYueb3L+A==
X-Google-Smtp-Source: ABdhPJy5tbU5oH6IeEkzIOwMglM+Nwa/VBY4RxMZmHIm9PltsWdvNxxfppwIN9js4v/g8iaESenKPw==
X-Received: by 2002:ab0:b88:: with SMTP id c8mr620564uak.130.1639734540625;
 Fri, 17 Dec 2021 01:49:00 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43])
 by smtp.gmail.com with ESMTPSA id i123sm590349vkb.20.2021.12.17.01.48.59
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 01:48:59 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id p37so3262087uae.8
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 01:48:59 -0800 (PST)
X-Received: by 2002:a67:c106:: with SMTP id d6mr650580vsj.77.1639734538930;
 Fri, 17 Dec 2021 01:48:58 -0800 (PST)
MIME-Version: 1.0
References: <20211217093325.30612-1-conor.dooley@microchip.com>
In-Reply-To: <20211217093325.30612-1-conor.dooley@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Dec 2021 10:48:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWTjrAiHosU0cGyJYkK=9JzNgHb=tjHXPdYxTWmkVzeYQ@mail.gmail.com>
Message-ID: <CAMuHMdWTjrAiHosU0cGyJYkK=9JzNgHb=tjHXPdYxTWmkVzeYQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] Update the Icicle Kit device tree
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Mark Brown <broonie@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Lee Jones <lee.jones@linaro.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, 
 Linux PWM List <linux-pwm@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-rtc@vger.kernel.org, 
 linux-spi <linux-spi@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Heiko Stuebner <heiko@sntech.de>, Lewis Hanly <lewis.hanly@microchip.com>, 
 daire.mcnamara@microchip.com, ivan.griffin@microchip.com, 
 Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_014902_971971_87B9098E 
X-CRM114-Status: GOOD (  19.68  )
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

Hi Conor,

On Fri, Dec 17, 2021 at 10:31 AM <conor.dooley@microchip.com> wrote:
> Also depends on Geert's format changes to interrupt grouping etc [2].
>
> Additionally, the interrupt-extended warnings on the plic/clint are
> cleared by [3] & [4], which lore appears to have been very confused about.

Right, it ended up being even more messier than I thought, and confuses
"b4 am" too.
I will resend these 3 series later today.

> [1] https://lore.kernel.org/linux-clk/20211216140022.16146-1-conor.dooley@microchip.com/T/
> [2] https://lore.kernel.org/linux-riscv/cover.1639660956.git.geert@linux-m68k.org/T/
> [3] https://patchwork.kernel.org/project/linux-riscv/cover/cover.1639662093.git.geert@linux-m68k.org/
> [4] https://patchwork.kernel.org/project/linux-riscv/cover/cover.1639661878.git.geert@linux-m68k.org/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
