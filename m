Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888E3C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 18:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O8htqT9NUmsxmbIzxp8DtT1Y/YQFtD9KjN38xhK2pzI=; b=FH8mgLDLkD98YL0H2AVvSpsjE9
	tcPpgU8+wUFVYbUX7sTsAdvibidbL+swIuy2IPYzO77KpGAHOR0IsV5yEKI50VhQ1SEEwWAQdoa4/
	5Trmfg7OOzRwIIK4SNirlEFRNOnS+xou2rayAy7u5QKZSfCFK3+5iWXuoBCmOzPCPgItyBU0ai5jq
	X9phxTfXERyghgFt3uWCB/8kYSkASr43n2cy8hGncBkwZwoWgE0mfLICJgOhuLg24YmQU/AwYG5Zl
	AMciOw9p+EgMbG9K/8QXF2eNIEiyEoBqArGCLxo3C4gbDFkBrT8sR/c9Y6X1OiXU0PSDzHWrBK3T8
	voACNbew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHrSu-0015Fn-Sj; Wed, 09 Feb 2022 18:13:16 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHrSr-0015Dz-LR
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 18:13:15 +0000
Received: by mail-qv1-xf34.google.com with SMTP id fh9so2500910qvb.1
 for <linux-riscv@lists.infradead.org>; Wed, 09 Feb 2022 10:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=H749CW18B+mXSE8eDYv1/GPO2QZK74ZBmLg43pWkuuA=;
 b=F841N1bERIlML4db9R0BT96CTA0QpP6aRLjqXVe6M/anxj8aMvl9ww5b82+0Rg2cSK
 oEJeNIvwGxmPa39+RJ79oUcKYbtS8PINfXmbu/eDhOlc16EQqExTMSOeVSJxSkz/3Q/E
 bn3qhLPZKt6rBf2rLqCE8ptDtVCVMyyHZWrmDSBUVf88iAxD8ijTFoO0w+XZu+lm3vAt
 9xjLd1LfCyAHjmW+dR3EbKjCWpG5A986FjK0BiPKLtBWC22MPb5Mq47Rz0dTmUQlnwno
 FEKiKFZA5wJTupKZ2ddtfa9VOfsGGFLzj7aQP1FSoLFw2hU3/0LfGOJiadUJB53aClBW
 8bqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H749CW18B+mXSE8eDYv1/GPO2QZK74ZBmLg43pWkuuA=;
 b=JjHcWt2jYWxCcwyPzIG9v/E18HILIGFv7vD3O3qowll5ff19rfOmiyedkejFXiFIdz
 zu3GfW7rH29JfCCJBtlJe9NMrFC+Ob0jdI4HKjkZLs1X++faKKoMy1OwDciigU2N+qo7
 PHVvP0/q+ohtu1yKp9WBllkhKA4VwQ1fRxJ5fLSpA7sAubFMP2beia4Mn11R+l1XZKKo
 1+ZGexcZ5wzyDsF+JC1sYyZ7UgQQ+S3t6KYgNsCTc1nhigBGkWAcPpILKzwM17brCDMC
 07hMXKBjXj7jlLQt/lbmrBXslQO+b5fE/g2DCbV3es3TmGXxyMUE7zvzmkmB0KdgCU9h
 +Z7g==
X-Gm-Message-State: AOAM530uiEprnkJ8M1eHpa++0gup1XEZplq580Kenxc8vMYdmJ46+n0v
 hLQHCGfqzeoOVLHxnKBq5Cc=
X-Google-Smtp-Source: ABdhPJxTkH0UgeZjlxNYBmI+nkSHngYHyjuvLMzA1KReVb0DkSWEUzByshGHR1LnuHXR5sRorgpGmg==
X-Received: by 2002:a05:6214:e84:: with SMTP id
 hf4mr2476659qvb.12.1644430391595; 
 Wed, 09 Feb 2022 10:13:11 -0800 (PST)
Received: from [192.168.1.201] (pool-108-18-137-133.washdc.fios.verizon.net.
 [108.18.137.133])
 by smtp.googlemail.com with ESMTPSA id x18sm9525495qta.57.2022.02.09.10.13.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 10:13:11 -0800 (PST)
Subject: Re: [PATCH] pinctrl: fix loop in k210_pinconf_get_drive()
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Damien Le Moal <damien.lemoal@wdc.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-riscv@lists.infradead.org,
 linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20220209180804.GA18385@kili>
From: Sean Anderson <seanga2@gmail.com>
Message-ID: <4c833488-8763-f8d7-c96a-6f7420abe35c@gmail.com>
Date: Wed, 9 Feb 2022 13:13:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20220209180804.GA18385@kili>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_101313_780448_A97105DC 
X-CRM114-Status: GOOD (  17.32  )
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

On 2/9/22 1:08 PM, Dan Carpenter wrote:
> The loop exited too early so the k210_pinconf_drive_strength[0] array
> element was never used.
> 
> Fixes: d4c34d09ab03 ("pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/pinctrl/pinctrl-k210.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
> index 49e32684dbb2..e3d03f2de7ef 100644
> --- a/drivers/pinctrl/pinctrl-k210.c
> +++ b/drivers/pinctrl/pinctrl-k210.c
> @@ -482,7 +482,7 @@ static int k210_pinconf_get_drive(unsigned int max_strength_ua)
>   {
>   	int i;
>   
> -	for (i = K210_PC_DRIVE_MAX; i; i--) {
> +	for (i = K210_PC_DRIVE_MAX; i >= 0; i--) {
>   		if (k210_pinconf_drive_strength[i] <= max_strength_ua)
>   			return i;
>   	}
> 

Reviewed-by: Sean Anderson <seanga2@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
