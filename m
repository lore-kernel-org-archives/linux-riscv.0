Return-Path: <SRS0=wzy2=D6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AE40C4363A
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2020 12:31:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30CA021D43
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2020 12:31:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="obDwUCnB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="VZpi6JBF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30CA021D43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EjKI8gPrmz2OJUQwCEmyxfvNkMraKF0RgsAK7khQ5Yw=; b=obDwUCnB7NaGPG4CUEFOmw+yO
	D9qKywTwqk1p9W9hr4hfmQ8ADHL1vik1uexhfopxTSEebZg2Ue32r+hA2GxuzORoKkgaiU3iV5aBz
	MzK860R76BBQ6jlYI8EWTr628YHc49+y3DxYw9f9DpI5BT67+iOB9VDlxAvLZ+ZlKzvXToqAXnF3M
	wtopqg4fPZDSIRB3KFcOuZSj/gXUSPcZOt32PsverclCS7lKXVVoh7grCd0MhwHlLELVKV16TzOoc
	030SD4BlErc/B3Xh7tlnBIlqwnESfeFzEU2fRyxLDafxEDBggZVQ12z+eVhURbXfdYbmTR3hDnbim
	6k5tf5sog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVwEH-0003W2-Ab; Fri, 23 Oct 2020 12:31:33 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVwEC-0003Tu-QO
 for linux-riscv@lists.infradead.org; Fri, 23 Oct 2020 12:31:31 +0000
Received: by mail-wm1-x341.google.com with SMTP id c16so1331004wmd.2
 for <linux-riscv@lists.infradead.org>; Fri, 23 Oct 2020 05:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OgsYaNT7si4aUmj94LUjpDJPk7YDycSfzUdAI52Aub4=;
 b=VZpi6JBFejPcuHx/0xa8bObFcO7Gg481B13EEknIsI5tXtO9GC7/umRRZlu/BQ9Ron
 4ie4+8bOaIJpXzYB6uZ5FmseJDhSrW1dM+xFAy/aaVAT8a2NP4jJgOc1s7EF8khg1Ub0
 vRYCsHLJOTnGLCQb+a/2hJUQP1HWJQWs8slKF0XJXtOBM06bxlOIXVMOXoKh+EQr491C
 MrklP1atlg/A9GR7YdCYo76hDlqcOn0loczylzWCGgVVdR9vTCqIIJGtC+7NmlhtyG7y
 vkzKeZdX+N1CA2Oe4Qa31RBkDGqoIhcJhZc2hNZUGJnV/+sf34LHT5Qs+WZ/+ww7/26+
 MCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OgsYaNT7si4aUmj94LUjpDJPk7YDycSfzUdAI52Aub4=;
 b=jseWAFbMq6TVO+m4Ci9vmTwMsxSJdqGTQC9mQE6K7m/B0tyzoRKN2hi4ESM2tw0+hp
 4t99qrnlqFkncGtKtrH3PsudZUdoqb3YT0ykRaCQI9/g9v1rM68lh8eP0WaTbU7MFunp
 IRfZERGRX5A4bSuPYh9M9MA7W+WxDpALvh4qy2TN9UdwIl2Wdumfwmg3QxNsdaAsQVps
 9sk+a3rgeiTQncxwzjeOYF0ChAl+/olqVwPToKdmWoisyPUOmK3ytXKq6jhlWlrxJabN
 KnflyP23HLHx4n51nU5rIek9U3lTmN5Vc2V1r0lhyfEUb3Nf2cS2I5mCc/vIYW5XYbaE
 ptvg==
X-Gm-Message-State: AOAM533S88OZVHE2hdLSB8YDDusmYwdRZzdscX47emIuDm3ZXwxnDRtE
 Gmq6OjJKA+7spHxt5q4HevudTvjlaJLlqcbbVegJLQ==
