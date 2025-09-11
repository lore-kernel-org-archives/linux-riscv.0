Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D23BCAC58E
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 13:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VWaDdMd0n4PquQzQhaNInIkoVTvLsU/fqmcgjba0Juo=; b=Ca318/ZI8fe+s0
	6WL1HTyypgOaStz5teOS8XY1sPOUwC1VufDqs5OLOs10DQeZQUTmGNf+WEpmtpBf2JE5THf8Z0Z6f
	nI4xKeROu43OK9oKupZdl+Ea+/dRFY6GC2Qmla7Wwm3L3VmEHFYh0/FjtNe8FkcKSYWDuOK5xtLmu
	Dh5g3mmC20GyEOcuRGwJpmi7UcelsR6UNlHkRyIpmUtiUi+hDENs+R6GZU1ZVEIgkTPt+2Slxcz5d
	m4gL1CzHqynyRy3zNoRph/kotmVkdChogPhxfhkhbgY4v0XNNGzHu/ky8NwiN7xH3kX8yTDerMUsd
	PdA5kCGLtbFSrVpF1b2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwh3V-000000039Wk-025a;
	Thu, 11 Sep 2025 13:09:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwh3S-000000039VX-2srM
	for linux-riscv@bombadil.infradead.org;
	Thu, 11 Sep 2025 13:09:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YUFyy1FRSzQ52ZqGvkXLXzMBnhMlgzM8XhXhFaEMyE0=; b=DR5UUgLfBlffFyOhieAuKY8Zkf
	eox0RalcdGHGbg0hZqoMGW44P9zVAnP9bAA8YZjrGb6CqW5mvKEyiQdMyREo7likgZqAkMZcwFCdd
	FuTEYkzWR69T+xo8hVvS184PP/S99gA6wi39O6562E660VQsIooGYQcas3oocXt7aEa6Sz/7wiiQD
	M7vwFmHI/5xx0dDOym4nidAH0mUgJrDj9g0Xv3Z2HrAXlc6BeUZf/VnkfJIXlkS6n3mNIfpn4iR+6
	Wg6UmmsRGOAFXq+SSXsEQylJDpQ5Q1NhYmcptA8tVF+KOOMqBFcv4xTDNsGYQBnTH9A6XO8a6aRBd
	871KoLBg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwh3O-000000065Pq-3yRo
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 13:09:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757596170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YUFyy1FRSzQ52ZqGvkXLXzMBnhMlgzM8XhXhFaEMyE0=;
	b=L5oDXLWy9cusiCxu0Ic645CyzjqwGpQQkqixP7FLiZzm5N0sEccmZOHjbNuRbBrRkQQOLx
	4A/DNrP1mLS7AdByI3cWMtk6e+lvcVwnKxJcN/yQ5OUS6wB6Zky1utLokKfnsS/G1sSrhP
	we7VC5X2dBBDfWDEYM9XLBu5+Chy2T0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757596171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YUFyy1FRSzQ52ZqGvkXLXzMBnhMlgzM8XhXhFaEMyE0=;
	b=HgwMxsWw95q66nIaNNeX73mVR2lnHCWVkw9U+ENBh8iedPxrJr99SEXt5FNyEhBf0Qs2Re
	EkcfrrXAFKK/4cxs7xJxiQisC8xSrYf/xeCUVk8/aY3ecjichajwCVojsFz1eUfW0bwrF4
	/TsXbCu+ujx8vmI2SEFG4+FXLQi2wpU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-Shco6JvPMIaPWtCIu5NrJg-1; Thu, 11 Sep 2025 09:09:27 -0400
X-MC-Unique: Shco6JvPMIaPWtCIu5NrJg-1
X-Mimecast-MFC-AGG-ID: Shco6JvPMIaPWtCIu5NrJg_1757596166
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45cb612d362so4563695e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 11 Sep 2025 06:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757596166; x=1758200966;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YUFyy1FRSzQ52ZqGvkXLXzMBnhMlgzM8XhXhFaEMyE0=;
        b=J+R7QknlnpJ1gmoMIz5PJMskRktU15cs1540/HKrCUO38iPMoqUe0sqKLS2rUoQgUm
         0YIxApYHs/VEhSZMd61L4r2ftrQGZvDejedYvepb2YV0xN5fuptk5plUzgOLQtDuvSGM
         3SFv34CYLQCnlyz6wmWyy5kObe12OUGZQZ7XYt/wbEmEmyEz/1Akb8GB5wGu4ZbR/H7R
         LQwQOHeLKnoduv7jZM5UIh90LrgVptiGUKAReD2BaGcqEyHn0VCz3Nr6tzAhoYXx+UND
         qUZ4X1mpUW2H9wIKYbCaiVObltxggrh6HGlEzzOssoTjb+fiJ1EWo2ujBCSkCvKAeYG4
         g9Lw==
