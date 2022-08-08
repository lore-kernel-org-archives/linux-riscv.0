Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C55BC00140
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 08:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NC3ceqHOWPpqrLaPZH4j/IRIp1M/Y0JcQpEv5xQsRAs=; b=pQLy4P7TiFK5cj
	Eu9PRudPva2e23QdMp1P88smW9HEwhKH0+xb02nqM3WDGJq9pGoUhtP7SS2P/hBufQZQjrBEDA3il
	ZKZTFKYW3s0p1tGTjLAARmJYDBrU0HPQDTC9hw9Zm8vcb4xuAUWF8ybOfeoqrIUfDXbURNdhsf4DP
	OrhOcHwa55iSaLv0dzCAXrgrqkBbrCfRLtR5XWC7lLRFHK67NCPkPZadBrN/HAAJjn0KXZQIXx2bm
	wNgaMRsWAXfznSUAI+upd9vZXON7hsOSHznw1jDvhoSv7FjY8gdaWZ9/6SmooAwxd6cH6PdwLbqTW
	aYtmFa1sQL4IutEz6/Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKyZi-00CWsB-QK; Mon, 08 Aug 2022 08:57:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKyZf-00CWqz-0C; Mon, 08 Aug 2022 08:57:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5B92560F49;
	Mon,  8 Aug 2022 08:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7270DC4347C;
	Mon,  8 Aug 2022 08:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659949040;
	bh=41hkDjozTj/9771T7sIgIeayf3FHl7toj5PGFhaQaig=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dRlv8aBv9gmYQMMRysynhf3+XtHFgW0vc2MSDpq11XWpjmVBBFePhsFad6FIRSf1W
	 tImr2wyVSdaBHT8jVVAQfiaytLde2W87xEJx4Df/laMM9224zInWE82a7NLGZrryuz
	 2wtKizJOrLfkkMgUUNaO5tYKddjmEvijmG1/FbwM2BnXNXDpxjskwo5n3/RjUvHFUa
	 N1me2DWIpOScQhDCo0zH5e7U0XnO0jGzxHrsiS6a1R4zmDmoyc7a/Brr4kPuG3cuWd
	 JyqqkVDXHpjQsGSR+u4fr2n0qySMsY4Shs9RB6DPIJ/nF5UlzHVA7hUX3zJDEOAfCc
	 qAg4YUBkDJpVQ==
Received: by mail-ot1-f53.google.com with SMTP id cb12-20020a056830618c00b00616b871cef3so6080950otb.5;
        Mon, 08 Aug 2022 01:57:20 -0700 (PDT)
X-Gm-Message-State: ACgBeo0HTMGudd//QXzx1lYwQGfkVbAU6BF0lJ3oc22Q98yYE3G9F21v
	TxH9p620hzTLX7ZCzrbHSHxivpiIKmaxeP3bTr0=
X-Google-Smtp-Source: AA6agR5Ts3sAfj1MljLE3v8RoF3iPVaZ/RVb7hUbopz7S2rwzd3IMWydqeAW1PpniXu8oQ28JweXQ0oxg2FizGG4Lyk=
X-Received: by 2002:a05:6830:928:b0:636:aaa7:813b with SMTP id
 v40-20020a056830092800b00636aaa7813bmr5058008ott.140.1659949039556; Mon, 08
 Aug 2022 01:57:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220722165047.519994-1-atishp@rivosinc.com> <20220722165047.519994-4-atishp@rivosinc.com>
In-Reply-To: <20220722165047.519994-4-atishp@rivosinc.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 8 Aug 2022 16:57:07 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR8yOwHNJBvq07eNTBAHansRhDq57HYrUYLnRV+WuSD_g@mail.gmail.com>
Message-ID: <CAJF2gTR8yOwHNJBvq07eNTBAHansRhDq57HYrUYLnRV+WuSD_g@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] RISC-V: Prefer sstc extension if available
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Tsukasa OI <research_trasio@irq.a4lg.com>, Wei Fu <wefu@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_015723_138218_2EC157FC 
X-CRM114-Status: GOOD (  23.38  )
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

Looks good to me. The patch is concise, and static_branch is properly used.

Reviewed-by: Guo Ren <guoren@kernel.org>

On Sat, Jul 23, 2022 at 12:51 AM Atish Patra <atishp@rivosinc.com> wrote:
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


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
