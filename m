Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE25CA0FED
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 08:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rh/c78UjNINqdag7ZjZtCgNnVcDuD/+hHYogh5PV9hk=; b=q1eg/deSm3SEs2
	04DogO4MjGZGN6S8m4d5at4356erc7LdiOUrwm8bFZat/HXM5LX2UfSeJXEVkFuuyjTvZ4M96nGsY
	TFP1yg4/hx8uYfK0C8xwDE2F2VaeJyV6PeeAF9ufu2zxImehI/c+E8MN5ZRyV8Y9o5621rtzRFC3d
	X1LEAEFIH9X8U3Aaigv01buMzNdY3yjOYvK7rMF5x4gWJmOJMyDmlLpdTUFCoLgSUl45FG6ynbl58
	uzpvOOzu3XCPQt4JgRKjhR0aqb7xPHz5CeoKFKLS1i5GPaAhugqHz8WaX5DY1klT5NPOB0lrshwDf
	q/hwBkMM8k5wyzijLLOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwG9Y-0000000Cucu-1ypH;
	Wed, 10 Sep 2025 08:26:08 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwG9W-0000000Cuc4-01kC
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 08:26:07 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-31db571a432so3401527fac.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Sep 2025 01:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757492765; x=1758097565; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nQH7snnNQnRZRbg0xLLdaSxYnYx9rFgR1u9eFyrWIv8=;
        b=MQPmLJaGlIsFXzox8XDbFK5xMV/inXtp/g3JZ4HE6CdUofffqN/PlevounkneLavcc
         r3tlb3/y9A7pNVw0HKUXMFj61JKvIna502Qo1cSYrr/cEDwPtYJ2OfbPmrikaNcVf3kd
         G5thTH0hwnpggoZ23pNgk0NEBxWBV0oM4qNiGu/SQqE6SAKiKWy2GqJM1mzzAgCa1bna
         WjrLfhc85fGbZnNidUZkWhBgOGfpfco6mb9ASuCm+yBg26Uv02IXUtWoO50UvgyDJIhf
         AyvbsdiADGOZ4IlClfEeGoVYlzGxdrZrnwU0LBEbJwBa3QVCMfOC1EA4aFUEmAi+w//X
         yqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757492765; x=1758097565;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQH7snnNQnRZRbg0xLLdaSxYnYx9rFgR1u9eFyrWIv8=;
        b=fhVZmH2VtoJzzjQbRYXeo2KbRWn3Q3+lJTfXEyoRFFkwcwxQIM4mHcRkSnUxBOzi10
         DtKFhe2+CNTe9V/S14/yS8Wxdahs6ho33eNkSwGWdzwx7rBThYUZjpf+Rg1BLUDtivom
         WsEqe4Dk5JuE7cv7o2ZmrjZMZ+wnawpsuM/Sjc1gsI/8/nOhFYlgNi/DgFQstCBHznlV
         hwk10piQYWf23iEzGTzy7XZ9PJ6jA690+gJg80O8nWiwaxyzFtDRGsgShpv6dyHlHMk3
         b2RhO59Xu8VTw1z8274inM4YPIRN35uXrUGq+VYOyuHeYWerQi+YSYc8XKvPWVYiiynQ
         Fq4A==
X-Forwarded-Encrypted: i=1; AJvYcCUB3RFRLIxp/SElmeDnBS0kvKwAqOqqwc6SUh9drlffHAJsiOCT3PT5QjgEGai7vivehfq+G5VDfzfGwA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQI6UYygYu4pzl2Lj2/p2kOWNkoisQl+ucMiglPCexXWCb19fE
	jQGiM1bTTvka9riuMhMvq5jAEQF8VITo4ManUIAD6rOazp+Fh88Lzao8kPDHsOZ9Eclc4GoHUPP
	xJ4QlrM8R36kh1Zi0AiJ7F6AymSmKNkM=
