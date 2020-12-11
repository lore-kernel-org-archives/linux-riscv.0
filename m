Return-Path: <SRS0=mTxS=FP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C545C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Dec 2020 02:09:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89F7D23DE3
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Dec 2020 02:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89F7D23DE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=rV9gmX5F7SmF7PTkortFALC9d77qPqd5yIGuqfLiw+c=; b=GQeGjBJtF5wpD+IRufCHIIoqu
	RgQiW04sni9LWDoENdrNzDtrqbi5GCrs2dHF6GKrIpzMN0Tb/Vhe9EQcypLeSxNjNhddH63kj3JhS
	/corVRgy6to/UTNZnzkStEvH0nTiW6JLhcZUcd22Qg08nFFXfEX0SK5eB1xe4wChGO5JV4FBwfFfb
	iE6hKt0tm/uO9jvJNaRoiR8YpEvKtXZ8QO8zcB90gfLcpp1lQC8Lw3LDKHaSt0oWgIpNLwk0FxhXA
	BQwI151lILDhDrrZQSlw9R1Y29TqlGmo4l7K9wr44d8QaLhipg1VeE1eOaLeqoY5kG4jbBzy5Bk1e
	BEuDsPniQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knXsN-00066p-W9; Fri, 11 Dec 2020 02:09:44 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knXsM-000664-0Z
 for linux-riscv@lists.infradead.org; Fri, 11 Dec 2020 02:09:42 +0000
Received: by mail-pl1-x642.google.com with SMTP id bj5so3821186plb.4
 for <linux-riscv@lists.infradead.org>; Thu, 10 Dec 2020 18:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=yVFozMuS5TpszRtC1MBvI/trOQ0D1L3gHa0W/ax0oOA=;
 b=k8FJa4VDPQKIdEmftoL3n6FUAM5QMAocbXYJ/7Soloen2phJ6pJB4fzg50cLxSiXxU
 4YUNAzAtglKo3O4Z41JfsSrtx1lyK5pJRXjCl4l2lgOP70ydco3CHVlneuIgbiyFo+To
 PlmwRhOL88+KOSgfDt8GPZyrwDUKhG1mQUy5PBKZGoxAYEvC+F50Fh+jdgTyhqAbnN9D
 ffGC9tqXaDiOwCzG7YTn7PJPpgElYpp1wJ4akk5JB+Mui9sjz5VSzsAmGcUzKeZiT7ED
 MAKx/bcYm1XSz+GvNPFj8sXXCGs6X7RwxxThYThNLPOJgEkMq01lBQGTimEdnq2ia6Q6
 OwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=yVFozMuS5TpszRtC1MBvI/trOQ0D1L3gHa0W/ax0oOA=;
 b=cQnCg6XPxGtIl2MZbB9pXgKe8otPcWwoToP9O4YClemiltfS8+HtAXTaPDvoY+OqK2
 +Zx9rBkrFVTYBD/b0m3G6Ootfqn7tuFxD4Pf8a/D9VS2OXG+X2ToirMVbEmLNuPGSqWO
 xiTdK8OmJO0XGdUEJOf2mi6/lEOZshUtFRPjOicN+pOTKbyKZylh17xmqM+tbuSLpE0Q
 Yf26wuP3z5L0+1m70YrjCBVKbbS0BbOUt/21oNw9h0+VL58hq0KN286aYTrb8yqE1zeQ
 eruI/Rh8QIDyqz1+qMPlifLc59SV3rAXO2D0+B7QVK78szVRT1lKJgnj+ZSyZ4myrBiT
 6pZg==
X-Gm-Message-State: AOAM532fT8/uSKchUKa6miHQi8/wMbJ0rYhrYZKB+xY07qkVMffjcs2j
 EKrHeBliUbDcIzOhA2LdFY/QyUrn3MSGnU+9
X-Google-Smtp-Source: ABdhPJw58HhmM/mjbuMOx2SsgiglRfhjytbaRsij/nVyvfyVpwwnqcvH6Tb/NnFTINsd934ZwIz2Bw==
X-Received: by 2002:a17:902:ed14:b029:da:9da4:3091 with SMTP id
 b20-20020a170902ed14b02900da9da43091mr8810178pld.29.1607652579869; 
 Thu, 10 Dec 2020 18:09:39 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id u11sm7868211pjy.17.2020.12.10.18.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 18:09:39 -0800 (PST)
Date: Thu, 10 Dec 2020 18:09:39 -0800 (PST)
X-Google-Original-Date: Thu, 10 Dec 2020 17:59:16 PST (-0800)
Subject: Re: [PATCH v8 01/22] riscv: Fix kernel time_init()
In-Reply-To: <20201210140313.258739-2-damien.lemoal@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <mhng-755e4570-fc57-48b7-9ca9-e032c5de0dc1@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_210942_080345_E8297CB3 
X-CRM114-Status: GOOD (  19.30  )
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
Cc: devicetree@vger.kernel.org, sboyd@kernel.org, linus.walleij@linaro.org,
 seanga2@gmail.com, linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 p.zabel@pengutronix.de, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 10 Dec 2020 06:02:52 PST (-0800), Damien Le Moal wrote:
> If of_clk_init() is not called in time_init(), clock providers defined
> in the system device tree are not initialized, resulting in failures for
> other devices to initialize due to missing clocks.
> Similarly to other architectures and to the default kernel time_init()
> implementation, call of_clk_init() before executing timer_probe() in
> time_init().
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
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
>  	riscv_timebase = prop;
>
>  	lpj_fine = riscv_timebase / HZ;
> +
> +	of_clk_init(NULL);
>  	timer_probe();
>  }

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
