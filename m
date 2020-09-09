Return-Path: <SRS0=4W5w=CS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B54C43461
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 03:14:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55AEA21973
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 03:14:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TVIpP9tI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="xknuaCQc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55AEA21973
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=PaMq5fGvJJ6O+8DxwAz1A3r2c2todTSKXIFTO8F9POc=; b=TVIpP9tIB234MRCtdvEF5COZZ
	21eGcySqAqt9uYQF3AIegrQAx8FRNkxsAROmDTaAVrxXyoX043JCTOb4E7blUV/Gl2ba56tO0jI2B
	3Nq9eBejeLsLFBZKPFyUGgMkhWB068xqdQQ8XdN5pJYfOnEzaF5X2VbYMalB6YzSAl28ZeqrjjF5l
	ma9lYllOemMeAyKGDHrHUEMpdZDl53v+aCKBRSj/TXtUHAEBhorZPuKOUqu8GpUkvBYaeFtgWzVAv
	4CMGoPEOh9L+eewfq3iufwxLXB2Xl7r9Nxn36ekg/xYEsH+hROOZDz2Tb0G6UGUb2qg1sk6hjxX7t
	njBINXxzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFqZ9-0002HM-FB; Wed, 09 Sep 2020 03:14:35 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFqZ6-0002Gi-UF
 for linux-riscv@lists.infradead.org; Wed, 09 Sep 2020 03:14:33 +0000
Received: by mail-pg1-x544.google.com with SMTP id w186so1009601pgb.8
 for <linux-riscv@lists.infradead.org>; Tue, 08 Sep 2020 20:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=K2jFVcBWhbb162j83/9SxV6N68Ve2wWeFCnl/SKCdt4=;
 b=xknuaCQcXHMnTWUn4vdW2V8qMHgHl6DBTS2YvR6fmnbnGlAKns+muAWy3pz7mPrbuX
 3TJRjpfgX70YPv0ArTylWg0qYv+9I4ZnJOXjCS9C2BdyqyYa6Ahg0T/dkdMioBFhGeuk
 1eY7UhBYn5u5UbFWxAlHjbFCs6MhZoCiDkL7/iXol7IToRGsdJdhGxI+uG/6B8cZ4NJM
 Si8VA98RgPD/nHHNa4uzOicwUmHv/vJ7O3TK71CpaTSsYPs9rELqdWUqrdpJ75Es+028
 04zOmRHT+G39j8gKIvpC35mcPtrkFl4Ck4JsVHx4m0X4yZDe3ZRVD2HLsr2DXfnA5jqK
 Oe+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=K2jFVcBWhbb162j83/9SxV6N68Ve2wWeFCnl/SKCdt4=;
 b=sNQl/pP4dGtgLmOhqSIuC9N76RmBK7/KGzNZOTQxp1ZVJlIJ+PACVEcYakPP8dd/Ep
 zmPf0pUuOvpNBNrFrssvKF0Gg4GxhKE5xpFz7DGJkoQReCC4TNpxFRvSRm9Yh9h9Z2AK
 nFxfAvZH27rW6f0GhWro/cj5UvjdcTGznazR4/iMfIA9xD3LUQ8gIguowV0eC7Mn+NVT
 m35dK+8vw9MZUMRWRbZBYj/LyCt9N8NSVqr7G12BH6lJcYN/sUNuUHR6HOg8OrFPDh8k
 wMiuaKXlj4Sdk4Vb4d0OSzblMIb8SobEmdvcGCMqWyXvm82jqNBPxA6o12q12Cjoo9WP
 kcpA==
X-Gm-Message-State: AOAM5302KztLOJolvxxmKVJOmT1rKdv8PA3sHkwM5fzd6w22rrA7Bb+A
 99Zy1eD2sAo30Amab9GtjDOjYwiaSh6EBw==
X-Google-Smtp-Source: ABdhPJzsyzHa/avot4NIQnErNIyTt+K4YzYV67N3fhhVb5eeiQGoz9x+C2N0d5SDp2hB293tt7EB/A==
X-Received: by 2002:a17:902:7d92:: with SMTP id
 a18mr506157plm.68.1599621270325; 
 Tue, 08 Sep 2020 20:14:30 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id t20sm620204pgj.27.2020.09.08.20.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 20:14:29 -0700 (PDT)
Date: Tue, 08 Sep 2020 20:14:29 -0700 (PDT)
X-Google-Original-Date: Tue, 08 Sep 2020 20:14:12 PDT (-0700)
Subject: Re: [PATCH for-next] riscv/mm/fault: Fix inline placement in
 vmalloc_fault() declaration
In-Reply-To: <20200905055252.527753-1-penberg@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: penberg@kernel.org
Message-ID: <mhng-0e7caf0d-e2e0-4f29-8ece-1702901d3a8f@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_231433_014804_1B50F2D3 
X-CRM114-Status: GOOD (  19.73  )
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
Cc: penberg@kernel.org, linux-riscv@lists.infradead.org, lkp@intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 04 Sep 2020 22:52:52 PDT (-0700), penberg@kernel.org wrote:
> The "inline" keyword is in the wrong place in vmalloc_fault()
> declaration:
>
>>> arch/riscv/mm/fault.c:56:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
>       56 | static void inline vmalloc_fault(struct pt_regs *regs, int code, unsigned long addr)
>          | ^~~~~~
>
> Fix that up.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Pekka Enberg <penberg@kernel.org>
> ---
>  arch/riscv/mm/fault.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index a23eaf5ce95c..a173432ccf82 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -78,7 +78,7 @@ static inline void bad_area(struct pt_regs *regs, struct mm_struct *mm, int code
>  	no_context(regs, addr);
>  }
>
> -static void inline vmalloc_fault(struct pt_regs *regs, int code, unsigned long addr)
> +static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long addr)
>  {
>  	pgd_t *pgd, *pgd_k;
>  	pud_t *pud, *pud_k;

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
