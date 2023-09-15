Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7232DEE642D
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 07:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tdceb11BGVfD22j0FzdaumVIJBpjAXGCVuqVjECVQXk=; b=Sfm/rwflDhaOR+
	9C8zlThPeTLbce2l6v8qLmB7u+D15v+3KjjDabkmSswnHphxh4VG5qXtlFCRWBIJY5TxJWIknxtpn
	OaIJaS1nkPtX5r6I6trxUYF1edY6Gpik0HkmOiaDFiqTx3bVnSXHZ951EmxEz7Jm7q1S/mWTwvYF9
	lPXRlq1NyZbDVqBnqb1HmIHubsp3LfzEQIYREJJjz17B9b6dz+gnbmL5pym46htgOAHbgeD47iZiX
	5Pe7TL37k0+ZbdyHdcXBiBlENkK1TihDFUckmHwvK9fskHGTt1lN586qS+KMAqktEXdCd6xSxYxRu
	uD3xbGeqTomZTTvv/fgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3KM-00A3W1-0L;
	Fri, 15 Sep 2023 07:33:22 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3KI-00A3V3-32
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 07:33:20 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-31f4a286ae1so1533998f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 00:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694763197; x=1695367997; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hfitv4X6lwToXcy41tlreOifKHqkBiKe2Y188NSkf/E=;
        b=flAwBkoosfXTp54fbx2+mO+1FBgmQxrd80JRcRbY30t2pP1Rw9YNu0eqYnZE4tQRvT
         2euYZAWxeP1iZMCC7UMAChVrXxnge6gjJvkcvYmPd+zmB3eB5i62BKrMqAtEoSW6ogx5
         sihAqOAdfnSstICApt8bKjSMHXLBgLr45CXeui47eceSTSNCGKup4EPbuWFy676vHjZs
         7xBSdatg+ImNkz+MakuosA+ZRY5Ys5eJkAy01UmrlmlUH6dRdoioHItjMWJb4Di4VdJh
         FHWTSPiP34CmRnDOkB8f4l5vg3N8We+AsiqYq7+66RsauAqWPJ8ah8AvznwG7JxkYWq5
         jpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694763197; x=1695367997;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hfitv4X6lwToXcy41tlreOifKHqkBiKe2Y188NSkf/E=;
        b=UUUbC8QqQRsJNAOr0vwbCksIgCnhO0IRbtDqaudxpi3WgKsedZBdw4shXT8rmS0nih
         z9abjEj4/Nbe9FcbnphtPV+1SZIdsm0e6tsPoIrepg5sYFPdee4nEiuOkpw9t/7f3pBD
         9wGSG7W/tUCAY/c5LTjozSdYD5HYWh2ZAxFKIS/AUIXkayiqoL7N+CX2/5a+/3tL3Nft
         8WNAR+QvJ/i20QjFQ/eHgnNgoLAxEjhPKxpCdXk70+VJ4t5Mh0fiItetyGDTM9CbafPV
         DrxFAf+tmRASjSrGoDw2UlsHMrM//dEKKulWqoojYiL3v9ChjgMKaK3iTp5zYYl55ulq
         30/w==
X-Gm-Message-State: AOJu0YxrIESLTyfRFHvhsgKaTgG7HDc0twfkgxsc0YU3d+WsOTJ6flw+
	ezpQMBh5/SS8aFtyBOIr5MOH5w==
X-Google-Smtp-Source: AGHT+IHX3L0cvYtW1rLjajL2hbQapX8lSDljHUYvbrbSihTE5UDsyi8Cdbldh20ED7vBOil/5s2bYQ==
X-Received: by 2002:adf:eccc:0:b0:316:efb9:ffa with SMTP id s12-20020adfeccc000000b00316efb90ffamr792560wro.35.1694763197069;
        Fri, 15 Sep 2023 00:33:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id f3-20020adff983000000b003143c6e09ccsm3663543wrr.16.2023.09.15.00.33.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 00:33:16 -0700 (PDT)
Message-ID: <803daa8f-f4bd-34b7-f826-89e1db5f24f6@linaro.org>
Date: Fri, 15 Sep 2023 09:33:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 10/12] serial: 8250_dw: Add Sophgo SG2042 support
Content-Language: en-US
To: Wang Chen <unicornxw@gmail.com>, linux-riscv@lists.infradead.org,
 conor@kernel.org, aou@eecs.berkeley.edu, krzysztof.kozlowski+dt@linaro.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org, guoren@kernel.org, chao.wei@sophgo.com,
 xiaoguang.xing@sophgo.com,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
References: <20230915072558.118325-1-wangchen20@iscas.ac.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230915072558.118325-1-wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_003318_988625_B518AEBC 
X-CRM114-Status: GOOD (  15.41  )
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

On 15/09/2023 09:25, Wang Chen wrote:
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> 
> Add quirk to skip setting the input clock rate for the uarts on the
> Sophgo SG2042 SoC similar to the StarFive JH7100.
> 
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Missing SoB.

> ---
>  drivers/tty/serial/8250/8250_dw.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
> index f4cafca1a7da..6c344877a07f 100644
> --- a/drivers/tty/serial/8250/8250_dw.c
> +++ b/drivers/tty/serial/8250/8250_dw.c
> @@ -770,7 +770,7 @@ static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {
>  	.quirks = DW_UART_QUIRK_IS_DMA_FC,
>  };
>  
> -static const struct dw8250_platform_data dw8250_starfive_jh7100_data = {
> +static const struct dw8250_platform_data dw8250_skip_set_rate_data = {

Why? What is wrong with old name?

>  	.usr_reg = DW_UART_USR,
>  	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
>  };
> @@ -780,7 +780,8 @@ static const struct of_device_id dw8250_of_match[] = {
>  	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
>  	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
>  	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },
> -	{ .compatible = "starfive,jh7100-uart", .data = &dw8250_starfive_jh7100_data },
> +	{ .compatible = "sophgo,sg2042-uart", .data = &dw8250_skip_set_rate_data },
> +	{ .compatible = "starfive,jh7100-uart", .data = &dw8250_skip_set_rate_data },

So devices are fully compatible? Then use compatibility and drop this
patch entirely.


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
