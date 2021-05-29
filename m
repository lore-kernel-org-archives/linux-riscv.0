Return-Path: <SRS0=5xGv=KY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0615CC47082
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 21:09:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEA3560FDC
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 21:09:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEA3560FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=56VIkvaPBp5uQusAyFtJO/dz9JHLXKjU85Wuud7thmg=; b=OQV4f1qhBVf1wXCFKEIuvMNE/c
	kI/4kcaXDl4pO805u0Yg+xn/y8zxzIU5vPtCFfvayNEqROPEvX3IoRQSQolfSFYNAP/iQ6FOBvy5f
	k7alwCcZwsl6MDJsWToxizlIi3OyZ6ywn9VeZe0K+dYPRQuCBU4nvwRPsqTc9xjs5YEONuNPJ9lfH
	FczkVYphHm9a3F8mk9K8mZvFpFnlZrRIWOLywLlpQG9BYgY676KTOrv1d0UKlFqmSSe3wOdRWoDpK
	Z3vk4ez3vx0nwPuPQfFfwTQinwbHVWVm0ehTskNDu5+5uPTviTD1ncLfLhjQj4VxZzmetx26moSSE
	9AFcaAkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ln6D3-008NYG-1p; Sat, 29 May 2021 21:09:29 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ln6Cz-008NVm-N5
 for linux-riscv@lists.infradead.org; Sat, 29 May 2021 21:09:27 +0000
Received: by mail-pl1-x62e.google.com with SMTP id e7so1210251plj.7
 for <linux-riscv@lists.infradead.org>; Sat, 29 May 2021 14:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=rnn+IDCEsDQ25SwgXB0vROKvgVGkyNLlJmZoTTAxvuo=;
 b=ibRtK9S0207hZoE19mkys3fz/PjntSlAuyWW77pHju6/AM7gC2u32QvV0SA0D2Om+j
 U0FgEsLX/WesFWD87GV7I5o9IBS50BFVZDmW62WSTtjTxxh9QZbmoL7OgEJFS4bjYoWw
 2hOaQX5EuGbvmfHy62iT9eAPVkeOWz+NxGNUwQbN8jN0LfY6oC0pJOV4F336w3tOIkcA
 rv3gVjeEJQVEP+8rANcn3wEL5q6iGBTykiAgoYOKxivxBU2Ic7sd3tgM19QOB5ZQnaba
 t5nGgxSsJ48lOjCajmcuJZEGuEw8RFRrLoBkd8LQd18k9O2FXWakwqxEzGsBbste6QHo
 Avrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=rnn+IDCEsDQ25SwgXB0vROKvgVGkyNLlJmZoTTAxvuo=;
 b=JaKd4PCBmmjgGj2bOi796LsfUWeZoJxozJf+GyT/DX5sxbmT8+Y25z7m7G6UGUrhiT
 r1I5YnupF6hUTovYvntXYMdRzv8VhL/fN/biMbOxUOQAXSOaoDZyJBh1sMhVjYxsYsp+
 nlwdDKcnxWZ4hmHShFCFyOUKt865yvXMJCs6+YHO74SbLDAVf8f46494uuo318EmEUNX
 5zScepWp8v3zic5tbfeor1BXZxcK8iQK58nUlgVRgeSmA7D8O67qP1BnmPPhlKc3K0nY
 wG4ywxKYUHt1CONZ/qSo+ChpcfL4IvpyVv2f53iYrAMYrXaOzt8brHar65j8BBW69yZS
 GW1w==
X-Gm-Message-State: AOAM533AdHkw1fjHHg8ShP3jIwStag51ft6hjfBd4jhvBK9lq3IS1UUC
 XhMLU07Ee2GvVGG9cLRHV7STcA==
X-Google-Smtp-Source: ABdhPJxuQEeCxsOobD1eRLVatbSbAdA4RG2xlwkhznzOxBL+vK6qltN/wCGjH0HAK1aRRDn+N4wcyg==
X-Received: by 2002:a17:902:bcc7:b029:ed:6f73:ffc4 with SMTP id
 o7-20020a170902bcc7b02900ed6f73ffc4mr13672583pls.1.1622322564565; 
 Sat, 29 May 2021 14:09:24 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id h1sm7191398pfh.72.2021.05.29.14.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 14:09:23 -0700 (PDT)
Date: Sat, 29 May 2021 14:09:23 -0700 (PDT)
X-Google-Original-Date: Sat, 29 May 2021 13:39:41 PDT (-0700)
Subject: Re: [PATCH] riscv: Add __init section marker to some functions again
In-Reply-To: <20210516205942.4671f4e6@xhacker>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang3@mail.ustc.edu.cn
Message-ID: <mhng-ed3b99bd-e31b-4fa1-b147-26cce86942aa@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210529_140925_776713_121AE1C6 
X-CRM114-Status: GOOD (  17.94  )
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

On Sun, 16 May 2021 05:59:42 PDT (-0700), jszhang3@mail.ustc.edu.cn wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
>
> These functions are not needed after booting, so mark them as __init
> to move them to the __init section.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/kernel/cpufeature.c | 2 +-
>  arch/riscv/mm/context.c        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index a2848dc36927..d959d207a40d 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -59,7 +59,7 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit)
>  }
>  EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
>
> -void riscv_fill_hwcap(void)
> +void __init riscv_fill_hwcap(void)
>  {
>  	struct device_node *node;
>  	const char *isa;
> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> index 6d445f2888ec..63dc0b9bd8aa 100644
> --- a/arch/riscv/mm/context.c
> +++ b/arch/riscv/mm/context.c
> @@ -213,7 +213,7 @@ static inline void set_mm(struct mm_struct *mm, unsigned int cpu)
>  		set_mm_noasid(mm);
>  }
>
> -static int asids_init(void)
> +static int __init asids_init(void)
>  {
>  	unsigned long old;

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
