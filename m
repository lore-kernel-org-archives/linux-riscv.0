Return-Path: <SRS0=/fWr=LN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB1F3C2B9F4
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Jun 2021 06:59:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F3CF60FE5
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Jun 2021 06:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F3CF60FE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=EvNl/KU3LBI55RlsixPiZxPj2kDociLh01fBmL+hRK4=; b=c9Vjzt5SucSHetYW8LcDT7iHOW
	XjnrzheHetlcjLrFsmHzVofB9iTkQ/m/p75Xl8LtKkcVkNajdv2w9jaRK6pA1gWftyD3USSHxe5F4
	Vw2PFL/5VDOvDvbDfgOGc7sxp7zXrcMY+rYT4lcPWo/irbpX1jo36Hcsr45ojf+efmrHm0P5gAypX
	bjiXwSwq2fzrsl8Vfjt2tVF3ZnXsohnmLYtaJ9CH620aWWbMV9aJAcW3tgixoxnYO89dor95odbPM
	RYN9H7pkRgbpzWHh20ZuvQTOa/pTjYUi5GkWmXp2p9oPifkGtzF3XrAY++2z9DbkuSZdGAI9sDAA6
	XYMn1pVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luUwW-00GXbx-DX; Sat, 19 Jun 2021 06:59:00 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luUwI-00GXaz-0X
 for linux-riscv@lists.infradead.org; Sat, 19 Jun 2021 06:58:47 +0000
Received: by mail-pg1-x52f.google.com with SMTP id i34so4094312pgl.9
 for <linux-riscv@lists.infradead.org>; Fri, 18 Jun 2021 23:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=6G6cPxZO1wJYjwHrbxpVxaAvSGtra3d9/Cgmg5fS0ec=;
 b=rep5NbXILX/YeNH/6/4N5GvoS6zuRL6S+f7QP3zXVfCM6WkliZPvpn6mDMO/HdoFKu
 HKDL/gkmsxbvt21AyvwZpk3mjXcXS080KPOaZN/YzIgynENTAv9oh/UdEZ5loQahoFes
 Q7qklmZ3HO9TJtgV69JSN7KNB8D854Ut5e3eZhmYMEaKCoyb2yHXGQJNA4qN0lcxMQzz
 OnxOhexKSl4MYu7PJd2DYYbvHKHUMJrL+mxlXEeBIGmxRjM7vB+5825NtMVWLUeMZVZr
 WF9u62/+BW1JVown5eWKs438vmEqkxJq+W/zgP6WZ2zt2q/zsWhw/cDhavhGpIEz92ld
 ABDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=6G6cPxZO1wJYjwHrbxpVxaAvSGtra3d9/Cgmg5fS0ec=;
 b=EO5FO/sHQSt8I34QrZAP+VKW2G741rp6rnKd+NviKRTmTfVvJssRemv8niEWUgs2/5
 2CqHLPom8JI/yMutNS46IrDByR5ZnGGP+d7/Z5jmI0EVkWN+Siz2QSMy52+kLQI2KkSK
 wP18IJROcuJjQ6ln/dMU+fRmuJUc9Rn2ygRBuJilTL855A7REc8Zxbq4wpfeUmPDMYFY
 uHMRoVzJmUo+sx1JeujYUKl/Ks3sJ2QOalBTJs91Kwi3V3Eh4sy7+66TDGyii7/hIoTA
 OtwEdHZ0K1oB4/uuwtmLfo+xzeouN4sXZJrAuAA4vzGUrrXsDZqivb+9vyMwXmLSGpoo
 1G3A==
X-Gm-Message-State: AOAM533Tk260epwSF+j7cNXAEuk7g6qhgdNy6Yl0XLoeT7r88ClHM4+e
 1jSSIi3A3j1eUl1Gr3cuX5R3Cg==
X-Google-Smtp-Source: ABdhPJxh05kv+csFchihKpXjzobdKL1W5RfUylFFyQzDL6MWPQf+jiReEUZZNBriA/rLZY9uS1wJJA==
X-Received: by 2002:a63:1011:: with SMTP id f17mr13865826pgl.274.1624085924245; 
 Fri, 18 Jun 2021 23:58:44 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id z185sm10665908pgb.4.2021.06.18.23.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 23:58:43 -0700 (PDT)
Date: Fri, 18 Jun 2021 23:58:43 -0700 (PDT)
X-Google-Original-Date: Fri, 18 Jun 2021 23:45:54 PDT (-0700)
Subject: Re: [PATCH] riscv: kasan: Fix MODULES_VADDR evaluation due to local
 variables' name
In-Reply-To: <20210618220136.21f32b98@xhacker>
CC: ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, alex@ghiti.fr, 
 kasan-dev@googlegroups.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang3@mail.ustc.edu.cn
Message-ID: <mhng-b491e8d5-d7dc-4f5e-8b96-84d47360d85d@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_235846_150341_E8CF1866 
X-CRM114-Status: GOOD (  23.99  )
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

On Fri, 18 Jun 2021 07:01:36 PDT (-0700), jszhang3@mail.ustc.edu.cn wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
>
> commit 2bfc6cd81bd1 ("riscv: Move kernel mapping outside of linear
> mapping") makes use of MODULES_VADDR to populate kernel, BPF, modules
> mapping. Currently, MODULES_VADDR is defined as below for RV64:
>
> | #define MODULES_VADDR   (PFN_ALIGN((unsigned long)&_end) - SZ_2G)
>
> But kasan_init() has two local variables which are also named as _start,
> _end, so MODULES_VADDR is evaluated with the local variable _end
> rather than the global "_end" as we expected. Fix this issue by
> renaming the two local variables.
>
> Fixes: 2bfc6cd81bd1 ("riscv: Move kernel mapping outside of linear mapping")
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/mm/kasan_init.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> index 55c113345460..d7189c8714a9 100644
> --- a/arch/riscv/mm/kasan_init.c
> +++ b/arch/riscv/mm/kasan_init.c
> @@ -169,7 +169,7 @@ static void __init kasan_shallow_populate(void *start, void *end)
>
>  void __init kasan_init(void)
>  {
> -	phys_addr_t _start, _end;
> +	phys_addr_t p_start, p_end;
>  	u64 i;
>
>  	/*
> @@ -189,9 +189,9 @@ void __init kasan_init(void)
>  			(void *)kasan_mem_to_shadow((void *)VMALLOC_END));
>
>  	/* Populate the linear mapping */
> -	for_each_mem_range(i, &_start, &_end) {
> -		void *start = (void *)__va(_start);
> -		void *end = (void *)__va(_end);
> +	for_each_mem_range(i, &p_start, &p_end) {
> +		void *start = (void *)__va(p_start);
> +		void *end = (void *)__va(p_end);
>
>  		if (start >= end)
>  			break;

Thanks for this.  I'd prefer a cleaner fix for tihs (maybe more '_'s in 
_end?), but I don't think we can do that without touching a bunch of 
code.  Given that this is necessary to make the fix work for me, I'm 
just going to take it as-is.

This is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
