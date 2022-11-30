Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0597C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 13:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mzc+K8+9ekWcMpbSs3gvPWd34tpTOmANYmwNbGWE36E=; b=osRYOuYJxWnFRZ
	u8662d3jOtH4ysXPjhnJJMdABb25ifAgpaRDASgXlvszRzaw6GSFgioO5pYEHxzFcwzsc5pT6spnc
	cSQcmwo087fSZdYuQ5KrYViLpLVL7ih0eiuc5CTAoVNm8SVCERNoRLNkjtr3j4axpeQbGhGgN+rL2
	9LsYItt3yiS/I8a4klXnKnyCdMhXsPgNBVjUdKW4AC9/v9MLqbYPk/kHXSlr9G83qyKz3V6ayJS/G
	FHu6azoa8Uw+Et18maX/qGYiSxugdIfV7TwKUApLXQyAUD75N4QtOXnGBZs4tPHOEdjzulRIVxxfg
	bPL46idjnLffqNZT+cgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0NYY-00GdbX-IB; Wed, 30 Nov 2022 13:55:22 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0NYU-00Gdal-SN
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 13:55:21 +0000
Received: by mail-ej1-x62d.google.com with SMTP id n21so41468795ejb.9
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 05:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8+9rLRJtQCqzqOdAmtT/dXgjj2NiWtyjkoCbCxp49/Y=;
        b=oj/NWgpWk7GlGB0FVkTuYK/i9W7xaKUrkaWwd83CyZ5kK5s06CyQ5T5AKRsIOBuMLX
         E2av4FijEaMpxiMe5ICaG/vwgPTK8iyYXUOnzpj5FQoy0KLPO+VT8DEvHzuOeDlkRreX
         mJBzVSf/GbQBsbrEhNKdyulM3OKIJOR5I2QlR02Luk7bib6EQG90z5ruc6ycjBeHyvXV
         U/OrFgxcfh8uRRG80K9FA6D85mkRxq5TEhp7nXlQ8+p2fFmDN9hBcWSdCy+oTXViUJlw
         DGDYE+xgt7YUFIvzAT9T7Up4Qn5amacRqt37xbXk9xhD9rF8rAj/gYAuVC2ygeWZsDSY
         1Rlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+9rLRJtQCqzqOdAmtT/dXgjj2NiWtyjkoCbCxp49/Y=;
        b=a09PPD5tauIEz43IRqVwHo6e4vMX8gWcXTU0VqA2trqYO5Gn69zC9wPXBWvFzhYYFY
         n8gxPeWVnLo86m2UcyQB+2BWy8kQVZCJ0n5DtZge5etJNog+gLOceL0LMTq5uYRrGKFW
         F+S+/h5YNnnpakyWFZVvX0XCI/9OAcFIi2sjG7vOH3DZTHpsdgZKqTotL98GF+ruAaAM
         +zV7Tjv1WYbzzkZAiX0MK5tLWoVDgff87xwGLbiO71tmzN3gCn4c/SiCeTH6KnMdOrU5
         MZ6wFYdSIsGNkscZVunJBSSDvpcJn2n4BSvpkZjwHKO0jvyYXvEJL636N1+gwMDCuOo8
         y62w==
X-Gm-Message-State: ANoB5pknTuKg4UCK6dpvrGpunU5oxWNzb9InXJ5cGd/PPbKfJAFhrgcB
	2BtKiTlXA9QHfAPmRCV8lhpu5w==
X-Google-Smtp-Source: AA0mqf5GuZZM9NhraYfZ71KM0WTe8k5h7bQzp58Ud8bOcWdnvnP2txu5Tzob1dAmeNM5mnPrO6R6yw==
X-Received: by 2002:a17:906:3a10:b0:7a4:22c4:ade7 with SMTP id z16-20020a1709063a1000b007a422c4ade7mr53173539eje.722.1669816517089;
        Wed, 30 Nov 2022 05:55:17 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id j9-20020a17090623e900b007bf24b8f80csm673396ejg.63.2022.11.30.05.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 05:55:16 -0800 (PST)
