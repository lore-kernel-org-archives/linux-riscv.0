Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F6CC433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Oct 2022 14:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xuBvFe4RpkEAA2U+aqDHhqhkOuW82C9y7oztEjp93ko=; b=cE018pCW/y6lBF
	bNB566W3te2Idj+bW3whyMu/jQ4oCllBbGsW8CP2rKqiLVUYm655I2QwQYLTjZDec/mmkl7K0uDHX
	CTUFWB8orXFyU4HYVo2vRQ2DBlcHGZgJgDk+q4r4x0Hjj7Rf321f3e8m7yEZjG0xPsI1FIeEJk3Fs
	f3QMObaAAoEDIf+cJHw7d57rd4Fy3mAR81iHItqKgIk0N020YgRVcE8iwsdEIbVwQzKweLgCW72D6
	XgEtF1JpzIIqMiv5FiohpmW4pcuE5MRF5jL8N8N9WsyHsj9XBrCfndgehV9LHwPLSMLkW0yh612Y8
	vYjRZpRI043JUVg+jEXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohAVx-00DNGr-W0; Sat, 08 Oct 2022 14:09:18 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohAVu-00DNEz-QE
	for linux-riscv@lists.infradead.org; Sat, 08 Oct 2022 14:09:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 86E8EB80B03;
	Sat,  8 Oct 2022 14:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD5F1C433D7;
	Sat,  8 Oct 2022 14:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665238152;
	bh=zJVPFG6XZLenlyMofKsPI2XuAeVMXJmB4xAfWWJgPfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GauvcItOhNGZ6o53rM4v/lx4D0kpVgjEPtLtTYNOknFn2Cf895R5wTbtcxev04Biy
	 qheAFTZFSrmWZB2Wg7Rj6nlgtVpS+V2Hry8b69h/SirmV3TwnhssDFsgEQe/rJp6o/
	 +k7Lp21hXWcAYo52xxSYx9RzZhovPIVHVsZPOpIb1aHXfGGG3JQdwT5jhjPiTNtQdS
	 JJEKXBoVc7YOf/EaF3Ug+KyrIjhx8i+U4w7k1ibef8aGcrn2oOQ7I31v7Q9wh5cUJ0
	 kAOPPMpcjnHYDVBODTLW/09NLaKetTCOx3KABB4Knq0MyxX/7buxBr0TceOfPB3n35
	 0KK6v+hp1IU/w==
Date: Sat, 8 Oct 2022 21:59:37 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] riscv: move riscv_noncoherent_supported() out of
 ZICBOM probe
Message-ID: <Y0GCST9IQcKws9Yh@xhacker>
References: <20221006070818.3616-1-jszhang@kernel.org>
 <20221006070818.3616-2-jszhang@kernel.org>
 <Y0F1uH71Ll7YGygB@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y0F1uH71Ll7YGygB@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221008_070915_013266_63D1990D 
X-CRM114-Status: GOOD (  22.91  )
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

On Sat, Oct 08, 2022 at 02:06:00PM +0100, Conor Dooley wrote:
> On Thu, Oct 06, 2022 at 03:08:11PM +0800, Jisheng Zhang wrote:
> > It's a bit wired to call riscv_noncoherent_supported() once when
> > insmod a module. Move the calling out of feature patch func.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  arch/riscv/kernel/cpufeature.c | 7 +------
> >  arch/riscv/kernel/setup.c      | 4 ++++
> >  2 files changed, 5 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 3b5583db9d80..03611b3ef45e 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -272,12 +272,7 @@ static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
> >  	case RISCV_ALTERNATIVES_EARLY_BOOT:
> >  		return false;
> >  	default:
> > -		if (riscv_isa_extension_available(NULL, ZICBOM)) {
> > -			riscv_noncoherent_supported();
> > -			return true;
> > -		} else {
> > -			return false;
> > -		}
> > +		return riscv_isa_extension_available(NULL, ZICBOM);
> >  	}
> >  #endif
> >  
> > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> > index 2dfc463b86bb..1a055c3f5d9d 100644
> > --- a/arch/riscv/kernel/setup.c
> > +++ b/arch/riscv/kernel/setup.c
> > @@ -299,6 +299,10 @@ void __init setup_arch(char **cmdline_p)
> >  	riscv_init_cbom_blocksize();
> >  	riscv_fill_hwcap();
> >  	apply_boot_alternatives();
> > +#ifdef CONFIG_RISCV_DMA_NONCOHERENT
> > +	if (riscv_isa_extension_available(NULL, ZICBOM))
> > +		riscv_noncoherent_supported();
> > +#endif
> 
> I have a personal bias against ifdefs where possible, maybe @Heiko
> remembers why riscv_noncoherent_supported() was not defined as something
> like `void riscv_noncoherent_support(void){}` for when that CONFIG is
> not enabled? If it was this could become a an IS_ENABLED & we wouldn't
> have to be so careful about wrapping it's usage in ifdefs.

Good idea. Will do in newer version.

> 
> Your change in isolation makes sense to me though, so:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Thanks,
> Conor.
> 
> >  }
> >  
> >  static int __init topology_init(void)
> > -- 
> > 2.37.2
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
