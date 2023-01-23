Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5C1C05027
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 14:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sFH5apxiv+WvJDu5R2jn8nJnmmmFai2cy9ieueipppc=; b=HJmY61Xuo0QdFw
	+7ttS7OD5fbr5CBa83svsIBN7C2+crQ0FfF8+aUHE/huHfuryUFQOwXkhhNy53u/b5G7hUyfDGVkP
	MNNGQW1mtOfJDuNhaXLXGCA9/2YnNkmfc4QuMnZjyC4soMc4h2OmSAgdtFSOD/RCE4noysfvBSff2
	a160o+Vfj5S09gvHM1eMCaBdEBgwNg0sP/ZN2/+8pShHz5DCrEHiWKvyC2/u4omiDXSgRtkTov2Fq
	NcfedKz6xNW3NfOJiBjNVd+gbUH8r3mbin//HgecJo4vx8nT/Tk/EiDamGAZ78uH5KnFkkiy4Lzn9
	a2LYv7x0YlhLTxiVzhsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJxuW-000087-DU; Mon, 23 Jan 2023 14:35:00 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJxuT-00006z-KY
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 14:34:59 +0000
Received: by mail-wm1-x32b.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so8735698wmq.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 06:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NYXZO/+I6Tj2auHQUaN1mdyHA2APFOFcC7l9cjd5m1Y=;
        b=y577DC+FR1wR2ZTMehaJlhUMpSWt8y2gpVM/9KIRwXh79iW4ZLkIo+qLG8+Gk9b9/9
         F8bVnG9AhPGet/xEeBHGlr/TsLhM66hyrBA5xpGXv90VkpQ7MFTlpq7rvC7nuVLyIO9n
         4By5CKfAz1J9gAvJ6Dgb/UUScWX7D7A92hk2ohw/rMpfNUgSKFXRzrtc+vqYUatXsSt9
         eLIbZDf2X/dbJUAU6va4kwpkolP+EOmhgiTGS8eDS/9hvRYCn6eP9F5oGHVvWZOpPwHP
         yohI6I+don/JVbDtnTXNlQBfLHf+/ombNMJZxcyA00HRgu1P81C8mzU5rHmSQ/uMXfVC
         27kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYXZO/+I6Tj2auHQUaN1mdyHA2APFOFcC7l9cjd5m1Y=;
        b=3KUHVK36PeIMw5qttku6wm6Omt/E0l9ni3NYaKSUOi4LuwlLmDZZMVccZWAauyxh6A
         RLuPeUL2SOQxiP7jeIoP0kun5pHSjG/58TgWVnDpPx4Vedj4TbE+XOCREQD6shXrtVip
         YzKSeUfRooMerOVPYXqQNp7Yaa9EFvW/OfgbOtPxrSSYOcqP3VxOYbjXasw/UnCyflAl
         eEwgcqtD+2OmDCWE12quzCVZyZiBs1ELtsf81YsnxUHp9+nFIrT6ZA9yArNhOtMiEkgL
         Hct10FAMW0v1xBXAvqtShPzkFgIdbGpsnJJVa/sHkZMRp7w67Jbk1FA/7XeG+V445UbX
         ciaw==
X-Gm-Message-State: AFqh2kpCG6yTzVBWlTm4x/1+W11A6oD3GJuCC9PxQNn6J/yULyiWmhZv
	SaVpp0BUJIczL3mjAE6AWjQOqCE7FF0N20Zxyzt5JQ==
X-Google-Smtp-Source: AMrXdXu0vsOo+SyPBXHsKyMNnmlRi1Rm0z1Zb/nnYJgByqkr1cktzTfdINU/WrgqZiQ85maXTmDh+hayFkqFAVvZiQM=
X-Received: by 2002:a05:600c:4d14:b0:3da:ff1f:e89e with SMTP id
 u20-20020a05600c4d1400b003daff1fe89emr1691278wmp.7.1674484496273; Mon, 23 Jan
 2023 06:34:56 -0800 (PST)
