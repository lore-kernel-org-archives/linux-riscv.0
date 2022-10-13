Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80173C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 13:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hqy6TPnYRaKUwd57jztpf5ohEimvLC8PZZn08MBH99Y=; b=w52TzFAs2236B1
	lMp5g3nPpmGN6JyZEYq78ue6DQA3L8oKbEF7g2ig+TQ6ru9qwv8i22pmh9MuX1s/VzNMd5KBe/blk
	5rIN8PBPVFSLhZIYnx3Gf+lT3G7o7RPkAMhqA+GEyqzE78hsswZ6lRM3ssyKsBawaBQPt8Vi+WYSv
	jq7yr9XxlQPWV5jwzueAEuuF6q8BKkpMob6LkI5CFEtgP5XB0+HBzjI9zhVejvBbkQSNQIWQCS+ts
	y2a1nNgXfVt3hDPexjsVQrLPt0PIbeSYJB3L2HT2K/AW28GUk4IkHr2ELLGxlUNJyjgN0UERx3Mha
	x2qeJOWa7jFPHZEfMscQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiyfc-00C21A-Ta; Thu, 13 Oct 2022 13:54:44 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiyVM-00BxBE-TU
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 13:44:16 +0000
Received: by mail-ej1-x635.google.com with SMTP id q9so4127243ejd.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Oct 2022 06:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RCuxvY/nTYKPdSDNH5ONOl5SQyvcs93R0fp9Rlu5X1Y=;
        b=JqY+/2nhNdI8ZjgHmW1Fbwm/k9pNz12fMdxl++XoxypYfdU2GNg3kzAWeoilNnq371
         3TVRMPGaWbPk8AmrG6q/v+4dk9j3l2Mqj7KD1J6zRJW4PwjS6KGcHoGGjmIPGqZ+nmNB
         KvKMK0NG2OBW15tGPoh1jlDMplMWCNFng/R4tFLfhTYPDOZCNwnc0grRDlOOO+BpXWHy
         A5DWfNRYpt6RZ4Fl4jdMHyyNet7G6JtLpb0mdI4mPWsey1KsQ1HPvphTn/UL+mH6zGQ1
         ycW4hfvsKryoZKHir3hoaknPYBQ1/2y2rsk8uC8OEXRaPoZX95YKLvhG0LHx419giuAX
         bwqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCuxvY/nTYKPdSDNH5ONOl5SQyvcs93R0fp9Rlu5X1Y=;
        b=yfMe9CwO7jtBNued4/jZSEzm7SQl8TWZvtlfVOBL+Fs5z/Kl5FDiTDcNF1JbuIRAfm
         UUvXSJSLMsBVPReNa802mHCUqhrVtC9CJiAVDVYvhPhbbTM1d+K+gTADTiXu6lRSxlOo
         0Cdet8mrJzqlCnWGB7xnLIFl8n1AI5945PknC4hQl6iKS2qBE5I6Puxyzc7Hy1IsgNAL
         kHhEDjbbP2/D+uIPtPPR2Ib3ujIvnKsEWMm7BxTUYbw/tplo/zWKdAZKOVaspRLBGOuT
         9r0zFkRivLdZG1qaXdVgxM6Zm0D1tJ3O5sXLxqOSys/M4IphE+XsRuSXlr/oOQOozZAG
         mZ7A==
X-Gm-Message-State: ACrzQf2EdwI57q8dtq07GVue6hlKJBkANCRlDPPyzCbJ4+tzQSjHrjow
	ivOV6YOSXi2RIXcVWFH1Xc9qSg==
X-Google-Smtp-Source: AMsMyM7CX1jy+ZlF7f/si0cMmV+Iuu75ENBXo+XLsbkN3jRhYqZ3jHzHZydbhZrl3y7yELqzBwHahw==
X-Received: by 2002:a17:907:a044:b0:78d:9180:125c with SMTP id gz4-20020a170907a04400b0078d9180125cmr21703481ejc.247.1665668644920;
        Thu, 13 Oct 2022 06:44:04 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id b18-20020a1709063cb200b0077d6f628e14sm3088933ejh.83.2022.10.13.06.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 06:44:04 -0700 (PDT)
Date: Thu, 13 Oct 2022 15:44:03 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	anup@brainfault.org, atishp@atishpatra.org,
	conor.dooley@microchip.com, vernon2gm@gmail.com, lkp@intel.com
