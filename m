Return-Path: <SRS0=Owia=PX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C8AC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 14:41:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 583AB611C1
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 14:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 583AB611C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y8KfAZRSULV5lPlmvOvp69BtoLO7w9FqTAkeW3iAbs0=; b=BBhScngLhajdCh
	3di9EA3CNBfi3dF9N9Dit6GgzftM5Cd9fh/73Ct2vOMf++aqmpMLmHdjIwbm0CjpjwnG8q/CA9ho/
	aoHuUpNZblFCLi1LYcz12gilQlz6DCPVAWAZWQv1zfpyvSvOKYz1nNPRcb3v2ClZY3mNtn0iJ7eBX
	8wmTFwf8YOMa9NdS9CkDUwEKUF4QnRL5firhuxcB+3F7bxYzhlNVIL14VrYZ27niYSDinqVu7gadu
	t6AD35Wbgy+uLR/vVzemk1DL25CWq55NKMiPr37qnFJTYOvZnw3zlDjoS77PjM66kdWm3/3IItOPb
	II6duqm6LGpbRUfFDfcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1midvJ-0097US-9x; Thu, 04 Nov 2021 14:41:01 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1midvF-0097Qv-63
 for linux-riscv@lists.infradead.org; Thu, 04 Nov 2021 14:40:59 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso4439864wme.3
 for <linux-riscv@lists.infradead.org>; Thu, 04 Nov 2021 07:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nyuCyLm/+Cp5VpSzLU2JwivIu6Iv13snX4mcokUnZ4Y=;
 b=SH3ndSYCP/bHAlWNLB1MbaFI/72dBEASUdlQQ7eJxe3gDQjJ/KMiAznjkZ2K3Lp71D
 lXi8E2AWj6iCyasDkgwWggsuB8+juIwv2Ovz4Bna3ia7l2GW2PBZziH9VE8W9a6wQ8u0
 iAJBzdnxV2J5vdkBrTaH2Q93YPiV21zj4o02ZO/RmbI/qwFgnMBoHC+0BUW5PVdGu9kE
 lo77XFrM+j4F/dizCnoVAdFIu/q4RNadLRH7bjPlg+z9rOZstoNoaceX2JFsa/xCayy+
 8iKFsawG2559lItA7JCsqIQaelr0nBWrTVw+Plt79HoL+79Hy+g3gsUiIJuX/xwMab/M
 ezFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nyuCyLm/+Cp5VpSzLU2JwivIu6Iv13snX4mcokUnZ4Y=;
 b=HjM2UvNSK4WIiARn00jpxavnMPp9otm3d5FY01to0FstFM0APh6+0ou6Qfu6Gx+Hxw
 xO8NGwPDO/cAoefPgKAkAWLOw1/bcd2zg5JmCJCM3xesA5XQR9ezf6vWgBBndSzBztlN
 hmaC/hDGtKyQoxsba8N07d2rFnDspsZ0kND+OU4NirRqj8uXnLu/yEBS2kvivYDvmGNc
 9oRO5yBVSiYz13PYVEHxn8UlftAo59U1iuWtuSxICOtW8I0hWRwja48B2CJwgahoumpM
 oqfUKZAf06YQEEE2aO81nPTOqD91SWc0yDEJO0D3zYPcxlms12ySSh7biw5Ob/rIGPnf
 DTWg==
X-Gm-Message-State: AOAM5333+vQ95DeStR6xe/mkpi8KhTPgYWUFcDtKwmvaaPujxPeKke54
 HCGQUzPJXYw2xyQPIBOmDs69FzJNQXS4wLlzx5iZLg==
X-Google-Smtp-Source: ABdhPJxPqhtBmS9Ugwa8o1VEJiVrNuUxJgAEgguDvhGyQ6C+AmAYClWzPJC7tg5ZeC+IFaftXrt709GPGeY6jpuz1Io=
X-Received: by 2002:a1c:20cc:: with SMTP id
 g195mr15471504wmg.137.1636036854247; 
 Thu, 04 Nov 2021 07:40:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211101131736.3800114-1-guoren@kernel.org>