MIME-Version: 1.0
References: <20230123092928.808014-1-alexghiti@rivosinc.com>
 <bdabafb1-53f3-403c-ab9c-1c2d00421690@ghiti.fr> <CAAhSdy1grLz2EXEJUicGFZO7md7F=Hbnhv7ZqBFFx-vtnkpmmA@mail.gmail.com>
In-Reply-To: <CAAhSdy1grLz2EXEJUicGFZO7md7F=Hbnhv7ZqBFFx-vtnkpmmA@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 23 Jan 2023 15:34:45 +0100
Message-ID: <CAHVXubjHBu7F9xaERTR6vppsUph2U8JX1DRSrFUAWs-jJ_8ncQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: RISC-V: Fix wrong usage of PGDIR_SIZE to check page sizes
To: Anup Patel <anup@brainfault.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_063457_936463_7605635E 
X-CRM114-Status: GOOD (  21.10  )
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

On Mon, Jan 23, 2023 at 12:28 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, Jan 23, 2023 at 3:01 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
> >
> > @Anup: Sorry, forgot to add -fixes to the patch title, as I think this
> > should go into your fixes branch for 6.2.
>
> Can you provide the Fixes: line here ? I will include it at time of
> adding this patch to my fixes branch.

It actually fixes 2 commits: 9955371cc014 ("RISC-V: KVM: Implement MMU
notifiers") and 9d05c1fee837 ("RISC-V: KVM: Implement stage2 page
table programming"). But they were both part of the first KVM
patchset, so I only took the oldest one, but tell me if you want me to
split the patch into 2 different patches that fix one commit at a
time.

Fixes: 9d05c1fee837 ("RISC-V: KVM: Implement stage2 page table programming")

Thanks,

Alex

>
> Regards,
> Anup
>
> >
> > On 1/23/23 10:29, Alexandre Ghiti wrote:
> > > At the moment, riscv only supports PMD and PUD hugepages. For sv39,
> > > PGDIR_SIZE == PUD_SIZE but not for sv48 and sv57. So fix this by changing
> > > PGDIR_SIZE into PUD_SIZE.
> > >
> > > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > > ---
> > >   arch/riscv/kvm/mmu.c | 8 ++++----
> > >   1 file changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> > > index 34b57e0be2ef..dbc4ca060174 100644
> > > --- a/arch/riscv/kvm/mmu.c
> > > +++ b/arch/riscv/kvm/mmu.c
> > > @@ -585,7 +585,7 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
> > >       if (!kvm->arch.pgd)
> > >               return false;
> > >
> > > -     WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PGDIR_SIZE);
> > > +     WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PUD_SIZE);
> > >
> > >       if (!gstage_get_leaf_entry(kvm, range->start << PAGE_SHIFT,
> > >                                  &ptep, &ptep_level))
> > > @@ -603,7 +603,7 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
> > >       if (!kvm->arch.pgd)
> > >               return false;
> > >
> > > -     WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PGDIR_SIZE);
> > > +     WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PUD_SIZE);
> > >
> > >       if (!gstage_get_leaf_entry(kvm, range->start << PAGE_SHIFT,
> > >                                  &ptep, &ptep_level))
> > > @@ -645,12 +645,12 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
> > >       if (logging || (vma->vm_flags & VM_PFNMAP))
> > >               vma_pagesize = PAGE_SIZE;
> > >
> > > -     if (vma_pagesize == PMD_SIZE || vma_pagesize == PGDIR_SIZE)
> > > +     if (vma_pagesize == PMD_SIZE || vma_pagesize == PUD_SIZE)
> > >               gfn = (gpa & huge_page_mask(hstate_vma(vma))) >> PAGE_SHIFT;
> > >
> > >       mmap_read_unlock(current->mm);
> > >
> > > -     if (vma_pagesize != PGDIR_SIZE &&
> > > +     if (vma_pagesize != PUD_SIZE &&
> > >           vma_pagesize != PMD_SIZE &&
> > >           vma_pagesize != PAGE_SIZE) {
> > >               kvm_err("Invalid VMA page size 0x%lx\n", vma_pagesize);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
