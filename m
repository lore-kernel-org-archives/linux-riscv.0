Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4D3C433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 03:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mEHV5npV042dzBNHfQfc4S2qUjvdrNCg8NRmVFrfBAA=; b=IF0bdjJsgJNWQ3
	AIDCgZSrnl/RnOZEojLWp4Xh77aShOzF4+ArFf90aZdp3sSi1zymt8M5dwQOO3AUGVdmGqenffA2K
	ynYgMbDf01i+Uail2NTcsnT54hFMpXKun6slsk3NmKSCc3NatUyHevQNlrsNmb840+wtX29MmRm7E
	o8SWGFXVaoBkg56Zfh4VxHJAlnchOuMX/FHj33lwL4ajdyL8aG3F8F/rxpwu2Pz02/NDHXxIdZfTK
	2uRENj7io+suOIrE51Ntv6Fk4HnOcsColmsJg/GLGPk6Po88RkN9lKX6SXkjny32eVa53/GFVs+Oo
	SIwcfCnmpeTnq9o1wXtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqQmo-00FkH7-RC; Thu, 03 Nov 2022 03:20:58 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqQml-00FkGK-E5
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 03:20:57 +0000
Received: by mail-oi1-f169.google.com with SMTP id s206so762553oie.3
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 20:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9LEoUWJvpUFOWNZZSHLTT8Vj3FE8ZbDHe08yAKC0s8=;
        b=aAlWSvZpbekWf/shxafE/aWu6rdKsivPPAU7zJrL3hA1pcTrxlIah6jxlFhU2v/gIO
         BMW9qiifUeP8efbjw0rnqyubNjFt7VVcjJj6PZeJuuYb/M0OYoPK6N6EZgPTy4o459vi
         eDXZQE4rmUhjB5m22kIwb+lEeTFHbjN5Z5tJN4mXngaLprRkSUZseQwm+VlJBukfRqfV
         ghnxIZ6o0zKA2G0T47/axN9ir6d1AM1rqRmueiXL3QM/R52wJ6P+U9IUsr832qsD+tQj
         o9CAdf6twsxLavxS7K/TcFZn59I2xv+LFcwLgIgEsTQYwlKZAmx76FIeJM3V3nc3yWNG
         L6dA==
X-Gm-Message-State: ACrzQf2E6PHxzcrOugUFHVHXzrm6azbNwlgW2DO9rBDd7SumUKhtNSmV
	yFX+UYikdWx6OL5JsXebwA==
X-Google-Smtp-Source: AMsMyM4x9J/gNXs66sXJG0Hy26y6zYfJGYKLSTEOTu+BoRTCA1i0xSYSWxYDuz+zEQkxansG7DLxNA==
X-Received: by 2002:a05:6808:2082:b0:35a:224:983b with SMTP id s2-20020a056808208200b0035a0224983bmr11413143oiw.179.1667445651094;
        Wed, 02 Nov 2022 20:20:51 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c14-20020a4ad20e000000b004982f2d3c03sm5059059oos.25.2022.11.02.20.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 20:20:50 -0700 (PDT)
Received: (nullmailer pid 1058925 invoked by uid 1000);
	Thu, 03 Nov 2022 03:20:51 -0000
Date: Wed, 2 Nov 2022 22:20:51 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [RFC PATCH v3 2/2] soc: renesas: Add L2 cache management for
 RZ/Five SoC
Message-ID: <20221103032051.GD459441-robh@kernel.org>
References: <20221019220242.4746-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221019220242.4746-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221021020500.GA2157489-robh@kernel.org>
 <CA+V-a8v0jEFj+XKAtyAaTBFmX3bObBZgGd6n1LB3OnTU_W002w@mail.gmail.com>
 <Y1Md4bMYJHI34HuJ@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y1Md4bMYJHI34HuJ@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_202055_494454_638F367C 
X-CRM114-Status: GOOD (  34.15  )
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

On Fri, Oct 21, 2022 at 11:32:01PM +0100, Conor Dooley wrote:
> On Fri, Oct 21, 2022 at 11:05:40PM +0100, Lad, Prabhakar wrote:
> > Hi Rob,
> > 
> > Thank you for the review.
> > 
> > On Fri, Oct 21, 2022 at 3:05 AM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Wed, Oct 19, 2022 at 11:02:42PM +0100, Prabhakar wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > On the AX45MP core, cache coherency is a specification option so it may
> > > > not be supported. In this case DMA will fail. As a workaround, firstly we
> > > > allocate a global dma coherent pool from which DMA allocations are taken
> > > > and marked as non-cacheable + bufferable using the PMA region as specified
> > > > in the device tree. Synchronization callbacks are implemented to
> > > > synchronize when doing DMA transactions.
> > > >
> > > > The Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
> > > > block that allows dynamic adjustment of memory attributes in the runtime.
> > > > It contains a configurable amount of PMA entries implemented as CSR
> > > > registers to control the attributes of memory locations in interest.
> > > >
> > > > Below are the memory attributes supported:
> > > > * Device, Non-bufferable
> > > > * Device, bufferable
> > > > * Memory, Non-cacheable, Non-bufferable
> > > > * Memory, Non-cacheable, Bufferable
> > > > * Memory, Write-back, No-allocate
> > > > * Memory, Write-back, Read-allocate
> > > > * Memory, Write-back, Write-allocate
> > > > * Memory, Write-back, Read and Write-allocate
> > > >
> > > > This patch adds support to configure the memory attributes of the memory
> > > > regions as passed from the l2 cache node and exposes the cache management
> > > > ops.
> > > >
> > > > More info about PMA (section 10.3):
> > > > http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
> > > >
> > > > This feature is based on the work posted [0] by Vincent Chen
> > > > <vincentc@andestech.com> for the Andes AndeStart RISC-V CPU.
> > > >
> > > > [0] https://lore.kernel.org/lkml/1540982130-28248-1-git-send-email-vincentc@andestech.com/
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > ---
> > > >  arch/riscv/include/asm/cacheflush.h    |   8 +
> > > >  arch/riscv/include/asm/errata_list.h   |   2 +
> > > >  arch/riscv/mm/dma-noncoherent.c        |  20 ++
> > > >  drivers/soc/renesas/Kconfig            |   5 +
> > > >  drivers/soc/renesas/Makefile           |   4 +
> > > >  drivers/soc/renesas/rzf/Kconfig        |   6 +
> > > >  drivers/soc/renesas/rzf/Makefile       |   3 +
> > > >  drivers/soc/renesas/rzf/ax45mp_cache.c | 431 +++++++++++++++++++++++++
> > >
> > > How many cache drivers do we have around now? I've seen a few bindings
> > > go by. I'm guessing it is time to stop putting the drivers in the
> > > drivers/soc/ dumping ground.
> > >
> > The main reason this driver is not in arch/riscv is that it has vendor
> > specific extensions. Due to this reason it was agreed during the LPC
> > that vendor specific extension should be maintained by SoC vendors and
> > was agreed that this can go into drivers/soc/renesas folder instead.
> 
> Does not in drivers/soc mean they need to go into arch/riscv?
> The outcome of the chat at the LPC BoF was more that the cache drivers
> themselves should not be be routed via the arch maintainers, no?

drivers/cache/ or something is what I'm suggesting starting. The first 
thing is probably making an inventory of how many we already have.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
