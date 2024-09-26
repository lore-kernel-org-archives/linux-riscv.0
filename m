Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1504ECCF9E9
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2024 09:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y5FFocOt3XBeqAQGyTk6d3yB8/YN16d0opX+dx9J3Rs=; b=NBSDcn6daIiXDI
	R+YgbmLvUASM7kk6LgEmEb72TpKz76idt9GERMpyIcl8vX5J4wi7qEdvpI8MCenCQ4+KFn+EgA+KG
	yfRKrhST+7q02aJte3qJPrcODZDWD1aAa3QPg+TNtUm/GCzKT7n+zD+RZ21brjml5iUvRuQ5Hww7V
	PQxNh/hx7x2YYuZN7knGLfSmIf/PMjc5LULtSgznunbP9/2/tFDiFQEtz3QsivVtegAlOKeATcOLC
	+TBx58nFqrIkbTCUDStlnxRpik9D/2z7IouioIHB0LkPSnRK9c798SBNY30GS/Fqz00ZC/fYRrbjW
	69QSMHCpNNRCtl0gJgXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stlAi-00000007xzV-0L3V;
	Thu, 26 Sep 2024 09:52:28 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stl5h-00000007wYC-0MBo
	for linux-riscv@lists.infradead.org;
	Thu, 26 Sep 2024 09:47:19 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-42cb806623eso6221265e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 26 Sep 2024 02:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1727344035; x=1727948835; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/LSQ02N1RzZQqc2enuj2Tvq1BwqNOjenbSCTfQ1lHxM=;
        b=CO92EUOJ/IhXCR3WlJYZk1LbS3sRuFgAh7gmz4HLT2cl9g/0reBJHdSmjI87Z+NvgH
         pXrLC91qsirZo3Db6nlkrOGmu78PfbkrHG4ZNFOLGV1nMSaLkAvRGziNQdcmtYGEQycF
         vdKr++29nHS1+Pm/5Br+QiMEYe4xVye14nHT+fsXWtV2qmIiCDTrMukp06N1nclUTjXs
         9wovs/x1oebFCUhQxhvclM/phTK5SCFIpNNALAlWJacujda7DrM4MYs3JXIj6QXdRbow
         A8oZqFYgODF11hYPcQBg6hHJFaxeMxc9UpdvLXuKJTXhahLg25KRnvcn1ds0HLo4LRz4
         4aQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727344035; x=1727948835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/LSQ02N1RzZQqc2enuj2Tvq1BwqNOjenbSCTfQ1lHxM=;
        b=GUA2SZfRM+2KbjkbZT16n/dR/BkchVQbN2BVlxmNqvKT8ay9UnRWmNDSJfxe16VleG
         PuLh8pGYI2JjO7+pi8lKo9rQ0x3lf7Kf/Z+MoKCxSZ9kr8W+77V5vj6GsCGWQh6ATXeb
         2XUN29E8UE0FnsNFtOHbXSx5+hqVtK/H0Q/gkX44eMOZNCEt3ibMB0Tv1Q4f1Sl8y2jp
         oXJYB4yVQtdu3fUP8Iah/h56i97owoHq4B/EmRjfAbXpLF75+wJaFKTkgUSf5eUV2R6T
         Qkbtr/wDP9w55K6smpmKMUUIR7NP4d+s0xYnxkb0B/+2r8ULk+tVowr3nhqMTQO/O/wW
         meqw==
X-Forwarded-Encrypted: i=1; AJvYcCUXsfcaj3BDuJrvlL+PoNmwdiQuQPhTdjY9/28YMtxAkw4z4qlkKntGY6z2xeovLHxTpwoLjKZOebbkdw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzAHiikWpahYV7JxR7I4rbgaio1GTAPJIp375MaJv+i4qsRg8EP
	UILlOjd6OPQnMo0dwszgQr7FDxUNw4UpbtUo0piPsk2DhQ5/XsnUEBkVt5xI7bi0C7aBF0RU2Kq
	J
X-Google-Smtp-Source: AGHT+IE3qgHzuWsAu9qO4coJy5+IsI0h/T+zUZ764Cb+dgkVLEukEcIucL3ssR2DiXM47S3CNpjY2w==
X-Received: by 2002:a05:600c:468a:b0:42c:b950:680a with SMTP id 5b1f17b1804b1-42e96119222mr43160685e9.20.1727344034778;
        Thu, 26 Sep 2024 02:47:14 -0700 (PDT)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969ddad1sm41992855e9.9.2024.09.26.02.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 02:47:14 -0700 (PDT)
Date: Thu, 26 Sep 2024 11:47:11 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Nick Hu <nick.hu@sifive.com>
Subject: Re: [PATCH v2 3/3] clocksource/drivers/timer-riscv: Stop stimecmp
 when cpu hotplug
Message-ID: <20240926-b0d87e489410fd9f83796a71@orel>
References: <20240926065422.226518-1-nick.hu@sifive.com>
 <20240926065422.226518-4-nick.hu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240926065422.226518-4-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_024717_166894_AEC753FE 
X-CRM114-Status: GOOD (  17.25  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Pavel Machek <pavel@ucw.cz>, "Rafael J. Wysocki" <rafael@kernel.org>, Anup Patel <anup@brainfault.org>, linux-pm@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, greentime.hu@sifive.com, Thomas Gleixner <tglx@linutronix.de>, Samuel Ortiz <sameo@rivosinc.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Sep 26, 2024 at 02:54:18PM GMT, Nick Hu wrote:
> Stop the stimecmp when the cpu is going to be off otherwise the timer
> stimecmp register while cpu non retention suspend.

This commit message seems to be missing some words. The comment below
reads much better.

Thanks,
drew

> 
> Suggested-by: Anup Patel <anup@brainfault.org>
> Link: https://lore.kernel.org/lkml/20240829033904.477200-3-nick.hu@sifive.com/T/#u
> Signed-off-by: Nick Hu <nick.hu@sifive.com>
> ---
>  drivers/clocksource/timer-riscv.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> index 48ce50c5f5e6..166dee14e46b 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -127,6 +127,12 @@ static int riscv_timer_starting_cpu(unsigned int cpu)
>  static int riscv_timer_dying_cpu(unsigned int cpu)
>  {
>  	disable_percpu_irq(riscv_clock_event_irq);
> +	/*
> +	 * Stop the timer when the cpu is going to be offline otherwise
> +	 * the timer interrupt may be pending while performing power-down.
> +	 */
> +	riscv_clock_event_stop();
> +
>  	return 0;
>  }
>  
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
