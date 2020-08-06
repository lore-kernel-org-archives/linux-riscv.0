Return-Path: <SRS0=vd3C=BQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A6E8C433DF
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2020 12:21:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 381A8204FD
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2020 12:21:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SnseLeOE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=shutemov-name.20150623.gappssmtp.com header.i=@shutemov-name.20150623.gappssmtp.com header.b="vdAe04pQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 381A8204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XKxwvsmQJHGqwLxJuqpqnFUjDNUqmn5Oiifs/fhqdwo=; b=SnseLeOEgh4zYpVmpu/zzgxES
	bM9shGyi2oLx5zlvJ1SXagN6DKXVX7zulZVE56NeAe4ZToPIoIhG1k4Rh6tzGWqZU+SlKqgCVY6oj
	RCvX6My2Jd/C4wjDZZB7aiZitpAklvHJhO2Ni8o9k8tQgtezk4SF5Krgjy3JBCj8zvrFaqaLSiy4/
	g3xcFoOJRBMkG6YOjHMFNh7HyQiVRoydUwG0/NfI68CaqDr4ChT4hxMxDExRgPTjIkLcF0F1fM1QL
	2tyagaX0bT3xNki4xKEEv9bypANqF3QwBKujX49OWs4QzhZ6oPUXdHPTC1nXwGX8qwocn4kPKf+hx
	g2/E+u9Nw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3crh-0005Fa-Rt; Thu, 06 Aug 2020 10:11:13 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3crc-0005DF-Bi
 for linux-riscv@lists.infradead.org; Thu, 06 Aug 2020 10:11:09 +0000
Received: by mail-lf1-x142.google.com with SMTP id x24so8493974lfe.11
 for <linux-riscv@lists.infradead.org>; Thu, 06 Aug 2020 03:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FmHNrmiGc1oEc9Yta/aBuQn+1EulEN2xZuLGLoeLXHQ=;
 b=vdAe04pQJi4piGZ5+mZ0j2zhjTn6XVtWXoKVvfYvjkZt497I/uZbgq0bCXUw9yqxv1
 aDwbG4fQLRxllT940g4JJIoLaihdHAzLTznrUByrMW1Sxn0NV4LG6ITrocLkxfQ/UbR8
 /22r5p3LxUUJDP/bT5Lo9OvmnoXmRxUSyOPo0gH4uKUH+elU8Mn1VlYg4xH7/Swt6AEz
 woNXvCrI7kpsrhxnMJDhchfVxMGgUKsXYC/i/xUa92sA04Rdaab+RLuwLDiP7hERRYMU
 MGSXXRnFS4yE+plzwECIlQPOIq5Q9sL11BNdJXjz4h7FpV4jOJJQ0vybui6R3DGZ4y4F
 e/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FmHNrmiGc1oEc9Yta/aBuQn+1EulEN2xZuLGLoeLXHQ=;
 b=k+qQq4IlppiVbpa1cOE5iKtWMiDUgXE4KVaBwIfBQtgQkh2gaXnwLqaErZWDCAC/YT
 TijoYT4Qy3hiRG6xwx9dmEzv0Bfubs+l7ESSrPmuf5hJQuILh21FVZ8awbLwKMehEcbC
 JyhmokqAO5wR7zoXerVEheWXMPbI8jSk/ijFIdCbH7weTtnV+6/EVFrI+sajlcUXwDUm
 jdQlsYy69rYE4QskW+R4CAGyEUNQjLxD64DmnBEbrU8FH8qrriHDT3lhpfq50ps495yi
 cIg5Baixn9N7x7wk90m7Mmq8bIP2s1q4N4ea1+kdr7yhCYhdftKnMTlOOr7oNT2hcSAn
 fzJQ==
X-Gm-Message-State: AOAM532LDbyfNTQZdDBo5wtL5G58K1cy4enq7tpuDO8yDHl+DPNvgG6N
 ICoiSuJcbNYyLKJrJs0IhfMJRQ==
X-Google-Smtp-Source: ABdhPJztxQdmUqdlmLCUV07uqArQbN1pckvCcR5Q9hxz1Dr0Q7jnsmbBT95GM1N8CkcdipmeoNGGIA==
X-Received: by 2002:a19:70c:: with SMTP id 12mr3611270lfh.207.1596708665300;
 Thu, 06 Aug 2020 03:11:05 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id v9sm2356183lja.81.2020.08.06.03.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:11:04 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id 92823102E1B; Thu,  6 Aug 2020 13:11:12 +0300 (+03)
Date: Thu, 6 Aug 2020 13:11:12 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v3 1/6] mm: add definition of PMD_PAGE_ORDER
Message-ID: <20200806101112.bjw4mxu2odpsg2hh@box>
References: <20200804095035.18778-1-rppt@kernel.org>
 <20200804095035.18778-2-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804095035.18778-2-rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_061108_638263_DFF4FA64 
X-CRM114-Status: GOOD (  21.82  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>, Christopher Lameter <cl@linux.com>,
 Idan Yaniv <idan.yaniv@ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Aug 04, 2020 at 12:50:30PM +0300, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> The definition of PMD_PAGE_ORDER denoting the number of base pages in the
> second-level leaf page is already used by DAX and maybe handy in other
> cases as well.
> 
> Several architectures already have definition of PMD_ORDER as the size of
> second level page table, so to avoid conflict with these definitions use
> PMD_PAGE_ORDER name and update DAX respectively.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  fs/dax.c                | 10 +++++-----
>  include/linux/pgtable.h |  3 +++
>  2 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/dax.c b/fs/dax.c
> index 11b16729b86f..b91d8c8dda45 100644
> --- a/fs/dax.c
> +++ b/fs/dax.c
> @@ -50,7 +50,7 @@ static inline unsigned int pe_order(enum page_entry_size pe_size)
>  #define PG_PMD_NR	(PMD_SIZE >> PAGE_SHIFT)
>  
>  /* The order of a PMD entry */
> -#define PMD_ORDER	(PMD_SHIFT - PAGE_SHIFT)
> +#define PMD_PAGE_ORDER	(PMD_SHIFT - PAGE_SHIFT)

Hm. Wouldn't it conflict with definition in pgtable.h? Or should we
include it instead?

> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 56c1e8eb7bb0..79f8443609e7 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -28,6 +28,9 @@
>  #define USER_PGTABLES_CEILING	0UL
>  #endif
>  
> +/* Number of base pages in a second level leaf page */
> +#define PMD_PAGE_ORDER	(PMD_SHIFT - PAGE_SHIFT)
> +
>  /*
>   * A page table page can be thought of an array like this: pXd_t[PTRS_PER_PxD]
>   *

-- 
 Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
