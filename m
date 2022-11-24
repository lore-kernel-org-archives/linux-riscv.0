Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B3FC43219
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 19:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z08zw7yq53IKwIyFQw3QcYo39TGPdAlOhh5ZGGSfyao=; b=casiJTkw0RXs/V
	g8isOX+RPhFQNy9s1ezKVBgSsIBG/lmX3mx3e8LtuIASxaGkPc2YbdKddY1Wv54WepoVEozUyvZdT
	fJ/aiWcpIBWxqpdTuCKD3J501TNDLJVtJQ2adzyhakLXEERY1SXQNc2fW/0yRa6ZanqTn1zQu+SmQ
	/pRapZ4OrjHK7G3aTnvspnMgZJFuXrjKRQFHYBC3kC4Gjtj8hqMLIzK+SzaOhqTdbvJDzi1+bCLPU
	n/5Us4sk6qaXqSXV35qx/DjBpFThqcWaokj7P7DZtsKBzrQMQp+8rIzEkNvM61NEZFXs4JjstAHVs
	uz2JpRgcgE1EW4jjSY3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyIHL-00BKcE-HK; Thu, 24 Nov 2022 19:52:59 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyIHI-00BKaO-OR
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 19:52:58 +0000
Received: by mail-ed1-x52c.google.com with SMTP id m19so2513193edj.8
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 11:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jAnK/JcM0zX8dnekJkRYtzDHjOJKPhsEIM5kaa8Kd9c=;
        b=GPM0Bz9korDKFqBQzpL4ixnmJME93AytUynA75PXV46+NJpsKVKgdHFRwJY/hi4I5j
         q2LDSVMJkFIjQ/YbXki1homZM7jK7JN7wLky/f2CAy44cBaAAWE+whk2nSPls8Qg+FwR
         ivUzDz1nSUHkNs+rdmZT7nELEpuu1/JBresXwj7mHu0emOhDYltgJRjCXbkQcASDzH7i
         sA6Cg1g4ueX/ftcf+ihqwTa1ax2C1Rl6wfRefTrL/f7YeFPQqlFgM+6T91EuKZUj4wsv
         fmKzTIZ4hK/TBiK0PvFKq9cfBKtjTkAGGMEQdOq+0THY4d/xibfGWn6wGdQJBCe2GXAl
         yHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAnK/JcM0zX8dnekJkRYtzDHjOJKPhsEIM5kaa8Kd9c=;
        b=IOlEpFLESFoub063s6x9SsshXlZtfJxw85lRCxFDyFIXh595FpAOBn9P+wZe5uta8F
         8PHud78KR8Lx4dfQKPZVJJ1Dm3GEuWFSF7YwRCmUY20l6RWg4vWx6/vPyvDt1M5i7FGn
         ZeBAMgaskYjzy/roTAA3sIL1cRdAJES46PkOE4DFV3Xwsqef4PBbhy7rwnHy/LfFgdra
         H+4OV+GtsjENldJ2K4zMX4PGcDMMZHYEvqAKh8jWLzZJnMrRLZCqvlBkUuaQq4aHyTwq
         k42W26J8Sjraeah7n4iaDi3yZqcVyA6GI31pbKtHFYefilv4K2EKpkLWqYAyVM5EtSkE
         cILw==
X-Gm-Message-State: ANoB5pnaVvbofC3rGvfhe336xNuqltlM045/h7je4LXKM85c2cWphoK1
	9DySSITdzcyQidfoXWXIDOfk/8eK8vSO/xqeCZs=
X-Google-Smtp-Source: AA0mqf70Jbpsi5I4U3QPDQQjjvPYf4fwg3Sz1ESxXsc4lqVqhb0WVZydaw41Um7cZvT+KB+Un2UBUhfGMQIjK8QLr40=
X-Received: by 2002:a05:6402:f:b0:468:56c3:7c8 with SMTP id
 d15-20020a056402000f00b0046856c307c8mr31976256edu.109.1669319574521; Thu, 24
 Nov 2022 11:52:54 -0800 (PST)
MIME-Version: 1.0
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <Y3/I4KzHnzyPo1Fe@spud>
In-Reply-To: <Y3/I4KzHnzyPo1Fe@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 24 Nov 2022 19:52:28 +0000
Message-ID: <CA+V-a8viAfvLnScDKADpKMRqNEaMdhf5kA1GqAdgaGAEo+XpBQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] AX45MP: Add support to non-coherent DMA
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Atish Patra <atishp@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Nathan Chancellor <nathan@kernel.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_115256_820878_A153FE83 
X-CRM114-Status: GOOD (  37.06  )
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

