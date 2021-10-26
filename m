Return-Path: <SRS0=5fxH=PO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E5EC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 07:21:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D62C60E8C
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 07:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D62C60E8C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VoGNKQq8QHlTlt7NsSNXuMAYINd0pc1RLvjDucxkFlY=; b=zQrvGrrsscmKKD
	c1TUDfYFN6ceJqvOd20750d5V4q5ojIX9WuTeb60mwKEPBtk5SqbS1e1Dj1LT9rwVSkpMx6UjpyAj
	Gdzp23dc0I6D63m6hpE5afniqbfZQhFgk+x/24uwJMyE4mwXtLn/XkY/AmLKEAHCbW27wchhNy/Tz
	Fxn9HDIkuUzJGl6xHncIFvXz3m99ZXzPoF8+A+h926vPCdGTxNHYvP/QN9SLlTGPXkn3t1+CrCddH
	63MR3k+7wUgrNIUTG/Z/CPaAgAnrNc2spzdAot23hzxJcrwlnrMRitHQ4K0lE3wQ4j8KSG+/aK+qG
	pKc/QAMVfMp6wcWPiN5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfGlV-000tjM-E2; Tue, 26 Oct 2021 07:20:57 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfGlR-000tgy-D1
 for linux-riscv@lists.infradead.org; Tue, 26 Oct 2021 07:20:55 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so1179040wmz.2
 for <linux-riscv@lists.infradead.org>; Tue, 26 Oct 2021 00:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uK4FEnHzYo2iEEhaGJnf6I9ZRkM8/MsJyen6l90ZGKI=;
 b=L40b46cvNdnoFhEJgc4ozV6AU+8HP3JD9axeHoM1+le7lYvCvQzY34TfMZqx/L2q/0
 ug63G0r7I68BS/CtcWqpLnCMbmJlNSbkxElIbYZioptOg0yw/s7ST4dpS/4FZzX5UwvD
 WGhWgKCcYfbjp9NgyazdiWncis/Brnk5cRx+PCDZD9oD0dsh5vwG7KEcNgkjg4LmuQik
 oEhOQS1B6biVGXQ32ihYHZDvnABGdCt0kIFIRZsrkFR72BUCbu6vU4nFu5p8/TIxsHtl
 NKbMydmy1tBt8K6jZQ/zBUrGyDVx2hdxcc+nb97ZKG+6QhNZ4pmUhurmX7kRgjjUO+0o
 WFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uK4FEnHzYo2iEEhaGJnf6I9ZRkM8/MsJyen6l90ZGKI=;
 b=vq5Y4NiBs+1fEi0SGgBIheHfBw5k6hXrNYdybontIPUL4BFuVZ97B4jvw7diW0qFmN
 Ca1dquRl1IGRZkjfqBMgnumfCtHqZhFDEt9e5gzAl3twHdmWiLJ1Qxwkd0v5LP32DjnA
 fY+/c3Ll4HIvbjAtz4lf6RvPZNM7BkIW1d9k8eEXX629xwdeCMVzg9nr5aLRFQn31gMI
 L1BG5iU24Rg8Ca3nsI6AYCWT8aDL6QG1cj2Jk4KMEJmPQMJIQqMPKQYs1DDGFyzyy+tI
 ZUpRyJ/VckZDc2SRr8uVHfrraEJblSFj9bDhrBDghEt4srlndph4ieS4su5IsD+QuN+B
 lcnA==
X-Gm-Message-State: AOAM532icjFIH0eG3CArll9VF8AeO+RfEL6AzVSU/m3/EMrSI5hKfqut
 rXm1p+pKUUMpBMeNY801HqsqDKNirj4GqjPT9ZEmKQ==
X-Google-Smtp-Source: ABdhPJxaZPO1AnPCFdVJO9RU5s/rQ6FpcabewmEN+KQwwXwpufrKWHvczAximO9dbWgB2kgUPqL0aH5nekYca6HIiQg=
X-Received: by 2002:a05:600c:354c:: with SMTP id
 i12mr26131590wmq.59.1635232851263; 
 Tue, 26 Oct 2021 00:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy3DWOux6HiDU6fPazZUq=FOor8_ZEoqh6FBZru07NyxLQ@mail.gmail.com>
 <20211021115706.1060778-1-ran.jianping@zte.com.cn>
In-Reply-To: <20211021115706.1060778-1-ran.jianping@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 26 Oct 2021 12:50:40 +0530
Message-ID: <CAAhSdy3mu-eKUYjEQmQoDODeKnzXEErkmLrgtztsFN7-+o3rHg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V:KVM: remove unneeded semicolon
To: cgel.zte@gmail.com
Cc: Anup Patel <anup.patel@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, kvm-riscv@lists.infradead.org, 
 KVM General <kvm@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 ran jianping <ran.jianping@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_002053_557320_5E7214C0 
X-CRM114-Status: GOOD (  17.73  )
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

On Thu, Oct 21, 2021 at 5:27 PM <cgel.zte@gmail.com> wrote:
>
> From: ran jianping <ran.jianping@zte.com.cn>
>
>  Elimate the following coccinelle check warning:
>  ./arch/riscv/kvm/vcpu_sbi.c:169:2-3: Unneeded semicolon
>  ./arch/riscv/kvm/vcpu_exit.c:397:2-3: Unneeded semicolon
>  ./arch/riscv/kvm/vcpu_exit.c:687:2-3: Unneeded semicolon
>  ./arch/riscv/kvm/vcpu_exit.c:645:2-3: Unneeded semicolon
>  ./arch/riscv/kvm/vcpu.c:247:2-3: Unneeded semicolon
>  ./arch/riscv/kvm/vcpu.c:284:2-3: Unneeded semicolon
>  ./arch/riscv/kvm/vcpu_timer.c:123:2-3: Unneeded semicolon
>  ./arch/riscv/kvm/vcpu_timer.c:170:2-3: Unneeded semicolon
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: ran jianping <ran.jianping@zte.com.cn>

Applied to riscv_kvm_next, Thanks!

Regards,
Anup

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
