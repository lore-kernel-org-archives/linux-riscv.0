Return-Path: <SRS0=CnAn=LI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B35CDC48BE8
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 13:34:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7742C6109E
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 13:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7742C6109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9sn91weQvG5Fyh3fU6ayM+254v7BxEc3hAMoEoA+jjw=; b=N/IgyY8dU4vUmP
	xYT/LJOkTAlJWjzAd+a6wgShYpEv9ObcGE6Hkf548yHGgsgtYe1KmyIbI+C3E+E9vQ2lxdkcTjzzm
	cq0bgNwMxvtj8Cyo5GQWhZhxs361cBL+E/qmwZzVJu5OvaUg44W1ZfHrNIDPCkM0hkXK8spVSaZej
	6ZuZGGKIowXXk1yPHT8dGFWqRO4Z+7ZHCe7zkGaBy+KL5fOspsduUl4rZeCa/WUlOW+3xLFJfMLtX
	55HbMlO9POBysi8VyQNsNTb4Wt/fY1HILObWPBtK+NRXSDRnky7IenGFrqX+i/nKc3Q37xpSHeHLc
	OhgUqGbnLST3OQ7w7JAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsmjO-00EI2A-OG; Mon, 14 Jun 2021 13:34:22 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsmjL-00EI04-Fb
 for linux-riscv@lists.infradead.org; Mon, 14 Jun 2021 13:34:21 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id h15so15401930ybm.13
 for <linux-riscv@lists.infradead.org>; Mon, 14 Jun 2021 06:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ICFF0gvP4WNJHWCdVhPKr0RwlnFvCsrPtpKk22BCZLQ=;
 b=EmhgcFk2DqMKDyHM3E7HQNDiGpXsM4m9T9EKkiHOjZuY2EH4B0WoHDwdiZ6Vg0vbqP
 EJqQMOPAxLfrf3yW8OUr1y2QBfIF6RzDKplGH42ZszBAcRyrDhQsXtG2Kq81kzBKXK3X
 9JWZtGUZ0DIlqLnitd5jv/on8BCNk1q/VF5ZlI56UO+b4Q7oeyi3nrX+PT5wpSJtDU5b
 Xk+VlLJowpKxDoeOxnfzWKsRJL/o7scLS1EE20VIlzzqY+tpUfdFLDmylsIxMJU6IcH/
 TdxWOn7xktZ4ngEQzk8d6uk6Cc7s8YrFXhbTUNui2AJvatgyDm4FquEh1lcbvW65Jtcp
 1nHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ICFF0gvP4WNJHWCdVhPKr0RwlnFvCsrPtpKk22BCZLQ=;
 b=Gf/EtR1kG1c+9xGK8B7O6tr1BE2WnHNGyb++cqU7WZpvPHCQTsY9byPL/y4D9Vbj/A
 rHvwUK/lxX4W9gQrioLDv0WXVhddw5waovfaPi0sWwmMsOtmt618sKLQ+OBrEwcKXykO
 /iaBIN58b6ehtR4IF4X+Bs8eNu3UTd5eo72LTAPBWCzLY4mOa+loxlroWNviG/KJueZG
 a61OsFCZpVPkUjTNTqPT9KD4KklnAowN3njY3kBJsTGRjQQG3r7xujFWwNpv8w/aSiOp
 58KPBJ8+wD2lyzc3VcwBrlQ0v9qgyyhMIqXRYn6CKhsgSVfBZ8sTEjVZ6d+PVu0/R+sz
 R6wg==
X-Gm-Message-State: AOAM532dwsj6IXV/0dyojOEBkOi3j3RYwswKI+oM7lRRGvZ/+qWIXkh5
 re4F2yquJOsqhGG/dCVE44x7S0VL+l0VVBW3ycI=
X-Google-Smtp-Source: ABdhPJzx0RiztLvnYqg26eV9a6k96ttW/ISNP/7urlvspkOhQ+qAr2ajxmUcXb/gW1OKFhvry41rf1BgdMgucq/zteM=
X-Received: by 2002:a25:6c04:: with SMTP id h4mr24796509ybc.122.1623677658008; 
 Mon, 14 Jun 2021 06:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210612160422.330705-1-anup.patel@wdc.com>
 <20210612160422.330705-8-anup.patel@wdc.com>
In-Reply-To: <20210612160422.330705-8-anup.patel@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 14 Jun 2021 21:34:05 +0800
Message-ID: <CAEUhbmUvjFg7a4xr9p_r0qynwa5DAOejtV77XMUJvwfTOOFu1A@mail.gmail.com>
Subject: Re: [RFC PATCH v1 07/10] clocksource: clint: Add support for ACLINT
 MTIMER device
To: Anup Patel <anup.patel@wdc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Atish Patra <atish.patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_063419_561537_E6B0A233 
X-CRM114-Status: GOOD (  25.92  )
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