Hi Conor,

Thank you for the quick test.

On Thu, Nov 24, 2022 at 7:41 PM Conor Dooley <conor@kernel.org> wrote:
>
> Hey!
>
> On Thu, Nov 24, 2022 at 05:22:00PM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Hi All,
> >
> > On the Andes AX45MP core, cache coherency is a specification option so it
> > may not be supported. In this case DMA will fail. To get around with this
> > issue this patch series does the below:
> >
> > 1] Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
> > block that allows dynamic adjustment of memory attributes in the runtime.
> > It contains a configurable amount of PMA entries implemented as CSR
> > registers to control the attributes of memory locations in interest. PMA
> > regions are passed from the l2 node which are configured as
> > non-cacheable + bufferable with the SBI call.
> >
> >         l2cache: cache-controller@13400000 {
> >                 ....
> >                 andestech,pma-regions = <0x58000000 0x08000000
> >                                          (AX45MP_PMACFG_ETYP_NAPOT |
> >                                           AX45MP_PMACFG_MTYP_MEM_NON_CACHE_BUF)>;
> >                 ....
> >         };
> >
> > 2] We provide callbacks to synchronize specific content between memory and
> > cache.
> >
> >         - arch_sync_dma_for_device()
> >         - arch_sync_dma_for_cpu()
> >
> > Below are the configs that are enabled:
> >
> >         - DMA_GLOBAL_POOL
> >         - RISCV_DMA_NONCOHERENT
> >
> > 3] We reserve the shared DMA pool, so the DMA memory requests go through
> >    this pool:
> >
> >         reserved-memory {
> >                 #address-cells = <2>;
> >                 #size-cells = <2>;
> >                 ranges;
> >
> >                 reserved: linux,cma@58000000 {
> >                         compatible = "shared-dma-pool";
> >                         no-map;
> >                         linux,dma-default;
> >                         reg = <0x0 0x58000000 0x0 0x08000000>;
> >                 };
> >         };
> >
> >
> > Below is the L2 cache DT node:
> >
> >         l2cache: cache-controller@13400000 {
> >                 compatible = "andestech,ax45mp-cache", "cache";
> >                 cache-size = <0x40000>;
> >                 cache-line-size = <64>;
> >                 cache-sets = <1024>;
> >                 cache-unified;
> >                 reg = <0x0 0x13400000 0x0 0x100000>;
> >                 andestech,pma-regions = <0x0 0x58000000 0x0 0x08000000 0x0
> >                                          (AX45MP_PMACFG_ETYP_NAPOT |
> >                                           AX45MP_PMACFG_MTYP_MEM_NON_CACHE_BUF)>;
> >                 interrupts = <SOC_PERIPHERAL_IRQ(476, IRQ_TYPE_LEVEL_HIGH)>;
> >         };
> >
> > Due to the above approach custom SBI calls have been implemented. The
> > above implementation is in preparation for adding support for Renesas
> > RZ/Five SoC which uses the AX45MP core. As with the above approach the
> > kernel image might not be generic so that it can be used on other
> > platforms.
> >
> > OpenSBI implementation isn't upstreamed yet, public repo for access is
> > available at [0].
> >
> > [0] https://github.com/renesas-rz/rz_opensbi/tree/work/OpenSBI-PMA
> >
> > Note,
> > - This series requires testing on Cores with zibcom and T-Head SoCs
> > - Ive used GCC 9.4.0 for compilation
>
> Just dumping the following, which I saw with gcc 12.1 & binutils 2.39
> while building allmodconfig. Perhaps it is worth you upgrading to a
> recent toolchain for testing purposes. FWIW, I applied your patches on
> top of 20221122.
>
> /stuff/linux/arch/riscv/mm/dma-noncoherent.c: Assembler messages:
> /stuff/linux/arch/riscv/mm/dma-noncoherent.c:62: Error: attempt to move .org backwards
> /stuff/linux/arch/riscv/mm/dma-noncoherent.c:66: Error: attempt to move .org backwards
> /stuff/linux/arch/riscv/mm/dma-noncoherent.c:84: Error: attempt to move .org backwards
> /stuff/linux/arch/riscv/mm/dma-noncoherent.c:96: Error: attempt to move .org backwards
>
Hmm that looks interesting! I'll give that a shot with the latest tool-chain.

