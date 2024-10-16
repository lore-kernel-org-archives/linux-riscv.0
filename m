Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92881D1AD45
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 21:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AZ3c2/3x2KTPz/TzViqhV28EwT/TH0oYgCY9Ao23wHQ=; b=nfmH6OJ/nYbUmc
	ZBljQV9CkwMegN8vZswPeCJVoEvWpqStVIupxPn0kL91XRC99ulE5FVxSF3ETZZdc56buUeodEEp3
	7PCsP98UaWj8Ny54HxzRByjtzoWQ/WUlZGROI8y4Z+4LDqiyW/xUekBU5YMiZ2X3Bd5osoJvXKCtO
	qRoI0nM9OP2oYH9rZlfmDJLkp4HfgNHO7jqwfK8TGs6nlilCbG9QKgxcOKv1nmNulsGOaUV8js0Ru
	ew+wDLdcHbXxDqSQa7GiQyR75LDjJaU6aW5Kh29hBNRssrhIDxT7yex/mb54hYav9dVpAaPvNrvAn
	VaUGx8MUApO91xWFr48Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1B8N-0000000D0ZA-3Ho5;
	Wed, 16 Oct 2024 21:00:43 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1B8K-0000000D0Xa-1q2R
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 21:00:41 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-83a9317f93dso10485939f.3
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 14:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729112439; x=1729717239; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KQkUyFxL6KPO58jEIgRqgtkUgZXFKeeIN5h6kSZxcRY=;
        b=BHepStzd4JwWq8bp8Z4wCSo2PHeiKwNdcAdZ//FkUvoN9f+X5VaxOo6Nco1AawVKNB
         py8QvDC6tQUIGtbJEJARgkn9AmUyEtpQXkB84d6DRXtxuouen7ogTnnq9OSpgfzxPtyx
         cBi3JAvjHlS9QzIXD0rN2sHubet3donR2yYoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729112439; x=1729717239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KQkUyFxL6KPO58jEIgRqgtkUgZXFKeeIN5h6kSZxcRY=;
        b=dY5HHyEYiXkhc1+QOCUmTTRguRvOZsCzod2gG+Eqle6leUrlbjssWj2aAyHrbvhGxz
         66nL2CkLIjHbZVxM7jb4OBqZNNouY0qRNngUv6O+L8KhkPXhq6Xe3XOMk7kQoHiZnLLN
         BWSuj7bsKhc+5zScWG2WcK7gU2qWI5Pjzb92SfGfnFTR/UTmkYVVBlXHImVoTpc8T4wE
         y/vlf9FYsMYsSkVCSujKc3DtoECosd5o+UjV22lq8lGN14AVLiw/25emsZcOmzdJHZL6
         jubyU5VezmmdrtRCMkdCvXNps/ZbEp+vSASGKj+1praSV0u8TxsVVpIPac/VQQCVZrJl
         IZ9g==
X-Gm-Message-State: AOJu0Yyb+Fq346+znUN3x+2rQPRr6igm07snq8qxWokKFsQCVSRDnTaL
	zr8WNk7Db7jOLNIClrav3+6AnVwDUv/APhwnzuLwnJ0F65uawO1f3ySL6LS0w7k=
X-Google-Smtp-Source: AGHT+IEr/mLDFSHaahfcbR6Ju6YahNPQWbFH52bUJmc8ClQuj82clhMLrKIsGaKx1CqLOFpCh6SR8A==
X-Received: by 2002:a05:6602:3f92:b0:82a:48c5:4d04 with SMTP id ca18e2360f4ac-83a64ce007amr1258719239f.6.1729112438477;
        Wed, 16 Oct 2024 14:00:38 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-83a8b53c85asm97470939f.51.2024.10.16.14.00.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 14:00:37 -0700 (PDT)
Message-ID: <2f82fbcb-4a3c-4dfe-8852-7fc0b27c38e4@linuxfoundation.org>
Date: Wed, 16 Oct 2024 15:00:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] pinctrl: th1520: Dereference pointer only after
 NULL check
To: "Everest K.C." <everestkc@everestkc.com.np>, drew@pdp7.com,
 guoren@kernel.org, wefu@redhat.com, linus.walleij@linaro.org
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241016134223.4079-1-everestkc@everestkc.com.np>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241016134223.4079-1-everestkc@everestkc.com.np>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_140040_760197_E14428A0 
X-CRM114-Status: GOOD (  16.56  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 10/16/24 07:42, Everest K.C. wrote:
> The pointer `func` is dereferenced before NULL check.
> Move the dereference after the NULL check.

Change log looks fine.

Short log that clearly says it is a fix would be better:

Fix potential null pointer defereference

> 
> This issue was reported by Coverity Scan.
> Report:
> CID 1600802: (#1 of 1): Dereference before null check
> (REVERSE_INULL)
> check_after_deref: Null-checking func suggests that it
> may be null, but it has already been dereferenced on all
> paths leading to the check.
> 
> Fixes: 1fc30cd92770 ("pinctrl: th1520: Factor out casts")
> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> ---
>   drivers/pinctrl/pinctrl-th1520.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
> index 7474d8da32f9..07f8b51fb294 100644
> --- a/drivers/pinctrl/pinctrl-th1520.c
> +++ b/drivers/pinctrl/pinctrl-th1520.c
> @@ -803,11 +803,13 @@ static int th1520_pinmux_set_mux(struct pinctrl_dev *pctldev,
>   {
>   	struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
>   	const struct function_desc *func = pinmux_generic_get_function(pctldev, fsel);
> -	enum th1520_muxtype muxtype = (uintptr_t)func->data;
> +	enum th1520_muxtype muxtype;
>   
>   	if (!func)
>   		return -EINVAL;
>   
> +	muxtype = (uintptr_t)func->data;
> +
>   	return th1520_pinmux_set(thp, thp->desc.pins[gsel].number,
>   				 th1520_pad_muxdata(thp->desc.pins[gsel].drv_data),
>   				 muxtype);

Otherwise looks good to me. With the change to short log:

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
