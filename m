Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80B7C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jan 2022 15:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xiKK0w6au+QTdRi/FwBSEMagRyedLI7zj6j6U3un4JM=; b=KXc7yQtWLIGmVR
	Afdk91RsQuNUYXft/BuNh/PPsDT5i/gMvXRhb7d3cOm3QBjpp+sNxbQwdDedBGMT6aaN63IcC6wCy
	ni6gWf4mKFhE4TwWmJ4ErDT4/nMx7H8MczGgZt8cOYHEZe42phnqthS8ktSu/wJlgA2ZsXzBkiDgG
	OX8QLZJnOSgGtf9EON4rLFN0jvpecKHc6VDx/Z46NRY8cZcAuT6oTQGMe2C0tUr5POyAZhMZKA8Z2
	6x9hNzv1YqIgTGutHP3+JK/BrRLLYzTyXuBMK3UdpQw27oilweCfwvh1A4gcbyBE+KJNnLeFqfhd9
	nQzvRa4/l/pdR3qbT7qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8Onl-009eLt-WD; Fri, 14 Jan 2022 15:47:42 +0000
Received: from mail-qt1-f172.google.com ([209.85.160.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8Onj-009eL5-4p
 for linux-riscv@lists.infradead.org; Fri, 14 Jan 2022 15:47:40 +0000
Received: by mail-qt1-f172.google.com with SMTP id x8so5033052qta.12
 for <linux-riscv@lists.infradead.org>; Fri, 14 Jan 2022 07:47:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5dzA66i4ivAiYOjfo8oco9UtNpMipS0k8jsB20XDEr0=;
 b=ubVr6GvcPwd6V22JmS1atInznPOX7DSsdfqSOXNL+uNj8Y52Ivttc02YkM5k9jyRFA
 kNdILHpOb0E5sdu+Vuq7zh0EXnNfPBP47+Suc2gzVdVZO3kGRcbCgN4i9aWR0CiyqCks
 HH58G5P6/ZT6CBUDWyFvJ/5zsLAc9Wjox0KqnIOycJHQ/mAnvf6NMuSvVkYq7s30Urx+
 7f0xePR9JS6K3bgDlSPK/t6kl9mtMfBgv836mnWB7jBChX5SmL9EZJI88fU88js4EKB3
 0HvZ/O84Y+7tHQewsqmhUtvS6FjhbQwEUw+7s4YfgDtj9si2yMksHjMa283mWXA+5gyr
 +zrw==
X-Gm-Message-State: AOAM531t72/zpnPHcXSc7QqPtUbek96h29+DX+azzgNA+ImqY4S8Wx3T
 voMGl/jVBWbGnKFUOiYQoqALPKbtEs05DOJs
X-Google-Smtp-Source: ABdhPJzooIy9IedouZ7vsumcr2QiKZ7y52jSSbdwPri31VSF6ZRzSRLIuHyZM9C1w2EwiMFIJ1sj6A==
X-Received: by 2002:ac8:5f84:: with SMTP id j4mr8182026qta.170.1642175257519; 
 Fri, 14 Jan 2022 07:47:37 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182])
 by smtp.gmail.com with ESMTPSA id t9sm4256136qtw.48.2022.01.14.07.47.37
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 07:47:37 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id v186so25026037ybg.1
 for <linux-riscv@lists.infradead.org>; Fri, 14 Jan 2022 07:47:37 -0800 (PST)
X-Received: by 2002:ab0:4d42:: with SMTP id k2mr2650964uag.78.1642174814894;
 Fri, 14 Jan 2022 07:40:14 -0800 (PST)
MIME-Version: 1.0
References: <20220114151727.2319915-1-conor.dooley@microchip.com>
 <20220114151727.2319915-4-conor.dooley@microchip.com>
In-Reply-To: <20220114151727.2319915-4-conor.dooley@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Jan 2022 16:40:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUXD8CHqoaygXzcC0YpsbRT_KAUni1hD4sMn=k=WD+DuQ@mail.gmail.com>
Message-ID: <CAMuHMdUXD8CHqoaygXzcC0YpsbRT_KAUni1hD4sMn=k=WD+DuQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/15] mailbox: change mailbox-mpfs compatible string
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
 Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_074739_264363_85C1B3ED 
X-CRM114-Status: GOOD (  21.59  )
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

On Fri, Jan 14, 2022 at 4:16 PM <conor.dooley@microchip.com> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The Polarfire SoC is currently using two different compatible string
> prefixes. Fix this by changing "polarfire-soc-*" strings to "mpfs-*" in
> its system controller in order to match the compatible string used in
> the soc binding and device tree.
>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

This is already upstream, commit f10b1fc0161cd99e ("mailbox: change
mailbox-mpfs compatible string").

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
