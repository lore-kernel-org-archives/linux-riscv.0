Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77580C25B75
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 10:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=N/bRxAgNlZqC3Mu+VquvicZpe4KleukzKyLCabUGqaE=; b=NNCNq2Px4H1yg7Xlrgn+ETP2Wy
	ag8eN5kuBfacFmUkMdN/XlV/ra7lgJ1k1PLgSB5qwDPYn6SP6b0QYFmEtNGPi8PsDT7EZRmeG2J42
	LZDx19o5LAiy3UmjzVt/LBeE68N2n25GgvNoBKjakCOI9pTnL0irMwFNJ151l1DVdUuQywkbqZMxz
	VMP35Gw/9hw4V2ReA6KHPAEAnjLy8YRoXf4FW5PyRUefa8pnEakuWwDxXMmm1HNLarnKEvRt9uGDi
	UAFDR394VqFrUlCSBL9j5FXqVz818n4QsOdB/Y0eKTx0RJDwuwIphOt0leGdnIrTxy0Rk89ZSyLjZ
	+SpXvWYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4HpN-0000000AUUG-0K5Q;
	Tue, 07 May 2024 10:13:41 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4HpK-0000000AUT5-47kv
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 10:13:40 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DE833400F5
	for <linux-riscv@lists.infradead.org>; Tue,  7 May 2024 10:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1715076816;
	bh=397X4zZ5qk6cmfxvJ66g5Oe/KXHQi7SbJr6mL/vXFTk=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=ronazVYDfRESfDFXThriTvfHZoKRxPX56aJndWDCsD1z5uV5mxyFZHJeDCrhmXkS0
	 WkLuCqU2a1yFJXvV5NNiq5Me4ofaWwLtxladK+rwGJEOZJvmgfupqzyEJStrEJ0S/9
	 VZIWjIwaqwDR4SRDflhUfrEidRSS/+OuhU8iLkYnaYGFzNXhR+LRiESis0a2BWw0g6
	 bb3dfK87xEW3tkh5kV5DYLfCfYUOIsTZdyaKZVqIZjVPhwXuwLyqWPfz//ZmV0nMEq
	 jiFloOdblr8AWRwSXB6yjBV3utsh5QpU10gaYsmaqqH+M6fSOTY5Amc7GQHaVNY246
	 GCgiSUWEoKaQg==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-43d245bfdb9so39132081cf.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 May 2024 03:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715076816; x=1715681616;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=397X4zZ5qk6cmfxvJ66g5Oe/KXHQi7SbJr6mL/vXFTk=;
        b=SWq0mQjT9nizyDpDFQC4uds9oI1+mt9RlRpiDGmX4vHru5QwhcC0hFajy+NYWKafwv
         NhCYjOFz+kKNFozqm1veeQvOtqoz5C9p9NXjBbSZsC7RXic8TQPMGyZ1caDtCuKCCJan
         Ew7O+bYJuADiVniDW6Kba3+9PZuNn+YYUBuDP2cqR5LWYvbhh6RWq98acOLrmT1jS9Ka
         DfVqPtBdihbCV7FoFHH+shX4kxRZvIEALB3yr2E8jnSFQd3UfWdRN8rlQ1ZWc18A0iyA
         4gbBzli5TLR3aS59P1QFFQ7YmIzsPe8sRoB2zmrQzrvx8k0Bz/C6sCF9vyYpSoGFZmNW
         2rYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWezcQfT66SAN4mI7+oSkoOSO8d7WXktnEl1RXRJYzaBWHpeFgx7sO35bTmdbZAbkzardgkERJHMO+quLl90lO0WxS1n0e4kh/PVrDALOyP
X-Gm-Message-State: AOJu0Yx0jXTHLMInLjYTBKrfZcNpTJJrJqKzymP7h7NkiytbOCj1CUlY
	DQCIO/DOCmIQvuoL79pXbHiSAvqSxWo5yDw2voELjNf+eUAObXo/KnEpb2ER5QH/0jwQ9+aBmYT
	6sOdhEvlFIbbJMOvKCwx6jLPLHWSTbdYlTr22KHZSeuyhWW3ACSpoEbHA7bBn8K/w7MbK60GYKs
	1S3ozRXu8Q/OyW27+5pIAUEC/ME6pknW21JHBy9ybG/YAnNGbXOW/YHSYV
X-Received: by 2002:a05:622a:4e0b:b0:43a:712a:bb97 with SMTP id dh11-20020a05622a4e0b00b0043a712abb97mr15579368qtb.7.1715076816028;
        Tue, 07 May 2024 03:13:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjgVEjWFG0Er1wzm6XME0OZo9sKv/t6H0/VJqg3xbQh7tYq4BfD/1KVLjHaQMTeCkQMWpcnkGoRTUTZ7VYW1c=
X-Received: by 2002:a05:622a:4e0b:b0:43a:712a:bb97 with SMTP id
 dh11-20020a05622a4e0b00b0043a712abb97mr15579347qtb.7.1715076815802; Tue, 07
 May 2024 03:13:35 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 May 2024 03:13:35 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240507065319.274976-3-xingyu.wu@starfivetech.com>
References: <20240507065319.274976-1-xingyu.wu@starfivetech.com> <20240507065319.274976-3-xingyu.wu@starfivetech.com>
Mime-Version: 1.0
Date: Tue, 7 May 2024 03:13:35 -0700
Message-ID: <CAJM55Z-p9OLYCWHzhQ9HJ3vEt+u-qx0kxcWmGnO8FoarxJQiQQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] riscv: dts: starfive: visionfive-2: Fix lower rate
 of CPUfreq by setting PLL0 rate to 1.5GHz
To: Xingyu Wu <xingyu.wu@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_031339_172667_5B4A5F20 
X-CRM114-Status: GOOD (  15.20  )
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

Xingyu Wu wrote:
> CPUfreq supports 4 cpu frequency loads on 375/500/750/1500MHz.
> But now PLL0 rate is 1GHz and the cpu frequency loads become
> 333/500/500/1000MHz in fact.
>
> The PLL0 rate should be default set to 1.5GHz and set the
> cpu_core rate to 500MHz in safe.
>
> Fixes: e2c510d6d630 ("riscv: dts: starfive: Add cpu scaling for JH7110 SoC")
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>

This should really be based on Conor's riscv-dt-for-next branch, eg. the change
should be to the new jh7110-common.dtsi instead since the Milk-V Mars board
would most likely also benefit from this change.

In any case:
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  .../boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi     | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index 45b58b6f3df8..28981b267de4 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -390,6 +390,12 @@ spi_dev0: spi@0 {
>  	};
>  };
>
> +&syscrg {
> +	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>,
> +			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
> +	assigned-clock-rates = <500000000>, <1500000000>;
> +};
> +
>  &sysgpio {
>  	i2c0_pins: i2c0-0 {
>  		i2c-pins {
> --
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
