Return-Path: <SRS0=jBL8=HZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93AECC433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Feb 2021 02:58:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20F3F64E4A
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Feb 2021 02:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20F3F64E4A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=LyPvWXY2ex9qTlohjRD1PN42mLDxWnS5yDWw3Mpo5kQ=; b=SYV1jqNJQQbcnPwrj7S14tesV
	08rA58JuXt3FtKd1O8tfI327nbjvjlVsK7n2KMjPih4FvvsO3/D5uEqm/yowEBlhTOL5tMml5kQey
	wYZhNNJW7dk9lQSuCim4+P+ZR4mRTnIXU5wpfVUZiOtg5N9agagfZ8xCDP2kYMhdBpeG4553PrLb0
	6NGsRGn2Z86x2FQQzrX2pl+pT4Iv6twlqBsMAMDAIMeP5xV5FgzKk1w2NzoaRaQFMWvRpY5ZzfRYA
	6CwVmLQxEq3tRQLPqVzGD8t3JfOsCH3yyvLLBp7mDqA9O14l3RXHLrnHAxsRkJknXwD6JGzlLthIx
	8baeuvUeg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lENu6-0000Yu-Eq; Tue, 23 Feb 2021 02:58:26 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lENu3-0000XO-2J
 for linux-riscv@lists.infradead.org; Tue, 23 Feb 2021 02:58:24 +0000
Received: by mail-pl1-x62d.google.com with SMTP id u11so8943382plg.13
 for <linux-riscv@lists.infradead.org>; Mon, 22 Feb 2021 18:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=CjGqwkyVdOUjMU+Osg0oifDQj76K6GurWtUd7NJehmk=;
 b=fTW6i4gdM2obLimij+JFj3ntaPTwvLB9LjMmcTjo80nsNH8VXX4WNnFpTCGnne9AHV
 qjnlo+QofPbzQWHkrJXdwa1fzqxqrnB8LZzp5zFCURkf8Wy03P9xcW5EPPwbqvqSlN+g
 okL1wUv3JKsatvsOLK4rixUhUBV956To9jwh9CTm4YFu6IgRKsFw59uKT56dNvFMairN
 mA8thPoCr2WreDAWn361qDac7cJ5w4/Hwh0E5OPY/DfbcB2y+5pij9hM2PYIaKymREpn
 wqvCAuELFJkLdvhq9A2p7+9LnWwWRXgiB/L809GZOzJs2kgRakJNeelcMphuoej0tfIm
 7Tcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=CjGqwkyVdOUjMU+Osg0oifDQj76K6GurWtUd7NJehmk=;
 b=JZCvdTSC0A9ODRCs6FimdaXfaYt3ZkNM0RMcUq9S8vIMEseAX/SYt2prvyfFo6NPnz
 U2Oye4oo5PrIbzngauc6/mpdJIJ2Nw+GWLjMUJftcQZR/f4hirNSqDhBJK4eeHhbtiXA
 DqoNxFsuInmCuNsvjYfPrHBCToMkzJEI3faVEerfQT6myc8BIt8VMh6L2RWXouD+V9NK
 hI5PZrTj92gI/SHVw5BQ5iLqb50gxlEKvOF7EmgE3Blt5iaU10ZTduyKExYZdVOLgIgy
 T1dmeiaVr25HeGnc9NjRMmG/VV2HC4hNgGsGVeLNFmyLasGTIlpExHB/LjJ0BnQ49AZ1
 bTZg==
X-Gm-Message-State: AOAM531iWl6rFOKh/T2jXqa6PxQlhxgTfSZ7uziNx1oMD+zNlQ3dtnu6
 KwzDWx3k6xSOBusn0fDv3NxiZg==
X-Google-Smtp-Source: ABdhPJxxijb0gsLekm5CEtAUePwNAVm4vwpXa59OIi8JYMbQ7S+nv1HiGkaz0VwCoKnCI/D7CufSZw==
X-Received: by 2002:a17:90a:8c84:: with SMTP id
 b4mr26336255pjo.21.1614049100590; 
 Mon, 22 Feb 2021 18:58:20 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id j26sm20162062pfa.35.2021.02.22.18.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 18:58:20 -0800 (PST)
Date: Mon, 22 Feb 2021 18:58:20 -0800 (PST)
X-Google-Original-Date: Mon, 22 Feb 2021 18:36:27 PST (-0800)
Subject: Re: [PATCH] riscv: Pass virtual addresses to kasan_mem_to_shadow
In-Reply-To: <20210222080734.31631-1-alex@ghiti.fr>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-ed9c69f4-96ab-417c-90da-4c03a48d1268@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_215823_292353_E8C88727 
X-CRM114-Status: GOOD (  18.51  )
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
Cc: aou@eecs.berkeley.edu, alex@ghiti.fr, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, glider@google.com, rppt@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aryabinin@virtuozzo.com,
 akpm@linux-foundation.org, linux-riscv@lists.infradead.org, dvyukov@google.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 22 Feb 2021 00:07:34 PST (-0800), alex@ghiti.fr wrote:
> kasan_mem_to_shadow translates virtual addresses to kasan shadow
> addresses whereas for_each_mem_range returns physical addresses: it is
> then required to use __va on those addresses before passing them to
> kasan_mem_to_shadow.
>
> Fixes: b10d6bca8720 ("arch, drivers: replace for_each_membock() with for_each_mem_range()")
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>  arch/riscv/mm/kasan_init.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> index 4b9149f963d3..6d3b88f2c566 100644
> --- a/arch/riscv/mm/kasan_init.c
> +++ b/arch/riscv/mm/kasan_init.c
> @@ -148,8 +148,8 @@ void __init kasan_init(void)
>  			(void *)kasan_mem_to_shadow((void *)VMALLOC_END));
>
>  	for_each_mem_range(i, &_start, &_end) {
> -		void *start = (void *)_start;
> -		void *end = (void *)_end;
> +		void *start = (void *)__va(_start);
> +		void *end = (void *)__va(_end);
>
>  		if (start >= end)
>  			break;

Thanks, but unless I'm missing something this is already in Linus' tree as
c25a053e1577 ("riscv: Fix KASAN memory mapping.").

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
