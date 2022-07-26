Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31265C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jul 2022 05:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYunwIfxUws2nAz1aP7rt7omVQfIpBqqWq45DPpAYKg=; b=k/FhW0O0X2f1hD
	GRg3wBoxpvVBZtAe5+m0RYW/cUNaJGVWMzhde/TDLLc16vz/2DTCpiJAkYlozVxT7A/i20Tcp2ZTv
	7ao3aFnfq3OvF0kQ7lMQ4jvqsgQbdVfVvBzf8boq1oYRqGAGb3nfY9QeKoGGRaPeT02C0VkxCFzAO
	X3Df4Ay5p+eyE27siEek0lG75cQpiAEN9ONo1Tzz1R/fE//UANuA0CO1bxKkYMaE8Rh5/aTK/U5x1
	0QdtYsY0mqbKspKiHfLpSXDJ9MryE2YEufgg3DFBEQGssZj/mvgDDoAA3118m5Pq73lAo4qDtCex6
	rLjcOyLWWU+RArfGmwSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGDS4-008Lhq-GJ; Tue, 26 Jul 2022 05:49:52 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGDS1-008Lde-DP
	for linux-riscv@lists.infradead.org; Tue, 26 Jul 2022 05:49:51 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-31e7ca45091so131458937b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 25 Jul 2022 22:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wC2AgKCkoa/FuALgKTQYRYYG1SVq93t6JSMuNrwiiVQ=;
        b=F4isfSDJdigZd5IbUyJaKZkLsqKJ0djQ5AJsNPp5sk3hO0Srpfu02Gd+HPjkgrz5wo
         O+PaCOQyaFPTLB4WTUB8yVUUezS7JlUl8/ZSoHLcV6jckZwGIHBJ1tZepFRTGIu7NQS5
         H6jeRvyaDzVzWFxtir2ln7IMoyaT6NHB+P+ew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wC2AgKCkoa/FuALgKTQYRYYG1SVq93t6JSMuNrwiiVQ=;
        b=y8tltDbJt2PeZ24lx9BxyfGXd0j4O8seejuuBDIUzhhrlC33G1Bc/h1ONBdvOrF7eP
         B+jVMaaMuMIYoJiPcAM/5gjYUlIDJ6+req4/1HjTZKQCPO/ZohxYuqxCaQ7lBOpt6zZT
         jSdARZ/ykNJYKGcsnJ3qvEFGsNAzrOAffVsuUrhNMoWFvEyaQacVdMIJdZq8UtnLf37H
         1blkAoBqneYkoYnJGVqtroieRpHDx2Xf9dnVDkDszjDNk3T/UDqfIbxmz6X/A3nzrOVd
         vIQrsOMX1LsHJARmZKJj82k5caei59DcdLfR2R0LpPFcDRLBe1ZKY7PWUycRao8Bjm+n
         ylVw==
X-Gm-Message-State: AJIora+mxv2pug37cLIJqU88zzKj5NMFFFBglnLjiEYaYFnG/5b70lGC
	hL2gi3u5qgGw002Q8wyzPyUbTebznwrUC2o42EsK
X-Google-Smtp-Source: AGRyM1ui8146ZmRckyLg9qtt9W1JTT+gVnn4Uua002pEWROvnIjWvUOUDn+8rcpNk56CG05r6u+sWklRBNPaopmmcSU=
X-Received: by 2002:a81:7589:0:b0:31e:620b:e75 with SMTP id
 q131-20020a817589000000b0031e620b0e75mr12770978ywc.482.1658814584983; Mon, 25
 Jul 2022 22:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220722165047.519994-1-atishp@rivosinc.com> <20220722165047.519994-4-atishp@rivosinc.com>
In-Reply-To: <20220722165047.519994-4-atishp@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 25 Jul 2022 22:49:34 -0700
Message-ID: <CAOnJCUK1JppQkZ+bv7mNpCm95i3gGZ5wHaRc2wiBGyp3zj2Dhw@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] RISC-V: Prefer sstc extension if available
To: Atish Patra <atishp@rivosinc.com>, Stephen Boyd <sboyd@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, Anup Patel <anup@brainfault.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Tsukasa OI <research_trasio@irq.a4lg.com>, 
	Wei Fu <wefu@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_224949_475448_FD7502C5 
X-CRM114-Status: GOOD (  21.73  )
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

On Fri, Jul 22, 2022 at 9:50 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> RISC-V ISA has sstc extension which allows updating the next clock event
> via a CSR (stimecmp) instead of an SBI call. This should happen dynamically
> if sstc extension is available. Otherwise, it will fallback to SBI call
> to maintain backward compatibility.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/clocksource/timer-riscv.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> index 593d5a957b69..05f6cf067289 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -7,6 +7,9 @@
>   * either be read from the "time" and "timeh" CSRs, and can use the SBI to
>   * setup events, or directly accessed using MMIO registers.
>   */
> +
> +#define pr_fmt(fmt) "riscv-timer: " fmt
> +
>  #include <linux/clocksource.h>
>  #include <linux/clockchips.h>
>  #include <linux/cpu.h>
> @@ -20,14 +23,28 @@
>  #include <linux/of_irq.h>
>  #include <clocksource/timer-riscv.h>
>  #include <asm/smp.h>
> +#include <asm/hwcap.h>
>  #include <asm/sbi.h>
>  #include <asm/timex.h>
>
> +static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
> +
>  static int riscv_clock_next_event(unsigned long delta,
>                 struct clock_event_device *ce)
>  {
> +       u64 next_tval = get_cycles64() + delta;
> +
>         csr_set(CSR_IE, IE_TIE);
> -       sbi_set_timer(get_cycles64() + delta);
> +       if (static_branch_likely(&riscv_sstc_available)) {
> +#if defined(CONFIG_32BIT)
> +               csr_write(CSR_STIMECMP, next_tval & 0xFFFFFFFF);
> +               csr_write(CSR_STIMECMPH, next_tval >> 32);
> +#else
> +               csr_write(CSR_STIMECMP, next_tval);
> +#endif
> +       } else
> +               sbi_set_timer(next_tval);
> +
>         return 0;
>  }
>
> @@ -165,6 +182,12 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>         if (error)
>                 pr_err("cpu hp setup state failed for RISCV timer [%d]\n",
>                        error);
> +
> +       if (riscv_isa_extension_available(NULL, SSTC)) {
> +               pr_info("Timer interrupt in S-mode is available via sstc extension\n");
> +               static_branch_enable(&riscv_sstc_available);
> +       }
> +
>         return error;
>  }
>
> --
> 2.25.1
>

Hi Stephen,
Can you please review this whenever you get a chance ? We probably
need an ACK at least :)

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
