Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1E8C6379F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 20:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ap/T++iY0s2d5e6toI71bBPM5KPkOAxGz2ajnCPsCSY=; b=tm8liiReJ9FZh6p0b0+SOZkwGj
	3g5uCH5+jYp7TUaBja/AwcDwaJYrik+5E0+eheKMfg0G2rO5WbYEHC7v282yEsx5U4Ljd890RwhU2
	uEwPGGFgKAgd7HQj907GEWpPN9/BEWBgfaWdhQDISVCO9HyILs7rFMmUuSlhbfdXmy6Jyf9OEt/th
	otTm7aqpzgmtQxmR7MYZTb5qe+rUHsWqK7JUZ+mXZOQ2vyKtIN1xt0/cigq7XgWRkMkRGRaX6D4U5
	56a56reMcmDuxQDMGukAE+lmd4xBWdV+24sVFmoz6jeneFwjtjAAj3272fEbbtWqHATG+kL9JqOc9
	qWfR2xCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRf0m-00G5O5-VK; Mon, 13 Feb 2023 20:01:16 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRf0k-00G5Ln-3p
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 20:01:16 +0000
Received: by mail-pl1-x62f.google.com with SMTP id e17so5846030plg.12
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 12:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w/ylDHJlU1BFl20coGEiz1808doT/68HrQMyJm0KLIY=;
        b=pXRJHdDi1FBiTWcyaGAee5cATMQnJvUp3NbKoj+XlSja5seq3XzvjkeO0qeYppE1ui
         eZqKh0rOjjZEQSLvUv8oKMnsHLkM0WawTpLFFV8ZjaYqLpcb7HfIyJEexzh3hbeXl0Dn
         LuyZZUw6nIzFtxuSfFJVUUARRsFc12DuBqH6rNcEGnD4IoX+o9EfThkdZ2JebFH3gYmP
         CRW+PqwqyV+XkvO5FV4DXIhtX9Aq3cAqJdHEU3UXPX7BgDeRTH4Lv7UZm4sDVHm63ZSq
         xiYbHdEu1+BAZbxQrB8ADcvkUUhOEbtmP542VDbIDL5c+PWelWzPOKXIdP7iUQMfVTdI
         GDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/ylDHJlU1BFl20coGEiz1808doT/68HrQMyJm0KLIY=;
        b=5Cdc5x8MgY4nBOe3lq8f4AB6gkwEsIDxCDb6kfrYOER76d/7WLRl2HX/HnZylipvHf
         j4xmZwNECRuCgdBYvZGx7e7bVUjypV/1WL+9IIQ49V2l9yjNII7ehTvHQO9RfRe5haeG
         5AIaK+0KgbJqDYjehsOe0a+cP2GlXmXnQreGGEFbCcMtofNxn43WTsr5B6b1JKtTyEzW
         Pkhd1VFOhXwrKKSnL9DzhwuhF7sHYUy9r+Wt0QegfZIg0zPheb8RPAeRoeZk31h9PuPZ
         jseYPtumrMQAL985M8fHix+1pVIjK/dfprV1X07S2gDLAHH1Tjskh9jDTl3Gh4HWOHm1
         IQpw==
X-Gm-Message-State: AO0yUKWtyc1tZSF5+Dw7ObCcnfxmbmj5U55Z6SpWCuRwL/BptjRrxB8t
	M6vfxvPZTrD6+SaduW/bhjKLHBm/0Pxg+gVS
X-Google-Smtp-Source: AK7set+IUYie8T4ysBZbfM8RDgBJuy1q7vvaVvTl80/SQVMK6LuRzrIIVld8uHAf7Br81bxAQGwapw==
X-Received: by 2002:a17:902:f304:b0:19a:85a7:dcb9 with SMTP id c4-20020a170902f30400b0019a85a7dcb9mr114129ple.2.1676318471954;
        Mon, 13 Feb 2023 12:01:11 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id t23-20020a170902b21700b00196047fc25dsm8630945plr.42.2023.02.13.12.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 12:01:11 -0800 (PST)
Date: Mon, 13 Feb 2023 12:01:09 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Subject: Re: [PATCH v1 RFC Zisslpcfi 11/20] mmu: maybe_mkwrite updated to
 manufacture shadow stack PTEs
Message-ID: <20230213200109.GA4016181@debug.ba.rivosinc.com>
References: <20230213045351.3945824-1-debug@rivosinc.com>
 <20230213045351.3945824-12-debug@rivosinc.com>
 <2d6eefb8-c7c5-7d32-9a75-ae716f828cd9@redhat.com>
 <20230213143754.GC3943238@debug.ba.rivosinc.com>
 <7693247c-a55d-a375-3621-1b07115a9d99@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7693247c-a55d-a375-3621-1b07115a9d99@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_120114_375207_1C117CE9 
X-CRM114-Status: GOOD (  16.75  )
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

