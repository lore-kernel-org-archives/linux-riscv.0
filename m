Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04123C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jan 2022 10:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Yi/SEtNSXaUBjmJpueEGwNOOS2JauheCimLVXnAj+o=; b=yv8Dhbgr1t6owc
	4s5Gw3yUvoTlc4oRyZOleSu8YsShFFPVEG7cDL0f5B8AaA+F4p0RnBB03WWCf5WIZ8Cm86CI/PKkG
	ENOHq6VDsDMNjspWbI0TYV52PR6HwEsburz/uwWKhnQef+I2FT4hOL8c5IAVEM3mcOUgkvcaKGYY4
	J8Ba+QtqRQPl7L6/RMGc60dspONObUmFdXvOnASYJdC/Xq1DljqhW2+qeEu8V291nuGPlK7q3vVA1
	g9EqQ5Yres7geIFt2E/ynQ8xq96BPHJm7kFctZueslryhl+Fl2OZrv1fCvkyUkYbqEWEv/NBgCMUV
	VBsZcdwd/WYwLvTH37Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDO9g-001Nam-Tn; Fri, 28 Jan 2022 10:06:56 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDO8Z-001NJg-Ng
 for linux-riscv@lists.infradead.org; Fri, 28 Jan 2022 10:05:49 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 596DA3FE09
 for <linux-riscv@lists.infradead.org>; Fri, 28 Jan 2022 10:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643364338;
 bh=O2AwCzmYc8oJyRvt38Q3eFdAEi62fT7JJ41T7HDRaZY=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=jFynAPC5jS3TuSW0DwBFoBtJMNpyruFX8Ud/SKY65dHlfFes688+9yvc2QTtU+4bn
 L+fKJrSxitVSAHYJS0Lb+lLPdLNGVSkUQWVAO8AmIXdD9/0T9pXt/nlKX2Dg5JZLvg
 H8BjAwM5L0VoO7mDKvh7sbWtnRYDMn8tRNFmfzuHyGPOIvRAxcWk6hRGxyfrBa42ly
 M84OT647Chcd/U3H8T1CzYex/OEjWSKoUMR3kpTmI5/1/LWKK2Sw02hIIZBPuKNear
 bgOKMy5GSRw6czM5B5u2tVYp4mrImUzZjAYDfSiGZ7rxJNJU0a8OjkiHgfe9iZz7uy
 cgbx9VXJCrjeg==
Received: by mail-ej1-f72.google.com with SMTP id
 l18-20020a1709063d3200b006a93f7d4941so2673777ejf.1
 for <linux-riscv@lists.infradead.org>; Fri, 28 Jan 2022 02:05:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O2AwCzmYc8oJyRvt38Q3eFdAEi62fT7JJ41T7HDRaZY=;
 b=VgK6eDeZu1aTqR6TCcqnVEHkT3xuhg/kRLt2ICGA0oi8dncVxFhFElePXQwGf2m2WH
 tw1wRIpWjTAWQE2F0zSmoQhwCq0oD7vF5JAL0jkA7mlkxx2inqpNhF2NDTN0qAdLsXB6
 YqbGBn8GPhQirVI87/NUiBhQtrMnV0tX7S4t2OvaCFqqTyXjNFAu6CVcbshmznZDIWvB
 4JORbz5te39D2jRw+eV4JB2h3RRoELRTxf2q10f+1JM7n6kW3SHRnMBSR7HnueAWE/Q4
 TZhpgf1KQ7t68ZdRMqMusQP9ZdS0gzOEXSUBY3HNF6Yky3TQHy+xd054s74YbTQdOXrv
 j7eQ==
X-Gm-Message-State: AOAM530td8xsgPXfwVMZIeTBNjy7/JLwdieh7EwKemyRCmGICwGkisYp
 g3Fahi6YB8dMPNAS1z02RQVbJJVe4wlwiQ5jpBYhxGl1bTs0euJnW5ET5XZbmDWa7u0+VjRbT9C
 MG21YQkPb5z//uTmNdIlstewMKDZvUfg3Pq3KmtLnxKP+np0I9XZ3m1tcyfcXDg==
X-Received: by 2002:a05:6402:424a:: with SMTP id
 g10mr7509428edb.309.1643364337929; 
 Fri, 28 Jan 2022 02:05:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsVnSwgUFr96As1FnWBQoNDpcCVx1aZj6cMWJvV98yVlEvSPf2G1oW4NedbPBIYoEh/UJEBA7P84mQwLL5yCU=
X-Received: by 2002:a05:6402:424a:: with SMTP id
 g10mr7509413edb.309.1643364337738; 
 Fri, 28 Jan 2022 02:05:37 -0800 (PST)
MIME-Version: 1.0
References: <20220126171442.1338740-1-aurelien@aurel32.net>
In-Reply-To: <20220126171442.1338740-1-aurelien@aurel32.net>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Fri, 28 Jan 2022 11:05:26 +0100
Message-ID: <CA+zEjCvwsM=DaUqB8Hv_=dXRdauz6hjeFE1MK_A6=QjrsW2EyQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: fix build with binutils 2.38
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Kito Cheng <kito.cheng@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_020547_980611_55F2664A 
X-CRM114-Status: GOOD (  19.65  )
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

Hi Aurelien,

On Wed, Jan 26, 2022 at 6:41 PM Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> From version 2.38, binutils default to ISA spec version 20191213. This
> means that the csr read/write (csrr*/csrw*) instructions and fence.i
> instruction has separated from the `I` extension, become two standalone
> extensions: Zicsr and Zifencei. As the kernel uses those instruction,
> this causes the following build failure:
>
>   CC      arch/riscv/kernel/vdso/vgettimeofday.o
>   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h: Assembler messages:
>   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01'
>   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01'
>   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01'
>   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01'
>
> The fix is to specify those extensions explicitely in -march. However as
> older binutils version do not support this, we first need to detect
> that.
>
> Cc: stable@vger.kernel.org # 4.15+
> Cc: Kito Cheng <kito.cheng@gmail.com>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  arch/riscv/Makefile | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 8a107ed18b0d..7d81102cffd4 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -50,6 +50,12 @@ riscv-march-$(CONFIG_ARCH_RV32I)     := rv32ima
>  riscv-march-$(CONFIG_ARCH_RV64I)       := rv64ima
>  riscv-march-$(CONFIG_FPU)              := $(riscv-march-y)fd
>  riscv-march-$(CONFIG_RISCV_ISA_C)      := $(riscv-march-y)c
> +
> +# Newer binutils versions default to ISA spec version 20191213 which moves some
> +# instructions from the I extension to the Zicsr and Zifencei extensions.
> +toolchain-need-zicsr-zifencei := $(call cc-option-yn, -march=$(riscv-march-y)_zicsr_zifencei)
> +riscv-march-$(toolchain-need-zicsr-zifencei) := $(riscv-march-y)_zicsr_zifencei
> +
>  KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
>  KBUILD_AFLAGS += -march=$(riscv-march-y)
>
> --
> 2.34.1
>
>

That fixes our kernel build with the new binutils, so you can add:

Tested-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>

Thanks for working on this!

Alex

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
