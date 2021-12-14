Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D92C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Dec 2021 02:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=uADLsmgGgZAMcyOESwgViDTaF9bWcpFN3PQID9misj8=; b=PH2qUcSjf5I9cW9x0OtwZf086f
	B3YFDNV6Ecr79BEJwipnbCFBTAIdWGS7OEdCQd4cNsOgYfTfXhQcgIUWN8DIPLDAy90DM/XAl7MRy
	VSsFXvcDrNBYr/qIngqBgR8ScQexPR4mGE0IfWWTKorPxRi7o2G34vF33NrhUZD93Pg8M271XBler
	Q9dTclZU8N7avVQtvoSCGupZaExKq48iplqKBVKXoi+d2cfF+Io3M1ul3NQJ9yppcPA64q4/Al1md
	Lh7zmD9CkC9TU8go0DeZPwBZuGnkQJYHn1Ekcw/pFrxsUTETBUUBLOpa1ezVKK3hmjzvmPE22iZ2D
	I5fgfOsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwxJY-00CEtm-JZ; Tue, 14 Dec 2021 02:13:12 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwxJW-00CEtE-2H
 for linux-riscv@lists.infradead.org; Tue, 14 Dec 2021 02:13:11 +0000
Received: by mail-pg1-x531.google.com with SMTP id q16so16100610pgq.10
 for <linux-riscv@lists.infradead.org>; Mon, 13 Dec 2021 18:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=QKMDIE0IaBxRo05jmQBpNWhyutL/m7nfLU+Qg5eoiTg=;
 b=VuIkK7OEUiXdfuNKhtSkjGBX1D2Fl0/Q4JG8oHrxcCu6wmSzBgR2jdhusZNsJXLGNu
 VTgsCBHloJJEU6/G/oyrJcU0ynTqnLyrf3O+Yf5hszqZaOtd5kHKzs115eoHMy6t/KlK
 ZTEjJZlxyYdxUDFZupXlU/waZV0BERUsT/z9ISsgWW7r7zERMtAE0FdgLFQ8rxuBre8J
 FcsC6wyvMg8EeWFq3xFuupwhKbY/AM57lUxHps26OH+Ni0e5PNQuH5yeSKgMnSfXWVQt
 aqS1soSdqTuGex9nrf+iPggXmkkdd1mR2+MB/DOfTHVDVewSQA1GB486uPepDIvawd+j
 oPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=QKMDIE0IaBxRo05jmQBpNWhyutL/m7nfLU+Qg5eoiTg=;
 b=ufSqhfNhx8OQyyV0d8aNPU7s+PD33zBuK0GoB8dP/RamNomRQHM7ZrLcK3HGG7eykl
 nasy8SjYkbOieueZ47giI2zREdeCxv5426mA2gVAMWZnYw0MlN4wm0duqQZ9j43RjduI
 iBKjrNXIMd1DmPZ3gs+0oj00eXeBbJWH61UYQ8ii6siRPyXqHgd+B5wWtUQ/EeFf3lVB
 7AXaFAjOt5OkZy0JngeS3HJBjT6C4WYDdwK5iYK2xwmP8hGqffA98QlFAEpOM1kP/t1p
 k9j+QymS6xGCeJX6IMl7Te6x6dzxRKihXQUhRalhEEdiMMsRAQHiEwrobC+pgT0YQoOm
 dK/g==
X-Gm-Message-State: AOAM5335Cyi/L0rKgq31ao6sLPWmyk73TgAeWpyBeqWDalDNUEq2H53y
 zFreaduy4ngMgE8LhN6oT0A2dg==
X-Google-Smtp-Source: ABdhPJwjUEJJZRgsRmKk0RKneMMh5n23pEZO3LTokMf0r5Bc9tfIe3z0cI70M+DtamHJ70COK+ouvw==
X-Received: by 2002:a65:6a4b:: with SMTP id o11mr1685018pgu.305.1639447986646; 
 Mon, 13 Dec 2021 18:13:06 -0800 (PST)
Received: from localhost ([12.163.77.120])
 by smtp.gmail.com with ESMTPSA id qe12sm372145pjb.29.2021.12.13.18.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 18:13:06 -0800 (PST)
Date: Mon, 13 Dec 2021 18:13:06 -0800 (PST)
X-Google-Original-Date: Mon, 13 Dec 2021 18:12:44 PST (-0800)
Subject: Re: [PATCH] riscv: dts: enable more DA9063 functions for the SiFive
 HiFive Unmatched
In-Reply-To: <20211108214629.1730870-1-aurelien@aurel32.net>
CC: linux-kernel@vger.kernel.org, aurelien@aurel32.net, robh+dt@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE)
From: Palmer Dabbelt <palmer@dabbelt.com>
To: aurelien@aurel32.net
Message-ID: <mhng-7ab80707-35c0-4123-8340-cf1feca4cca2@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_181310_130774_6E807E6F 
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 08 Nov 2021 13:46:29 PST (-0800), aurelien@aurel32.net wrote:
> The DA9063 PMIC found on the SiFive HiFive Unmatched also provides an
> RTC, a watchdog and the power button input.
>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> index 2e4ea84f27e7..c357b48582f7 100644
> --- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> @@ -70,6 +70,10 @@ pmic@58 {
>  		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
>  		interrupt-controller;
>
> +		onkey {
> +			compatible = "dlg,da9063-onkey";
> +		};
> +
>  		regulators {
>  			vdd_bcore1: bcore1 {
>  				regulator-min-microvolt = <900000>;
> @@ -205,6 +209,14 @@ vdd_ldo11: ldo11 {
>  				regulator-always-on;
>  			};
>  		};
> +
> +		rtc {
> +			compatible = "dlg,da9063-rtc";
> +		};
> +
> +		wdt {
> +			compatible = "dlg,da9063-watchdog";
> +		};
>  	};
>  };

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
