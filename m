Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA4FC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 15:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X7P7y+bWIBN50hMX2QV642G6c0wNwf4IdFKI7uFE+5o=; b=Ex7u8rmSkqKgjN
	9AEV6lWSMTOgxojg5uiBogQPOdvPk28f40+2r/aODT2tKqDPxblJxpqm4s2PPZ57i98FlpTbGCmTM
	hEvP3uTYCZJd3dLe3yWQIZuMtuxGB08NWK1Fctvseb7oJ0brkzHdpkudy5GvN+22fyS0cnwBAUj5x
	4YgqxyyQ6NU+0FNbdINyIDdM2yOM4bGB8yq1rCQewhybw4bfGuSu07FIFIhSmOnRjWtv26+F/P4tF
	axMum36enqOq5/eRTvWQyCXZCqoN+Kt1bQjElZNdvJMlXBivRJzAV5NibzNorcF0UmHG8KAZde26j
	U0+Q3CkuBQRK5Vtj6KyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og5vb-00EkBX-Md; Wed, 05 Oct 2022 15:03:19 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og5vY-00EkAD-5h
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 15:03:17 +0000
Received: by mail-ed1-x533.google.com with SMTP id y8so23378626edc.10
        for <linux-riscv@lists.infradead.org>; Wed, 05 Oct 2022 08:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=EV7XyXChgvT98eS3lyY/bsEgvLKgLuQ8kiVyGfqgsRc=;
        b=ZB6dTPLvXNrIx9hvUtmntH3rsUAsOE0PNl4vNOIZIGh31+xuUaPpRkjC+Qf9kcPCPE
         tWMRmoDlCaR6cTcEDNgYpvlFEm164K3jp/BqQNvKPDSSYFUYVBDifEo6dXgwWf3PNomp
         /UC5ZtgNRtLbk351hxquTgNu/eWt59F38/A8etKpb3fe40msiUNJyYdlrBPdslvkm4DG
         Ej7YJ8PZAD3ckZn2Iu/Q/q0USDXhz9dA62wb9IOvGQeOrq3WG4omAwBmeoKRuJ/CxSMD
         M+9OlrsM+JrCNAcXv21FxncLv1V3ffXuIo9TWAjrhznvtvC6zbNjix7L89HIIum8aX6o
         LdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=EV7XyXChgvT98eS3lyY/bsEgvLKgLuQ8kiVyGfqgsRc=;
        b=Dz9UJst4GA5gLMlz4tZmgeEXxmXnPlC9GT1ZkoZ8ZLQuX53RH9s68nKm4WWl7jzez8
         WIakGuUmCq9305jSV3kWcwogo/2IISkmfQGIJ0l055O6Bv/Z80aEP5JJgyPPGDCMwF04
         H8zZ/VO6Gyb7OqoRsGe6RMTJuktql/2kyeTcOQfTU+wxmt1wR2KiWYGKfVVqaIw9seGZ
         fxD5VYCDlF2sYNEh5g7MQIgM61dCcXWfugAWt+YlJWMK2mvw09t/aXTCouzxavpm5s35
         0FZfBePFb+KwDnnlnIi7bu/LXZxKmx8PAXkTgV/mrILXl0PUeKMuv4asb7JG9Sq3PZ/V
         gDFw==
X-Gm-Message-State: ACrzQf0yRd5gtQKIJIhMUzYYR+mNGQ1zdMmjtdsuJKwRZbcbjkq84tg0
	uObuCLQSBnKMUH/ivd18nJgHASai84VrUJW6/+1zNxdZuO9sZ1JJ
X-Google-Smtp-Source: AMsMyM4qr8LOycRew9uAIlBT+l89Vtps7ikFw9UBTKlclR06oIm+0yGzuCwAzVU/0yUjjkrkTgpUNxP3/6PJFo/4vRs=
X-Received: by 2002:a05:6402:1393:b0:457:ea9e:ba20 with SMTP id
 b19-20020a056402139300b00457ea9eba20mr174784edv.109.1664982194272; Wed, 05
 Oct 2022 08:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <20221003223222.448551-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221003223222.448551-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAJF2gTQuSX9idEyNmGRwpAsSP8V=+QKQ7UAp28T-seM8rbkwOA@mail.gmail.com>
 <CA+V-a8smkDmQbz76sTA5XfUm7bkY4Ee-L5xYW+-xRWkE1TYiAw@mail.gmail.com> <CAJF2gTQ4G-j3p_pHvVQ82R2DFQZq70xgE3ZhoRkxiSzrHnU2og@mail.gmail.com>
In-Reply-To: <CAJF2gTQ4G-j3p_pHvVQ82R2DFQZq70xgE3ZhoRkxiSzrHnU2og@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 5 Oct 2022 16:02:47 +0100
Message-ID: <CA+V-a8tLYT0541FNo_o-sTsV7ywwnGTRtv6ropVu+0Wd-PsM6A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/2] soc: renesas: Add L2 cache management for
 RZ/Five SoC
To: Guo Ren <guoren@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, Nathan Chancellor <nathan@kernel.org>, 
	Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_080316_240638_46005A7E 
X-CRM114-Status: GOOD (  31.63  )
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

Hi Guo,

