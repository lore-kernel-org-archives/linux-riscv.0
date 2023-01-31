Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437D1C38142
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 09:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aV5GgvyLxwB9H5Kb+Cj1HSEtxFkSGGkoBWcnKI+zvUk=; b=yQ25Q5X3PVHVmD
	1U5Bkp4GZPC8NEOoHMSQl5cSfDYje7uBVC96xOpWIjv+PddbGpf0uRl68I7MopGE8rbigrMYlmziD
	VAcvztGiLRkDkdVeRBJya1SZmkPQ2JwBlrixIRyegb0IGwWyPlS6EE8hAZMz+n/0pZ1bv/kgBgzH/
	3HdhQer4CoyO3DuBvFskDCk9gTZ06OggVZKBPDxOzFyNItq5kPAEqk7aQAIFWt8EQEVkpkpRgnljm
	CHGWB1F+C0BmDRpni8ptcTCil4jSYnc1yhqrH5VECD7hDYZBB2C+z4YnPJGO47XTvairmK57fwPxi
	nnIBRHflFjrVbvhd3v9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMmwc-00701W-NC; Tue, 31 Jan 2023 09:28:50 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMmvo-006zWS-TI
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 09:28:02 +0000
Received: by mail-pj1-x1029.google.com with SMTP id c10-20020a17090a1d0a00b0022e63a94799so3469413pjd.2
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 01:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cRicPiuaBpPdTHFzOhiCezQ5GuYSGllcRPaK1dz/uvE=;
        b=b68LiQHhWG3BL76DPGqfQQR8n8lH8MhamuMSFuRccumQrqSxrFcpNzdHuWE0ZrmaOj
         85t7w84ieF8VtgWrBMU3b93HPfiZRrsIzU6QEDBpWc3JT9ufUkERMQdZqInh/l18wd7n
         TXnnQ3LerHMIrQesfDzvyGDIPEEXsmufdJmro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cRicPiuaBpPdTHFzOhiCezQ5GuYSGllcRPaK1dz/uvE=;
        b=oAu6tX9+uqkB3fkqS8+KEBH0JTEMQ//6gT3Pts0poQLNhHvFI3n2g0tIdQGR9LvFYI
         RuObgatmIh4yJVtcGcwXiGJrUiQyvDh29jz5ReL2qFmMaH1SJNc5WTL/dPxRtRvMVif1
         ZkPwVfQUDmDzkPjBR5Z6bOSjBogqKhfAIrUplwtKfKZH/6AfOyCDee+/qiUpD+yN55rh
         Ndo/tncLhBUZqQJenraTSkigOkx7zT4pVkuzzS7J3liS65Eyv507oZbPttV8hW8pYRf2
         nrvw3UFeLkOKc6YtkN8eaYX81jp6zaYU81SffI7lKbEEWfPOXGZP656yqcNioJRhmlhd
         DD9Q==
X-Gm-Message-State: AFqh2kqCb7dEekvcClZXWKqD0MyCCMneVh9CqK2rnMMCpyxf77KLGxuW
	3z+L6V9JgSQWv21Sbw2XZ1mHmtcyeMFp4i1Givak
X-Google-Smtp-Source: AMrXdXuqJZe71wMHsvHQa+/ofcNqzAcOCHpQvFAoA3yjOjAFaR3HQs3cLMhLk6QI5qrARLILCxRb9Lw/BmeYIUF58Rg=
X-Received: by 2002:a17:902:8f8a:b0:193:794:ba9 with SMTP id
 z10-20020a1709028f8a00b0019307940ba9mr6658889plo.22.1675157280064; Tue, 31
 Jan 2023 01:28:00 -0800 (PST)
MIME-Version: 1.0
References: <20230128072737.2995881-1-apatel@ventanamicro.com> <20230128072737.2995881-4-apatel@ventanamicro.com>
In-Reply-To: <20230128072737.2995881-4-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 31 Jan 2023 01:27:48 -0800
Message-ID: <CAOnJCUKDYkJz0RNEYnPFrSax7e8cATvqYTXwPA+58Y8zVqEZCQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] RISC-V: KVM: Drop the _MASK suffix from hgatp.VMID
 mask defines
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_012800_981597_AD3C577A 
X-CRM114-Status: GOOD (  17.55  )
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

