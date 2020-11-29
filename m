Return-Path: <SRS0=QNeR=FD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B62FC3E8C5
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Nov 2020 15:54:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C46CB20829
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Nov 2020 15:54:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VXMWzz61";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="isTAhbDa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C46CB20829
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sy8/yp4zA73HkBIsxlwVrgYz5i86RptdC/EhQiYNsrA=; b=VXMWzz61jDty4lcxk8A4Ef6Ei
	kmKnde7NUD9MZKDKYllRdIeqOwcIYgXp2GSJ3apoy64MEKT7AcTaczyf0HQYlHJW5W0GgDsEBn6Yj
	KWY11o1gUxpZVjm4+RsyzMlPxg7h5QDK/3dWF1Q02eh3hxswXFHb+Dxog1HGcx1/bA06kf7C2TLjp
	UzHTRZDmuQ+NOz1j09IXX+eQQb/R+u+fLSK18oGOCeVKC4IjHt25HPor05rG6CRLTfwYLaijSYhrO
	kf35kMUUOGxayxo0BRQLbBuw8PabAGNQkamrRL2f4ZNFgf4DI4sG+FqzD7msqT523/DiHLBRrTvx3
	aq28KsYsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjP1Y-0007O6-7T; Sun, 29 Nov 2020 15:54:04 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjP1U-0007MG-GX
 for linux-riscv@lists.infradead.org; Sun, 29 Nov 2020 15:54:01 +0000
Received: by mail-lf1-x143.google.com with SMTP id t6so15606388lfl.13
 for <linux-riscv@lists.infradead.org>; Sun, 29 Nov 2020 07:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3PuJ9ydxTViJxhC8bUeJS1Nnpydv/VEM9Wi1gMrMaBs=;
 b=isTAhbDaUuUXk1VQ3ndJOQ/CuS5MKUiZU9CQF6PymdXpFUOWrtmdwQbOetQXqfuYcu
 DN+OBA9qL3A9IiYDok2MOFG354WJgz9qAUvm/bYWWVPi9WyZ1PJ1lNfGjJRLoAZLO2Vg
 uRTzD4pVG+cV2/ymy6+tsxqoVguJfYNDW/2RvIvgoZeWEzlw11EW3XkkvoYk35tVWwPn
 HfZCQVeqGtpyFhpd4OUy9FJVmyQdiOL8EaFCqmL+9cNs+NvTNNL4303WZgB9szddFdV8
 BfgLnmnM0DdbVQ1i8kfeHCJ1NEzilifWALzo17ajgIx/BZAN0Q0Iv6ejITAt4NtpIu5W
 GSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3PuJ9ydxTViJxhC8bUeJS1Nnpydv/VEM9Wi1gMrMaBs=;
 b=UgF/Z3igKgxTGhpODmV5dcwISuZDhpYblKwd3iIXm4dKTQQJHaYV/ZtIdBxsJhQb55
 qUQpzKFIg96RgMsmhq9q/ae+RfqD+7ENV5N0JBpb8i5g0NTWsdZJchr75JA0d1g2Dfy9
 EX8cJJJzYWajB2kptmGOvGDSTj7lkB/cqhTM/H557HADgzlyC8+HXB51JjCbSn0mDUkv
 sHldeOWGZRbmEluj5qYWEFlV6BT05sE+u7u1WANAXMwjl1YvTEaRNlSQ4TU9jPq/3/Sx
 d4tVNF03QBqoGwu32O4ZiCCKajScM/L8VHQQjMpCGSqdayoW/laZ9ZArwjWfz0YKL3DU
 qvwg==
X-Gm-Message-State: AOAM532CmScwoWz7l+sV12l0T8di1iEh7y22L4xiBLuPb1ykADn9hNAX
 gOtMIHtIbAhVhBcnGUsXm6/bz+vRtNffjQ+XdLWS9Q==
X-Google-Smtp-Source: ABdhPJzudR+9Ib3gs3Y02i4BAQQW5kNsVm6Yid+szIpP/1AQJ9ils7ZN++n24NpQOPLTFTgkysS30jlcr9Wp5KFuvz0=
X-Received: by 2002:ac2:43b1:: with SMTP id t17mr7446330lfl.385.1606665236632; 
 Sun, 29 Nov 2020 07:53:56 -0800 (PST)
MIME-Version: 1.0
References: <20201125092208.12544-1-rppt@kernel.org>
 <20201125092208.12544-8-rppt@kernel.org>
