Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC5FC64EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 07:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=00/ZZYeGqFXOPxvGhSqmJME8G3I0tlW6iE/DBy+D0C0=; b=pKRF317+LgdDBn
	KyKiJLbdOfUBRj1UR2OWHcx5zsuOO0pW3uxteGgbPJNsi4SBMtmgl4dl6iyXt6/oQY0YplmuFLq4f
	BIZgAMoBb+bQwxifvd7Jk2WyS8y2yUwfcKRgZS71gR9Jk5s+9vxdHSL6JCyMq5Ap+BqN/yofg/gVE
	/UmaPLH+KtYe8g7XynaYSKS5AfdTRs30mHE3dq9t+YO940fHF5ZQgYMvaKX7oPLiXvlgM/EhKygGo
	zrZEG7wKcouks34VUPXaB/xTZ3BFSrUO3q7hrpkWJADg1bzEKPgkmXleq7oS/XfHqKUKzLhCVdAX3
	1qRw/ehLqpsqzvcolmnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqAt-000Njp-Kg; Tue, 14 Feb 2023 07:56:27 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqAe-000Na3-Td
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 07:56:14 +0000
Received: by mail-pl1-x62f.google.com with SMTP id w5so16195974plg.8
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 23:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qelBQClw7mXq80SVJvQ3JIsOiducFvvsAUEKszfdTWI=;
        b=Zjsnk3G1m3c2j2vBbWEw29s+tBSpeyW8l+mBJUemvwZ3ZIl3mAlMHMiMg5UmykQdgU
         QXQRxZ/gY57Pg7TekPEUcPMnvtA3Y338kmwhxKOKiNC7KsEZ9lgXJYWfRaMX+wIRFCe5
         xmv5uzQgyI0T25jmd4sjvlc52XI/mhrlH7U9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qelBQClw7mXq80SVJvQ3JIsOiducFvvsAUEKszfdTWI=;
        b=4U5d6YNGHT+BCEB6D9vsHm3CoTs90wIxQacPzdeJIMT+SBp9x5be4+e1+yNLdGS2QS
         iSuKu17wmNhlaTxmuZkWavItnT0N8bpZUU7lcfupYbfEevZvElDGiwgt7aNGN/DUgjFd
         023q26rhu8phe2DAeVuiTA+MCvRK0iMAW7MQxpzi15FEil/LxXX95wmhv4/Cm7A7tPSv
         LI0D5MqXz3mlsiSqjx2CZOEFSEZsRR+ZIijXUtrrZ7gQlh6TWOjbT7Vd/A99xCksqTcE
         eVwnnr7Ezjkg94PDdAlqJgA7raPvWu2gmS+hAPK5oJotF3O/JTGUYC2DjhvdViI/Ic5v
         yPUQ==
X-Gm-Message-State: AO0yUKWFstCH6atMqkqzfd/uCpG6yZGgoEh2QPmsDWEYhe/OFhdCKAuU
	Zg4m2NQ/0CRA5nLyQX2wgynL2OIWErs6JkjdcS9X
X-Google-Smtp-Source: AK7set83Sbzb8jCkDb4xrCrdqGGfaYuMy9wt+/YQodEHLIM55YAQJY9anSobjjDFMQ5cSu0tBC593mHUT8KAO6pp7Bk=
X-Received: by 2002:a17:90a:3b08:b0:230:88c4:a922 with SMTP id
 d8-20020a17090a3b0800b0023088c4a922mr193163pjc.103.1676361369599; Mon, 13 Feb
 2023 23:56:09 -0800 (PST)
MIME-Version: 1.0
References: <20230210142711.1177212-1-rkanwal@rivosinc.com>
In-Reply-To: <20230210142711.1177212-1-rkanwal@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 13 Feb 2023 23:55:58 -0800
Message-ID: <CAOnJCU+i63tk8kthtqWB09av7GQJcCrgYipqMJv+XPeLtOF90g@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] riscv/kvm: Fix VM hang in case of timer delta
 being zero.
To: Rajnesh Kanwal <rkanwal@rivosinc.com>
Cc: anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_235613_010870_6AE414F2 
X-CRM114-Status: GOOD (  18.35  )
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

On Fri, Feb 10, 2023 at 6:27 AM Rajnesh Kanwal <rkanwal@rivosinc.com> wrote:
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
> Fixes: 8f5cb44b1bae ("RISC-V: KVM: Support sstc extension")
> Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
> ---
> v2: Added Fixes tag in commit message.
>
> v1: https://lore.kernel.org/all/20230210135136.1115213-1-rkanwal@rivosinc.com/
>
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


Reviewed-by: Atish Patra <atishp@rivosinc.com>
-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