On Wed, Oct 5, 2022 at 3:23 PM Guo Ren <guoren@kernel.org> wrote:
>
> On Wed, Oct 5, 2022 at 8:54 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> >
> > Hi Guo,
> >
> > On Wed, Oct 5, 2022 at 2:29 AM Guo Ren <guoren@kernel.org> wrote:
> > >
> > > On Tue, Oct 4, 2022 at 6:32 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > > >
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
> > > Seems Svpbmt's PMA, IO, and NC wouldn't fit your requirements, could
> > > give a map list of the types of Svpbmt? And give out what you needed,
> > > but Svpbmt can't.
> > >
> > Sorry I didn't get what you meant here, could you please elaborate.
> I know there is no pbmt in AX45MP, I am just curious how many physical
> memory attributes you would use in linux? It seems only one type used
> in the series:
> cpu_nocache_area_set -> sbi_ecall(SBI_EXT_ANDES,
> SBI_EXT_ANDES_SET_PMA, offset, vaddr, size, entry_id, 0, 0);
>
Yes, currently we only use "Memory, Non-cacheable, Bufferable". I was
wondering if we could send these options as flags from DT something
like below so that it's not hard coded in the code.

/* PMA config */
#define AX45MP_PMACFG_ETYP                GENMASK(1, 0)
/* OFF: PMA entry is disabled */
#define AX45MP_PMACFG_ETYP_DISABLED            0
/* Naturally aligned power of 2 region */
#define AX45MP_PMACFG_ETYP_NAPOT            3

#define AX45MP_PMACFG_MTYP                GENMASK(5, 2)
/* Device, Non-bufferable */
#define AX45MP_PMACFG_MTYP_DEV_NON_BUF            (0 << 2)
/* Device, bufferable */
#define AX45MP_PMACFG_MTYP_DEV_BUF            (1 << 2)
/* Memory, Non-cacheable, Non-bufferable */
#define AX45MP_PMACFG_MTYP_MEM_NON_CACHE_NON_BUF    (2 << 2)
/* Memory, Non-cacheable, Bufferable */
#define AX45MP_PMACFG_MTYP_MEM_NON_CACHE_BUF        (3 << 2)
/* Memory, Write-back, No-allocate */
#define AX45MP_PMACFG_MTYP_MEM_WB_NA            (8 << 2)
/* Memory, Write-back, Read-allocate */
#define AX45MP_PMACFG_MTYP_MEM_WB_RA            (9 << 2)
/* Memory, Write-back, Write-allocate */
#define AX45MP_PMACFG_MTYP_MEM_WB_WA            (10 << 2)
/* Memory, Write-back, Read and Write-allocate */
#define AX45MP_PMACFG_MTYP_MEM_WB_R_WA            (11 << 2)

/* AMO instructions are supported */
#define AX45MP_PMACFG_NAMO_AMO_SUPPORT            (0 << 6)
/* AMO instructions are not supported */
#define AX45MP_PMACFG_NAMO_AMO_NO_SUPPORT        (1 << 6)


                pma-regions = <0x0 0x00000000 0x0 0x10000000 0x0
AX45MP_PMACFG_ETYP_NAPOT |  AX45MP_PMACFG_MTYP_MEM_NON_CACHE_BUF |
AX45MP_PMACFG_NAMO_AMO_SUPPORT>,
                              <0x0 0x10000000 0x0 0x04000000 0x0
AX45MP_PMACFG_ETYP_NAPOT |  AX45MP_PMACFG_MTYP_MEM_NON_CACHE_BUF |
AX45MP_PMACFG_NAMO_AMO_SUPPORT >,
                              <0x0 0x20000000 0x0 0x10000000 0x0
AX45MP_PMACFG_ETYP_NAPOT |  AX45MP_PMACFG_MTYP_MEM_NON_CACHE_BUF |
AX45MP_PMACFG_NAMO_AMO_SUPPORT>,
                              <0x0 0x58000000 0x0 0x08000000 0x0
AX45MP_PMACFG_ETYP_NAPOT |  AX45MP_PMACFG_MTYP_MEM_NON_CACHE_BUF |
AX45MP_PMACFG_NAMO_AMO_SUPPORT>;

Does the above sound good?

> I'm not sure how you make emmc/usb/gmac's dma ctrl desc work around
> without pbmt when they don't have cache coherency protocol. Do you
> need to inject dma_sync for desc synchronization? What's the effect of
> dynamic PMA in the patch series?
>
Currently we have setup the pma regions as below:

l2cache: cache-controller@13400000 {
                compatible = "andestech,ax45mp-cache", "cache";
                cache-size = <0x40000>;
                cache-line-size = <64>;
                cache-sets = <1024>;
                cache-unified;
                reg = <0x0 0x13400000 0x0 0x100000>;
                pma-regions = <0x0 0x00000000 0x0 0x10000000 0x0 0xf>,
                              <0x0 0x10000000 0x0 0x04000000 0x0 0xf>,
                              <0x0 0x20000000 0x0 0x10000000 0x0 0xf>,
                              <0x0 0x58000000 0x0 0x08000000 0x0 0xf>;
                interrupts = <SOC_PERIPHERAL_IRQ(476, IRQ_TYPE_LEVEL_HIGH)>;
        };

The last pma-regions entry 0x58000000 is a DDR location this memory
locations is marked as shared DMA pool with below in DT,

    reserved-memory {
        #address-cells = <2>;
        #size-cells = <2>;
        ranges;

        reserved: linux,cma@58000000 {
            compatible = "shared-dma-pool";
            no-map;
            linux,dma-default;
            reg = <0x0 0x58000000 0x0 0x08000000>;
        };
    };

And for ARCH_R9A07G043 we automatically select DMA_GLOBAL_POOL, so the
IP blocks (emmc/usb/gmac's) requesting DMA'able memory will
automatically fall into this region which is non-cacheable but
bufferable (set in PMA) and rest everything is taken care by clean and
flush callbacks. We dont have  inject dma_sync for desc
synchronization for existing drivers (which are shared with Renesas
RZ/G2L family)

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
