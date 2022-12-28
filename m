Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B37C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Dec 2022 23:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZfLH3m0KH/lr1l3ssmIRRfVRSmZipop7sklaegC9YIg=; b=nkzSvuJx1BP8Ha
	6VmGbV1pwu6d2YW5uiVs/8CoLkviZCbzNY2T8vmFIDrz/B+8lEaVGo1b68gPU4PDQahiN5yGe8Tdm
	9/iRyxC9jm8W90nbxK2iWc1bdVi2BPsSAEiue+/axwxNZygG8/U39hCIy69uhZiX+vb9A8gZmOAye
	EbrCjsok4Vvow3NvMAUvMg2VM1cydlF3Ehda1JtU8+EmHWbDf9hXXVW6E+DwN/jDlEBB+aKl5dmM6
	XHqSOQ7w1bqdSWKGSFFyLA3WuTKs7KTn9QJK4eQY3FvEcPHAsTP3thdExhzDlrBT0ztgbRsceqd4Z
	JnUHHCm6Ks/B4uuyFl3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAfsE-009Ihk-UZ; Wed, 28 Dec 2022 23:30:15 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAfsB-009Ido-WD
	for linux-riscv@lists.infradead.org; Wed, 28 Dec 2022 23:30:13 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-48641a481dfso66997977b3.11
        for <linux-riscv@lists.infradead.org>; Wed, 28 Dec 2022 15:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kJfpsuGmkRtYVHaS0jk9a9geCrWPkqTErNlvnVy7Oyo=;
        b=WxJtATyOD4OIRpZx7krCFnAd+CpK6cDQR2tbagDrzy77BZCbPEZydAV3rx+LbQGJwv
         hORrcoY6fb0ohy8fjUVzwQlrDNhbgWs1BdSyx05NBZF/2jOlzO/HHWXg6Qc8GADgQELw
         SSiZ/edoZOzRt/jjtTTzbU6ZuE06ykAb5c18rQpN83FgZZIRApp8hYvmKuiG8U6402+i
         vLAGySHaOiMAW1RB9C5/9BEhQ/u+pauK2bz5d6lAHXCqoJVwBPCblp/qMSOwjT2GEyjL
         MYWDqNQbeRUNjFOWdWQPTeKVvwamfvxzGGZ+l6EbTApwaNqyTlL1H4L0B/dobLPsbgKp
         xpeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJfpsuGmkRtYVHaS0jk9a9geCrWPkqTErNlvnVy7Oyo=;
        b=HxB/7CqZc3MNNVzm6vWLgwB7UBUBkVNQ20lQY/mxR6pYJ+b1ofLFOS1hO976ZLoaqa
         4RDPlSE2MFFN6K0wLZUslJZwZBqkTfrnplDlx+jNB95MQa8rd9LLRQmg00cJ2p8n+B/c
         pN+8iNEiSPmvZSakmOGQSl4uk4eXd4AuqtyI4gCn4w0rxw+rVa9XmrSV0iPwfAdXd8Aq
         XYJPn9Qr527TZho1avpe+a1cWTHkC6hHEh8yZkElvSuRB3ZesLUK/38TZu+orKlq/AB3
         plYT6nYDtqtxmVVRPfEEJVLeMYKyL5IsDxpsj8rr0FImXTkiPBMAEYbB+AD3ZNt41wZz
         wpNA==
X-Gm-Message-State: AFqh2kpVLcc3uKr+dqcbsjIFCCSweCGx6SenIdWWhnGx0taYYYFgyBYW
	Y5fIEoUW3EIbkVtCGWSqqGdJW0XhzGQpipqBQu0=
X-Google-Smtp-Source: AMrXdXt+whyfBdIz20L32St7MHdPXiMGOmwCGGnuNkHC1oGLlDYrUVHg6UnzAE/waSW8hu8c/N/ONhO5/dE+1inDjcY=
X-Received: by 2002:a81:1495:0:b0:465:d978:9724 with SMTP id
 143-20020a811495000000b00465d9789724mr3223519ywu.249.1672270209780; Wed, 28
 Dec 2022 15:30:09 -0800 (PST)
MIME-Version: 1.0
References: <20221228004444.61568-1-samuel@sholland.org>
In-Reply-To: <20221228004444.61568-1-samuel@sholland.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 28 Dec 2022 23:29:43 +0000
Message-ID: <CA+V-a8t6pL-LrtwZzicUzC67yzZgE3hzHH+MNvdj5LuH7g3s6w@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/riscv: Increase the clock source rating
To: Samuel Holland <samuel@sholland.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_153012_093996_D757114C 
X-CRM114-Status: GOOD (  17.14  )
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

Hi Samuel,

Thank you for the patch.

On Wed, Dec 28, 2022 at 12:44 AM Samuel Holland <samuel@sholland.org> wrote:
>
> RISC-V provides an architectural clock source via the time CSR. This
> clock source exposes a 64-bit counter synchronized across all CPUs.
> Because it is accessed using a CSR, it is much more efficient to read
> than MMIO clock sources. For example, on the Allwinner D1, reading the
> sun4i timer in a loop takes 131 cycles/iteration, while reading the
> RISC-V time CSR takes only 5 cycles/iteration.
>
> Adjust the RISC-V clock source rating so it is preferred over the
> various platform-specific MMIO clock sources.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>
>  drivers/clocksource/timer-riscv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> index a0d66fabf073..55dad7965f43 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -73,7 +73,7 @@ static u64 notrace riscv_sched_clock(void)
>
>  static struct clocksource riscv_clocksource = {
>         .name           = "riscv_clocksource",
> -       .rating         = 300,
> +       .rating         = 400,
>         .mask           = CLOCKSOURCE_MASK(64),
>         .flags          = CLOCK_SOURCE_IS_CONTINUOUS,
>         .read           = riscv_clocksource_rdtime,
> --
> 2.37.4
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
