Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FDCC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Feb 2022 06:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WclZ4+xnHPuoDpin86OqyMmxpasq3witFsTEBqTBDEs=; b=GCeMMo2e6Ksim0
	2cXcrHwrzpJlyFTyrGlEqnhIRyoKXI0TjfWm35USuRSiTK/Hdokb2UIOYAqxwh+HCptcVmKqS+x7h
	7LZgN0OPwefxK2ut9RAWfb9FbbNhqdvVmE4g6SsTxNID6nNkIdcj582x4iAM6RlZAYUeCioTwyNfH
	4zhR3etBhzcJgiKkr0ADOxURsCFsf2cgu5uCjHQoPjH3jhcAvhMydc0TRKT5b1tsoQVc6yKCjRngL
	Lg+Xb8H0z4Zf9JHC3uis0jSoqAjs8dBmIfUuuV2EyuYlPbtEL4etXjO1umxP+G+bgdnYem70VhNQ3
	4QVr3vpEDnpGko2atYew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMOtX-008BmQ-Tx; Tue, 22 Feb 2022 06:43:31 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMOtU-008Blg-LZ
 for linux-riscv@lists.infradead.org; Tue, 22 Feb 2022 06:43:30 +0000
Received: by mail-wm1-x331.google.com with SMTP id p4so616288wmg.1
 for <linux-riscv@lists.infradead.org>; Mon, 21 Feb 2022 22:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lhqkUaDgtkViS6PzAzeb1YfRAh45PxyDK5QM9+so9RQ=;
 b=JZhPn0u/EzVK6wDxBpAPYrK9S+WcRg4OfIiI33Bw0l+cF2brsB4oV3Lo+FRh1k54x2
 JU6zMN02gyXN4dnRX63s1IICdDE7dK0WfGh/e0dzUrL+hipsHulg2o1J3t/hnX6ns2ZN
 KpiRYt7eRaXBXIjtrzXLtkR03TjqV3gq2D0XuhTcZkJT9zvmt44xiNM8dA5L5xOMYhPQ
 R8xhxtfWU1K6GOvU21/TIfpt9/WrryW5I0VIpo4mRhnGraWjiyJb2oYnxjdi0eP7mZg6
 0gOFGK4YPZVtbngUnSFyuboEk2/BPsakBaMDPFr8G7/58OisXxOq5iKMdhlj8PyOdiMt
 /6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lhqkUaDgtkViS6PzAzeb1YfRAh45PxyDK5QM9+so9RQ=;
 b=vlsZXy8vIHM0vlQwQb7HhJJ4nZs3MaTRAPiukRMFgsLkfaxCuk5wG5JrRYzs4+56Lo
 GjI4m0/Z/8F12zO4401PjOwNtSvc7zDeMzm50N9jMNuD4kZ4NVvKLlbzea9I2gCs9MGO
 jJUH7BTc5TvBAcA+C43YMA8VDY5Aw/T9ehRjahyBhc2ycQoZysT5cpdvQZZtlG45EDiq
 bJZhf8AWiKpALYO7t+8l26NLYg4KVH0VP/Pr5dDtWrKguLQ6/WAVNKlbdq9achQ02oOt
 Q+QJPFauA2BUNKeRC95Dg1N6jxQTaDXkWEP0VwonL6YhdMy0LXefPwpyPMkyUymP71V5
 BDKg==
X-Gm-Message-State: AOAM532TFvpY40JGnuAmDfsYWW7kAVOY4aTBg1EuyV7JuYq6/lVzavG/
 v8dnc1HyFW6OyiH5WjK7th9aDMNwsTHYXDWOIsvsXhuCYPgPQQ==
X-Google-Smtp-Source: ABdhPJwzjxDMGJ2lo+GbJIITqUCAqKOfw0LkJN9Xe0so0w+axbh/fuNudXE5Jhi9zwO+fpWIdrugMiV7zXkrhnHVdyk=
X-Received: by 2002:a7b:cb98:0:b0:37b:dd98:f87c with SMTP id
 m24-20020a7bcb98000000b0037bdd98f87cmr1965905wmi.59.1645512206871; Mon, 21
 Feb 2022 22:43:26 -0800 (PST)
