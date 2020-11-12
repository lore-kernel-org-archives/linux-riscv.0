Return-Path: <SRS0=fdZL=ES=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F00C2D0A3
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 07:21:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DF77206E3
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 07:21:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dhXDyDBo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="o695KMSl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DF77206E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wQkYEvBGy4DWR6xU7KnrLNy+UFUr7S4Kt8cP1Jq8N3k=; b=dhXDyDBo/Ie1RBtoGPEu6Eyza
	kA0TzW/SMoQJEmOHsjvkkNNXC5Squ9L2vsxVTtO12l7sFWDDrC8AK3VimX5lnaLw/A+U7M1bLdR9s
	IZFiGdMeqgPG3ztD5J7xcvxQV+yBRVT2kw32uifNzBuRPYh70GWp0/s9fkGExDzxKhz3gmXI6e4KR
	FbfVT7G4YncrYIwBvLnR0puy2FvynWxwvcx8Et9Ry3gf+fHhZ2L0q0KECbgIFmhOQKUmKkxCfmvkX
	wp9yMm0xW01OiKbCFkldw5JzrpkS08CankwGvwHMIUCEz/ANyIgJhUVYFL0HyWQDg9J0MLnANwU7N
	VHwYdZE9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kd6vE-0004MY-Rh; Thu, 12 Nov 2020 07:21:32 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kd6vC-0004M4-3S
 for linux-riscv@lists.infradead.org; Thu, 12 Nov 2020 07:21:31 +0000
Received: by mail-il1-x142.google.com with SMTP id y9so4384378ilb.0
 for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2020 23:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ab2X7D8rQV+rUh3MG2vmCj3eeC4kvsZIlLSd9hzapi4=;
 b=o695KMSlvlKK8s2nZB3RnNNjASazEvqZxx7SlWDLIfkA7DjvTGHQKtr7OeUjA+JK/W
 6AsWT7BcKyt6qJFEm42kuZq/NhNqqk+O/5M33EKitgOxYwwKwIv4xVOTPW0KtSDKxWoi
 N/WtmAKQP0MX+WWeb1AnqArll7M6n1MD4y/2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ab2X7D8rQV+rUh3MG2vmCj3eeC4kvsZIlLSd9hzapi4=;
 b=eFqlMITKeRF7aqcOdLDFgGcfAnLPLwhTwmE7699WX0qFX6gGPJfhI2qNvGClrPuNpu
 h0ROPumkzEOx4Bfyid6SIr93ODci9ouLddpt8aSnEVC1j3PzilpmtYSJjIiL2rJkOK8P
 I0XsBVqUHEKNorkdnPKggZqtXGBO/Wu0mtFvZsa0feBWzZea629E2cRqeWnF+iNsrnT2
 5HywPe+mn72lyvd0rvSw+Mvq1eFOfGdemf7PZhFZpHaUZIW5EmXC9vosMNRkdCfqqEnX
 zvotbdV4KuHlKHVsyDTkAe3e1QuRbGsJzpqveTlzNwlqRHbcqkdYay4YUVc4Ba672Jhi
 ctqQ==
X-Gm-Message-State: AOAM5303bnBpAapORYc/3y0Zz7JlWwGPh8Pg0rcr5EWK3U5+O+qMeKI2
 gjUK5R+CMFQsCns4RrTG9rwmwp3WKxz3TmnSHQNw
X-Google-Smtp-Source: ABdhPJwG3l0icsmB1IU32yQpvlFd8k79z2GNzpvnNWW307BnW87hWqYbQJNHXepVhLwR9j1SCouAAn38lAiRUpIrLCw=
X-Received: by 2002:a92:512:: with SMTP id q18mr20861835ile.147.1605165688041; 
 Wed, 11 Nov 2020 23:21:28 -0800 (PST)
MIME-Version: 1.0
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-9-damien.lemoal@wdc.com>
In-Reply-To: <20201107081420.60325-9-damien.lemoal@wdc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 11 Nov 2020 23:21:17 -0800
Message-ID: <CAOnJCUJO3Oqy94MbT-eV+xaJn9obE0H=zpvuJuch-aY5e9bfgQ@mail.gmail.com>
Subject: Re: [PATCH 08/32] riscv: Fix kernel time_init()
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_022130_548373_CA5D8EBD 
X-CRM114-Status: GOOD (  18.07  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Mark Brown <broonie@kernel.org>,
 Serge Semin <fancer.lancer@gmail.com>, linux-spi@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Sean Anderson <seanga2@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Nov 7, 2020 at 12:15 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>
> If of_clk_init() is not called in time_init(), clock providers defined
> in the system device tree are not initialized, resulting in failures for
> other devices to initialize due to missing clocks.
> Similarly to other architectures and to the default kernel time_init()
> implementation, call of_clk_init() before executing timer_probe() in
> time_init().
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  arch/riscv/kernel/time.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
> index 4d3a1048ad8b..8a5cf99c0776 100644
> --- a/arch/riscv/kernel/time.c
> +++ b/arch/riscv/kernel/time.c
> @@ -4,6 +4,7 @@
>   * Copyright (C) 2017 SiFive
>   */
>
> +#include <linux/of_clk.h>
>  #include <linux/clocksource.h>
>  #include <linux/delay.h>
>  #include <asm/sbi.h>
> @@ -24,6 +25,8 @@ void __init time_init(void)
>         riscv_timebase = prop;
>
>         lpj_fine = riscv_timebase / HZ;
> +
> +       of_clk_init(NULL);
>         timer_probe();
>  }
>
> --
> 2.28.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
