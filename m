Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CB4C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jul 2022 12:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R9CVTn3ZvbE7pSK9r34G7m2jhwkOY3TZwg5v/oKRORg=; b=3l58MVXsHXbWAk
	u3cVNYRci3sktsEsMBgkhbhiNogosfTSCdpYqnMBHMeot3JIeHdDah+BFY99PPc2kOIFQWd4L0stQ
	1GK7arAqXCR4tbUkYRjoLug/Cc4Y+FzTCnnE4Xp6ZaFmcCQAe90Z5+/gqPye2cT6dShBLM1IV2wlo
	qTux7KCv6yXsistucwL9eZy715oW90lGByzoTM8247G3TScttLnb0kTj1aPt/Fd/B0bmWvx/jmF2R
	omnPA8Bsp77YNnVZi6RIwrFku3VcwoCGEIX/3f6BVX48X5hl0AAd2GVy20nqivDz6wD59sroCN3E9
	Vi8umGsXUvxp20kyjxVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDPcj-00D9WI-8L; Mon, 18 Jul 2022 12:13:17 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDPcg-00D9U0-BO
	for linux-riscv@lists.infradead.org; Mon, 18 Jul 2022 12:13:15 +0000
Received: by mail-ej1-x633.google.com with SMTP id oy13so20807336ejb.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 Jul 2022 05:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Xr9CvkTDvuMZeQMh9+eMzYOG12NC3FJD/c9aCUtagVA=;
        b=e4d+Mt+8foj4JG11SJ8E0TcLx4NkUO99IeHLFxan6SMsk7AVJ9qD4Iu9U40AcU0QOX
         82wBDjjI7Q3FkVXWINvV6wNSM6bWN3sse0iv5i46dy/nlnBTtzgzGP2+A7Rl0s+k+BsH
         vi/9cRjdQmzfHf8gBOqvxw5DuPwhmwylWT5tSUGRWsOBTw64SWELaVp0mCM2h0pg/7hx
         u1PwEaVDXA7pr+W5aI9Xoo3MaRThnK5iKG9PPtn9ppMmyi3F/H+lKzLd94AULallE2xI
         QlmXKoIoj0TAvmGxnS4HfufUUB5nd56Xiuu0McmqrBJAvKPvGkDybeqiB3iPwQxk61Um
         KF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Xr9CvkTDvuMZeQMh9+eMzYOG12NC3FJD/c9aCUtagVA=;
        b=hZ+qJlTR5rMiH+7W5WtYwEmAxF15RAI+ZXwBk9Ju4d/Hxw7xO/GURSUD0eTkAr9tm+
         +ksn5EcDXFQD/678ifVIbbFSyBTmYTHCtbAZxQ3kLtVEbYxDdk0T3I+Q4CY6sLyKamVU
         iwmNQm3foLC3Hg3BA9F7U2Ew/TjXMhf1WqerXJ36i86eF1dqdSql7ES1N9zuiJV0s62y
         NBvT3+Bf3VexipmP3oyeIC7ky8mf9085bCyuM0i7bi/FkQHshygIlorMDlq2pwm8qN4j
         hD4vvHnQkBlQRH0wD5plhQE4OYJfSJt9fTd7OocoMngg4EyjkO4Rd9vvHqldRApmBpNQ
         jV/Q==
X-Gm-Message-State: AJIora8DafYBpZ2Qem5m/26ESyBLHRoLksnhDJdy1CQz0vlFCS+ss3pD
	rMpLcAFg4dRYjYVyRGdb32+YVw==
X-Google-Smtp-Source: AGRyM1umuq2kWBtaOocGxk5zcLfpqwYWnOG089FeASyXAeDr8n1nNlLTQbWyCo8DPxwTNAkSwqgB1w==
X-Received: by 2002:a17:907:2855:b0:72b:67b7:2c28 with SMTP id el21-20020a170907285500b0072b67b72c28mr25408917ejc.331.1658146391972;
        Mon, 18 Jul 2022 05:13:11 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id o22-20020a170906769600b00722dceb3f8bsm5460888ejm.151.2022.07.18.05.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 05:13:11 -0700 (PDT)
Date: Mon, 18 Jul 2022 14:13:10 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Liang He <windhl@126.com>
Cc: atishp@atishpatra.org, anup@brainfault.org, will@kernel.org,
	mark.rutland@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] perf: RISC-V: Add of_node_put() when breaking out of
 for_each_of_cpu_node()
Message-ID: <20220718121310.ndxz6ppqitkvu2jq@kamzik>
References: <20220715130330.443363-1-windhl@126.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220715130330.443363-1-windhl@126.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_051314_411710_71AA4BB9 
X-CRM114-Status: GOOD (  17.89  )
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

On Fri, Jul 15, 2022 at 09:03:30PM +0800, Liang He wrote:
> In pmu_sbi_setup_irqs(), we should call of_node_put() for the 'cpu'
> when breaking out of for_each_of_cput_node() as its refcount will
> be automatically increased and decreased during the iteration.
> 
> Fixes: 4905ec2fb7e6 ("RISC-V: Add sscofpmf extension support")
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index dca3537a8dcc..705d249a1b53 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -666,12 +666,15 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
>  		child = of_get_compatible_child(cpu, "riscv,cpu-intc");
>  		if (!child) {
>  			pr_err("Failed to find INTC node\n");
> +			of_node_put(cpu);
>  			return -ENODEV;
>  		}
>  		domain = irq_find_host(child);
>  		of_node_put(child);
> -		if (domain)
> +		if (domain) {
> +			of_node_put(cpu);
>  			break;
> +		}
>  	}
>  	if (!domain) {
>  		pr_err("Failed to find INTC IRQ root domain\n");
> -- 
> 2.25.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
