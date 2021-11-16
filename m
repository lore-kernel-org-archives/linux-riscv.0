Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AB8C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 14:28:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1021F61BF5
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 14:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1021F61BF5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1tPgVwSTeLbgRMFbMF1mEq1Q1tOe0KEHYy53/nK5oCw=; b=N/w/Z2zqyUQXJ/
	cWaVhkPjK4DcEADdgZkVo80zBa8nffHWlPe/iHqOC7v9qfIpUrcuHFCdmMRarVeq5k66+EP1DYKsm
	54KecYnIFP1+mXEIqjRREPjMuGD8VyInThh9Wvm7YneCgu3XzTmvtNQ9SJ2Wy4FOGKxYXVq/15vFz
	hrtJHF8PtyQfvHAnwic5IvZFhCcvcPJ4CVetraBL3Cw8MDo2iGNyTsYkiNu9YAR63OLyiuS59Pexl
	t5fXmlvyB2MjePdASn37O0Mz8scyJfyECbI2DWDMin0amQq9bV8VuSagFzfkDf9rgRcn8SfPZXKfb
	n148e2w379rfPUnX5Nkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmzRZ-001tiv-AG; Tue, 16 Nov 2021 14:28:17 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmzRV-001th3-5o
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 14:28:15 +0000
Received: by mail-wr1-x42f.google.com with SMTP id d24so38035412wra.0
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 06:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HWhPuTZCeYFcjOd58uwQgszWNU0sTCldaG8fba7OiLc=;
 b=3mFsOvA5uHel7jOb/udYTc1PO/xSN11ULu2UYyqyvZVgkmYk+h2rX4Dh//fvuU255O
 SHt74aM3iQ/8yLRV6HUUrmWUO72BDRwEYf1Qid72F7RCDK8JDCdTHZ97qDlYLWGn6JMB
 7lloH7OVo9ZhWc/cSQb/ACWKgYk530kO6bwFAm75TkXIO/wqInG7huqFJq6NXc8Fiw4O
 kda1+if+KnDlh554y+9JLvCg3V0LEsEx0tHP986b87lU8DgbqGbI8+2HFowf+cuOe1E4
 wwO7m0t3ylRXqrL8tiT7DkKd3MX1VBD8xfA1cy5HRf0paVKPmrI3K147hTTb2/Q8IFNS
 pHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HWhPuTZCeYFcjOd58uwQgszWNU0sTCldaG8fba7OiLc=;
 b=Dwygt2MHmYaxMReVV7QvQ+OLoLA8kNhLVl/Vvnku/OphcHIwxAyQIS+n8IzpXt2pOj
 1E0EYdsA8cgCRlELKE419bTs1FSk3jbpHPmlxukJwk23MHk6iHJzYMv27gu93FZK1HJE
 hnPx6ErxSkmLOixBhFZSdsl+31NW8LmBe7z4uIEG8UNc6zS03yhG1dDGzZgbPo/x4h+5
 pmncZp2dpIvZN8wGQAOefm14Lo3FaXLc5cyNySodh/etLF3VoCdHI75ZCywRKCPTd0Dg
 kvqrOVCuOACixE2f4cRVlCd1hRmnky80ph3pPZdpXdqeuATPl3JC8xwPwaDiXyokYG+S
 NtNg==
X-Gm-Message-State: AOAM530oE2ORh8zvi5Oesk4X1Zw+oTz/1LAtdEfz74F1M6lsDoRWRS3z
 e+iql5hW7mfv9GmlFzCnPgFaVKqlzX8NIcIQoRnIEQ==
X-Google-Smtp-Source: ABdhPJyRDHaoLZ0NSJJuQgeeiHMHfW8vt2fxAhUgZNG7UkoYMeWr2Oc6/hMlaDv8BYe/4nla2hhbe+NFAA0JueeQybk=
X-Received: by 2002:adf:8165:: with SMTP id 92mr10151797wrm.199.1637072891214; 
 Tue, 16 Nov 2021 06:28:11 -0800 (PST)
MIME-Version: 1.0
References: <20211103064458.26916-1-zhang.mingyu@zte.com.cn>
In-Reply-To: <20211103064458.26916-1-zhang.mingyu@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 16 Nov 2021 19:57:59 +0530
Message-ID: <CAAhSdy3LvzR4H_rYvacER87n7fakU9EzE17vA3D+ASczR24=5g@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM:Remove unneeded semicolon
To: cgel.zte@gmail.com
Cc: Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, KVM General <kvm@vger.kernel.org>, 
 kvm-riscv@lists.infradead.org, linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Zhang Mingyu <zhang.mingyu@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_062813_246542_000A8F1E 
X-CRM114-Status: GOOD (  14.29  )
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

On Wed, Nov 3, 2021 at 12:15 PM <cgel.zte@gmail.com> wrote:
>
> From: Zhang Mingyu <zhang.mingyu@zte.com.cn>
>
> Eliminate the following coccinelle check warning:
> arch/riscv/kvm/vcpu.c:167:2-3
> arch/riscv/kvm/vcpu.c:204:2-3
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Zhang Mingyu <zhang.mingyu@zte.com.cn>

Thanks but this is already fixed by following patch:
https://www.spinics.net/lists/kvm/msg257614.html

Regards,
Anup

> ---
>  arch/riscv/kvm/vcpu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index e92ba3e5db8c..e3d3aed46184 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -164,7 +164,7 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
>                 break;
>         default:
>                 return -EINVAL;
> -       };
> +       }
>
>         if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
>                 return -EFAULT;
> @@ -201,7 +201,7 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
>                 break;
>         default:
>                 return -EINVAL;
> -       };
> +       }
>
>         return 0;
>  }
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
