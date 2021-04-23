Return-Path: <SRS0=nRIc=JU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BE5C433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 01:54:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56522613CC
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 01:54:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56522613CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=DwhQTKrAyV42ND0mE3ZMyEi3kEpL7wp815V/anFleyM=; b=UAQfIwOgZvJtuAJxcYjEHUgRY
	ulFccbrHMJJznTwngk8FQqh/hKt0s+Ss0w020o4wFZ2bPmmFkEOkM4wKjKpt8zUcGul8oQ8UglX6H
	Kk/LqdJD1tHvuUXhMw69M15MvLzjZeHFEF5K/JcygbVcekcKmx0AWwLfAYENlF2O0QhZvJobDrp9X
	in1QNemfsZN2HuCHXilPVQE5uhzB8sy2Tf7pmZ/A93l8EIqvAkQnTp8ZUKAuzCp53DXTtcqe3Y6x4
	IezP0xoalM31IXYngk4drViidPZY0ZTGCcm6qhadwHjpQXcjMgMVvlaWAYrJr9E5NtywMLbEVYocG
	cgW/PTEQA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZl0f-000Js4-EN; Fri, 23 Apr 2021 01:53:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZl0e-000Jrw-3L
 for linux-riscv@desiato.infradead.org; Fri, 23 Apr 2021 01:53:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=hWpkxbRFPrHzvBdyCxq0yM9F4eVkT1GLFQSzePBdBvU=; b=vy2U0wE0ohsl44vlpC07nLAgUj
 uDl3INaH/NatyC284U9U+LT+u71KFz10KaDIOb5LkMp6d5U28zIyNKIBB8xFvO8usnJEmd9Zwlygo
 v0S2MQ6PQElRXw40nFUgvERYy9xAck7pnw5q7rNa4VQ+n7tVYwClhzhJKiBkUGo6zxoPWnfZLRuU5
 c+UPU9A9+wTDQex8qjpLW+nWXRrmZRW72E2+1f/1n4S3THypgFtb8XRpuW/jtgh+NoQgMRdSlS8Cf
 5MFOy4Aem2RJ73ZklYvtub5pnl0s/Kr++f5G0KII9DD+moKoCiW6E1kJtJOMvlilUKbpDVffWKzPY
 jrIZ9IbA==;
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZl0b-00E5jq-MN
 for linux-riscv@lists.infradead.org; Fri, 23 Apr 2021 01:53:30 +0000
Received: by mail-pf1-x42d.google.com with SMTP id 10so24149190pfl.1
 for <linux-riscv@lists.infradead.org>; Thu, 22 Apr 2021 18:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=hWpkxbRFPrHzvBdyCxq0yM9F4eVkT1GLFQSzePBdBvU=;
 b=ui0YQ67r0GMCX0m9lG1nzigxAQyxN6UQjTQ38IAJMKfa3dvpbR9pKjP3RR7EV73O0Z
 e3A/51zX3+Qr4PGyqcUlm+zDOL6MNVoGcw8/3CHeek2cGdc2jBC1Q8pbyE58bMkzakis
 +1yR8DKBYTUf8GPeYAbNsW14EiKjMWOZE84VsnBXigwUzIGTtpYRWtoUgNSir9tuyXSD
 2djFeLgdvkxX08pFvWgY5AnfurYjLEAeyeMLXngalTqHEz5W0yEZQAN4u2IIJvqXLiyk
 kUhHqrt5OQRDHXXMOW7VEi4KPph11LcHxjf/1P+dVnVfRhh3bcXPLH17fHzButt0nxwY
 8vVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=hWpkxbRFPrHzvBdyCxq0yM9F4eVkT1GLFQSzePBdBvU=;
 b=rRxuGmACLm1w8byNzSPJJSI0ta6+GXfQ513LUsBoa+HpJE28tDeCslWpYNo8vFuSMy
 xfvsSnwedGxbvUDHXmM6/PmH2uGRnUmTZz9RtwNzQSfQjLW+Stgul1u8gl6Y4JoAa2AM
 90biL4ZuCohOI6/vvf9A7dforM7+d2fH8plzw558iI1aF/WVCsTcr+OQAMfWxB7dsX5D
 /tLcPUIy47kMTXGkqiVBedinvDjNFG0NV2AULwvTmFBWSoaDbVphqR6Xi3c8kyjGQ46u
 g19fJw03rMKxMckFVHkbOh+XbPpE9wYNdaN+FosRgtBDcMzk5dsQMu+3g9JWEocT+0EO
 AG4A==
X-Gm-Message-State: AOAM530C8cZXYjkViwo0/h9IyKhn6U1HO1cPGJVi/bzFsmvdvptaLQL9
 8G5sHvOFfqFHggpeci8ykiw+Vw==
X-Google-Smtp-Source: ABdhPJwhOCtZhiWeV5BXgLADTWwMhpuimis0nWYpyu/hpAfFNe2Pgn6BjVC9l+syYXOFfmH5snsLXw==
X-Received: by 2002:a63:ec4e:: with SMTP id r14mr1567362pgj.153.1619142808475; 
 Thu, 22 Apr 2021 18:53:28 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id u18sm3113176pfm.4.2021.04.22.18.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 18:53:28 -0700 (PDT)
Date: Thu, 22 Apr 2021 18:53:28 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Apr 2021 18:53:26 PDT (-0700)
Subject: Re: [PATCH] riscv/mm: Use BUG_ON instead of if condition followed by
 BUG.
In-Reply-To: <1617112588-7750-1-git-send-email-zhouchuangao@vivo.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
 rppt@kernel.org, akpm@linux-foundation.org, 
 wangkefeng.wang@huawei.com, zong.li@sifive.com, mick@ics.forth.gr,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, zhouchuangao@vivo.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zhouchuangao@vivo.com
Message-ID: <mhng-1c7adead-9a56-41dc-a734-61e0088b0cc3@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_185329_753203_99037BD0 
X-CRM114-Status: GOOD (  15.53  )
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

On Tue, 30 Mar 2021 06:56:26 PDT (-0700), zhouchuangao@vivo.com wrote:
> BUG_ON() uses unlikely in if(), which can be optimized at compile time.
>
> Signed-off-by: zhouchuangao <zhouchuangao@vivo.com>
> ---
>  arch/riscv/mm/init.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 067583a..a7fa5e2 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -213,8 +213,8 @@ static phys_addr_t alloc_pte_late(uintptr_t va)
>  	unsigned long vaddr;
>
>  	vaddr = __get_free_page(GFP_KERNEL);
> -	if (!vaddr || !pgtable_pte_page_ctor(virt_to_page(vaddr)))
> -		BUG();
> +	BUG_ON(!vaddr || !pgtable_pte_page_ctor(virt_to_page(vaddr)));
> +
>  	return __pa(vaddr);
>  }

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
