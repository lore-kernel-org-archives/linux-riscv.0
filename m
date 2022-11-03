Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28F8C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 07:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dkUhvEa4yBBtELcTatM+IGZ4cq/DSla6A8CsosQFlkk=; b=ARag5t0r7+dXAm
	/yvBMjrErKgh0uRgUvDCNnxqXKrcRWboEmZqmrE+S8ZEo3lHF3ac6YUY3VyV6gmS02yXoYz1n2AHY
	9im5bLabOB8K6aXPkQuh8S2TFR5mZyB9oYsFZYTRKEQ8EPbm9hcotG/NsENtuO3CETVstpR9v48lR
	MJBVNO8lc22154Rw218nyMO+dsSfaQh8wvNm6eqeh8ccx6Le2XxYhcib3pb18Fk5bkVtx4/2GaqN4
	IP03UTBZzK60upoQtsZLvkZQm3rQh50Mg+sjZcefdWJyq7CunQieORyCOV0qhmXBfk2BcL6Uhg8MK
	dprd49BS9DH60fAhXU5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqUEU-00GMmq-9o; Thu, 03 Nov 2022 07:01:46 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqUES-00GMlr-Al
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 07:01:45 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-1322d768ba7so1202267fac.5
        for <linux-riscv@lists.infradead.org>; Thu, 03 Nov 2022 00:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HFl2tiLTXJHgEZTu1xIg/gZ9TOZ7sZx0xZjb4nLSMXI=;
        b=LudiUqHjGWLNiypWWy7zwlu/lwyQQFFTrVfRVN77odSuy+yfFQ7WAzfy6anrgzNQO6
         RTpZjr62UuMQtqCdMpxV4aejSX3SFmmUNjgzOd88enksbA+XTt0QxrtZF2l0NcUiFKHa
         LO8jjsPTbfV4wrY3di29eYaCg0jtVH0gJHVNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HFl2tiLTXJHgEZTu1xIg/gZ9TOZ7sZx0xZjb4nLSMXI=;
        b=xN5+cMkdNRcILGIyn7w+3zstwNTo8F7ETFF3/QH+XGhezjYnUyHsMht+Bw4IDbVvWY
         jKO9pOU9J84GdJ60M5efnB7F8ygzHEQBV7Zzu8jAk1M81AqFqJ1+XV0owti4EM3sm6a4
         BIr1mfeCEX1BGRqnkIhG9ZqxbcYF1pbFozuxZKQKidCSGaZDa7CInZoJPHLq+2QtmYtG
         0r8rgE1n/jp5TakrZ6wpNRGaOuEjcrIBEtEvalTME8vzm8b0Y9xg8pRm2RlfYKnJfb9u
         eIH1AWnP9s01xw71G15vCfKXBf86kWNemVrapREDSIjqPyKknxnD47dYXO0U4MYYdpQV
         gk3w==
X-Gm-Message-State: ACrzQf3eCMlNaoMCU5E2h4eJGphvWmK7ISj2tH68b1NZW+5YF/zc6wov
	F4GyPK8xdQldw577lhbz7ZSjAIXWVRqHhUwUBlXR
X-Google-Smtp-Source: AMsMyM6mancOWurIa1sMKWFiSwhCtQ5JKZTWkDDFIpQ+TyrpcY4TVnJfKYmexvi1zHnIsgXUg3Y76Gf8nQXi420QfvM=
X-Received: by 2002:a05:6870:8921:b0:13c:39cc:e168 with SMTP id
 i33-20020a056870892100b0013c39cce168mr26457854oao.274.1667458902866; Thu, 03
 Nov 2022 00:01:42 -0700 (PDT)
MIME-Version: 1.0
References: <20221101143400.690000-1-apatel@ventanamicro.com> <20221101143400.690000-8-apatel@ventanamicro.com>
In-Reply-To: <20221101143400.690000-8-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 3 Nov 2022 00:01:31 -0700
Message-ID: <CAOnJCUJDbV_0WPM9dbsqq60Y_=mEPknEZDGFCFbmxK-FVgn22Q@mail.gmail.com>
Subject: Re: [PATCH v10 7/7] RISC-V: Use IPIs for remote icache flush when possible
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Alistair Francis <Alistair.Francis@wdc.com>, 
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_000144_394913_BC07049A 
X-CRM114-Status: GOOD (  19.06  )
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

On Tue, Nov 1, 2022 at 7:35 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> If we have specialized interrupt controller (such as AIA IMSIC) which
> allows supervisor mode to directly inject IPIs without any assistance
> from M-mode or HS-mode then using such specialized interrupt controller,
> we can do remote icache flushe directly from supervisor mode instead of
> using the SBI RFENCE calls.
>
> This patch extends remote icache flush functions to use supervisor mode
> IPIs whenever direct supervisor mode IPIs.are supported by interrupt
> controller.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/mm/cacheflush.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index 57b40a350420..f10cb47eac3a 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -19,7 +19,7 @@ void flush_icache_all(void)
>  {
>         local_flush_icache_all();
>
> -       if (IS_ENABLED(CONFIG_RISCV_SBI))
> +       if (IS_ENABLED(CONFIG_RISCV_SBI) && !riscv_use_ipi_for_rfence())
>                 sbi_remote_fence_i(NULL);
>         else
>                 on_each_cpu(ipi_remote_fence_i, NULL, 1);
> @@ -67,7 +67,8 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
>                  * with flush_icache_deferred().
>                  */
>                 smp_mb();
> -       } else if (IS_ENABLED(CONFIG_RISCV_SBI)) {
> +       } else if (IS_ENABLED(CONFIG_RISCV_SBI) &&
> +                  !riscv_use_ipi_for_rfence()) {
>                 sbi_remote_fence_i(&others);
>         } else {
>                 on_each_cpu_mask(&others, ipi_remote_fence_i, NULL, 1);
> --
> 2.34.1
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