On Mon, Feb 13, 2023 at 03:56:22PM +0100, David Hildenbrand wrote:
>On 13.02.23 15:37, Deepak Gupta wrote:
>>On Mon, Feb 13, 2023 at 01:05:16PM +0100, David Hildenbrand wrote:
>>>On 13.02.23 05:53, Deepak Gupta wrote:
>>>>maybe_mkwrite creates PTEs with WRITE encodings for underlying arch if
>>>>VM_WRITE is turned on in vma->vm_flags. Shadow stack memory is a write-
>>>>able memory except it can only be written by certain specific
>>>>instructions. This patch allows maybe_mkwrite to create shadow stack PTEs
>>>>if vma is shadow stack VMA. Each arch can define which combination of VMA
>>>>flags means a shadow stack.
>>>>
>>>>Additionally pte_mkshdwstk must be provided by arch specific PTE
>>>>construction headers to create shadow stack PTEs. (in arch specific
>>>>pgtable.h).
>>>>
>>>>This patch provides dummy/stub pte_mkshdwstk if CONFIG_USER_SHADOW_STACK
>>>>is not selected.
>>>>
>>>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>>>---
>>>>  include/linux/mm.h      | 23 +++++++++++++++++++++--
>>>>  include/linux/pgtable.h |  4 ++++
>>>>  2 files changed, 25 insertions(+), 2 deletions(-)
>>>>
>>>>diff --git a/include/linux/mm.h b/include/linux/mm.h
>>>>index 8f857163ac89..a7705bc49bfe 100644
>>>>--- a/include/linux/mm.h
>>>>+++ b/include/linux/mm.h
>>>>@@ -1093,6 +1093,21 @@ static inline unsigned long thp_size(struct page *page)
>>>>  void free_compound_page(struct page *page);
>>>>  #ifdef CONFIG_MMU
>>>>+
>>>>+#ifdef CONFIG_USER_SHADOW_STACK
>>>>+bool arch_is_shadow_stack_vma(struct vm_area_struct *vma);
>>>>+#endif
>>>>+
>>>>+static inline bool
>>>>+is_shadow_stack_vma(struct vm_area_struct *vma)
>>>>+{
>>>>+#ifdef CONFIG_USER_SHADOW_STACK
>>>>+	return arch_is_shadow_stack_vma(vma);
>>>>+#else
>>>>+	return false;
>>>>+#endif
>>>>+}
>>>>+
>>>>  /*
>>>>   * Do pte_mkwrite, but only if the vma says VM_WRITE.  We do this when
>>>>   * servicing faults for write access.  In the normal case, do always want
>>>>@@ -1101,8 +1116,12 @@ void free_compound_page(struct page *page);
>>>>   */
>>>>  static inline pte_t maybe_mkwrite(pte_t pte, struct vm_area_struct *vma)
>>>>  {
>>>>-	if (likely(vma->vm_flags & VM_WRITE))
>>>>-		pte = pte_mkwrite(pte);
>>>>+	if (likely(vma->vm_flags & VM_WRITE)) {
>>>>+		if (unlikely(is_shadow_stack_vma(vma)))
>>>>+			pte = pte_mkshdwstk(pte);
>>>>+		else
>>>>+			pte = pte_mkwrite(pte);
>>>>+	}
>>>>  	return pte;
>>>
>>>Exactly what we are trying to avoid in the x86 approach right now.
>>>Please see the x86 series on details, we shouldn't try reinventing the
>>>wheel but finding a core-mm approach that fits multiple architectures.
>>>
>>>https://lkml.kernel.org/r/20230119212317.8324-1-rick.p.edgecombe@intel.com
>>
>>Thanks David for comment here. I looked at x86 approach. This patch
>>actually written in a way which is not re-inventing wheel and is following
>>a core-mm approach that fits multiple architectures.
>>
>>Change above checks `is_shadow_stack_vma` and if it returns true then only
>>it manufactures shadow stack pte else it'll make a regular writeable mapping.
>>
>>Now if we look at `is_shadow_stack_vma` implementation, it returns false if
>>`CONFIG_USER_SHADOW_STACK` is not defined. If `CONFIG_USER_SHADOW_STACK is
>>defined then it calls `arch_is_shadow_stack_vma` which should be implemented
>>by arch specific code. This allows each architecture to define their own vma
>>flag encodings for shadow stack (riscv chooses presence of only `VM_WRITE`
>>which is analogous to choosen PTE encodings on riscv W=1,R=0,X=0)
>>
>>Additionally pte_mkshdwstk will be nop if not implemented by architecture.
>>
>>Let me know if this make sense. If I am missing something here, let me know.
>
>See the discussion in that thread. The idea is to pass a VMA to 
>pte_mkwrite() and let it handle how to actually set it writable.
>

Thanks. I see. Instances where `pte_mkwrite` is directly invoked by checking
VM_WRITE and thus instead of fixing all those instance, make pte_mkwrite itself
take vma flag or vma.

I'll revise.
>-- 
>Thanks,
>
>David / dhildenb
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