MIME-Version: 1.0
References: <20220217104248.30948-1-vincent.chen@sifive.com>
In-Reply-To: <20220217104248.30948-1-vincent.chen@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 22 Feb 2022 12:13:15 +0530
Message-ID: <CAAhSdy22YkD+euF2wij9FhUT2q-jVQCjdN8+WQEqnyzdiQ6EAw@mail.gmail.com>
Subject: Re: [PATCH] riscv: kvm: refine __kvm_riscv_switch_to and
 __kvm_riscv_switch_from function
To: Vincent Chen <vincent.chen@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, fu-ching.yang@sifive.com, 
 hsinyi.lee@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_224328_800771_2C01FAF5 
X-CRM114-Status: GOOD (  17.37  )
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

On Thu, Feb 17, 2022 at 4:13 PM Vincent Chen <vincent.chen@sifive.com> wrote:
>

I think the patch subject should be:
RISC-V: KVM: Refine __kvm_riscv_switch_to() implementation

> Kernel uses __kvm_riscv_switch_to() and __kvm_riscv_switch_from() to switch

s/__kvm_riscv_switch_from/__kvm_switch_return/

> the context of host kernel and guest kernel. Several CSRs belonging to the
> context will be read and written during the context switch. To ensure
> atomic read-modify-write control of CSR and ordering of CSR accesses, some
> hardware blocks or flushes the pipeline when writing a CSR. In this

s/hardware blocks or flushes/hardware blocks flush/

> circumstance, grouping CSR executions together as much as possible can
> reduce the performance impact of the pipeline. Therefore, this commit
> reorders the CSR instructions to enhance the context switch performance..

I am mostly fine with this patch except a few nits below.

>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Suggested-by: Hsinyi Lee <hsinyi.lee@sifive.com>
> Suggested-by: Fu-Ching Yang <fu-ching.yang@sifive.com>
> ---
>  arch/riscv/kvm/vcpu_switch.S | 55 ++++++++++++++++++------------------
>  1 file changed, 28 insertions(+), 27 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu_switch.S b/arch/riscv/kvm/vcpu_switch.S
> index 029a28a195c6..75cf21e5ed92 100644
> --- a/arch/riscv/kvm/vcpu_switch.S
> +++ b/arch/riscv/kvm/vcpu_switch.S
> @@ -40,34 +40,35 @@ ENTRY(__kvm_riscv_switch_to)
>         REG_S   s9, (KVM_ARCH_HOST_S9)(a0)
>         REG_S   s10, (KVM_ARCH_HOST_S10)(a0)
>         REG_S   s11, (KVM_ARCH_HOST_S11)(a0)

Add a new line here.

Also add a single line comment as follows:
/* Load Guest CSR values */

> +       REG_L   t0, (KVM_ARCH_GUEST_SSTATUS)(a0)
> +       REG_L   t1, (KVM_ARCH_GUEST_HSTATUS)(a0)
> +       REG_L   t2, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
> +       la      t4, __kvm_switch_return
> +       REG_L   t5, (KVM_ARCH_GUEST_SEPC)(a0)
>
>         /* Save Host and Restore Guest SSTATUS */
> -       REG_L   t0, (KVM_ARCH_GUEST_SSTATUS)(a0)
>         csrrw   t0, CSR_SSTATUS, t0
> -       REG_S   t0, (KVM_ARCH_HOST_SSTATUS)(a0)
>
>         /* Save Host and Restore Guest HSTATUS */
> -       REG_L   t1, (KVM_ARCH_GUEST_HSTATUS)(a0)
>         csrrw   t1, CSR_HSTATUS, t1
> -       REG_S   t1, (KVM_ARCH_HOST_HSTATUS)(a0)
>
>         /* Save Host and Restore Guest SCOUNTEREN */
> -       REG_L   t2, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
>         csrrw   t2, CSR_SCOUNTEREN, t2
> -       REG_S   t2, (KVM_ARCH_HOST_SCOUNTEREN)(a0)
> -
> -       /* Save Host SSCRATCH and change it to struct kvm_vcpu_arch pointer */
> -       csrrw   t3, CSR_SSCRATCH, a0
> -       REG_S   t3, (KVM_ARCH_HOST_SSCRATCH)(a0)
>
>         /* Save Host STVEC and change it to return path */
> -       la      t4, __kvm_switch_return
>         csrrw   t4, CSR_STVEC, t4
> -       REG_S   t4, (KVM_ARCH_HOST_STVEC)(a0)
> +
> +       /* Save Host SSCRATCH and change it to struct kvm_vcpu_arch pointer */
> +       csrrw   t3, CSR_SSCRATCH, a0
>
>         /* Restore Guest SEPC */
> -       REG_L   t0, (KVM_ARCH_GUEST_SEPC)(a0)
> -       csrw    CSR_SEPC, t0
> +       csrw    CSR_SEPC, t5
> +

