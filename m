Return-Path: <SRS0=q1JI=AW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1297C433E5
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jul 2020 19:44:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1D0C20786
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jul 2020 19:44:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CLBX/zev";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="mylwVBf8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1D0C20786
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=RzAtmFIQKC6PGKMJnLtXA+O+LnHYDX4LfIs7GeJy2Sk=; b=CLBX/zev/8Qh11cQ/gQN6yFMN
	LPoVuMQWaKkHc1wot4EQjR3xjhEGSU7GCeRdR5r983CPbYbOdiXsBsXtwh6XaRQ27fEkwGGbFbGgX
	GkC5Y3a8K8XqQX7dvS0zMdfyBN+lnGbTby96Z2G67/DTJ26Lm4yGhmdxayn857hXZPTaGt8A3oSjJ
	m7gH/SCmyQV2RVLGmI42QFtieBIvPNJVKghVlVxcz8zEmAFPggaFEobWALzBu+nxp5O5k5Qyqsagd
	3lsbWr9URt/XpE3JwY5KiJAjR0GDRcNrqynhmDt3v0wDIYPmkxJrnjN9snVNz54CppKY0Qydsbl/G
	I3ozdnaCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juLPf-0005cC-JE; Sat, 11 Jul 2020 19:43:55 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juLPb-0005bj-LY
 for linux-riscv@lists.infradead.org; Sat, 11 Jul 2020 19:43:53 +0000
Received: by mail-pf1-x441.google.com with SMTP id m9so4068967pfh.0
 for <linux-riscv@lists.infradead.org>; Sat, 11 Jul 2020 12:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=yw7ehmxORJy4sIbNya0u48Qorh9d3UtEM0gh14sgRLI=;
 b=mylwVBf8ZP2cYI+vTV2Iy0TSPoCBuUKKyI4kqGysYHwgxggSoRwfygWDMUMzv9ujyu
 pD4eMK9Luu4/KaXspRyW+FNGSxtLFk1h74sHUHFGQrL0DxfCBP02tgnqQ0cGQ/fe1dTG
 fIN5rFmGpXbSZCcN5ocYClQVRgVWqeZk+wGZE+lEm8LMJ1nD1NhY82a/ABi408RXk/Fo
 PA/1uOKMgMSaFnb+JUSYB1cL9LTMH014FiNk5/9GbQ2dZy5cgf0pp7EerFmUmiCViucE
 RdEQCmSOtMtXS/u/Cv3TZFEYae1JTMfmufBxxx/T1mXwll7GT/SNtQ3592IV34LhHBRT
 iRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=yw7ehmxORJy4sIbNya0u48Qorh9d3UtEM0gh14sgRLI=;
 b=qkraO+8bbL0jACQAShPJyXH6GXWAhmmJDBEJjuJ/eixMnYfX/3IB++VQ5Q0ZfUqHuW
 ypr1MB44qpz0IAtOqJpV79eqOIQhPIS1bats8JTPDNjcuf/+BpTKlv4DiU34/OI2ST5+
 SdF3tpgRP7VKn1UlvgRm4iW1RZboAKifh0RIa74o2dcnmZLZz/4oMt3yPGKsG6v+ha5R
 LFvqm8V+seuoFKpXTYYJ/jNiq7Of3wExeiCM7ZkQyULpfBEUI0cQouS9BG7n2XcNKg5T
 +eSEOOyi21MucTVSOE2M768vWUlc5paWj/vDx/ItmI0asROb0ckJuyWJnKdoDBRCdKZx
 QAxg==
X-Gm-Message-State: AOAM530cRhzzTzhOsV1MwmG/hhzws59zBXUvGIHRNON7YUllT8OUeJJN
 UaWtcltgvWrGUtFb2asdqvekNA==
X-Google-Smtp-Source: ABdhPJzK9+khKr+Z9s7skyyuV7g90/sDvKB6R7Wtu2va4YLg1bmw3EyhtKykgJkirCYxta5YMCs4gQ==
X-Received: by 2002:a63:cb03:: with SMTP id p3mr62374583pgg.444.1594496627665; 
 Sat, 11 Jul 2020 12:43:47 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id t137sm9573449pgc.32.2020.07.11.12.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jul 2020 12:43:47 -0700 (PDT)
Date: Sat, 11 Jul 2020 12:43:47 -0700 (PDT)
X-Google-Original-Date: Sat, 11 Jul 2020 12:35:18 PDT (-0700)
Subject: Re: [PATCH 17/26] mm/riscv: Use general page fault accounting
In-Reply-To: <20200626223625.199813-1-peterx@redhat.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: peterx@redhat.com
Message-ID: <mhng-9a62674e-ca04-4e59-a03a-5e4924ef83ca@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200711_154351_882701_FE98527E 
X-CRM114-Status: GOOD (  19.41  )
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
Cc: aarcange@redhat.com, aou@eecs.berkeley.edu, will@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 peterx@redhat.com, linux-mm@kvack.org, mpe@ellerman.id.au,
 akpm@linux-foundation.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org, gerald.schaefer@de.ibm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 26 Jun 2020 15:36:25 PDT (-0700), peterx@redhat.com wrote:
> Use the general page fault accounting by passing regs into handle_mm_fault().
> It naturally solve the issue of multiple page fault accounting when page fault
> retry happened.
>
> CC: Paul Walmsley <paul.walmsley@sifive.com>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: Albert Ou <aou@eecs.berkeley.edu>
> CC: linux-riscv@lists.infradead.org
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  arch/riscv/mm/fault.c | 16 +---------------
>  1 file changed, 1 insertion(+), 15 deletions(-)
>
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index 677ee1bb11ac..e796ba02b572 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -110,7 +110,7 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
>  	 * make sure we exit gracefully rather than endlessly redo
>  	 * the fault.
>  	 */
> -	fault = handle_mm_fault(vma, addr, flags, NULL);
> +	fault = handle_mm_fault(vma, addr, flags, regs);
>
>  	/*
>  	 * If we need to retry but a fatal signal is pending, handle the
> @@ -128,21 +128,7 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
>  		BUG();
>  	}
>
> -	/*
> -	 * Major/minor page fault accounting is only done on the
> -	 * initial attempt. If we go through a retry, it is extremely
> -	 * likely that the page will be found in page cache at that point.
> -	 */
>  	if (flags & FAULT_FLAG_ALLOW_RETRY) {
> -		if (fault & VM_FAULT_MAJOR) {
> -			tsk->maj_flt++;
> -			perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MAJ,
> -				      1, regs, addr);
> -		} else {
> -			tsk->min_flt++;
> -			perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MIN,
> -				      1, regs, addr);
> -		}
>  		if (fault & VM_FAULT_RETRY) {
>  			flags |= FAULT_FLAG_TRIED;

This still slightly changes the accounting numbers, but I don't think it does
so in a way that's meaningful enough to care about.  SIGBUS is the only one
that might happen frequently enough to notice, I doubt anyone cares about
whether faults are accounted for during OOM.

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
