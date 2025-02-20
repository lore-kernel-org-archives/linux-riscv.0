Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130BAC021B1
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Feb 2025 09:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wpFPdGO0EhpIi9Oxhv9kGxseMBTqwi6KoRh2Cqlm1S0=; b=EJrT2YZHMnHsdv
	CY14yIF69/63EiGNCkb27nJR2bI02KyFNbkdUt1JRiH90n+va1jJTK1e4le44dp8HBLUkbmB5WINR
	TGOFVsnQe9xR+z3VLcD0lkspm+Bhu8U5S4mLXrS+TPE8vxypzXa3h4pRstE+4fsWnW2vtf+/tXkDA
	a9A6CurrMCLqInN+GFOxlhGlqERtJ6itTR+aDPKG1NQ5wAyD8moPonfepriNUpfhfMYEZ1/iN4Drn
	+vMaWLV3Jx6wAJDwsFQ+CvRvqbUlDePamKoVg+100HxiRMTi08UTO+qa6cAdqXBB6Mm37EtQ5lvcJ
	vtPK+mha6Fl6GFIBXeSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl3DJ-000000008sL-3bV5;
	Thu, 20 Feb 2025 09:51:25 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl3AL-000000007pu-3lQ9
	for linux-riscv@lists.infradead.org;
	Thu, 20 Feb 2025 09:48:23 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-307bc125e2eso7204271fa.3
        for <linux-riscv@lists.infradead.org>; Thu, 20 Feb 2025 01:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740044900; x=1740649700; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WnnHEBGbZXn/iLbbVbgNyyswQeQVsn6ueu7C9pryYmk=;
        b=N77IcNQDpbdSIHFzThn2aHwn33NIKdAu/A0J7GIJBgRp9MZLFuziskrpzYmFh2Pzph
         blY41XyoTWKUKyphM13IlK+x+x5zPik5k433PhY72HWVMnkGypNUzIKjqdUTu9+YKZSL
         XCjgD0/sVM/Lg5mrrmE4PW2ccPs1xrRNravxhYrcgfoK1HFt9NKF/+hgyE4j1BpmFDQ5
         xkS1puT0tW398I1FOQPSSIH6TpUltiL+Kq9b+oE/Ns/5BksTbrZAbVYhlUhWtzawRKK+
         p1x1nRicvNaipUEyHQ4uRJacST/FTFHLczhAGV13ouX0iGWmFOip0YHdNgvuIeaVZcfo
         70aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740044900; x=1740649700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WnnHEBGbZXn/iLbbVbgNyyswQeQVsn6ueu7C9pryYmk=;
        b=nzhSBVl5U4XOCxIUu0YHbrqMTBSuWIBACSiAy/osLWUTicFYK0Q8Nu58wmHeRsfdLB
         meH/1rMmZYWAFXu4Cvozk4km6ta6/ZxSUAtrfkhCSdvP8S+Scm24SttYTm2KFP24w91h
         BJAlo9Z2JqdYcvcc+oXXjysxuwv7iYbE7QCoom5nAOgjIwqEgCxveCVShd6cZklQ97Vk
         Rz58yxfLeyHu1XVtqm71+X4aH000SPo+tdf0WnUQzSCL3LqXauMl9iugd9fsBHriXQcM
         TGfUnp5wVXec+kRpje0CWmLVlHuVFbEMikdm+d6Dh9xzMwE/oBTedcC4156e7xBNKp9L
         1o5w==
X-Gm-Message-State: AOJu0YwFqFPbXGFBSS4unIx6rxGLlpNMSYJ2vlpk5CJiEOcqc4JkiKkh
	hiOQPTnxfvnIRFn/hfpk71unXNKRBLOn5T6OXPN4EeYq9YUc2bv0
X-Gm-Gg: ASbGncvwTbTRik4jTvIktoGfC9ibpwlsGmptDf2pdPC2CSIbLrBK6wGBTsz6ja8DeLw
	rjje2VdNai/0kD+U6zWDapOuSwLtEap/47IzKqWLa2o6NUpnItins6+fwEYvfLPMp0oVKpqS77i
	wAVlRf5hBxgESW/xMiABuFzEPE0aOlyKYx+Ht05Y7yAoPiiGZ29oydDx/LEEqydFzrwc0thE2ZA
	U83sAhXxE65Tzn1prvALvsyfs+yZaIR1d+qbRccQ+ESMZnHHFtfbVcx2tZwadiG8BcpYoLPja+x
	a7I+a00=
X-Google-Smtp-Source: AGHT+IFalDevTONqluicJCCPb7Sdnk7diBGx2VZQCkifcqIYaN4hBEjD+cfqBSzDu3kZfFTNqaXsNg==
X-Received: by 2002:a2e:8615:0:b0:304:588a:99ce with SMTP id 38308e7fff4ca-3092797efe8mr62921121fa.0.1740044899278;
        Thu, 20 Feb 2025 01:48:19 -0800 (PST)
