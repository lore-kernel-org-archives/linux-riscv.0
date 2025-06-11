Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE93C71135
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 23:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G7bJRpeSyi8LG/tPgB8MTRPCyAT7cX7x5WGF/8kPRj4=; b=aV3b/XusY6IoV9
	rckF9fx4kklFY1QAptOYYs3Pg/zWphr271FTD6RFuWuhBF9T7pMNnKe5G4Q5LmITbh669spKCZ9Sw
	cBkLSY4m44PMin2DLaAbGmU6GVk1qPZiqm9x/pkDJ0/njDs+lNhX0Ab3Oxv2QKiJAFgLLM8cIVHNx
	SsB11k0aj2Wmvgs4GM1C6yBCQKc6VNPvZIRCJe9uf2GwBXILWTyfs9+5DEflePVgvtPuzCmisXTxK
	IJg8bDHvdZNOYC2s+y8MY8l3morvW0uSr42CD+6bRDBw4KUqWlOyyU9Ki3yto+H/q0s1U3faj1GJ6
	pmIQB1Qpl/xsNIfI/TEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUZP-0000000BdiX-3iqV;
	Wed, 11 Jun 2025 23:09:23 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPTpj-0000000BSpd-13OV
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 22:22:13 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-313a001d781so349659a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 15:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1749680530; x=1750285330; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hECvCp2144ISjYFuCPwHbO2eSKNwdlu+MMKqmQG6JC0=;
        b=AVQt/eb2qo+osQdMKinjBSq6lDeTaq9epgR8Dl9bvhoBnLcwfA0vzN5jHBBJ0RYAqN
         6Cirmx/0o7fNdWhel6I+nHOGf/46w5JEitbcZh5JjXeF8I08XyU6bvzNKqVLxD2P5VQ6
         VwXSOdhwTzrS6aAEanjdqVBe/bg5Ja5XoTm2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749680530; x=1750285330;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hECvCp2144ISjYFuCPwHbO2eSKNwdlu+MMKqmQG6JC0=;
        b=B9i9E6rJALhLs/WJvQsxr+1xLJ+f+mBmzNO9qiw3cCcGD/G0cQpWFN8kTpXsxpq5QB
         9fpjgQjl+K9t/BIJ00yhBD+FeP0u9SLvjyAVVc2jV54nGyCoIf0eRzH3X1psn2CuLnUj
         aLreyyUHJ6JRjlutT4IkX5SHnkLIF9Uo5pzIpS287rFghJYq9K1ZwyNB4sgF8QYG4o06
         9eksom0YWxtuUtxYINZYbk8b4tjS0yzPBkgIm6VHeX9oRctchmPIwyt03FoYqSTS28yI
         wdJHwp5r371EBdPIOZjQFSrNsBsEWy1Cqbr8bmsOi7pMuD1N3CkDjgdXdraqKxtBohcc
         mEZw==
X-Forwarded-Encrypted: i=1; AJvYcCXqnsYFvW0JEkl8pElgZg+s8e5TPR00cYnzWYKQ6vdtZC6D23oVO1rgie2HIWDGP4yuqoxAxqjo78gKUg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzR/0k0oHKHTNdg2Hd5dk34S9JFqg/wRcWlb661+GizfcmiA3qT
	3XojUC7oOPaobyTvNJURg/FUIV0InoLSeV2TAZSuEkRHK3stPm/wL2/zLUJDTIsufZprACDAXYq
	epBI9N13sGInMihZg7t/JQ8nsSyB6Icz8yzT0avrzNQ==
X-Gm-Gg: ASbGncsprjEyOcvO+93wEAh0DyJ/JTnkeIsHYrLdqS2RB/7nZyk7SHduz+FbuD7AxJE
	5aF8FdnqvaIrIYYRY7VyuMXA+G+i+9sR855115jAZ8rvSop65/NoMxpPakGbRcfkn7IhbiV/xLO
	uHtfqhs2M7EVLjGjaaR7ZzQqP6xVrcGVoUKHx/Si68gtXdZfxvd+a5K4xsDTmEebqIFpseZG3MD
	/tp
X-Google-Smtp-Source: AGHT+IE8FknUC40PscBGYY7OPNelZLLkTFE7qxHwumbpWqTQtgyRPt7nCSuQoA+6xvyngwoaYT3v2ByQ5TtYzKrW9d8=
X-Received: by 2002:a17:90b:2892:b0:312:26d9:d5b6 with SMTP id
 98e67ed59e1d1-313bfba12a1mr1389789a91.3.1749680529907; Wed, 11 Jun 2025
 15:22:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org> <20250610-gpiochip-set-rv-gpio-v1-7-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-7-3a9a3c1472ff@linaro.org>
From: Daniel Palmer <daniel@thingy.jp>
Date: Thu, 12 Jun 2025 07:21:56 +0900
X-Gm-Features: AX0GCFuAPMzR2tj8IuIF1_MflSdk31p_mu_qD7qQzgmBFTWEvU6XX8YEN4mo1dI
Message-ID: <CAFr9PXmeYETV5FSAnEacFCo7LiS3cYBpPqraexLC7=MTzshfNg@mail.gmail.com>
Subject: Re: [PATCH 07/12] gpio: msc313: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Romain Perier <romain.perier@gmail.com>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Grygorii Strashko <grygorii.strashko@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_152211_488595_37C385AC 
X-CRM114-Status: GOOD (  18.47  )
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

Hi Bartosz,

On Tue, 10 Jun 2025 at 21:33, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpio-msc313.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-msc313.c b/drivers/gpio/gpio-msc313.c
> index 6db9e469e0dc254e791d497b89a4c6d329d0add4..992339a89d19840fc03ccf849972a83cb86415ae 100644
> --- a/drivers/gpio/gpio-msc313.c
> +++ b/drivers/gpio/gpio-msc313.c
> @@ -486,7 +486,7 @@ struct msc313_gpio {
>         u8 *saved;
>  };
>
> -static void msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
> +static int msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
>  {
>         struct msc313_gpio *gpio = gpiochip_get_data(chip);
>         u8 gpioreg = readb_relaxed(gpio->base + gpio->gpio_data->offsets[offset]);
> @@ -497,6 +497,8 @@ static void msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int val
>                 gpioreg &= ~MSC313_GPIO_OUT;
>
>         writeb_relaxed(gpioreg, gpio->base + gpio->gpio_data->offsets[offset]);
> +
> +       return 0;
>  }
>
>  static int msc313_gpio_get(struct gpio_chip *chip, unsigned int offset)
> @@ -656,7 +658,7 @@ static int msc313_gpio_probe(struct platform_device *pdev)
>         gpiochip->direction_input = msc313_gpio_direction_input;
>         gpiochip->direction_output = msc313_gpio_direction_output;
>         gpiochip->get = msc313_gpio_get;
> -       gpiochip->set = msc313_gpio_set;
> +       gpiochip->set_rv = msc313_gpio_set;
>         gpiochip->base = -1;
>         gpiochip->ngpio = gpio->gpio_data->num;
>         gpiochip->names = gpio->gpio_data->names;
>
> --
> 2.48.1
>

Reviewed-by: Daniel Palmer <daniel@thingy.jp>

Cheers,

Daniel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