Add a single line comment as follows:
/* Store Host CSR values */

> +       REG_S   t0, (KVM_ARCH_HOST_SSTATUS)(a0)
> +       REG_S   t1, (KVM_ARCH_HOST_HSTATUS)(a0)
> +       REG_S   t2, (KVM_ARCH_HOST_SCOUNTEREN)(a0)
> +       REG_S   t3, (KVM_ARCH_HOST_SSCRATCH)(a0)
> +       REG_S   t4, (KVM_ARCH_HOST_STVEC)(a0)
>
>         /* Restore Guest GPRs (except A0) */
>         REG_L   ra, (KVM_ARCH_GUEST_RA)(a0)
> @@ -144,35 +145,35 @@ __kvm_switch_return:
>         REG_S   t4, (KVM_ARCH_GUEST_T4)(a0)
>         REG_S   t5, (KVM_ARCH_GUEST_T5)(a0)
>         REG_S   t6, (KVM_ARCH_GUEST_T6)(a0)

Add a new line here.

Also add a single line comment as follows:
/* Load Host CSR values */

> +       REG_L   t1, (KVM_ARCH_HOST_STVEC)(a0)
> +       REG_L   t2, (KVM_ARCH_HOST_SSCRATCH)(a0)
> +       REG_L   t3, (KVM_ARCH_HOST_SCOUNTEREN)(a0)
> +       REG_L   t4, (KVM_ARCH_HOST_HSTATUS)(a0)
> +       REG_L   t5, (KVM_ARCH_HOST_SSTATUS)(a0)
>
>         /* Save Guest SEPC */
>         csrr    t0, CSR_SEPC
> -       REG_S   t0, (KVM_ARCH_GUEST_SEPC)(a0)
> -
> -       /* Restore Host STVEC */
> -       REG_L   t1, (KVM_ARCH_HOST_STVEC)(a0)
> -       csrw    CSR_STVEC, t1
>
>         /* Save Guest A0 and Restore Host SSCRATCH */
> -       REG_L   t2, (KVM_ARCH_HOST_SSCRATCH)(a0)
>         csrrw   t2, CSR_SSCRATCH, t2
> -       REG_S   t2, (KVM_ARCH_GUEST_A0)(a0)
> +
> +       /* Restore Host STVEC */
> +       csrw    CSR_STVEC, t1
>
>         /* Save Guest and Restore Host SCOUNTEREN */
> -       REG_L   t3, (KVM_ARCH_HOST_SCOUNTEREN)(a0)
>         csrrw   t3, CSR_SCOUNTEREN, t3
> -       REG_S   t3, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
>
>         /* Save Guest and Restore Host HSTATUS */
> -       REG_L   t4, (KVM_ARCH_HOST_HSTATUS)(a0)
>         csrrw   t4, CSR_HSTATUS, t4
> -       REG_S   t4, (KVM_ARCH_GUEST_HSTATUS)(a0)
>
>         /* Save Guest and Restore Host SSTATUS */
> -       REG_L   t5, (KVM_ARCH_HOST_SSTATUS)(a0)
>         csrrw   t5, CSR_SSTATUS, t5
> -       REG_S   t5, (KVM_ARCH_GUEST_SSTATUS)(a0)
>

Add a single line comment as follows:
/* Store Guest CSR values */

> +       REG_S   t0, (KVM_ARCH_GUEST_SEPC)(a0)
> +       REG_S   t2, (KVM_ARCH_GUEST_A0)(a0)
> +       REG_S   t3, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
> +       REG_S   t4, (KVM_ARCH_GUEST_HSTATUS)(a0)
> +       REG_S   t5, (KVM_ARCH_GUEST_SSTATUS)(a0)

Add new line here

>         /* Restore Host GPRs (except A0 and T0-T6) */
>         REG_L   ra, (KVM_ARCH_HOST_RA)(a0)
>         REG_L   sp, (KVM_ARCH_HOST_SP)(a0)
> --
> 2.17.1
>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
