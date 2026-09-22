Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2769C982FF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 12:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OQinIM+ELjXTFQkc/s7/MeJz1boQMSnFCkFQ5faE6i8=; b=ByBmUPs0n2K80K
	K024EiOFCA/H2uyWuY+RAF9DAXRotpfGKV6oP85615C09/VgN/AgTXs8BympVYvnDJVjT5f07K0AF
	9JS1Qg0pvz57lPDEjNNKjgk2L36Z7FLw3Er+x2w+164euTKT016639+6Uj/yTC7ha8TRkFIhzTQxb
	hMkyjJsyfhhHZbND7k7M8KxhzV3wBRd4Z4lzwt/FYluMKUtlYotViZACtNQjXr7K/Qg0dOm5fJMfB
	DsctWxuS/RDyDf217lfIby0oVJbPRCVXKwFvY12bZKwI14zmT73sCr0qNSQn+M1f6aUZgWIm3Yb6+
	Mde9rGbiczeQiz3mom6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zNh-00000005H6l-2N0l;
	Tue, 22 Sep 2026 12:13:53 +0000
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zNf-00000005H6H-1YIY
	for linux-riscv@lists.infradead.org;
	Tue, 22 Sep 2026 12:13:52 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a996c8adf3so6760387a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 22 Sep 2026 05:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790079229; x=1790684029; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OjbpV8gXw6DnzPOP9Yav5BVijNjxxO/HGQyrKRqAqnI=;
        b=JvAJMeNkGuyny6Ix0zrIST84J5PmjbFJaYuKeDm3bmjU/7qtL1AXIVVWhYRq4i5QRY
         lIfU0PPIWyC7Q5X5sQuWSWQfLPsWz4hoJMa3w7Z3+p6Y1Ih/sDJP2raVClKiL/40+EpY
         qi8qevwbNFATa8JMXHC2Y5JtR/uaflQQdDcWpQ4O+w62sklX241hduqsrqb9cXteKSh/
         9HHpAhnnSd8BsiPWRHSl63ytevYx+wqSHROQDTUSK9LQN726cmErj7vaPTSy0vFLW8bx
         rC3YYoCTkfRB+GCt1UPy6UBpxBeWOWHTON8Ie6Mkh6Xrqxj4WuLuWYU3Qpnwj8SyPGPv
         fFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790079229; x=1790684029;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OjbpV8gXw6DnzPOP9Yav5BVijNjxxO/HGQyrKRqAqnI=;
        b=IYJZYdtuInL+0tBxg3/IhyH9uWCM1pZTcC21+yCX8Ax0ybdjq+Lwz9owlih17XHzvs
         UXegXGU7GdJbSyBhfeQ3vK8XZCbsA2CZdi/ZdIRTGfZEg+G0nvvyn3dNPCEpsYzQQoD3
         H5R6Vh0s6+rMeRmoqcuPouw0pNkXPUwWIXhJhx+wvhoVjwVV5pzGkC9reqFngvW2KkFH
         bBYNvaFvYKNUdzMAEY/B+KcG01ICzzQYM2sHZgk7kFrqBIe5UE8HY0X5N5nFnkNhgoAB
         rZ/a8CMY61XWoP3+T1BcstX+BanvuSJkvyz6EugGm/XKVdknepFMKv8669aq/U6noh4D
         e3vQ==
X-Forwarded-Encrypted: i=1; AKwUvBwaNbqQKDYVxxmwkxacWpD2SrTvn+WGRp6Y2EmZ+0pAEhI/e2Ob4+bHP47wm/qt1Ii6OfbdUemBZZd4NQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nL2BU8F3CBXyQ5slMmOsj6B1yqczMCz4HEVu93gb9tAbls8diy
	dAWm3cPllbFdKkJf5MmpZl0evzO3ICtrejIV4/4fwez20fo0b4akTo2E
