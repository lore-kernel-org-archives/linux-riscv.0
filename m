Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5654AC61DB3
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 18:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6e3EN2mX+LZWuucqYMxELZm7W/gH5kodTZ9oKgnbcaM=; b=iPOT6WcCWGsB/a
	LGzD1sFF6TTm/T6PzstHDcf0IvhevPZMCU64AG8Q7cOMPq2hFHvS8jty3FRxnIhNEONufUUd7BSvl
	8ddxWZUxXjlqDJ14Kb+E6ZJMTvdkQoS2RNXixYfS8vYMkcCAua2tvHFM2/s2P6w8W/n1E17HfuShp
	ZYEyJRIyWPE1bcf8tzFxXBcIyZqAEMIA8mA8u8Q5FrnyK7ykDQVU1X3uUt6NiYJFhVbr9akiz41Nd
	CiuFACVWf1Gck5BW6mD06F2CHH6d9vJnrYLJODHblM3O2idRR1f/Emk2uktt9LQVCm/LvqDhk4QDi
	kVvxFDgRJnfKAwXlVHEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG2GS-00GITm-HX; Thu, 12 Jan 2023 18:25:24 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG2GP-00GIS6-Be
	for linux-riscv@lists.infradead.org; Thu, 12 Jan 2023 18:25:22 +0000
Received: by mail-pf1-x429.google.com with SMTP id g20so14423859pfb.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jan 2023 10:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wdJjNMR8HoaXn9/oJmxLSyIdwmRRw8E6OKveZFE7S0o=;
        b=oF+dydPOzLUV6gm4IhZPy0ytIJCP75Hu4akx7+XbCZvo4om5HhS0f6mJ4n/K7276Un
         amkhxNx8AaLMjji0vPkssaD8xMJ58T2+hwuFVwOWnvCKRDqJo5f887je41pc1p3jd6sS
         /wALf4JB3cR96/2BEXXlBKLL3rid+e94peWAraxVVF1BrcrbgkHer2gutrf0Sp5py5o0
         zV1oZ1GAvU6ICcKFXa7a2KInbBN/lNBmpoX+WkdL9/1ahzxMIXHXLY0UePgT5pTXpN0i
         tStu6VFSnY6yx6ikuU6Q1oW6/uuCDwnHo+09soFPALkFgJq9UZWDoxmm9nvQ03nG0bpM
         txtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wdJjNMR8HoaXn9/oJmxLSyIdwmRRw8E6OKveZFE7S0o=;
        b=hRjbSBb8WJO/HVXhCUCzU/rVeuzrTHLlj7ttYJmf1BMpTW5mSc1dLMMcsR+We/EFel
         EsSup28goJLcMwRdIxzAlw23yXxaDArKObFcpKZgiZySTW0zOQSGrzE4O+X5DTu1mbqe
         9oN3Ig+QeDR/tbczKkXY0qw3vzTsvsTP4CEVOYiATe2PbtZpRU+L+xeH2BjiQ6wedh62
         M1HiSmwm4DvFK+isnSLoVkf6aKmjxeyKNNPoLwb9E23UI6Obr+O8aCx7f9kNQ4qfFQbb
         yMaxkv1CZ7+zseEyjLnhIkGMs0U6i2O2JU+Mb9tRjB9s11Q6Siyjf5BwAx6lhiL8Wuit
         dZtA==
X-Gm-Message-State: AFqh2koDpG5DANTEJTGOyf9OCmUU13OmTQ61BSZ8KvUdfYbH7fBRvJvx
	ARLn46Z28V2SWAPQugJeVZDhrgopCDupo2Xp9QFxCjwZ0ATzxdfr
X-Google-Smtp-Source: AMrXdXsx35UN6HQZXy9TboGur74n9jMc/+z2he86i6ImOAdpx6biI35utBvv3jLg1hykCHRZ3SrlfMNRJ1rrL/K2XSA=
X-Received: by 2002:a63:d902:0:b0:490:597e:1c0a with SMTP id
 r2-20020a63d902000000b00490597e1c0amr3600920pgg.309.1673547917553; Thu, 12
 Jan 2023 10:25:17 -0800 (PST)
MIME-Version: 1.0
References: <20221215170046.2010255-1-atishp@rivosinc.com> <20221215170046.2010255-4-atishp@rivosinc.com>
 <20230112102839.rsabb2bah5lkkx4e@orel>
In-Reply-To: <20230112102839.rsabb2bah5lkkx4e@orel>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Thu, 12 Jan 2023 10:25:06 -0800
Message-ID: <CAHBxVyFokVx0C+a8LvYrftE=JwuDAHgPRmhMQFtV9LHGqMuJgA@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] RISC-V: KVM: Return correct code for hsm stop function
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, 
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Eric Lin <eric.lin@sifive.com>, 
	Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_102521_404888_68AB1861 
X-CRM114-Status: GOOD (  22.39  )
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

On Thu, Jan 12, 2023 at 2:28 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Thu, Dec 15, 2022 at 09:00:38AM -0800, Atish Patra wrote:
> > According to the SBI specification, the stop function can only
> > return error code SBI_ERR_FAILED. However, currently it returns
> > -EINVAL which will be mapped SBI_ERR_INVALID_PARAM.
>
> I presume the mapping referred to here is kvm_linux_err_map_sbi().
> If so, then -EPERM isn't correct either. That maps to SBI_ERR_DENIED.
> The only thing that will ensure we get SBI_ERR_FAILURE (-1) is
> anything not handled by the kvm_linux_err_map_sbi switch, as we
> need to use the default.
>

It returns SBI_ERR_FAILURE in the next patch when kvm_linux_err_map_sbi
is removed. Maybe I should drop this patch. The next patch does the
correct thing anyways.

> Thanks,
> drew
>
> >
> > Return the appropriate linux error code.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  arch/riscv/kvm/vcpu_sbi_hsm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
> > index 2e915ca..0f8d9fe 100644
> > --- a/arch/riscv/kvm/vcpu_sbi_hsm.c
> > +++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
> > @@ -42,7 +42,7 @@ static int kvm_sbi_hsm_vcpu_start(struct kvm_vcpu *vcpu)
> >  static int kvm_sbi_hsm_vcpu_stop(struct kvm_vcpu *vcpu)
> >  {
> >       if (vcpu->arch.power_off)
> > -             return -EINVAL;
> > +             return -EPERM;
> >
> >       kvm_riscv_vcpu_power_off(vcpu);
> >
> > --
> > 2.25.1
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