Received: from curiosity ([5.188.167.4])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3091d92e8ddsm22504011fa.70.2025.02.20.01.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 01:48:18 -0800 (PST)
Date: Thu, 20 Feb 2025 12:48:16 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] riscv: select DMA_DIRECT_REMAP by RISCV_ISA_SVPBMT and
 ERRATA_THEAD_MAE
Message-ID: <Z7b6YGiUiUYp9lU-@curiosity>
References: <20250116172950.1989748-1-geomatsi@gmail.com>
 <199526de-4351-4fd7-8f6a-9e8dbf05c184@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <199526de-4351-4fd7-8f6a-9e8dbf05c184@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_014821_937899_6775832D 
X-CRM114-Status: GOOD (  30.55  )
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

Hi Alexandre,

On Mon, Feb 17, 2025 at 01:23:28PM +0100, Alexandre Ghiti wrote:
> Hi Sergey,
> 
> On 16/01/2025 18:29, Sergey Matyukevich wrote:
> > Select DMA_DIRECT_REMAP for the RISC-V extensions that allow to set
> > page-based memory types in PTEs according to the requested DMA
> > attributes. This is the purpose of Svpbmt or XTheadMae extensions.
> > Zicbom or XTheadCmo serve a different purpose, providing instructions
> > to flush/invalidate cache blocks.
> > 
> > Fixes: 381cae169853 ("riscv: only select DMA_DIRECT_REMAP from RISCV_ISA_ZICBOM and ERRATA_THEAD_PBMT")
> > 
> > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> > ---
> >   arch/riscv/Kconfig        | 2 +-
> >   arch/riscv/Kconfig.errata | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index d4a7ca0388c0..a5dabb744009 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -603,6 +603,7 @@ config RISCV_ISA_SVPBMT
> >   	depends on 64BIT && MMU
> >   	depends on RISCV_ALTERNATIVE
> >   	default y
> > +	select DMA_DIRECT_REMAP
> 
> 
> From what I read, DMA_DIRECT_MAP relies on the ability to map pages uncached
> (pgprot_dmacoherent() here
> https://elixir.bootlin.com/linux/v6.13.2/source/kernel/dma/pool.c#L104). But
> CONFIG_RISCV_ISA_SVPBMT does not guarantee that the underlying platform
> supports svpbmt so to me it is wrong to select DMA_DIRECT_MAP, we would need
> some runtime check instead.

IIUC this function highlights coherent dma allocation options and their
requirements even more clearly:
- https://elixir.bootlin.com/linux/v6.13.2/source/kernel/dma/direct.c#L222

> >   	help
> >   	   Adds support to dynamically detect the presence of the Svpbmt
> >   	   ISA-extension (Supervisor-mode: page-based memory types) and
> > @@ -787,7 +788,6 @@ config RISCV_ISA_ZICBOM
> >   	depends on RISCV_ALTERNATIVE
> >   	default y
> >   	select RISCV_DMA_NONCOHERENT
> 
> 
> And in the same way, we should not enable RISCV_DMA_NONCOHERENT since
> CONFIG_RISCV_ISA_ZICBOM does guarantee the presence of zicbom. Because then
> in mm/dma-noncoherent.c, the cache flush operations are nops.
> 
> Or am I missing something?

This is my understanding as well. In fact this patch is almost useless.
It would only allow to enable DMA_GLOBAL_POOL for platforms that support
Zicbom, but do not support Svpbmt.

The actual problem is that the RISC-V kernel image cannot have both
DMA_DIRECT_REMAP and DMA_GLOBAL_POOL since they are now mutually
exclusive in kernel/dma/Kconfig. This limitation is not convenient for
RISC-V, where kernels can be built with support for multiple extensions
and errata. But on boot only appropriate subset of them is enabled based
on the chip's VENDOR_ID and selected dtb.

Currently a portable RISC-V kernel is suitable only for platforms with
support for both Zicbom and Svpbmt or their vendor-specific alternatives.
So it doesn't really matter where DMA_DIRECT_REMAP is selected. Platforms
without Svpbmt need to build their own non-portable kernels anyway,
enabling support for DMA_GLOBAL_POOL. For instance, Starfive and Andes
in arch/riscv/Kconfig.errata and drivers/soc/renesas/Kconfig respectively.

Maybe one possible option would be to revert commit da323d464070
("dma-direct: add dependencies to CONFIG_DMA_GLOBAL_POOL") and add runtime
checks in dma_direct_alloc for dma_alloc_from_global_coherent.

In that case RISC-V kernels could be built with support for both
DMA_GLOBAL_POOL and DMA_DIRECT_REMAP. Global pool code path could be
enabled only for platforms that explicitly specify it in their dtbs.

Regards,
Sergey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
