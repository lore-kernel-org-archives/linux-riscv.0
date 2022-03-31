Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 991E0C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 06:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2JlNIW+2qi6GmCUMgKxqNIjH/djnBEhbc2OL3/B0RMQ=; b=oK8gK/PZ6WOt1K
	EIXBCObltYMJCwZdItxhaF3qoYMe8aR7lpo8QG+YcIloZSrmof4hmyLskHo28YTRiqfVanwSXgVj4
	d5bwqBji58/AjAoy7KUwb6W3+blUcbxof9/7tyYpYeoCMAbAWHEQ8sK17eBAOgk76LtvxCSS6SRFl
	C7224xU35ItTCYnStZRdalXXWdu2iR3NFXEUXTGUd2OAsukAFMv0PSEW/qi9JKM8iCpBbkiu0JKzf
	r0+az0T2isM/iiyZ96DMu1MTMZ0L2Yx7yPtAr+9gHSL8H2VbGjeYN7AFdVIPYyh5ET3mlkbx6oJNE
	VfX+2y23PjHd71XYkrxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZoSG-000uZk-VE; Thu, 31 Mar 2022 06:38:49 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZoSE-000uYp-JO
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 06:38:48 +0000
Received: by mail-wr1-x434.google.com with SMTP id w4so32189559wrg.12
 for <linux-riscv@lists.infradead.org>; Wed, 30 Mar 2022 23:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fhsMrvk7uoSjbTi4vii+Njn16yDljzTavXJfNLTXs1o=;
 b=0ppl6HuIIj0tw0lDLORVxtX2zZnf26iCrPXAxb68pdWIbUs81VAAJysnKZeS5eg3jq
 zM1sheRcfHZDrOChqEYoG6zmardBGPyQ+ECl5K1kS/QrdwgmBWFpb2GKCKs0ufibNU0E
 i3+dSZKBudhlzaDRDgLf/KNNGutgJwNfZiZEPqGYYdScZLscVZPLDE6NUCeMjIMGBqKf
 kwVVHHLC2bP6DNKqZGocacSSO7K7zckXgSnu3RHWD2tBr617FArpzhyWgcRc20Hql/gA
 BOw1YP0ny3y7IomoeYwEyCbb9PIoKJcENTEWj4/+fUmud9dbUMP3QazF4xQxruWQWP5u
 f1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fhsMrvk7uoSjbTi4vii+Njn16yDljzTavXJfNLTXs1o=;
 b=MlRpVPL14/FfbYWJTnU94Ff9Ns2VBBSdmlpl4vRKrswd9xUDnPPFLMTS1gilN9OfHG
 TzzRNDfDDzDOgZTpaTmw+nUNH9traMw1h2UncDZPQJcRCfHBhsxDJuHJe3g/qecvomjG
 Ae6CIdrLUZ5I2rf52JFhyZ2R5U+lavHP+QijplKEK8EJyjgqt5LRvxq/IzpfB92+QWpb
 XFQ1+e94kW2F2f8901+0LCnuAKQCakvyl8AM/zMgn20LwzIQKb+0R8k1jA4zQg5ltMaY
 8ahVrAHgLXmoDYgHZZlDnoy/qMz5uJpeSDVRtQ3vLA8CNx+x1+wi4A+PpSIZPOSfre7K
 L+Dg==
X-Gm-Message-State: AOAM530oR2wjex7YZpIbjfBZM3TMw9TkNsF2quVGQlIPdfJcb3tZgMQG
 RFV4lqKJudfnz8BNje4ofqiSCah1cSnebcLiEmINug==
X-Google-Smtp-Source: ABdhPJwlPo2k2le77MErbra2MKKkIRFso47zu94yk0HG7fNt9Z/GkOHIkGqo3ifUCE8gI1xks+gWOFda3GWyy5NDxpc=
X-Received: by 2002:a5d:6e54:0:b0:204:635:42ba with SMTP id
 j20-20020a5d6e54000000b00204063542bamr2831853wrz.214.1648708724508; Wed, 30
 Mar 2022 23:38:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220331055906.3552337-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220331055906.3552337-1-alistair.francis@opensource.wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 31 Mar 2022 12:08:31 +0530
Message-ID: <CAAhSdy2S26jCmUJES3_63jZbn=0uO78=3kob-AAf0a==4d_seA@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: Ensure only ASIDLEN is used for sfence.vma
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Atish Patra <atishp@rivosinc.com>, Guo Ren <guoren@kernel.org>, 
 Alistair Francis <alistair23@gmail.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_233846_705338_960691F4 
X-CRM114-Status: GOOD (  26.75  )
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

On Thu, Mar 31, 2022 at 11:29 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> When we set the value of context.id using __new_context() we set both
> the asid and the current_version with this return statement in
> __new_context():
>
>     return asid | ver;
>
> This means that when local_flush_tlb_all_asid() is called with the asid
> specified from context.id we can write the incorrect value.
>
> We get away with this as hardware ignores the extra bits, as the RISC-V
> specification states:
>
> "bits SXLEN-1:ASIDMAX of the value held in rs2 are reserved for future
> standard use. Until their use is defined by a standard extension, they
> should be zeroed by software and ignored by current implementations."
>
> but it is still a bug and worth addressing as we are incorrectly setting
> extra bits.
>
> This patch uses asid_mask when calling sfence.vma to ensure the asid is
> always the correct len (ASIDLEN). This is similar to what we do in
> arch/riscv/mm/context.c.
>
> Fixes: 3f1e782998cd ("riscv: add ASID-based tlbflushing methods")
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
> v3:
>  - Use helper function
> v2:
>  - Pass in pre-masked value
>
>  arch/riscv/include/asm/mmu_context.h | 2 ++
>  arch/riscv/mm/context.c              | 5 +++++
>  arch/riscv/mm/tlbflush.c             | 2 +-
>  3 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
> index 7030837adc1a..94e82c9e17eb 100644
> --- a/arch/riscv/include/asm/mmu_context.h
> +++ b/arch/riscv/include/asm/mmu_context.h
> @@ -16,6 +16,8 @@
>  void switch_mm(struct mm_struct *prev, struct mm_struct *next,
>         struct task_struct *task);
>
> +unsigned long get_mm_asid(struct mm_struct *mm);
> +
>  #define activate_mm activate_mm
>  static inline void activate_mm(struct mm_struct *prev,
>                                struct mm_struct *next)
> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> index 7acbfbd14557..14aec5bacbc1 100644
> --- a/arch/riscv/mm/context.c
> +++ b/arch/riscv/mm/context.c
> @@ -302,6 +302,11 @@ static inline void flush_icache_deferred(struct mm_struct *mm, unsigned int cpu)
>  #endif
>  }
>
> +unsigned long get_mm_asid(struct mm_struct *mm)
> +{
> +       return atomic_long_read(&mm->context.id) & asid_mask;
> +}
> +
>  void switch_mm(struct mm_struct *prev, struct mm_struct *next,
>         struct task_struct *task)
>  {
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index 37ed760d007c..9c89c4951bee 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -42,7 +42,7 @@ static void __sbi_tlb_flush_range(struct mm_struct *mm, unsigned long start,
>         /* check if the tlbflush needs to be sent to other CPUs */
>         broadcast = cpumask_any_but(cmask, cpuid) < nr_cpu_ids;
>         if (static_branch_unlikely(&use_asid_allocator)) {
> -               unsigned long asid = atomic_long_read(&mm->context.id);
> +               unsigned long asid = get_mm_asid(mm);
>
>                 if (broadcast) {
>                         sbi_remote_sfence_vma_asid(cmask, start, size, asid);
> --
> 2.35.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
