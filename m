Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C568C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 00:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iw7kXTACIlaLwblcAvcIn9v6MC/DmB+g91plpg5Rs6g=; b=uSx6ud3Dj/DMpA
	mNUZJVOtGzBH6rABtyXxhKbun8u8tSdqxSbsJTjhmf5jHT626qtE6j9gsf4KkEhRH/wzsLWTR/NjM
	8oZ+elTrplEYUfekXX5UrEFFyqVlURmTVkz4eprmtgysj9g2ahQ76H7zA8J9p43BP34JgFsxzCpMh
	nuq4vvdwOjdyAUMdIjxOKgxD3BLXLM0AnDbI1bYlw+RRUpugqMZiDTh2j3NXphi8WVMU+rayX3f5g
	Tx3MOefhhvqFjsQzTjgHfkM0ozcW2GycETl0KYYXhSEz/k/sV3y1Gvd3AWPYkl4xbXW9fRAZa0Ujr
	weRBcdQuChnAyYHYGxYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK8dR-0056tw-AS; Wed, 16 Feb 2022 00:57:33 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK8dE-0056qO-9J
 for linux-riscv@lists.infradead.org; Wed, 16 Feb 2022 00:57:21 +0000
Received: by mail-yb1-xb34.google.com with SMTP id v63so1248505ybv.10
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 16:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U8G5LYNj0LAd4VWKhX4PRkQunQsiCSSKv2IZ3Pf+XZs=;
 b=gpERkwaSaLIxACa9WIVhxhGtJssexFQa3ON9pkBRsTjx4PNq0MQw2kjCHUZz4hQjFI
 X4MeU8dMf0P33tjb48vBqe9UNBGOrBYQpILedHOhpC7eX44P1DuShRsNX9XjfoAcud+f
 y8FClYnR/o87poChRgDdKBi4llSa+2dvnrZXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U8G5LYNj0LAd4VWKhX4PRkQunQsiCSSKv2IZ3Pf+XZs=;
 b=ClE94VHtce4aUk0uQhZBVeJeLpvMEQ70q5pwAOfT6ghjkP5ZY+GTitWxrd82bD0f8g
 NxPpcjsKVneYhh1bF6tJxQpK27AyBOtsPAinEKTJfJ3kuxXBj9PIUuwmVRijVpSWRYmf
 TcIsUKVLfgfvg38c3DM1kMBzlIQxegahvg4cCnPNhVaSW8xkD8LZTzsg8xR2jGPQDksX
 WspVxk7W621LnSr23csvxyL1I+qXZF4kbtW63h0xZ+fUJqyc+rFbGfEyS6MDMHkaBppC
 oeinQvJTcFM+qx8sIPilNH9bxZQGRAfbol+WGrM4Het2S48w5AJHkaliPiBYjdHG9/Ki
 Jo9w==
X-Gm-Message-State: AOAM532VL4xdQSgkYilebT9XHVsU6th8K9eV4RvkkLJmufrQa3tcO4Fh
 THJM3Q8/IbFcuiZoZTP9dImx0+MZ4kINWfXLcICa
X-Google-Smtp-Source: ABdhPJxWU3rQFdHx9DRWoyTLBAygvzH/GruMqzNlGu+Yz+32ovLqbluWBIZUb8NNplrLnx1jx1ox/IdWtkgRPbbh3v8=
X-Received: by 2002:a25:9388:0:b0:61d:6ff8:6472 with SMTP id
 a8-20020a259388000000b0061d6ff86472mr208446ybm.121.1644973037573; Tue, 15 Feb
 2022 16:57:17 -0800 (PST)
MIME-Version: 1.0
References: <20220210054947.170134-1-apatel@ventanamicro.com>
 <20220210054947.170134-3-apatel@ventanamicro.com>
In-Reply-To: <20220210054947.170134-3-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 15 Feb 2022 16:57:06 -0800
Message-ID: <CAOnJCUJHk4Yaj8Dx2-gViJNrRYmmnZqWCUqqddg44QCwCgF4Ag@mail.gmail.com>
Subject: Re: [PATCH v11 2/8] RISC-V: Rename relocate() and make it global
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Pavel Machek <pavel@ucw.cz>, 
 Rob Herring <robh+dt@kernel.org>, Sandeep Tripathy <milun.tripathy@gmail.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Liush <liush@allwinnertech.com>, 
 Anup Patel <anup@brainfault.org>, devicetree <devicetree@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 "open list:THERMAL" <linux-pm@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 kvm-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_165720_337448_90F25D07 
X-CRM114-Status: GOOD (  17.96  )
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

On Wed, Feb 9, 2022 at 9:50 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> From: Anup Patel <anup.patel@wdc.com>
>
> The low-level relocate() function enables mmu and relocates
> execution to link-time addresses. We rename relocate() function
> to relocate_enable_mmu() function which is more informative.
>
> Also, the relocate_enable_mmu() function will be used in the
> resume path when a CPU wakes-up from a non-retentive suspend
> so we make it global symbol.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/kernel/head.S | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 2363b43312fc..5f4c6b6c4974 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -90,7 +90,8 @@ pe_head_start:
>
>  .align 2
>  #ifdef CONFIG_MMU
> -relocate:
> +       .global relocate_enable_mmu
> +relocate_enable_mmu:
>         /* Relocate return address */
>         la a1, kernel_map
>         XIP_FIXUP_OFFSET a1
> @@ -185,7 +186,7 @@ secondary_start_sbi:
>         /* Enable virtual memory and relocate to virtual address */
>         la a0, swapper_pg_dir
>         XIP_FIXUP_OFFSET a0
> -       call relocate
> +       call relocate_enable_mmu
>  #endif
>         call setup_trap_vector
>         tail smp_callin
> @@ -329,7 +330,7 @@ clear_bss_done:
>  #ifdef CONFIG_MMU
>         la a0, early_pg_dir
>         XIP_FIXUP_OFFSET a0
> -       call relocate
> +       call relocate_enable_mmu
>  #endif /* CONFIG_MMU */
>
>         call setup_trap_vector
> --
> 2.25.1
>



Reviewed-by: Atish Patra <atishp@rivosinc.com>

--
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
