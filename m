Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE15C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Feb 2022 11:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aRHlLG1XR0QrwjF13e9hA1pp8a7WPcD9U7D3mUV/KoI=; b=0u/aEX8zKmmUXB
	JR0c7qyn0i3AGQNqlK1xNWw+8LRnzRUiuVIK8r7F9OeiZCQ5KqNtyIfJ43r++RNYXEyS/5TGfFQjn
	a/zMENajhKWSqbj/UkcWCHsO3x8+GD1Wf8QJuY8xITEiqTZnJcFLCf4gy+I6Wt0RudGgdTdxFKVQW
	l0z4NgHZQQx21YdJ3NZDkDmTnrCw0/fd0DsyfpYUK/Y1p+1EStV8HlgDrcYieA8RY5E7Xyz7uivYN
	W6IpIgWGpTmQINOOdgicUm5fqWtytFXqSPjgLXQoH0jxe0E95POynh37y9Nndmua3f5qJCV7PG/6v
	jNcB3oWy+thVxJS8yMPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHONP-00DWBb-3y; Tue, 08 Feb 2022 11:09:39 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHONM-00DWAH-NU
 for linux-riscv@lists.infradead.org; Tue, 08 Feb 2022 11:09:37 +0000
Received: by mail-ed1-x535.google.com with SMTP id m11so36666125edi.13
 for <linux-riscv@lists.infradead.org>; Tue, 08 Feb 2022 03:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KQBVfVDlvCSrk6Sswzhkfx8sEJDxZvcBw31v7IjCtFQ=;
 b=Zcfv+t1DGD3EB3HP5kz6zWh1pByYKpIDp3Q8enYRVXu63AQLAzCQugZ4SoXjF7MtVL
 wPoRzOO0w7TcQorumE2LF1RehZcto52dZVQic+Oml3gV3bdUn5exQP5qlieY7VK772IB
 899VBZDJodq3ijB1E4fvyfVsqH5Yv4Wvfw9r+FwTxvKuN0Gv9NsxgyWrCWSqhTgUcvlA
 SsUtmMsqfSbJdRCSSPqUcEhsTh85nK2hsyj/xSZL1PKB+kbu1sc+t0jMHQvCn4lcflc5
 LXdfZb+JZrjoX0m2iXKT7sAVVRTIwqpSlqCbqvYB+7glzzi2eSDHj+aHnj1g5e8Z9v1g
 LvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KQBVfVDlvCSrk6Sswzhkfx8sEJDxZvcBw31v7IjCtFQ=;
 b=pYWvf1D3eqro/18FU90I/j69y+olR2ImRRPtz+rkUkdRy62tn1tGhLCciSRwhSynXO
 hc/ulPgDybW92ITo6+BGXW3ctTCy0RE49jHFM1uIaChw1pJJVZOX0j/K8ATSZXEahUEb
 0LPRQaqMiBjgzhw29j1k9O6YCW9RtTAXv1PqRZ/30es4RRZnYZn9sS3YuXlNrKhKpu8S
 heW5kA7O3YAJolvAfJSZXGFgS8BVmJi6/HW/zC72ERJOK3EQL/QjnTZgu/YtJb6NPvgs
 Y/yiqdmPAQJGbTXwW6qqX9H6QFdaefno15kB8AikM/fM15lHVhl6C+3ls0D8osRLhZs+
 6MyA==
X-Gm-Message-State: AOAM532GhPun+psVWlw+qZfn63FP0Se8d0q4bKZP7v1TYNR/tUNCk1tg
 2qCLOGxlGU5sMJiEi6nief6yLWQ9ZYxcUJ7CQMfkBQ==
X-Google-Smtp-Source: ABdhPJzNCw/cioLcKrAYx5rbKSd05oiNHfv+p2Mg5ic+HSw2d1l/HVOQ3hTWmd+vsyuosiASrLQGqbIOMPkET3fjF+c=
X-Received: by 2002:a05:6402:5189:: with SMTP id
 q9mr3959045edd.314.1644318575241; 
 Tue, 08 Feb 2022 03:09:35 -0800 (PST)
MIME-Version: 1.0
References: <20220207162637.1658677-1-conor.dooley@microchip.com>
 <20220207162637.1658677-6-conor.dooley@microchip.com>
In-Reply-To: <20220207162637.1658677-6-conor.dooley@microchip.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Feb 2022 12:09:24 +0100
Message-ID: <CAMRc=Mc0CYCgiGqQgmCQArv=1P0M5dxCw53H+KQ92d=yX=BY4Q@mail.gmail.com>
Subject: Re: [PATCH v6 05/12] dt-bindings: gpio: add bindings for microchip
 mpfs gpio
To: conor.dooley@microchip.com
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Lee Jones <lee.jones@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-i2c <linux-i2c@vger.kernel.org>, 
 "open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>, 
 "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 linux-riscv@lists.infradead.org, 
 bin.meng@windriver.com, Heiko Stuebner <heiko@sntech.de>,
 lewis.hanly@microchip.com, 
 daire.mcnamara@microchip.com, ivan.griffin@microchip.com, atishp@rivosinc.com, 
 Rob Herring <robh@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_030936_787640_24BEE597 
X-CRM114-Status: GOOD (  10.20  )
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

On Mon, Feb 7, 2022 at 5:24 PM <conor.dooley@microchip.com> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Add device tree bindings for the gpio controller on
> the Microchip PolarFire SoC.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---

Looks good.

Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
