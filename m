Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029EEC38142
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jan 2023 14:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VoV+gmkDhz6yPw6UlgBiPBNkrR2ZWU1YA39K+nVT+Yo=; b=1Ct8yKZ4Se32fR
	Z7KzHvEGxlFQhLnNS7/zF0cUgHk0kH5z5xyLIBT7rvRhMb/HwstSmymNPHfMIvwbGCeUBascCE00u
	F2mObfyS9Q/0QGSitfi+wmcyzjUrcntxn9GxXDi8l1moGhv4cr2Le7yzl3aYjPT3k8uIycIXjGc24
	BR0xd1MaHYCJrs+5f4Q+GHmuazy/4Td4+V1hscG4J/eHKgB/S7qzi+21LMka73DlgTcpou4sE5Ak9
	5QO66ooPqK7OZXsqrCLp7mdHaS4L6QGcNFUm8AMv8q6JagNZHS51WfVu51QtY/blooVCihQBnffQR
	0BBL2tYc51EALczBIavg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLmXc-000Il0-Cu; Sat, 28 Jan 2023 14:50:52 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLmXZ-000Ik3-Oo
	for linux-riscv@lists.infradead.org; Sat, 28 Jan 2023 14:50:51 +0000
Received: by mail-ed1-x533.google.com with SMTP id u21so7160827edv.3
        for <linux-riscv@lists.infradead.org>; Sat, 28 Jan 2023 06:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DBXSTbWOpbyF5+frNOEk/hH0Z+eGpJNPlrQ7g8wtf0A=;
        b=uUexcNfO30UjCbKwKx74Gql5Rmx8+ALCuoDRocqRbFMEtf44z9k+/xg21ePsEYmK8c
         2BkiSlNp/04fIILL5bIOwrFM1cKPrHD8aWAFQyMnI9JCvt/IwQ1HYAVLfZPXKiMegtFS
         mBxh9fmTmlx0mpAuGnNU5a/p5zZgeGhj/obdzu0vKSWnVAD1S2OBCxy18VJTOfW5fEkI
         QP5YN9ixsZ3LXMrj9IQkhWTBGPOgihIYbU4SH4erx3LAlrpaFnfT6V+xX0mCudfs1bex
         8GbmvOaDj/CjeVK7uPTXdV1rC71ygd/HQ000TH/Ls/QR5UnJnlhgZdxjgzhRnxlBYqnz
         Xu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DBXSTbWOpbyF5+frNOEk/hH0Z+eGpJNPlrQ7g8wtf0A=;
        b=p1CpXh2vOs1ut1SdgH0VsMsVaJlhCYg3tw/cl6eTxzNPYPgg5he0odfqEEogrnc9dt
         G3AY4KTU5mrEpUK8o5Y2gKu8XI6db/t2qWMAc6q3vbHT8kXdxtmhcr7fQiD3T+PJpUEI
         Edsopa9p7LVSNzo9uKpmrUD24lbTojxMnfyrvftMDzy3ZZHmiqnxIXGrLGY+Qdi2C5h8
         sH++ocGuwTJwIzHsqEr1ZZ+v+A4vq/1Kzzf6X6GlbEyyEPYW+8mcuQk0lsde9XXQifZ0
         O2BTTE6jy+16vIaRWlzLBzByMrssDNSuzHEhGCuguZlQ5oVEZwbbcOJAJLSJ2YUz53TI
         a5Xw==
X-Gm-Message-State: AFqh2kqH+5HWCKTCw4QajfsXVAIIdQ3s6YIBNfKx2nLqH6BFHZA0PcP0
	6fHiZffP7SRaMqxSyGK7kWmYas0wFfwpNTdYumumclKAjGxppw==
X-Google-Smtp-Source: AMrXdXtSWGV7otTK1SyQ3Ij49MHvVuSfLEnVU/bhRk6Fxe5rygpK3j2j9KrgO9F/Thb8es1Wg+EwZVYHecWfUWVoFbg=
X-Received: by 2002:a05:6402:378c:b0:49c:1316:d9d1 with SMTP id
 et12-20020a056402378c00b0049c1316d9d1mr7556998edb.12.1674917446995; Sat, 28
 Jan 2023 06:50:46 -0800 (PST)
MIME-Version: 1.0
References: <20230127182558.2416400-1-atishp@rivosinc.com> <20230127182558.2416400-5-atishp@rivosinc.com>
In-Reply-To: <20230127182558.2416400-5-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 28 Jan 2023 20:20:34 +0530
Message-ID: <CAAhSdy1MHE29vwTU1Tafo+g7fmi2JXznAUe5_pGv-boW0M8oFA@mail.gmail.com>
Subject: Re: [PATCH v3 04/14] RISC-V: KVM: Define a probe function for SBI
 extension data structures
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_065049_832608_84E02442 
X-CRM114-Status: GOOD (  21.06  )
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

On Fri, Jan 27, 2023 at 11:56 PM Atish Patra <atishp@rivosinc.com> wrote:
>
> Currently the probe function just checks if an SBI extension is
> registered or not. However, the extension may not want to advertise
> itself depending on some other condition.
> An additional extension specific probe function will allow
> extensions to decide if they want to be advertised to the caller or
> not. Any extension that does not require additional dependency checks
> can avoid implementing this function.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  3 +++
>  arch/riscv/kvm/vcpu_sbi_base.c        | 13 +++++++++++--
>  2 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> index f79478a..45ba341 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -29,6 +29,9 @@ struct kvm_vcpu_sbi_extension {
>         int (*handler)(struct kvm_vcpu *vcpu, struct kvm_run *run,
>                        unsigned long *out_val, struct kvm_cpu_trap *utrap,
>                        bool *exit);
> +
> +       /* Extension specific probe function */
> +       unsigned long (*probe)(struct kvm_vcpu *vcpu);
>  };
>
>  void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
> diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
> index 5d65c63..846d518 100644
> --- a/arch/riscv/kvm/vcpu_sbi_base.c
> +++ b/arch/riscv/kvm/vcpu_sbi_base.c
> @@ -19,6 +19,7 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  {
>         int ret = 0;
>         struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> +       const struct kvm_vcpu_sbi_extension *sbi_ext;
>
>         switch (cp->a6) {
>         case SBI_EXT_BASE_GET_SPEC_VERSION:
> @@ -43,8 +44,16 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>                          */
>                         kvm_riscv_vcpu_sbi_forward(vcpu, run);
>                         *exit = true;
> -               } else
> -                       *out_val = kvm_vcpu_sbi_find_ext(cp->a0) ? 1 : 0;
> +               } else {
> +                       sbi_ext = kvm_vcpu_sbi_find_ext(cp->a0);
> +                       if (sbi_ext) {
> +                               if (sbi_ext->probe)
> +                                       *out_val = sbi_ext->probe(vcpu);
> +                               else
> +                                       *out_val = 1;
> +                       } else
> +                               *out_val = 0;
> +               }
>                 break;
>         case SBI_EXT_BASE_GET_MVENDORID:
>                 *out_val = vcpu->arch.mvendorid;
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
