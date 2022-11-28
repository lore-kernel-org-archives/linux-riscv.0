Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE942C4321E
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 21:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u4EZVMj9FdsB7kCYdQr4mO+HaKhZcnXLttigcgyvaZ0=; b=THhJmwQZupsmpE
	7+dacmF2FYbkHMuydLrBkHonwYwHyD8r64UrFrDqFkiv7tRW/iQffw148Mkhoo+bdQfeGfHlo/RLJ
	BiZXZCF1evafkeVbeF7iK7/+/CNfWe9ZKXaHQkRR5v9QWwBGB3DUxdYQIPfmKh5LbD2vPZwg0FhHb
	KcVRGbdiYy7jl2KNGOYZwNo0E3L/2oNESUc7LPJiooi/ecaf63wYCpeqyAfz4/CpR1av+sAc35DlZ
	0T0xoDX4BlGBxGWzCSEpeCmRzDvsWZyx6utiKOyUMOlsqGvFugc0lR81fNqtid535PqpZzrHarfIm
	WLBWxzAdCkNFqANh254g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozlKX-004ReN-Ea; Mon, 28 Nov 2022 21:06:21 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozlKT-004Rc3-Jd
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 21:06:19 +0000
Received: by mail-ot1-x32f.google.com with SMTP id a7-20020a056830008700b0066c82848060so7823001oto.4
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 13:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p9UkJ7VBK4eJN8AOTn00Jhc8bbgrKXPIVkvokyH+neY=;
        b=EmNdPKsuUWm0ICW46GQTce/XFTAmWmWRaSzqVOqzVe4444xImnX8wNT0TjXvCrssBA
         si6x24ctUI4ZKzFWD+ms6IpNmjTVAjJjEelqL3zY4Aiq/MP/FhqYegvTazy5jqCqOrKD
         4/zF+psi/VY579MvmhrQW/sQ0O/3h4GyI3glA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p9UkJ7VBK4eJN8AOTn00Jhc8bbgrKXPIVkvokyH+neY=;
        b=LIovxo+j93llMJ7KUA+mQFSVl22fzkjC0GRVG/J6OXZNm/FJKsjSDvWfTyQIcWDLTa
         JbeFBq3v1+y5pAholJITphaRUj9GRBxBe/YngkH1SMUMQj+T4NIN/a25szCarlDx8mWf
         KcZmv8Y5kiC1mJhQZNJz08olNeEdmgUpx17AJ2j+pxktwlsRoKpJLFBxaEY+7KBl7rTc
         YQFmERY+Jnfz807+ZMrzUE6+plN9eMvg5L89SzZEiAGBYJWevvuUuDttdBEtLCQtF8bN
         OP4t5EeVuoT0mXLsDjwLgtetucngPG8oP6ypzDd5UNQPq1Ii5Q/o50jsttqyW9LWJ+DL
         TKeA==
X-Gm-Message-State: ANoB5pl/iWkyRH2MfthuXph+/H6AtLjZJjWqs/GOD06TFZE03jn9eUKs
	xGRAeIFYBqgGbFd2d7JpdBeSia1Xf6L4N85Hk+Vx
X-Google-Smtp-Source: AA0mqf7RBLreP49klQg2LDKQ4TT5Rwzv5tU1ZyPle4LEpP4LySP+j+8Yoj1VhUzfRZBgKV7y5mijlxol7Qbga2t4Qyk=
X-Received: by 2002:a05:6830:22f2:b0:669:3797:c1b4 with SMTP id
 t18-20020a05683022f200b006693797c1b4mr25619436otc.293.1669669575965; Mon, 28
 Nov 2022 13:06:15 -0800 (PST)
MIME-Version: 1.0
References: <20221128161424.608889-1-apatel@ventanamicro.com> <20221128161424.608889-6-apatel@ventanamicro.com>
In-Reply-To: <20221128161424.608889-6-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 28 Nov 2022 13:06:05 -0800
Message-ID: <CAOnJCU+VbNhRQEbCYwzB75d=VzuhO6=++KC6w5S+Fg0p52QaNg@mail.gmail.com>
Subject: Re: [PATCH 5/9] RISC-V: KVM: Move sbi related struct and functions to kvm_vcpu_sbi.h
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_130617_682962_55DBC6D6 
X-CRM114-Status: GOOD (  15.63  )
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

On Mon, Nov 28, 2022 at 8:14 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Just like asm/kvm_vcpu_timer.h, we should have all sbi related struct
> and functions in asm/kvm_vcpu_sbi.h.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_host.h     | 10 ++--------
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  6 ++++++
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index 6502f9099965..91c74b09a970 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -16,6 +16,7 @@
>  #include <asm/hwcap.h>
>  #include <asm/kvm_vcpu_fp.h>
>  #include <asm/kvm_vcpu_insn.h>
> +#include <asm/kvm_vcpu_sbi.h>
>  #include <asm/kvm_vcpu_timer.h>
>
>  #define KVM_MAX_VCPUS                  1024
> @@ -94,10 +95,6 @@ struct kvm_arch {
>         struct kvm_guest_timer timer;
>  };
>
> -struct kvm_sbi_context {
> -       int return_handled;
> -};
> -
>  struct kvm_cpu_trap {
>         unsigned long sepc;
>         unsigned long scause;
> @@ -216,7 +213,7 @@ struct kvm_vcpu_arch {
>         struct kvm_csr_decode csr_decode;
>
>         /* SBI context */
> -       struct kvm_sbi_context sbi_context;
> +       struct kvm_vcpu_sbi_context sbi_context;
>
>         /* Cache pages needed to program page tables with spinlock held */
>         struct kvm_mmu_memory_cache mmu_page_cache;
> @@ -326,7 +323,4 @@ bool kvm_riscv_vcpu_has_interrupts(struct kvm_vcpu *vcpu, unsigned long mask);
>  void kvm_riscv_vcpu_power_off(struct kvm_vcpu *vcpu);
>  void kvm_riscv_vcpu_power_on(struct kvm_vcpu *vcpu);
>
> -int kvm_riscv_vcpu_sbi_return(struct kvm_vcpu *vcpu, struct kvm_run *run);
> -int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
> -
>  #endif /* __RISCV_KVM_HOST_H__ */
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> index d4e3e600beef..f79478a85d2d 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -14,6 +14,10 @@
>  #define KVM_SBI_VERSION_MAJOR 1
>  #define KVM_SBI_VERSION_MINOR 0
>
> +struct kvm_vcpu_sbi_context {
> +       int return_handled;
> +};
> +
>  struct kvm_vcpu_sbi_extension {
>         unsigned long extid_start;
>         unsigned long extid_end;
> @@ -31,7 +35,9 @@ void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
>  void kvm_riscv_vcpu_sbi_system_reset(struct kvm_vcpu *vcpu,
>                                      struct kvm_run *run,
>                                      u32 type, u64 flags);
> +int kvm_riscv_vcpu_sbi_return(struct kvm_vcpu *vcpu, struct kvm_run *run);
>  const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(unsigned long extid);
> +int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
>
>  #ifdef CONFIG_RISCV_SBI_V01
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01;
> --
> 2.34.1
>


Reviewed-by: Atish Patra <atishp@rivosinc.com>
-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
