Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62681C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 24 May 2022 11:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xf4PAzqck9TPkm1L2B1mupM6gEQJidZKkfQ40U2s+OA=; b=goaLc8mOFdfqx+
	5X9pmwuLc0h6ICoHBPrX86nJGiKBvHMdH/fNh+CyqJRD24Ic5HFz0btUR2SyRLVO4J69Ga9rS4HYi
	pwlo/1TEtuPs8lLmUfsmOIPtaFy7uBO0d1mAu0lIRHeSj/oakzwdh0EGUogmLO2kernlpy9MNykLj
	g2mSBcrgB9qj6nHeG1GQhPaPmVVvS+QDjwNwo0lBvTDQt0/qZCMZtmSJbKJgrfO8DyHi+iNDWYNsu
	CApda8OPq713uaqt0TIxIxT4cONxi9YT7bhnAjLEtQ6NjrUtQLv0gW0JX01p7DrnDRoJC1hpAVuDL
	Zpxx6RzRVGv6s2AiPILw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntSkA-007p6A-Pk; Tue, 24 May 2022 11:30:30 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntSk8-007p5I-3I
 for linux-riscv@lists.infradead.org; Tue, 24 May 2022 11:30:29 +0000
Received: by mail-wr1-x430.google.com with SMTP id p10so6640167wrg.12
 for <linux-riscv@lists.infradead.org>; Tue, 24 May 2022 04:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N2TjPYBfTxyr+DNrjNs2M1CQcfw6+WY+gUO3SgZbUV8=;
 b=CQm5UAeg1hkuSSsutDNG5mlSigGV02SDoqjU1pCYNr5ah4YevJSWr4AlQwCQwgTADA
 Rzxq6t0CYWD0MFIzFIMr8eEcThDGPSsKmJB+J43x5VewBMw0wOPN2v2sStD1uD0CcV+5
 lMhPO2CuOIiIyfabVPzeLQkFQw3i4iUfhB6CvZq0HgMiLGJ9R+khlNSwcUZoVI1v6JQR
 fTaGOLJvyrOqKxqeBpyObRLnv8m9iFNcnorpjp5Mljh3Ks4i8eq6kH09cHJ7FGZCKoAC
 lcYTWNKaE1FjnBW/gzO2bfzncP4dWIxk6CQQa0GO/H2gXyL+cEaFFy6ge2aJgxMRwU0h
 e4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N2TjPYBfTxyr+DNrjNs2M1CQcfw6+WY+gUO3SgZbUV8=;
 b=sJofPxAPNpIGMfS//Fz7g58c5j5VbJccZuAKF47Cykr3ucOisRvWegdeyEgVf9jBqV
 LiJNU0Usr27Fa1RkS75nHzXKtyGYnBVF88cp6+ekDBJRYZc7S2GyTCudz8+jm3J9Pij4
 V1cnoy8Bv7E0TfrrWMy3bS187Em26O4TDyNwLGByGCVafcelj65xpUIvnC1ZiHL9NydE
 gP9dD/B2qgDRU8OnrUjpwYyXFRLUdg9YzAzclLV8u2b+Uiv0buWfZyAmZ+GdJlnKmgky
 ce8wly3kL4Cj16tGbrVzfa28DC6aggJYvcjK2AAWPcYwI14AHWVCS1pNeaI9Cm8yJ03p
 FXIQ==
X-Gm-Message-State: AOAM530bA5ATtWkc2KeQXpl8f2QH4P4dAJE3xJUZM5nCrLUe2XoqsFJ1
 CGSV2Hvut9oomBVbQdnHMso8W2V/rYRB+03+591tag==
X-Google-Smtp-Source: ABdhPJws54/M5QyP1Iw/wARcBHxmm+RAXDaP8SIQZviMCw/5pFWp7jBzGSkS9YpnQFEjlgFR7cqirFzWu6hfZyEmRI8=
X-Received: by 2002:adf:f001:0:b0:20d:22b:183c with SMTP id
 j1-20020adff001000000b0020d022b183cmr22457285wro.313.1653391826736; Tue, 24
 May 2022 04:30:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220426185245.281182-1-atishp@rivosinc.com>
 <20220426185245.281182-4-atishp@rivosinc.com>
In-Reply-To: <20220426185245.281182-4-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 24 May 2022 17:00:15 +0530
Message-ID: <CAAhSdy0wbokRNZrXYcARKx=DpGfQ5gFGJ_1K26U0W99-jZcM5g@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] RISC-V: Prefer sstc extension if available
To: Atish Patra <atishp@rivosinc.com>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@atishpatra.org>, 
 Damien Le Moal <damien.lemoal@wdc.com>, DTML <devicetree@vger.kernel.org>, 
 Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 KVM General <kvm@vger.kernel.org>, 
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_043028_182295_DF2CDA5E 
X-CRM114-Status: GOOD (  19.16  )
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

On Wed, Apr 27, 2022 at 12:23 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> RISC-V ISA has sstc extension which allows updating the next clock event
> via a CSR (stimecmp) instead of an SBI call. This should happen dynamically
> if sstc extension is available. Otherwise, it will fallback to SBI call
> to maintain backward compatibility.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/clocksource/timer-riscv.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> index 1767f8bf2013..d9398ae84a20 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -23,11 +23,24 @@

Add "#define pr_fmt(fmt)" here since you are using pr_info(...)

>  #include <asm/sbi.h>
>  #include <asm/timex.h>
>
> +static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
> +
>  static int riscv_clock_next_event(unsigned long delta,
>                 struct clock_event_device *ce)
>  {
> +       uint64_t next_tval = get_cycles64() + delta;

Use "u64" here to be consistent with other parts of the kernel.

> +
>         csr_set(CSR_IE, IE_TIE);
> -       sbi_set_timer(get_cycles64() + delta);
> +       if (static_branch_likely(&riscv_sstc_available)) {
> +#if __riscv_xlen == 32

Use CONFIG_32BIT here.

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
> @@ -165,6 +178,12 @@ static int __init riscv_timer_init_dt(struct device_node *n)
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

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
