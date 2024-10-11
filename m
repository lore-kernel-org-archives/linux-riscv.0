Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5D7D0EE17
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 16:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bo2YL6lB7LjLT6/WyeTzLhGTxF6sCb6WvUC/OGxNjmA=; b=RgvNz6ayqFGacP
	YsOhJZGMydCbgB7KzgmxaXTIFSXRv0WA7YhHeywGh2qBe7iHYKw7xw8k6c1vfo6OYPicvTpfWOrSC
	eV6xzV61i2ecX0vZ/G6afjLiF37XQQNRehOEts9gqbiNax0f8fwitgnfePDdWfJIgfgiy6wXsenbP
	axjGLPHIxhH/ktCI2nARZ5qIg3V+p31oAFyIAwzSBA5RUgrZ7IqRedAP/6+xlYeJC4Hjsmy0gtaYM
	SAF38okjRs76PbUOnVmSn3KBdUgRK70Pe1y4mdEPvSV34cZZniaOpP+GsLA7P/OahOcLXH+LR3/18
	XNzzGAF2nTFXoFMexUPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szIdJ-0000000Gyzh-0qcQ;
	Fri, 11 Oct 2024 16:36:53 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szIbv-0000000Gyhq-3bDp
	for linux-riscv@lists.infradead.org;
	Fri, 11 Oct 2024 16:35:30 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2e06acff261so1544648a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 11 Oct 2024 09:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728664527; x=1729269327; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TmThUYkOTDaIhgghepZ/G5vDjgtJ1yvPAxuWgnKKjgg=;
        b=aU1AlWI6GhCzVP11cbJxqmlaPhOfRGT8sPkrT3u4axnh3vkpXrtseBYXaxx/0sf89x
         vs7ZnRkax1qEfmDbDTt3suU8axTcfy5KYvd6L+icinpvFS6yHOStWyNlTTZGARYS8Om7
         mF7rYsbco0NfZyWyVBuYNkQmwTRx528PKiynrERU0o/YNwxtIXEBHkLWMhkOR2+j221g
         J61Gh0r8Liy0fD19JhQvpWjZz2TZpAftDzeVuW02H6SQ5q+pwx3FJ9FsLw2A8WZgvtgZ
         TC3UD1tX3nEfcAoqnT7O6y3fxpK062AAACIwIaR/BuoEmmvMQXAJ8UA7sGB6hEJ+nJtQ
         VQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728664527; x=1729269327;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TmThUYkOTDaIhgghepZ/G5vDjgtJ1yvPAxuWgnKKjgg=;
        b=N5wAsCboeNlkV+QXpxc423oZRcza3pciOxmZjZcrghXs43VE07UgK7eaZRqmXx36SN
         nAFjdVPUSwtZWgQwYuShp/bl91yFMzUNd8BRd37lEGfUKlh/w494m3svudgf+obzWvsi
         qdRoXNCFUVsJ1YAEgc8OCgP9RXmnnmqZeGS3WfFcc7SzQE6F0vIHPEPkHEdotAwXgPxr
         Yg5hWcy/bOJd2fIr7pfoQRp7nVk5cwM7QWOcMEhEwArAA+bw09ysxNmSFjMvhmwZHKZA
         09IoUnjS7OUkWg+ZPaDO1X+S2KEZNwocHePKgZ/H/n5msuuq01idGW3wbNr7uoWClvok
         waKA==
X-Forwarded-Encrypted: i=1; AJvYcCWWGHakxgUPWhKZjUelJZF55JGJa1/LrwNQtDMHhRNwGvYvUXSPHEg8K30WrZfKfPah/v2HKALifoszlA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBHRy/1pPY6DlA3Lm0tlezy8a/10oq4U+yxB6H2bMJfh47rzKA
	FrVCWfwTIKQ7MsTkjHLi/Ekjy4xnRtLTpAFKmSsTQktwnqH/PSS2Cpu4AkZPYRM=
X-Google-Smtp-Source: AGHT+IGLIOSThxWqsd5665YVQNbI9JkSuYl+8F50zeEjp5XfPQiX8r4yeY1njTehNjbi8gl5qYZD8A==
X-Received: by 2002:a17:90a:d815:b0:2e2:e086:f550 with SMTP id 98e67ed59e1d1-2e2f0af2ee3mr4374574a91.21.1728664526828;
        Fri, 11 Oct 2024 09:35:26 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2d5c99db3sm3415093a91.0.2024.10.11.09.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 09:35:26 -0700 (PDT)
