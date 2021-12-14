Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A0EC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Dec 2021 02:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OtaBzpCJKKjHTJwLoifU7rLRCf1I80cjCGAlVFrR9aE=; b=JeKixtPlO9aHYx
	U8leMk/FcyJkkzs+H8FFmQtq2Ii9R4XjA8NTRJrl+4mQRlq/veQSKLMm6cL1yTplm+YdjPRAXXcmT
	c96j5aUkTKRc+OPeMAuwaMn5nkqGrFcISBz3VvM/JA/j3XqSnp1GAGD05/HF0N7zJ2HRgeFk5OR+2
	nwLfct8CxgIbpWcGITmZnQyQBiCBO4AfECG8W39w+6w/ZyMEOdrSDVmlKspRnt7EixH+d9+UyjXLq
	asKrhBCc6J7VSIr+7qN4kPpUAD2BFjdcR170mN35yldQ50AQjU41nBNo8GnHWiMxYqloNcTZv61TB
	QRJgHSi4XCbQS3xNq3lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwxH3-00CEXB-CY; Tue, 14 Dec 2021 02:10:37 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwxGz-00CEVT-NL
 for linux-riscv@lists.infradead.org; Tue, 14 Dec 2021 02:10:35 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id y68so42911669ybe.1
 for <linux-riscv@lists.infradead.org>; Mon, 13 Dec 2021 18:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GAXZoZ3EFDtBL37QoL2ndUIo48v0GNpHWK6/yjRwd2s=;
 b=VOTTyUATYC3+c3QtXef2Qo4WgjoSSjv3noSRdCUaOZisjTXXz+5qkNO27kB2+RdHO9
 XFfXD8KdDvVBIfJrGXVZ0RVyqbgUOlErL6GVFzkcnlRNue5sJ9Si69j3z+TyXpAw3zzq
 Avmh7KYiXOkBi2PHFOFlIHEMvjTYxTxWc6cMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GAXZoZ3EFDtBL37QoL2ndUIo48v0GNpHWK6/yjRwd2s=;
 b=d1vPbwNJWU3gZv7gQxRmxEqHpBRr9cM9bo3ek7/tHbcQdgAXcZOU/IMOI95eH0ZM5c
 Ivd43giLEIfncrxD1dd5Zrv9EJT+KYgmVxcCt0wJquV1JII7omqnHr29AqDCXQR/acq7
 zFGMH4iCUJ9KAceGk4Uo1mPQDyJls3uHBxL/dj7LxYKozuO6kWFlkkskWgc/Ge8Y6Gt8
 0iorYU8IxCN8ZY9mF3YNZZf8lBzYa+W5KcjNPel2jkkigke6thauXzhMu86wnLlDRr54
 56VFmyDfm/B8BC9y7JeNYbTHvlk2+T2agoyaIq9GNCM7xYA1sbMtcF5ohS5RqGUqPTMX
 EcZw==
X-Gm-Message-State: AOAM532p84j3vsqEtIK0IRb45eqYG1rq3BICMR0sDlZDT7/8AI5djkiP
 5mECgpxnsOe4yrg4+oPOSWweDSuURbxo/5aFiVWs
X-Google-Smtp-Source: ABdhPJzOutjL1vlk/mUNkO/y8VX2nocICwAi15va+e2zQF6T0XtuSBvkrxps3ca837moS2DfgfxS2FZtTFJO4ZrHi14=
X-Received: by 2002:a05:6902:568:: with SMTP id
 a8mr2874193ybt.472.1639447832415; 
 Mon, 13 Dec 2021 18:10:32 -0800 (PST)
MIME-Version: 1.0
References: <20211213112034.2896536-1-heiko@sntech.de>
 <20211213112034.2896536-2-heiko@sntech.de>
In-Reply-To: <20211213112034.2896536-2-heiko@sntech.de>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 13 Dec 2021 18:10:21 -0800
Message-ID: <CAOnJCULdeHn4GmrP8PLsWS43g=HYjUwiA2txisEqgzSmuCoA7w@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: provide default implementations for
 __sbi_set_timer and __sbi_send_ipi
To: Heiko Stuebner <heiko@sntech.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
 Jisheng Zhang <jszhang@kernel.org>,
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Nick Kossifidis <mick@ics.forth.gr>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_181033_839061_9E5A3354 
X-CRM114-Status: GOOD (  19.83  )
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

On Mon, Dec 13, 2021 at 3:21 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> The mentioned function pointers get called from different sbi functions
> which may get called from other areas of the kernel without fully
> checking if the sbi initialization was done.

SBI initialization happens in sbi_init which is called from setup_arch.
setup_smp happens after that. Thus, there won't be an IPI issued
before SMP is set up.

For __sbi_set_timer, the first time it will be called from this path.
time_init->timer_probe->riscv_timer_init_dt

time_init is called from start_kernel after setup_arch. In fact,
setup_arch is called very early
in the start_kernel.

Is there any other scenario where these SBI functions can be invoked
before SBI is initialized ?

>
> So similarly to sbi_remote_fence_i, provide empty functions for them
> to prevent any null-pointer dereferences in the future.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/kernel/sbi.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index 69d0a96b97d0..6a21345c6712 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -14,6 +14,13 @@
>  unsigned long sbi_spec_version __ro_after_init = SBI_SPEC_VERSION_DEFAULT;
>  EXPORT_SYMBOL(sbi_spec_version);
>
> +static void __sbi_set_timer_none(uint64_t stime_value) {}
> +
> +static int __sbi_send_ipi_none(const unsigned long *hart_mask)
> +{
> +       return -EOPNOTSUPP;
> +}
> +
>  static int __sbi_rfence_none(int fid, const unsigned long *hart_mask,
>                              unsigned long start, unsigned long size,
>                              unsigned long arg4, unsigned long arg5)
> @@ -21,8 +28,9 @@ static int __sbi_rfence_none(int fid, const unsigned long *hart_mask,
>         return -EOPNOTSUPP;
>  }
>
> -static void (*__sbi_set_timer)(uint64_t stime) __ro_after_init;
> -static int (*__sbi_send_ipi)(const unsigned long *hart_mask) __ro_after_init;
> +static void (*__sbi_set_timer)(uint64_t stime) __ro_after_init = __sbi_set_timer_none;
> +static int (*__sbi_send_ipi)(const unsigned long *hart_mask)
> +                           __ro_after_init = __sbi_send_ipi_none;
>  static int (*__sbi_rfence)(int fid, const unsigned long *hart_mask,
>                            unsigned long start, unsigned long size,
>                            unsigned long arg4, unsigned long arg5)
> --
> 2.30.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
