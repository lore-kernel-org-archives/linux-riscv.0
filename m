Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B120ECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Sep 2022 15:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NeF6GjCVvLa0Ecr6eaRXl6A56WlaiVO7d9OnaXuX5QE=; b=jEcuTGasAiv8dE
	hD2GX1ew0a8wETxOJMfsPmhqWsSOa/nULTyPtqBf+Np/30gU7cZd8D4jUSrU+5EYJzKRSh1E3Cqff
	JZZ2gq7mYA2anYM7ybzlYgUyQ6KDpGwW7OAqUWF7PmEysc8HVghWnMpaYxJFL6Fz5t0lsDKjJVVFN
	5ua9ZZTmdVcftlGfa+vzltUgMXP6h9nHxbFVyXEzy4+fetvuwb/xhBS6hNP/dvY2rc//DQLYqSFSc
	bZstgDGKsZo5BvxhwvZntAWI8cqWA974cVeEpn4ugX7xhhXwhAahNisT6m1Dv4JIarD5hqZ9iHSuK
	0Fesfr2JdggDevNMhX5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWfkX-00HN6k-QT; Fri, 09 Sep 2022 15:16:57 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWfkU-00HN41-OQ
	for linux-riscv@lists.infradead.org; Fri, 09 Sep 2022 15:16:56 +0000
Received: by mail-pg1-x534.google.com with SMTP id c24so1848101pgg.11
        for <linux-riscv@lists.infradead.org>; Fri, 09 Sep 2022 08:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=pkkVHpxNti+LsS3RaFIJvYPZ50QQRqshmqnZyXM7B3w=;
        b=6ol+C+uUDiV63QxAnyAd+FdZy3jMWxRuxeIc7GvOQ1jyxLQw+/rRNPhQeUcjI0dsSh
         EZPZzZkrB6l3ZWBTUpMvgIoF1YKWQ639NuucTNTS1p2Wre/1OlD+bhmYJ0YYt8PDtGcS
         TH3F7N0o2E3DlnYd38f6XbuuPlVjfyNWoEid7zeSU7b6Rk2r2r84wOA1Mzylbkk+U2px
         m3V8XWG6+zA9jyni1v/sSFtvFOVDi8ZEVBRFJTEd+WhV2q4jp1b2cn4DxB3UQ+CajZRK
         6xl5I93Gp1vTaKbsM5aCwU6g+Aqa08DYT82e2P1xn1fLyqg3oeFHWW6HzqBfMmRFd2O7
         KYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=pkkVHpxNti+LsS3RaFIJvYPZ50QQRqshmqnZyXM7B3w=;
        b=Wni5q5azKsS/Hc5GrBGrfbeCBUZynxQIVB2Yb7byXRtiUt43E47i986JYwHaBabL7f
         TMCPQShruvUO/Os0YXPgrxu+PK8roxKoW88vq4Mfwbz2RVmBHd+LNRFWCaYqY6qVp4zI
         W6G3lNj/DPN9oKSxKAcTTma9m8cDmEgE8unJxi4bdnEdm++Slp5M/GMm9kZiyOtUX+Mo
         QgWNOAgCmxnzLgA7Sc+o6lEatVPtXtT0olQxyXtF7/Sodd2xSOVW5ydppKxVJz/U2m5u
         PE0y4SRlbvPx+MsmODLCp0aBBJdF+rSGe1vy75AcOCIGw+Lx1p0hUdj3bN3xugVdx69Z
         SKjw==
X-Gm-Message-State: ACgBeo0V/Iy9nxxddggURmKIRVj5NyzqzWjQNJhoGLSVdBS0udOXAhAH
	DSwBVNnOAV4DQxZwZF3CVcE/qfXC5cuVCkwl7Uma4A==
X-Google-Smtp-Source: AA6agR6LdKaOyngOkbvfwpeXfscLxrHabNg5RtikZKiPDkYgMtFK31EsFeKXXo3Tvi2lB3Pmia+Br9R/MCzI61MCTcY=
X-Received: by 2002:a63:8a4a:0:b0:434:c99c:6fd4 with SMTP id
 y71-20020a638a4a000000b00434c99c6fd4mr12302087pgd.24.1662736611033; Fri, 09
 Sep 2022 08:16:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220908170133.1159747-1-abrestic@rivosinc.com>
 <20220908185006.1212126-1-abrestic@rivosinc.com> <2f5059f6-b024-1ee8-b961-5aa0b4e4c116@gmail.com>
 <dfd6cfd9-5985-030f-4c77-f9037dcebe90@gmail.com>
In-Reply-To: <dfd6cfd9-5985-030f-4c77-f9037dcebe90@gmail.com>
From: Andrew Bresticker <abrestic@rivosinc.com>
Date: Fri, 9 Sep 2022 11:16:40 -0400
Message-ID: <CALE4mHoDbh2Aq7eotzKAeqy80n29LWkuP+gjv8ADH7pTJAYQhQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: Make mmap() with PROT_WRITE imply PROT_READ
To: Coelacanthus <coelacanthushex@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Atish Patra <atishp@atishpatra.org>, dram <dramforever@live.com>, 
	Ruizhe Pan <c141028@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_081654_822291_D81A62B0 