BTW is there a link to get the latest toolchain?
>
> In file included from /stuff/linux/arch/riscv/errata/andes/errata.c:16:
> /stuff/linux/arch/riscv/errata/andes/errata.c: In function 'is_auipc_insn':
> /stuff/linux/arch/riscv/errata/andes/errata.c:25:34: error: 'MASK_AUIPC' undeclared (first use in this function)
>    25 | DECLARE_INSN(auipc, MATCH_AUIPC, MASK_AUIPC)
>       |                                  ^~~~~~~~~~
> /stuff/linux/arch/riscv/include/asm/parse_asm.h:175:25: note: in definition of macro 'DECLARE_INSN'
>   175 |         return (insn & (INSN_MASK)) == (INSN_MATCH); \
>       |                         ^~~~~~~~~
> /stuff/linux/arch/riscv/errata/andes/errata.c:25:34: note: each undeclared identifier is reported only once for each function it appears in
>    25 | DECLARE_INSN(auipc, MATCH_AUIPC, MASK_AUIPC)
>       |                                  ^~~~~~~~~~
> /stuff/linux/arch/riscv/include/asm/parse_asm.h:175:25: note: in definition of macro 'DECLARE_INSN'
>   175 |         return (insn & (INSN_MASK)) == (INSN_MATCH); \
>       |                         ^~~~~~~~~
> /stuff/linux/arch/riscv/errata/andes/errata.c:25:21: error: 'MATCH_AUIPC' undeclared (first use in this function); did you mean 'OPC_AUIPC'?
>    25 | DECLARE_INSN(auipc, MATCH_AUIPC, MASK_AUIPC)
>       |                     ^~~~~~~~~~~
> /stuff/linux/arch/riscv/include/asm/parse_asm.h:175:41: note: in definition of macro 'DECLARE_INSN'
>   175 |         return (insn & (INSN_MASK)) == (INSN_MATCH); \
>       |                                         ^~~~~~~~~~
> /stuff/linux/arch/riscv/errata/andes/errata.c: In function 'riscv_alternative_fix_auipc_jalr':
> /stuff/linux/arch/riscv/errata/andes/errata.c:64:23: error: implicit declaration of function 'EXTRACT_RD_REG' [-Werror=implicit-function-declaration]
>    64 |                 rd1 = EXTRACT_RD_REG(*(alt_ptr + i));
>       |                       ^~~~~~~~~~~~~~
> /stuff/linux/arch/riscv/errata/andes/errata.c:69:24: error: implicit declaration of function 'EXTRACT_UTYPE_IMM'; did you mean 'EXTRACT_BTYPE_IMM'? [-Werror=implicit-function-declaration]
>    69 |                 imm1 = EXTRACT_UTYPE_IMM(*(alt_ptr + i));
>       |                        ^~~~~~~~~~~~~~~~~
>       |                        EXTRACT_BTYPE_IMM
> /stuff/linux/arch/riscv/errata/andes/errata.c:78:30: error: 'U_IMM_31_12_MASK' undeclared (first use in this function); did you mean 'J_IMM_19_12_MASK'?
>    78 |                 call[0] &= ~(U_IMM_31_12_MASK);
>       |                              ^~~~~~~~~~~~~~~~
>       |                              J_IMM_19_12_MASK
> /stuff/linux/arch/riscv/errata/andes/errata.c: In function 'is_auipc_insn':
> /stuff/linux/arch/riscv/include/asm/parse_asm.h:176:1: error: control reaches end of non-void function [-Werror=return-type]
>   176 | }
>       | ^
> /stuff/linux/arch/riscv/errata/andes/errata.c:25:1: note: in expansion of macro 'DECLARE_INSN'
>    25 | DECLARE_INSN(auipc, MATCH_AUIPC, MASK_AUIPC)
>       | ^~~~~~~~~~~~
> cc1: all warnings being treated as errors
>
>
Oops I missed to mention the dependency here we need patches from [0]
. Just patches 1-5 should be sufficient for this build (as including
patch 6/7 gave me a build issue).

[0] https://patchwork.kernel.org/project/linux-riscv/cover/20221110164924.529386-1-heiko@sntech.de/

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
