Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C0DC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Feb 2022 15:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V77KyUGmBbRMzA1ZoUnjRxLzYIZEMlBBdACPNlqdooE=; b=IMlvGexU+vdxvY
	74g4gpGeBe9vLYlSrY/Yn/6el0wRq3uGxN9D+xba1jdv7Kb7h2NnImCuescTlJwGEc46v/ODFnON7
	q47v2iPMOCgmqqXeNm9i0bYzBtpURRTlhmsjPSGqW5upnY7PJR5SHjlGQ6v6Sx9vKvC0CnpbfFxxH
	zbcuI5xnax5jVxiJMWB8v4lCa5kGp7CYvigel+/xQA5jFTKQitBrWZCgEvKGMJMM++3ZuztaQ/e0D
	Q8lJK+qIXB6Xc3Hicq0Wfu7AvahVueVSKw9kBNYSVwj+8EKeE7gxf2X+bVgoKNO06kah31XLicBW9
	ruZae4Ghjl3LQ0z7V2tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOhzr-00DA4n-Ep; Mon, 28 Feb 2022 15:31:35 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOhzo-00DA3w-JR
 for linux-riscv@lists.infradead.org; Mon, 28 Feb 2022 15:31:34 +0000
Received: by mail-wm1-x336.google.com with SMTP id p4so5915244wmg.1
 for <linux-riscv@lists.infradead.org>; Mon, 28 Feb 2022 07:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2gH1VCXMJOCAQZMMdwA8NKZMdwDagt75ou8aHbyIUz0=;
 b=ut095mw9H1t6WgZsq59Kx6N6Whm5l58tD/csnQyzg3sRwVkNtPbOH2gIYZjAuTVxAC
 Ce2d7THpNHlx6j19dQe43RctF+aIsxdP0i5oSb2/LWutEn86m1FUcLDgyQX2BjStHyMB
 EIP+HSGqPNF1ba/Ro8mPiVGGLedsrF4z9I0vpxLZRLk35Kr4RD6ckAxQG1AAUK81KCmS
 sBua87VSFTbs7gPuCbUSj/jLl/KeTqu/ugVmvnni49k1SqL8FeOi84ucN/MvOplUnBQl
 ag9y6SNSGeacwbh9fKaddv5Rzrriyli1zWir8LaDgeJu8MS9pNVvVTYLOW25huWzgyyj
 Tvrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2gH1VCXMJOCAQZMMdwA8NKZMdwDagt75ou8aHbyIUz0=;
 b=4nNZ5/haHTU1yWvOqaiQuOfVy+l/m+pQjtqEP/lXaM6yY2QOALt9I1rcANMtSIh3Fb
 MOWAbivQ0Oz+ZQ7ur2LrUtiXsD0WW9FfiSfgXXjnfQJuVeX8QgEBU9YkoHZ9XFunLz0a
 z7Si/qsvK7WCn1vdAZybt91UJ5hRlj+1yYYuRpu+RT9n+wGw55ikOWPRtUUi7049iuWv
 upCS/LGGRQicGP/+BrMqIboo+0QsCM6NcJcHcZ+I7livqMPoftWDde4xMb4H3exSpjOe
 Mt0fq3NngCxmBkdfc9+lHtLpzkojeMtk3G4kPf2JoFBj/ssaN3Zqav+LAvvsk0ymo7Ui
 cPgQ==
X-Gm-Message-State: AOAM533cqqkIdAXf4uZUFkVk8X1CXvbmqie769QuZ0LXkY26KMZrdd93
 QhcNfUJx1FwhGgGTq4TZsqM/Lw==
X-Google-Smtp-Source: ABdhPJwZs3W4atkmlIldxtmVDitUoNs7+KJXCw3zlG03aFYebo+mCuYCi1jBc6bDQT5J1LiMod30iQ==
X-Received: by 2002:a1c:f705:0:b0:37d:f2e5:d8ec with SMTP id
 v5-20020a1cf705000000b0037df2e5d8ecmr13878273wmh.21.1646062290040; 
 Mon, 28 Feb 2022 07:31:30 -0800 (PST)
Received: from [10.205.160.53] ([95.83.233.50])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c190600b0037c3659a12fsm18783669wmq.6.2022.02.28.07.31.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 07:31:29 -0800 (PST)
Message-ID: <b8eb2e55-b5a8-4a39-86cb-93cadbd67922@conchuod.ie>
Date: Mon, 28 Feb 2022 15:35:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] SoC: polarfire: fix build warning
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Lewis Hanly <lewis.hanly@microchip.com>, 
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20220228152658.3367506-1-arnd@kernel.org>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <20220228152658.3367506-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_073132_743829_BCC3E713 
X-CRM114-Status: GOOD (  16.63  )
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

I had sent a fix for the build warning on saturday morning - but I guess 
you missed it.

Thanks for fixing it anyway :)
Conor.

On 28/02/2022 15:26, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The newly added driver causes a build warning because of a missing
> prototype:
> 
> drivers/soc/microchip/mpfs-sys-controller.c:76:6: warning: no previous prototype for function 'mpfs_sys_controller_put' [-Wmissing-prototypes]
> 
> Link: https://lore.kernel.org/llvm/202202260947.F5T1YNao-lkp@intel.com/
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: d0054a470c33 ("soc: add microchip polarfire soc system controller")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I've applied this to the arm/drivers branch as a fixup
> 
>   include/soc/microchip/mpfs.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/soc/microchip/mpfs.h b/include/soc/microchip/mpfs.h
> index 6466515262bd..969b5239521e 100644
> --- a/include/soc/microchip/mpfs.h
> +++ b/include/soc/microchip/mpfs.h
> @@ -38,6 +38,8 @@ int mpfs_blocking_transaction(struct mpfs_sys_controller *mpfs_client, struct mp
>   
>   struct mpfs_sys_controller *mpfs_sys_controller_get(struct device *dev);
>   
> +void mpfs_sys_controller_put(void *data);
> +
>   #endif /* if IS_ENABLED(CONFIG_POLARFIRE_SOC_SYS_CTRL) */
>   
>   #endif /* __SOC_MPFS_H__ */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
