Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1546AD0EE17
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 16:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lcd8PaqKPMprwUbOv9c/DncPWJH6XC4PsGI3JCwVgl0=; b=Zs71dckkaobFii
	zV30zMhKFKja4LgOj6MgSWrmGqs8xyCZZNBQbnDshOlxnbXIOfz99n2GPI/ad5YGeVK1Viss3qAuf
	5dwsDmDzaeZ4hu1iGRPS7h602gbFk08ZcMZXHXetgdZ++z7bNHSpKw5KCuS5xErZOrtdKyhOeE+Y0
	mfftORQJsU/WZXdxWMSMJsSFAFYXhKajyZsr0DZ+l47b/JeTP17dHMkr3yPfJY5akCHTHjACwELDD
	7dQ5f/SgfollQY78i9A5HdGJlN6O/ekctWStgUsooq7I8LvZMgEEkKhOyWHvhSdGwAg/5/BYvUbWJ
	gNQAo5JHqN6hRKeeiBHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szIXu-0000000GyGh-1vgL;
	Fri, 11 Oct 2024 16:31:18 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szIXr-0000000GyFA-20CF
	for linux-riscv@lists.infradead.org;
	Fri, 11 Oct 2024 16:31:17 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2e2e6a1042dso1239815a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 11 Oct 2024 09:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728664274; x=1729269074; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ymJ/qex09j4ioztSVDBbfNAos9AY+mRR2jHbKLcRzPg=;
        b=c5s8dQab7YJiFd3R9nrqw6tyOeEYlc/nCJO8/4pZIfPw1J//+QG2oj7HKZ05Mo6bn7
         Kl7vn+CTuigh+jpO4yyzh2Th3qE2jfoaNK1biQvKelz2Ecc6BqjTLO6Y8tSyu3VSZqm8
         /Z5112e8DbSOIWKrI0Kv+D3iWqYqKINXyZUcOBj27s2ocxuWzQJZgBOTIdhb89ZuDrSW
         wHpsH9IM6dwXYL5X5J1ZgZk0k7OY8yKNE2M4sTsXaB53I2a09MFAQk74rirFgEl85M8X
         LoSuSWnmXOYdbjjtQymnRhJQVwbdDagT8WhgT6J8ceLMDDfxEq2N/9KIoLkApeO/Vhkj
         0shw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728664274; x=1729269074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymJ/qex09j4ioztSVDBbfNAos9AY+mRR2jHbKLcRzPg=;
        b=BoBJQco0sg5QV/s/RctGVm8dWL/UCl7scQMGO94/VE0h8O0alsrNm51lMrm1yOa4ia
         WDRWRHG4s9pb/M5g7/27T2fRYp/SS4gPJnMnvSaE+a/w5aMUvf2xzgokj4gqNwldhqle
         tBJpkMXAtEeTdLtVUZby/mqmbbvIfca5j4mj9Gk0Vz34m6T3ATL1o7adocpk1diLatUM
         sRrLBaAvR5nBozJzsUqUMJ2w8mGZoKJusTZmjCXhrByG8FyS03IyemveGRKysn/ekRR9
         1qBZgrBk/DM3Xy32OYcFGpXD6DHDPSPVliDAKru9wk23r8dmzC5kn97gJa9THftYVS2h
         ntYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU81CUUH6LMR/giyAosqHlXbcy0dkIXYIM7DH0chapkgsCSiq3KddUJy97EtzVQgN5yfXvlDqgAUWfvlw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJbJ9DO5PU767IFp0fJGeRm/XwFeV6uTF0YLeTtWTQn0MuYoyC
	1OiKEai67/rsUSDwXB0oJkTWTWftyvdz3McFuvRfx5dkEyA8Q6SXQZDjpW6U7lU=
X-Google-Smtp-Source: AGHT+IFZHNKSdlUtyflW/oAl3271oyzHBL3EezDm4ZEZS8ioT4B/wsLs4jMN4bfjeIMRhEIYEroxww==
X-Received: by 2002:a17:90a:4b0f:b0:2e2:bfba:18d4 with SMTP id 98e67ed59e1d1-2e2f0b3b53bmr4317697a91.17.1728664274280;
        Fri, 11 Oct 2024 09:31:14 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2ea9d4145sm2092573a91.18.2024.10.11.09.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 09:31:14 -0700 (PDT)
Date: Fri, 11 Oct 2024 09:31:12 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: Re: [PATCH v1 2/3] pinctrl: th1520: Update pinmux tables
Message-ID: <ZwlS0FiKfiPjhNSf@x1>
References: <20241011144826.381104-1-emil.renner.berthing@canonical.com>
 <20241011144826.381104-3-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241011144826.381104-3-emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_093115_538148_28A873F1 
X-CRM114-Status: GOOD (  16.29  )
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

