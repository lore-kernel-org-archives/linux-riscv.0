Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA35C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Dec 2022 11:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=437GIEFP0UkA5mnFg23sjp5qY0hwgqhdrul89px7bU0=; b=siFaozgVg0+/FF
	NN1IK8ftmqlHM2SpJXHv3la0ADaq0AyY/GxDgzgTpApoyWn5CJL8pGuC176jC3vG0kRbanA0ge4sB
	9gtqN5hJpGzNZKiKlQgmAaSLVSKwCfpXqtWY7RptViaKOLfgQpAOngTW8NPP8oXHOo+OJ0NVWABxU
	Lxdf09nXQ142+EtaxJXG8IgXEJzf0VOrtA/PZYMB0aPaMmn4J/Tvvry+G0RL9ePvRJ8s4+DOkX8NL
	cIln9S1jQ78nK0GsI3ShU4G97TCRxVWEGpFMBpjL2n78/Eq++w8sA0ehWTJyXN39/Le5rJFFQhTow
	GWB6IV99RBHBn+3eSahg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5m8b-008wxe-2v; Thu, 15 Dec 2022 11:10:53 +0000
Received: from mail-qv1-f41.google.com ([209.85.219.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5m8X-008wvJ-QQ
	for linux-riscv@lists.infradead.org; Thu, 15 Dec 2022 11:10:51 +0000
Received: by mail-qv1-f41.google.com with SMTP id o12so1689818qvn.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 Dec 2022 03:10:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Si7SDKWic3Uv1+g6HsphPYpn2S25iGUgPbeTE6s5eQM=;
        b=MTadfJeDjUesmugJFYsTMQnksYeuvFBEAv5oxWMC3/SbKt2QIPBVwtY9CllCSAcuW5
         CFE/EO0msYqlW++q/P2q3JXn+PWBXI5qLGDm67+4WFCl+Jyhssybwi7htsKhA1jRWZN6
         JYP4ubRDTpVrzdxmSfd34EJ0se8Y/o7eNcmnP7CD8C9wTyNyzlp6VvHcYMG9k+J050fa
         405Z8kj6453U4OFPnzrGsxqxauW5wwel2K8II9SRH7oCBA0vtcwr7EMMhvVZosZGlRAL
         aBxE5kfzoxOARvKBXryJmYYbikzCHxm+OWsFA5Nq97qMpmYMgIDg/m+eHIgbWDjm5RT/
         mifQ==
X-Gm-Message-State: ANoB5pnj+LtD7ftV7T8bi5ZPoVmYIq1EVGXwZFsoCLBMdU8F++IySTAa
	dWjqxUEZh2cIDBolm+hsb8/B3Ch6Pf8+Kw==
X-Google-Smtp-Source: AA0mqf5BAt3JQOqVC//lgOp+Fayfzf3asGiSnTe0q/EadClT2DC5LuiHqfpBXoAdHTIggHYR6CiwqQ==
X-Received: by 2002:a05:6214:3713:b0:4c7:8497:e312 with SMTP id np19-20020a056214371300b004c78497e312mr48764655qvb.18.1671102645711;
        Thu, 15 Dec 2022 03:10:45 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id n11-20020a05620a294b00b006b5cc25535fsm12104223qkp.99.2022.12.15.03.10.44
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 03:10:44 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-3f15a6f72d0so36743497b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Dec 2022 03:10:44 -0800 (PST)
X-Received: by 2002:a0d:cb4c:0:b0:38e:e541:d8ca with SMTP id
 n73-20020a0dcb4c000000b0038ee541d8camr23940870ywd.283.1671102643962; Thu, 15
 Dec 2022 03:10:43 -0800 (PST)
MIME-Version: 1.0
References: <20221212115505.36770-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221212115505.36770-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUCkCyLOXbQEJyc7S2F08=ftNtPcEztRN3JWJv_FPmAVw@mail.gmail.com> <CA+V-a8vD=SOb6gPOwdPUE=kHeqa+oo2L-rbaW8zGjvw7YyQsqg@mail.gmail.com>
In-Reply-To: <CA+V-a8vD=SOb6gPOwdPUE=kHeqa+oo2L-rbaW8zGjvw7YyQsqg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Dec 2022 12:10:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWX4Yd52=Jv8kABtn+1B1V=dC2iXVZ81gNZBWNu4hb_3w@mail.gmail.com>
Message-ID: <CAMuHMdWX4Yd52=Jv8kABtn+1B1V=dC2iXVZ81gNZBWNu4hb_3w@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] soc: renesas: Add L2 cache management for RZ/Five SoC
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>, 
	Samuel Holland <samuel@sholland.org>, Guo Ren <guoren@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jisheng Zhang <jszhang@kernel.org>, 
	Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Nathan Chancellor <nathan@kernel.org>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_031049_901902_6FCAE2F8 
X-CRM114-Status: GOOD (  33.51  )
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

On Thu, Dec 15, 2022 at 12:06 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Thu, Dec 15, 2022 at 10:36 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Mon, Dec 12, 2022 at 12:58 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > I/O Coherence Port (IOCP) provides an AXI interface for connecting
> > > external non-caching masters, such as DMA controllers. The accesses
> > > from IOCP are coherent with D-Caches and L2 Cache.
> > >
> > > IOCP is a specification option and is disabled on the Renesas RZ/Five
> > > SoC due to this reason IP blocks using DMA will fail.
> > >
> > > The Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
> > > block that allows dynamic adjustment of memory attributes in the runtime.
> > > It contains a configurable amount of PMA entries implemented as CSR
> > > registers to control the attributes of memory locations in interest.
> > > Below are the memory attributes supported:
> > > * Device, Non-bufferable
> > > * Device, bufferable
> > > * Memory, Non-cacheable, Non-bufferable
> > > * Memory, Non-cacheable, Bufferable
> > > * Memory, Write-back, No-allocate
> > > * Memory, Write-back, Read-allocate
> > > * Memory, Write-back, Write-allocate
> > > * Memory, Write-back, Read and Write-allocate
> > >
> > > More info about PMA (section 10.3):
> > > Link: http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
> > >
> > > As a workaround for SoCs with IOCP disabled CMO needs to be handled by
> > > software. Firstly OpenSBI configures the memory region as
> > > "Memory, Non-cacheable, Bufferable" and passes this region as a global
> > > shared dma pool as a DT node. With DMA_GLOBAL_POOL enabled all DMA
> > > allocations happen from this region and synchronization callbacks are
> > > implemented to synchronize when doing DMA transactions.
> > >
> > > Example PMA region passes as a DT node from OpenSBI:
> > >     reserved-memory {
> > >         #address-cells = <2>;
> > >         #size-cells = <2>;
> > >         ranges;
> > >
> > >         pma_resv0@58000000 {
> > >             compatible = "shared-dma-pool";
> > >             reg = <0x0 0x58000000 0x0 0x08000000>;
> > >             no-map;
> > >             linux,dma-default;
> > >         };
> > >     };
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > >  arch/riscv/include/asm/cacheflush.h       |   8 +
> > >  arch/riscv/include/asm/errata_list.h      |  28 ++-
> > >  drivers/soc/renesas/Kconfig               |   6 +
> > >  drivers/soc/renesas/Makefile              |   2 +
> > >  drivers/soc/renesas/rzfive/Kconfig        |   6 +
> > >  drivers/soc/renesas/rzfive/Makefile       |   3 +
> > >  drivers/soc/renesas/rzfive/ax45mp_cache.c | 256 ++++++++++++++++++++++
> >
> > Given this touches arch/riscv/include/asm/, I don't think the
> > code belongs under drivers/soc/renesas/.
> >
> Ok. Do you have any suggestions on where you want me to put this code?

As it plugs into core riscv functionality, I think it should be under
arch/riscv/.

if the RISC-V maintainers object to that, another option is
drivers/soc/andestech/ or (new) drivers/cache/

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
