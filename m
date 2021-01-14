Return-Path: <SRS0=X6bA=GR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7142C433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 04:58:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0473238E7
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 04:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0473238E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=dmj0Fzowtf2z1ZBCyv/N18yWkIXUO9dxLtpNc6P8tY4=; b=R0dnh63ACW9cLNsAHV8q5CTr6
	vmzL/1/ftNO7XjGHyNLOBvYu48MiahPtmIAAynWhG9Ig4wDXIcCqVb+VOqH//4SAq3tov2IOJCx2H
	eQ7vusz0ug3T15KUal/4lUQ4winj71u2nC+cQVv6tFHL1ZuUB6V1xTiJu0/1pr/coYtafdrlR5ZKe
	1XRjgsrVpV7RXolFEaaqu1q34nBTSLdSFGkS7loljqrFywewloBneS+4Xqq+D3UfR9saccUM80Yoe
	cVE7j31pOiO/ZkFSGCUYgQFAfBtVWBNHWe9B1dXIm6+twen/wvxKBLn/NkXD4EMWQs9Wfi9/UVozR
	Us6GC41Ww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzuho-0002Jq-Qj; Thu, 14 Jan 2021 04:57:56 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzuhm-0002JI-Tk
 for linux-riscv@lists.infradead.org; Thu, 14 Jan 2021 04:57:55 +0000
Received: by mail-pg1-x536.google.com with SMTP id c132so2978787pga.3
 for <linux-riscv@lists.infradead.org>; Wed, 13 Jan 2021 20:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ZmdvymZ2qR4M/qVQyd7uYkLb/p5vBHQAHMPmoaJ6QXk=;
 b=rkJ6uQ+C605Q6EPuu9YPwJJbBYW0XB14gDEmJLZz2PUOcvKxzjE0qwMHHpIWYaCZBJ
 Wha8QlgLwnkBgsVTSNoe5Xbo5t3a54xVmtuq+9og4XRPpTDgqgdsMo47uyOp1xJWURsi
 S69zWlGNMYZbLbdRCOvAq79H3RBMoLMK4A4udGIDJW3gugzdBlsNIVncy+/D/y3g4Xpe
 RYNlWEz4oSs45/ZfROjOYdj0eLzsm4OpK//cgFNqhjDk/Uel8ElpeMjsGcm9rAOQHXns
 o9uUEkOb2lCDrDPrdDSNYZdf4gGC4296AcejCEsRCd6NHEemI4KxKrYXbC/WNXpwQdlt
 /zNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ZmdvymZ2qR4M/qVQyd7uYkLb/p5vBHQAHMPmoaJ6QXk=;
 b=PZdILseNYy7GjeXBqkuPsmw0tzWVRyBmayn9WP+BIAjCTvNqOH/2g6V1kGnJzeJhIt
 2BqVxaOCcXOWtJAlvmFVLzXEW21EXcKlScXsYWvK/JsQ9Qb2Q4hj/I5wsKw3ZUQg/GLW
 amrPNtJHukqU7tJJ9HxT5xyMTzlEB65GkChT5QrG7eCFLi6vYXTtoFPKcLYEShX37sSh
 wSIQLGzn3Za3ByX0lSbcerBZXrFQGKhqXNGIOGoQXOpItVNU8pQHgf8Ybdyw43RVKdPd
 pcCnB4qCHrDLS8MKD2d4liR47mUPprfbZzMbd8hFGMYM6XKrjiS65rDgb53lUm7av+gB
 pPfQ==
X-Gm-Message-State: AOAM531Zs1nQbtnTi6fYxdtU1zRgQbZvaczMkFeO5oI+h5KUSyE7wdPR
 8Vc+PuMUlKsBxmTxoZ30Wrk9mAka2K4/fQ==
X-Google-Smtp-Source: ABdhPJwqxSUQbNmucEQI6rjh19q1MtCjegKcrUNeFbM4I++9kN2AKCbutTS+6rDJuYjrUJLMS5KsYw==
X-Received: by 2002:a63:e40e:: with SMTP id a14mr5586177pgi.345.1610600270765; 
 Wed, 13 Jan 2021 20:57:50 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id az6sm3857596pjb.24.2021.01.13.20.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 20:57:49 -0800 (PST)
Date: Wed, 13 Jan 2021 20:57:49 -0800 (PST)
X-Google-Original-Date: Wed, 13 Jan 2021 20:56:52 PST (-0800)
Subject: Re: [PATCH 1/1] riscv: Fix KASAN memory mapping.
In-Reply-To: <20210113022410.9057-1-nylon7@andestech.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: nylon7@andestech.com
Message-ID: <mhng-40ebb582-4df3-4189-9521-5446cbe1a9e6@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_235755_076963_DE47AF6D 
X-CRM114-Status: GOOD (  18.58  )
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
Cc: aou@eecs.berkeley.edu, nickhu@andestech.com, alankao@andestech.com,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, nylon7@andestech.com,
 glider@google.com, Paul Walmsley <paul.walmsley@sifive.com>,
 aryabinin@virtuozzo.com, linux-riscv@lists.infradead.org, dvyukov@google.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 12 Jan 2021 18:24:10 PST (-0800), nylon7@andestech.com wrote:
> From: Nick Hu <nickhu@andestech.com>
>
> Use virtual address instead of physical address when translating
> the address to shadow memory by kasan_mem_to_shadow().
>
> Signed-off-by: Nick Hu <nickhu@andestech.com>
> Signed-off-by: Nylon Chen <nylon7@andestech.com>
> ---
>  arch/riscv/mm/kasan_init.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> index 12ddd1f6bf70..a8a2ffd9114a 100644
> --- a/arch/riscv/mm/kasan_init.c
> +++ b/arch/riscv/mm/kasan_init.c
> @@ -93,8 +93,8 @@ void __init kasan_init(void)
>  								VMALLOC_END));
>
>  	for_each_mem_range(i, &_start, &_end) {
> -		void *start = (void *)_start;
> -		void *end = (void *)_end;
> +		void *start = (void *)__va(_start);
> +		void *end = (void *)__va(_end);
>
>  		if (start >= end)
>  			break;

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
