Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF47EECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Nov 2022 13:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q/L3fEM3SywCJ0DAK0QUGy6fjOQK4smJ+QnQMK/8AHs=; b=Fpyx83yaVmiCcI
	mxcH0t/jvbJPWtrgMHAiiQrnvzwqKcT2noy72zLfXQra8OrE7oHbfsqn4TtxKY72jFcJip7Hfql+k
	T5/M4Ip+uFEzZeIlvS9fHWN6wbooUiY0sZtq4HYef6Jmvznga+bgbjvrD0AXpwZSYvx2ajMW2i3Yb
	N4OjcPR/vP4nZ46kjydcb3KR2c356fMSfbDGpRBEUuSRUx92qhV+Ugffg5+h7csK9f8qTaz9Bziru
	cz6bhanoGlpcCtjEmy4RQIQ77A4CA9iWJMCq7ww6HqDrUo8+j06NwxW6dmWa+7zc9qJp5XIBFkOkn
	wA3M6TUmaxg6kTAey7pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oprTG-005Iz8-2S; Tue, 01 Nov 2022 13:38:26 +0000
Received: from mail-qk1-f178.google.com ([209.85.222.178])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oprTD-005IyA-0f
	for linux-riscv@lists.infradead.org; Tue, 01 Nov 2022 13:38:24 +0000
Received: by mail-qk1-f178.google.com with SMTP id k2so3952715qkk.7
        for <linux-riscv@lists.infradead.org>; Tue, 01 Nov 2022 06:38:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+9k3LzVJhLHOoT31IHmRkr9T7Wq3FpXbHH08Qx0zJI=;
        b=E+JFe06Fc7Ws/HqzvMlHDJM1+OTbTFRx/TeQZsuUNltH4b+7m3Qj7GQmlXaV/j+4BF
         dl0Kh1oD5uCTfQfL0J1gUxx2FZrrB/cyPKa7xNHGQdlj9vvD704IlCJDscefDwOTZyp0
         CuYH/9i5aK5sCosT3ZhxpC6/EvNKpcTYGfCo8i63K4Hp/d7hGEXQsa4AbccxOwYxKBY3
         Ut+pOBRa5D/BEaY76l7CPxuMBl6c7dioystUuN3K0edFn4EuEopoXyQK3dZ6t6EB6WD7
         xzLiLk6xH/kE3htCHfgSDEVj6ZQDd2cKgiMbLT7RaWwX0Ozf0kwwiihn64Y2S//NdLEX
         z5nw==
X-Gm-Message-State: ACrzQf08jExcNdIJ6Dj8ZnNE4nyn4quKDm83TftfBt4dOIAyAGmi5Dj7
	vitBnKvbcrF8Hi4LgDEjd67NLwKEUxdMcw==
X-Google-Smtp-Source: AMsMyM767h+tUZOrEFc3kBTC7RnXWe2mOcmvsj/f+kgKBf0lCj1yKHZ+gTk+86KYxKIZ36ujB0BSRA==
X-Received: by 2002:a37:a09:0:b0:6f9:9f68:5296 with SMTP id 9-20020a370a09000000b006f99f685296mr12919335qkk.83.1667309901410;
        Tue, 01 Nov 2022 06:38:21 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id i22-20020ac871d6000000b003431446588fsm5156464qtp.5.2022.11.01.06.38.20
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 06:38:20 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-3704852322fso65845427b3.8
        for <linux-riscv@lists.infradead.org>; Tue, 01 Nov 2022 06:38:20 -0700 (PDT)
X-Received: by 2002:a81:12c8:0:b0:36a:bd6b:92fb with SMTP id
 191-20020a8112c8000000b0036abd6b92fbmr17487708yws.316.1667309900285; Tue, 01
 Nov 2022 06:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221019220242.4746-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221019220242.4746-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221019220242.4746-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Nov 2022 14:38:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU6+qNQh2vFic89cnqDmUoyhrJTROCHPdoPguXAEnZMfA@mail.gmail.com>
Message-ID: <CAMuHMdU6+qNQh2vFic89cnqDmUoyhrJTROCHPdoPguXAEnZMfA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/2] soc: renesas: Add L2 cache management for
 RZ/Five SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_063823_081456_5F382F29 
X-CRM114-Status: GOOD (  31.87  )
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

Hi Prabhakar,

On Thu, Oct 20, 2022 at 12:02 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> On the AX45MP core, cache coherency is a specification option so it may
> not be supported. In this case DMA will fail. As a workaround, firstly we
> allocate a global dma coherent pool from which DMA allocations are taken
> and marked as non-cacheable + bufferable using the PMA region as specified
> in the device tree. Synchronization callbacks are implemented to
> synchronize when doing DMA transactions.
>
> The Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
> block that allows dynamic adjustment of memory attributes in the runtime.
> It contains a configurable amount of PMA entries implemented as CSR
> registers to control the attributes of memory locations in interest.
>
> Below are the memory attributes supported:
> * Device, Non-bufferable
> * Device, bufferable
> * Memory, Non-cacheable, Non-bufferable
> * Memory, Non-cacheable, Bufferable
> * Memory, Write-back, No-allocate
> * Memory, Write-back, Read-allocate
> * Memory, Write-back, Write-allocate
> * Memory, Write-back, Read and Write-allocate
>
> This patch adds support to configure the memory attributes of the memory
> regions as passed from the l2 cache node and exposes the cache management
> ops.
>
> More info about PMA (section 10.3):
> http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
>
> This feature is based on the work posted [0] by Vincent Chen
> <vincentc@andestech.com> for the Andes AndeStart RISC-V CPU.
>
> [0] https://lore.kernel.org/lkml/1540982130-28248-1-git-send-email-vincentc@andestech.com/
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -89,6 +89,7 @@ asm volatile(ALTERNATIVE(                                             \
>  #define ALT_THEAD_PMA(_val)
>  #endif
>
> +#ifdef CONFIG_ERRATA_THEAD_CMO
>  /*
>   * dcache.ipa rs1 (invalidate, physical address)
>   * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> @@ -143,5 +144,6 @@ asm volatile(ALTERNATIVE_2(                                         \
>         : "a0")
>
>  #endif /* __ASSEMBLY__ */
> +#endif

FTR, the new #endif should be above the old #endif.

I noticed because after rebasing on top of commit 65e9fb081877a18c
("drivers/perf: riscv_pmu_sbi: add support for PMU variant on T-Head
C9xx cores") in riscv/for-next, the build failed because the new
ALT_SBI_PMU_OVERFLOW() definition ended up inside both #endifs,
instead of between.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