X-Gm-Gg: ASbGncvevm+JbOzJzjKT8bH9WBBh7yEhVp436j5nXAShTXz0woan6xN5U7kPdPcvov5
	YlTupvfWaw8IkMj2kY7WRmfGLEjmOgjZ/Jb+1u3NLESiTXk6hCUGnbeYrnPCbTB05mk9kjdCt17
	nwGqCNyJZgeFFiMp95gFf3CEc2JGyf7pXMeBCwyPQiITzZu2151IDzjYIivz9A52sAvvtCClTHH
	zuJ2g==
X-Google-Smtp-Source: AGHT+IG8+X4z7lWHsoiDJ8ey4B9KiZeLoM8QTORaK4x4ttFg5WhTeM8qOcmzY4k1bJV831pksGGd1X5634WxyYNLQpo=
X-Received: by 2002:a05:6871:4b10:b0:31d:6b5b:6b57 with SMTP id
 586e51a60fabf-32264c16755mr7048854fac.30.1757492764639; Wed, 10 Sep 2025
 01:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250909095611.803898-1-zhangchunyan@iscas.ac.cn>
 <20250909095611.803898-2-zhangchunyan@iscas.ac.cn> <6b2f12aa-8ed9-476d-a69d-f05ea526f16a@redhat.com>
In-Reply-To: <6b2f12aa-8ed9-476d-a69d-f05ea526f16a@redhat.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Wed, 10 Sep 2025 16:25:28 +0800
X-Gm-Features: Ac12FXx-v6pjQQB1q-gdPDWGiaVNDNxmW_UZ1a0xUB3t-SaqR__1RTrhpm4oqiU
Message-ID: <CAAfSe-vbvGQy9JozQY3vsqrrPrTaWYMcNw+NaDf3nReWz8ynZg@mail.gmail.com>
Subject: Re: [PATCH V10 1/5] mm: softdirty: Add pte_soft_dirty_available()
To: David Hildenbrand <david@redhat.com>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Deepak Gupta <debug@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>, 
	Arnd Bergmann <arnd@arndb.de>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_012606_058717_7900C742 
X-CRM114-Status: GOOD (  32.57  )
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

Hi David,

