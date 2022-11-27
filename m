Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A06C4321E
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Nov 2022 10:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GCoHxwPLtHe+VqzXl89FsCxGa6WXzny4ZvjTagpzrc8=; b=QKK5AUbMo6gHO2
	AQ5ptPvtHSEBbjhCDe4lVqsNAMnSOPmhRIVBRDa0DYGDBBAMBpEOcv5mVHh4FM8LF2l/+ihPn7tFQ
	0W27tla9uk/HERvzVp1c1/gIUULU0UJfh8+O80uOa/LCm8QXIJkUHPLWtGZ34tSdc+/I3YbbMc/yX
	UO1Ef2vBGOTfv5+rG13HI3hYU246emZymrQZOxgjep2qxW52O6IluxjQwBzMNlxRTn4xNVn+NMXxx
	ijoEvEjPr9BjLJzaRveDqJB0RTlAuDPqNTuVYvYliLqcRHU797zwjiSmRctmYcpSI9xYotA99ArA3
	jhHkfQhKZu4mFkDLpATQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozEVG-00AmKV-4P; Sun, 27 Nov 2022 10:03:14 +0000
Received: from mail-qv1-f54.google.com ([209.85.219.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozEVC-00AmJm-Hi
	for linux-riscv@lists.infradead.org; Sun, 27 Nov 2022 10:03:12 +0000
Received: by mail-qv1-f54.google.com with SMTP id d13so5555022qvj.8
        for <linux-riscv@lists.infradead.org>; Sun, 27 Nov 2022 02:03:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a/lRJw3Gs/dFweLCVLuIgos8ablOI2qBTJVe/3vTcrU=;
        b=DWF3sn6dRVqZXMcGpciyybXGCPTHFHiGuj+1r67R1u86zuR6RmJdpDuGJEB/RHYuIx
         lSgHLHfCo1QwTrJjsjrvntdiiE8nJwdHdqdPeo5EiJCWJOrKsMxEovyUE8jA91WXozAA
         jgYf8F9X+IqmtsVBEBnhrk4nroFOXlpMrda7D0L6S/hpZyn3b9SViGDehA94JILOlp3F
         GrtK8yW9mCn6xLjRm7rLZGsv44oBNib2p+3mRJOE3Q1H4H5xRFp12lA2uN1ozdRFeSWl
         GXgAp6aA0sSIBFL3G4ptc9x0smdX25gRai4nrjx0vxf3n26O3gfRDPQBYitwyt3iqP2O
         U+XQ==
X-Gm-Message-State: ANoB5pmaL1tlypwqRyWLhjcl/vteLjc7/4cMsZS5YSRNiUYGrqtdJ3UF
	4SZey2Ui18sMdwjXmcC4fTmxezifix25BA==
X-Google-Smtp-Source: AA0mqf7p+mKpuIJyVHJF1L7qMgJyLVWKui/Z/9nS2TwEUV5RofbIECUOiGxSNY0ib8Nn/SHOjmgk/w==
X-Received: by 2002:a0c:b35a:0:b0:4c6:92ee:f327 with SMTP id a26-20020a0cb35a000000b004c692eef327mr24280378qvf.67.1669543388359;
        Sun, 27 Nov 2022 02:03:08 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id do39-20020a05620a2b2700b006cdd0939ffbsm6088969qkb.86.2022.11.27.02.03.08
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 02:03:08 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-3704852322fso79401237b3.8
        for <linux-riscv@lists.infradead.org>; Sun, 27 Nov 2022 02:03:08 -0800 (PST)
X-Received: by 2002:a5b:24b:0:b0:6ca:3b11:8d76 with SMTP id
 g11-20020a5b024b000000b006ca3b118d76mr25273660ybp.202.1669542919298; Sun, 27
 Nov 2022 01:55:19 -0800 (PST)
MIME-Version: 1.0
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221124172207.153718-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <bf8e33fd-a752-d5d5-859e-14302d069f2d@sholland.org> <CA+V-a8sz4i_wenTyA5tVTVB8dQWLmuXCf3CGYOPC+C07GJ8WTw@mail.gmail.com>
In-Reply-To: <CA+V-a8sz4i_wenTyA5tVTVB8dQWLmuXCf3CGYOPC+C07GJ8WTw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 27 Nov 2022 10:55:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWQO_usrJwmVYDx6o-CpzmotVZLt176eKbqLzY-GXiDng@mail.gmail.com>
Message-ID: <CAMuHMdWQO_usrJwmVYDx6o-CpzmotVZLt176eKbqLzY-GXiDng@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] soc: renesas: Add L2 cache management for RZ/Five SoC
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Atish Patra <atishp@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Nathan Chancellor <nathan@kernel.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_020310_612536_52498FBA 
X-CRM114-Status: GOOD (  43.94  )
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

On Sat, Nov 26, 2022 at 10:10 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Fri, Nov 25, 2022 at 7:43 PM Samuel Holland <samuel@sholland.org> wrote:
> > On 11/24/22 11:22, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > On the AX45MP core, cache coherency is a specification option so it may
> > > not be supported. In this case DMA will fail. As a workaround, firstly we
> > > allocate a global dma coherent pool from which DMA allocations are taken
> > > and marked as non-cacheable + bufferable using the PMA region as specified
> > > in the device tree. Synchronization callbacks are implemented to
> > > synchronize when doing DMA transactions.
> > >
> > > The Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
> > > block that allows dynamic adjustment of memory attributes in the runtime.
> > > It contains a configurable amount of PMA entries implemented as CSR
> > > registers to control the attributes of memory locations in interest.
> > >
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
> > > This patch adds support to configure the memory attributes of the memory
> > > regions as passed from the l2 cache node and exposes the cache management
> > > ops.
> >
> > Forgive my ignorance, but why do you need both a DMA pool and explicit
> > cache maintenance? Wouldn't the purpose of marking a memory region as
> > permanently non-cacheable be to avoid cache maintenance? And likewise,
> > if you are doing cache maintenance anyway, why does it matter if/how the
> > memory is cacheable?
> >
> "Memory, Non-cacheable, Bufferable" raises an AXI signal for
> transactions hence needing SW implementation for cache maintenance.
>
> > > More info about PMA (section 10.3):
> > > Link: http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> > > +static int ax45mp_configure_pma_regions(struct device_node *np)
> > > +{
> > > +     const char *propname = "andestech,pma-regions";
> > > +     u32 start, size, flags;
> > > +     unsigned int entry_id;
> > > +     unsigned int i;
> > > +     int count;
> > > +     int ret;
> > > +
> > > +     count = of_property_count_elems_of_size(np, propname, sizeof(u32) * 3);
> > > +     if (count < 0)
> > > +             return count;
> > > +
> > > +     if (count > AX45MP_MAX_PMA_REGIONS)
> > > +             return -EINVAL;
> > > +
> > > +     for (i = 0, entry_id = 0 ; entry_id < count ; i += 3, entry_id++) {
> > > +             of_property_read_u32_index(np, propname, i, &start);
> > > +             of_property_read_u32_index(np, propname, i + 1, &size);
> > > +             of_property_read_u32_index(np, propname, i + 2, &flags);
> > > +             ret = ax45mp_sbi_set_pma(start, size, flags, entry_id);
> > > +             if (!ret)
> > > +                     pr_err("Failed to setup PMA region 0x%x - 0x%x flags: 0x%x",
> > > +                            start, start + size, flags);
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> >
> > If firmware support is required to set up these PMA regions, why is
> > Linux doing this at all? The firmware has access to the devicetree as
> > well. It can set this up before entering S-mode, and then you don't need
> > to expose this capability via an SBI extension. In fact, firmware could
> > generate the reserved-memory node based on these regions at runtime (or
> > vice versa).
> >
> That's a good point. I'll do some research on this and get back.
>
> Btw are there any existing examples where the firmware adds DT nodes?

/memory, reserved-memory, optee on ARM, RPC status on R-Car Gen3/4, ...

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