Date: Wed, 30 Nov 2022 14:55:14 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor.Dooley@microchip.com
Cc: conor@kernel.org, linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, heiko@sntech.de,
	apatel@ventanamicro.com, atishp@rivosinc.com
Subject: Re: [PATCH v3 3/3] RISC-V: Ensure Zicbom has a valid block size
Message-ID: <20221130135514.vbkswte2k25wfd7i@kamzik>
References: <20221129143447.49714-1-ajones@ventanamicro.com>
 <20221129143447.49714-4-ajones@ventanamicro.com>
 <Y4ZhT3R34cE35a0K@spud>
 <3c64b508-a629-0c34-1119-e854b1968a2f@microchip.com>
 <20221130113314.jagmoosmx5ktwt6t@kamzik>
 <20221130122502.52w45qvxu73acfrf@kamzik>
 <fe2ecb8e-ac35-54e5-0169-a26ec281cb95@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fe2ecb8e-ac35-54e5-0169-a26ec281cb95@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_055518_940585_4BD80AE0 
X-CRM114-Status: GOOD (  26.81  )
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

On Wed, Nov 30, 2022 at 12:47:03PM +0000, Conor.Dooley@microchip.com wrote:
> On 30/11/2022 12:25, Andrew Jones wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On Wed, Nov 30, 2022 at 12:33:14PM +0100, Andrew Jones wrote:
> >> On Wed, Nov 30, 2022 at 09:46:20AM +0000, Conor.Dooley@microchip.com wrote:
> >>> On 29/11/2022 19:45, Conor Dooley wrote:
> >>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>>
> >>>> Hey Drew,
> >>>>
> >>>> On Tue, Nov 29, 2022 at 03:34:47PM +0100, Andrew Jones wrote:
> >>>>> When a DT puts zicbom in the isa string, but does not provide a block
> >>>>> size, ALT_CMO_OP() will attempt to do cache operations on address
> >>>>> zero since the start address will be ANDed with zero. We can't simply
> >>>>> BUG() in riscv_init_cbom_blocksize() when we fail to find a block
> >>>>> size because the failure will happen before logging works, leaving
> >>>>> users to scratch their heads as to why the boot hung. Instead, ensure
> >>>>> Zicbom is disabled and output an error which will hopefully alert
> >>>>> people that the DT needs to be fixed. While at it, add a check that
> >>>>> the block size is a power-of-2 too.
> >>>>>
> >>>>> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> >>>>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> >>>>
> >>>> This seems to be failing on nommu :/ I've got host machines issues so I
> >>>> could not reproduce it for you lcoally and paste an actual log, but if
> >>>> you build rv64_nommu_virt_defconfig I think you should be able to
> > 
> > You mean a 64-bit build with 'nommu_virt_defconfig', right? There isn't a
> > 'rv64_nommu_virt_defconfig' that I know of.
> > 
> >>>> reproduce.
> >>>
> >>> The actual error is:
> >>> riscv64-unknown-linux-gnu-ld: arch/riscv/kernel/cpufeature.o: in function `.L0 ':
> >>> cpufeature.c:(.text.unlikely+0x8): undefined reference to `riscv_cbom_block_size'
> >>
> > 
> > I can't reproduce this. The following commands work fine for me
> > 
> >   $ make ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- O=build nommu_virt_defconfig
> >   $ make ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- O=build -j$(nproc)
> > 
> > And llvm also works
> > 
> >   $ make ARCH=riscv LLVM=1 O=build-llvm nommu_virt_defconfig
> >   $ make ARCH=riscv LLVM=1 O=build-llvm -j$(nproc)
> > 
> > Additionally, I can't see how riscv_cbom_block_size wouldn't be defined.
> > It's exported from arch/riscv/mm/cacheflush.c, which is always built,
> > and no ifdefery wraps it.
> 
> The base commit matters here, it picked riscv/for-next as the base for
> this series. I guess this depends on some stuff that's in fixes only?

It looks like riscv/for-next is based on v6.1-rc1, but commit 5c20a3a9df19
("RISC-V: Fix compilation without RISCV_ISA_ZICBOM") was merged for
v6.1-rc2.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