In-Reply-To: <20211101131736.3800114-1-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 4 Nov 2021 20:10:42 +0530
Message-ID: <CAAhSdy29qhF4JHuMOqwctn+=HQNBbR3X0gsymqD8OAF1pXE43A@mail.gmail.com>
Subject: Re: [PATCH V6] irqchip/sifive-plic: Fixup EOI failed when masked
To: Guo Ren <guoren@kernel.org>
Cc: Atish Patra <atish.patra@wdc.com>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Vincent Pelletier <plr.vincent@gmail.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211104_074057_266662_C973F5FC 
X-CRM114-Status: GOOD (  29.92  )
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

On Mon, Nov 1, 2021 at 6:47 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> When using "devm_request_threaded_irq(,,,,IRQF_ONESHOT,,)" in the driver,
> only the first interrupt could be handled, and continue irq is blocked by
> hw. Because the riscv plic couldn't complete masked irq source which has
> been disabled in enable register. The bug was firstly reported in [1].
>
> Here is the description of Interrupt Completion in PLIC spec [2]:
>
> The PLIC signals it has completed executing an interrupt handler by
> writing the interrupt ID it received from the claim to the claim/complete
> register. The PLIC does not check whether the completion ID is the same
> as the last claim ID for that target. If the completion ID does not match
> an interrupt source that is currently enabled for the target, the
>                          ^^ ^^^^^^^^^ ^^^^^^^
> completion is silently ignored.
>
> [1] http://lists.infradead.org/pipermail/linux-riscv/2021-July/007441.html
> [2] https://github.com/riscv/riscv-plic-spec/blob/8bc15a35d07c9edf7b5d23fec9728302595ffc4d/riscv-plic.adoc
>
> Reported-by: Vincent Pelletier <plr.vincent@gmail.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Atish Patra <atish.patra@wdc.com>
> Cc: Nikita Shubin <nikita.shubin@maquefel.me>
> Cc: incent Pelletier <plr.vincent@gmail.com>

Please include a Fixes: tag

Also, I see that you have dropped the DT bindings patch. We still
need separate compatible string for T-HEAD PLIC because OpenSBI
will use it for other work-arounds.

I suggest to include to more patches in this series:
1) Your latest T-HEAD PLIC DT bindings patch
2) Separate patch to use T-HEAD PLIC compatible in PLIC driver

Regards,
Anup

>
> ---
>
> Changes since V6:
>  - Propagate to plic_irq_eoi for all riscv,plic by Nikita Shubin
>  - Remove thead related codes
>
> Changes since V5:
>  - Move back to mask/unmask
>  - Fixup the problem in eoi callback
>  - Remove allwinner,sun20i-d1 IRQCHIP_DECLARE
>  - Rewrite comment log
>
> Changes since V4:
>  - Update comment by Anup
>
> Changes since V3:
>  - Rename "c9xx" to "c900"
>  - Add sifive_plic_chip and thead_plic_chip for difference
>
> Changes since V2:
>  - Add a separate compatible string "thead,c9xx-plic"
>  - set irq_mask/unmask of "plic_chip" to NULL and point
>    irq_enable/disable of "plic_chip" to plic_irq_mask/unmask
>  - Add a detailed comment block in plic_init() about the
>    differences in Claim/Completion process of RISC-V PLIC and C9xx
>    PLIC.
> ---
>  drivers/irqchip/irq-sifive-plic.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index cf74cfa82045..259065d271ef 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -163,7 +163,13 @@ static void plic_irq_eoi(struct irq_data *d)
>  {
>         struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
>
> -       writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> +       if (irqd_irq_masked(d)) {
> +               plic_irq_unmask(d);
> +               writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> +               plic_irq_mask(d);
> +       } else {
> +               writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> +       }
>  }
>
>  static struct irq_chip plic_chip = {
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
