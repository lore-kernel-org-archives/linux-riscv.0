Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C6CC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Dec 2022 17:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pd6qw4KJl6WSaZUgf1PT8iAo9SEnkS0xm/FnLbAC1aU=; b=DjjP1WvNL/T0aX
	JKl8o5RdX0txB1mgHf7BNjKRSp8fNz/jNl/P0DAabIfr0/RVitRZNOQli9jHuE6JYlgZztt6XTsvQ
	Y8xMknDz8LrHJtFQ/jBUGrTgJsVfnNQLfLhsTvCdyN9PtO8ET5iyXSCCcvLw85/FuN6TS3JEGPPfi
	q9Is8qk+fmRQ87mzvHyvIpH8e/69u47YCQsif6IRfi1BpAi7mkC+xljjyIj6Q95pByRcIcVh4bwBH
	jA2Wd5SIiCoKJh4H/stK1P+2Y2JZf78oa72ABXKHFIjvZmjJL5nItDPcL+raDfLBxViSpOUqIu0xz
	LGzcl+Ft1uCp6pLFj82A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7gZj-001T8m-Vg; Tue, 20 Dec 2022 17:38:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7gZf-001T2c-At
	for linux-riscv@lists.infradead.org; Tue, 20 Dec 2022 17:38:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671557920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fEfc8sJnHm7K9aruHy33BZirM4UCmBd1CuSTlZNxnWo=;
	b=f378FLiCTEU48S5bhGhS0vPelNpWAsXVKBiOL2+Jok6qlwUrLKBwmC/e2wJhw/BIznkufV
	GjiCC5iCGaVAyOlZ8UD0nPkdLvY9pFmHnUPb16gQ/1VQUXjsmOZv29m0tWZwyh6+GbKJny
	78bwLCFoqyG+rNkcp9/GgJwX+ktk3GE=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-562-OHQOZ8VyNyuaE_b-SlZq9Q-1; Tue, 20 Dec 2022 12:38:39 -0500
X-MC-Unique: OHQOZ8VyNyuaE_b-SlZq9Q-1
Received: by mail-qk1-f197.google.com with SMTP id i4-20020a05620a248400b006febc1651bbso9772539qkn.4
        for <linux-riscv@lists.infradead.org>; Tue, 20 Dec 2022 09:38:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEfc8sJnHm7K9aruHy33BZirM4UCmBd1CuSTlZNxnWo=;
        b=R1nKFLnIaIbwXJfQRL6NJHK7oavY/lfIPl6C5oQPMLD+b+XZDocboCGxMBCyYWDE4g
         1rRymywGmvwFB8MhfeDETkP89Q3BDj3sjKZNKgP4v2x0ucmIbCqe6vlZ5E+vwgt1gXgt
         RmpaphfqZGhu4hweK1yebT/7pzX3xK03hmk8yIBKHe4t9uaI1hxBG7pYdmn+OsHsdPMv
         dYQQEau6E1DWZGG89bgH/G1bN2WhLLpnWkcgicoCpDRczkqRvk3+b7UF1NPxaZ63uL2f
         jKoOT1ke6AcjAnYetDB0YUXhbzUJmzuUlq8n27OODjsw1hINAbXsrRT+6sFV4t/fF+eA
         4vHQ==
X-Gm-Message-State: AFqh2kptOJKAVnEcvZbCfucV6bxdAfEAKIYgvNcwLZuf/jVscozmDw/4
	QAVb1cOOZXHz2mYgr5E1XJbzYdOQAh8nHgxB5ahvgkW6aP1ZFfFYIgkLid5yk7HHZGW5GjrJZWr
	JBE1tGVO51/cwnsYD/qQhPiL7AdVc
X-Received: by 2002:ac8:7404:0:b0:3a9:8610:f9af with SMTP id p4-20020ac87404000000b003a98610f9afmr4892454qtq.14.1671557918842;
        Tue, 20 Dec 2022 09:38:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtg5R2YbTU53YK6jcMnW9vCQk+xxP9JBp96j27cdKzorbZMYmsqPt75wVleU8oFZr+Onr1Sjg==
X-Received: by 2002:ac8:7404:0:b0:3a9:8610:f9af with SMTP id p4-20020ac87404000000b003a98610f9afmr4892421qtq.14.1671557918568;
        Tue, 20 Dec 2022 09:38:38 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-45-70-31-26-132.dsl.bell.ca. [70.31.26.132])
        by smtp.gmail.com with ESMTPSA id r17-20020a05620a299100b006fb8239db65sm9360534qkp.43.2022.12.20.09.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 09:38:37 -0800 (PST)
Date: Tue, 20 Dec 2022 12:38:36 -0500
From: Peter Xu <peterx@redhat.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, netdev@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Michal Hocko <mhocko@suse.com>, Nadav Amit <nadav.amit@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Vlastimil Babka <vbabka@suse.cz>, Rik van Riel <riel@surriel.com>,
	Will Deacon <will@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Christian Brauner <brauner@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [RFC PATCH] mm: remove zap_page_range and change callers to use
 zap_vma_page_range
Message-ID: <Y6HzHFdXB02Roa7q@x1n>
References: <20221216192012.13562-1-mike.kravetz@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20221216192012.13562-1-mike.kravetz@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_093843_486242_4E258EAC 
X-CRM114-Status: GOOD (  11.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Dec 16, 2022 at 11:20:12AM -0800, Mike Kravetz wrote:
> zap_page_range was originally designed to unmap pages within an address
> range that could span multiple vmas.  While working on [1], it was
> discovered that all callers of zap_page_range pass a range entirely within
> a single vma.  In addition, the mmu notification call within zap_page
> range does not correctly handle ranges that span multiple vmas as calls
> should be vma specific.
> 
> Instead of fixing zap_page_range, change all callers to use the new
> routine zap_vma_page_range.  zap_vma_page_range is just a wrapper around
> zap_page_range_single passing in NULL zap details.  The name is also
> more in line with other exported routines that operate within a vma.
> We can then remove zap_page_range.
> 
> Also, change madvise_dontneed_single_vma to use this new routine.
> 
> [1] https://lore.kernel.org/linux-mm/20221114235507.294320-2-mike.kravetz@oracle.com/
> Suggested-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>

Acked-by: Peter Xu <peterx@redhat.com>

Thanks!

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