On Tue, 9 Sept 2025 at 19:42, David Hildenbrand <david@redhat.com> wrote:
>
> On 09.09.25 11:56, Chunyan Zhang wrote:
> > Some platforms can customize the PTE soft dirty bit and make it unavailable
> > even if the architecture allows providing the PTE resource.
> >
> > Add an API which architectures can define their specific implementations
> > to detect if the PTE soft-dirty bit is available, on which the kernel
> > is running.
> >
> > Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> > ---
> >   fs/proc/task_mmu.c      | 17 ++++++++++++++++-
> >   include/linux/pgtable.h | 10 ++++++++++
> >   mm/debug_vm_pgtable.c   |  9 +++++----
> >   mm/huge_memory.c        | 10 ++++++----
> >   mm/internal.h           |  2 +-
> >   mm/mremap.c             | 10 ++++++----
> >   mm/userfaultfd.c        |  6 ++++--
> >   7 files changed, 48 insertions(+), 16 deletions(-)
> >
> > diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> > index 29cca0e6d0ff..20a609ec1ba6 100644
> > --- a/fs/proc/task_mmu.c
> > +++ b/fs/proc/task_mmu.c
> > @@ -1058,7 +1058,7 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
> >        * -Werror=unterminated-string-initialization warning
> >        *  with GCC 15
> >        */
> > -     static const char mnemonics[BITS_PER_LONG][3] = {
> > +     static char mnemonics[BITS_PER_LONG][3] = {
> >               /*
> >                * In case if we meet a flag we don't know about.
> >                */
> > @@ -1129,6 +1129,16 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
> >               [ilog2(VM_SEALED)] = "sl",
> >   #endif
> >       };
> > +/*
> > + * We should remove the VM_SOFTDIRTY flag if the PTE soft-dirty bit is
> > + * unavailable on which the kernel is running, even if the architecture
> > + * allows providing the PTE resource and soft-dirty is compiled in.
> > + */
> > +#ifdef CONFIG_MEM_SOFT_DIRTY
> > +     if (!pte_soft_dirty_available())
> > +             mnemonics[ilog2(VM_SOFTDIRTY)][0] = 0;
> > +#endif
> > +
> >       size_t i;
> >
> >       seq_puts(m, "VmFlags: ");
> > @@ -1531,6 +1541,8 @@ static inline bool pte_is_pinned(struct vm_area_struct *vma, unsigned long addr,
> >   static inline void clear_soft_dirty(struct vm_area_struct *vma,
> >               unsigned long addr, pte_t *pte)
> >   {
> > +     if (!pte_soft_dirty_available())
> > +             return;
> >       /*
> >        * The soft-dirty tracker uses #PF-s to catch writes
> >        * to pages, so write-protect the pte as well. See the
> > @@ -1566,6 +1578,9 @@ static inline void clear_soft_dirty_pmd(struct vm_area_struct *vma,
> >   {
> >       pmd_t old, pmd = *pmdp;
> >
> > +     if (!pte_soft_dirty_available())
> > +             return;
> > +
> >       if (pmd_present(pmd)) {
> >               /* See comment in change_huge_pmd() */
> >               old = pmdp_invalidate(vma, addr, pmdp);
> > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > index 4c035637eeb7..c0e2a6dc69f4 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -1538,6 +1538,15 @@ static inline pgprot_t pgprot_modify(pgprot_t oldprot, pgprot_t newprot)
> >   #endif
> >
> >   #ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
> > +
> > +/*
> > + * Some platforms can customize the PTE soft dirty bit and make it unavailable
> > + * even if the architecture allows providing the PTE resource.
> > + */
> > +#ifndef pte_soft_dirty_available
> > +#define pte_soft_dirty_available()   (true)
> > +#endif
> > +
> >   #ifndef CONFIG_ARCH_ENABLE_THP_MIGRATION
> >   static inline pmd_t pmd_swp_mksoft_dirty(pmd_t pmd)
> >   {
> > @@ -1555,6 +1564,7 @@ static inline pmd_t pmd_swp_clear_soft_dirty(pmd_t pmd)
> >   }
> >   #endif
> >   #else /* !CONFIG_HAVE_ARCH_SOFT_DIRTY */
> > +#define pte_soft_dirty_available()   (false)
> >   static inline int pte_soft_dirty(pte_t pte)
> >   {
> >       return 0;
> > diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> > index 830107b6dd08..98ed7e22ccec 100644
> > --- a/mm/debug_vm_pgtable.c
> > +++ b/mm/debug_vm_pgtable.c
> > @@ -690,7 +690,7 @@ static void __init pte_soft_dirty_tests(struct pgtable_debug_args *args)
> >   {
> >       pte_t pte = pfn_pte(args->fixed_pte_pfn, args->page_prot);
> >
> > -     if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY))
> > +     if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY) || !pte_soft_dirty_available())
>
> I suggest that you instead make pte_soft_dirty_available() be false without CONFIG_MEM_SOFT_DIRTY.
>
> e.g., for the default implementation
>
> define pte_soft_dirty_available()       IS_ENABLED(CONFIG_MEM_SOFT_DIRTY)
>
> That way you can avoid some ifefs and cleanup these checks.

Do you mean something like this:

--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1538,6 +1538,16 @@ static inline pgprot_t pgprot_modify(pgprot_t
oldprot, pgprot_t newprot)
 #endif

 #ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
+#ifndef arch_soft_dirty_available
+#define arch_soft_dirty_available()     (true)
+#endif
+#define pgtable_soft_dirty_supported()
(IS_ENABLED(CONFIG_MEM_SOFT_DIRTY) && arch_soft_dirty_available())
+
 #ifndef CONFIG_ARCH_ENABLE_THP_MIGRATION
 static inline pmd_t pmd_swp_mksoft_dirty(pmd_t pmd)
 {
@@ -1555,6 +1565,7 @@ static inline pmd_t pmd_swp_clear_soft_dirty(pmd_t pmd)
 }
 #endif
 #else /* !CONFIG_HAVE_ARCH_SOFT_DIRTY */
+#define pgtable_soft_dirty_supported() (false)

>
>
> But as we do also have PMD soft-dirty support, I guess we would want to call this
> something more abstract "pgtable_soft_dirty_available" or "pgtable_soft_dirty_supported"
>
> --
> Cheers
>
> David / dhildenb
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
