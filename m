Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE89C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 18:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tXqaV7DvJfdGMR053TxPJBrBGBpFoVVe1MOZBy4Ig4A=; b=PxZFyyvfyeb8aJPK+0/R6RTCYP
	htV8Rx3nE9BuUu+tgiGDshBpxmNypSUAhhilpIjRvhX0t0OkcocvRO3zZon604K9VkuT+x6p9gVc7
	ZUK+VyrNeglC0wx9q0IkBcXOQGs+DW2aQwrXE0omF8oxlHDCmxZwDOFIFRmxUW4T8A8NciEu/6mIu
	EI0jHGwnWeylGEhZeI9OlKK/S6LeaPaE3Ucjjt4x2cMGMGTsZpDB7cL+sRW5uqUEnfL2celtpYSfN
	y2vQlPcNbS5NatZSU3cWUGE1Ix7Kn2TPflr1Vwmjn074+j2eAjhsPgXOq6ZnTvTFLDOT79MnApuKZ
	4Bz5/lgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHriH-0016sN-EP; Wed, 09 Feb 2022 18:29:09 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHriE-0016rt-Q4
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 18:29:08 +0000
Received: by mail-qv1-xf30.google.com with SMTP id h9so2571371qvm.0
 for <linux-riscv@lists.infradead.org>; Wed, 09 Feb 2022 10:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PzVf0KveynQIygGhQd/LrRGeBUE4pFRytDZ84NY3N/g=;
 b=T6lGBSaL/3OruJFHgArFuER/e/PKIJfjSbyW1s3fjGFfTBagY1y00u4MiJqe/+IPac
 RkWMrFjNgwPDoP5JIjd2OVBx32XHJzBvlKhkIZDRSiEOeP7e0HBrdhfBcPlKDjglZxu9
 X8pIUptfBcq8jDUMwW4DHurgFuH3Vr74wtRD4lSlJe/Pu6jwoBbhVkMYi1NwM4+jkc6+
 I+6OFzvjSLt67MJ7bvabe+vDect8gtjKrgR0CjWTbAok6RhplZ5RAbmHC8IUmS2BGrXH
 KkDSPDdRIyhNsJG3LgnFzAyX3XArdZzhZous5FNCmWGy7qDZ+cdmJxAD7j9mfJDUi8Z3
 7YGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PzVf0KveynQIygGhQd/LrRGeBUE4pFRytDZ84NY3N/g=;
 b=jhQXQqZOlXK51FS5TZtXZb4p1XtwmGMHOGmns7hr2K/SIw4G6NxP5MsnAVAQ1t+bCO
 131D6f4QWJrYQsw7vJ2Nx8LC+7F4FWGCdOXKOJoiisg1LIBIoCM6vyM6zZwTvQps0uh/
 uQos/HYmsGFRRDGSKejlOA4jQ6pwb8oTp4og+gsUEhYzJVdGnXEXe94V6oWgbJKete4T
 AToN4/7yMd/yUI3Wk4XkgmuN2wIgSjXszY0X1MW3kttDcfkbobSc7gWCCmPv8AuGbCkE
 mg7HEb8uGH5T+gsyOrOwmu5VAs/68vtYsqNHzCobz0ObpYWKcOqQlPqKbT7HSuernaSz
 GJyQ==
X-Gm-Message-State: AOAM532KfGEm08+fZ7ktU/1HRGp7PGxfuMfzxUgvGb7+5KytemBVdL1m
 j6ucHcIdjGKi7K3jl9tiyuTTU++u8QM=
X-Google-Smtp-Source: ABdhPJyDVIivM6oORJ2ERX52QaSmjnCW422Y3k6n8aLbdRifSiUWu9R6XWlQWE7aVijGKenJFxoZww==
X-Received: by 2002:ad4:5ec7:: with SMTP id jm7mr2559021qvb.46.1644431345933; 
 Wed, 09 Feb 2022 10:29:05 -0800 (PST)
Received: from [192.168.1.201] (pool-108-18-137-133.washdc.fios.verizon.net.
 [108.18.137.133])
 by smtp.googlemail.com with ESMTPSA id d6sm9209849qty.40.2022.02.09.10.29.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 10:29:05 -0800 (PST)
Subject: Re: [PATCH] pinctrl: k210: Fix bias-pull-up
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Damien Le Moal <damien.lemoal@wdc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>
References: <20220209182822.640905-1-seanga2@gmail.com>
From: Sean Anderson <seanga2@gmail.com>
Message-ID: <9e10e17b-f815-46be-eec8-246c9d827444@gmail.com>
Date: Wed, 9 Feb 2022 13:29:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20220209182822.640905-1-seanga2@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_102906_879483_93DD93F7 
X-CRM114-Status: GOOD (  15.30  )
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

On 2/9/22 1:28 PM, Sean Anderson wrote:
> Using bias-pull-up would actually cause the pin to have its pull-down
> enabled. Fix this.
> 
> Signed-off-by: Sean Anderson <seanga2@gmail.com>
> ---
> 
>   drivers/pinctrl/pinctrl-k210.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
> index 49e32684dbb2..1ad61b32ec88 100644
> --- a/drivers/pinctrl/pinctrl-k210.c
> +++ b/drivers/pinctrl/pinctrl-k210.c
> @@ -527,7 +527,7 @@ static int k210_pinconf_set_param(struct pinctrl_dev *pctldev,
>   	case PIN_CONFIG_BIAS_PULL_UP:
>   		if (!arg)
>   			return -EINVAL;
> -		val |= K210_PC_PD;
> +		val |= K210_PC_PU;
>   		break;
>   	case PIN_CONFIG_DRIVE_STRENGTH:
>   		arg *= 1000;
> 

This should have

Fixes: d4c34d09ab03 ("pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver")

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