Date: Fri, 11 Oct 2024 09:35:25 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: Re: [PATCH v1 3/3] pinctrl: th1520: Factor out casts
Message-ID: <ZwlTzbsiyr8994S+@x1>
References: <20241011144826.381104-1-emil.renner.berthing@canonical.com>
 <20241011144826.381104-4-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241011144826.381104-4-emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_093527_943095_DC4648B8 
X-CRM114-Status: GOOD (  19.71  )
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

On Fri, Oct 11, 2024 at 04:48:25PM +0200, Emil Renner Berthing wrote:
> Limit the casts to get the mux data and flags from the driver data
> pointer with each pin to two inline functions as requested by Andy
> during review.
> 
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
>  drivers/pinctrl/pinctrl-th1520.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
> index 8bd40cb2f013..7474d8da32f9 100644
> --- a/drivers/pinctrl/pinctrl-th1520.c
> +++ b/drivers/pinctrl/pinctrl-th1520.c
> @@ -152,6 +152,16 @@ static enum th1520_muxtype th1520_muxtype_get(const char *str)
>  		(TH1520_MUX_##m0 <<  0) | (TH1520_MUX_##m1 <<  5) | (TH1520_MUX_##m2 << 10) | \
>  		(TH1520_MUX_##m3 << 15) | (TH1520_MUX_##m4 << 20) | (TH1520_MUX_##m5 << 25)) }
>  
> +static unsigned long th1520_pad_muxdata(void *drv_data)
> +{
> +	return (uintptr_t)drv_data & TH1520_PAD_MUXDATA;
> +}
> +
> +static bool th1520_pad_no_padcfg(void *drv_data)
> +{
> +	return (uintptr_t)drv_data & TH1520_PAD_NO_PADCFG;
> +}
> +
>  static const struct pinctrl_pin_desc th1520_group1_pins[] = {
>  	TH1520_PAD(0,  OSC_CLK_IN,    ____, ____, ____, ____, ____, ____, TH1520_PAD_NO_PADCFG),
>  	TH1520_PAD(1,  OSC_CLK_OUT,   ____, ____, ____, ____, ____, ____, TH1520_PAD_NO_PADCFG),
> @@ -590,7 +600,7 @@ static int th1520_pinconf_get(struct pinctrl_dev *pctldev,
>  	u32 value;
>  	u32 arg;
>  
> -	if ((uintptr_t)desc->drv_data & TH1520_PAD_NO_PADCFG)
> +	if (th1520_pad_no_padcfg(desc->drv_data))
>  		return -ENOTSUPP;
>  
>  	value = readl_relaxed(th1520_padcfg(thp, pin));
> @@ -660,7 +670,7 @@ static int th1520_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
>  	unsigned int i;
>  	u16 mask, value;
>  
> -	if ((uintptr_t)desc->drv_data & TH1520_PAD_NO_PADCFG)
> +	if (th1520_pad_no_padcfg(desc->drv_data))
>  		return -ENOTSUPP;
>  
>  	mask = 0;
> @@ -793,12 +803,14 @@ static int th1520_pinmux_set_mux(struct pinctrl_dev *pctldev,
>  {
>  	struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
>  	const struct function_desc *func = pinmux_generic_get_function(pctldev, fsel);
> +	enum th1520_muxtype muxtype = (uintptr_t)func->data;
>  
>  	if (!func)
>  		return -EINVAL;
> +
>  	return th1520_pinmux_set(thp, thp->desc.pins[gsel].number,
> -				 (uintptr_t)thp->desc.pins[gsel].drv_data & TH1520_PAD_MUXDATA,
> -				 (uintptr_t)func->data);
> +				 th1520_pad_muxdata(thp->desc.pins[gsel].drv_data),
> +				 muxtype);
>  }
>  
>  static int th1520_gpio_request_enable(struct pinctrl_dev *pctldev,
> @@ -809,7 +821,7 @@ static int th1520_gpio_request_enable(struct pinctrl_dev *pctldev,
>  	const struct pin_desc *desc = pin_desc_get(pctldev, offset);
>  
>  	return th1520_pinmux_set(thp, offset,
> -				 (uintptr_t)desc->drv_data & TH1520_PAD_MUXDATA,
> +				 th1520_pad_muxdata(desc->drv_data),
>  				 TH1520_MUX_GPIO);
>  }
>  
> -- 
> 2.43.0
> 

Reviewed-by: Drew Fustini <dfustini@tenstorrent.com>

Thanks for improving this. I see the feedback from Andy [1] on your v2
now that you mention it.

-Drew

[1] https://lore.kernel.org/linux-gpio/Zj8K_0zpI_IAY66R@surfacebook.localdomain/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
