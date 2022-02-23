Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BEAC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 00:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JdfTU1FT+kEf1tdBw6M9IRav4whd08yrPVtcZD5Oork=; b=nkPF/z/VBVa3vh
	EyCQUA03dWqT8rqYFGkmbHxXFmYbvtQkKik7uvHLn2QwL99YgaCfvvbNCXGrxuu7DK7EWK5/Bpq1+
	QRihhgxG4Ub1g/cLXKlIALuEkCUlEIpzne6IOmcebtbJW7x6LbaIrQ4crpdtQ5YZHjVnUfEKT63hA
	2IvGcn015GxAuOEkFK/pAhCQibMlJvcnC5jWlYjCwiDrGMDlLEcKeKAWIuKCstJWkieTQ7Z7HLmAt
	ADCBPps9b7pkeHjcz1p4bdc6Lvy0lJqjqO6cJ67TFtfPCbh813ZvrQr358z78RsjWMxDnp8WqV5Mh
	KQjC55AiWCWDaRejqwxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMf6M-00BzKW-7q; Wed, 23 Feb 2022 00:01:50 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMf6I-00BzJF-Ox
 for linux-riscv@lists.infradead.org; Wed, 23 Feb 2022 00:01:48 +0000
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2d07ae0b1c4so193208557b3.11
 for <linux-riscv@lists.infradead.org>; Tue, 22 Feb 2022 16:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GPhptd3Q62fbtOfa6cWbtPIF6RubFM1loZL2igvMdmE=;
 b=LqUSjl3rYV0YuRKLtFlY7VsZmTkbAFokUMymncGcEAxRSr2CTO08CjzG7Jd/homUWI
 H58m47zB2tyrKExo9jSe7/a31KeV2f2nrqAJ76PdCUz0139fOYzv6f/WWxzY7pIp2JQO
 VHMGaT6C9kp8Ry/qazQ3ThDrH4nfaT+Aikl30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GPhptd3Q62fbtOfa6cWbtPIF6RubFM1loZL2igvMdmE=;
 b=M3bYa0mO+y2J7LzN1kjZ5c8bZL/QaXBeaBoUqrSbNqH/xAGOgkWXsdy3bVmaC1z4M5
 Hnb44ApwppAbvqVmGXCxJ4j1izrzHNnCVNcmrd2wk8SG9+YMjXH0UkbqhAW6kVxo9pfo
 hBXR2RUHMXN16Z1twilSH0D5mJvtC8+zES2OpO4nEZIOQcw9qWJ1fd4DaZmMPHK7+9o0
 V5X67et7EJmbuIbKa2MQo/mScfzGNXz2azxDCkZxDPdjctDBTVKnW2PdUwG5j/qf2vvi
 Nl5nckJ+0Klba6Cln0IuXajog9zC6H9Yp7irttNFU4tAajSjuWSqU1BVXq/TgVSkNLEV
 KMgQ==
X-Gm-Message-State: AOAM533xt0MpMFkbq9MrAKGcW2fZcukZb0sUGVdwCUZV3k8Zd195yF0I
 aXOlCpmBJap5YcuntRV+w35hVrxL0x+wv6e7O946
X-Google-Smtp-Source: ABdhPJxTCHh8uquJeYeoe50oLeU6Bdpto7tc4MgAb7JncyAK/4PlHxHbP8Krj0AfySlfD5bvHZGz4ZDB66Qy3/SERSk=
X-Received: by 2002:a0d:d512:0:b0:2d1:51a:5616 with SMTP id
 x18-20020a0dd512000000b002d1051a5616mr26739511ywd.62.1645574505487; Tue, 22
 Feb 2022 16:01:45 -0800 (PST)
MIME-Version: 1.0
References: <20220201082227.361967-1-apatel@ventanamicro.com>
 <20220201082227.361967-6-apatel@ventanamicro.com>
In-Reply-To: <20220201082227.361967-6-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 22 Feb 2022 16:01:34 -0800
Message-ID: <CAOnJCUJE_FqmvTXrwRafGtDEKomm0idSPjSRsnVYr3-HzuCh9A@mail.gmail.com>
Subject: Re: [PATCH 5/6] RISC-V: KVM: Add common kvm_riscv_vcpu_wfi() function
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, 
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_160146_841280_BFEC1CDB 
X-CRM114-Status: GOOD (  18.03  )
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

On Tue, Feb 1, 2022 at 12:24 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The wait for interrupt (WFI) instruction emulation can share the VCPU
> halt logic with SBI HSM suspend emulation so this patch adds a common
> kvm_riscv_vcpu_wfi() function for this purpose.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_host.h |  1 +
>  arch/riscv/kvm/vcpu_exit.c        | 22 ++++++++++++++++------
>  2 files changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index 99ef6a120617..78da839657e5 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -228,6 +228,7 @@ void kvm_riscv_stage2_vmid_update(struct kvm_vcpu *vcpu);
>
>  void __kvm_riscv_unpriv_trap(void);
>
> +void kvm_riscv_vcpu_wfi(struct kvm_vcpu *vcpu);
>  unsigned long kvm_riscv_vcpu_unpriv_read(struct kvm_vcpu *vcpu,
>                                          bool read_insn,
>                                          unsigned long guest_addr,
> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> index 571f319e995a..aa8af129e4bb 100644
> --- a/arch/riscv/kvm/vcpu_exit.c
> +++ b/arch/riscv/kvm/vcpu_exit.c
> @@ -144,12 +144,7 @@ static int system_opcode_insn(struct kvm_vcpu *vcpu,
>  {
>         if ((insn & INSN_MASK_WFI) == INSN_MATCH_WFI) {
>                 vcpu->stat.wfi_exit_stat++;
> -               if (!kvm_arch_vcpu_runnable(vcpu)) {
> -                       srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
> -                       kvm_vcpu_halt(vcpu);
> -                       vcpu->arch.srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
> -                       kvm_clear_request(KVM_REQ_UNHALT, vcpu);
> -               }
> +               kvm_riscv_vcpu_wfi(vcpu);
>                 vcpu->arch.guest_context.sepc += INSN_LEN(insn);
>                 return 1;
>         }
> @@ -453,6 +448,21 @@ static int stage2_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
>         return 1;
>  }
>
> +/**
> + * kvm_riscv_vcpu_wfi -- Emulate wait for interrupt (WFI) behaviour
> + *
> + * @vcpu: The VCPU pointer
> + */
> +void kvm_riscv_vcpu_wfi(struct kvm_vcpu *vcpu)
> +{
> +       if (!kvm_arch_vcpu_runnable(vcpu)) {
> +               srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
> +               kvm_vcpu_halt(vcpu);
> +               vcpu->arch.srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
> +               kvm_clear_request(KVM_REQ_UNHALT, vcpu);
> +       }
> +}
> +
>  /**
>   * kvm_riscv_vcpu_unpriv_read -- Read machine word from Guest memory
>   *
> --
> 2.25.1
>


Reviewed-by: Atish Patra <atishp@rivosinc.com>

--
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
