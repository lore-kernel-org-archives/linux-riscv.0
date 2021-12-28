Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64036C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 06:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PdW93Yjlzq2hkKz3LfOLk1r1Q+77LpSsg5pJ5IRxopY=; b=z+7aAgUw5pORvj
	fRKFCNocolUSo5dn0d8uJ174PO/dcMc51Z0/1GkvkD/W/l7y3d/AWlWxo96WHwwKhAYdM8eXJQXGk
	lzEP/52ZcFA0m8MAQ5mAzmKqw8hvqA7A8HHk5mvcRBMekwz2L+xb4OHZnOWJl0C424WvhfOpRd1U6
	jPtGqFA282ZCSebo/Rly9aAEQQOxr9cHGLqZWCdh6EwoOEzbrXGfnlg8yBBKVV8EqrI/u0g4cU/YN
	wNcSKO3AiWsr/sxEYHYULAUzUW1Bv4CRJmYnGvzQGOSOFSgUGlH1xQaLO5dOBRto58DoUgQtvXDEi
	1x9GXzA8upJJKK+x4EKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n25qt-000FbR-BF; Tue, 28 Dec 2021 06:20:51 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n25qr-000FaT-4J
 for linux-riscv@lists.infradead.org; Tue, 28 Dec 2021 06:20:50 +0000
Received: by mail-wr1-x42e.google.com with SMTP id i22so36269497wrb.13
 for <linux-riscv@lists.infradead.org>; Mon, 27 Dec 2021 22:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yxMuslxDg2S3RmGiAouREuoen21s3vRjxpPLCKGYDOs=;
 b=U5bV+uGyfh50ndVDYNS4v8SIYAIV7TP4jb4JRs/qKkRb363U8GOEwqMIaXYWHnWQHY
 hzgYFZYX1N5JjkSd/rNXhDJIZhcBE13FCjLdQjkLfjljxYubVQ0PcOKltArbh4Qn8kjy
 DV1nNXhwAsVtLducS7lQBaXgVBJiAYLhM9oWbhofkvbQBGM076NOf5sRcvVlaQ5xidkk
 zn1JXUg13XN4J2WyZlFBXJ1U7LuaD8n56DfQz3Wlj0LYreGacNOrBoZ5VGLIQorNTZsm
 ps3iYeyLMvSPCSZQPVP3b2e4aGZwvAB/Jh5/optZ+eMaFXydOlP9qV3RWN5QT7aK5I8f
 cXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yxMuslxDg2S3RmGiAouREuoen21s3vRjxpPLCKGYDOs=;
 b=6DC64fwF5bX7gX5/Ev4p8Za0X+3aJdQ3XdESthxMERmCqEcWsGqe03rQWPLfnKFFHw
 VFbv90FdTA7/O1hU4lhEaltAlCJzmFd4XaTujHDtT3RJGPFssvu8tbXXMmiHk+XC4Yut
 mla02e5pKHctA0r8u0qrDNjzG57gg0xUxmZEPP38FnBKNAr1Ql8mheIRVdKvDEFCWXZv
 PCgvv3gBrBoKfniA7m2syYiAuuHWB8/w2etF3LG2Zc7Kehn878d83Q5YlQh8DJqo/kRL
 ieZuvsiSOdk78XdFGqWmskqTA5/HTXAGpNczDDSn+WZgYJZHCaAvo7dOxWevP1BqL3PP
 Aq/w==
X-Gm-Message-State: AOAM532a3bSWAxBOi1i45cbcyIQ9KSgzyjVa/GxQx/WUnYoOuQEzvqWJ
 dBQm02IGZe5v5KWUZdrE1qmcKjt9d2IrNSegqhgz8w==
X-Google-Smtp-Source: ABdhPJxPxIuKiLfECI1gIGeabM+airz3qfDP8dU5RAgK/IaKfx4bJkcGaOV3uUbgjVxC8g8TAdk41Ao3iLE07aQeNos=
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr14860743wrd.346.1640672447584; 
 Mon, 27 Dec 2021 22:20:47 -0800 (PST)
MIME-Version: 1.0
References: <20211224073604.1085464-1-anup.patel@wdc.com>
 <20211224073604.1085464-3-anup.patel@wdc.com>
In-Reply-To: <20211224073604.1085464-3-anup.patel@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 28 Dec 2021 11:50:35 +0530
Message-ID: <CAAhSdy1NE1LhwpU=TE8LnES6c7AQiq04zNJkSv2nLk=BOnYLsQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] RISC-V: KVM: Add VM capability to allow userspace
 get GPA bits
To: Anup Patel <anup.patel@wdc.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alistair Francis <Alistair.Francis@wdc.com>, KVM General <kvm@vger.kernel.org>,
 kvm-riscv@lists.infradead.org, linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-kselftest@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_222049_203126_252CCDE3 
X-CRM114-Status: GOOD (  20.50  )
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

On Fri, Dec 24, 2021 at 1:06 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> The number of GPA bits supported for a RISC-V Guest/VM is based on the
> MMU mode used by the G-stage translation. The KVM RISC-V will detect and
> use the best possible MMU mode for the G-stage in kvm_arch_init().
>
> We add a generic VM capability KVM_CAP_VM_GPA_BITS which can be used by
> the KVM userspace to get the number of GPA (guest physical address) bits
> supported for a Guest/VM.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-and-tested-by: Atish Patra <atishp@rivosinc.com>

Queued this patch for 5.17

Thanks,
Anup

> ---
>  arch/riscv/include/asm/kvm_host.h | 1 +
>  arch/riscv/kvm/mmu.c              | 5 +++++
>  arch/riscv/kvm/vm.c               | 3 +++
>  include/uapi/linux/kvm.h          | 1 +
>  4 files changed, 10 insertions(+)
>
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index 247b761c72fd..ac38696abedf 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -219,6 +219,7 @@ void kvm_riscv_stage2_free_pgd(struct kvm *kvm);
>  void kvm_riscv_stage2_update_hgatp(struct kvm_vcpu *vcpu);
>  void kvm_riscv_stage2_mode_detect(void);
>  unsigned long kvm_riscv_stage2_mode(void);
> +int kvm_riscv_stage2_gpa_bits(void);
>
>  void kvm_riscv_stage2_vmid_detect(void);
>  unsigned long kvm_riscv_stage2_vmid_bits(void);
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index d0efdc2259dc..58a47c93e5f9 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -766,3 +766,8 @@ unsigned long kvm_riscv_stage2_mode(void)
>  {
>         return stage2_mode >> HGATP_MODE_SHIFT;
>  }
> +
> +int kvm_riscv_stage2_gpa_bits(void)
> +{
> +       return stage2_gpa_bits;
> +}
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> index fb18af34a4b5..1e12c19a7c6a 100644
> --- a/arch/riscv/kvm/vm.c
> +++ b/arch/riscv/kvm/vm.c
> @@ -82,6 +82,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>         case KVM_CAP_NR_MEMSLOTS:
>                 r = KVM_USER_MEM_SLOTS;
>                 break;
> +       case KVM_CAP_VM_GPA_BITS:
> +               r = kvm_riscv_stage2_gpa_bits();
> +               break;
>         default:
>                 r = 0;
>                 break;
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 1daa45268de2..469f05d69c8d 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1131,6 +1131,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_EXIT_ON_EMULATION_FAILURE 204
>  #define KVM_CAP_ARM_MTE 205
>  #define KVM_CAP_VM_MOVE_ENC_CONTEXT_FROM 206
> +#define KVM_CAP_VM_GPA_BITS 207
>
>  #ifdef KVM_CAP_IRQ_ROUTING
>
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
