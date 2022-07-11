Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB176C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 01:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uw9uYODPX8tC2Jy+6QprDY6De+KRRFu+7tEw4qk0hsU=; b=S9ny+VVrcIuyjr
	zM3FvxUj/7XSMeil+JyOfRtXeiQ/EDvoHWjiSxSXERlD6G3ZpfhICBEdBdDH9dKisrrPr/WFOJ2pt
	FyuJaQJojEhWc81AQvefqI+g/ce1GDWorgJ5sc94F15VwHDYjIcB1Axk5MA8izpZxKBZecx0KeRxZ
	Ha2d9xo3RslrJg+gVJ5viSixAeawwjp/BGx5SYaokr8Flkkq921uVo7M5Eex6X0SqW6mNgsgqcnsi
	csiyLmt9J5LI4g8snKV9TIn+pGUL56Cf0QnjmlHLzNHs0+T4Z5bVfBVleMubCxjlC9+jjCD8W6Rxi
	rIe0b4IHl6NwvuCxzmmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAiNN-00F2G4-LZ; Mon, 11 Jul 2022 01:38:17 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAiNK-00F2Dr-6J; Mon, 11 Jul 2022 01:38:15 +0000
Received: by mail-qk1-x72c.google.com with SMTP id 20so2925178qky.5;
        Sun, 10 Jul 2022 18:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xureSuw2V9E7tzVjUzBjylXpgFwjrDdPqi99TNgwo2k=;
        b=GlElJxs6r9uyx/SQSYXULuTbs82yeDXXiSIJtB2p4ltiJUAxG9ZiGA77JLrro7RlQX
         0kY2uWkVTgoPyTQhbejFres652JV82MmsmKKBoW3lGZVjXUzs+12F4Ds3sk8Hj8h2gqZ
         TKthuvDMbemYVTKyLKl9gtMEOcu1gE2GYBXWlJRP5kRRR08sHNwobRml2McKgUfTpkBm
         Stp0xir9M5UC+LyL8+nWyupiuK8UQalEUuKhWtpjANVl4t1qkAU7NxHjPigfxquc/ExS
         0GQE90k2A3wgZURr1hM9eBXsn12M8PbjuTXwMkeWaDVvYrXYJf/5PfX2OzzSpjuD7XA7
         BOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xureSuw2V9E7tzVjUzBjylXpgFwjrDdPqi99TNgwo2k=;
        b=XapiohFGPpT9ILOVVotem3hYeug7+KWIRgjV0zKtj0V67aqtZwE18gIKun4EXcYjUf
         fvTLT+FYxiXapVj9kVy4E3D6WbpJeoddBeua/+7koNJYloa3dp2Dpyyur4lD2Cwle4/1
         sToBVCdvxxoADSeXHLbJHE9573qAnPmbvxcYlQuzqEjUbOblkdm647ZGXc5RZozUoG/Z
         amZ4pbUaWMmntujlNcbCAw+LZRQ0yZN/UvcsCqf4NMirS9FutQ45i90IP37hHGWwLcpr
         /xhqC3xxBqoSpo6Gwe2NUIm4/Q4PvYRI3YpXvEoM/3wOUKlsn3RLNS6Pei7JfX32pHA+
         vFag==
X-Gm-Message-State: AJIora9U/OJQOTxLxeRD5R97jYEC4JkYrSQvVeHYkbxRWZu8MVJZ0PQ0
	9UZ1IaH8MC1HjnabU74WIryWqgQ0bZU8oC31tqs=
X-Google-Smtp-Source: AGRyM1s9CHhxiUJJJrpIWa/HhpPbtbrmDcWTIZPv8HTqxaBbr9Pt2wMHh5OR5W6Z1I4zv7JCvOyBTmsSuwGZMVkeZ9s=
X-Received: by 2002:a05:620a:430f:b0:6a7:9f9d:20cd with SMTP id
 u15-20020a05620a430f00b006a79f9d20cdmr9909341qko.389.1657503492197; Sun, 10
 Jul 2022 18:38:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220710151105.687193-1-apatel@ventanamicro.com>
In-Reply-To: <20220710151105.687193-1-apatel@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 11 Jul 2022 09:37:59 +0800
Message-ID: <CAEUhbmUzzoA4uUQ3tRk4V3jAA14AfPnD08KM0GT5Px6DMFwBRA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix SRCU deadlock caused by kvm_riscv_check_vcpu_requests()
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Anup Patel <anup@brainfault.org>, 
	KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220710_183814_274045_D5E3C48E 
X-CRM114-Status: GOOD (  18.95  )
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

On Sun, Jul 10, 2022 at 11:11 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The kvm_riscv_check_vcpu_requests() is called with SRCU read lock held
> and for KVM_REQ_SLEEP request it will block the VCPU without releasing
> SRCU read lock. This causes KVM ioctls (such as KVM_IOEVENTFD) from
> other VCPUs of the same Guest/VM to hang/deadlock if there is any
> synchronize_srcu() or synchronize_srcu_expedited() in the path.
>
> To fix the above in kvm_riscv_check_vcpu_requests(), we should do SRCU
> read unlock before blocking the VCPU and do SRCU read lock after VCPU
> wakeup.
>
> Fixes: cce69aff689e ("RISC-V: KVM: Implement VCPU interrupts and
> requests handling")

nites: the "Fixes" tag should be put in a single line to avoid
breaking scripts that parse the "Fixes" tag

> Reported-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index b7a433c54d0f..5d271b597613 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -845,9 +845,11 @@ static void kvm_riscv_check_vcpu_requests(struct kvm_vcpu *vcpu)
>
>         if (kvm_request_pending(vcpu)) {
>                 if (kvm_check_request(KVM_REQ_SLEEP, vcpu)) {
> +                       kvm_vcpu_srcu_read_unlock(vcpu);
>                         rcuwait_wait_event(wait,
>                                 (!vcpu->arch.power_off) && (!vcpu->arch.pause),
>                                 TASK_INTERRUPTIBLE);
> +                       kvm_vcpu_srcu_read_lock(vcpu);
>
>                         if (vcpu->arch.power_off || vcpu->arch.pause) {
>                                 /*
> --

Tested-by: Bin Meng <bmeng.cn@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
