Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83937C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Feb 2022 06:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VOJJMkOrk3f2hEaXK9GZ02CbESk6lOgZ0Pkw6HggGCo=; b=TmmDuSpknqQm/m
	X8smF+vPZb4G7rUYtIUNSj7S4MFMurl3IsHuFIIUvHknbZTiQ0JACJ4dKlMpVkrancF2H+T+K5W4G
	cFg/ut1KGywkAIhhkhY7Y/D719GQxGHa66VhiJtNDj4pdRxiqNJbS54//4PMt8Q/4oe4j7kCF12vJ
	2CDTY8+96QeaiJ+zXO/KqGh4x96QDz98Gk9XFHUVel+OPL0iJI2hqOWPpBxSGKeju3SWoPiUCLL1W
	ziwfpmebfGdOo+fnu0EtC+HZk0d4BupurY2takbclt+AxQ7Gspi645CeI3/V/R7EOhjfQGPt67uRC
	pWz6aO7BDPitcLDF2auw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOZH7-00AreS-50; Mon, 28 Feb 2022 06:12:49 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOZH2-00Arcp-Jh
 for linux-riscv@lists.infradead.org; Mon, 28 Feb 2022 06:12:47 +0000
Received: by mail-wr1-x429.google.com with SMTP id j17so13730886wrc.0
 for <linux-riscv@lists.infradead.org>; Sun, 27 Feb 2022 22:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UTiVpcXiM5O91xNsHR8mz8u9ydShRouwdv9GiFOW0Qg=;
 b=eWXLeECA2cev8Z0/wKZ8soMHnEtMxgXztmHkzJYMmACObkoAlo+5cQPbFYmW9ZsFan
 zbRYao6oq5C8qeGXEQ+OtfWydm1YmAAXanJqJhErYy5NvpuQbwomx+1/awqURGkpCfsp
 bmPoEjhBrFMZ1eCaIJ9CHyDKkSgeAoDJOSczlic9o9hYpeSYW5qlFTrjWQ1Z3XPkHg6i
 Z1TcN+IQQiGgUJFywT5/DfR6t4olClh1fdAlJZYBidyIWKvDi0lHGVfYyE+sQdVE4EkP
 duS8FbzxGcGgWQYrmNGR1G6z9sK3jfsUPyNWsJFWdF97e5myRsUzGQFFmgY+KcLTiu+l
 AgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UTiVpcXiM5O91xNsHR8mz8u9ydShRouwdv9GiFOW0Qg=;
 b=pzEReXyMKNnnGanp9wSn47fkBnnYdwqi6IGWFv2dnQOLd+uqUteNNEJoNyN/t4pRy8
 HubFxeyi9K07mqvx+V2Nx/j9frr8BHLC97viZhiQlMxWYjHd7EdryjFPS0tWLM9+XgjX
 K2BHD9Cs8r9dyl5qVFm+zC4lUn+i5dfyu6kmfQUuz2FJ7JHWbz7rF/pKlumHoYGLMlNc
 /1l3ZsFCbaKYGGsysYYiR1vUS9Ezx9U+AzHRnF3jJc1LJ4FQjgum4YMKj2BIhIjtkw06
 wOy5TM/s755cg+ZKHuH4uNnIgdjjD5VqPZ/9+LIZ+A0Os8h7Gf94D7T/bMuDc7nhOg/r
 K+UA==
X-Gm-Message-State: AOAM530gxB1cjhX20N8pMwKSrrSIxtUq/+DW8vSc7/99TzzZqHqewfaC
 IXsAYethRtu0n3+H2wTTEhfQTdrOvlFsBs/JlKEk1g==
X-Google-Smtp-Source: ABdhPJxxWZWmarr7RiVY7BMCsHrzVwCGLEYLntR4Jau7u3lU4nYE31O0ie3Slb3QA8LqjUx8/qX31TT5oT1MytRsc9w=
X-Received: by 2002:adf:b645:0:b0:1e3:bab:7594 with SMTP id
 i5-20020adfb645000000b001e30bab7594mr14574836wre.346.1646028761536; Sun, 27
 Feb 2022 22:12:41 -0800 (PST)
MIME-Version: 1.0
References: <20220223011331.12254-1-vincent.chen@sifive.com>
In-Reply-To: <20220223011331.12254-1-vincent.chen@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Feb 2022 11:42:30 +0530
Message-ID: <CAAhSdy32PmqoJcYJ--k5qX2nLUQW34Q9qeEfwPSf1HQ+dPDAmw@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Refine __kvm_riscv_switch_to()
 implementation
