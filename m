Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB5CC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jun 2022 04:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UGHTHYgiMw1mtARAwKxHa4GZ/hotjrMT2wyNYxZ4qlY=; b=r6xT0cniGhkcrN
	/Fxuoc7TtJxckR2c7hY3OaolQyTUjVzm+fOUENz/WPZXbwC7Gu1hqSA3B3JxH+2HFkianKvEktIAP
	DMegz2vBEjZMNux4O0IOTi+9S3vdGr4/H8laxlt3xXz1xVxu5wsow8sxP/fQX5/8dUF0n5lGioJE4
	RX0t+aOTl4vvVz2yW7/XvoarlMBdxy0+Kij3+m0YA1kIokU4IHMb5Ic6nbe9we8tz9tbc3OCJJLKm
	mii3uLWmsRXDrgwXz026x3C+IBoItFQ044R+oM34qDra85M7g+hdSfkoTN5WJmwk6C44LoBngCLso
	jnAk1lLZWTzeYYY4X5/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzWSd-005msH-47; Fri, 10 Jun 2022 04:41:27 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzWSZ-005mqQ-Mh
	for linux-riscv@lists.infradead.org; Fri, 10 Jun 2022 04:41:25 +0000
Received: by mail-wr1-x432.google.com with SMTP id u8so30587738wrm.13
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jun 2022 21:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yt/WwA0fPdpkz+DW1Do2fCGe1LbramqI/akP0aYymAg=;
        b=q7Po0YHXmsuyzhhHC13aDuIszgqL9Hbd6PbRejQui41zVvZUsVWnMh+U6rcN2Sodt/
         h/KyKp/KyzzEyRe3UkmGGaNou1jiZBUxUpAZosChxFarIjKXsw2ccrOyhou1V4wE8q2T
         S4jZiY91degtVO60Fz0K3bZkDxKibL+yaJ/Km0OEvvbevXbagiFEIHYW11HTtBwDJgno
         ct8djD81IMnjOlIts3KBLhK2qJGZCso5qMZSB2V4tZs0r3y9PxQq6PD7rVg90ujhWakh
         Rt6Tsogk5Ki5Dq/8PFMKeg8i6PXr7d/QnKb0ETAs+XlJRvGjlnFVbcL8k+pLt0hJ0Qtz
         twmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yt/WwA0fPdpkz+DW1Do2fCGe1LbramqI/akP0aYymAg=;
        b=MMxHI5jbggxH4vUjZumlqm6/HVDmh+5jXcUHs9SbidF0KBBcA8knR/DfcoYgMehVBp
         DeUzMCWThbmS8pUaO1WWbMhEWMJlI4NgzGfB1kMp8XgH3BlGhzblDYgf+GYIsSKdc6mv
         U2KXIY3O44z6OMuEWIX2Hp6l8J0BgGe0ENRPHA2oiR6RVqxzMTCDwBvHbosciUahnEGJ
         l5PvCpgWhWbUZkRealb44vpWgjhPnKmmu0N9Ko2YCL/gQs9omN3hrxJx3DZHH4mndWw3
         pae2p8QUZcDROOz17GjK2Tpq/y2ozORdoPqXSnd9cyQXazi9zBZD8LxP96NX4k+Hzi5P
         2tNQ==
X-Gm-Message-State: AOAM530Jc9Fnu2PzOIbRk5cHlbjAZBDYYaWA80RnCIzuj9Q804UcuV+i
	f13f7AgbMPcu1DAKJQ5rduEc5EIT/YDyWW5xG+zhnA==
X-Google-Smtp-Source: ABdhPJyEHkhtUsa7VS+Z9pjWWeNx1hKCBu75zYTWG1q9BxBnEuaMRuqcwOdxyMWY7IzMybJ5MVOxNs1qSycr+w1MeaY=
X-Received: by 2002:a5d:6384:0:b0:210:5f39:53af with SMTP id
 p4-20020a5d6384000000b002105f3953afmr40247331wru.346.1654836078797; Thu, 09
 Jun 2022 21:41:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220527042937.1124009-1-atishp@rivosinc.com> <20220527042937.1124009-4-atishp@rivosinc.com>
In-Reply-To: <20220527042937.1124009-4-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 10 Jun 2022 10:11:06 +0530
Message-ID: <CAAhSdy3DXobZK-QSJ9tvG+hLEOD_dz4eqD7yO=Pna1ghhMghKQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] RISC-V: Prefer sstc extension if available
To: Atish Patra <atishp@rivosinc.com>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atishp@atishpatra.org>, Jisheng Zhang <jszhang@kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_214123_967317_23784101 
X-CRM114-Status: GOOD (  21.20  )
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

On Fri, May 27, 2022 at 9:59 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> RISC-V ISA has sstc extension which allows updating the next clock event
> via a CSR (stimecmp) instead of an SBI call. This should happen dynamically
> if sstc extension is available. Otherwise, it will fallback to SBI call
> to maintain backward compatibility.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/clocksource/timer-riscv.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> index 1767f8bf2013..881d9335c92d 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -7,6 +7,9 @@
>   * either be read from the "time" and "timeh" CSRs, and can use the SBI to
>   * setup events, or directly accessed using MMIO registers.
>   */
> +
> +#define pr_fmt(fmt) "timer: " fmt

The "timer: " prefix is too generic. I suggest to use "riscv-timer: "
as a prefix.

> +
>  #include <linux/clocksource.h>
>  #include <linux/clockchips.h>
>  #include <linux/cpu.h>
> @@ -23,11 +26,24 @@
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
> @@ -165,6 +181,12 @@ static int __init riscv_timer_init_dt(struct device_node *n)
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

Apart from the minor comment above, this looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
