Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFD8D0D7BA
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 15:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v7xd1vmTYLWsXGIHEy6AEcA5Nq/AMYJaYF/w7KqK4qY=; b=Zcp2KA2SkB1i9+
	aBI4lfE1+6joTqE3PgOdMkNldjO6Z4H8GPPsXN1yRuafehV2FRO7wJPCEynPUk8MemeILF+u0l5wU
	k59hYJzixvqggjMVVlu5qsug6iP3xoq3lZsceQXzlWuK3RLwZZkdB6TpkS3K3Dt7WroCeZc2JawVN
	KsKkn7B2qx5NJRhvUz4jzSUmay7QUzA3vsnnJTjx0RaxkyVeft/97xIs5kLRT4DvqEPhOTxsDUiGB
	OhnhwrLIF5UFBsA2TbgdRORqbUkhSiYMrNKqseJfIHLK5Xn/V5RFbCgT8lS2/XiAjaYLAD+BG+Hwh
	s0lO6IuGsRutYKaz8RFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szHbv-0000000Go5b-3VUp;
	Fri, 11 Oct 2024 15:31:23 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szHaH-0000000Gnqz-3xli
	for linux-riscv@lists.infradead.org;
	Fri, 11 Oct 2024 15:29:43 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2e06acff261so1501408a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 11 Oct 2024 08:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728660581; x=1729265381; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OfEakMtjipcZbjXlN6+R0PDo0Z9g86WwST3PngXMQx0=;
        b=blUsXA5/V/8nmOIuX7MphndjOJ0C1O8QxwN4RXfjuVeHoJrN4IVaHnpmHMA8Ynrmya
         BhAth7VAHVBVPZDs8YEZxD7lkx6aHgJ4SYdFetU1P86ZcBV3TCyB98/i3sWJ3VN/Hk9G
         XPiJEZNKYaYlT/H/qUGSeS203RZrJ3GgJVQTmhkrdqOi/MU3rIog4IiHId96lkUm7gqp
         hh7EolizwxyVrbHw7AhMWMYZDw3WjO+WfHH34ggV8syoNk2//jBUODGbtg3H/aQeFvIC
         ZniGCwdsdAHeuEM2vWgHCfZORFgMUOEhgEp0Xb0F9zogu/94NdZtM02i83TDvDJY7sR4
         y12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728660581; x=1729265381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfEakMtjipcZbjXlN6+R0PDo0Z9g86WwST3PngXMQx0=;
        b=BJALwlCix9XqSXGV+vyGFSaaor4fiGIH+0ynMQ7isSDbSFggyC67YS7ko9B7YsN2K1
         pOPtcJM4PBwIg/o5TkPY1SyiulIZbOiyCvUU+qdWb2xavUzin4Gw80SZLdGSxXqzrSFt
         EVwaE16YXtyVJaJCyC9uakpTKotOr/9y67H10bdW1dSPvPFlKQaldnJNyi9aTccC8v5E
         NYWy2fgSGDFhKWQO6UH0+a0XHCEZvCX9XiI7NARzTZbTZuoLf9mcdBIFfAd1RfsCOlVY
         LVTxZPMQiX3CrvvNmKel7+9WXLhcRAOqFfLOGjYt3iXv6dVISu+izfJ/ieLj0+a4hpmR
         NpiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWoOiXtR4IogVVwzql92q8Kv4O2CHhk3CR0QiZN47kkoNxHhuSqpXOwN/S0sk8yvROlSJkB2z+6DZwkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyWeNiSbWkJWnf96eiMTHtxFUiolt5Qq8Oa0uKyOJkaekaKKMsH
	B155Eg7EZ8EMa/P8P7Qmi5AQuXztLO3YtFJ2DBg1EhpJkv7PaylhncC+ewyoZ9c=
X-Google-Smtp-Source: AGHT+IHgtz1x0nXARrJgLDPonSVb2k7CZhKElZ+N4WzyvXUVmzhbMekGN14tBxZaVtYhG/oDkXvWBQ==
X-Received: by 2002:a17:90b:4a08:b0:2c9:6a38:54e4 with SMTP id 98e67ed59e1d1-2e2f0dd81efmr3710515a91.41.1728660580594;
        Fri, 11 Oct 2024 08:29:40 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2d5eeafe8sm3361493a91.13.2024.10.11.08.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 08:29:40 -0700 (PDT)
