Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DF4C43219
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Nov 2022 03:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=94bR2fqccN3+w1ub8Q4Cvxc33BuP5ksPbGgismSrS/E=; b=ivL2sa0/i8pk5g
	0podV24/hHLx0Hbnlw7D0eE6d8akbS4yuheXVmLx2iXWst98a7j0YY3KoWijYuoquZNQAW+Nb7GAy
	94EgI1/HXYD7yXTyca9F784vd08y5oHBcayl4jdlRHh/9w/VqmcXmqx7XLo0r3vSqFqRbBQwNW8eI
	xVWFG/azKLrwrs0dvQX2z2aooRkI6kkE8vpI4hW9coTGtPUxqn4iRmFxGNVezLCRxHm0sT1pBY8vn
	5dpnoUyt0+4pmN3K+SJNFC1kc5l3PKEBosiMTO/XD5wRz1ORfhDHjyl0BPTOIM9eDolm3IN2Y7ve5
	RzdG3bPiJw3ATQAOk6cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orsWt-00BEkh-Jg; Mon, 07 Nov 2022 03:10:31 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orsWr-00BEix-Aa
	for linux-riscv@lists.infradead.org; Mon, 07 Nov 2022 03:10:30 +0000
Received: by mail-ej1-x635.google.com with SMTP id y14so26705634ejd.9
        for <linux-riscv@lists.infradead.org>; Sun, 06 Nov 2022 19:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H1pcoCub6KdV/gUz+piTr4fdj2mnlqaFRmHq36k4mN4=;
        b=gQpUBAHaNtCtn8GOZM6K3nOKU9i/513DHG6kPmdKabejoExXLL0yKmZoHWD5IqrYnl
         BaH7/MlZuQ3cd3geild3XN0vIjfsuogd3DRyazx76rKFD1GxN2z2p5a1MMzxdPc3wvTw
         RxZD99Kfh6hz1mjWaldEvMgnh1z6ZDZqqXsSWsYVIgeKGUPakiXDa4BTKTMvzBMhceI0
         p+2o9fYelNd1OGlcY0c89OLh4mpaR3Ph8Z8pNTcesJ5e6yXb/WhpmYapUPDUZmdETGBa
         YNDaSceGSYjG/bGEYOqsAJz81Hj8vvE+0OhEFfMoxQFcd4iiMCUDxLdOXI4/qhCe4BWK
         wETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1pcoCub6KdV/gUz+piTr4fdj2mnlqaFRmHq36k4mN4=;
        b=3jGmLDKUi3bqNN0sm0YVeAlnFaawRLnLlKXtINiMR92HMUJiGWA7QI3hQiFLCtFW+9
         /jEY4qlBB+2rWKeQeUN97/ypfU96FjF3fK3Uy1NLOuRRhJNoxM9YDo34kyoYIf/7Ieql
         b5mIWlD8Smbz/8g1mmHrKCx1IfKi+WYnu4e3dRhPXeCXh/tAW4yJ2nAp48nBomFxXOlA
         FmRhThpUBUZovnAq9FZb81pcntTaQhMs1Gu8BuvJa0NKApb3eqG9xKjAaSzKsfzt8RZz
         IVJphlXWo3YEniiwmWPMjfKrVoxrjicOXwjywXJCbeRvTa/UtuZbUafY5k7wPhB22Ouu
         LJ9A==
X-Gm-Message-State: ACrzQf2NdZKVnUVVF1j4Xf3t89UeNCFn0nAvNvn9/ql0NLTTAd0PhIEL
	QswkaBsmqSTn3uFWiyuMXMxdnb5Wi24b+j2txfvABQ==
X-Google-Smtp-Source: AMsMyM7XCgJtPlnLGfYx3eSoncGi1AE82N9qaj+trfvM6WmHPWkeWUQhOX2da2jCOnZnugZUPvknpt/SuEsv4imbUmY=
X-Received: by 2002:a17:906:eec7:b0:733:189f:b07a with SMTP id
 wu7-20020a170906eec700b00733189fb07amr46196816ejb.230.1667790626379; Sun, 06
 Nov 2022 19:10:26 -0800 (PST)
