Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F43C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 11:25:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B14560E9C
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 11:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B14560E9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=imG0OTID2jYMYJYjDO26g1krlGpDauxHswTp6vRTPkU=; b=SKo0gOduC4v9m0
	Es/xuSvKtnPFemPUq6QvUesrwRg+U36Z8nQMHM//aypp7auDLnIVHJ1pNsfELdoQcn2Hh7GcqEufH
	ofpml4Dk9kjZv7mntaGsxMruJId+RXKGdZT0uA2zR5RyLkk5rjUTUGzfiGf8uRDdjCjda1Eqml9gZ
	otMxqyN4y8XTaWBtCZtOUHXeAbYkr/M7PbY3gQGZvyTBLTe849rM13CbiE1lpauEeGom1bPGTiMY0
	AO4DI8fmOb5I4JlB6/7jrkjWxoBiSqA2jf58N5aqBOUb47lw/DHYKJgBM3NnAYt5Be7wFQLZHeg5f
	PXrGNfg6Jqzu+d62Lmmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdWBl-007L32-92; Thu, 21 Oct 2021 11:24:49 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdWBi-007L12-6T
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 11:24:47 +0000
Received: by mail-wr1-x42c.google.com with SMTP id g25so578808wrb.2
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 04:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=823GhYmXbttbJwIVURhuPlV/kHfvN4T6Ehf+eMAd4qg=;
 b=nfEfrSbCk1e42MxpttkQclQWIW+uGKdG0+QuvEJZcTOkz8qazuzf5znHkZAPhC2hU8
 fsZmSzj21VYm0rLGPCAQsri62ycKeT1JWBOvqxD0LDbgmXKOJr9z3EdntJiRNDUdYrqH
 4NFYkpq6ejFL8fDyiwRe932cdHINEFAe4B2BpWxcEFPZIb1T+VmZFn+vtnX1+h1PfFtC
 Wt7h/3irpBfE4hMC6yezfWvv6EHZms1tONuiAwHoC7vpOXD4zyJ1ht7+5GXJ+Hcgco9S
 cSOMGqXn6Sfr0iCGs+0KqHThxqQAjfZoix70tBXFaULNLMNWlETPB+BY7s6BBmDMFCjP
 F8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=823GhYmXbttbJwIVURhuPlV/kHfvN4T6Ehf+eMAd4qg=;
 b=YC6UcJNqgZIgKeaZG46AGkYPZF8/u2JA5WqaCpsH0PNg+OmBrDIkMbu9sVPBFqcb2F
 0CxZEmd/sO5heqVfSFHwc7nfq389TFjs+p4/46/d5xgKr7RKVjKZKIl/rAHF2n/yCZ0+
 z6ndu8pd02ZSGc3OWvpEWVHmBzvNJwxRnAWNPvQD7p3SHTdy8zayTgbsNbzgeDOECA9Q
 VChI2roduo8+zTMq/9RUOSOyf6KEeKQ25oG5YMdK6piQ4qjyQ06bTx1OCyiIDt5xqVtC
 J55u2NtL8nfISlaob0yCk1ypLWCexEz6k4LyGPKmoO5QNZA6la5PWBBvxJbz28/KJZvn
 5NGQ==
X-Gm-Message-State: AOAM532+KTxNANPn83chDtr2noKc/wHSCDzpLhkURHsmeIKG4a9w+Y7I
 t2bAU6iKAcXJjEKhwkQDsteVymc0aoQruHh1pYZuHw==
X-Google-Smtp-Source: ABdhPJw4/zb4/niggRe0zyZ/ENXV882FAHY78FWAaLNgfY/JPNI0A5fpTNtqBvIEMMQ4TnCeIIlENOKE9MKEK0amVZ4=
X-Received: by 2002:adf:e60a:: with SMTP id p10mr6498325wrm.306.1634815482401; 
 Thu, 21 Oct 2021 04:24:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211021104536.1060107-1-ran.jianping@zte.com.cn>