Date: Fri, 11 Oct 2024 08:29:38 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: Re: [PATCH v1 1/3] pinctrl: th1520: Fix pinconf return values
Message-ID: <ZwlEYi/AFCTWVOl5@x1>
References: <20241011144826.381104-1-emil.renner.berthing@canonical.com>
 <20241011144826.381104-2-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241011144826.381104-2-emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_082942_079680_14A4E1CF 
X-CRM114-Status: GOOD (  17.72  )
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

On Fri, Oct 11, 2024 at 04:48:23PM +0200, Emil Renner Berthing wrote:
> When Drew took over the pinctrl driver he must have changed
> all the -ENOTSUPP returns into -EOPNOTSUPP. This subtle change
> was most likely not spotted because it was never mentioned in the
> changelog of the patchset, but it breaks all the places in the
> pin control and GPIO frameworks where -ENOTSUPP is expected.
> 
> Fixes: bed5cd6f8a98 ("pinctrl: Add driver for the T-Head TH1520 SoC")
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
>  drivers/pinctrl/pinctrl-th1520.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
> index c8d2ee6defa7..03326df69668 100644
> --- a/drivers/pinctrl/pinctrl-th1520.c
> +++ b/drivers/pinctrl/pinctrl-th1520.c
> @@ -591,7 +591,7 @@ static int th1520_pinconf_get(struct pinctrl_dev *pctldev,
>  	u32 arg;
>  
>  	if ((uintptr_t)desc->drv_data & TH1520_PAD_NO_PADCFG)
> -		return -EOPNOTSUPP;
> +		return -ENOTSUPP;
>  
>  	value = readl_relaxed(th1520_padcfg(thp, pin));
>  	value = (value >> th1520_padcfg_shift(pin)) & GENMASK(9, 0);
> @@ -636,7 +636,7 @@ static int th1520_pinconf_get(struct pinctrl_dev *pctldev,
>  		arg = enabled ? 1 : 0;
>  		break;
>  	default:
> -		return -EOPNOTSUPP;
> +		return -ENOTSUPP;
>  	}
>  
>  	*config = pinconf_to_config_packed(param, arg);
> @@ -661,7 +661,7 @@ static int th1520_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
>  	u16 mask, value;
>  
>  	if ((uintptr_t)desc->drv_data & TH1520_PAD_NO_PADCFG)
> -		return -EOPNOTSUPP;
> +		return -ENOTSUPP;
>  
>  	mask = 0;
>  	value = 0;
> @@ -676,14 +676,14 @@ static int th1520_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
>  			break;
>  		case PIN_CONFIG_BIAS_PULL_DOWN:
>  			if (arg == 0)
> -				return -EOPNOTSUPP;
> +				return -ENOTSUPP;
>  			mask |= TH1520_PADCFG_BIAS;
>  			value &= ~TH1520_PADCFG_BIAS;
>  			value |= TH1520_PADCFG_PE;
>  			break;
>  		case PIN_CONFIG_BIAS_PULL_UP:
>  			if (arg == 0)
> -				return -EOPNOTSUPP;
> +				return -ENOTSUPP;
>  			mask |= TH1520_PADCFG_BIAS;
>  			value &= ~TH1520_PADCFG_BIAS;
>  			if (arg == TH1520_PULL_STRONG_OHM)
> @@ -718,7 +718,7 @@ static int th1520_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
>  				value &= ~TH1520_PADCFG_SL;
>  			break;
>  		default:
> -			return -EOPNOTSUPP;
> +			return -ENOTSUPP;
>  		}
>  	}
>  
> -- 
> 2.43.0
> 

Reviewed-by: Drew Fustini <dfustini@tenstorrent.com>

Thanks for the fix. This was something I changed due to checkpatch
("ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP") wihtout
realizing the implication.

-Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
