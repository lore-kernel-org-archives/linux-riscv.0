Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF14C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jul 2022 04:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nL93ikA5NH+Y6dPXtLW2Qb2oWuNmHNqkMCrNQtgo0KE=; b=tTkoHq9yVbnJ25
	TfXqD8fwNCB3u5rCLPlRWjoMTTEKEaxTAfVhdJir9FxA/tB+Ad3tJvY1xXpsDAFHQfkmoTHHDVS0G
	k6STFEhPti5kJurwlNt61ICqRsqXehuX6fPFCVQj/IA4hbtaRhT7elxow1hrmXLG/UONQxRHIU10t
	q+ZwBxotv2gjvbOO26oqbaR6HzSdJCPtHYpdZzkQHudx6U1cEx3WFGPLVwBZgzgGyN3tryhk0QPOH
	HUOqE4BjwT0b6lpwUGHeh48jvg9A7vkbG1fiVTQwfiI+dAKu+9jXUYYH849zq5zhF19YCnE7zZ1Km
	WVHk3u2WZCKgIS9iL6YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDI2T-00ApBC-RP; Mon, 18 Jul 2022 04:07:21 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDI2R-00Ap9A-3I
	for linux-riscv@lists.infradead.org; Mon, 18 Jul 2022 04:07:20 +0000
Received: by mail-wr1-x42a.google.com with SMTP id bk26so15243396wrb.11
        for <linux-riscv@lists.infradead.org>; Sun, 17 Jul 2022 21:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QUmxFHl7udbaeL8gObJYf8R+qnUxXk7ZcjzIWaqyHiU=;
        b=UnUh04t/rSmvdG08Yrty3ldek6Nnv0PmCHO9xvpdzMcucRZDVLF0YFkwtiucc8S3fX
         j/B5ft/44yxZfIJFQL6yKpNHrG7qyZ+Gok3CfVxwSw7ylIEw67z9gMmc5MtZNTI7vqdr
         Rov70ZXEYbCXKG5R1RqddA+np6zzsQsbJXgQQ7IvF3A/PI0BDjV1BHef3Wtl31bZ2sIQ
         sWw/4fdTZftmbCX2G/yjlOuHKfkM8/Sn+mbXpiCGLyg7gYh4UG5IfB1M2Kf/1jO7Xdx2
         TRC6b2akSnmDPuZh23RHTJhV/DcO0H+LkFpJIp4QI6NeAVdNd3wK/b8l+5KBsWRtVQ9b
         W8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QUmxFHl7udbaeL8gObJYf8R+qnUxXk7ZcjzIWaqyHiU=;
        b=EtmT52IyVlwQH1obYgiymjzS0sYa6+cg+hiRD+N7jUBLkwmtcr+DsRgx8/CNGRyrGA
         kC+mmJt/4Fa/fKOPV3o38p+USGpmdDus4HUgvg9NFpSe3vw2GXj3F5yX9OhHREKnSHHm
         n0JoGi8uGOAlP6KNBzG6fqrurdeK/VjA5WNxt08an5bR5G8xt7879ege2+YfFFtebZsO
         09GdVfrxt4uzN8U1j+9UufpD1SZ5fEnT7wKEZflP7M14/Yehg8iK/PY56BFDLxJggHQ1
         zxkqcJOTJpN045z3OoQNXp9VlSrKxh+FDMQHTtEd8Nfqcl7yHFO+rQObxfEk8tD4wgfG
         +JaA==
X-Gm-Message-State: AJIora8TZjwEp2g/qn0bAR+LZsRm09Pvayg6eJ7GSm2DkSvDgHGJYyyA
	KD8sVbYS1AKL8ZfTZ9EPaZ1zni4oHMrnosVhiS2pPg==
X-Google-Smtp-Source: AGRyM1sgRM5bHN+EZTdAYzsYGyGJ6+Pcr+8r6q8kcbAFBUN7ttVPf5ETNbVQta4uZJMVcFWrjH/y9SjWZJu38BqE6jQ=
X-Received: by 2002:a5d:53c9:0:b0:21d:62f8:f99f with SMTP id
 a9-20020a5d53c9000000b0021d62f8f99fmr21308980wrw.214.1658117237264; Sun, 17
 Jul 2022 21:07:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220707145248.458771-1-apatel@ventanamicro.com>
 <20220707145248.458771-5-apatel@ventanamicro.com> <CAOnJCUKjFMMsrNWR=hzB+qbw4SECWS3+DOJDun90emnM-Vkpiw@mail.gmail.com>
In-Reply-To: <CAOnJCUKjFMMsrNWR=hzB+qbw4SECWS3+DOJDun90emnM-Vkpiw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 18 Jul 2022 09:37:05 +0530
Message-ID: <CAAhSdy2WZ9Gq9n53u+0FY2SAsXrmgDGdsHjbTJDYRNG+yNw3bw@mail.gmail.com>
Subject: Re: [PATCH 4/5] RISC-V: KVM: Use PAGE_KERNEL_IO in kvm_riscv_gstage_ioremap()
To: Atish Patra <atishp@atishpatra.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_210719_144461_D8267BFA 
X-CRM114-Status: GOOD (  16.35  )
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

On Wed, Jul 13, 2022 at 6:53 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Thu, Jul 7, 2022 at 7:53 AM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > When the host has Svpbmt extension, we should use page based memory
> > type 2 (i.e. IO) for IO mappings in the G-stage page table.
> >
> > To achieve this, we replace use of PAGE_KERNEL with PAGE_KERNEL_IO
> > in the kvm_riscv_gstage_ioremap().
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  arch/riscv/kvm/mmu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> > index f7862ca4c4c6..bc545aef6034 100644
> > --- a/arch/riscv/kvm/mmu.c
> > +++ b/arch/riscv/kvm/mmu.c
> > @@ -361,7 +361,7 @@ int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
> >         pfn = __phys_to_pfn(hpa);
> >
> >         for (addr = gpa; addr < end; addr += PAGE_SIZE) {
> > -               pte = pfn_pte(pfn, PAGE_KERNEL);
> > +               pte = pfn_pte(pfn, PAGE_KERNEL_IO);
> >
> >                 if (!writable)
> >                         pte = pte_wrprotect(pte);
> > --
> > 2.34.1
> >
>
> LGTM.
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

Queued this patch for 5.20.

Thanks,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
