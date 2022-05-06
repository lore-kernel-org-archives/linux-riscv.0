Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7C3C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  6 May 2022 07:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OHE36+kWFHw3XUUyir0diZwmVq6JEPC/igVmW9KSfAA=; b=Ad6PMlCeA6RnP5
	ozta1agBMQpmNwpIXnec17QztcyC53g9qhNdqjGl0S+mKAd0sTlYlcQsQA13jMp5Z5tgG1h/s2hX6
	TdVg53CM+ULPpWU7+4/nnCkD65VX0ySolx5BubHvy8ZwqBNfBX3Zz5/BlkasEnhbTVRaHhEY0dS9G
	nLD9wkAy9H77VTYYkUMz9DuQKJG06iFbSrEIOo6iUV+gJ8C1lNOD/HYbxrN7KDuJNRj/r1fuzUVyE
	rehXHsciTmbC998hTxLmqf9W3nITZM+BQYivgy13vDlYLxRkrlz8BUYYjivTsRkHqURWAVhnmIh24
	q99JfbL9OtpwKk9GLUrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmsma-001wWj-BN; Fri, 06 May 2022 07:53:48 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmsmW-001wSe-Ju
 for linux-riscv@lists.infradead.org; Fri, 06 May 2022 07:53:46 +0000
Received: by mail-yb1-xb29.google.com with SMTP id v59so11496988ybi.12
 for <linux-riscv@lists.infradead.org>; Fri, 06 May 2022 00:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WaBl9pAWGWFlLK9nV+267TWCL6dZ06A/NoNmIhWgBMM=;
 b=Su5V0nbXIO7rEtZnbMRp6hT4/ABpQJrp77PFoY9EtWOQEiTO3IVqGoF+Aa1fmBbLE8
 sV5G5fS9H0cy10W9/iTLIJ7MbO4JOEUT53M5bbO0n4IqbE0l1jEOckYtTcTSDQ2jQi5p
 DpGRkL6dF5eI0pWynFjtyuja8/CSpi9bcOwko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WaBl9pAWGWFlLK9nV+267TWCL6dZ06A/NoNmIhWgBMM=;
 b=prTlM5qRole5HsAG5WMhvNRynY3KCf8JTNSOsZJLmM0P3kofs93CIXMqzlitQnNxiv
 adZmI6S6QQQTm2kbxEDXklqEn4PJ0fghpOFu78Zj/y4wSbr2kImyYQ8so1QkZuK9URqj
 Ur2qgo0/eOHFEWlgOtLJeiriOi5WRySgMghckgrJZCmHku4q7xetLmUTuQL+YRBRATb4
 8A+Fb9roKLa5UwpZT8USVARrd2kZaRItce7ayItrWPQ6QTD5gD85rhFO+5BSjtG87rRW
 vUAlCUr6jdTdQ+G/jY94JiBcfaukJl66CZ8TyeMPxT2ndGKAzNQSafA10kwbLVor85uU
 8ePA==
X-Gm-Message-State: AOAM531Zh3KiUZrqJhHdJQyJKXyZOBvJ+RvicM3mkqAsGiz9VP4Bb4ew
 Tpt7HWjnU0EUlKouc02xIy4zpb0O2K7PH+EpRdky
X-Google-Smtp-Source: ABdhPJwLmmtcS8FQJVNzNqzWudxH3m+YT2z9bUzShy4WAKlZZxjAcINcyDUphEUReozdZ5z0y0OYdz6OJW5aQIP9RRc=
X-Received: by 2002:a5b:803:0:b0:633:749f:9acd with SMTP id
 x3-20020a5b0803000000b00633749f9acdmr1437126ybp.236.1651823615080; Fri, 06
 May 2022 00:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220420112450.155624-1-apatel@ventanamicro.com>
 <20220420112450.155624-8-apatel@ventanamicro.com>
In-Reply-To: <20220420112450.155624-8-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 6 May 2022 00:53:24 -0700
Message-ID: <CAOnJCUKPTwjGr9Lg1XRMVTCMswg0E+4VvknBQ0p+Qo6EHL3M5A@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] RISC-V: KVM: Cleanup stale TLB entries when host
 CPU changes
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Anup Patel <anup@brainfault.org>, KVM General <kvm@vger.kernel.org>,
 kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_005345_014596_A4FA1170 
