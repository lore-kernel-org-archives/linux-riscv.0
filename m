Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD44BC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Mar 2022 04:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cN/7odCHbu7L07Raw6YCbE/AIfgYfYu+FguFDYKC5OY=; b=Ze8bJSQ8LWaWLu
	5UuBwJJ0aEiavwXYT2YlO5RpDFJA/oWmVvQzAKwRdglxLYOoSJb7/Zhz1MSmKjM8xTVf+UM5xTOoD
	d9VmgUk6i69ezIebqTSbhhn9OiX+9zUl8aVCH7pFtVX10qanyNF1SzMFsnfCEfvVNF0OfL2fxtdev
	TaMiYsq9cAKzeAFDYh7XunQVI4KP920MAHUffxovDSfPP1JZGauRK1G+IiMgFAQstHV0RHe7HeiN4
	lGiLE0O9msbIXlTaNw7hNYqADR3E2fPQXN3f03RsmB1gzDqOtntK5YPt40Be+9JQeZR05rRN7MeSj
	tctvvEALgN5XNNNrPb+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOtsl-00EqOt-62; Tue, 01 Mar 2022 04:13:03 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOtsi-00EqOF-Oe
 for linux-riscv@lists.infradead.org; Tue, 01 Mar 2022 04:13:02 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 e6-20020a05600c4e4600b0038173851f5eso619877wmq.2
 for <linux-riscv@lists.infradead.org>; Mon, 28 Feb 2022 20:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p+RfxbARsO22F/mTJhTFK2eb4/tLWhglHZWh/u2N8qg=;
 b=uHryp2EUJnj53qkapJ4p3xgXWpBW8CGAR65Ou8ubPjQFRclerIh5X35QtPyKfjbS80
 f08OS5UwjbMxxfPaZUMlXSmZt09hl30ItoNtEJo0g8kpYzsHsO4TGbdRuD8BF+fxq3ch
 V/UaBUODtB5bat2RGsmmO3i7J1BU/J7ww3ie7KWRxOmwpzhb8FDm2+x0yTcski/blCOC
 jsl6592ozFyetvimc81N2lMCKXC5gqGbYcbwaUEcL9rCxiDObU66xnnMNsFMubsNHGpZ
 f5ab3naCZB/nol5KeHnBPLetXOHKGbSY/k9Ky5HAr7iJf3Tr/G6PERHyi03m9bf2dMgg
 teRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p+RfxbARsO22F/mTJhTFK2eb4/tLWhglHZWh/u2N8qg=;
 b=bckN4PJE/vpRgKjRgMkHhY0Z8BfUQFJVLYQZ1l4Lz2NAYuc00O8h7Nm68s9WsYGcp0
 TOxNqKgBKiiiu8yPfzjalypivlALzU1eRyUGveIyKgRobuta3ftqufQvXA74+yZRhulH
 Ngovx6UDs/DF3UlgDD/v2K5pZs20a4budJB0/7F7MNkqk2Y1Yz8gt0OtgMJ5Q82mNURV
 haAvISPMw/R+PMvOsOWE3gBju0vQ6SYW6d5jQxIxoKSoGAmCARJAbZFmR8kLey01mDp8
 VWbLsr7iJbRjKx+MN3YjoBSSxLUYhKIAf1Hj/AR7mfZD3b5u2eikZX3mkmdIvmiEQl06
 3vyA==
X-Gm-Message-State: AOAM533kzBdqSn6c3bOD7Bdrh/6AtCmJFldWZt/DjNQUY3bVBwAZhVE5
 dCfZ+/Qwx6ytrssUcaOXVUfGXvnufYqWCMM+2bxSmQ==
X-Google-Smtp-Source: ABdhPJxmCTijLTOpR4/4n52kWAEP8ce3xbc/nyZuZz5NH7LBVo1sPKU6iEImc+22Q2VNUMFFXdD30cAkV8p7TNHKgDE=
X-Received: by 2002:a7b:cc0d:0:b0:381:220e:a3a0 with SMTP id
 f13-20020a7bcc0d000000b00381220ea3a0mr16068592wmh.59.1646107978914; Mon, 28
 Feb 2022 20:12:58 -0800 (PST)