X-Gm-Gg: AYBFou2BVXj/jg0qkV4BEVc7EByjwUccfMNaSurxMlROAzA/PDDOLkCnLhx/9wsPJ+F
	F5eq0biXkagIFyvJkd5Voovpl0+Q1QUvKugwCG6FyA7cnRUUNr/dcBPBIQdS6Y6gXca2VFLMnFT
	o3+JQzFaI7NbvPmTQXiB2waLH44zKNIwCyt7bujhn3pwLE37FAg+xYJhCZUWpWFnBFGeY4dPbxw
	jJKuKe8LwzET0Nd8YoeEjv42ymiT8xt8IRZe9BG05I00ol5rMnwiMRViZoPS48PNN6TvWKfDIX5
	C0HtnrFRoouw7pThiBQmkq5qME6SdB8kWzVnPOQGD0rqJDwk61ea5cOHlSWQ/pnBvVxXlf3doVP
	FH2ItO4GFz4LVcOvXZ0LDvyW0Lu103wtFXT9WHIb6li4vbleIT1YhMREdNvq9GtmzMDcJZEb9Vp
	jhpOB0sCy3IZIwgjk4L2yYcruFUbCvskjaFwkf
X-Received: by 2002:a05:6402:249a:b0:6aa:734a:a08f with SMTP id 4fb4d7f45d1cf-6aa734aa2b2mr8449809a12.38.1790079228363;
        Tue, 22 Sep 2026 05:13:48 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa44e6abdsm917994a12.13.2026.09.22.05.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:13:47 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Tue, 22 Sep 2026 14:13:45 +0200
To: Ye Liu <ye.liu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Ye Liu <liuye@kylinos.cn>
Subject: Re: [PATCH v2 3/3] mm/vmalloc: skip vmalloc_dump_obj for non-vmalloc
 addresses
Message-ID: <arJw-VKQNxWA0RSc@milan>
References: <20260921-vmalloc_dump_obj-v2-0-73fceb3ed1c8@linux.dev>
 <20260921-vmalloc_dump_obj-v2-3-73fceb3ed1c8@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260921-vmalloc_dump_obj-v2-3-73fceb3ed1c8@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_051351_428160_F9E0862E 
X-CRM114-Status: GOOD (  21.56  )
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

On Mon, Sep 21, 2026 at 09:17:23PM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> vmalloc_dump_obj() unconditionally searches all vmap nodes even when
> called with a non-vmalloc address (e.g. a slab or stack pointer from
> mem_dump_obj()).  Add an is_vmalloc_or_module_addr() check at the
> entry to avoid the unnecessary per-node trylock and rb-tree traversal.
> 
> Use is_vmalloc_or_module_addr() rather than is_vmalloc_addr() because
> module, BPF, and execmem allocations reside in MODULES_VADDR..MODULES_END
> on x86_64, arm64, and riscv -- outside VMALLOC_START..VMALLOC_END -- but
> are still tracked in the same vmap_nodes rb-tree.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---
>  mm/vmalloc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 30c610f678dc..d8095b558365 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -5277,6 +5277,9 @@ bool vmalloc_dump_obj(void *object)
>  	unsigned long addr;
>  	unsigned long nr_pages;
>  
> +	if (!is_vmalloc_or_module_addr(object))
> +		return false;
> +
>  	addr = PAGE_ALIGN_DOWN((unsigned long) object);
>  
>  	/*
> 
> -- 
> 2.25.1
>
Do we need this check? If it is not the vmalloc address, we just return
noting. Another question is why do you want is_vmalloc_or_module_addr()?

vmalloc_dump_obj() is about VMALLOC_START..VMALLOC_END, IMO.

There are only two users of it and both rely on the VMALLOC_START..VMALLOC_END
range:

<snip>
*** mm/kasan/report.c:
print_address_description[403] if (!vmalloc_dump_obj(addr))

*** mm/util.c:
mem_dump_obj[1096]             if (vmalloc_dump_obj(object))
<snip>

	if (is_vmalloc_addr(addr)) {
		pr_err("The buggy address belongs to a");
		if (!vmalloc_dump_obj(addr))
			pr_cont(" vmalloc virtual mapping\n");
		page = vmalloc_to_page(addr);
	}

and

<snip>
	if (vmalloc_dump_obj(object))
		return;

	if (is_vmalloc_addr(object))
		type = "vmalloc memory";
<snip>

--
Uladzislau Rezki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
