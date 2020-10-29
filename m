Return-Path: <SRS0=H9LG=EE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD5FFC2D0A3
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2020 16:30:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A3752076E
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2020 16:30:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RCMA9FRO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A3752076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ufhCH731WOsmodXuKQ/M/hy5q7Fqsp7GIHYGJ8GYdj8=; b=RCMA9FRODBJXez14DJ6ngDPwP
	x6JSKFU+PIe6QE1Ln7zyeCaruMECJodwhw5SBoddw2HtYwy59JBjWMUEv4RVlr+6gEtjhkN4D+Tzg
	k7rbE6i2pXoh1Xo3CrvSCLslX5vk4+xel8LyUjQ6fKtiTViZDChSGGCZzY3tHeoaICc/HXXEniVQy
	HJ4KletcAmZpLxRaIYdgZrcI/C7U/0yF/lKcrwjSGDSdr/3YHAOUO6RKMiQcADJItsShQARDHO2fO
	IynDmQ0Quhx/V8YLyYVW0eONGzTc8FI7vov4X6QsFU3PXrB1m2fote8rXIGBl3KiumQjbw423GZbc
	AzPwxXnYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYAoj-0006Fp-Mi; Thu, 29 Oct 2020 16:30:25 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYAod-0006DD-9k; Thu, 29 Oct 2020 16:30:20 +0000
Received: by mail-ot1-f65.google.com with SMTP id k3so2896543otp.1;
 Thu, 29 Oct 2020 09:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZB07qrLbOJe5x8k5kgwlwyYgrU0au+3LEdR9BcQ+dAw=;
 b=bhq1btpY1JyjRjo9rvAwUbowaJPQlf1canz03584Ywhd5c32ka44NHnceFSiFdyaG5
 OcySawt7KtSHhDvVSO+93SNBmZOF1Tz9Pp3TWDlFoDLxzfsL7tZgLIsA4eolIHHdb4SQ
 STT4esEtqmZ+IWwfNQgnD5dvRn6oUVoQX+1wnPILWff9y+62msGKZxCP4V7QFtTM4gMC
 LLvTH+SOoMcWt8gGICAxfWtz/CUXyGiNri5JgvBuV0K8cqnEmVdUHb11ywIFvpmC08zk
 ZPMr8sUsmM0DvppkUIVgfFkAeSMdMwgxLMzv7fvGlUivhrzQ+++qkzsuyxQPDGpD0Pg5
 EVAg==
X-Gm-Message-State: AOAM530G8MYHHj53crsO6nwAlBkHvbxyA8oO/egO04zx43mfyYDdBOtR
 FIMTFcX0MVpLRMpS9u4yZml1J4hBa4vSmD+BEF0=
X-Google-Smtp-Source: ABdhPJy2gnJASZanadb1mOz1tbg80ys3NM2aGYdvcYIISMX2t1bfCDW4CoQJSVVkimsx+nxAWLJibjXQBAg79vyeqWE=
X-Received: by 2002:a9d:734f:: with SMTP id l15mr4119563otk.260.1603989017370; 
 Thu, 29 Oct 2020 09:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201029161902.19272-1-rppt@kernel.org>
 <20201029161902.19272-3-rppt@kernel.org>
In-Reply-To: <20201029161902.19272-3-rppt@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 29 Oct 2020 17:30:06 +0100
Message-ID: <CAJZ5v0jY2vqZxdD7CaGUsCb2ePodamDnneOLHZcagCODn5kmrQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] PM: hibernate: make direct map manipulations more
 explicit
To: Mike Rapoport <rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_123019_357657_4FB49EE3 
X-CRM114-Status: GOOD (  33.70  )
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 the arch/x86 maintainers <x86@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Len Brown <len.brown@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Linux PM <linux-pm@vger.kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pekka Enberg <penberg@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 29, 2020 at 5:19 PM Mike Rapoport <rppt@kernel.org> wrote:
>
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> When DEBUG_PAGEALLOC or ARCH_HAS_SET_DIRECT_MAP is enabled a page may be
> not present in the direct map and has to be explicitly mapped before it
> could be copied.
>
> On arm64 it is possible that a page would be removed from the direct map
> using set_direct_map_invalid_noflush() but __kernel_map_pages() will refuse
> to map this page back if DEBUG_PAGEALLOC is disabled.
>
> Introduce hibernate_map_page() that will explicitly use
> set_direct_map_{default,invalid}_noflush() for ARCH_HAS_SET_DIRECT_MAP case
> and debug_pagealloc_map_pages() for DEBUG_PAGEALLOC case.
>
> The remapping of the pages in safe_copy_page() presumes that it only
> changes protection bits in an existing PTE and so it is safe to ignore
> return value of set_direct_map_{default,invalid}_noflush().
>
> Still, add a WARN_ON() so that future changes in set_memory APIs will not
> silently break hibernation.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