On Fri, Oct 11, 2024 at 04:48:24PM +0200, Emil Renner Berthing wrote:
> When Drew took over the pinctrl driver it seems like he didn't use the
> git tree I pointed him at and thus missed some important fixes to the
> tables describing valid pinmux settings.
> 
> The documentation has a nice overview table of these settings but
> unfortunately it doesn't fully match the register descriptions, which
> seem to be the correct version.
> 
> Fixes: bed5cd6f8a98 ("pinctrl: Add driver for the T-Head TH1520 SoC")
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
>  drivers/pinctrl/pinctrl-th1520.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
> index 03326df69668..8bd40cb2f013 100644
> --- a/drivers/pinctrl/pinctrl-th1520.c
> +++ b/drivers/pinctrl/pinctrl-th1520.c
> @@ -221,9 +221,9 @@ static const struct pinctrl_pin_desc th1520_group2_pins[] = {
>  	TH1520_PAD(15, UART4_RTSN,    UART, ____, ____, GPIO, ____, ____, 0),
>  	TH1520_PAD(16, UART3_TXD,     DBG,  UART, ____, GPIO, ____, ____, 0),
>  	TH1520_PAD(17, UART3_RXD,     DBG,  UART, ____, GPIO, ____, ____, 0),
> -	TH1520_PAD(18, GPIO0_18,      GPIO, I2C,  ____, ____, ____, ____, 0),
> -	TH1520_PAD(19, GPIO0_19,      GPIO, I2C,  ____, ____, ____, ____, 0),
> -	TH1520_PAD(20, GPIO0_20,      GPIO, UART, IR,   ____, ____, ____, 0),
> +	TH1520_PAD(18, GPIO0_18,      GPIO, I2C,  ____, ____, DPU0, DPU1, 0),
> +	TH1520_PAD(19, GPIO0_19,      GPIO, I2C,  ____, ____, DPU0, DPU1, 0),
> +	TH1520_PAD(20, GPIO0_20,      GPIO, UART, IR,   ____, DPU0, DPU1, 0),
>  	TH1520_PAD(21, GPIO0_21,      GPIO, UART, IR,   ____, DPU0, DPU1, 0),
>  	TH1520_PAD(22, GPIO0_22,      GPIO, JTAG, I2C,  ____, DPU0, DPU1, 0),
>  	TH1520_PAD(23, GPIO0_23,      GPIO, JTAG, I2C,  ____, DPU0, DPU1, 0),
> @@ -241,7 +241,7 @@ static const struct pinctrl_pin_desc th1520_group2_pins[] = {
>  	TH1520_PAD(35, GPIO1_3,       GPIO, JTAG, ____, ____, DPU0, DPU1, 0),
>  	TH1520_PAD(36, GPIO1_4,       GPIO, JTAG, ____, ____, DPU0, DPU1, 0),
>  	TH1520_PAD(37, GPIO1_5,       GPIO, ____, ____, ____, DPU0, DPU1, 0),
> -	TH1520_PAD(38, GPIO1_6,       GPIO, ____, ____, ____, DPU0, DPU1, 0),
> +	TH1520_PAD(38, GPIO1_6,       GPIO, QSPI, ____, ____, DPU0, DPU1, 0),
>  	TH1520_PAD(39, GPIO1_7,       GPIO, QSPI, ____, ____, DPU0, DPU1, 0),
>  	TH1520_PAD(40, GPIO1_8,       GPIO, QSPI, ____, ____, DPU0, DPU1, 0),
>  	TH1520_PAD(41, GPIO1_9,       GPIO, QSPI, ____, ____, DPU0, DPU1, 0),
> @@ -256,11 +256,11 @@ static const struct pinctrl_pin_desc th1520_group2_pins[] = {
>  	TH1520_PAD(50, CLK_OUT_1,     BSEL, CLK,  ____, GPIO, ____, ____, 0),
>  	TH1520_PAD(51, CLK_OUT_2,     BSEL, CLK,  ____, GPIO, ____, ____, 0),
>  	TH1520_PAD(52, CLK_OUT_3,     BSEL, CLK,  ____, GPIO, ____, ____, 0),
> -	TH1520_PAD(53, GPIO1_21,      GPIO, ____, ISP,  ____, ____, ____, 0),
> -	TH1520_PAD(54, GPIO1_22,      GPIO, ____, ISP,  ____, ____, ____, 0),
> -	TH1520_PAD(55, GPIO1_23,      GPIO, ____, ISP,  ____, ____, ____, 0),
> -	TH1520_PAD(56, GPIO1_24,      GPIO, ____, ISP,  ____, ____, ____, 0),
> -	TH1520_PAD(57, GPIO1_25,      GPIO, ____, ISP,  ____, ____, ____, 0),
> +	TH1520_PAD(53, GPIO1_21,      JTAG, ____, ISP,  GPIO, ____, ____, 0),
> +	TH1520_PAD(54, GPIO1_22,      JTAG, ____, ISP,  GPIO, ____, ____, 0),
> +	TH1520_PAD(55, GPIO1_23,      JTAG, ____, ISP,  GPIO, ____, ____, 0),
> +	TH1520_PAD(56, GPIO1_24,      JTAG, ____, ISP,  GPIO, ____, ____, 0),
> +	TH1520_PAD(57, GPIO1_25,      JTAG, ____, ISP,  GPIO, ____, ____, 0),
>  	TH1520_PAD(58, GPIO1_26,      GPIO, ____, ISP,  ____, ____, ____, 0),
>  	TH1520_PAD(59, GPIO1_27,      GPIO, ____, ISP,  ____, ____, ____, 0),
>  	TH1520_PAD(60, GPIO1_28,      GPIO, ____, ISP,  ____, ____, ____, 0),
> -- 
> 2.43.0
> 

Reviewed-by: Drew Fustini <dfustini@tenstorrent.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