In-Reply-To: <20201125092208.12544-8-rppt@kernel.org>
From: Shakeel Butt <shakeelb@google.com>
Date: Sun, 29 Nov 2020 07:53:45 -0800
Message-ID: <CALvZod4MoXod_YkbO+4k2=PS=xdMVbZa2HWWuUnMZ1G9hSr+Jw@mail.gmail.com>
Subject: Re: [PATCH v12 07/10] secretmem: add memcg accounting
To: Mike Rapoport <rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201129_105400_643932_59CEF332 
X-CRM114-Status: GOOD (  26.01  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Linux MM <linux-mm@kvack.org>,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Nov 25, 2020 at 1:51 AM Mike Rapoport <rppt@kernel.org> wrote:
>
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> Account memory consumed by secretmem to memcg. The accounting is updated
> when the memory is actually allocated and freed.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> Acked-by: Roman Gushchin <guro@fb.com>
> ---
>  mm/filemap.c   |  3 ++-
>  mm/secretmem.c | 36 +++++++++++++++++++++++++++++++++++-
>  2 files changed, 37 insertions(+), 2 deletions(-)
>
> diff --git a/mm/filemap.c b/mm/filemap.c
> index 249cf489f5df..cf7f1dc9f4b8 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -42,6 +42,7 @@
>  #include <linux/psi.h>
>  #include <linux/ramfs.h>
>  #include <linux/page_idle.h>
> +#include <linux/secretmem.h>
>  #include "internal.h"
>
>  #define CREATE_TRACE_POINTS
> @@ -844,7 +845,7 @@ static noinline int __add_to_page_cache_locked(struct page *page,
>         page->mapping = mapping;
>         page->index = offset;
>
> -       if (!huge) {
> +       if (!huge && !page_is_secretmem(page)) {
>                 error = mem_cgroup_charge(page, current->mm, gfp);
>                 if (error)
>                         goto error;
> diff --git a/mm/secretmem.c b/mm/secretmem.c
> index 52a900a135a5..eb6628390444 100644
> --- a/mm/secretmem.c
> +++ b/mm/secretmem.c
> @@ -18,6 +18,7 @@
>  #include <linux/memblock.h>
>  #include <linux/pseudo_fs.h>
>  #include <linux/secretmem.h>
> +#include <linux/memcontrol.h>
>  #include <linux/set_memory.h>
>  #include <linux/sched/signal.h>
>
> @@ -44,6 +45,32 @@ struct secretmem_ctx {
>
>  static struct cma *secretmem_cma;
>
> +static int secretmem_account_pages(struct page *page, gfp_t gfp, int order)
> +{
> +       int err;
> +
> +       err = memcg_kmem_charge_page(page, gfp, order);
> +       if (err)
> +               return err;
> +
> +       /*
> +        * seceremem caches are unreclaimable kernel allocations, so treat
> +        * them as unreclaimable slab memory for VM statistics purposes
> +        */
> +       mod_node_page_state(page_pgdat(page), NR_SLAB_UNRECLAIMABLE_B,
> +                           PAGE_SIZE << order);

Please use mod_lruvec_page_state() instead, so we get the memcg stats too.

BTW I think secretmem deserves a vmstat entry instead of overloading
NR_SLAB_UNRECLAIMABLE_B.

> +
> +       return 0;
> +}
> +
> +static void secretmem_unaccount_pages(struct page *page, int order)
> +{
> +
> +       mod_node_page_state(page_pgdat(page), NR_SLAB_UNRECLAIMABLE_B,
> +                           -PAGE_SIZE << order);
> +       memcg_kmem_uncharge_page(page, order);
> +}
> +
>  static int secretmem_pool_increase(struct secretmem_ctx *ctx, gfp_t gfp)
>  {
>         unsigned long nr_pages = (1 << PMD_PAGE_ORDER);
> @@ -56,10 +83,14 @@ static int secretmem_pool_increase(struct secretmem_ctx *ctx, gfp_t gfp)
>         if (!page)
>                 return -ENOMEM;
>
> -       err = set_direct_map_invalid_noflush(page, nr_pages);
> +       err = secretmem_account_pages(page, gfp, PMD_PAGE_ORDER);
>         if (err)
>                 goto err_cma_release;
>
> +       err = set_direct_map_invalid_noflush(page, nr_pages);
> +       if (err)
> +               goto err_memcg_uncharge;
> +
>         addr = (unsigned long)page_address(page);
>         err = gen_pool_add(pool, addr, PMD_SIZE, NUMA_NO_NODE);
>         if (err)
> @@ -76,6 +107,8 @@ static int secretmem_pool_increase(struct secretmem_ctx *ctx, gfp_t gfp)
>          * won't fail
>          */
>         set_direct_map_default_noflush(page, nr_pages);
> +err_memcg_uncharge:
> +       secretmem_unaccount_pages(page, PMD_PAGE_ORDER);
>  err_cma_release:
>         cma_release(secretmem_cma, page, nr_pages);
>         return err;
> @@ -302,6 +335,7 @@ static void secretmem_cleanup_chunk(struct gen_pool *pool,
>         int i;
>
>         set_direct_map_default_noflush(page, nr_pages);
> +       secretmem_unaccount_pages(page, PMD_PAGE_ORDER);
>
>         for (i = 0; i < nr_pages; i++)
>                 clear_highpage(page + i);
> --
> 2.28.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
