Return-Path: <SRS0=MvPY=LZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB87CC11F64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 05:38:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88ABF6147D
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 05:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88ABF6147D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=/ukvUcMlbkHXffTKI/X2LWR2icIyKY7jEjeWbQgWoY8=; b=TQnmZkbuHMz3BERHnl+Y7q6ll9
	BXqzB7Ou8LW0qczCyY4ShzF7F4H1QUP5zOmdbYAgjpO0EGAc0OPykkkbYRXdq2y6H/tEkTIsxLdcD
	YsqFpWQKqWEzOcAOrIPq4WiUjm2dpkBa0MdR1V5RJOa7ccx+pf8MofcGkH2lcndgIrJ+1M2GFwoqY
	mvsJKKmXyyBubZ6WTzk8m2fHj8VzWhldxjaGMyheEedygCx97Wcudd7oRcBh2TIc0iweeHf4dGktY
	HK7IC+0rKS2XuRvyQNoOj89eWoGq3vqy0DUDx9RZ11xkN9lCtDHbp/hZEIjhOY2oTdWa1tL3BwqTb
	GlMUW0iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lypOc-00GBHb-Pu; Thu, 01 Jul 2021 05:37:54 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lypOa-00GBHE-FJ
 for linux-riscv@lists.infradead.org; Thu, 01 Jul 2021 05:37:54 +0000
Received: by mail-pf1-x429.google.com with SMTP id s14so4974058pfg.0
 for <linux-riscv@lists.infradead.org>; Wed, 30 Jun 2021 22:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=LKUXWb2rBeM5K5/NYqhjzjCyk25gIHmuSp3zZKAsfwM=;
 b=u2IS3e10FG1GD47P660k5uGo33LXlovwLziuh2ZtN2RJJN5tsp7KHEn9p2cZPnQLib
 tDPmAS+jTYlT90FNvg8dIVwVMpQXaZ6AMS97+3WPUYMK1U2NW0M0e8BXShO8oAVFhZdE
 PQHa9jDFqsRzkDkkRiUOwXRSPeClx1vVRP12wlX+DbE6YuAEdGIvQHUvIy3ltjlLIWEg
 I9QP3yCjTHyaGRz0JFQTPEETN4Xj0Qf62X6yeAvlwHLrSiaq9iuedZskI2kdSZqf6ly6
 mjWQEgLkVLpIC7xsCsC07xaGxn8DpPPnUoRfxeZgCovtX6SjRtXD15uIAI+iGpJyWiVH
 HkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=LKUXWb2rBeM5K5/NYqhjzjCyk25gIHmuSp3zZKAsfwM=;
 b=nvIGzGdMxevbmew4cG1D1q0RMOo4BwZo+Aldj4Vatmd/u/TGT4PFMIQC/3ly24zqMF
 uwfJwh0P3ETJ4lMY5jHRedIphDmrcjMT7CQkFmGmwY+VqT61rnO+HkQtQXKKqXVClw7c
 Xc54+VtcEp/RnWzxpYbTHNrwpGuZjKx2ehF+cXUN63gzSG6JwVeLDu+cwLBfkr5Sf8Vi
 Ol7tqHE5xSe9xI//0DLgeH1Y6yolfVV9AwQnuSIK7ItqXhxeM8TOOu+HF988tZgL76Cs
 729/UnTc3GKFwJyDrx+VqWHgwLoJjwdSpvs1gUjUybMaznhHFGDA+j2pBCMpIqEgXik5
 +F+g==
X-Gm-Message-State: AOAM532T3AT7D96OOjS42b4IZZXr97gZb1piuc4P4iidkAw8yYcnAQ80
 p31G7k/+Jo+LTqwSDL5RqTkWTQ==
