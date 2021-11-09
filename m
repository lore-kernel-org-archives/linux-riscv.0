Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC30C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 08:34:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BA126115A
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 08:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3BA126115A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wu9/EF/5YnDQyczTcYxKsxWQEBqB/YZMA0yVHs8mAz0=; b=wUccuLBVcYcP3S
	Kno372Rt53uGKM3/B0cL7rgD+KxHYbDjMYBXESaZBsXa5Cl9fdq7aIHTPJHaLh0uDM0yJpvdfDUCH
	9IwxWxLZ574vSPcAM3n/IXNW3nTHNHXBB1Dp7W2H9R6dPXsTfQBZ9etACC1CuGiD+QVMgOjZfLjaq
	Sj083B0SN6vuRK0849piNz8ULHRXDFnhlqQrey2AE76BEcVrFyVmXraB2J9kNltGSuNf+ulsInOOd
	QkrWgasvnEUE2ufn9y6iLOEtL9T/ZR9hl1QPRkIJXUzksduA5Z9avKOLDKq8cXgcWgDGRdi8LvmzG
	TA6QCkB977Fje9HOD+sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkMZl-0011Xt-AK; Tue, 09 Nov 2021 08:33:53 +0000
Received: from mail-ua1-f52.google.com ([209.85.222.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkMZg-0011Tb-1e
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 08:33:49 +0000
Received: by mail-ua1-f52.google.com with SMTP id b17so37078207uas.0
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 00:33:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gSLDpPNAPTFpdKJNeNQhMNDuIXO+IuEe87YK9rCw7Wk=;
 b=6WXrUa1JzJwd9p6oFEJVmTWiHtl6w5EfECM5trEb/DGf7xtaWmhI9eBu6q/LmAADhd
 MnsSHr0KjM9CfwLcZINIhEDlq/YG6BizJ/fFFPukXbVd915mj+Ns93Yf7DVHBsPqhTby
 8+qfLmUoW9edNfy+d04E31tNJOj0z8nYVG9ot+P4Qllpd2tDGfluauLi+pgbuEoIrBDp
 ECA2pBmbQlpLZxtp28nYPR9SemHZSYPqgVmjI/iXvYT7/27gqFy7K36vA5wtrW4M5hQy
 1Q4BJ2tsqLElkm2m6W2L4bRDSF+N8ZMa8rs67BkfY24tS+k2hH7lYAlFTHsW5ZnmbJm3
 eDdw==
X-Gm-Message-State: AOAM531YEXuymzqNSd3xPq2L1mE/RXsohhK8/y2ZS5Bs46G8prKNnbxH
 WL3wCn1BfvhJbba0UgtgVPAkPu2buCfHUC6D
X-Google-Smtp-Source: ABdhPJymLq++7SefWNuK5RxpnURK828XFhzjSem6rTXJjxOMKCwqIBdtGr2IbrLRWMr/rqN89jpycg==
X-Received: by 2002:a05:6102:3912:: with SMTP id
 e18mr9592096vsu.36.1636446825265; 
 Tue, 09 Nov 2021 00:33:45 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com.
 [209.85.222.51])
 by smtp.gmail.com with ESMTPSA id 64sm3677568vsz.15.2021.11.09.00.33.44
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 00:33:44 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id l43so37009857uad.4
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 00:33:44 -0800 (PST)
X-Received: by 2002:a05:6102:e82:: with SMTP id
 l2mr9441005vst.37.1636446824427; 
 Tue, 09 Nov 2021 00:33:44 -0800 (PST)
MIME-Version: 1.0
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-4-conor.dooley@microchip.com>
In-Reply-To: <20211108150554.4457-4-conor.dooley@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Nov 2021 09:33:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVx9BgCYHX5-Bwx1TzQzNK1+7cUWoWnOdMX31SJ22sMzg@mail.gmail.com>
Message-ID: <CAMuHMdVx9BgCYHX5-Bwx1TzQzNK1+7cUWoWnOdMX31SJ22sMzg@mail.gmail.com>
Subject: Re: [PATCH 03/13] dt-bindings: soc/microchip: update sys ctrlr compat
 string
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Mark Brown <broonie@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
 Lewis Hanly <lewis.hanly@microchip.com>, daire.mcnamara@microchip.com, 
 Atish Patra <atish.patra@wdc.com>, ivan.griffin@microchip.com, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-rtc@vger.kernel.org, 
 linux-spi <linux-spi@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Bin Meng <bin.meng@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_003348_125766_5B46F138 
X-CRM114-Status: GOOD (  22.27  )
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

On Mon, Nov 8, 2021 at 4:06 PM <conor.dooley@microchip.com> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Update 'compatible' strings for system controller drivers to the
> approved Microchip name.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
> @@ -11,7 +11,9 @@ maintainers:
>
>  properties:
>    compatible:
> -    const: microchip,polarfire-soc-mailbox
> +    enum:
> +      - microchip,polarfire-soc-mailbox
> +      - microchip,mpfs-mailbox

Is there any point in keeping the old compatible value?
Are there any real users? Most of the MPFS upstream DT is still in flux.

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
