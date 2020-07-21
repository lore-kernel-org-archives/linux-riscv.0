Return-Path: <SRS0=tQi0=BA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D492C433E1
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 04:18:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDFE520792
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 04:18:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IjT4zYck";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="auyo6mQR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDFE520792
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=dx+yxhXDJK9LCqLuURR5hO2ZJnNlnJfgnqnC3r7ukRk=; b=IjT4zYckZ9GAuoUeRuXEnYyUm
	PXeO2E9QuFlE/tuwUPr8hWArzVLW8pxrRQkprqHxQodUFHbIUKMVuZOq7hZwfEnhSN0HT0cV5huk7
	O36gmVn75UcYZi3TMZPAjLsJLeoe3e19LjLBrc1NVXlgkFOz4JVJ/FDHDivDsYouLbCEUd8xFSCwe
	lb+ErhbPS1UVQBgqgOViKR4KohH+xFhgyQFr7jubpwlHBt1asw1bHwGQzzE3egekL22F/mHQBntL7
	7RoIn1j4MjQT8mcHDzmy5NmMLwcXRggP52eEnLtCljsCNEsGPTdY3HaFsRDRK+QJ6hbj6atQBL6Wr
	wCWJuHK6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxjjr-0005vt-8q; Tue, 21 Jul 2020 04:18:47 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxjjl-0005ta-Mc
 for linux-riscv@lists.infradead.org; Tue, 21 Jul 2020 04:18:42 +0000
Received: by mail-pl1-x641.google.com with SMTP id q17so9673091pls.9
 for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2020 21:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=1e9Zq5gJ/1fgKOyXUSLF0MEiFphjq+PDhivttfX4RZQ=;
 b=auyo6mQRqhUc+SQT+AaYF/L8G5dzwsvTzry3Nkk8hHcx43u/cfbOqKVX5jN4QMa7vw
 gNgAqrVsI/MKA81bb2tB5uMtBkUrkc/4i52jApdEVwLX5G3wysmGEB5aw4xJFr9EaxsS
 r4VSP9WK6NiZet5Wr3QYxH3Wv1Q6/3KCHk2BR9w3F+YI1Zr2mun0j6Y/FKSGiOa35dZZ
 OrYGymY1xl4zU2BOJSePy9pE6awXL1hfXq5HMcryy5KgVJOFjPAF84L5Cpq7ohgUv4pN
 29sunggiifVJNlFp2wP07DQHbIUusvZtHkXo549Z5k4eBf0ryDR3Ef+AOQc/8SD0mXJ0
 UiCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=1e9Zq5gJ/1fgKOyXUSLF0MEiFphjq+PDhivttfX4RZQ=;
 b=C9mJSDmmWBJMRuLEzb2E7u/FCFDuV1EB9ogOyEoIV/5i5um/onzjFCNE6XJXmPP2dM
 m/m16v9EEUR5ARj0t2fhCwP4Ct7ynuouaN2a7sY7Eljs7MG6Qq069BPGu9rpp+VNe0L+
 NPDNol1fzq16lgG8D8eHXfglPP/qlExyk1WMVGVHJHyaZ9XMwn6taE+VeKRyP20nRMvW
 jlPXPqlPiuYi5ZPvVkqnHU9ymCudGWMYdQcjlhTorkoQw0mrTDdjjaULRi0QG/iw+qlZ
 XvvpMAF6HQ9Kb8UN4V1hGWBdvZ8OKpsUI5MrgntIZ/ZLP4++GEBuzK7eSpaJreIxe/wN
 Xk0w==
X-Gm-Message-State: AOAM533GDeZgQHvvlUia8VLl8649oMIoGwcEXgxnJLvOfeiRi3VISaS4
 NvuAq+NJMpTgAzcn9zoKfXXb9g==
X-Google-Smtp-Source: ABdhPJxT4lXl3TT2ARfsLYwaTG4q42j0hNqPPzCQz5JCNdjrvEcM0fdTLt24hYVjbfta/JLI56JxIA==
X-Received: by 2002:a17:90a:1196:: with SMTP id
 e22mr2752255pja.145.1595305119493; 
 Mon, 20 Jul 2020 21:18:39 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id v8sm1185427pjf.46.2020.07.20.21.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 21:18:39 -0700 (PDT)
Date: Mon, 20 Jul 2020 21:18:39 -0700 (PDT)
X-Google-Original-Date: Mon, 20 Jul 2020 21:18:34 PDT (-0700)
Subject: Re: [PATCH] riscv: kasan: use local_tlb_flush_all() to avoid
 uninitialized __sbi_rfence
In-Reply-To: <1594348854-25588-1-git-send-email-vincent.chen@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vincent.chen@sifive.com
Message-ID: <mhng-36ca5f6d-4cba-4a0a-83a5-e758edaa295c@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_001841_799471_7D982A56 
X-CRM114-Status: GOOD (  20.04  )
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
Cc: nickhu@andestech.com, vincent.chen@sifive.com, glider@google.com,
 Paul Walmsley <paul.walmsley@sifive.com>, aryabinin@virtuozzo.com,
 linux-riscv@lists.infradead.org, dvyukov@google.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 09 Jul 2020 19:40:54 PDT (-0700), vincent.chen@sifive.com wrote:
> It fails to boot the v5.8-rc4 kernel with CONFIG_KASAN because kasan_init
> and kasan_early_init use uninitialized __sbi_rfence as executing the
> tlb_flush_all(). Actually, at this moment, only the CPU which is
> responsible for the system initialization enables the MMU. Other CPUs are
> parking at the .Lsecondary_start. Hence the tlb_flush_all() is able to be
> replaced by local_tlb_flush_all() to avoid using uninitialized
> __sbi_rfence.
>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> ---
>  arch/riscv/mm/kasan_init.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> index 4a8b61806633..87b4ab3d3c77 100644
> --- a/arch/riscv/mm/kasan_init.c
> +++ b/arch/riscv/mm/kasan_init.c
> @@ -44,7 +44,7 @@ asmlinkage void __init kasan_early_init(void)
>  				(__pa(((uintptr_t) kasan_early_shadow_pmd))),
>  				__pgprot(_PAGE_TABLE)));
>
> -	flush_tlb_all();
> +	local_flush_tlb_all();
>  }
>
>  static void __init populate(void *start, void *end)
> @@ -79,7 +79,7 @@ static void __init populate(void *start, void *end)
>  			pfn_pgd(PFN_DOWN(__pa(&pmd[offset])),
>  				__pgprot(_PAGE_TABLE)));
>
> -	flush_tlb_all();
> +	local_flush_tlb_all();
>  	memset(start, 0, end - start);
>  }

Can we just move the sbi_init() call before the kasan_init() call?  I feel like
the SBI should be initialized directly after paging, as probing really doesn't
have any dependencies.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
