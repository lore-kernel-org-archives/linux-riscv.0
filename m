Return-Path: <SRS0=YRhX=PZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA41CC433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Nov 2021 04:47:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E17E60E05
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Nov 2021 04:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E17E60E05
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SD5crneMlm7XwlYxVvmTdQjTsSTN5MgeQIoAS9R1IYI=; b=QwQxaBQxg1y8er
	DgnlDqnL3Iw4Ulb4T83/BqaI474Wo4nL5LeJf2lrntIu+/87Rt7c7uFAcUPQ0OphqqYzndYWLBrQg
	7CZ5U0obQnpcn+2iXk4NS4nISuD2s03L+HkTWhI7RiCkNshIERCx0feXmN9Ks+6iWlXDl15+qgY/K
	GqjYiW3J3H6GQt5rFD6mi6ODzSoYWMqpWV9DvwCu3jsh/F6zODFJI/wwZFyNlA4FDrtENiudsXyii
	NWJoLUg0QIWicOmKhJnlLB1eHkiqWbs1uU7m+/dM8wowog7HxUE9Ju9Z9nnD4xK5+lKRybWkmr6ww
	R8aZnH7o1BDu7bIs6UmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjDbh-00CfQm-4A; Sat, 06 Nov 2021 04:47:09 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjDbd-00CfPA-AS
 for linux-riscv@lists.infradead.org; Sat, 06 Nov 2021 04:47:06 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso7822882wmf.0
 for <linux-riscv@lists.infradead.org>; Fri, 05 Nov 2021 21:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8JhUKWBzUY5wx+JAyqtXWGvq745sL3nVjpcKRuZpRto=;
 b=yGHDErqQ3tVK9oyBmBNouGiNlZDvOuAwbZD0jWb64aWVDrbfojyN6hNohhWJ1/Td4b
 aaz0rGBUql7ThIt5JnRoep9M0FZldDYrtgbEtDKSN2sWQBlKBjS3pMA8hWGXbOdY64OC
 ic+ap8+tdi8rI6dPCPSBXkKv8nA5pYkwWrvazXoNrPCRBx4LdrdRex38wf/im6jpKc3+
 Dh5AjRC2pHxYcTe3hPy5hCnUJrmVO9oBjT+zscHWFOxfvCF3AvZUPKHhOHWQJtykm3x2
 oQfk4WGk1BtpPirTbIJlcjk0URhVAOIUPOYOTlNhAxrwngvJab6T1B8dj5K2UPJUNkXw
 Qadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8JhUKWBzUY5wx+JAyqtXWGvq745sL3nVjpcKRuZpRto=;
 b=RB/oQto1G55ws8HaBk6qvqSEzizag4fQTwEQZk4T9plCcXDhJ9JJzCPa2UxE79HzVa
 IzdkkPXtHp5z0BeOFDpCATAzZU6UX+7QLs/tUHWc7hGR2P/e89W3Ft2cv9jDKY7QDrYN
 kWYzXxWFQ7m114w+cFsLt+PnlQ1q3J1BTHxpxlIVWeEr4oYnN0U724v7ehEFrsLyK4gw
 QbDic1dReVGSU0/pbQnE1ABpbfYng2B2/6AoYJqgZHuNmawfG1PCWZp4uOLuzufk5NZU
 9KmQOUI23h32T1gdNrTkFLQYyhws1kpetN0A0GpkPD50tEW+mpqU5O5KSGmBOZoA/X52
 irng==
X-Gm-Message-State: AOAM532Z3XIwu4rXAixJIuvS9q8sVR88b88OuzXoIN8nGFoVTWFnmMg3
 3LWh83xJsRcdc+gkq7h72dac8ffEBKNg9OeU5An12w==
X-Google-Smtp-Source: ABdhPJxsU7YNzgZsM0edzAeRENYydGjzXIRfpYv6eoSjiSe/hsTq95UbUGh8MEiumpgkHxchPi774IYqf3LvQ8JiJpM=
X-Received: by 2002:a1c:7201:: with SMTP id n1mr35850998wmc.176.1636174022562; 
 Fri, 05 Nov 2021 21:47:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211105235852.3011900-1-atish.patra@wdc.com>
 <20211105235852.3011900-5-atish.patra@wdc.com>
In-Reply-To: <20211105235852.3011900-5-atish.patra@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 6 Nov 2021 10:16:51 +0530
Message-ID: <CAAhSdy0-079N2QQQg7bB=WiU3uZWXaGs1imGZJ6y36eXpnaBnA@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] RISC-V: KVM: Add v0.1 replacement SBI extensions
 defined in v02
To: Atish Patra <atish.patra@wdc.com>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Anup Patel <anup.patel@wdc.com>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>, kvm-riscv@lists.infradead.org, 
 KVM General <kvm@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Vincent Chen <vincent.chen@sifive.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211105_214705_392967_14D4E60B 
X-CRM114-Status: GOOD (  24.32  )
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