X-Forwarded-Encrypted: i=1; AJvYcCX8o6RUQBpOfwP3qjFVsYNnRZbsYNcYFcTV+YxDam7zONKLRVWIQOnMYewJP+n1bZA51theDcSIrjZntQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZA9tOouqcqKVYlBUlVXpt3Vhkdm5QegisUP3ceIJ15WB/NWDV
	wX+/Dv60C+obLwNF1j2xBOuwp3jUegplYw0X2MLL87GtxbnxHNoSnITmalckT6vy5+xgG6K5ERE
	rH0mPDgj8owuCrPiJewkXyFiQGJ9HSNMZEaqIUxJpAdhtOOGOmYma1VqmT8vIOewlodrN7w==
X-Gm-Gg: ASbGnct/WMJ6EMAHXWwRWSLmtCl74E6JAEoPDVC8v4FFdCjNErQxCvIJX7WezJ7Hbqo
	HCJVUaGFFVbBIbluA6hA9rCZsZWJi0gd9rhGFnzJG1AJCg+Atdfygag3UdRWQXLNzD8YgXsFccv
	biy7kAVxWaUKuNxX3E3JocFAVjRRv2pczyGuXAO3PXxuB+ts6Mao3KCTO8iMX9IL1U+AQbr4TbY
	DAPZf4oK+DYdYpqOjacjlZs57w/nxlUdlTSaSHWTPY8ERH7djgEVj2sNtBlgn+lm3pqE3czzBOb
	v1BdX6nRUtj9sgquS1CYrUJSDXhz0XpacGZRzx4+pVnl30c1jof35GZmh1L+i+sgDRQ9ZLfiFaL
	U5d1vU0cJxci6fbmKX/uozjXItu2yBiQelV6XzWkVGFO+YZRnfmJM7s5bGWzFeJUVPBc=
X-Received: by 2002:a05:600c:5303:b0:45d:d5e2:f683 with SMTP id 5b1f17b1804b1-45de078d428mr171873065e9.25.1757596166261;
        Thu, 11 Sep 2025 06:09:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMVjs0jUiwGXDJa2IwLszE3cbnhFWu0Qry8o5d527djVHWalLfChIafmqiEKbHOLTHnkMNig==
