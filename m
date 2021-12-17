Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952DCC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 13:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=czkDqt9EKmDvIT1UG/uCc0Kavbjr3RqxGUaYPNfBuAo=; b=zjqfzsHtADmZ0y
	EKbt36UnIedJcKUfKNSVwF+8bwnpKfIvqN9kViGQp9O8zlhg3CHtmUoB9lPKbAmHXM1mJG9GH+Igp
	isGvVPg3PWnyLEnyCHzRvkxkElej1/ogJjwjaeDbxTgbTS3a7tXTqn8A0AC16jGtwSseE0+xH3Zt1
	2WzmLT4G+nu5z/a55WY3ckMyXcr7+/mWeH2Zcztxt8D9Qpdog9Pg4ouGUm0uDM9l93aZ3ZqyYVvhu
	Ur4opX//HEdJV3VqKkb0Yoz9UTJYq+Lj1oVnXwOgc807hdtMqWwgv5M2mQPnZyzypfMjDDXwi0Fds
	OI0fr2UmbVUKVYXP48bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myDFA-00ANeY-AK; Fri, 17 Dec 2021 13:25:52 +0000
Received: from mail-ua1-f54.google.com ([209.85.222.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myDF2-00ANbd-05
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 13:25:45 +0000
Received: by mail-ua1-f54.google.com with SMTP id r15so4319570uao.3
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 05:25:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UfQoARdnbkZAiC3vtgUpOeQLmZLNRjjpwLc9s5ZyHps=;
 b=1M2vpa8IauWcU0PpgxV8L0TIzV2+svhjgxqrHkzIQ2UFd/V+8HVTZdkruLcLrTJA95
 fkPkmxAbY2MoZMmrmkz7ZCxciCfR1jUQ1oZPE16okbCLee/fEYwcOMyxsqkZyhMcDcUJ
 H40mIoW2AVcQPE4T4VvThj4RXHXcfIktLXFQ5n2OAkkqKIlJtSu05tGyU9vn9G6k4tq/
 t2LP5lcXIy9IF1UTpJDVlfK67M+hzqJZWf2/b5IWzePIicE5VtyrZ2tB7MFdybhpSI86
 X34VmSqBt9fY+nAzKgcM97xNzvOJsSJ3fQw+RfrmBwufWJD4olRnj/dbbs1tiWtwprLn
 cJsA==
X-Gm-Message-State: AOAM533FFJTSxlC3jkZINwPlkjQRz54mdLLVDwVgC/9tZWYfW77v5Kat
 gMgUZwX0Lv5M7W3XhaB90cSHD8NW3Lyajg==
X-Google-Smtp-Source: ABdhPJzHf/4gzrYRnPJY/K4mGBBnghwumE8MMUWC9JFIzRy8Ug/KLlzMDhq7OFs2WUObdyyRIW5MhA==
X-Received: by 2002:ab0:2801:: with SMTP id w1mr926800uap.135.1639747542294;
 Fri, 17 Dec 2021 05:25:42 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com.
 [209.85.222.48])
 by smtp.gmail.com with ESMTPSA id j19sm1768020vka.4.2021.12.17.05.25.40
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 05:25:40 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a14so4405449uak.0
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 05:25:40 -0800 (PST)
X-Received: by 2002:a05:6102:e10:: with SMTP id
 o16mr1015811vst.5.1639747540015; 
 Fri, 17 Dec 2021 05:25:40 -0800 (PST)
MIME-Version: 1.0
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-5-conor.dooley@microchip.com>
In-Reply-To: <20211217093325.30612-5-conor.dooley@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Dec 2021 14:25:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXf-nLGXbxwSZJQncdNXaD4_3bHwcb7WyxeYUw21eGX+g@mail.gmail.com>
Message-ID: <CAMuHMdXf-nLGXbxwSZJQncdNXaD4_3bHwcb7WyxeYUw21eGX+g@mail.gmail.com>
Subject: Re: [PATCH v2 04/17] mailbox: change mailbox-mpfs compatible string
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
X-CRM114-CacheID: sfid-20211217_052544_078121_F1733BF1 
X-CRM114-Status: GOOD (  20.96  )
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

On Fri, Dec 17, 2021 at 10:32 AM <conor.dooley@microchip.com> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The Polarfire SoC is currently using two different compatible string
> prefixes. Fix this by changing "polarfire-soc-*" strings to "mpfs-*" in
> its system controller in order to match the compatible string used in
> the soc binding and device tree.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
