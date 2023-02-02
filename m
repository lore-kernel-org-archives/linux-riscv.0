Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC573C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 08:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1QHmZwLiiLcrrMkstkytLlDlMB6ankVhv7cYDzGRz3A=; b=n7mQKZO8bHJyS6
	0UjgRUnlrVYUQcrCBsuWPoOBPM+4Lc0OJMGmQHtGG480yUBgahrG0C8Ll6ctwbZk8YS4YmodFMOfv
	huKYd1kTc8RL8E8DpWMsUU/Oc9Iok+6wHBo/vZTJmJRYCZCHKsADmnUHIv84JnAuIOW4QbqIOyy4B
	/8Q5mRMEpDauhL+eMQEOyvmXADPPNXlu0KhCqNr6tHa4qQaX8m/zS70pECvWOZXEEgs0FjGDkAU+f
	/trN7GTzGaoBCnjKULg23JdXKs/AwQi6LvxXW7hfAUYB+jliNn0Vvy1kdOjEp+296vmpR8GGzIshq
	8lisU8xVnEuYWNtg/MGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNVIA-00F1wS-JN; Thu, 02 Feb 2023 08:50:02 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNVI7-00F1sp-MP
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 08:50:00 +0000
Received: by mail-ej1-x62f.google.com with SMTP id ml19so4074186ejb.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Feb 2023 00:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YEMr8jwJtqEBvUW6IeEvoy6PFpQWvVltt0F9wihv4bc=;
        b=E4VeslbplWo822JEUy/TVhNC3AjWEJtICAApZgk4VjnANKU98n3UtBxM9Lx27SUzZb
         VCTl8nQfoW4L71CcnsAiYB4LB5F6+lGOeBiXou97b7WRakNcb1iB8m2OjwMHHMBm1TgB
         iueYKPTQQh/tNy7xaOgo7bssfHdq68ITQRKsRX4KWF8TTXyK1Nw9+yTzkuIG5W22lNUB
         NOWPKIysHGKjVu5FxtI3n5oqyd1doi3+rwy52r5uRu86hTtJ+McGGjd4FbURprZYu8SB
         fYyakX2igykkWwkEMcYDqWnm+tZ1bvInFqQLOhkrbUHZBktlmPmp9Zr9frSkCFv5TIft
         1m0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YEMr8jwJtqEBvUW6IeEvoy6PFpQWvVltt0F9wihv4bc=;
        b=mrmMy7BbLGypRWLFafOqYu507EuSgpzQraU4pkJfcMQum7aF5XTaHzM/j4cS53qH/R
         HRSiSFKgAFl0VKM7Wf8sBmLuCi8tIoEKBs8g7gbTphqVcgL4Eo6I4v4X1NW+SUL6POPn
         E4zJEH1n9zBgrtHpA8gq2bGpraqVCmq3FasfudcihSdrb4HIbxZdJrjDiB1/8uYfqqXD
         VOkeMQQ8m4Yhzf2cXaPv7J6Au9ysdI6A+VFVmcgU64vgRKiBGx2ERBx237OICbm7qCvV
         Lr56l3QI6IPYbFzLzPHEP0wyc1I8QOs5l3b2jfAtgEvekhHaKnAHI2f6qedv1R1N2iN8
         fPvA==
X-Gm-Message-State: AO0yUKVCVN9xWwsIAQkxYrX+u1dINSn8rdpCUdy8DH+d4CoV1IfIcju0
	uojU0ZHFUCvaTxCQg1k2TSa+9U3GgLLjMRF7djaCHQ==
X-Google-Smtp-Source: AK7set+38N6ru0VcJjhFUKCNehas73Jp8D6FAynbNoh9W4N5K+8dinXtsQKRFrjqrQ5QEKfdEvUkNXxWQWnqjKO2VgI=
X-Received: by 2002:a17:906:7e42:b0:86d:fa64:2941 with SMTP id
 z2-20020a1709067e4200b0086dfa642941mr1889020ejr.72.1675327795914; Thu, 02 Feb
 2023 00:49:55 -0800 (PST)
MIME-Version: 1.0
References: <20230128082847.3055316-1-apatel@ventanamicro.com> <20230128082847.3055316-2-apatel@ventanamicro.com>
In-Reply-To: <20230128082847.3055316-2-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 2 Feb 2023 14:19:44 +0530
Message-ID: <CAAhSdy0GAwpUCTAXn_Gg==MMigFpkRSNHZMFvDQtZQ08zW_a9A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] RISC-V: KVM: Redirect illegal instruction traps to guest
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andy Chiu <andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_004959_737236_9F138844 
X-CRM114-Status: GOOD (  16.90  )
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

On Sat, Jan 28, 2023 at 1:59 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> From: Andy Chiu <andy.chiu@sifive.com>
>
> The M-mode redirects an unhandled illegal instruction trap back
> to S-mode. However, KVM running in HS-mode terminates the VS-mode
> software when it receives illegal instruction trap. Instead, KVM
> should redirect the illegal instruction trap back to VS-mode, and
> let VS-mode trap handler decide the next step. This futher allows
> guest kernel to implement on-demand enabling of vector extension
> for a guest user space process upon first-use.
>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Queued this patch for Linux-6.3

Thanks,
Anup

> ---
>  arch/riscv/kvm/vcpu_exit.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> index af7c4bc07929..4ea101a73d8b 100644
> --- a/arch/riscv/kvm/vcpu_exit.c
> +++ b/arch/riscv/kvm/vcpu_exit.c
> @@ -182,6 +182,12 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
>         ret = -EFAULT;
>         run->exit_reason = KVM_EXIT_UNKNOWN;
>         switch (trap->scause) {
> +       case EXC_INST_ILLEGAL:
> +               if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV) {
> +                       kvm_riscv_vcpu_trap_redirect(vcpu, trap);
> +                       ret = 1;
> +               }
> +               break;
>         case EXC_VIRTUAL_INST_FAULT:
>                 if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
>                         ret = kvm_riscv_vcpu_virtual_insn(vcpu, run, trap);
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
