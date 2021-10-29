Return-Path: <SRS0=3Oe1=PR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E971C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 01:48:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06D6B6115B
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 01:48:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 06D6B6115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RudIXtshGl8ahaNzsbmkwAyX3EFPh7mGxwgR8LdkRe8=; b=AoED9hzmI/bGmu
	Vn3lMRyf8IjY0u4jPRLSC4zQFxq5BtK/oRlIWxPPBBF63ZhpzIRbzrhVyVNR7DaLg9hbn8/ZOTLy9
	cFN7elfcoc3FCkOUTV4A8xUaE5UkEn8DytLfLlqABbXn/bvdVd3ch1BI/tHvtY4z+7/RKvvC/eH3g
	QtvMacT9MABH9fu6E88Ygr5zOX4WVojrggf4rftDaLU1c4/dLjOWjmr4xevKtKnnPoePJgL1hXPVI
	8NHSRUqugBN6HSVv0xDMocaex7AljRWHWdT+YK/cW2WGvGeXMAFVv1Rd279TPCZGlycPEvbMeANXL
	BRnzyh1N9zdPRRID34VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgH0j-009UES-1R; Fri, 29 Oct 2021 01:48:49 +0000
Received: from mail-yb1-f182.google.com ([209.85.219.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgH0h-009UDO-8H
 for linux-riscv@lists.infradead.org; Fri, 29 Oct 2021 01:48:48 +0000
Received: by mail-yb1-f182.google.com with SMTP id 67so20209500yba.6
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 18:48:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T/TTfqPPazXZy6rCqE4eY23ZS6lztPHL6YvSZ3A0aEU=;
 b=E9PkOvNhupffRnS1Edc2LcALFbnqlh9397JPZ1ZMB+pxfbCnBQIh6gGInzm6cZwVPN
 +i7UC6TM1z9o4eMP7E2DmEFjnO4mpTXtLA6xgsRXoqJ5fRkbnjF8rvGMggbD4Xu1ZPnO
 e0qECfbEHFDJhieR70qZmC7PlWZ7bzGEG+Ayg91gVJkzpB7dlA1iUCtHgjuM9oK0OoaY
 4N6fYLo7Ps4ulAYOvaXo5tX1rnrAkAd2JYfl9lEl7dB89/xjeemcPWvQDp5b38x9Nlgo
 N2RDzimj2wi8vNX1x4l/vOl1XkiU5R30ol+vH1auj0DbZ6mR8668Ux+AniKV6RhVj6YB
 xfDA==
X-Gm-Message-State: AOAM532mDQp160SRNCbUFsH5YiH301VZ8rIfR3T68Yu2IcYz3zbj4hNa
 fuM1jot5X9ZXc21rFYzt/Y+WVNN6vg==
X-Google-Smtp-Source: ABdhPJyTFwx8gGD9lHkBMJhIrbjlxFLtSaRY5wt6pSWrVpUA4KAcaDoDPxba0D+Sge/5gDpSjsXkRA==
X-Received: by 2002:a05:6830:200f:: with SMTP id
 e15mr6086691otp.221.1635471753342; 
 Thu, 28 Oct 2021 18:42:33 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id l2sm1535606otl.61.2021.10.28.18.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 18:42:32 -0700 (PDT)
Received: (nullmailer pid 975719 invoked by uid 1000);
 Fri, 29 Oct 2021 01:42:31 -0000
Date: Thu, 28 Oct 2021 20:42:31 -0500
From: Rob Herring <robh@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-serial@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Drew Fustini <drew@beagleboard.org>, 
 Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>, 
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Michael Zhu <michael.zhu@starfivetech.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 linux-gpio@vger.kernel.org, Sagar Kadam <sagar.kadam@sifive.com>, 
 Matteo Croce <mcroce@microsoft.com>, Marc Zyngier <maz@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Michael Turquette <mturquette@baylibre.com>, Anup Patel <anup.patel@wdc.com>, 
 Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Fu Wei <tekkamanninja@gmail.com>, Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH v2 05/16] dt-bindings: clock: starfive: Add JH7100 bindings
Message-ID: <YXtRhwULuIzvmOnt@robh.at.kernel.org>
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-6-kernel@esmil.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211021174223.43310-6-kernel@esmil.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_184847_305360_2E7E59D6 
X-CRM114-Status: GOOD (  10.81  )
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

On Thu, 21 Oct 2021 19:42:12 +0200, Emil Renner Berthing wrote:
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> Add device tree bindings for the StarFive JH7100 clock generator.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
>  .../clock/starfive,jh7100-clkgen.yaml         | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
