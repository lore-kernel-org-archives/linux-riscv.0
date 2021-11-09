Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26187C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 13:11:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E049661175
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 13:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E049661175
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sXwPl23p3zNmLvQ3ALfTF0lwet8lvG5Ww5DBDCalmE8=; b=hXjmvx8myUdpId
	WUdH2fMwDG7JjJP5BKCctbgpRbjlwjlyEL6Rd6tSYQqpxGsTrE1OrOARm1mOYg+doYUDnvei/lHSR
	T3Lza8ss58n01kt64KUExlqNwH27Or6XOS02L7sOBqv9/HEpUapmlbLe76ECDyW283rkKJPAFogE8
	sDZvEUCjYppz2GBd2XpEEuCcAYZ8S6nY62aFnL9x9sNadafyEUYB3XMruDoAW9m95rcZRdI4eSt6R
	dLBmAp4NFVUfRpCg/pGSkMlWM/eXwPZLxi0H7f44NMqBN9gGdY1S+d5EJqEvVE/OGFtIsPHfRRXtT
	DqbZFIEvXm+LZvL45r+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkQtv-002HRH-Qq; Tue, 09 Nov 2021 13:10:59 +0000
Received: from mail-ua1-f52.google.com ([209.85.222.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkQts-002HP1-8k
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 13:10:58 +0000
Received: by mail-ua1-f52.google.com with SMTP id b17so38417216uas.0
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 05:10:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vgpOPNVaeGpR0Ki0HulbC5z3/SLOjosZPp/hdlc7Fb8=;
 b=SK/c29FtKevXVfIr4tYj058DhjrkrF0Zt/OK2b93aBi9o+SGkaSmUrpd0TOua279Jv
 kkF6c6aPZb5GZ6isMqdPHt9RoqYcbrzJHoftHvTnPtZOSmFpwy+B6NoDhcsdIU91Tliv
 QMB7tOlKTBKRsFt+7/atetWs4hDjpuR5wryAyTOfLPjhH8WKZw0QI9NnYcrT/RExEsxc
 8USyuao9NA9b2iaah13ONYwO+tA4hW1euiDoZmmUwgo/TVI7yVQG73zX9uJcCDUY2osZ
 frYlMmhQ01dxYUU23PyfpmJEUYEkcBOTZ84BwwY4xF5q443sb0juQ4x2ml2DquLw8Z7N
 Yezg==
X-Gm-Message-State: AOAM530SDPbweDnYjrjItnLS3SeVFfPTxiKC0Ft0KBklCwUgoPfsEKUf
 Gi7biUrQeIDwsu78tRCgcjb32IDUnuAtsA==
X-Google-Smtp-Source: ABdhPJy72YXtQiHI81KC6wZ8JYeweUV8+ruEOMzDducfD/GTjaE1otF/DL9OSKgfT5WZEPeWnefotA==
X-Received: by 2002:a9f:2c98:: with SMTP id w24mr9984697uaj.89.1636463454703; 
 Tue, 09 Nov 2021 05:10:54 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com.
 [209.85.222.41])
 by smtp.gmail.com with ESMTPSA id m4sm3215651vkk.18.2021.11.09.05.10.54
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 05:10:54 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id az37so38366874uab.13
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 05:10:54 -0800 (PST)
X-Received: by 2002:a05:6102:3a07:: with SMTP id
 b7mr87197501vsu.35.1636463097035; 
 Tue, 09 Nov 2021 05:04:57 -0800 (PST)
MIME-Version: 1.0
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-5-conor.dooley@microchip.com>
 <CAMuHMdX1Xm9CP2hSpkD4ApVJ8gC_ZAE1L5CT0zjF+b5An4kmqw@mail.gmail.com>
 <198eaf69-8f85-50a7-192e-5900776d044b@microchip.com>
In-Reply-To: <198eaf69-8f85-50a7-192e-5900776d044b@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Nov 2021 14:04:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUs7UnADr2SfHBD4sGs3_giR0cmXnz=6qa4iAP1reDtgA@mail.gmail.com>
Message-ID: <CAMuHMdUs7UnADr2SfHBD4sGs3_giR0cmXnz=6qa4iAP1reDtgA@mail.gmail.com>
Subject: Re: [PATCH 04/13] dt-bindings: riscv: update microchip polarfire binds
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Mark Brown <broonie@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
 Lewis Hanly <Lewis.Hanly@microchip.com>, Daire.McNamara@microchip.com, 
 Atish Patra <atish.patra@wdc.com>, Ivan.Griffin@microchip.com, 
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
X-CRM114-CacheID: sfid-20211109_051056_339929_EB038E84 
X-CRM114-Status: GOOD (  24.81  )
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

On Tue, Nov 9, 2021 at 1:08 PM <Conor.Dooley@microchip.com> wrote:
> On 09/11/2021 08:34, Geert Uytterhoeven wrote:
> > On Mon, Nov 8, 2021 at 4:06 PM <conor.dooley@microchip.com> wrote:
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> Add mpfs-soc to clear undocumented binding warning
> >>
> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

> >> --- a/Documentation/devicetree/bindings/riscv/microchip.yaml
> >> +++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
> >> @@ -21,6 +21,7 @@ properties:
> >>         - enum:
> >>             - microchip,mpfs-icicle-kit
> >>         - const: microchip,mpfs
> >> +      - const: microchip,mpfs-soc
> >
> > Doesn't the "s" in "mpfs" already stand for "soc"?
> not wrong, but using mpf-soc would be confusing since "mpf" is the part
> name for the non soc fpga. is it fine to just reuse "mpfs" for the dtsi
> overall compatible and for the soc subsection?

I really meant: what is the difference between "microchip,mpfs" and
"microchip,mpfs-soc"? Can't you just use the former?

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
