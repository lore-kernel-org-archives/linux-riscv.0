Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2E9C636D4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 14:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qV2n4v92hdzP8Ge9FHLphY5W0Rm71a6cXf+kiOinZ08=; b=bC2y8bSsY1sy4WKzqWrUnUyo3E
	30d25Zu4cCkOD3pC3YYrasB3rZ3DtGMWQQkjYLRjlohvlCM/NcWeFBAAwyx4W7fVzPnRq1nVX3B4o
	WsYxVZhD8MMp+oJU36G4NvRlrdDhly4c83qSqDhSolYH7iy7lHaOYBnXiY6OtqTq1JCXe7E/AA0vJ
	NMqd2UXkAuLWDo4aU+CRVRCt6A3Y8AKQdUQ2SEVf3vi4Lmj+YZjds8jSQrFlzWtuuA7D+JlqVRUz3
	R0OlfNt9sDEg+WPqqQOqwdqaDJihNUxXaGg+iDJRalvm8GH3gUtDX4bvEgjdbdq2CBvvYd68wlqbx
	92rFJsjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRZy1-00F0Fa-28; Mon, 13 Feb 2023 14:38:05 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRZxy-00F0Dl-0A
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 14:38:04 +0000
Received: by mail-pf1-x42d.google.com with SMTP id t17so8075950pfj.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 06:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v46IGf7aK9w6Ujjdk9pH0Sd2OlQiZacAgD2cBvk1jT0=;
        b=SzFpKuzH1Wg1EhWOGZPaNWQd2POITNEL5ZP8sLHp25iK+Mn6828HZ6U13HeQCN93Sx
         +0ZNI0ubnqjUSBiqLTF8TSzT8ESdFmVXQ0TpJZ3Qm5ltt+EMXxjri/+uueQF1nGjGMA4
         stDvus1Ojiffvsbq+nnE/UFkipL/riZobKSSy4IW/WVEusJyPLHO1nE6z5Bpy4fnOsgP
         kJ51zGJGuGpgfXmSA8YquHUgckB/TBqhkvuuQyNOeijvGHmV19pXSOA3v2MlP7wD95ls
         UEl9GtUVFINyfXgxkowUI5R/zjVUa2yd5uwaFVOYIaNuZiIogxSqqpN2//Dbkl2WDX51
         yzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v46IGf7aK9w6Ujjdk9pH0Sd2OlQiZacAgD2cBvk1jT0=;
        b=B+GLrgCKMbW1xzLcc0vKSeAzHZyWk5lNElX5wmzn01J9YJRt7EVexyoP1RC72ZGKfz
         S5uoXRnrStzyMh5szD8Q6JyguwXRsBAnF+2IpXMF11H2c08d0mDzCHisOEGRXtMxCufY
         +ib3qve0DkwHdha9ifu+oPm+OKjyn1Gal2KJDsPeV5TWltEG6JxLuLX4ncL717D5z/wE
         wr4S4uhtiPrjr4OlyNU4kYVYStk0kW/k0GaxoXFqlcKM/C2Dthnw7nBQgiaJc8oulFRx
         KHuSmfTtvL1imwMz4EY4vOuL1eoXorn4TTfwvcdZ6nmI8fpk0XgbV9UBeauIhsuXoXqY
         BCqA==
X-Gm-Message-State: AO0yUKUwoUkyQcrIDRUKHd9PYShqIOqthE3+f2g6kgo9fVbqhbH4WM2C
	ia6HrVC658cfe5W0zQRXFC8wujmg4C2E4yCp
X-Google-Smtp-Source: AK7set/DKESMToA1CvFzD8s7hPzM1C6fYF5uRXkJ8n+Af4LEgHbtdNDBVTegNt3NTjuOhT2mPBEStg==
X-Received: by 2002:a62:4ec3:0:b0:5a8:c40e:891c with SMTP id c186-20020a624ec3000000b005a8c40e891cmr1406360pfb.31.1676299076568;
        Mon, 13 Feb 2023 06:37:56 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id t13-20020a62ea0d000000b0057fec210d33sm8028139pfh.152.2023.02.13.06.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 06:37:56 -0800 (PST)
Date: Mon, 13 Feb 2023 06:37:54 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Subject: Re: [PATCH v1 RFC Zisslpcfi 11/20] mmu: maybe_mkwrite updated to
 manufacture shadow stack PTEs
