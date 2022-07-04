Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400A5C43334
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jul 2022 08:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KAAbVIYiVk9tBN22C1vlG6/g9TOj1r50fx5WjoTPVfU=; b=Kn7O1vmS7RldnH
	z5q0vxNe6hl8zbIiOgPkkQOcjhEJcHaUrdvYwhVu91najAFJTM3z/oi9ldjCTxOqUDsXpadwHpiiA
	rViTkm1n8rWHpQeFQIlYHAigs4JSqPBQee8FiP8bi4L19OaEXGA3kmx8GYU37sdiOJGvxXXBxHZ0X
	Mja7aaiuN0dbFQpBrTQqmlmeY2I9ptzoXbkpAmoC0XvniGjHB1GiTnnMe1oDFP8TxTDcoadkmB0ly
	tGx4bDtRb7EQFmmuglXdhgMEGjE1Oz5pLYoYsedduBT1SbrsPhmjb9ni+TZg+4GTMaM5/DFABZAIU
	LMEAryhiL729pswnowtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Hs2-006CNX-2F; Mon, 04 Jul 2022 08:55:54 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Hro-006CGj-PB
	for linux-riscv@lists.infradead.org; Mon, 04 Jul 2022 08:55:42 +0000
Received: by mail-wm1-x329.google.com with SMTP id l68so4966243wml.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 Jul 2022 01:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+WUk2xbSNyQngKIivfsXkipatMQggMur8+BOotuvHrc=;
        b=I7qyhjG6jBNxmRdhxRv7bSrBYl/an7f47BUlAO4CoMaUp35DhiQc1WklO1A3X9KgFr
         KgixjZCXScgpgzaAZTKNKUF1cafhKonSncRrH3Tlh86o8wAUhb0Ato6yf83K3VAmXjx+
         yDuP7wLig/HBvvmwVl7lwSnaZZ6Wrcrwjz7DkS+076rrBPoIQCnPMdIQuwOboOlBhNH0
         1Oj/xADDiskvpdMddxyqwDvL6LukZXR+ni+WBWM2EplzeT9W/UPrnBESCmTQzth0w36l
         k/xRbN5Zbjmbb5Wk8PRLllsFeB2cTX65LYp8NuNXbg+yZZhPTjwipD6neU34NEAx8/xO
         mKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+WUk2xbSNyQngKIivfsXkipatMQggMur8+BOotuvHrc=;
        b=HlGjFkp9UCuUkfrYaUyDk24G4NEdhiiPIDWMii49D4+9UaqzJvUqf6IyUPCrrCIU2h
         LlATIdeM+AvToz421M3ogk/qSBLpVz1Fg1AjxvYFhh7pZXfgfVLC2Cd+bTv8SUwkaPkX
         E0BYvzVWwJ5rShmy1M6fkFcUYGjvEalxmVs9o0V/34LEfjHI+Hq1GtB7e4YnAkhDndK6
         ELpRuKx73fVhzMWuMbC6lu56NR7a3ACi47NR4SWWJxL5eNmqckJ1VpBZQfShrFyIduig
         pbHuVMw1mYxi1/IySo7cFK8vQ6pvrRMFQF3kt+DpDmFH1K6tx9FGlkT3Bo8FBekQR1Dw
         ksdA==
X-Gm-Message-State: AJIora+8e47Xz5/iRjZQzvBgYxMp9OcUBV8F1EmuQ6sFtKBNh1qM0LDN
	5Dh7aZJ/fDssQ2WlPtxX//9acn+ZtjWmdPMQe5GRYQ==
X-Google-Smtp-Source: AGRyM1tAlyg1H8gH5YntBMpGkdfmwiBuamQeAqvrlLD4YmVGtiukeSDtVS5Eyf0W7mkd8HIXVdbklSWVanqziQ2dtJc=
X-Received: by 2002:a05:600c:a192:b0:3a0:433a:9ca with SMTP id
 id18-20020a05600ca19200b003a0433a09camr31615081wmb.108.1656924939080; Mon, 04
 Jul 2022 01:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220701062838.6727-1-jiaming@nfschina.com>
