Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C728C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 04:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vXqoofIrUoxQ6vHjOwgcGIUrhV641ytc+p27Sw2SPWY=; b=AdxrQCQbTZBU5e
	6LR4abn7UCZ68AdeM4u8u+x99TMNQUfkZWvfz2YrvpWqkqzeJx5qfx3zpu76nPbjyTq0/RNJ0Sk/3
	Zo2GAMsoG3bkBVr/C4o7lkiPKl/xC4PEL5YmkeJ8UFQ+NiZYeFdoQEGd8V8Enw05agHOgISmaQdRy
	onUrIffKXDb7X8/PQ/roammpSY1idx+54ddbcxYg54HS7XWFRsdQqJsgiDaPzTbsZSUFdnFsMpBIX
	kGrnRHPC+QRsmz4AMrO1qn1XTW3GgcFG82HcBqlvBn/SPwwkbcbtYUOZn+BThC9NUWbvRj8NhPGw8
	M6tHYKzUfA6flgF1yN1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNQug-00EJa9-1a; Thu, 02 Feb 2023 04:09:30 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNQud-00EJZl-6c
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 04:09:28 +0000
Received: by mail-ed1-x532.google.com with SMTP id m8so747162edd.10
        for <linux-riscv@lists.infradead.org>; Wed, 01 Feb 2023 20:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TTJu9WAGKrGHk/ml0vQ4sKDRHcICD0LMTOQAJoDVC9E=;
        b=viDjWUlS5WJStNg7sBNUvwL5mMHZQuzjK5aEYNb4Ft0akFH4gBbFQcToKZTrK+KGd8
         s/PbmEkIy7XGRnNBo0ZzG9leDOUseTpyoRWdjForYYbc232Mt8t/k9FIL9kZ2GHTQ8lJ
         yFD6nB7uBZTe07suK8Peq63Tqcu4dF/RLoVoW7xskUMa6TkwIpF8+eFKQjM/q2xMCA6H
         1r7++suCgkT3RryiPexXMJ8bT3yn6w0ZRpcn6bkK/wcQSuKy47F4UYsaOLdxxPTTDpnt
         /k/nMiLdN3bx1yM7ggNgLEfyX6zn0Ttx71A8XGM8yPQT+Mav8JkiN2jl7XyQrmJjJ0O6
         U4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TTJu9WAGKrGHk/ml0vQ4sKDRHcICD0LMTOQAJoDVC9E=;
        b=DY4KNYIQB2q288ohfXiflrpbb/lNOYjWiA1XBybZ/nD+jyiv/Pp6d57G7cIoSSCtsm
         smqU7oRZKoxyAneHGZmuDvVcsE7o56Tmql5eXr0XTcG1hBGk0Xl/aYeJh6Qqmkh+X4Z5
         fZMgmTwez3z39AIjdBO7ncyV5dv7uGkKAhh27Fo/A0nXlcJbwrZeR5j4m8DBPz6nuSJQ
         UpOCkL3y47LnUKuZPKPq8jmZgE6Y7G27zpIRRc6S+0xU1BlkjqzJWiDHgBZ/kw6+Hgk0
         F+mQ8qt0D69QHybEfbjJzjIc5l0NKyIwbZ6ny73MdMYSU5+yMojsc3pYY2MplWS19at5
         IPhA==
X-Gm-Message-State: AO0yUKXgxitoztqPPJL+pAkINWhEK+pmQLKuOKTUyX8R1wIG7OwCqEKQ
	tTlAZ6pyKFY3/b0HFyhH+9ekTxhLPcPTA/CsvDOBPg==
X-Google-Smtp-Source: AK7set9QzhOs2N4Qnsql14QROCMN0P3BspaWH8gwT5Gx/aBQLnwv74nrpL40AUNFn8KZ/a7tcpPDNQauWdF2KKCDNkY=
X-Received: by 2002:a05:6402:25c1:b0:49c:1316:d9d1 with SMTP id
 x1-20020a05640225c100b0049c1316d9d1mr1478262edb.12.1675310964502; Wed, 01 Feb
 2023 20:09:24 -0800 (PST)
MIME-Version: 1.0
References: <CDDAB2D0-264E-42F3-8E31-BA210BEB8EC1@rivosinc.com>
In-Reply-To: <CDDAB2D0-264E-42F3-8E31-BA210BEB8EC1@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 2 Feb 2023 09:39:14 +0530
Message-ID: <CAAhSdy3PB6tM=Q9fXn_Hs95UvkXT7kyuWvw5S1Fqimwf7qB2TA@mail.gmail.com>
Subject: Re: [PATCH V2] clocksource: riscv: Patch riscv_clock_next_event()
 jump before first use
To: Matt Evans <mev@rivosinc.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_200927_285243_48D28FE4 
X-CRM114-Status: GOOD (  17.55  )
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

On Thu, Feb 2, 2023 at 1:19 AM Matt Evans <mev@rivosinc.com> wrote:
>
> A static key is used to select between SBI and Sstc timer usage in
> riscv_clock_next_event(), but currently the direction is resolved
> after cpuhp_setup_state() is called (which sets the next event).  The
> first event will therefore fall through the sbi_set_timer() path; this
> breaks Sstc-only systems.  So, apply the jump patching before first
> use.
>
> Fixes: 9f7a8ff6391f ("RISC-V: Prefer sstc extension if available")
> Signed-off-by: Matt Evans <mev@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>
> V1 -> V2: Commit msg tweak.
>
>  drivers/clocksource/timer-riscv.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> index 969a552da8d2..a36d173fd6cd 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -177,6 +177,11 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>                 return error;
>         }
>
> +       if (riscv_isa_extension_available(NULL, SSTC)) {
> +               pr_info("Timer interrupt in S-mode is available via sstc extension\n");
> +               static_branch_enable(&riscv_sstc_available);
> +       }
> +
>         error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
>                          "clockevents/riscv/timer:starting",
>                          riscv_timer_starting_cpu, riscv_timer_dying_cpu);
> @@ -184,11 +189,6 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>                 pr_err("cpu hp setup state failed for RISCV timer [%d]\n",
>                        error);
>
> -       if (riscv_isa_extension_available(NULL, SSTC)) {
> -               pr_info("Timer interrupt in S-mode is available via sstc extension\n");
> -               static_branch_enable(&riscv_sstc_available);
> -       }
> -
>         return error;
>  }
>
> --
> 2.30.2
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
