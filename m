Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5890EC05027
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Feb 2023 14:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yeVMiVI7nX5s/oY9UaQ++3mIli0zhzGE8psShxq91mw=; b=losQ2LnX8j4ef/
	yMh+UyKuwcfvWUYMRW/dwlQ+IyCqnM8MFLS2As739Kwyy83lqorMTyK/HulxGg4rzwaGWuSCT9UNa
	QjguMus09HjB6gr05BvNsd5C/afX2QRLGCy9mw4sz6RlkF4bJrJipv5Ap3BjS/Ayc6Y/dXPlmQ7pB
	DlNpPduIFSBSNc2aTiw0Bpmev0yB4p6DZFJW72FlgLWpnxqeCHECMAFRs+w9nuLeKzud4xP4e8gKq
	l5OEAFTvN9V/lnsEmrL5z7sUUSxpUV9JEJUepujv/f3ROfD6MuiJ4mYfOY16xZWD69izRAZm6CKtd
	p72lgkhySD7//WRpsp8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQU3u-005yIu-7f; Fri, 10 Feb 2023 14:07:38 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQU3q-005yFL-Ip
	for linux-riscv@lists.infradead.org; Fri, 10 Feb 2023 14:07:35 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id x8so5774338vso.2
        for <linux-riscv@lists.infradead.org>; Fri, 10 Feb 2023 06:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1676038051;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WjR5+rSVm40yBdy3S3lnrbU7QxgVcfkiS2VCusME+T0=;
        b=mPcVawWxhXA4BuhTsqIGEw3EfrHD833k9/H31X+W4r7L7CXRgS15V5Bln+vHE8BDUL
         3TSOHbcxanV72izBD4qDrRJ8v2DTVJ0NtnxSSbnDbPsJdxuOk3lAA5NGCTul03EP2KR8
         94P7Khy6LhMaeSBlGGoFNOIWjV23jT485P5zQlMX+nKsxX//qbZDFOsWgtFksntJLhBP
         rRi94LQaVpfPqgiSHOm0R1euiqDQwZJZt36c/cUlWNK5T6r9IHzB2vvNKaNO8TAaPvTk
         mkkloq2PbbX+/sf8885x99QmL4FzfLfdn3CJM8aVt9giirFrUFSviDDcnaBv9oauyf3x
         1SFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676038051;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WjR5+rSVm40yBdy3S3lnrbU7QxgVcfkiS2VCusME+T0=;
        b=WD45/ThGW+7Z2X3WcF9oiW+dW03bPVSyXyTw/VgxaQB/ibHUTvNsB1MuEOFLLqN1r3
         jnQCg+mBbN5vczhZ7beGUrHqbI9KQ5REyByHS4RujPGJpEFtpW7fAlkBg2EMpShLuYeN
         K8EZXqYnrW1rLWBA3fktiXn7cT5w9Bn/RjpS2i7JArGJ5q+LEzYpKrKmmEx5TykZ65av
         JFlxO+5wexMSaJUr9zpAdEuOfuG7gBFpM/PTVBVgihuTtwloMbu8XaefhJseB7sKGNxu
         1FaKw0/m4Ssgw60k42eJ02Zkq/kYJI0Fy8F/hj9S8ehhFq386Czx8ZUav9Wj/MQiUd//
         +6NA==
X-Gm-Message-State: AO0yUKUqifXOG5fuPUuZ5VH1HlaANV7zxFyaIc5sZZdb9ntvaezSFiq4
	HsUN1umlkdHEvhvN+2PodUNlY+sZQV5l+XsIbIoB4Q==
X-Google-Smtp-Source: AK7set/Jo4gKIUwff4a6qgDA1odVvZmmFwCFwWQuhamFYv7xiwh9EILqfVOSA248DAKI2DKihVdtP0iTlUy67PuZH6A=
X-Received: by 2002:a67:ab46:0:b0:3ff:d4df:3611 with SMTP id
 k6-20020a67ab46000000b003ffd4df3611mr3507671vsh.0.1676038051029; Fri, 10 Feb
 2023 06:07:31 -0800 (PST)
MIME-Version: 1.0
References: <20230210135136.1115213-1-rkanwal@rivosinc.com>
In-Reply-To: <20230210135136.1115213-1-rkanwal@rivosinc.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 10 Feb 2023 19:37:19 +0530
Message-ID: <CAK9=C2VzZZLqOd_4gok5QMwmwz9NKYyVmDCzmCA7spohbq_zXg@mail.gmail.com>
Subject: Re: [PATCH 1/1] riscv/kvm: Fix VM hang in case of timer delta being zero.
To: Rajnesh Kanwal <rkanwal@rivosinc.com>
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_060734_628017_EA0EEA57 
X-CRM114-Status: GOOD (  18.64  )
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

On Fri, Feb 10, 2023 at 7:21 PM Rajnesh Kanwal <rkanwal@rivosinc.com> wrote:
>
> In case when VCPU is blocked due to WFI, we schedule the timer
> from `kvm_riscv_vcpu_timer_blocking()` to keep timer interrupt
> ticking.
>
> But in case when delta_ns comes to be zero, we never schedule
> the timer and VCPU keeps sleeping indefinitely until any activity
> is done with VM console.
>
> This is easily reproduce-able using kvmtool.
> ./lkvm-static run -c1 --console virtio -p "earlycon root=/dev/vda" \
>          -k ./Image -d rootfs.ext4
>
> Also, just add a print in kvm_riscv_vcpu_vstimer_expired() to
> check the interrupt delivery and run `top` or similar auto-upating
> cmd from guest. Within sometime one can notice that print from
> timer expiry routine stops and the `top` cmd output will stop
> updating.
>
> This change fixes this by making sure we schedule the timer even
> with delta_ns being zero to bring the VCPU out of sleep immediately.
>

Please add the Fixes tag here.

> Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
> ---
>  arch/riscv/kvm/vcpu_timer.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
> index ad34519c8a13..3ac2ff6a65da 100644
> --- a/arch/riscv/kvm/vcpu_timer.c
> +++ b/arch/riscv/kvm/vcpu_timer.c
> @@ -147,10 +147,8 @@ static void kvm_riscv_vcpu_timer_blocking(struct kvm_vcpu *vcpu)
>                 return;
>
>         delta_ns = kvm_riscv_delta_cycles2ns(t->next_cycles, gt, t);
> -       if (delta_ns) {
> -               hrtimer_start(&t->hrt, ktime_set(0, delta_ns), HRTIMER_MODE_REL);
> -               t->next_set = true;
> -       }
> +       hrtimer_start(&t->hrt, ktime_set(0, delta_ns), HRTIMER_MODE_REL);
> +       t->next_set = true;
>  }
>
>  static void kvm_riscv_vcpu_timer_unblocking(struct kvm_vcpu *vcpu)
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
