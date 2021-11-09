Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9916C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 08:40:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77A42611C4
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 08:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77A42611C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Kt0mM6nOrj5+zH69LtwGeqTerfChTQnhRjqW7qSqDM=; b=yr3T8N2c9v84lL
	SqMnx9OpTdMRZhK4MpOGk12aZ5buWQitt4Dk8oemPWRezHpAjwkULfrJ4RltCObleNFbHxLLCdIdF
	5cOtWSSkoZ9WOMrRYtX5cg8XGk4qqMT5gs53QXUKZPoSysIhrx4yQ1YxZ233zQWwqMAeC07LkBnrI
	x//y7NQUtiH946w11I2K6ArrYIjPePZtmce/U7HpDAkMNTmo5mPgped+xY+RL5rBxRrdwKkU8TgZr
	/CdCZPeC6ojZhPLN5D4jtNs0vZapCsx5GTnKMR21vjTfUoJwSvdMHZY59QZRB3BOAW1Kr4hSXGGW8
	axRI/sqishB6ohpRa6NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkMfo-0013Or-Fp; Tue, 09 Nov 2021 08:40:08 +0000
Received: from mail-ua1-f54.google.com ([209.85.222.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkMah-001220-Kp
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 08:34:53 +0000
Received: by mail-ua1-f54.google.com with SMTP id s13so21484633uaj.11
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 00:34:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AeQsRqY/GskMz/vOm4ldxuS7JHiWlKXTjA+Am1FlP0g=;
 b=QVR1QKQRv/QqUHnBsW3L3rD6QK+M5591cFCXMxZorLwFvj+z36H7VQPUb+qCAffohU
 u8HIQvrIUaideKJcUY6ksDK9o5OTMr18/UReOoRvnPm7I4w7HSxOMVUg1r9h5lfrGXDt
 /FlX+j4nO1xMrFINvBxGlxwLaVeUIiC3oLX4ASRuDOFDclIG7RCt4kJD+qpMmcIgr0Xy
 VdeD0kWX8JgnYbc+UvNyU+uPczEYrnOaG2shtiUg29wC5QkBcBo3WJVvYVeud8OQmOEZ
 taad/SjiHVSfLw+uiWpT/99buRQwLF96wOhObfSad9SZnUQ2v4E3OvyK7iqSJOCQscSR
 UhHA==
X-Gm-Message-State: AOAM533yApfhkEhirqFfbp2NaVHEDkAAGpUrZqmM9JHcvnWtNJFyksRb
 7mf5xINsLnz0cgfVuL8mTNLwSjAMmypfKERQ
X-Google-Smtp-Source: ABdhPJxpi9W08OtZ6EjITr9NWeOBbmRVJpTA4BzPBJuHIeuy5zIe7syNr2ZOTqphJQqbKdD0miD0HQ==
X-Received: by 2002:a9f:2c9a:: with SMTP id w26mr7749934uaj.120.1636446889805; 
 Tue, 09 Nov 2021 00:34:49 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43])
 by smtp.gmail.com with ESMTPSA id t12sm2966677vkk.52.2021.11.09.00.34.49
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 00:34:49 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id i6so36969558uae.6
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 00:34:49 -0800 (PST)
X-Received: by 2002:a9f:2584:: with SMTP id 4mr7741221uaf.114.1636446888895;
 Tue, 09 Nov 2021 00:34:48 -0800 (PST)
MIME-Version: 1.0
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-5-conor.dooley@microchip.com>
In-Reply-To: <20211108150554.4457-5-conor.dooley@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Nov 2021 09:34:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX1Xm9CP2hSpkD4ApVJ8gC_ZAE1L5CT0zjF+b5An4kmqw@mail.gmail.com>
Message-ID: <CAMuHMdX1Xm9CP2hSpkD4ApVJ8gC_ZAE1L5CT0zjF+b5An4kmqw@mail.gmail.com>
Subject: Re: [PATCH 04/13] dt-bindings: riscv: update microchip polarfire binds
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
X-CRM114-CacheID: sfid-20211109_003451_716413_8B4BC2BC 
X-CRM114-Status: GOOD (  23.40  )
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
> Add mpfs-soc to clear undocumented binding warning
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/riscv/microchip.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
> index 3f981e897126..1ff7a5224bbc 100644
> --- a/Documentation/devicetree/bindings/riscv/microchip.yaml
> +++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
> @@ -21,6 +21,7 @@ properties:
>        - enum:
>            - microchip,mpfs-icicle-kit
>        - const: microchip,mpfs
> +      - const: microchip,mpfs-soc

Doesn't the "s" in "mpfs" already stand for "soc"?

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
