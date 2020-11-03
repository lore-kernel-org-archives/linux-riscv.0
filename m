Return-Path: <SRS0=g6PI=EJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F5DC2D0A3
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 11:08:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC0E7208B6
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 11:08:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S/YnWh+l";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=shutemov-name.20150623.gappssmtp.com header.i=@shutemov-name.20150623.gappssmtp.com header.b="DDGsed/r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC0E7208B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y6aJYPDMECFSjr3cI8ALYsJ5ghu8VOqMOI/+2bBou8E=; b=S/YnWh+l/jpi1tzV/EYFKX1HJ
	IVszoUkRnwGHkIOcckiGjBanWvO/98lu6bBCMXR2k14JhI03t5wjMLOpg5IunRa4HqNfdEQPjr7Gu
	0DoSGQHoyM8ENHn8PNHkC14FwTIADX8NO6qdJFYSmyFlP8BKz/F3TYSbUoG/yZThfpX9QvcgL5n+1
	2yOA49FtnXpElOmjQtQzDB5G1g5lcketeZ9bR+ao4xY1vZ1WzcxYBEm1vkbCZJvhiiXyJcDC740b6
	S6BiUC9hU41rLJBOD6v6tbQbKZjmZVHT9S6PtpYbxClkatJAcPZpzjmR9DJ16u5N0rAcB3ilv3txO
	AOtR9MWfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZuAy-0002a3-5N; Tue, 03 Nov 2020 11:08:32 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZuAo-0002Va-M9
 for linux-riscv@lists.infradead.org; Tue, 03 Nov 2020 11:08:23 +0000
Received: by mail-lf1-x143.google.com with SMTP id f9so21616582lfq.2
 for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2020 03:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0sEXlBoxnDPWC0PSImx6b45EW/XdSxvl0dskuufPCkM=;
 b=DDGsed/rnR9bezm8l99j+eaiR9Ng8+VD49bJiK1NAcb13ryZua3eiHNJkEUJYM7q4q
 zCCEua4OxygsHhj1XVYFclEnvfs8dtk8HZUq1aa2fKeCC1ivOtLxqOefmDgSGp9oFlOr
 hAWnMoFYPcy6/inHtPYp6y+Ll+sbonCF0KjG6nyml+YxQJr6IbSjcrdNbOQkutO8NxkL
 FEkF/0STPopqzOAi1pVyuF642sMpo4gqoXWfJTZgyjNsKfE0QyHjFu93yXEkV6QK5fCs
 LXCWy6h56hyXQaKhqHUvZP6L632PtDIPp/Z07qwJ3b4T1YdUnIRaKCRJ/6v0LV3pGdBe
 QkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0sEXlBoxnDPWC0PSImx6b45EW/XdSxvl0dskuufPCkM=;
 b=qlRPWGPXKW7XPPEEOs7SzLqjq597M0SK2hgzpYjLgrsbtoVEI6HNholvFpgFf2OmuO
 pBXZJ+CpHRhlEkNpTCjU2fPcguYNw1yJ+EWGzOF6J88J3ac+2zY7e5XKyo8XCkVHfK/o
 0JOIr53YBCMj64FJOtXZRT1uuMAVgJf6NVFzdXhOhPinA/yY7O8FT1epAmJj5Divwa9K
 VRwHxAgtpuHqUcBmUrtRUfEmGcFBVvpfxKOxrkDcnuCSqF1Sxp9yN4LJ4OOwPTbXEdzK
 jPXaLcu/PDK13Uz39/5DfGaX/9vqvn77cltPRNVif/fzdteCSbRuZckxEBjmGKHEp9x7
 BMdw==
X-Gm-Message-State: AOAM531LgQYOv/QeD3tcG4P6Eq5xqQrvSV+amfD+76TC4NfIWgchbhnw
 yJbVRMXEJ8FBeqoEBEgDrlI8Uw==
X-Google-Smtp-Source: ABdhPJzAyrukqGQuCxp2/NOEVoOC9ZkivmVdXf94z98OJ3dGsVtTaaSEH+8Z/YJLbxgkwYbzErDtUQ==
X-Received: by 2002:a19:c187:: with SMTP id r129mr8047701lff.533.1604401696649; 
 Tue, 03 Nov 2020 03:08:16 -0800 (PST)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id w9sm4094835ljh.95.2020.11.03.03.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 03:08:15 -0800 (PST)
Received: by box.localdomain (Postfix, from userid 1000)
 id B845910231C; Tue,  3 Nov 2020 14:08:16 +0300 (+03)
Date: Tue, 3 Nov 2020 14:08:16 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v3 2/4] PM: hibernate: make direct map manipulations more
 explicit
Message-ID: <20201103110816.t6a3ebtgcm7mfogy@box>
References: <20201101170815.9795-1-rppt@kernel.org>
 <20201101170815.9795-3-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201101170815.9795-3-rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_060822_793957_29E23EF0 
X-CRM114-Status: GOOD (  20.89  )
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Len Brown <len.brown@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 linux-arm-kernel@lists.infradead.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Pekka Enberg <penberg@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Nov 01, 2020 at 07:08:13PM +0200, Mike Rapoport wrote:
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
> +	if (IS_ENABLED(CONFIG_ARCH_HAS_SET_DIRECT_MAP)) {
> +		unsigned long addr = (unsigned long)page_address(page);
> +		int ret;
> +
> +		/*
> +		 * This should not fail because remapping a page here means
> +		 * that we only update protection bits in an existing PTE.
> +		 * It is still worth to have WARN_ON() here if something
> +		 * changes and this will no longer be the case.
> +		 */
> +		if (enable)
> +			ret = set_direct_map_default_noflush(page);
> +		else
> +			ret = set_direct_map_invalid_noflush(page);
> +
> +		if (WARN_ON(ret))

_ONCE?
> +			return;
> +
> +		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> +	} else {
> +		debug_pagealloc_map_pages(page, 1, enable);
> +	}
> +}
> +
>  static int swsusp_page_is_free(struct page *);
>  static void swsusp_set_page_forbidden(struct page *);
>  static void swsusp_unset_page_forbidden(struct page *);

-- 
 Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