In-Reply-To: <20211021104536.1060107-1-ran.jianping@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 21 Oct 2021 16:54:29 +0530
Message-ID: <CAAhSdy3DWOux6HiDU6fPazZUq=FOor8_ZEoqh6FBZru07NyxLQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V:KVM: remove unneeded semicolon Elimate the
 following coccinelle check warning: ./arch/riscv/kvm/vcpu_sbi.c:169:2-3:
 Unneeded semicolon ./arch/riscv/kvm/vcpu_exit.c:397:2-3: Unneeded semicolon
 ./arch/riscv/kvm/vcpu_exit.c:687:2-3: Unneeded semicolon
 ./arch/riscv/kvm/vcpu_exit.c:645:2-3:
 Unneeded semicolon ./arch/riscv/kvm/vcpu.c:247:2-3: Unneeded semicolon
 ./arch/riscv/kvm/vcpu.c:284:2-3: Unneeded semicolon
 ./arch/riscv/kvm/vcpu_timer.c:123:2-3:
 Unneeded semicolon ./arch/riscv/kvm/vcpu_timer.c:170:2-3: Unneeded semicolon
To: cgel.zte@gmail.com
Cc: Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, KVM General <kvm@vger.kernel.org>, 
 kvm-riscv@lists.infradead.org, linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 ran jianping <ran.jianping@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_042446_307824_6F717EAA 
X-CRM114-Status: GOOD (  17.83  )
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

On Thu, Oct 21, 2021 at 4:15 PM <cgel.zte@gmail.com> wrote:
>
> From: ran jianping <ran.jianping@zte.com.cn>

Reduce the length of patch subject (preferable around 70 characters)
and move the rest of patch subject as patch description.

Regards,
Anup

>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: ran jianping <ran.jianping@zte.com.cn>
> ---
>  arch/riscv/kvm/vcpu.c       | 4 ++--
>  arch/riscv/kvm/vcpu_exit.c  | 6 +++---
>  arch/riscv/kvm/vcpu_sbi.c   | 2 +-
>  arch/riscv/kvm/vcpu_timer.c | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index c44cabce7dd8..912928586df9 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -244,7 +244,7 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
>                 break;
>         default:
>                 return -EINVAL;
> -       };
> +       }
>
>         if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
>                 return -EFAULT;
> @@ -281,7 +281,7 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
>                 break;
>         default:
>                 return -EINVAL;
> -       };
> +       }
>
>         return 0;
>  }
> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> index 13bbc3f73713..7f2d742ae4c6 100644
> --- a/arch/riscv/kvm/vcpu_exit.c
> +++ b/arch/riscv/kvm/vcpu_exit.c
> @@ -394,7 +394,7 @@ static int emulate_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
>                 break;
>         default:
>                 return -EOPNOTSUPP;
> -       };
> +       }
>
>         /* Update MMIO details in kvm_run struct */
>         run->mmio.is_write = true;
> @@ -642,7 +642,7 @@ int kvm_riscv_vcpu_mmio_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
>                 break;
>         default:
>                 return -EOPNOTSUPP;
> -       };
> +       }
>
>  done:
>         /* Move to next instruction */
> @@ -684,7 +684,7 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
>                 break;
>         default:
>                 break;
> -       };
> +       }
>
>         /* Print details in-case of error */
>         if (ret < 0) {
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index ebdcdbade9c6..eb3c045edf11 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -166,7 +166,7 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
>                 /* Return error for unsupported SBI calls */
>                 cp->a0 = SBI_ERR_NOT_SUPPORTED;
>                 break;
> -       };
> +       }
>
>         if (next_sepc)
>                 cp->sepc += 4;
> diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
> index ddd0ce727b83..5c4c37ff2d48 100644
> --- a/arch/riscv/kvm/vcpu_timer.c
> +++ b/arch/riscv/kvm/vcpu_timer.c
> @@ -120,7 +120,7 @@ int kvm_riscv_vcpu_get_reg_timer(struct kvm_vcpu *vcpu,
>                 break;
>         default:
>                 return -EINVAL;
> -       };
> +       }
>
>         if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
>                 return -EFAULT;
> @@ -167,7 +167,7 @@ int kvm_riscv_vcpu_set_reg_timer(struct kvm_vcpu *vcpu,
>         default:
>                 ret = -EINVAL;
>                 break;
> -       };
> +       }
>
>         return ret;
>  }
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
