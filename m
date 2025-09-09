Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A8BCA0FED
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 15:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gr/Wb8Ataqyp2xOQxW/4WAFe9NiqEkG4jYObSU8Zr+I=; b=g/lUfG0MaOY2Fp
	jKwfNXs3988BFuzqoTZd4KQjUfcSiAWWZiKnUTp0VzTVSN+yODR66KijCNbOtorHEmCMSzl21mAe8
	R+3hARx/VGuGGbFMSx94QznmOOuVQ7XcIv33GBSRirc8yjuXqNBjKRBYOuaJObQN1KHv/zo8oeNpP
	vnr1RKUPaHlPb2UttHDG8w/D1GDmsUMin+oBvdsCZ+FFmOjVIrmL9HtAe5l93fmUiKI81FbbgYlu0
	vhvukhsc8xiHAN3u9E49VMkmnup2NNEgKcHypSoq99bcMVo5lGiaIvQukMvYKIfPG+klcrpLJG1Qi
	3opKdcCZkRdPTGYgZKvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0Yt-00000008GBN-2jGZ;
	Tue, 09 Sep 2025 15:47:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwk9-00000006oxD-1Tpx
	for linux-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 11:42:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757418155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tUGU+TjHtTHHLTK2zHbFOGsi468ffG0Hp57VOnPF+Rk=;
	b=f4ar77NKr4YtZoBqNLrJqvtjZPgTOgcwqu6IPDZ+cZsnF5xaGIDzke5TWjnonlyS1b/o1p
	inkfdF30JZew84l1IGOBfo8KNa3hEv7y72iAojknKfhCxiRqSju/IWQL2zVsRnwOg3ff97
	RWp6ly6CVq0Ec/Id+MjBmIUOO4YO/yw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-rm82RwyrNa2pMeh8CCKu8A-1; Tue, 09 Sep 2025 07:42:33 -0400
X-MC-Unique: rm82RwyrNa2pMeh8CCKu8A-1
X-Mimecast-MFC-AGG-ID: rm82RwyrNa2pMeh8CCKu8A_1757418152
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3e26569a11aso2748736f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 09 Sep 2025 04:42:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757418152; x=1758022952;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tUGU+TjHtTHHLTK2zHbFOGsi468ffG0Hp57VOnPF+Rk=;
        b=ASBRObLec018/Yp1GNdTAZ3VNZQuSsUJth/IwpLJgTulbZk/R0Ly6Sd9gtgTjbohEI
         a8CyXOPMCXH8YX2pVMnE/UI7TP3b4MXfqfhdohsjFGsTJ+Vmidjg3EnSVuEE6HkJBu7L
         6KZ+kxXNqYYpuWR0AwWwvdsE4QW/H7GCV0S5M9Ajq2bSM/pGIRHxnt9xtCLtXWYRFf7H
         YtIxJZwk+pFDGMpCEtHhMeWzzcQ1dNhKQPYDlQ4qXyiRhAtnlsAzKpMdPlCAQ/f+pqqE
         IUKdmZ4UOmrhf5CnMiAR52EJSR7cODuPMvM042h5lLREMuQWpnFlpfBpWZzleaiHAgRS
         bZ7w==
X-Forwarded-Encrypted: i=1; AJvYcCWqa8TifYBoRuVUPyiww6e56UDRlpxygB9qBwveX7ZIqnmaNkZTUgu+vWo23qoStQoOESRThgDOLtDKoA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmdD7x3o630F6w/Ql/DJQSjPD3SW9fr6H1dFNDRc5Tcv/CAlw/
	8kdrp0X62XfvkdkpYlfPSBJ69u1rHaTGmbApUqY0+Fv6JcUbFK0sc71hnLisYN2jJ5ajMpi5tu0
	JyIFPG3puIjJuA55WLbohLTpKtCjcbjscqKkcT5Bv/cV8tQoJr9FEpbnoR8Hlv6EUmUoPWw==
X-Gm-Gg: ASbGnctG5ku18M7f5hcYDFBtnxvvSausKRLRN7ECCe3s/v+/vZqJAwGsvW0zY0K3oHJ
	wfjgKY4bgHiE2SktaaO/RutD4X47wz+3aPNyt/2/KGbOb0XRyUgkRoXKfz+/npmXNZnPiGUMNBw
	05Qwxlf/28ABmbidxe05pXcQFvdHSdE81QH6AtOUKO7MT2PalQNrqYLNRQ2Po1/KVp48KEmjcTo
	62SrC382CDMrcrZ/k9nJi+eJ+59t2v+cN62cAPdY3wWOcWNvTO9Oi2x5sqLNBF6xMxfqUkSm6M+
	UG0mNSFNSULME5DyKXQ5RLa66bvcDkwqT8ci+5shykdUCPMou2dC51qG+Ws49+JyE3nM1g==
X-Received: by 2002:a05:6000:420f:b0:3e5:3346:6e91 with SMTP id ffacd0b85a97d-3e64383717dmr10654971f8f.34.1757418151787;
        Tue, 09 Sep 2025 04:42:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKFeXgvK0zu78cnS/MrxQ6hYkXo2ROCVXFAQC8NTjQM7+aKrD3KcmqhXZxE0LXSSAZhwTOPg==
