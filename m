Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77530C19F2D
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Aug 2022 17:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IHPFtvQDyG32EUost1XbHzIGkX+omnsW9k9/RtyI04c=; b=sSJmBHyYjj9ZGs
	St+DFLWoTT6Mcq92DluzC+MeNU4JIuRh1/08hh1ft6WqSQ+Zmk0QsDQYl9oFCF/tXi9vAIYknc2MM
	GF1P705V9rXFwNlAbmIaolX8G9bWz3IWxvokPr3XddmRQbShC/8WqC9P04/LT6xOrzQ3qBJM+qvcA
	eHujltUbySotkzjUNrMjjfGrJ1ejkzPczhdZjjnLsHVX5vvvnHuT58xd1VO8GzG39v/K12WnU0BuY
	Keva+sepVXhvslq3fFoTjYoTvSzpFKU0VVKoMNwH0O9Xl3tyNa1mEpl5zYrvuaYZWvYg2X+rdsNV0
	Q+ALC/W6w5wLVFqoGUow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLSiD-005ApH-Gi; Tue, 09 Aug 2022 17:08:13 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLSi9-005Ana-Nw
	for linux-riscv@lists.infradead.org; Tue, 09 Aug 2022 17:08:11 +0000
Received: by mail-yb1-xb30.google.com with SMTP id o15so19293371yba.10
        for <linux-riscv@lists.infradead.org>; Tue, 09 Aug 2022 10:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=bepKw/LEtAGRfDcwveDu9uQHog0KI2Ak5eWQ5Bh1L6c=;
        b=Bu0RWS8B/pKGZqeXil99Hd+xifsOSY94tVAatqvQ956DT2XUBDWf3L62iEJ1nlLRHN
         +VHNyGHI0svtzTTu7HCgURdaKyzT0hZXkZVuqi1s+wuPcZjt9G+Y7VuW69jux1R8FZD0
         Wux70e6GEJi+E2bj5AtDlHhxNdQG2ZpisvYdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=bepKw/LEtAGRfDcwveDu9uQHog0KI2Ak5eWQ5Bh1L6c=;
        b=PEZHsxAX2rvRO9Je+fCk6viAU1wX3TX+q2hEU1oQiWYdNCVQZeEp8V83W6IU+HcRv3
         A7LKg0+HW54qYffCEurl9UieadKLc9uP2qgMH7J7TU6qg9f1iK9PN1Cajdm5MJ1tI4Z5
         qYUSh0aIvkmmiuYUCdE40bqZP/tmTKU8bY5gykSY4tFB4YTDwSxf+M9YzHLhrd5Eyy8m
         YXdeMkYwkSsbU77+UyXet/wN66ndr9jSbJlDBSTQ9RxxV/8RF1WaCmt4ixMdquGjSsXS
         KJnER0TBVUElIZ6W/k8cs1b8TGaspSSH6AjoLNJ+c0IPvLKGnsASf6YldhKJ2c2RNFhA
         d6eQ==
X-Gm-Message-State: ACgBeo0jW8E1j5yI1kgfmT5gnafVR7HuX8qod/Nl2TtslAxgFYTlbWKR
	UjBSwq7EwU/syI6PF328l2hyrXLW5M588Evf6WEv
X-Google-Smtp-Source: AA6agR4sATcRkB2d0u/CrgxX/HJwI6/I9eM5hDsVMbdUeC4uqpTwesM5LXawIa2GRbCVrUAjXoWrtTDWp300zVQ0g10=
X-Received: by 2002:a5b:40a:0:b0:670:ee95:c8f1 with SMTP id
 m10-20020a5b040a000000b00670ee95c8f1mr21385580ybp.121.1660064887851; Tue, 09
 Aug 2022 10:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220722165047.519994-1-atishp@rivosinc.com> <20220722165047.519994-4-atishp@rivosinc.com>
In-Reply-To: <20220722165047.519994-4-atishp@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 9 Aug 2022 10:07:56 -0700
Message-ID: <CAOnJCUJ246giiHpSFSe_B1wjwxrYGpKJF-VeGLL_QBmBO7Zfvw@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] RISC-V: Prefer sstc extension if available
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, 
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Tsukasa OI <research_trasio@irq.a4lg.com>, 
	Wei Fu <wefu@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_100809_984443_532F2B78 
X-CRM114-Status: GOOD (  21.48  )
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

Hi Daniel,
Can you please review/ack this patch whenever you get a chance ?


-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