Message-ID: <20230213143754.GC3943238@debug.ba.rivosinc.com>
References: <20230213045351.3945824-1-debug@rivosinc.com>
 <20230213045351.3945824-12-debug@rivosinc.com>
 <2d6eefb8-c7c5-7d32-9a75-ae716f828cd9@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2d6eefb8-c7c5-7d32-9a75-ae716f828cd9@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_063802_257558_35C5F014 
X-CRM114-Status: GOOD (  16.81  )
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

On Mon, Feb 13, 2023 at 01:05:16PM +0100, David Hildenbrand wrote:
>On 13.02.23 05:53, Deepak Gupta wrote:
>>maybe_mkwrite creates PTEs with WRITE encodings for underlying arch if
>>VM_WRITE is turned on in vma->vm_flags. Shadow stack memory is a write-
>>able memory except it can only be written by certain specific
>>instructions. This patch allows maybe_mkwrite to create shadow stack PTEs
>>if vma is shadow stack VMA. Each arch can define which combination of VMA
>>flags means a shadow stack.
>>
>>Additionally pte_mkshdwstk must be provided by arch specific PTE
>>construction headers to create shadow stack PTEs. (in arch specific
>>pgtable.h).
>>
>>This patch provides dummy/stub pte_mkshdwstk if CONFIG_USER_SHADOW_STACK
>>is not selected.
>>
>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>---
>>  include/linux/mm.h      | 23 +++++++++++++++++++++--
>>  include/linux/pgtable.h |  4 ++++
>>  2 files changed, 25 insertions(+), 2 deletions(-)
>>
>>diff --git a/include/linux/mm.h b/include/linux/mm.h
>>index 8f857163ac89..a7705bc49bfe 100644
>>--- a/include/linux/mm.h
>>+++ b/include/linux/mm.h
>>@@ -1093,6 +1093,21 @@ static inline unsigned long thp_size(struct page *page)
>>  void free_compound_page(struct page *page);
>>  #ifdef CONFIG_MMU
>>+
>>+#ifdef CONFIG_USER_SHADOW_STACK
>>+bool arch_is_shadow_stack_vma(struct vm_area_struct *vma);
>>+#endif
>>+
>>+static inline bool
>>+is_shadow_stack_vma(struct vm_area_struct *vma)
>>+{
>>+#ifdef CONFIG_USER_SHADOW_STACK
>>+	return arch_is_shadow_stack_vma(vma);
>>+#else
>>+	return false;
>>+#endif
>>+}
>>+
>>  /*
>>   * Do pte_mkwrite, but only if the vma says VM_WRITE.  We do this when
>>   * servicing faults for write access.  In the normal case, do always want
>>@@ -1101,8 +1116,12 @@ void free_compound_page(struct page *page);
>>   */
>>  static inline pte_t maybe_mkwrite(pte_t pte, struct vm_area_struct *vma)
>>  {
>>-	if (likely(vma->vm_flags & VM_WRITE))
>>-		pte = pte_mkwrite(pte);
>>+	if (likely(vma->vm_flags & VM_WRITE)) {
>>+		if (unlikely(is_shadow_stack_vma(vma)))
>>+			pte = pte_mkshdwstk(pte);
>>+		else
>>+			pte = pte_mkwrite(pte);
>>+	}
>>  	return pte;
>
>Exactly what we are trying to avoid in the x86 approach right now. 
>Please see the x86 series on details, we shouldn't try reinventing the 
>wheel but finding a core-mm approach that fits multiple architectures.
>
>https://lkml.kernel.org/r/20230119212317.8324-1-rick.p.edgecombe@intel.com

Thanks David for comment here. I looked at x86 approach. This patch
actually written in a way which is not re-inventing wheel and is following
a core-mm approach that fits multiple architectures.

Change above checks `is_shadow_stack_vma` and if it returns true then only
it manufactures shadow stack pte else it'll make a regular writeable mapping.

Now if we look at `is_shadow_stack_vma` implementation, it returns false if
`CONFIG_USER_SHADOW_STACK` is not defined. If `CONFIG_USER_SHADOW_STACK is
defined then it calls `arch_is_shadow_stack_vma` which should be implemented
by arch specific code. This allows each architecture to define their own vma
flag encodings for shadow stack (riscv chooses presence of only `VM_WRITE`
which is analogous to choosen PTE encodings on riscv W=1,R=0,X=0)

Additionally pte_mkshdwstk will be nop if not implemented by architecture.

Let me know if this make sense. If I am missing something here, let me know.

>
>-- 
>Thanks,
>
>David / dhildenb
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