From the hibernation support perspective:

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

> ---
>  include/linux/mm.h      | 12 ------------
>  kernel/power/snapshot.c | 30 ++++++++++++++++++++++++++++--
>  2 files changed, 28 insertions(+), 14 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 1fc0609056dc..14e397f3752c 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2927,16 +2927,6 @@ static inline bool debug_pagealloc_enabled_static(void)
>  #if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_ARCH_HAS_SET_DIRECT_MAP)
>  extern void __kernel_map_pages(struct page *page, int numpages, int enable);
>
> -/*
> - * When called in DEBUG_PAGEALLOC context, the call should most likely be
> - * guarded by debug_pagealloc_enabled() or debug_pagealloc_enabled_static()
> - */
> -static inline void
> -kernel_map_pages(struct page *page, int numpages, int enable)
> -{
> -       __kernel_map_pages(page, numpages, enable);
> -}
> -
>  static inline void debug_pagealloc_map_pages(struct page *page,
>                                              int numpages, int enable)
>  {
> @@ -2948,8 +2938,6 @@ static inline void debug_pagealloc_map_pages(struct page *page,
>  extern bool kernel_page_present(struct page *page);
>  #endif /* CONFIG_HIBERNATION */
>  #else  /* CONFIG_DEBUG_PAGEALLOC || CONFIG_ARCH_HAS_SET_DIRECT_MAP */
> -static inline void
> -kernel_map_pages(struct page *page, int numpages, int enable) {}
>  static inline void debug_pagealloc_map_pages(struct page *page,
>                                              int numpages, int enable) {}
>  #ifdef CONFIG_HIBERNATION
> diff --git a/kernel/power/snapshot.c b/kernel/power/snapshot.c
> index 46b1804c1ddf..054c8cce4236 100644
> --- a/kernel/power/snapshot.c
> +++ b/kernel/power/snapshot.c
> @@ -76,6 +76,32 @@ static inline void hibernate_restore_protect_page(void *page_address) {}
>  static inline void hibernate_restore_unprotect_page(void *page_address) {}
>  #endif /* CONFIG_STRICT_KERNEL_RWX  && CONFIG_ARCH_HAS_SET_MEMORY */
>
> +static inline void hibernate_map_page(struct page *page, int enable)
> +{
> +       if (IS_ENABLED(CONFIG_ARCH_HAS_SET_DIRECT_MAP)) {
> +               unsigned long addr = (unsigned long)page_address(page);
> +               int ret;
> +
> +               /*
> +                * This should not fail because remapping a page here means
> +                * that we only update protection bits in an existing PTE.
> +                * It is still worth to have WARN_ON() here if something
> +                * changes and this will no longer be the case.
> +                */
> +               if (enable)
> +                       ret = set_direct_map_default_noflush(page);
> +               else
> +                       ret = set_direct_map_invalid_noflush(page);
> +
> +               if (WARN_ON(ret))
> +                       return;
> +
> +               flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> +       } else {
> +               debug_pagealloc_map_pages(page, 1, enable);
> +       }
> +}
> +
>  static int swsusp_page_is_free(struct page *);
>  static void swsusp_set_page_forbidden(struct page *);
>  static void swsusp_unset_page_forbidden(struct page *);
> @@ -1355,9 +1381,9 @@ static void safe_copy_page(void *dst, struct page *s_page)
>         if (kernel_page_present(s_page)) {
>                 do_copy_page(dst, page_address(s_page));
>         } else {
> -               kernel_map_pages(s_page, 1, 1);
> +               hibernate_map_page(s_page, 1);
>                 do_copy_page(dst, page_address(s_page));
> -               kernel_map_pages(s_page, 1, 0);
> +               hibernate_map_page(s_page, 0);
>         }
>  }
>
> --
> 2.28.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