In-Reply-To: <20220701062838.6727-1-jiaming@nfschina.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 4 Jul 2022 14:25:26 +0530
Message-ID: <CAAhSdy1_TVdvGEWQ=kTzp5_S_ACCuHxjYk3goe39V8YiwqUY_w@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix variable spelling mistake
To: Zhang Jiaming <jiaming@nfschina.com>
Cc: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, liqiong@nfschina.com, renyu@nfschina.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_015540_857778_31EDEDA0 
X-CRM114-Status: GOOD (  18.06  )
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

On Fri, Jul 1, 2022 at 11:58 AM Zhang Jiaming <jiaming@nfschina.com> wrote:
>
> There is a spelling mistake in mmu.c and vcpu_exit.c. Fix it.
>
> Signed-off-by: Zhang Jiaming <jiaming@nfschina.com>

Looks good to me.

I have queued this for 5.20

Thanks,
Anup

> ---
>  arch/riscv/kvm/mmu.c       | 8 ++++----
>  arch/riscv/kvm/vcpu_exit.c | 6 +++---
>  2 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 1c00695ebee7..2965284a490d 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -611,7 +611,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  {
>         int ret;
>         kvm_pfn_t hfn;
> -       bool writeable;
> +       bool writable;
>         short vma_pageshift;
>         gfn_t gfn = gpa >> PAGE_SHIFT;
>         struct vm_area_struct *vma;
> @@ -659,7 +659,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>
>         mmu_seq = kvm->mmu_notifier_seq;
>
> -       hfn = gfn_to_pfn_prot(kvm, gfn, is_write, &writeable);
> +       hfn = gfn_to_pfn_prot(kvm, gfn, is_write, &writable);
>         if (hfn == KVM_PFN_ERR_HWPOISON) {
>                 send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,
>                                 vma_pageshift, current);
> @@ -673,14 +673,14 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>          * for write faults.
>          */
>         if (logging && !is_write)
> -               writeable = false;
> +               writable = false;
>
>         spin_lock(&kvm->mmu_lock);
>
>         if (mmu_notifier_retry(kvm, mmu_seq))
>                 goto out_unlock;
>
> -       if (writeable) {
> +       if (writable) {
>                 kvm_set_pfn_dirty(hfn);
>                 mark_page_dirty(kvm, gfn);
>                 ret = gstage_map_page(kvm, pcache, gpa, hfn << PAGE_SHIFT,
> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> index dbb09afd7546..f4e569688619 100644
> --- a/arch/riscv/kvm/vcpu_exit.c
> +++ b/arch/riscv/kvm/vcpu_exit.c
> @@ -417,17 +417,17 @@ static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  {
>         struct kvm_memory_slot *memslot;
>         unsigned long hva, fault_addr;
> -       bool writeable;
> +       bool writable;
>         gfn_t gfn;
>         int ret;
>
>         fault_addr = (trap->htval << 2) | (trap->stval & 0x3);
>         gfn = fault_addr >> PAGE_SHIFT;
>         memslot = gfn_to_memslot(vcpu->kvm, gfn);
> -       hva = gfn_to_hva_memslot_prot(memslot, gfn, &writeable);
> +       hva = gfn_to_hva_memslot_prot(memslot, gfn, &writable);
>
>         if (kvm_is_error_hva(hva) ||
> -           (trap->scause == EXC_STORE_GUEST_PAGE_FAULT && !writeable)) {
> +           (trap->scause == EXC_STORE_GUEST_PAGE_FAULT && !writable)) {
>                 switch (trap->scause) {
>                 case EXC_LOAD_GUEST_PAGE_FAULT:
>                         return emulate_load(vcpu, run, fault_addr,
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
