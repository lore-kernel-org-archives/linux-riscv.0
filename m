Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58EDCF8552
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 02:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sAqFFIencjWJKll0ypWFwLuquOuQw9Djjirf4UTI+8Q=; b=0sQrmwzbVmrGN+
	nQlOXdIr7quDoBfqM+aP2d2uE5T/yS3LulKj1FALcPeuIlHWFIv+Tr09whVhchyqvBr8PvZ+oBWE9
	c+9rnRP/DpckcUPMWED6FbqA8OQaUbwY+53SQrVJP5f1txY7+ZayVKlXawsKiZeMV4Ik8Vo2grgdP
	C/cJ9gq177mL4jBva6EmEJKVz/6u6Nqd9QkrxpuQejjhXqDCUvWk9BdrsMIxeIJrvG4q1t0+7PsUk
	vHzHiVLUNjJDdrUc9J/z1am5JmxivDA90pOshdGOmudA54VPSCBaSgz7v7L1ImIy0lS/hvOhSH3zW
	62qsbbezOkxBPwTELHsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swC0x-000000081s5-3XBw;
	Thu, 03 Oct 2024 02:56:27 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swC0u-000000081rZ-2sgg
	for linux-riscv@lists.infradead.org;
	Thu, 03 Oct 2024 02:56:26 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7e6cbf6cd1dso264443a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 02 Oct 2024 19:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1727924183; x=1728528983; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BzabvJfQ/mT0r3c3amjc5i3OTEfJmiDAnNtgqnaCdRU=;
        b=gLyWrMop+YZJ63PZTiXR2PgDP6+FEQtqbzFFU19/oEMq1mEgmm4J2xozJ4ACJJtZd3
         Fx08Zn41nWAWH98c/fhAAjqFMy5+gZzwD8+8lFSqKPTLGEaqAwRTPg7ozepY134yFkiE
         G5by017AbVT1zzJUHeBevwMibymIw7sYl+RDrZPAUV8khOzaXGoUZcjyLX5Mm8OXDwOe
         lxvjITR/upHVQIKFBn5sTy5ChtqwBS9Fn1m0w3LySK4UTltxCkGogO19BX7Q8GkxPq1O
         9cNjxTVih0JChGIrx2zQ+ZzFGA6s3auQ9a80VfOVPPuxVsgAm55HT/IeycIE54LNDiJy
         ad4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727924183; x=1728528983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BzabvJfQ/mT0r3c3amjc5i3OTEfJmiDAnNtgqnaCdRU=;
        b=enSGK5cO3mWT1rpwHwTwWZhKANIJK6a5RrKPGmpWX50h6N6P7qOmad4+LL+ZwUEZbS
         iuEY36bMTsxjeICZT9zyEPin7DH59Oaz0jWqJBJCCFzugAquu+s452ckGhKg9wK9IWC/
         uImuAVtx7ObS5dP/5UjlckqCso+HfLGyhJSNltGngx8Vh2+JakVyHiEjnpT0s246mXdb
         uIasmernrnf9DdgkQRDL7oY67Rl3037d9gKDlmFmN7Icu/ZiYeZlSpWiH9kD7WTGH70G
         U5pRN2dsQL+GI3qCNOYNyV5nPorzM8yvMQtkLN1ZeVYYGpx9JSoh0FTNZsWIzQIGmAyx
         csjA==
X-Forwarded-Encrypted: i=1; AJvYcCUCfnG12vwkpS40KaUK/4ZzX1Zr5m6H88EXuVzaLoyQVtf/X+hziLFHqa+zOq2217CpvexhHGE5w3IINg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yym//w43vEKwupPs+w80l997E1r8xjwAu6svhybmdqlcxomKChs
	RUl+45c6hh0YgpJn2aMS/kUyAzj7iqrj1PhTdHH4eMfYb5aQ9zmMzZSn8k8szvo=
X-Google-Smtp-Source: AGHT+IFXE3gM6q0uiiKf0/18+ft5mNZG0Y2jhcNr77uRDbzfVN1+WvKiV64lUWP2C2WN057Sh63uJA==
X-Received: by 2002:a17:90b:368c:b0:2d8:e7db:9996 with SMTP id 98e67ed59e1d1-2e18466e1aemr6024553a91.13.1727924183457;
        Wed, 02 Oct 2024 19:56:23 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e1bfd2a07fsm293022a91.41.2024.10.02.19.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 19:56:23 -0700 (PDT)
Date: Wed, 2 Oct 2024 19:56:21 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: clingfei <clf700383@gmail.com>
Cc: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com,
	linus.walleij@linaro.org, linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: fix Null pointer dereference
Message-ID: <Zv4H1cl3aH9wnapH@x1>
References: <20241003023307.2138695-1-clf700383@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241003023307.2138695-1-clf700383@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_195624_754638_7824791E 
X-CRM114-Status: GOOD (  17.28  )
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

On Thu, Oct 03, 2024 at 10:33:07AM +0800, clingfei wrote:
> pinmux_generic_get_function may returns NULL, and its retval is
> dereferenced without check, which will cause a null pointer dereference.
> 
> Signed-off-by: clingfei <clf700383@gmail.com>
> ---
>  drivers/pinctrl/pinctrl-th1520.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
> index 1bb78b212fd5..9331f4462480 100644
> --- a/drivers/pinctrl/pinctrl-th1520.c
> +++ b/drivers/pinctrl/pinctrl-th1520.c
> @@ -798,6 +798,8 @@ static int th1520_pinmux_set_mux(struct pinctrl_dev *pctldev,
>  	struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
>  	const struct function_desc *func = pinmux_generic_get_function(pctldev, fsel);
>  
> +	if (!func)
> +		return -EINVAL;
>  	return th1520_pinmux_set(thp, thp->desc.pins[gsel].number,
>  				 (uintptr_t)thp->desc.pins[gsel].drv_data & TH1520_PAD_MUXDATA,
>  				 (uintptr_t)func->data);
> -- 
> 2.34.1

Thanks for fixing the formating in the previous attempt.

As Kees Bakker noted [1], I failed to have this check in my v3 patch
series. This fix makes pinctrl-th1520 behave the same as other drivers
that call pinmux_generic_get_function() like pinctrl-single. I have
applied your patch and the driver still works as expected on my LPi4a.

Hopefully Linus can apply this fix on top of my v3 series.

Reviewed-by: Drew Fustini <dfustini@tenstorrent.com>

-Drew

[1] https://lore.kernel.org/lkml/87770518-5f63-4adf-b6ea-c7f92b58ce22@ijzerbout.nl/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
