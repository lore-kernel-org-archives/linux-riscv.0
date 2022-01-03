Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB43C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jan 2022 20:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0efDunLyKlQb8yZ3Wv6e/LnmzJAENHGz+fnFHLA9NQA=; b=ZGDPFBBv5k/1dn
	AMqbuxw6PbwrnMJnqeB+74uqzY/JCN3+iJ/2C1qdGo0pLULr1qx5WXWkIio78iE34WuM8SSyxBs85
	B7725+BRWBn06ksKUt2Q7PJB2xilWxzVLyilQyNXUupEtC+D0rDB9+F8NOsFH8Fl7IEya/ccJQBwA
	2ltCMMpYziOI0CrAadTbquvTnbZu8Lk+vc/WSYRjSEuCvXTv8voWcdtRI9HhRtHnDcpWQ2KZ3EYwK
	frXLI2Qz4q4f3F4QeGOPpdB6nqXGfxvfuboX7xXYaR13A4TiQJ24wY+K79IeEgLIXV/fqnlARspEp
	rcDAmbB6DVs0gIANkKIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4TcG-009xNw-ES; Mon, 03 Jan 2022 20:07:36 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4TcD-009xN1-GF
 for linux-riscv@lists.infradead.org; Mon, 03 Jan 2022 20:07:34 +0000
Received: by mail-yb1-xb36.google.com with SMTP id e202so59229369ybf.4
 for <linux-riscv@lists.infradead.org>; Mon, 03 Jan 2022 12:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GbgreVCiEHgCG7aY6u4MJ7Oi9knhaQBb0PijPJXiNlE=;
 b=Ug2aGC6fWeNCO1keuZBREN8KgoJ5KgxZIK0jnIE6LBhMT67LDL1d2r08NXa1Oph9u1
 hEMKC3Ud3Lp8Sw30Bhwm8ljui6Kg63s3FvSUWhSrxu/ouC88EsP1fjC3aPPwe6Yul1Mu
 +1B+06b+EqkG8vb00h52GaITHyV2cAapWMEM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GbgreVCiEHgCG7aY6u4MJ7Oi9knhaQBb0PijPJXiNlE=;
 b=ZvcnUaI+0vJvMOtE0bFD4vIjrIAGU5+qDy+lAVGVGRChcpHGlUui3NhPKaC99w6ns3
 gaIJO2J50EGUZ2v4EKtpQecaTOeeWVbNbPqRlgydHFsBgyS/ES0pflwHLrzu4C5L+tHR
 Rjh+VvVn5YxmjILtJe3NuLsT8pvN22EmDWQuCDeMf3tEdIvwimUTvs7Y/AoKTAATaVss
 qVVk5UFZtV7GZa+FLnE8R7aLAtqCsklqEnvihdQ+MBjs68bnuYeYHD8EMay5f7j/nPeS
 eoM5+wN8/RoxTNnvczE8t6o6WH6/6m95p7jw4hIJWb+uK3TCiN/pn6/ynheAdW7kItOK
 Iptg==
X-Gm-Message-State: AOAM533goqkqDz1FttcW5cyZVge6ltlM6lqJdtHRvaHT+4eVlIfMM1ne
 h0eD20aFcoBqdaD0WbjCEjwXZxw232CLLzUYWm8C
X-Google-Smtp-Source: ABdhPJyLaCL3lkSBDwcmsLSguA/UKUZF+d8Vo0g7Oy8C5hV5j93Eigi66HBwNkLkCVL27rVRzAkKwITbcMcGhZ3Gvu4=
X-Received: by 2002:a5b:ec2:: with SMTP id a2mr40883815ybs.713.1641240451632; 
 Mon, 03 Jan 2022 12:07:31 -0800 (PST)
MIME-Version: 1.0
References: <20220103133759.103814-1-anup@brainfault.org>
In-Reply-To: <20220103133759.103814-1-anup@brainfault.org>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 3 Jan 2022 12:07:21 -0800
Message-ID: <CAOnJCUJkVT9W6X+oe1CHjnHLUFs11Z_3qeXnats9pUcxCUiDPw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update Anup's email address
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 kvm-riscv@lists.infradead.org, KVM General <kvm@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_120733_613939_DE838F75 
X-CRM114-Status: GOOD (  14.05  )
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

On Mon, Jan 3, 2022 at 5:38 AM Anup Patel <anup@brainfault.org> wrote:
>
> I am no longer work at Western Digital so update my email address to
> personal one and add entries to .mailmap as well.
>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> ---
>  .mailmap    | 1 +
>  MAINTAINERS | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/.mailmap b/.mailmap
> index e951cf1b1730..f5d327f0c4be 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -46,6 +46,7 @@ Andy Adamson <andros@citi.umich.edu>
>  Antoine Tenart <atenart@kernel.org> <antoine.tenart@bootlin.com>
>  Antoine Tenart <atenart@kernel.org> <antoine.tenart@free-electrons.com>
>  Antonio Ospite <ao2@ao2.it> <ao2@amarulasolutions.com>
> +Anup Patel <anup@brainfault.org> <anup.patel@wdc.com>
>  Archit Taneja <archit@ti.com>
>  Ard Biesheuvel <ardb@kernel.org> <ard.biesheuvel@linaro.org>
>  Arnaud Patard <arnaud.patard@rtp-net.org>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3e8241451b49..aa7769f8c779 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10443,7 +10443,7 @@ F:      arch/powerpc/kernel/kvm*
>  F:     arch/powerpc/kvm/
>
>  KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)
> -M:     Anup Patel <anup.patel@wdc.com>
> +M:     Anup Patel <anup@brainfault.org>
>  R:     Atish Patra <atishp@atishpatra.org>
>  L:     kvm@vger.kernel.org
>  L:     kvm-riscv@lists.infradead.org
> --
> 2.25.1
>

Acked-by: Atish Patra <atishp@rivosinc.com>


-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
