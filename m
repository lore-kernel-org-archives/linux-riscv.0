Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E019CC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  4 May 2022 02:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pOEYiVqBvn3izn4vRpDUpPwlNn6nePISinktu+KoKwE=; b=tLt2VExipizO9z
	t2bQmr17imubYcYy13qHSVq+jTosNSdfpnErNtsJYOp85eDfP1nLilDr8o5FRBLuJ03cWo8KQZIMU
	c5527qC+Qbps2pAoRdzGJ8EiuOWWBumIagsxfRgT2RoxLjCdTRkRw+bp6ElGrNOSpyEzKYhwF5sk8
	QS63xbjtecnL+I/Ie7MtOEc2OQYm9lY8D69ci7FXcLvp5Ix6YY4lwJlWViGg1GrzBUAW/cX6UXExw
	t2ku0NloxhXsMdJfTrZ1PRrbF0RZGOOYzVoD9xuyqdlEV+P5wNWLdiEO/8qHHj6h3eZbVDr3BtxdN
	3/m8cTQTPF3JU+31wYNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm4YI-008Qdr-Lt; Wed, 04 May 2022 02:15:42 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm4YF-008Qa7-UY
 for linux-riscv@lists.infradead.org; Wed, 04 May 2022 02:15:41 +0000
Received: by mail-yb1-xb32.google.com with SMTP id i38so158811ybj.13
 for <linux-riscv@lists.infradead.org>; Tue, 03 May 2022 19:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c5B5hkcsMKdDxIP0ityCzhRmvMG1VC+HFykgkdqu09U=;
 b=SZfd803uo15kK66O/NlAk5XNFnbID7ZOAD3KZPSJujtLzKFGMVvU6o5VPAlUvxyn+3
 NMFa1yCnfttudlWnJWcoXZABDL3Jeyan6z9d1fBaAr/qznMS/ktE4+xvkpw4I5OqKBWd
 fBN1mc/S654rSyP51bV1T035KI5ONmgovVvrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c5B5hkcsMKdDxIP0ityCzhRmvMG1VC+HFykgkdqu09U=;
 b=XVMogj9CHQtAkPfON6WYa66hfE5mt+FMgRmu+Hf/ITIpgfpz3MMZpSaJEE6+EajCtE
 zwND8lVtpqVJknEsXn1dHPn48FnStx4+1k2mk/ZUt3TWF1JN00f1Op9ciniFnOto0x+a
 eEJiTlj0taKsVFN+hOsj6u9GkstFEDLvz52ek0VwSmBXBEbM4cGb/4RxWT7FkgEG0qQh
 dfJB+Tqghq9BrfjeuCeE9ttRWzYTXS0hMWND8nEvxaovC2VGidI7j6DdysWr0Uemgyls
 OP8x1ClGFEVv5j06EJCgQaRjonf1TPlA5/KZBRIY+3+odUtPJZb8tfudm4e8uNpl3urp
 zOyQ==
X-Gm-Message-State: AOAM532t5/eYJips8BNnPuGPYxJP78yGyC9PgR0Hqmww2vQBa6sggF//
 UKY5teh73GRHKhjG/NN8l2Kdp6QBlVxK3VQ3zOM8
X-Google-Smtp-Source: ABdhPJzzW0cIF1J0ZWV6KCLxVfMG8MOvXPpwHtk2SUtqsQQxYUN8p+PNE8DoWlFM3bD79C4kiVsszGg1ntn5lWE6FaI=
X-Received: by 2002:a25:32d3:0:b0:648:5929:845f with SMTP id
 y202-20020a2532d3000000b006485929845fmr15443858yby.53.1651630530878; Tue, 03
 May 2022 19:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220420112450.155624-1-apatel@ventanamicro.com>
 <20220420112450.155624-6-apatel@ventanamicro.com>
In-Reply-To: <20220420112450.155624-6-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 3 May 2022 19:15:20 -0700
Message-ID: <CAOnJCU+yd7hqauHRYwnPqNKEgfy5FK06ezR64aH0Hm2AcNNadw@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] RISC-V: KVM: Reduce KVM_MAX_VCPUS value
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Anup Patel <anup@brainfault.org>, KVM General <kvm@vger.kernel.org>,
 kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_191540_035402_2F0C6D09 
X-CRM114-Status: GOOD (  15.92  )
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
> Currently, the KVM_MAX_VCPUS value is 16384 for RV64 and 128
> for RV32.
>
> The KVM_MAX_VCPUS value is too high for RV64 and too low for
> RV32 compared to other architectures (e.g. x86 sets it to 1024
> and ARM64 sets it to 512). The too high value of KVM_MAX_VCPUS
> on RV64 also leads to VCPU mask on stack consuming 2KB.
>
> We set KVM_MAX_VCPUS to 1024 for both RV64 and RV32 to be
> aligned other architectures.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_host.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index 806f74dc0bfc..61d8b40e3d82 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -16,8 +16,7 @@
>  #include <asm/kvm_vcpu_fp.h>
>  #include <asm/kvm_vcpu_timer.h>
>
> -#define KVM_MAX_VCPUS                  \
> -       ((HGATP_VMID_MASK >> HGATP_VMID_SHIFT) + 1)
> +#define KVM_MAX_VCPUS                  1024
>
>  #define KVM_HALT_POLL_NS_DEFAULT       500000
>
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
