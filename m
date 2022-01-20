Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747C0C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 18:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Nu6zbT5M5CP5+ptekQfiX5vVmLKbGBS6aAsb87umXtU=; b=HrBptB9nX4TZBX7nOle1QByoA4
	aR5diLHFqkDAZoOXH2xFxclR3dUOXAZYhZKytzZ53zvxrXUXFqnqFKuWxVM3EiaRk1ImPJ2TlX3V6
	xvBjRPrwkM3zBFm2Aq7YPsdEbhdYjzfUog4RFTDOLzpq0aQk9kIEUJ725NYxRO6I3DbqK6ZBQDNzd
	hkYtTaa1pvOL3zq196gdeAwYE6UyCvItpDogL8Hg4GX0oWy0l6iWi7BA2n5/F/moTualVmynrenBT
	fnoGI+WhxxhT4d/xLKsIP5JP6zjvHy6dS301PR1F/E618ttiWSyw+6JTkBWnROUHeioNaPaohf/zB
	FdZRO4ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAc01-00Cl06-Ik; Thu, 20 Jan 2022 18:17:29 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAbzy-00CkyT-87
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 18:17:27 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 g9-20020a17090a67c900b001b4f1d71e4fso6523743pjm.4
 for <linux-riscv@lists.infradead.org>; Thu, 20 Jan 2022 10:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=7jmbFAZoe/0Han6gI2djD1GVPo4KRWYjMtQ4Zw3deJU=;
 b=f+BELza4AuuQ23XiU8+1ewgvZtVFgJgiMiFbei874Hw+syDHOYNnHcUXQ4xpw/9R8k
 TPa4c2/5kDGNk+j8nvoxsG6zcJS0ApIHl6/R2CzzZ4PWJQNebwrumXyiOX2jiqDwcNT8
 LnKcRb31H8fkVVX9vChfpJAwxj6JajBBFIMIyBHk3/iJB/QwfHV66t0OrjFdXnS848Xj
 zB9rklLTeMbpa8rKQ9MAIzgYBvV7UhBXlqnTwqXaJS+/3yUwX1bt7txkGAqS5mC9DDQK
 W/86vBAnOUCHUDR9XVNVyjLJ9EW3S7zN3hiIR+pagNuVHQKWOcqG5LTpggTIXqCfnZnt
 mLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=7jmbFAZoe/0Han6gI2djD1GVPo4KRWYjMtQ4Zw3deJU=;
 b=LV/cEcVjUYNfAhZq/WOeTTnnX1UWtuUeWFnnAZVbV/v+uxMY+TIv4rWACBsOi0CPyo
 dxeiMnUYi/O2ik6MO8YXmj0qrA6k7b5ae5e5a+ingBDrfKte1C5mwyM+IWpDvT165Kw1
 ZAjnG/+ub+rKLvzbV2FVxG35CfHpV5/QSQCxVTdvXbzHFwb0BJbxwQsz9W/ueyi2T9Jt
 voRUGGxbzgj0Nyll/G0M6GDCVCaN9LLDRXdkSWs3o1UeoaLsX2CgxuY3xVmeF+5088/1
 i6wjWaG6KNFu0FcubYtz98rsShqTIDm+zITaCrLCJwNKZNq8SB5dKGA4tryoDNkc0eZg
 F31Q==
X-Gm-Message-State: AOAM532XJDy+w5ehlAqxkLJhfLDzXwGwpE9ey9CbgqjBEF1bYi/zlw0k
 zyAULu1Q/ayzE5/hnd4XZFvpBQ==
X-Google-Smtp-Source: ABdhPJxfyuHTlrcI/Y+aEdEmUiAgy8Du+WABE60SAYyyZx8a9UnJxCSygRQkFRFIvKDxFAWsOie3ag==
X-Received: by 2002:a17:902:a3c7:b0:14a:d8bf:4e09 with SMTP id
 q7-20020a170902a3c700b0014ad8bf4e09mr215164plb.62.1642702645044; 
 Thu, 20 Jan 2022 10:17:25 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id i1sm2996512pgt.82.2022.01.20.10.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 10:17:24 -0800 (PST)
Date: Thu, 20 Jan 2022 10:17:24 -0800 (PST)
X-Google-Original-Date: Thu, 20 Jan 2022 10:14:17 PST (-0800)
Subject: Re: [PATCH] riscv: canaan: remove useless select of non-existing
 config SYSCON
In-Reply-To: <20211229192458.25138-1-lukas.bulwahn@gmail.com>
CC: damien.lemoal@wdc.com, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 kernel-janitors@vger.kernel.org, 
 linux-kernel@vger.kernel.org, lukas.bulwahn@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: lukas.bulwahn@gmail.com
Message-ID: <mhng-d060c520-cef0-454b-b6b6-0c75282bf8e0@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_101726_315669_CB70D237 
X-CRM114-Status: GOOD (  18.21  )
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

On Wed, 29 Dec 2021 11:24:58 PST (-0800), lukas.bulwahn@gmail.com wrote:
> The config SYSCON never existed in the kernel repository; so, the select of
> that config in ./drivers/soc/canaan/Kconfig has no effect.
>
> Presumably, this was just some mistake, assuming some symmetry in handling
> and naming of configs that simply does not exist.
>
> Remove this useless select of a non-existing config.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  drivers/soc/canaan/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/soc/canaan/Kconfig b/drivers/soc/canaan/Kconfig
> index 853096b7e84c..2527cf5757ec 100644
> --- a/drivers/soc/canaan/Kconfig
> +++ b/drivers/soc/canaan/Kconfig
> @@ -5,7 +5,6 @@ config SOC_K210_SYSCTL
>  	depends on RISCV && SOC_CANAAN && OF
>  	default SOC_CANAAN
>          select PM
> -        select SYSCON
>          select MFD_SYSCON
>  	help
>  	  Canaan Kendryte K210 SoC system controller driver.

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