MIME-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com> <20221102231911.3107438-24-seanjc@google.com>
In-Reply-To: <20221102231911.3107438-24-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 7 Nov 2022 08:40:14 +0530
Message-ID: <CAAhSdy1XSv+yNHyhPf44H3f7oaz+7Ku6COkKAQt7Zy7ahdC7jA@mail.gmail.com>
Subject: Re: [PATCH 23/44] KVM: RISC-V: Tag init functions and data with
 __init, __ro_after_init
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
	Eric Farman <farman@linux.ibm.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Fabiano Rosas <farosas@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Chao Gao <chao.gao@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Yuan Yao <yuan.yao@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_191029_372936_9117FECB 
X-CRM114-Status: GOOD (  14.67  )
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

On Thu, Nov 3, 2022 at 4:49 AM Sean Christopherson <seanjc@google.com> wrote:
>
> Now that KVM setup is handled directly in riscv_kvm_init(), tag functions
> and data that are used/set only during init with __init/__ro_after_init.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

For KVM RISC-V:
Acked-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  arch/riscv/include/asm/kvm_host.h |  6 +++---
>  arch/riscv/kvm/mmu.c              | 12 ++++++------
>  arch/riscv/kvm/vmid.c             |  4 ++--
>  3 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index 8c771fc4f5d2..778ff0f282b7 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -295,11 +295,11 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  int kvm_riscv_gstage_alloc_pgd(struct kvm *kvm);
>  void kvm_riscv_gstage_free_pgd(struct kvm *kvm);
>  void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu);
> -void kvm_riscv_gstage_mode_detect(void);
> -unsigned long kvm_riscv_gstage_mode(void);
> +void __init kvm_riscv_gstage_mode_detect(void);
> +unsigned long __init kvm_riscv_gstage_mode(void);
>  int kvm_riscv_gstage_gpa_bits(void);
>
> -void kvm_riscv_gstage_vmid_detect(void);
> +void __init kvm_riscv_gstage_vmid_detect(void);
>  unsigned long kvm_riscv_gstage_vmid_bits(void);
>  int kvm_riscv_gstage_vmid_init(struct kvm *kvm);
>  bool kvm_riscv_gstage_vmid_ver_changed(struct kvm_vmid *vmid);
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 3620ecac2fa1..f42a34c7879a 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -20,12 +20,12 @@
>  #include <asm/pgtable.h>
>
>  #ifdef CONFIG_64BIT
> -static unsigned long gstage_mode = (HGATP_MODE_SV39X4 << HGATP_MODE_SHIFT);
> -static unsigned long gstage_pgd_levels = 3;
> +static unsigned long gstage_mode __ro_after_init = (HGATP_MODE_SV39X4 << HGATP_MODE_SHIFT);
> +static unsigned long gstage_pgd_levels __ro_after_init = 3;
>  #define gstage_index_bits      9
>  #else
> -static unsigned long gstage_mode = (HGATP_MODE_SV32X4 << HGATP_MODE_SHIFT);
> -static unsigned long gstage_pgd_levels = 2;
> +static unsigned long gstage_mode __ro_after_init = (HGATP_MODE_SV32X4 << HGATP_MODE_SHIFT);
> +static unsigned long gstage_pgd_levels __ro_after_init = 2;
>  #define gstage_index_bits      10
>  #endif
>
> @@ -760,7 +760,7 @@ void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu)
>                 kvm_riscv_local_hfence_gvma_all();
>  }
>
> -void kvm_riscv_gstage_mode_detect(void)
> +void __init kvm_riscv_gstage_mode_detect(void)
>  {
>  #ifdef CONFIG_64BIT
>         /* Try Sv57x4 G-stage mode */
> @@ -784,7 +784,7 @@ void kvm_riscv_gstage_mode_detect(void)
>  #endif
>  }
>
> -unsigned long kvm_riscv_gstage_mode(void)
> +unsigned long __init kvm_riscv_gstage_mode(void)
>  {
>         return gstage_mode >> HGATP_MODE_SHIFT;
>  }
> diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
> index 6cd93995fb65..5246da1c9167 100644
> --- a/arch/riscv/kvm/vmid.c
> +++ b/arch/riscv/kvm/vmid.c
> @@ -17,10 +17,10 @@
>
>  static unsigned long vmid_version = 1;
>  static unsigned long vmid_next;
> -static unsigned long vmid_bits;
> +static unsigned long vmid_bits __ro_after_init;
>  static DEFINE_SPINLOCK(vmid_lock);
>
> -void kvm_riscv_gstage_vmid_detect(void)
> +void __init kvm_riscv_gstage_vmid_detect(void)
>  {
>         unsigned long old;
>
> --
> 2.38.1.431.g37b22c650d-goog
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