X-CRM114-Status: GOOD (  20.71  )
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

On Wed, Apr 20, 2022 at 4:25 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> On RISC-V platforms with hardware VMID support, we share same
> VMID for all VCPUs of a particular Guest/VM. This means we might
> have stale G-stage TLB entries on the current Host CPU due to
> some other VCPU of the same Guest which ran previously on the
> current Host CPU.
>
> To cleanup stale TLB entries, we simply flush all G-stage TLB
> entries by VMID whenever underlying Host CPU changes for a VCPU.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_host.h |  5 +++++
>  arch/riscv/kvm/tlb.c              | 23 +++++++++++++++++++++++
>  arch/riscv/kvm/vcpu.c             | 11 +++++++++++
>  3 files changed, 39 insertions(+)
>
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index a40e88a9481c..94349a5ffd34 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -166,6 +166,9 @@ struct kvm_vcpu_arch {
>         /* VCPU ran at least once */
>         bool ran_atleast_once;
>
> +       /* Last Host CPU on which Guest VCPU exited */
> +       int last_exit_cpu;
> +
>         /* ISA feature bits (similar to MISA) */
>         unsigned long isa;
>
> @@ -256,6 +259,8 @@ void kvm_riscv_local_hfence_vvma_gva(unsigned long vmid,
>                                      unsigned long order);
>  void kvm_riscv_local_hfence_vvma_all(unsigned long vmid);
>
> +void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu);
> +
>  void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu);
>  void kvm_riscv_hfence_gvma_vmid_all_process(struct kvm_vcpu *vcpu);
>  void kvm_riscv_hfence_vvma_all_process(struct kvm_vcpu *vcpu);
> diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
> index c0f86d09c41d..1a76d0b1907d 100644
> --- a/arch/riscv/kvm/tlb.c
> +++ b/arch/riscv/kvm/tlb.c
> @@ -215,6 +215,29 @@ void kvm_riscv_local_hfence_vvma_all(unsigned long vmid)
>         csr_write(CSR_HGATP, hgatp);
>  }
>
> +void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu)
> +{
> +       unsigned long vmid;
> +
> +       if (!kvm_riscv_gstage_vmid_bits() ||
> +           vcpu->arch.last_exit_cpu == vcpu->cpu)
> +               return;
> +
> +       /*
> +        * On RISC-V platforms with hardware VMID support, we share same
> +        * VMID for all VCPUs of a particular Guest/VM. This means we might
> +        * have stale G-stage TLB entries on the current Host CPU due to
> +        * some other VCPU of the same Guest which ran previously on the
> +        * current Host CPU.
> +        *
> +        * To cleanup stale TLB entries, we simply flush all G-stage TLB
> +        * entries by VMID whenever underlying Host CPU changes for a VCPU.
> +        */
> +
> +       vmid = READ_ONCE(vcpu->kvm->arch.vmid.vmid);
> +       kvm_riscv_local_hfence_gvma_vmid_all(vmid);
> +}
> +
>  void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu)
>  {
>         local_flush_icache_all();
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 9cd8f6e91c98..a86710fcd2e0 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -67,6 +67,8 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
>         if (loaded)
>                 kvm_arch_vcpu_put(vcpu);
>
> +       vcpu->arch.last_exit_cpu = -1;
> +
>         memcpy(csr, reset_csr, sizeof(*csr));
>
>         memcpy(cntx, reset_cntx, sizeof(*cntx));
> @@ -735,6 +737,7 @@ static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu)
>  {
>         guest_state_enter_irqoff();
>         __kvm_riscv_switch_to(&vcpu->arch);
> +       vcpu->arch.last_exit_cpu = vcpu->cpu;
>         guest_state_exit_irqoff();
>  }
>
> @@ -829,6 +832,14 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>                         continue;
>                 }
>
> +               /*
> +                * Cleanup stale TLB enteries
> +                *
> +                * Note: This should be done after G-stage VMID has been
> +                * updated using kvm_riscv_gstage_vmid_ver_changed()
> +                */
> +               kvm_riscv_local_tlb_sanitize(vcpu);
> +
>                 guest_timing_enter_irqoff();
>
>                 kvm_riscv_vcpu_enter_exit(vcpu);
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
