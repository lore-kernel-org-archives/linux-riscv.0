Return-Path: <SRS0=OV2N=HF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62EAEC433DB
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 03:05:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D39561606
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 03:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D39561606
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=JzPljhJjkO11YPLlKAHR700Y2CXophWxDQFvm30wxdk=; b=3ZjTkQ7V3gPXHMvtcmLF3qqng
	ni7tl87TbNxgITxNhW0s/zDAUsmvKbed9l2jte0e/qfsjSx25uM1+9GbltOlVJ2wdDCUTkxt5awj3
	AHuo9BzbUF91LIcSgIMSHcWLZoNe/gGx8jxg+bQL9zj+2Iw/egvgVbdaZCWPOXx4rpKMvX0nxt9dm
	YBx319LJ/AHrFXUICut+u7S6x5fvCcie1Ae9LX3w9VofchWGJ0w53tGQRTaeFU8XEnBce8aYQPk/Z
	TUOKQMD4aFx5UcLaSMV6ngbP1X//hp4kYxF9/5YhpLzH2sX8ezPYbJK/4tnVX4/RToiZ0QeOwOGcZ
	IMs5cNzAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l78UG-0008Sc-F5; Wed, 03 Feb 2021 03:05:48 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l78UD-0008Rk-OK
 for linux-riscv@lists.infradead.org; Wed, 03 Feb 2021 03:05:46 +0000
Received: by mail-pj1-x102f.google.com with SMTP id m12so3537779pjs.4
 for <linux-riscv@lists.infradead.org>; Tue, 02 Feb 2021 19:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ZMWBq3ACFJJAx15ObrNGTwgdYr+KZMK5JwRK+RWgkj4=;
 b=UZ4hGLaf9PMkrkN83mYnxJXlf++H0dMxr/g9Y9bTLNpi0TBE2iTtTeNtV3Xb8wna5J
 4itg59xQJS97+0zFCzOedMXSau4kmkEtJ9oFLTjn3YiT2gqSVBEopZBVP04xkHc46hKy
 0WY+BorERSVJVGmmkD0ZLeGpapb657WKCn39plFzKSd6IQt1ivzztc8fHNXeXtvSt0Cq
 0Q/yXBlE0WIHhTrcNXwvidyCWtKl4lLPu0J7iY/nqtnCBuwmUCSkk7NU5NB8qreOXims
 AMg4fkZojCg/uyAcQuu0jmY9AozZ1c9E0PRZVlc1hRx4tRI2+1fCs0IkY+6NhSNzVxga
 TozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ZMWBq3ACFJJAx15ObrNGTwgdYr+KZMK5JwRK+RWgkj4=;
 b=jZMP2WjyCiQOA8NWjShN9UY5nrSWUUChLZmZZBx8nUqTVJoyPLw7x03ppzdcRBwy53
 sPclRa+k1pi4JjddbiUDoq74VcTvyiu+Nh4MiwZHbbYNNSMP3l6pQqcxOBtmIAmq3Ebs
 W675EovOH6gRxXJRSJTwd1X/Fyegxtj1Gh7tHKb2roIFyOdIKoe74GHEW2z5ophzZMGQ
 qXQeoh2G/oY8kh5GkKZaV6nURxS/jCYiJfKxiWFHG+v5u89Mn8r94C3v5ip5uMYsj8sI
 z6AwPh3SKbuPWqLila38aMSTD3k6rpD2uX8KyUsgduDCGOUsiCYuaVkl+6wg46TbZ+vw
 LbWQ==
X-Gm-Message-State: AOAM5300QEsyW/rKPWopby71t11nARsC3PF9tXD52MdjxOAdLL7ey76V
 WQOU2nEabI4h0UNF5TrPRd4jkg==
X-Google-Smtp-Source: ABdhPJzgKeAv3HDKvjGTFSaVzyDdJXRgRIHq2ify9sDpRJUoN3Yie4IWt1vmIbnRLWqV+R9QPytFYA==
X-Received: by 2002:a17:902:241:b029:de:17d3:423e with SMTP id
 59-20020a1709020241b02900de17d3423emr1138151plc.44.1612321543577; 
 Tue, 02 Feb 2021 19:05:43 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id n73sm329565pfd.109.2021.02.02.19.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 19:05:42 -0800 (PST)
Date: Tue, 02 Feb 2021 19:05:42 -0800 (PST)
X-Google-Original-Date: Tue, 02 Feb 2021 19:05:31 PST (-0800)
Subject: Re: [PATCH] riscv: kasan: remove unneeded semicolon
In-Reply-To: <1612245119-116845-1-git-send-email-yang.lee@linux.alibaba.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: yang.lee@linux.alibaba.com
Message-ID: <mhng-1a6dd811-fd09-409c-a664-7bbd9f9d8315@penguin>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_220545_807937_F1231AE5 
X-CRM114-Status: GOOD (  18.71  )
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
Cc: aou@eecs.berkeley.edu, yang.lee@linux.alibaba.com,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, glider@google.com,
 Paul Walmsley <paul.walmsley@sifive.com>, aryabinin@virtuozzo.com,
 linux-riscv@lists.infradead.org, dvyukov@google.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 01 Feb 2021 21:51:59 PST (-0800), yang.lee@linux.alibaba.com wrote:
> Eliminate the following coccicheck warning:
> ./arch/riscv/mm/kasan_init.c:103:2-3: Unneeded semicolon
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  arch/riscv/mm/kasan_init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> index a8a2ffd..fac437a 100644
> --- a/arch/riscv/mm/kasan_init.c
> +++ b/arch/riscv/mm/kasan_init.c
> @@ -100,7 +100,7 @@ void __init kasan_init(void)
>  			break;
>
>  		populate(kasan_mem_to_shadow(start), kasan_mem_to_shadow(end));
> -	};
> +	}
>
>  	for (i = 0; i < PTRS_PER_PTE; i++)
>  		set_pte(&kasan_early_shadow_pte[i],

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
