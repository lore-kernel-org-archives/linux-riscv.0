Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C463C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Nov 2022 01:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bJ05P9pJzq0icVEL1pIo+v0XdARcqUZQlST9Ba1rz7Q=; b=pZBIkn6l41WG69
	5fgM9HmRNWI+Xpd2IDGpbWA9D1IsNqjtr9C+A2Yqb0fBMj2N3pfWdBicK8D2i5VNEUffPgic1zeI9
	4cWpPilEtAym69GNa0XE6pWWDqFtHe7WBnX0paZz9XYZ1ad0zA51aB9jsNhLZlE0JOK9uMfFCUbPq
	G2AgAYxfYzswcz5Rlpfm/ttKizOuPczcJHUOVcRlaMOyzl5zMk1nltYZl4FKNMrhzBktyuCIEYS4o
	oAnSeYUa2VkVuQugXb3VwkxUcScxL5o1h/eJtsQCs1y/hF+fbJ81J0vD6yKK/vgSoFkRVoyQ3fWvF
	m4DvitqUHJottRa5OJPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq27K-007psq-HG; Wed, 02 Nov 2022 01:00:30 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq27H-007pr8-88
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 01:00:29 +0000
Received: by mail-ej1-x62e.google.com with SMTP id bj12so41324150ejb.13
        for <linux-riscv@lists.infradead.org>; Tue, 01 Nov 2022 18:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cKOPjxW6hMffC27C/SCX+FUVc2eMjho9VRyb1I26W+A=;
        b=WMeekXVXt4lsAnluw5FHfJXlbxIcWLcnK0/RbVL1jCWnwcib9Y/v8p/XxVAeCBO9DQ
         sNQ6Q/hQkfJCuB3h5z7fiH09wV2j3CsLzSjQKJoaCnjvn1vOZcv9Y8Ofna042Tng4guC
         RR742cQGy1mL7xZVk/+8ThiEG0hcPC3AdbHs8LmE0YtoDzy6PpgN4TU8VmDowr2XB4vs
         IK77xH1Q1BB6X24V0KWE1p8qBtzIiupySA3AMX5CiqITFm2O+IggA3y0nmWZoGhTAwb6
         gpmNVwNjfxUrSO8STeE10KBGR4kV7qNLS+RqCG9FXfiKc6sdLUaI3q0Nc3jZvXLShbMe
         q1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cKOPjxW6hMffC27C/SCX+FUVc2eMjho9VRyb1I26W+A=;
        b=alSYEe1wxfkxrYqeoCAcPVOTUz2NLNsekqWvYVZde56nAMmucrEtYh4KnlRHQz5TMT
         8iR0W/hGHm6x13PQBbpHcZyi1FNh6ZMTjjRDpULIJSsTT8QyQrPEb2tQ677Q5mcG+oKe
         wYBYnSOTT8WSJDzett6xoUwnbdUUvmGrDwyYH5qDI59rlVlvFY+HUgJzBfM02ZyGfb7m
         BkVQae95hSdUaK/9dhdC2QTvvDBjvNqUAVcntM++WKPUYrbs80qlFvwjmYzAdp1HpWnw
         KFDM5x9F9b1qUcgDtvqq4BAb4a9R/BYFcjAw4vXEsnIJuPYrBgEUcXKWtmvtkpsHN4p5
         HG9w==
X-Gm-Message-State: ACrzQf1maQDapXw4cEFSMy1L0QjaIJ9AqvZt/Dbe1z9Uck1FZY6sUKBu
	TQ5DjSr/YhvREM3KPGh8drq3AzH/RykA8T135tE=
X-Google-Smtp-Source: AMsMyM7c/ABaJaKAKRpL8Ijw/KO0JHwmCdEqPhD5GS9nFJ96c+cfsR284v8V2kqJHwH5onhRriMFhzTVZ3Xb/F628+Q=
X-Received: by 2002:a17:906:c14f:b0:793:30e1:96be with SMTP id
 dp15-20020a170906c14f00b0079330e196bemr21349587ejc.447.1667350823464; Tue, 01
 Nov 2022 18:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <20221019220242.4746-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221019220242.4746-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdU6+qNQh2vFic89cnqDmUoyhrJTROCHPdoPguXAEnZMfA@mail.gmail.com>
In-Reply-To: <CAMuHMdU6+qNQh2vFic89cnqDmUoyhrJTROCHPdoPguXAEnZMfA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 2 Nov 2022 00:59:57 +0000
Message-ID: <CA+V-a8sv9QVDfokN5LExu9p5GeCuHb99-mxBpugDk6J2LSB8SQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/2] soc: renesas: Add L2 cache management for
 RZ/Five SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
X-CRM114-CacheID: sfid-20221101_180027_314959_9ED14CC2 
X-CRM114-Status: GOOD (  30.57  )
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

Hi Geert,

On Tue, Nov 1, 2022 at 1:38 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, Oct 20, 2022 at 12:02 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > On the AX45MP core, cache coherency is a specification option so it may
> > not be supported. In this case DMA will fail. As a workaround, firstly we
> > allocate a global dma coherent pool from which DMA allocations are taken
> > and marked as non-cacheable + bufferable using the PMA region as specified
> > in the device tree. Synchronization callbacks are implemented to
> > synchronize when doing DMA transactions.
> >
> > The Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
> > block that allows dynamic adjustment of memory attributes in the runtime.
> > It contains a configurable amount of PMA entries implemented as CSR
> > registers to control the attributes of memory locations in interest.
> >
> > Below are the memory attributes supported:
> > * Device, Non-bufferable
> > * Device, bufferable
> > * Memory, Non-cacheable, Non-bufferable
> > * Memory, Non-cacheable, Bufferable
> > * Memory, Write-back, No-allocate
> > * Memory, Write-back, Read-allocate
> > * Memory, Write-back, Write-allocate
> > * Memory, Write-back, Read and Write-allocate
> >
> > This patch adds support to configure the memory attributes of the memory
> > regions as passed from the l2 cache node and exposes the cache management
> > ops.
> >
> > More info about PMA (section 10.3):
> > http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
> >
> > This feature is based on the work posted [0] by Vincent Chen
> > <vincentc@andestech.com> for the Andes AndeStart RISC-V CPU.
> >
> > [0] https://lore.kernel.org/lkml/1540982130-28248-1-git-send-email-vincentc@andestech.com/
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/riscv/include/asm/errata_list.h
> > +++ b/arch/riscv/include/asm/errata_list.h
> > @@ -89,6 +89,7 @@ asm volatile(ALTERNATIVE(                                             \
> >  #define ALT_THEAD_PMA(_val)
> >  #endif
> >
> > +#ifdef CONFIG_ERRATA_THEAD_CMO
> >  /*
> >   * dcache.ipa rs1 (invalidate, physical address)
> >   * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> > @@ -143,5 +144,6 @@ asm volatile(ALTERNATIVE_2(                                         \
> >         : "a0")
> >
> >  #endif /* __ASSEMBLY__ */
> > +#endif
>
> FTR, the new #endif should be above the old #endif.
>
> I noticed because after rebasing on top of commit 65e9fb081877a18c
> ("drivers/perf: riscv_pmu_sbi: add support for PMU variant on T-Head
> C9xx cores") in riscv/for-next, the build failed because the new
> ALT_SBI_PMU_OVERFLOW() definition ended up inside both #endifs,
> instead of between.
>
Thanks for pointing this out.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
