Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734CBC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 03:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LrP8FVsbgWgeY9Qb/CV4SWfVRyKcUO4p+cDraN2jnZM=; b=fcK+Jm/5/UZkHT
	wI60vVbFQxpGReYcVfntslNgVhFBE9B4iWoapehJnTneexqMkQR2YBewXsLuuPWwPnb8iuz3Uz/T+
	JcRl7OdcAytvjhfNLKNVc23346kEZdmRTE668t9+lZ8Eqhli0B1+5DEPSILaINmBibBjj09sNJSSc
	7jHC5zQWZRdHlYPV9qUHTZzy92UmxR91thWfW7quGNRJb64f4RLdYl3HEUdkyVtueBpLzIFolXkGO
	h1Ez4WvY+FO99f8kkukFOQP6NIUtJ50pWRWLfX81eKKVOnNkRiQGuriAf2Z1P62DG6w9Los4C4sUt
	3TzDFv+5MAwHuHW3d0QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMiSw-00CYFG-NS; Wed, 23 Feb 2022 03:37:22 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMiSp-00CYDM-MC
 for linux-riscv@lists.infradead.org; Wed, 23 Feb 2022 03:37:20 +0000
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2d6923bca1aso187984567b3.9
 for <linux-riscv@lists.infradead.org>; Tue, 22 Feb 2022 19:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x/iZxI5gJtmmVE2EU9ERKSSqKXLjBqX4XWhFsi12fm4=;
 b=iMqGMltcaywF4JIrOBiSfBrO1ZiTpm42kZ8q96IXPD5P8wyMFaebGsFazuGUrLW8/M
 saOIHcsTHJlWkpFpUC6TbGA3KpXDYMQZm0eKYNi8Cmc0lEjYhTvC4/QLjpIVxgiIgYFH
 6d5BR6Wkf9oa82BMhVEKs8uf98U5ebixJldT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x/iZxI5gJtmmVE2EU9ERKSSqKXLjBqX4XWhFsi12fm4=;
 b=t5ESBQCtrRdM7sTtS2K+1QT350dbvlMgl9qdf+Z7Gw2OPPCn+YvbZYCBKKoW46nJX1
 eHOxp6YCxHatWDmN2XF9ZuCR2jCYXaCBtrbGQdFZPhX1ERCLeeHWeRNJV4EzD1ODFJXZ
 WOp1s5l1Td79pBMRvjT3xlP4Qf2OWdEOdzMCGnkp+hcfxEVdqq3yOR8UbW49+HnAGkdd
 vvananwXLCk9DPfRb6yu76TWlzRXofNeDYGpAH0blwZwbPkyI68u+MB5WQhHj41ffmrE
 XgnaHUb+utWVDKfjCK8z9HOPA8kyxGfUP+hG06F+BLGlkUwHPMyyFRZ+lg2X4RoiEN0V
 5Q6A==
X-Gm-Message-State: AOAM531v4sgX4+r7oXCrZyNrW9SxAw7QpB9Ipvj8aZfgEKrsCb73C54l
 uYznaN8Fb44dm865OP+FrEHUqqlZybMY9q00SAsy
X-Google-Smtp-Source: ABdhPJwqkv4mz6cACdKoD4/liTLQr04AC/Mb4V7+BAD2dA4iqOmCk161chEgGlKc//pVQVvyiNh6L9G7xcUCR8QN460=
X-Received: by 2002:a81:844c:0:b0:2d6:920b:f959 with SMTP id
 u73-20020a81844c000000b002d6920bf959mr26893176ywf.443.1645587434737; Tue, 22
 Feb 2022 19:37:14 -0800 (PST)
MIME-Version: 1.0
References: <20220201082227.361967-1-apatel@ventanamicro.com>
 <20220201082227.361967-7-apatel@ventanamicro.com>
In-Reply-To: <20220201082227.361967-7-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 22 Feb 2022 19:37:04 -0800
Message-ID: <CAOnJCUJ_13oZqLhmcwO4tx+OsnL1YdR-y_FyNAmd=_+9rGAFLw@mail.gmail.com>
Subject: Re: [PATCH 6/6] RISC-V: KVM: Implement SBI HSM suspend call
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, 
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_193715_795301_E47C6D55 
X-CRM114-Status: GOOD (  15.41  )
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
> The SBI v0.3 specification extends SBI HSM extension by adding SBI HSM
> suspend call and related HART states. This patch extends the KVM RISC-V
> HSM implementation to provide KVM guest a minimal SBI HSM suspend call
> which is equivalent to a WFI instruction.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu_sbi_hsm.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
> index 1ac4b2e8e4ec..239dec0a628a 100644
> --- a/arch/riscv/kvm/vcpu_sbi_hsm.c
> +++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
> @@ -61,6 +61,8 @@ static int kvm_sbi_hsm_vcpu_get_status(struct kvm_vcpu *vcpu)
>                 return -EINVAL;
>         if (!target_vcpu->arch.power_off)
>                 return SBI_HSM_STATE_STARTED;
> +       else if (vcpu->stat.generic.blocking)
> +               return SBI_HSM_STATE_SUSPENDED;
>         else
>                 return SBI_HSM_STATE_STOPPED;
>  }
> @@ -91,6 +93,18 @@ static int kvm_sbi_ext_hsm_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>                         ret = 0;
>                 }
>                 break;
> +       case SBI_EXT_HSM_HART_SUSPEND:
> +               switch (cp->a0) {
> +               case SBI_HSM_SUSPEND_RET_DEFAULT:
> +                       kvm_riscv_vcpu_wfi(vcpu);
> +                       break;
> +               case SBI_HSM_SUSPEND_NON_RET_DEFAULT:
> +                       ret = -EOPNOTSUPP;
> +                       break;
> +               default:
> +                       ret = -EINVAL;
> +               }
> +               break;
>         default:
>                 ret = -EOPNOTSUPP;
>         }
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