X-Google-Smtp-Source: ABdhPJzCrKXMDdLXDXqAEB5GIUv0k5E7npGAomI+NZQd7jBeyb84zmgrGhWm2O4AlDjcnRLEraHrM13t0zQVeTLIw5Y=
X-Received: by 2002:a1c:6743:: with SMTP id b64mr1986488wmc.157.1603456287911; 
 Fri, 23 Oct 2020 05:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <1603448245-79429-1-git-send-email-guoren@kernel.org>
In-Reply-To: <1603448245-79429-1-git-send-email-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Oct 2020 17:12:09 +0530
Message-ID: <CAAhSdy1rqZBt5LSgs9yQwewwKXvaS23ou5Ah7Xfu3n7S9sK6RA@mail.gmail.com>
Subject: Re: [PATCH 1/3] irqchip/irq-sifive-plic: Fixup wrong size of
 xxx_PER_HART and reg base
To: Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_083129_046535_E458D8CA 
X-CRM114-Status: GOOD (  22.97  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Guo Ren <guoren@linux.alibaba.com>, Jason Cooper <jason@lakedaemon.net>,
 wesley@sifive.com, Marc Zyngier <maz@kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Atish Patra <atish.patra@wdc.com>, Yash Shah <yash.shah@sifive.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Oct 23, 2020 at 3:48 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> ENABLE and CONTEXT registers contain M & S status for per-hart, so
> ref to the specification the correct definition is double to the
> current value.
>
> The value of hart_base and enable_base should be calculated by real
> physical hartid not software id. Sometimes the CPU node's <reg>
> from dts is not equal to the sequence index.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> ---
>  drivers/irqchip/irq-sifive-plic.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index eaa3e9f..2e56576 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -44,16 +44,16 @@
>   * Each hart context has a vector of interrupt enable bits associated with it.
>   * There's one bit for each interrupt source.
>   */
> -#define ENABLE_BASE                    0x2000
> -#define     ENABLE_PER_HART            0x80
> +#define ENABLE_BASE                    0x2080
> +#define     ENABLE_PER_HART            0x100
>
>  /*
>   * Each hart context has a set of control registers associated with it.  Right
>   * now there's only two: a source priority threshold over which the hart will
>   * take an interrupt, and a register to claim interrupts.
>   */
> -#define CONTEXT_BASE                   0x200000
> -#define     CONTEXT_PER_HART           0x1000
> +#define CONTEXT_BASE                   0x201000
> +#define     CONTEXT_PER_HART           0x2000
>  #define     CONTEXT_THRESHOLD          0x00
>  #define     CONTEXT_CLAIM              0x04
>
> @@ -358,10 +358,10 @@ static int __init plic_init(struct device_node *node,
>                 cpumask_set_cpu(cpu, &priv->lmask);
>                 handler->present = true;
>                 handler->hart_base =
> -                       priv->regs + CONTEXT_BASE + i * CONTEXT_PER_HART;
> +                       priv->regs + CONTEXT_BASE + hartid * CONTEXT_PER_HART;
>                 raw_spin_lock_init(&handler->enable_lock);
>                 handler->enable_base =
> -                       priv->regs + ENABLE_BASE + i * ENABLE_PER_HART;
> +                       priv->regs + ENABLE_BASE + hartid * ENABLE_PER_HART;
>                 handler->priv = priv;
>  done:
>                 for (hwirq = 1; hwirq <= nr_irqs; hwirq++)
> --
> 2.7.4
>

There is no one-to-one mapping between PLIC context and HARTID. Instead,
we have many-to-one mapping between PLIC contexts and HARTID. In other
words, we have one PLIC context for each interrupt capable mode (i.e.
M/S-mode) of each HART.

For example, on SiFive Unleashed we have 5 HARTs but HARTID=0 has
only M-mode capable of taking interrupts so we have total (1 + 2x4) = 9
PLIC contexts.

I would also like to highlight that this patch is forcing PLIC driver to always
use PLIC S-mode context for each HART which breaks the Linux RISC-V
NoMMU kernel.

There is no issue with the existing defines because these are aligned with
above and latest PLIC spec.
(Refer, https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc)

NACK to this patch from my side.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