MIME-Version: 1.0
References: <20220301005142.3038702-1-Niklas.Cassel@wdc.com>
 <20220301005142.3038702-2-Niklas.Cassel@wdc.com>
In-Reply-To: <20220301005142.3038702-2-Niklas.Cassel@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 1 Mar 2022 09:42:46 +0530
Message-ID: <CAAhSdy1=EtZS9Pjn6VDaan1_aRQ-TgJ35zgH8v1VwC8uon5NEg@mail.gmail.com>
Subject: Re: [PATCH 1/2] irqchip/sifive-plic: Improve naming scheme for per
 context offsets
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_201300_872576_665F724C 
X-CRM114-Status: GOOD (  24.54  )
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

On Tue, Mar 1, 2022 at 6:22 AM Niklas Cassel <Niklas.Cassel@wdc.com> wrote:
>
> From: Niklas Cassel <niklas.cassel@wdc.com>
>
> A hart context is a given privilege mode on a given hart.
> The PLIC supports a fixed number of hart contexts (15872).
> Each hart context has fixed register offsets in PLIC.
>
> The number of hart contexts for each hart depends on the privilege modes
> supported by each hart. Therefore, this mapping between hart context to
> hart id is platform specific, and is currently supplied via device tree.
>
> For example, canaan,k210 has the following mapping:
> Context0: hart0 M-mode
> Context1: hart0 S-mode
> Context2: hart1 M-mode
> Context3: hart1 S-mode
>
> While sifive,fu540 has the following mapping:
> Context0: hart0 M-mode
> Context1: hart1 M-mode
> Context2: hart1 S-mode
>
> Because the number of hart contexts per hart is not fixed, the names
> ENABLE_PER_HART and CONTEXT_PER_HART for the register offsets are quite
> confusing and might mislead the reader to think that these are fixed
> register offsets per hart.
>
> Rename the offsets to more clearly highlight that they are per hart
> _context_ and not per hart.
>
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> ---
>  drivers/irqchip/irq-sifive-plic.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index 09cc98266d30..211bcb10aa93 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -41,19 +41,21 @@
>  #define     PRIORITY_PER_ID            4
>
>  /*
> + * A hart context is a given privilege mode on a given hart.
>   * Each hart context has a vector of interrupt enable bits associated with it.
>   * There's one bit for each interrupt source.
>   */
>  #define ENABLE_BASE                    0x2000
> -#define     ENABLE_PER_HART            0x80
> +#define     ENABLE_PER_HART_CTX                0x80

These are enable registers for each plic-context and we have multiple
plic-context associated with each HART.
(Refer, https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc)

Correct name would be ENABLE_PER_CONTEXT instead of
ENABLE_PER_HART_CTX.

Regards,
Anup

>
>  /*
> + * A hart context is a given privilege mode on a given hart.
>   * Each hart context has a set of control registers associated with it.  Right
>   * now there's only two: a source priority threshold over which the hart will
>   * take an interrupt, and a register to claim interrupts.
>   */
>  #define CONTEXT_BASE                   0x200000
> -#define     CONTEXT_PER_HART           0x1000
> +#define     CONTEXT_PER_HART_CTX       0x1000
>  #define     CONTEXT_THRESHOLD          0x00
>  #define     CONTEXT_CLAIM              0x04
>
> @@ -362,10 +364,10 @@ static int __init plic_init(struct device_node *node,
>                 cpumask_set_cpu(cpu, &priv->lmask);
>                 handler->present = true;
>                 handler->hart_base =
> -                       priv->regs + CONTEXT_BASE + i * CONTEXT_PER_HART;
> +                       priv->regs + CONTEXT_BASE + i * CONTEXT_PER_HART_CTX;
>                 raw_spin_lock_init(&handler->enable_lock);
>                 handler->enable_base =
> -                       priv->regs + ENABLE_BASE + i * ENABLE_PER_HART;
> +                       priv->regs + ENABLE_BASE + i * ENABLE_PER_HART_CTX;
>                 handler->priv = priv;
>  done:
>                 for (hwirq = 1; hwirq <= nr_irqs; hwirq++)
> --
> 2.35.1
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