On Sun, Jun 13, 2021 at 12:07 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> The RISC-V ACLINT specification is a modular specification and the
> ACLINT MTIMER device is compatible with the M-mode timer functionality
> of the CLINT device. This patch extends the CLINT driver to support
> both CLINT device and ACLINT MTIMER device.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  drivers/clocksource/timer-clint.c | 43 +++++++++++++++++++++----------
>  1 file changed, 30 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
> index dfdcd94c1fd5..ca329c450810 100644
> --- a/drivers/clocksource/timer-clint.c
> +++ b/drivers/clocksource/timer-clint.c
> @@ -2,8 +2,15 @@
>  /*
>   * Copyright (C) 2020 Western Digital Corporation or its affiliates.
>   *
> - * Most of the M-mode (i.e. NoMMU) RISC-V systems usually have a
> - * CLINT MMIO timer device.
> + * Most of the M-mode (i.e. NoMMU) RISC-V systems usually have a CLINT
> + * MMIO device which is a composite device capable of injecting M-mode
> + * software interrupts and M-mode timer interrupts.
> + *
> + * The RISC-V ACLINT specification is modular in nature and defines
> + * separate devices for M-mode software interrupt (MSWI), M-mode timer
> + * (MTIMER) and S-mode software interrupt (SSWI).
> + *
> + * This is a common driver for CLINT device and ACLINT MTIMER device.
>   */
>
>  #define pr_fmt(fmt) "clint: " fmt
> @@ -21,14 +28,20 @@
>  #include <linux/smp.h>
>  #include <linux/timex.h>
>
> -#ifndef CONFIG_RISCV_M_MODE
> +#ifdef CONFIG_RISCV_M_MODE
>  #include <asm/clint.h>
> +
> +u64 __iomem *clint_time_val;
> +EXPORT_SYMBOL(clint_time_val);
>  #endif
>
>  #define CLINT_IPI_OFF          0
>  #define CLINT_TIMER_CMP_OFF    0x4000
>  #define CLINT_TIMER_VAL_OFF    0xbff8
>
> +#define ACLINT_MTIMER_CMP_OFF  0x0000
> +#define ACLINT_MTIMER_VAL_OFF  0x7ff8
> +
>  /* CLINT manages IPI and Timer for RISC-V M-mode  */
>  static u32 __iomem *clint_ipi_base;
>  static u64 __iomem *clint_timer_cmp;
> @@ -36,11 +49,6 @@ static u64 __iomem *clint_timer_val;
>  static unsigned long clint_timer_freq;
>  static unsigned int clint_timer_irq;
>
> -#ifdef CONFIG_RISCV_M_MODE
> -u64 __iomem *clint_time_val;
> -EXPORT_SYMBOL(clint_time_val);
> -#endif
> -
>  static void clint_send_ipi(const struct cpumask *target)
>  {
>         unsigned int cpu;
> @@ -191,9 +199,15 @@ static int __init clint_timer_init_dt(struct device_node *np)
>                 return -ENODEV;
>         }
>
> -       clint_ipi_base = base + CLINT_IPI_OFF;
> -       clint_timer_cmp = base + CLINT_TIMER_CMP_OFF;
> -       clint_timer_val = base + CLINT_TIMER_VAL_OFF;
> +       if (of_device_is_compatible(np, "riscv,aclint-mtimer")) {

This patch should come after patch 8 which introduces this DT binding

> +               clint_ipi_base = NULL;
> +               clint_timer_cmp = base + ACLINT_MTIMER_CMP_OFF;
> +               clint_timer_val = base + ACLINT_MTIMER_VAL_OFF;
> +       } else {
> +               clint_ipi_base = base + CLINT_IPI_OFF;
> +               clint_timer_cmp = base + CLINT_TIMER_CMP_OFF;
> +               clint_timer_val = base + CLINT_TIMER_VAL_OFF;
> +       }
>         clint_timer_freq = riscv_timebase;
>
>  #ifdef CONFIG_RISCV_M_MODE
> @@ -230,8 +244,10 @@ static int __init clint_timer_init_dt(struct device_node *np)
>                 goto fail_free_irq;
>         }
>
> -       riscv_set_ipi_ops(&clint_ipi_ops);
> -       clint_clear_ipi();
> +       if (clint_ipi_base) {
> +               riscv_set_ipi_ops(&clint_ipi_ops);
> +               clint_clear_ipi();
> +       }
>
>         return 0;
>
> @@ -244,3 +260,4 @@ static int __init clint_timer_init_dt(struct device_node *np)
>
>  TIMER_OF_DECLARE(clint_timer, "riscv,clint0", clint_timer_init_dt);
>  TIMER_OF_DECLARE(clint_timer1, "sifive,clint0", clint_timer_init_dt);
> +TIMER_OF_DECLARE(clint_timer2, "riscv,aclint-mtimer", clint_timer_init_dt);

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
