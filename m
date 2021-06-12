Return-Path: <SRS0=I7Ft=LG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 192CCC48BE5
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jun 2021 03:59:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2C0C61248
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jun 2021 03:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2C0C61248
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=GnNQW1K2cL8dquTPzj3OynV7+jpMoOb6bqUz5z9KI0A=; b=05osr/bCw5sQ1MzubKBV9vYsGY
	kORBbfwR+BMc9/+NSarRkBs6EolUK4jcyECcvoV3peDg40N+ga3KbcFyqZ1xB6YENKpZ8rVQuNAxe
	cBWmIzjmmZ75Lwrqr/DOGRcN/YfTL0c+YP/BRr5AoMXZpX9xlv4J3F1Zgz3FjcnSXqgtDVlT+ozNN
	KjMYxlAswErKlqvDPQ3+ypbLIYT2+wJkZAnJdzEqSPjYUQSEvYcOC+5GNLdVtHByaOWUQtoSPDvGr
	R6rsz9qboQ7HvMkuv7ITrQF+fhROxwNuVSI0F2ofv9A0IW/z7VcZHO4JA9wXNdJOpHmo2URoxmbTr
	4DPLbrpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrulJ-007jzb-Nj; Sat, 12 Jun 2021 03:56:45 +0000
Received: from mail-pl1-f177.google.com ([209.85.214.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrulG-007jyV-Va
 for linux-riscv@lists.infradead.org; Sat, 12 Jun 2021 03:56:44 +0000
Received: by mail-pl1-f177.google.com with SMTP id x10so3793825plg.3
 for <linux-riscv@lists.infradead.org>; Fri, 11 Jun 2021 20:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=3FaZDzHblAzL8JBweWZZrBo7nK587IM5WRBAEUnGg6c=;
 b=rNklwOX3qCziQjAy4oQo5ZWjieeD2uWc/Vkb3pyYSfWd3+1Iecv2KXZyIrIXimSq55
 UPD/+cf17zzzd82uqFsN9h8j1fNOXQSzKqjo+RfefoPzB486DBEOVnFgm0VV5CENAnT/
 50KqwvfwrNdofbzCYU9IzYxuWj5eairSbyoobLwmwWFNChDV13/QL96bvzCkEQ78rEsf
 FpRYFGDCRlIS8XyT2P9Jqva05TiBu3l/MMhNUfLKTztMxcOLcBG7/Omg02rlCD4nd4lD
 EEf4511enfGgXeUdLrVvuluDrnUWTer8f7Omgp/ib5Tik5v+gF3DqitQzJjS/17B+JSq
 stjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=3FaZDzHblAzL8JBweWZZrBo7nK587IM5WRBAEUnGg6c=;
 b=RbExc6QyJGTc2EqJvOnJy0AztFISX1Y/YXmvmSxeU0UGucAb0roLWyrb7/bMafGqr/
 CSFIg85cePb/NhXMWSvcCwZv+HNJvyTwsTz6CrbT23Pt+ktbEnO0u06xpvn33qTI1m/3
 e4Gftyf11jt+tAZg6+t8FlKoEWlm94Ik+Je5RfYWbVQt5AUByYRMF4uloRZOBND8shz6
 I6wyn92ywnYNaPXPjGd0RFDirGdU3gMXuElISRbmA47Ff7nkaAJJvHDr+YZWOBRvP5P6
 NRnaXBPu6n3Oeg0iFiNxo2jUXeeqJrQNy/2tBr/kTwmSP71Zwx26hqzoKIRSjOF7rj49
 DR5w==
X-Gm-Message-State: AOAM531/tttBmd4R10o3CHjS2XgSfyJ7Anj6bykAdCrmizPZoQ2mO7XC
 s/qbJbBtmdRDEkk9/Bcnl5nrjg==
X-Google-Smtp-Source: ABdhPJyPmv0YDhakVI+qt1MU1sO2SiUVOM15iYJNHsCtaA9Vw9ubH3wlOqitg67p36ZZ7aGhgkGYmQ==
X-Received: by 2002:a17:90a:31c4:: with SMTP id
 j4mr12376759pjf.105.1623470140772; 
 Fri, 11 Jun 2021 20:55:40 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id v22sm6229256pff.105.2021.06.11.20.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 20:55:39 -0700 (PDT)
Date: Fri, 11 Jun 2021 20:55:39 -0700 (PDT)
X-Google-Original-Date: Fri, 11 Jun 2021 19:51:04 PDT (-0700)
Subject: Re: [PATCH v4 0/4] riscv: Map the kernel with correct permissions the
 first time
In-Reply-To: <20210604114950.1446390-1-alex@ghiti.fr>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 jszhang@kernel.org, Christoph Hellwig <hch@infradead.org>, zong.li@sifive.com,
 anup@brainfault.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, alex@ghiti.fr
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-42d061b3-a03b-411b-9b2e-be08031661c1@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_205643_040681_17BCDC54 
X-CRM114-Status: GOOD (  22.48  )
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

On Fri, 04 Jun 2021 04:49:46 PDT (-0700), alex@ghiti.fr wrote:
> The kernel permissions are fixed after the kernel page table is created:
> avoid that by mapping the kernel 'correctly' the first time.
>
> Patch 2 is a cleanup patch on which the next patches are based on, not
> necessary for this patchset though and relies on patch 1.
>
> Patch 3 introduces a new helper to set kernel mapping permissions while
> avoiding all the casts when using set_memory_* API.
>
> Patch 4  is the bulk of this work and deals with mapping the kernel with
> the right permissions.
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
> Alexandre Ghiti (4):
>   riscv: Remove CONFIG_PHYS_RAM_BASE_FIXED
>   riscv: Simplify xip and !xip kernel address conversion macros
>   riscv: Introduce set_kernel_memory helper
>   riscv: Map the kernel with correct permissions the first time
>
>  arch/riscv/Kconfig                  |   6 --
>  arch/riscv/include/asm/page.h       |  27 ++++----
>  arch/riscv/include/asm/pgtable.h    |   2 +
>  arch/riscv/include/asm/sections.h   |  17 +++++
>  arch/riscv/include/asm/set_memory.h |  13 ++--
>  arch/riscv/kernel/setup.c           |  11 +--
>  arch/riscv/mm/init.c                | 102 ++++++++++++----------------
>  arch/riscv/mm/pageattr.c            |  10 +++
>  8 files changed, 95 insertions(+), 93 deletions(-)

Thanks, these are on for-next.  I had a few conflicts, let me know if 
something went wrong.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