X-Google-Smtp-Source: ABdhPJzsEBR5uFgCIFkOhQ1RPDFoLWD3+/29t3TwfroaZOx7LPDc68hfp7XjHNKw9GbUKLM/HMQTnA==
X-Received: by 2002:a63:1308:: with SMTP id i8mr38134510pgl.19.1625117870449; 
 Wed, 30 Jun 2021 22:37:50 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id x27sm19057331pgl.74.2021.06.30.22.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 22:37:49 -0700 (PDT)
Date: Wed, 30 Jun 2021 22:37:49 -0700 (PDT)
X-Google-Original-Date: Wed, 30 Jun 2021 22:37:43 PDT (-0700)
Subject: Re: [PATCH v8 0/2] Map the kernel with correct permissions the first
 time 
In-Reply-To: <20210624120041.2786419-1-alex@ghiti.fr>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 jszhang@kernel.org, Christoph Hellwig <hch@infradead.org>, zong.li@sifive.com,
 anup@brainfault.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, alex@ghiti.fr
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-0f00c990-c928-4a9d-ab2c-5036b29b2861@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_223752_625347_0E08B81E 
X-CRM114-Status: GOOD (  25.22  )
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

On Thu, 24 Jun 2021 05:00:39 PDT (-0700), alex@ghiti.fr wrote:
> The kernel permissions are fixed after the kernel page table is created:
> avoid that by mapping the kernel 'correctly' the first time.
>
> Patch 1 introduces a new helper to set kernel mapping permissions while
> avoiding all the casts when using set_memory_* API.
>
> Patch 2  is the bulk of this work and deals with mapping the kernel with
> the right permissions.
>
> Changes in v8:
> * Move set_kernel_memory inline function into set_memory.h header as suggested
>   by Jisheng
> * Make set_kernel_memory arguments name consistent
>
> Changes in v7:
> * Split long lines and reintroduce parameters names of set_kernel_memory
>   callback, as suggested by Christoph
> * Make set_kernel_memory __always_inline as suggested by Christoph
> * Change 64b spelling into 64-bit, as suggested by Christoph
>
> Changes in v6:
> * load_sz was placed in init section but is now used in kernel address
>   conversions macros, so remove this attribute.
>
> Changes in v5:
> * Remove non-relevant commits to this patchset that raised issues
> * Make load_sz non-static as it is used in kernel address conversions
>   macros
> * Rebased on top for-next
>
> Changes in v4:
> * Add patch 1 as noted by Jisheng
> * Changes patch 2 title as suggested by Anup
> * Add Reviewed-by from Anup
>
> Changes in v3:
> * Add a patch that factorizes kernel address conversions
> * Add a helper called set_kernel_memory in its own patch, as suggested by
>   Christoph
> * Prefer IS_ENABLED over #ifdef, as suggested by Christoph
> * Split overly long lines, as suggested by Christoph
> * Simplify kernel mapping by mapping ALL text as readonly and taking advantage
>   of already present code that enables write for init text before
>   free_initmem_default.
>
> Changes in v2:
> * Rebased on top of for-next (and "riscv: mm: fix build errors caused by
>   mk_pmd()")
> * Get rid of protect_kernel_linear_mapping_text_rodata as suggested by
>   Jisheng
> * Improve code in general compared to previous RFC
>
> Alexandre Ghiti (2):
>   riscv: Introduce set_kernel_memory helper
>   riscv: Map the kernel with correct permissions the first time
>
>  arch/riscv/include/asm/page.h       |  13 +++-
>  arch/riscv/include/asm/sections.h   |  17 +++++
>  arch/riscv/include/asm/set_memory.h |  24 ++++--
>  arch/riscv/kernel/setup.c           |  12 +--
>  arch/riscv/mm/init.c                | 112 ++++++++++++----------------
>  5 files changed, 97 insertions(+), 81 deletions(-)

I had what looks to be two earlier versions of these patches on 
for-next.  I've fixed that up, but there were some merge conflicts.  
Let me know if there were any issues, but it's really getting too late 
in the cycle to be rebasing so I'd prefer just a fixup.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