X-Received: by 2002:a05:6000:420f:b0:3e5:3346:6e91 with SMTP id ffacd0b85a97d-3e64383717dmr10654811f8f.34.1757418149387;
        Tue, 09 Sep 2025 04:42:29 -0700 (PDT)
Received: from [192.168.3.141] (p57a1a41f.dip0.t-ipconnect.de. [87.161.164.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75223ea15sm2306665f8f.47.2025.09.09.04.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 04:42:28 -0700 (PDT)
Message-ID: <6b2f12aa-8ed9-476d-a69d-f05ea526f16a@redhat.com>
Date: Tue, 9 Sep 2025 13:42:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 1/5] mm: softdirty: Add pte_soft_dirty_available()
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
References: <20250909095611.803898-1-zhangchunyan@iscas.ac.cn>
 <20250909095611.803898-2-zhangchunyan@iscas.ac.cn>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250909095611.803898-2-zhangchunyan@iscas.ac.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3pjP3NN9Y_k74FtLM1GyfTv_EoxOVtcljtk94haj44g_1757418152
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_044237_462090_498C0ADA 
X-CRM114-Status: GOOD (  25.07  )
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

On 09.09.25 11:56, Chunyan Zhang wrote:
> Some platforms can customize the PTE soft dirty bit and make it unavailable
> even if the architecture allows providing the PTE resource.
> 
> Add an API which architectures can define their specific implementations
> to detect if the PTE soft-dirty bit is available, on which the kernel
> is running.
> 
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> ---
>   fs/proc/task_mmu.c      | 17 ++++++++++++++++-
>   include/linux/pgtable.h | 10 ++++++++++
>   mm/debug_vm_pgtable.c   |  9 +++++----
>   mm/huge_memory.c        | 10 ++++++----
>   mm/internal.h           |  2 +-
>   mm/mremap.c             | 10 ++++++----
>   mm/userfaultfd.c        |  6 ++++--
>   7 files changed, 48 insertions(+), 16 deletions(-)
> 
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index 29cca0e6d0ff..20a609ec1ba6 100644
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
> + * We should remove the VM_SOFTDIRTY flag if the PTE soft-dirty bit is
> + * unavailable on which the kernel is running, even if the architecture
> + * allows providing the PTE resource and soft-dirty is compiled in.
> + */
> +#ifdef CONFIG_MEM_SOFT_DIRTY
> +	if (!pte_soft_dirty_available())
> +		mnemonics[ilog2(VM_SOFTDIRTY)][0] = 0;
> +#endif
> +
>   	size_t i;
>   
>   	seq_puts(m, "VmFlags: ");
> @@ -1531,6 +1541,8 @@ static inline bool pte_is_pinned(struct vm_area_struct *vma, unsigned long addr,
>   static inline void clear_soft_dirty(struct vm_area_struct *vma,
>   		unsigned long addr, pte_t *pte)
>   {
> +	if (!pte_soft_dirty_available())
> +		return;
>   	/*
>   	 * The soft-dirty tracker uses #PF-s to catch writes
>   	 * to pages, so write-protect the pte as well. See the
> @@ -1566,6 +1578,9 @@ static inline void clear_soft_dirty_pmd(struct vm_area_struct *vma,
>   {
>   	pmd_t old, pmd = *pmdp;
>   
> +	if (!pte_soft_dirty_available())
> +		return;
> +
>   	if (pmd_present(pmd)) {
>   		/* See comment in change_huge_pmd() */
>   		old = pmdp_invalidate(vma, addr, pmdp);
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 4c035637eeb7..c0e2a6dc69f4 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1538,6 +1538,15 @@ static inline pgprot_t pgprot_modify(pgprot_t oldprot, pgprot_t newprot)
>   #endif
>   
>   #ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
> +
> +/*
> + * Some platforms can customize the PTE soft dirty bit and make it unavailable
> + * even if the architecture allows providing the PTE resource.
> + */
> +#ifndef pte_soft_dirty_available
> +#define pte_soft_dirty_available()	(true)
> +#endif
> +
>   #ifndef CONFIG_ARCH_ENABLE_THP_MIGRATION
>   static inline pmd_t pmd_swp_mksoft_dirty(pmd_t pmd)
>   {
> @@ -1555,6 +1564,7 @@ static inline pmd_t pmd_swp_clear_soft_dirty(pmd_t pmd)
>   }
>   #endif
>   #else /* !CONFIG_HAVE_ARCH_SOFT_DIRTY */
> +#define pte_soft_dirty_available()	(false)
>   static inline int pte_soft_dirty(pte_t pte)
>   {
>   	return 0;
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 830107b6dd08..98ed7e22ccec 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -690,7 +690,7 @@ static void __init pte_soft_dirty_tests(struct pgtable_debug_args *args)
>   {
>   	pte_t pte = pfn_pte(args->fixed_pte_pfn, args->page_prot);
>   
> -	if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY))
> +	if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY) || !pte_soft_dirty_available())

I suggest that you instead make pte_soft_dirty_available() be false without CONFIG_MEM_SOFT_DIRTY.

e.g., for the default implementation

define pte_soft_dirty_available()	IS_ENABLED(CONFIG_MEM_SOFT_DIRTY)

That way you can avoid some ifefs and cleanup these checks.


But as we do also have PMD soft-dirty support, I guess we would want to call this
something more abstract "pgtable_soft_dirty_available" or "pgtable_soft_dirty_supported"

-- 
Cheers

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