X-Received: by 2002:a05:600c:5303:b0:45d:d5e2:f683 with SMTP id 5b1f17b1804b1-45de078d428mr171872335e9.25.1757596165586;
        Thu, 11 Sep 2025 06:09:25 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f42:b000:db8b:7655:f60f:812b? (p200300d82f42b000db8b7655f60f812b.dip0.t-ipconnect.de. [2003:d8:2f42:b000:db8b:7655:f60f:812b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e04cf2870sm10194895e9.1.2025.09.11.06.09.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 06:09:25 -0700 (PDT)
Message-ID: <9bcaf3ec-c0a1-4ca5-87aa-f84e297d1e42@redhat.com>
Date: Thu, 11 Sep 2025 15:09:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/5] mm: softdirty: Add pgtable_soft_dirty_supported()
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
 linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Deepak Gupta <debug@rivosinc.com>,
 Ved Shanbhogue <ved@rivosinc.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
References: <20250911095602.1130290-1-zhangchunyan@iscas.ac.cn>
 <20250911095602.1130290-2-zhangchunyan@iscas.ac.cn>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250911095602.1130290-2-zhangchunyan@iscas.ac.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: opamZzh4lJoHwPBi-a8CeXrpNimoSyc8AsbwsimJEh8_1757596166
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_140935_249327_959EF803 
X-CRM114-Status: GOOD (  29.27  )
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

On 11.09.25 11:55, Chunyan Zhang wrote:
> Some platforms can customize the PTE PMD entry soft-dirty bit making it
> unavailable even if the architecture provides the resource.
> 
> Add an API which architectures can define their specific implementations
> to detect if soft-dirty bit is available on which device the kernel is
> running.

Thinking to myself: maybe pgtable_supports_soft_dirty() would read better
Whatever you prefer.

> 
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> ---
>   fs/proc/task_mmu.c      | 17 ++++++++++++++++-
>   include/linux/pgtable.h | 12 ++++++++++++
>   mm/debug_vm_pgtable.c   | 10 +++++-----
>   mm/huge_memory.c        | 13 +++++++------
>   mm/internal.h           |  2 +-
>   mm/mremap.c             | 13 +++++++------
>   mm/userfaultfd.c        | 10 ++++------
>   7 files changed, 52 insertions(+), 25 deletions(-)
> 
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index 29cca0e6d0ff..9e8083b6d4cd 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -1058,7 +1058,7 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
>   	 * -Werror=unterminated-string-initialization warning
>   	 *  with GCC 15
>   	 */
> -	static const char mnemonics[BITS_PER_LONG][3] = {
> +	static char mnemonics[BITS_PER_LONG][3] = {
>   		/*
>   		 * In case if we meet a flag we don't know about.
>   		 */
> @@ -1129,6 +1129,16 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
>   		[ilog2(VM_SEALED)] = "sl",
>   #endif
>   	};
> +/*
> + * We should remove the VM_SOFTDIRTY flag if the soft-dirty bit is
> + * unavailable on which the kernel is running, even if the architecture
> + * provides the resource and soft-dirty is compiled in.
> + */
> +#ifdef CONFIG_MEM_SOFT_DIRTY
> +	if (!pgtable_soft_dirty_supported())
> +		mnemonics[ilog2(VM_SOFTDIRTY)][0] = 0;
> +#endif

You can now drop the ifdef.

But, I wonder if could we instead just stop setting the flag. Then we don't
have to worry about any VM_SOFTDIRTY checks.

Something like the following

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 892fe5dbf9de0..8b8bf63a32ef7 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -783,6 +783,7 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
  static inline void vm_flags_init(struct vm_area_struct *vma,
  				 vm_flags_t flags)
  {
+	VM_WARN_ON_ONCE(!pgtable_soft_dirty_supported() && (flags & VM_SOFTDIRTY));
  	ACCESS_PRIVATE(vma, __vm_flags) = flags;
  }
  
@@ -801,6 +802,7 @@ static inline void vm_flags_reset(struct vm_area_struct *vma,
  static inline void vm_flags_reset_once(struct vm_area_struct *vma,
  				       vm_flags_t flags)
  {
+	VM_WARN_ON_ONCE(!pgtable_soft_dirty_supported() && (flags & VM_SOFTDIRTY));
  	vma_assert_write_locked(vma);
  	WRITE_ONCE(ACCESS_PRIVATE(vma, __vm_flags), flags);
  }
@@ -808,6 +810,7 @@ static inline void vm_flags_reset_once(struct vm_area_struct *vma,
  static inline void vm_flags_set(struct vm_area_struct *vma,
  				vm_flags_t flags)
  {
+	VM_WARN_ON_ONCE(!pgtable_soft_dirty_supported() && (flags & VM_SOFTDIRTY));
  	vma_start_write(vma);
  	ACCESS_PRIVATE(vma, __vm_flags) |= flags;
  }
diff --git a/mm/mmap.c b/mm/mmap.c
index 5fd3b80fda1d5..40cb3fbf9a247 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1451,8 +1451,10 @@ static struct vm_area_struct *__install_special_mapping(
  		return ERR_PTR(-ENOMEM);
  
  	vma_set_range(vma, addr, addr + len, 0);
-	vm_flags_init(vma, (vm_flags | mm->def_flags |
-		      VM_DONTEXPAND | VM_SOFTDIRTY) & ~VM_LOCKED_MASK);
+	vm_flags |= mm->def_flags | VM_DONTEXPAND;
+	if (pgtable_soft_dirty_supported())
+		vm_flags |= VM_SOFTDIRTY;
+	vm_flags_init(vma, vm_flags & ~VM_LOCKED_MASK);
  	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
  
  	vma->vm_ops = ops;
diff --git a/mm/vma.c b/mm/vma.c
index abe0da33c8446..16a1ed2a6199c 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -2551,7 +2551,8 @@ static void __mmap_complete(struct mmap_state *map, struct vm_area_struct *vma)
  	 * then new mapped in-place (which must be aimed as
  	 * a completely new data area).
  	 */
-	vm_flags_set(vma, VM_SOFTDIRTY);
+	if (pgtable_soft_dirty_supported())
+		vm_flags_set(vma, VM_SOFTDIRTY);
  
  	vma_set_page_prot(vma);
  }
@@ -2819,7 +2820,8 @@ int do_brk_flags(struct vma_iterator *vmi, struct vm_area_struct *vma,
  	mm->data_vm += len >> PAGE_SHIFT;
  	if (vm_flags & VM_LOCKED)
  		mm->locked_vm += (len >> PAGE_SHIFT);
-	vm_flags_set(vma, VM_SOFTDIRTY);
+	if (pgtable_soft_dirty_supported())
+		vm_flags_set(vma, VM_SOFTDIRTY);
  	return 0;
  
  mas_store_fail:
diff --git a/mm/vma_exec.c b/mm/vma_exec.c
index 922ee51747a68..c06732a5a620a 100644
--- a/mm/vma_exec.c
+++ b/mm/vma_exec.c
@@ -107,6 +107,7 @@ int relocate_vma_down(struct vm_area_struct *vma, unsigned long shift)
  int create_init_stack_vma(struct mm_struct *mm, struct vm_area_struct **vmap,
  			  unsigned long *top_mem_p)
  {
+	unsigned long flags  = VM_STACK_FLAGS | VM_STACK_INCOMPLETE_SETUP;
  	int err;
  	struct vm_area_struct *vma = vm_area_alloc(mm);
  
@@ -137,7 +138,9 @@ int create_init_stack_vma(struct mm_struct *mm, struct vm_area_struct **vmap,
  	BUILD_BUG_ON(VM_STACK_FLAGS & VM_STACK_INCOMPLETE_SETUP);
  	vma->vm_end = STACK_TOP_MAX;
  	vma->vm_start = vma->vm_end - PAGE_SIZE;
-	vm_flags_init(vma, VM_SOFTDIRTY | VM_STACK_FLAGS | VM_STACK_INCOMPLETE_SETUP);
+	if (pgtable_soft_dirty_supported())
+		flags |= VM_SOFTDIRTY;
+	vm_flags_init(vma, flags);
  	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
  
  	err = insert_vm_struct(mm, vma);


> +
>   	size_t i;
>   
>   	seq_puts(m, "VmFlags: ");
> @@ -1531,6 +1541,8 @@ static inline bool pte_is_pinned(struct vm_area_struct *vma, unsigned long addr,
>   static inline void clear_soft_dirty(struct vm_area_struct *vma,
>   		unsigned long addr, pte_t *pte)
>   {
> +	if (!pgtable_soft_dirty_supported())
> +		return;
>   	/*
>   	 * The soft-dirty tracker uses #PF-s to catch writes
>   	 * to pages, so write-protect the pte as well. See the
> @@ -1566,6 +1578,9 @@ static inline void clear_soft_dirty_pmd(struct vm_area_struct *vma,
>   {
>   	pmd_t old, pmd = *pmdp;
>   
> +	if (!pgtable_soft_dirty_supported())
> +		return;
> +
>   	if (pmd_present(pmd)) {
>   		/* See comment in change_huge_pmd() */
>   		old = pmdp_invalidate(vma, addr, pmdp);

That would all be handled with the above never-set-VM_SOFTDIRTY.

> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 4c035637eeb7..2a3578a4ae4c 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1537,6 +1537,18 @@ static inline pgprot_t pgprot_modify(pgprot_t oldprot, pgprot_t newprot)
>   #define arch_start_context_switch(prev)	do {} while (0)
>   #endif
>   
> +/*
> + * Some platforms can customize the PTE soft-dirty bit making it unavailable
> + * even if the architecture provides the resource.
> + * Adding this API allows architectures to add their own checks for the
> + * devices on which the kernel is running.
> + * Note: When overiding it, please make sure the CONFIG_MEM_SOFT_DIRTY
> + * is part of this macro.
> + */
> +#ifndef pgtable_soft_dirty_supported
> +#define pgtable_soft_dirty_supported()	IS_ENABLED(CONFIG_MEM_SOFT_DIRTY)
> +#endif
> +
>   #ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
>   #ifndef CONFIG_ARCH_ENABLE_THP_MIGRATION
>   static inline pmd_t pmd_swp_mksoft_dirty(pmd_t pmd)
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 830107b6dd08..b32ce2b0b998 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -690,7 +690,7 @@ static void __init pte_soft_dirty_tests(struct pgtable_debug_args *args)
>   {
>   	pte_t pte = pfn_pte(args->fixed_pte_pfn, args->page_prot);
>   
> -	if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY))
> +	if (!pgtable_soft_dirty_supported())
>   		return;
>   
>   	pr_debug("Validating PTE soft dirty\n");
> @@ -702,7 +702,7 @@ static void __init pte_swap_soft_dirty_tests(struct pgtable_debug_args *args)
>   {
>   	pte_t pte;
>   
> -	if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY))
> +	if (!pgtable_soft_dirty_supported())
>   		return;
>   
>   	pr_debug("Validating PTE swap soft dirty\n");
> @@ -718,7 +718,7 @@ static void __init pmd_soft_dirty_tests(struct pgtable_debug_args *args)
>   {
>   	pmd_t pmd;
>   
> -	if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY))
> +	if (!pgtable_soft_dirty_supported())
>   		return;
>   
>   	if (!has_transparent_hugepage())
> @@ -734,8 +734,8 @@ static void __init pmd_swap_soft_dirty_tests(struct pgtable_debug_args *args)
>   {
>   	pmd_t pmd;
>   
> -	if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY) ||
> -		!IS_ENABLED(CONFIG_ARCH_ENABLE_THP_MIGRATION))
> +	if (!pgtable_soft_dirty_supported() ||
> +	    !IS_ENABLED(CONFIG_ARCH_ENABLE_THP_MIGRATION))
>   		return;
>   
>   	if (!has_transparent_hugepage())
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 9c38a95e9f09..218d430a2ec6 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -2271,12 +2271,13 @@ static inline int pmd_move_must_withdraw(spinlock_t *new_pmd_ptl,
>   
>   static pmd_t move_soft_dirty_pmd(pmd_t pmd)
>   {
> -#ifdef CONFIG_MEM_SOFT_DIRTY
> -	if (unlikely(is_pmd_migration_entry(pmd)))
> -		pmd = pmd_swp_mksoft_dirty(pmd);
> -	else if (pmd_present(pmd))
> -		pmd = pmd_mksoft_dirty(pmd);
> -#endif
> +	if (pgtable_soft_dirty_supported()) {
> +		if (unlikely(is_pmd_migration_entry(pmd)))
> +			pmd = pmd_swp_mksoft_dirty(pmd);
> +		else if (pmd_present(pmd))
> +			pmd = pmd_mksoft_dirty(pmd);
> +	}
> +

Wondering, should simply the arch take care of that and we can just clal
pmd_swp_mksoft_dirty / pmd_mksoft_dirty?

>   	return pmd;
>   }
>   
> diff --git a/mm/internal.h b/mm/internal.h
> index 45b725c3dc03..c6ca62f8ecf3 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -1538,7 +1538,7 @@ static inline bool vma_soft_dirty_enabled(struct vm_area_struct *vma)
>   	 * VM_SOFTDIRTY is defined as 0x0, then !(vm_flags & VM_SOFTDIRTY)
>   	 * will be constantly true.
>   	 */
> -	if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY))
> +	if (!pgtable_soft_dirty_supported())
>   		return false;
>   

That should be handled with the above never-set-VM_SOFTDIRTY.

>   	/*
> diff --git a/mm/mremap.c b/mm/mremap.c
> index e618a706aff5..7beb3114dbf5 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -162,12 +162,13 @@ static pte_t move_soft_dirty_pte(pte_t pte)
>   	 * Set soft dirty bit so we can notice
>   	 * in userspace the ptes were moved.
>   	 */
> -#ifdef CONFIG_MEM_SOFT_DIRTY
> -	if (pte_present(pte))
> -		pte = pte_mksoft_dirty(pte);
> -	else if (is_swap_pte(pte))
> -		pte = pte_swp_mksoft_dirty(pte);
> -#endif
> +	if (pgtable_soft_dirty_supported()) {
> +		if (pte_present(pte))
> +			pte = pte_mksoft_dirty(pte);
> +		else if (is_swap_pte(pte))
> +			pte = pte_swp_mksoft_dirty(pte);
> +	}
> +
>   	return pte;
>   }
>   
-- 
Cheers

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