To: Vincent Chen <vincent.chen@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>, kvm-riscv@lists.infradead.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, fu-ching.yang@sifive.com, 
 hsinyi.lee@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220227_221244_749876_520443C9 
X-CRM114-Status: GOOD (  15.95  )
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

On Wed, Feb 23, 2022 at 6:43 AM Vincent Chen <vincent.chen@sifive.com> wrote:
>
> Kernel uses __kvm_riscv_switch_to() and __kvm_switch_return() to switch
> the context of host kernel and guest kernel. Several CSRs belonging to the
> context will be read and written during the context switch. To ensure
> atomic read-modify-write control of CSR and ordering of CSR accesses, some
> hardware blocks flush the pipeline when writing a CSR. In this
> circumstance, grouping CSR executions together as much as possible can
> reduce the performance impact of the pipeline. Therefore, this commit
> reorders the CSR instructions to enhance the context switch performance..
>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Suggested-by: Hsinyi Lee <hsinyi.lee@sifive.com>
> Suggested-by: Fu-Ching Yang <fu-ching.yang@sifive.com>

I have queued this patch for 5.18

Thanks,
Anup

> ---
>  arch/riscv/kvm/vcpu_switch.S | 60 ++++++++++++++++++++----------------
>  1 file changed, 34 insertions(+), 26 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu_switch.S b/arch/riscv/kvm/vcpu_switch.S
> index 029a28a195c6..d74df8eb4d71 100644
> --- a/arch/riscv/kvm/vcpu_switch.S
> +++ b/arch/riscv/kvm/vcpu_switch.S
> @@ -41,33 +41,37 @@ ENTRY(__kvm_riscv_switch_to)
>         REG_S   s10, (KVM_ARCH_HOST_S10)(a0)
>         REG_S   s11, (KVM_ARCH_HOST_S11)(a0)
>
> -       /* Save Host and Restore Guest SSTATUS */
> +       /* Load Guest CSR values */
>         REG_L   t0, (KVM_ARCH_GUEST_SSTATUS)(a0)
> +       REG_L   t1, (KVM_ARCH_GUEST_HSTATUS)(a0)
> +       REG_L   t2, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
> +       la      t4, __kvm_switch_return
> +       REG_L   t5, (KVM_ARCH_GUEST_SEPC)(a0)
> +
> +       /* Save Host and Restore Guest SSTATUS */
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
> +       /* Store Host CSR values */
> +       REG_S   t0, (KVM_ARCH_HOST_SSTATUS)(a0)
> +       REG_S   t1, (KVM_ARCH_HOST_HSTATUS)(a0)
> +       REG_S   t2, (KVM_ARCH_HOST_SCOUNTEREN)(a0)
> +       REG_S   t3, (KVM_ARCH_HOST_SSCRATCH)(a0)
> +       REG_S   t4, (KVM_ARCH_HOST_STVEC)(a0)
>
>         /* Restore Guest GPRs (except A0) */
>         REG_L   ra, (KVM_ARCH_GUEST_RA)(a0)
> @@ -145,32 +149,36 @@ __kvm_switch_return:
>         REG_S   t5, (KVM_ARCH_GUEST_T5)(a0)
>         REG_S   t6, (KVM_ARCH_GUEST_T6)(a0)
>
> +       /* Load Host CSR values */
> +       REG_L   t1, (KVM_ARCH_HOST_STVEC)(a0)
> +       REG_L   t2, (KVM_ARCH_HOST_SSCRATCH)(a0)
> +       REG_L   t3, (KVM_ARCH_HOST_SCOUNTEREN)(a0)
> +       REG_L   t4, (KVM_ARCH_HOST_HSTATUS)(a0)
> +       REG_L   t5, (KVM_ARCH_HOST_SSTATUS)(a0)
> +
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
> +
> +       /* Store Guest CSR values */
> +       REG_S   t0, (KVM_ARCH_GUEST_SEPC)(a0)
> +       REG_S   t2, (KVM_ARCH_GUEST_A0)(a0)
> +       REG_S   t3, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
> +       REG_S   t4, (KVM_ARCH_GUEST_HSTATUS)(a0)
>         REG_S   t5, (KVM_ARCH_GUEST_SSTATUS)(a0)
>
>         /* Restore Host GPRs (except A0 and T0-T6) */
> --
> 2.17.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
