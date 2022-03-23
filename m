Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F318CC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Mar 2022 16:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OxyiJbWQpBefuA9JHLHmUkT0auZkn1vI0kZDmpQB3p8=; b=2qwZ+um1xIUWQA
	6nVvB5lsttf3hKjL3QeCbDAZfLfKRwgNLxm4kuI4dm2/RG0WiadikEeRNwK+NR2LvzdvS4RexJ3Wu
	t58sXzonmDgBpA9CuinXo0hJGySNc2tKqwZX+KDFdUPMJQXCF765EfQVfTLLUhwM3eY0KkbPKjKS/
	rjGlhbEfOQ+4rn2pvnFrhXsPWDVqTPWhuB3vvYfKU8B/gzIf08YBTX7DlNH6t6YHHcnkEU220H9t6
	rukBZK5NDtAHdj6gP2HRYwZFprEfdRTip+2g865RCEJN+8bGeO8Vdf5DqVQM2QBQIjqpEzFVV3ruu
	070IwicARECGdq8t2IeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX3wS-00EGax-8s; Wed, 23 Mar 2022 16:34:36 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX3wP-00EGZw-TO
 for linux-riscv@lists.infradead.org; Wed, 23 Mar 2022 16:34:35 +0000
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2e5e176e1b6so23395027b3.13
 for <linux-riscv@lists.infradead.org>; Wed, 23 Mar 2022 09:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NsarPkHuGeFkbQel0o4+0RcyfI8xstErqBIS8KS/Ntw=;
 b=Ie9SURJ+WwJExRiIyK+Wr/0sZ31m21FhWNtFkjAiPuYrXfg/1kGtv3rrpUc8L/PpQO
 9mhZWwld3idegmmwzni7iu0rGwkANjHHgWT9El38MUc2WK4v6I7h4jvkNiFS4FcaAgty
 CSgjTPJCYcrLiZbJsZhFM1DKvWB5ldTAiwUD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NsarPkHuGeFkbQel0o4+0RcyfI8xstErqBIS8KS/Ntw=;
 b=LIm9p7F8PxKXgZDE6Hm5wxAHLwcKykng3Kq1sgb16mhylkfNukaXobwu3FZFZGYSjA
 VfiguBESXEiMq+W9Cltc8HhPkhLTRQKHPNubeXuXYLdzLxGXF2AwXXy4VHMk0gLOgJyf
 XFoyEu8zkV1VSUW/4t8WhznD44TqSZAsVWmOWSKaf/FX38RILm5T/ebnsoXBj6+/AqHO
 akuffseZOrSNGGWKDP9Zb6GNbh1ds0LhNoEdb1uMB9Oc5QHrIIfnkZ+1jLzzpQINnXv5
 2xc7O0W0mGgMETY4CZlutqnCnVy6AThqO5ahrOhBkuBUMTnLEx8HB7R9Ar6U3c/z232P
 jrAg==
X-Gm-Message-State: AOAM533asrrLq32N+d/vdcpEjKobvGIOKikDdfHIXLdtP6pE/vWCs9kK
 llxNgUqjE88CvS99fIVLJlH4DOwrZJnZtITVcYyj
X-Google-Smtp-Source: ABdhPJxaM+MZkmiR0g3HVuavrnd/W8psTlbP613L1+wgEjxxagwXshb/UYlewlXEuonm84qo2hfaDwDCG+8xangS4T0=
X-Received: by 2002:a81:19d7:0:b0:2e3:aa2:2b0e with SMTP id
 206-20020a8119d7000000b002e30aa22b0emr716227ywz.249.1648053272611; Wed, 23
 Mar 2022 09:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220323090025.546808-1-apatel@ventanamicro.com>
In-Reply-To: <20220323090025.546808-1-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 23 Mar 2022 09:34:22 -0700
Message-ID: <CAOnJCUJnc3VJq3PRn+wTMTbf2N5VdJs_uPjRyWTs-EKuC_190w@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Enable perf events by default
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_093434_025036_98F05D12 
X-CRM114-Status: GOOD (  14.73  )
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

On Wed, Mar 23, 2022 at 2:00 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Let us enable perf events by default in RV32 and RV64 defconfigs
> so that we can use RISC-V PMU drivers on various RISC-V platforms.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/configs/defconfig      | 1 +
>  arch/riscv/configs/rv32_defconfig | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index f120fcc43d0a..57aaedc7cf74 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -15,6 +15,7 @@ CONFIG_CHECKPOINT_RESTORE=y
>  CONFIG_BLK_DEV_INITRD=y
>  CONFIG_EXPERT=y
>  # CONFIG_SYSFS_SYSCALL is not set
> +CONFIG_PERF_EVENTS=y
>  CONFIG_SOC_MICROCHIP_POLARFIRE=y
>  CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_VIRT=y
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> index 8b56a7f1eb06..21d422e740d5 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -15,6 +15,7 @@ CONFIG_CHECKPOINT_RESTORE=y
>  CONFIG_BLK_DEV_INITRD=y
>  CONFIG_EXPERT=y
>  # CONFIG_SYSFS_SYSCALL is not set
> +CONFIG_PERF_EVENTS=y
>  CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_VIRT=y
>  CONFIG_ARCH_RV32I=y
> --
> 2.25.1
>

I think it is better to enable perf events by adding CONFIG_PROFILING
to the defconfig similar to other ISAs.

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