On Fri, Jan 27, 2023 at 11:28 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The hgatp.VMID mask defines are used before shifting when extracting
> VMID value from hgatp CSR value so based on the convention followed
> in the other parts of asm/csr.h, the hgatp.VMID mask defines should
> not have a _MASK suffix.
>
> While we are here, let's use GENMASK() for hgatp.VMID and hgatp.PPN.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/csr.h | 12 ++++++------
>  arch/riscv/kvm/mmu.c         |  3 +--
>  arch/riscv/kvm/vmid.c        |  4 ++--
>  3 files changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 3c8d68152bce..3176355cf4e9 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -131,25 +131,25 @@
>
>  #define HGATP32_MODE_SHIFT     31
>  #define HGATP32_VMID_SHIFT     22
> -#define HGATP32_VMID_MASK      _AC(0x1FC00000, UL)
> -#define HGATP32_PPN            _AC(0x003FFFFF, UL)
> +#define HGATP32_VMID           GENMASK(28, 22)
> +#define HGATP32_PPN            GENMASK(21, 0)
>
>  #define HGATP64_MODE_SHIFT     60
>  #define HGATP64_VMID_SHIFT     44
> -#define HGATP64_VMID_MASK      _AC(0x03FFF00000000000, UL)
> -#define HGATP64_PPN            _AC(0x00000FFFFFFFFFFF, UL)
> +#define HGATP64_VMID           GENMASK(57, 44)
> +#define HGATP64_PPN            GENMASK(43, 0)
>
>  #define HGATP_PAGE_SHIFT       12
>
>  #ifdef CONFIG_64BIT
>  #define HGATP_PPN              HGATP64_PPN
>  #define HGATP_VMID_SHIFT       HGATP64_VMID_SHIFT
> -#define HGATP_VMID_MASK                HGATP64_VMID_MASK
> +#define HGATP_VMID             HGATP64_VMID
>  #define HGATP_MODE_SHIFT       HGATP64_MODE_SHIFT
>  #else
>  #define HGATP_PPN              HGATP32_PPN
>  #define HGATP_VMID_SHIFT       HGATP32_VMID_SHIFT
> -#define HGATP_VMID_MASK                HGATP32_VMID_MASK
> +#define HGATP_VMID             HGATP32_VMID
>  #define HGATP_MODE_SHIFT       HGATP32_MODE_SHIFT
>  #endif
>
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index dbc4ca060174..829a7065ae01 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -748,8 +748,7 @@ void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu)
>         unsigned long hgatp = gstage_mode;
>         struct kvm_arch *k = &vcpu->kvm->arch;
>
> -       hgatp |= (READ_ONCE(k->vmid.vmid) << HGATP_VMID_SHIFT) &
> -                HGATP_VMID_MASK;
> +       hgatp |= (READ_ONCE(k->vmid.vmid) << HGATP_VMID_SHIFT) & HGATP_VMID;
>         hgatp |= (k->pgd_phys >> PAGE_SHIFT) & HGATP_PPN;
>
>         csr_write(CSR_HGATP, hgatp);
> diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
> index 6cd93995fb65..6f4d4979a759 100644
> --- a/arch/riscv/kvm/vmid.c
> +++ b/arch/riscv/kvm/vmid.c
> @@ -26,9 +26,9 @@ void kvm_riscv_gstage_vmid_detect(void)
>
>         /* Figure-out number of VMID bits in HW */
>         old = csr_read(CSR_HGATP);
> -       csr_write(CSR_HGATP, old | HGATP_VMID_MASK);
> +       csr_write(CSR_HGATP, old | HGATP_VMID);
>         vmid_bits = csr_read(CSR_HGATP);
> -       vmid_bits = (vmid_bits & HGATP_VMID_MASK) >> HGATP_VMID_SHIFT;
> +       vmid_bits = (vmid_bits & HGATP_VMID) >> HGATP_VMID_SHIFT;
>         vmid_bits = fls_long(vmid_bits);
>         csr_write(CSR_HGATP, old);
>
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
