Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF01C3DA71
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Dec 2022 11:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O6l/9QmCI5BaRMtXw87lANKnyFx64lIGov+sCCYO8AM=; b=SYAp2nKAjSulvS
	v9g4JDAqbluymVKBav8F8MytpkdzGTgqFxm2/6mjD/EEsl4So6P4brfgkLJ3abXvQFe503VjBQLPj
	Tsj2p5VH8Bvj+ZCAP06SaThVPGEnV1jVirGX/fsy2mux2d0IF94OcacGRXX31xm50vAt1F+YdLEj2
	nF55hrpWuSftGN07LIsXDE8/rWq4XBtq+w8soDnUSAmqSHnVaHqySgU0GBXAMDgvaqecE3nt+s4wD
	ckhC/Rd2SsOetcd1cXZnge1mlQkfeyyXUnK+967eP3jjyui9v3fAzSaRu+J1YlDPDz6YppYcS1U2l
	BmgY2uzOn0i6XWXRP9lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5m21-008vAw-9C; Thu, 15 Dec 2022 11:04:05 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5m1y-008v7f-KO
	for linux-riscv@lists.infradead.org; Thu, 15 Dec 2022 11:04:04 +0000
Received: by mail-ej1-x630.google.com with SMTP id vv4so51391902ejc.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Dec 2022 03:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IrHHMckS5tYSu8+AYoyLYCoKhDvhyi54tbjA5XBjEkI=;
        b=ddAZks5HRV3j0wghseWDDkPC9o4HW3gGQwRs0UOlLsH16MGhuYKctbCVMSCcUcGjYd
         NwPTHwE/QwquaVzShXj20DBQdTYj4hivZ4ti2C5imDdo7NhSMiiuISlQWDpPxsL7WxlK
         EFQnHH9Ggpvzgx9M0LfEkOL46oEwzwEBFr7hoPys91JB/OoJ1iqfZJVZJQnhmfobBAkW
         T+nOo3W3YhI+0Xshb0rmCRpsCqTGpveif8Qtd5buxJ73dM1gYyr8MdGDpHwsFP+MMZAM
         cUFeFj27NOcmdaDUSVTwOaMUS1K0f3oxdexDJghpM59zpPJ+7wPFDwy19HEUDJmJynkW
         74TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IrHHMckS5tYSu8+AYoyLYCoKhDvhyi54tbjA5XBjEkI=;
        b=q4P7K8hN2lR8MPqirR2Jtsfa5qSBrLK7ubtYiwH2qOYujpWVpJ08bC0saLsZa96gHw
         CFK3LZKlUNjiyDfBJ4xRgTEFtMtdzmU6unLxI1hBMWp7V2xVeP1/wUviGL1HyPbQxFaW
         OX2T2IX7EaldlgXYsjkVBnM1Em/1f0xCcW2hpqgROKPT03z30Y7u6dhRZQAsNrj4ix8C
         82n3XudjAhof8PYYGU27aIhs61My8mplA4jMV1Zp6OagZ9/ucYvutIl2Ei8bhLa8DMjL
         SKT4F/QqFsX3VFeOt8zZYjamGVnKySXp9EB9lyef6DV2MtHNaxWnX2mRtoQFnCdr6bVU
         UAQw==
X-Gm-Message-State: ANoB5plC3K3YhM3kmpEHKRf9IxaGmIk3Ruk6eQazmahAvcl3USNsgZUc
	TUpq1h9d7Otj+GoWGl78SkicIJUYt5RUdhlzGnY=
X-Google-Smtp-Source: AA0mqf5rbUHMbEGzwbNAF3YodbSPH4k28G07lOZ4WJGgA2x70kivbP15GrFnRvST9t+UI1pfDn1dRDGCFhFu+qB7lcI=
X-Received: by 2002:a17:906:3e41:b0:78d:bc9f:33da with SMTP id
 t1-20020a1709063e4100b0078dbc9f33damr79654658eji.80.1671102238154; Thu, 15
 Dec 2022 03:03:58 -0800 (PST)
MIME-Version: 1.0
References: <20221212115505.36770-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221212115505.36770-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUCkCyLOXbQEJyc7S2F08=ftNtPcEztRN3JWJv_FPmAVw@mail.gmail.com>
In-Reply-To: <CAMuHMdUCkCyLOXbQEJyc7S2F08=ftNtPcEztRN3JWJv_FPmAVw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 15 Dec 2022 11:03:31 +0000
Message-ID: <CA+V-a8vD=SOb6gPOwdPUE=kHeqa+oo2L-rbaW8zGjvw7YyQsqg@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] soc: renesas: Add L2 cache management for RZ/Five SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel@sholland.org>, 
	Guo Ren <guoren@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jisheng Zhang <jszhang@kernel.org>, 
	Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Nathan Chancellor <nathan@kernel.org>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_030402_691552_761530EA 
X-CRM114-Status: GOOD (  22.90  )
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

On Thu, Dec 15, 2022 at 10:36 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, Dec 12, 2022 at 12:58 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > I/O Coherence Port (IOCP) provides an AXI interface for connecting
> > external non-caching masters, such as DMA controllers. The accesses
> > from IOCP are coherent with D-Caches and L2 Cache.
> >
> > IOCP is a specification option and is disabled on the Renesas RZ/Five
> > SoC due to this reason IP blocks using DMA will fail.
> >
> > The Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
> > block that allows dynamic adjustment of memory attributes in the runtime.
> > It contains a configurable amount of PMA entries implemented as CSR
> > registers to control the attributes of memory locations in interest.
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
> > More info about PMA (section 10.3):
> > Link: http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
> >
> > As a workaround for SoCs with IOCP disabled CMO needs to be handled by
> > software. Firstly OpenSBI configures the memory region as
> > "Memory, Non-cacheable, Bufferable" and passes this region as a global
> > shared dma pool as a DT node. With DMA_GLOBAL_POOL enabled all DMA
> > allocations happen from this region and synchronization callbacks are
> > implemented to synchronize when doing DMA transactions.
> >
> > Example PMA region passes as a DT node from OpenSBI:
> >     reserved-memory {
> >         #address-cells = <2>;
> >         #size-cells = <2>;
> >         ranges;
> >
> >         pma_resv0@58000000 {
> >             compatible = "shared-dma-pool";
> >             reg = <0x0 0x58000000 0x0 0x08000000>;
> >             no-map;
> >             linux,dma-default;
> >         };
> >     };
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> >  arch/riscv/include/asm/cacheflush.h       |   8 +
> >  arch/riscv/include/asm/errata_list.h      |  28 ++-
> >  drivers/soc/renesas/Kconfig               |   6 +
> >  drivers/soc/renesas/Makefile              |   2 +
> >  drivers/soc/renesas/rzfive/Kconfig        |   6 +
> >  drivers/soc/renesas/rzfive/Makefile       |   3 +
> >  drivers/soc/renesas/rzfive/ax45mp_cache.c | 256 ++++++++++++++++++++++
>
> Given this touches arch/riscv/include/asm/, I don't think the
> code belongs under drivers/soc/renesas/.
>
Ok. Do you have any suggestions on where you want me to put this code?

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