X-CRM114-Status: GOOD (  37.41  )
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

On Fri, Sep 9, 2022 at 7:42 AM Coelacanthus <coelacanthushex@gmail.com> wrote:
>
> On 2022/9/9 11:01, Celeste Liu wrote:
> > On 2022/9/9 02:50, Andrew Bresticker wrote:
> >> Commit 2139619bcad7 ("riscv: mmap with PROT_WRITE but no PROT_READ is
> >> invalid") made mmap() return EINVAL if PROT_WRITE was set wihtout
> >> PROT_READ with the justification that a write-only PTE is considered a
> >> reserved PTE permission bit pattern in the privileged spec. This check
> >> is unnecessary since RISC-V defines its protection_map such that PROT_WRITE
> >> maps to the same PTE permissions as PROT_WRITE|PROT_READ, and it is
> >> inconsistent with other architectures that don't support write-only PTEs,
> >> creating a potential software portability issue. Just remove the check
> >> altogether and let PROT_WRITE imply PROT_READ as is the case on other
> >> architectures.
> >>
> >> Note that this also allows PROT_WRITE|PROT_EXEC mappings which were
> >> disallowed prior to the aforementioned commit; PROT_READ is implied in
> >> such mappings as well.
> >>
> >> Fixes: 2139619bcad7 ("riscv: mmap with PROT_WRITE but no PROT_READ is invalid")
> >> Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
> >> ---
> >> v1 -> v2: Update access_error() to account for write-implies-read
> >> ---
> >>  arch/riscv/kernel/sys_riscv.c | 3 ---
> >>  arch/riscv/mm/fault.c         | 3 ++-
> >>  2 files changed, 2 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> >> index 571556bb9261..5d3f2fbeb33c 100644
> >> --- a/arch/riscv/kernel/sys_riscv.c
> >> +++ b/arch/riscv/kernel/sys_riscv.c
> >> @@ -18,9 +18,6 @@ static long riscv_sys_mmap(unsigned long addr, unsigned long len,
> >>      if (unlikely(offset & (~PAGE_MASK >> page_shift_offset)))
> >>              return -EINVAL;
> >>
> >> -    if (unlikely((prot & PROT_WRITE) && !(prot & PROT_READ)))
> >> -            return -EINVAL;
> >> -
> >>      return ksys_mmap_pgoff(addr, len, prot, flags, fd,
> >>                             offset >> (PAGE_SHIFT - page_shift_offset));
> >>  }
> >> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> >> index f2fbd1400b7c..d86f7cebd4a7 100644
> >> --- a/arch/riscv/mm/fault.c
> >> +++ b/arch/riscv/mm/fault.c
> >> @@ -184,7 +184,8 @@ static inline bool access_error(unsigned long cause, struct vm_area_struct *vma)
> >>              }
> >>              break;
> >>      case EXC_LOAD_PAGE_FAULT:
> >> -            if (!(vma->vm_flags & VM_READ)) {
> >> +            /* Write implies read */
> >> +            if (!(vma->vm_flags & (VM_READ | VM_WRITE))) {
> >>                      return true;
> >>              }
> >>              break;
> >
> > Hi, this did solve the problem and achieved consistency between
> > architectures, but I have a question.
> >
> > Such a change specifies behavior for a state that should not exist,
> > and if, in the future, RISC-V spec specifies a different behavior
> > for that state (I mean, RVI itself has a history of not caring about
> > downstream, like Zicsr and Zifencei), it will create inconsistencies,
> > which is bad.
> >
> > If we reject the "write but not read" state, the user gets the most direct
> > response: the state is not allowed so that they do not and cannot rely
> > on the behavior of the state. This will bring better time consistency
> > to the application if the spec specifies the behavior in the future.
> > But it lost architecture consistency.
> >
> > How do you think this situation should be handled properly?
> >
> > Yours,
> > Celeste Liu
>
> Oops!
>
> I found a mistake in my previous understanding: PTE permission!=vma permission.
> So your modification makes sense, no matter how we handle the mapping of input
> permissions to PTEs, as long as we don't use the reserved permission combinations,
> the behavior is reasonable and also independent of the architecture's definition
> of PTEs.
>
> But I think this mapping relationship should be well documented. If we have
> such a mapping behavior in all architectures, then we should change this line in
> the mmap documentation
>     On some hardware architectures (e.g., i386), PROT_WRITE implies PROT_READ.
> to apply all architectures. According to my read about code, all the vm_get_page_prot
> will do the protection_map mapping to have this feature.

I think leaving the PROT_WRITE-implies-PROT_READ as being specified as
architecture-dependent is reasonable, but of course portable programs
shouldn't rely on this behavior. There are CPUs out there that support
write-only mappings -- MIPS with RI/XI comes to mind and indeed
mmap(PROT_WRITE) on such CPUs results in write-only mappings.

-Andrew

>
> Yours,
> Celeste Liu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