Subject: Re: [PATCH] RISC-V: KVM: Fix compilation without RISCV_ISA_ZICBOM
Message-ID: <20221013134403.m577the472vtbbtv@kamzik>
References: <20221010094029.1579672-1-ajones@ventanamicro.com>
 <mhng-62a2d3c7-f08d-4f40-862c-4d4f09a6150a@palmer-ri-x1c9>
 <20221012170749.k6b374tbhhihk2qm@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221012170749.k6b374tbhhihk2qm@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_064409_027901_D055AF54 
X-CRM114-Status: GOOD (  35.24  )
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

On Wed, Oct 12, 2022 at 07:07:49PM +0200, Andrew Jones wrote:
> On Mon, Oct 10, 2022 at 11:36:24AM -0700, Palmer Dabbelt wrote:
> > On Mon, 10 Oct 2022 02:40:29 PDT (-0700), ajones@ventanamicro.com wrote:
> > > Fix undefined reference of riscv_cbom_block_size when compiling KVM
> > > without RISCV_ISA_ZICBOM. Note, RISCV_ISA_ZICBOM is a sufficient
> > > guard as it selects RISCV_DMA_NONCOHERENT, which is needed to compile
> > > dma-noncoherent.c (which is the file where riscv_cbom_block_size and
> > > its initializer live).
> > >
> > > Fixes: afd5dde9a186 ("RISC-V: KVM: Provide UAPI for Zicbom block size")
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > ---
> > >  arch/riscv/kvm/vcpu.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > > index a032c4f0d600..e4453caba728 100644
> > > --- a/arch/riscv/kvm/vcpu.c
> > > +++ b/arch/riscv/kvm/vcpu.c
> > > @@ -265,11 +265,13 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
> > >  	case KVM_REG_RISCV_CONFIG_REG(isa):
> > >  		reg_val = vcpu->arch.isa[0] & KVM_RISCV_BASE_ISA_MASK;
> > >  		break;
> > > +#ifdef CONFIG_RISCV_ISA_ZICBOM
> > >  	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
> > >  		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOM))
> > >  			return -EINVAL;
> > >  		reg_val = riscv_cbom_block_size;
> > >  		break;
> > > +#endif
> > >  	default:
> > >  		return -EINVAL;
> > >  	}
> > 
> > Thanks, looks like this is tripping up the kernelci builds too: 
> > https://linux.kernelci.org/build/id/6343b37c6fd2dcbb5dcab5f3/logs/ .  
> > This symbol is actually a bit odd, as we don't actually just use it 
> > under Zicbom because of the T-Head stuff.  Looks like that's generically 
> > broken, though, so IMO we need something like this
> > 
> > diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> > index 6cb7d96ad9c7..fba86fa3a628 100644
> > --- a/arch/riscv/mm/cacheflush.c
> > +++ b/arch/riscv/mm/cacheflush.c
> > @@ -5,6 +5,9 @@
> > 
> >  #include <asm/cacheflush.h>
> > 
> > +unsigned int riscv_cbom_block_size;
> > +EXPORT_SYMBOL(riscv_cbom_block_size);
> > +
> >  #ifdef CONFIG_SMP
> > 
> >  #include <asm/sbi.h>
> > diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> > index e3f9bdf47c5f..33d21ace0971 100644
> > --- a/arch/riscv/mm/dma-noncoherent.c
> > +++ b/arch/riscv/mm/dma-noncoherent.c
> > @@ -12,7 +12,6 @@
> >  #include <linux/of_device.h>
> >  #include <asm/cacheflush.h>
> > 
> > -unsigned int riscv_cbom_block_size;
> >  static bool noncoherent_supported;
> > 
> >  void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> > 
> > which should be
> > 
> > Fixes: 8f7e001e0325 ("RISC-V: Clean up the Zicbom block size probing").
> 
> Hi Palmer,
> 
> Should I post your suggestion as a v2 or were you planning to post it?
> I'm happy to do so, but I'd prefer to also move
> riscv_init_cbom_blocksize() and drop its #ifdef CONFIG_RISCV_ISA_ZICBOM
> guard. The reason I'd prefer we always try to parse the block size is
> that we always parse the ISA string, and, when zicbom is present, we set
> it in the ISA extension bitmap, even when CONFIG_RISCV_ISA_ZICBOM isn't
> enabled. This is a reasonable behavior if CONFIG_RISCV_ISA_ZICBOM is meant
> to decide whether or not the kernel uses the feature for itself, as its
> Kconfig text implies, rather than to mean we should pretend the feature
> isn't present, whether it is or not. So, if we're not trying to completely
> avoid the feature by disabling CONFIG_RISCV_ISA_ZICBOM, then KVM can still
> inform the guest about it. When KVM does that it also needs the block
> size.

I went ahead and posted a v2 since it may be easier to communicate the
idea by patch.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