On Sat, Nov 6, 2021 at 5:29 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> The SBI v0.2 contains some of the improved versions of required v0.1
> extensions such as remote fence, timer and IPI.
>
> This patch implements those extensions.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/kvm/Makefile           |   1 +
>  arch/riscv/kvm/vcpu_sbi.c         |   7 ++
>  arch/riscv/kvm/vcpu_sbi_replace.c | 136 ++++++++++++++++++++++++++++++
>  3 files changed, 144 insertions(+)
>  create mode 100644 arch/riscv/kvm/vcpu_sbi_replace.c
>
> diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
> index 84c02922a329..4757ae158bf3 100644
> --- a/arch/riscv/kvm/Makefile
> +++ b/arch/riscv/kvm/Makefile
> @@ -25,4 +25,5 @@ kvm-y += vcpu_switch.o
>  kvm-y += vcpu_sbi.o
>  kvm-$(CONFIG_RISCV_SBI_V01) += vcpu_sbi_v01.o
>  kvm-y += vcpu_sbi_base.o
> +kvm-y += vcpu_sbi_replace.o
>  kvm-y += vcpu_timer.o
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index 92b682f4f29e..3502c6166eba 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -40,9 +40,16 @@ static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01 = {
>  };
>  #endif
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base;
> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_time;
> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_ipi;
> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence;
> +
>  static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
>         &vcpu_sbi_ext_v01,
>         &vcpu_sbi_ext_base,
> +       &vcpu_sbi_ext_time,
> +       &vcpu_sbi_ext_ipi,
> +       &vcpu_sbi_ext_rfence,
>  };
>
>  void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run)
> diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
> new file mode 100644
> index 000000000000..a80fa7691b14
> --- /dev/null
> +++ b/arch/riscv/kvm/vcpu_sbi_replace.c
> @@ -0,0 +1,136 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
> + *
> + * Authors:
> + *     Atish Patra <atish.patra@wdc.com>
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/err.h>
> +#include <linux/kvm_host.h>
> +#include <asm/csr.h>
> +#include <asm/sbi.h>
> +#include <asm/kvm_vcpu_timer.h>
> +#include <asm/kvm_vcpu_sbi.h>
> +
> +static int kvm_sbi_ext_time_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> +                                   unsigned long *out_val,
> +                                   struct kvm_cpu_trap *utrap, bool *exit)
> +{
> +       int ret = 0;
> +       struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> +       u64 next_cycle;
> +
> +       if (!cp || (cp->a6 != SBI_EXT_TIME_SET_TIMER))
> +               return -EINVAL;
> +
> +#if __riscv_xlen == 32
> +       next_cycle = ((u64)cp->a1 << 32) | (u64)cp->a0;
> +#else
> +       next_cycle = (u64)cp->a0;
> +#endif
> +       kvm_riscv_vcpu_timer_next_event(vcpu, next_cycle);
> +
> +       return ret;
> +}
> +
> +const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_time = {
> +       .extid_start = SBI_EXT_TIME,
> +       .extid_end = SBI_EXT_TIME,
> +       .handler = kvm_sbi_ext_time_handler,
> +};
> +
> +static int kvm_sbi_ext_ipi_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> +                                  unsigned long *out_val,
> +                                  struct kvm_cpu_trap *utrap, bool *exit)
> +{
> +       int i, ret = 0;
> +       struct kvm_vcpu *tmp;
> +       struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> +       unsigned long hmask = cp->a0;
> +       unsigned long hbase = cp->a1;
> +
> +       if (!cp || (cp->a6 != SBI_EXT_IPI_SEND_IPI))
> +               return -EINVAL;
> +
> +       kvm_for_each_vcpu(i, tmp, vcpu->kvm) {
> +               if (hbase != -1UL) {
> +                       if (tmp->vcpu_id < hbase)
> +                               continue;
> +                       if (!(hmask & (1UL << (tmp->vcpu_id - hbase))))
> +                               continue;
> +               }
> +               ret = kvm_riscv_vcpu_set_interrupt(tmp, IRQ_VS_SOFT);
> +               if (ret < 0)
> +                       break;
> +       }
> +
> +       return ret;
> +}
> +
> +const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_ipi = {
> +       .extid_start = SBI_EXT_IPI,
> +       .extid_end = SBI_EXT_IPI,
> +       .handler = kvm_sbi_ext_ipi_handler,
> +};
> +
> +static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> +                                     unsigned long *out_val,
> +                                     struct kvm_cpu_trap *utrap, bool *exit)
> +{
> +       int i, ret = 0;
> +       struct cpumask cm, hm;
> +       struct kvm_vcpu *tmp;
> +       struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> +       unsigned long hmask = cp->a0;
> +       unsigned long hbase = cp->a1;
> +       unsigned long funcid = cp->a6;
> +
> +       if (!cp)
> +               return -EINVAL;
> +
> +       cpumask_clear(&cm);
> +       cpumask_clear(&hm);
> +       kvm_for_each_vcpu(i, tmp, vcpu->kvm) {
> +               if (hbase != -1UL) {
> +                       if (tmp->vcpu_id < hbase)
> +                               continue;
> +                       if (!(hmask & (1UL << (tmp->vcpu_id - hbase))))
> +                               continue;
> +               }
> +               if (tmp->cpu < 0)
> +                       continue;
> +               cpumask_set_cpu(tmp->cpu, &cm);
> +       }
> +
> +       riscv_cpuid_to_hartid_mask(&cm, &hm);
> +
> +       switch (funcid) {
> +       case SBI_EXT_RFENCE_REMOTE_FENCE_I:
> +               ret = sbi_remote_fence_i(cpumask_bits(&hm));
> +               break;
> +       case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA:
> +               ret = sbi_remote_hfence_vvma(cpumask_bits(&hm), cp->a2, cp->a3);
> +               break;
> +       case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID:
> +               ret = sbi_remote_hfence_vvma_asid(cpumask_bits(&hm), cp->a2,
> +                                                 cp->a3, cp->a4);
> +               break;
> +       case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA:
> +       case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID:
> +       case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA:
> +       case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID:
> +       /* TODO: implement for nested hypervisor case */
> +       default:
> +               ret = -EOPNOTSUPP;
> +       }
> +
> +       return ret;
> +}
> +
> +const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence = {
> +       .extid_start = SBI_EXT_RFENCE,
> +       .extid_end = SBI_EXT_RFENCE,
> +       .handler = kvm_sbi_ext_rfence_handler,
> +};
> --
> 2.31.1
>

Drop checks on "cp" pointer in various functions above.

Otherwise it looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
