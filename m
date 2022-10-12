Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFC5C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Oct 2022 17:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aV2t/9KVq3kWk/rBrE5WK1DnlHFnP7lisz7gFb4tou0=; b=PeLu7R7Ryyq3ul
	T+8T0GX/kpJiIUvUhRKvZPwchRSVi4ruyimqydkepNj2PkemNuTXObdxnNlGcvQORgjH/bLkQh6BR
	UrzHQfM0n5YSHufgB+eArT5FNb6ogjf7/O8WrWNzo7D9vnhMuUBsVnZHIqpvlVPiHynCYvb0O4E45
	oxAGujo/+iEYN6utHT3US7hFyn6AcefgQnbcJJiaa9zozHV4/BZc74nbd8BKWsiHMXQtunGtWM8Ks
	B2uXBjwPXYB69gHy+ICcwPIudh8zYXdz+989byTBq7Hw3AJg7OqQ7mU3LezOaoW6BEFiFIeLjcJ7u
	rINtcEy/o2AKVV+XsAFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oifD4-008nqP-Qv; Wed, 12 Oct 2022 17:07:58 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oifD2-008npA-EC
	for linux-riscv@lists.infradead.org; Wed, 12 Oct 2022 17:07:58 +0000
Received: by mail-ej1-x62d.google.com with SMTP id r17so39334175eja.7
        for <linux-riscv@lists.infradead.org>; Wed, 12 Oct 2022 10:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YbFjJ9nFJglIK6LNpG7JnDrdU6JlaOrmCYFzvXNL820=;
        b=YfOQhjxQbHoW8HhBpwZjymW2agoUmUtLHnf4SgJPg/dFIydf3/EKnG49wuLv4BmF+5
         SxgXEElZWyc4tkd+Oq98I4NLa04JJoY0SIi3gaINNmqMW3JylfqTNBy4efb2oMm9/xiP
         2uGrm6QYVH37ZyOyzHHSxkYa0xVotUOA2zY5UccUspS7wc3ctiptjv/fMagpbrBAAaXz
         shSEYGXXbUH8ND70JeN3xZ9eBG9Z3PMyhck6AVU1QDgGsGSPztfh2bvdoYDn+rLcz11k
         rI8N3b7iM3qTg+mMoqbJeWCb0DtLarki6dFR2lqHzBZ9iQOErAiToooipaggRln6el7W
         oc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YbFjJ9nFJglIK6LNpG7JnDrdU6JlaOrmCYFzvXNL820=;
        b=0i54pLJXCEHL8pd7IWZvA/7x12LsIJKI454hKsvV/F43bY7SNglRgoeb5Wc0FQxLJn
         SlzIiRshoNvfFAS1I95V1pbJ7wn/9wim6P5+T374o/5dyV4rd3mQRcrg4JxNe1Z0ysxD
         0Ancs1kztkIcS3eJ3zOwhtmyNChf118w0dYi6Y0nfYk+Q30V24XdZxrkW4wQKDA6gvAc
         MjIp89WL6x74KC13tMh0Y2A2rcPt5j/zWkKB0nBhKIzDtCqDqEfGXAkiF2GWxJ1iGChX
         kojJsrsHPBMFoeaaf2QWrYPtwKJqlLBYame5TLPsGmue1Bf+OVqBnGi0CIqB+pHLHucr
         0rNQ==
X-Gm-Message-State: ACrzQf2DEvh0b1kJI+iejxwi3WYXRdMuECQ6TAqDnChB/Nk9WFsz3A9C
	xhFZ0uLO882RJTq4C28+DwDeAg==
X-Google-Smtp-Source: AMsMyM5TusdQDnPs8GcQ5JFI5CxLoxyn48H4yunaGiiFfZFhWZQLGGmGRQlOGcTakerhzW8nDggLmA==
X-Received: by 2002:a17:907:72d3:b0:78d:2153:648a with SMTP id du19-20020a17090772d300b0078d2153648amr23720998ejc.513.1665594471173;
        Wed, 12 Oct 2022 10:07:51 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id s12-20020a170906354c00b007806c1474e1sm1524606eja.127.2022.10.12.10.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 10:07:50 -0700 (PDT)
Date: Wed, 12 Oct 2022 19:07:49 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	anup@brainfault.org, atishp@atishpatra.org,
	conor.dooley@microchip.com, vernon2gm@gmail.com, lkp@intel.com
Subject: Re: [PATCH] RISC-V: KVM: Fix compilation without RISCV_ISA_ZICBOM
Message-ID: <20221012170749.k6b374tbhhihk2qm@kamzik>
References: <20221010094029.1579672-1-ajones@ventanamicro.com>
 <mhng-62a2d3c7-f08d-4f40-862c-4d4f09a6150a@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-62a2d3c7-f08d-4f40-862c-4d4f09a6150a@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_100756_510517_BD59F718 
X-CRM114-Status: GOOD (  28.65  )
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

On Mon, Oct 10, 2022 at 11:36:24AM -0700, Palmer Dabbelt wrote:
> On Mon, 10 Oct 2022 02:40:29 PDT (-0700), ajones@ventanamicro.com wrote:
> > Fix undefined reference of riscv_cbom_block_size when compiling KVM
> > without RISCV_ISA_ZICBOM. Note, RISCV_ISA_ZICBOM is a sufficient
> > guard as it selects RISCV_DMA_NONCOHERENT, which is needed to compile
> > dma-noncoherent.c (which is the file where riscv_cbom_block_size and
> > its initializer live).
> >
> > Fixes: afd5dde9a186 ("RISC-V: KVM: Provide UAPI for Zicbom block size")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/kvm/vcpu.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > index a032c4f0d600..e4453caba728 100644
> > --- a/arch/riscv/kvm/vcpu.c
> > +++ b/arch/riscv/kvm/vcpu.c
> > @@ -265,11 +265,13 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
> >  	case KVM_REG_RISCV_CONFIG_REG(isa):
> >  		reg_val = vcpu->arch.isa[0] & KVM_RISCV_BASE_ISA_MASK;
> >  		break;
> > +#ifdef CONFIG_RISCV_ISA_ZICBOM
> >  	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
> >  		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOM))
> >  			return -EINVAL;
> >  		reg_val = riscv_cbom_block_size;
> >  		break;
> > +#endif
> >  	default:
> >  		return -EINVAL;
> >  	}
> 
> Thanks, looks like this is tripping up the kernelci builds too: 
> https://linux.kernelci.org/build/id/6343b37c6fd2dcbb5dcab5f3/logs/ .  
> This symbol is actually a bit odd, as we don't actually just use it 
> under Zicbom because of the T-Head stuff.  Looks like that's generically 
> broken, though, so IMO we need something like this
> 
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index 6cb7d96ad9c7..fba86fa3a628 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -5,6 +5,9 @@
> 
>  #include <asm/cacheflush.h>
> 
> +unsigned int riscv_cbom_block_size;
> +EXPORT_SYMBOL(riscv_cbom_block_size);
> +
>  #ifdef CONFIG_SMP
> 
>  #include <asm/sbi.h>
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> index e3f9bdf47c5f..33d21ace0971 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -12,7 +12,6 @@
>  #include <linux/of_device.h>
>  #include <asm/cacheflush.h>
> 
> -unsigned int riscv_cbom_block_size;
>  static bool noncoherent_supported;
> 
>  void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> 
> which should be
> 
> Fixes: 8f7e001e0325 ("RISC-V: Clean up the Zicbom block size probing").

Hi Palmer,

Should I post your suggestion as a v2 or were you planning to post it?
I'm happy to do so, but I'd prefer to also move
riscv_init_cbom_blocksize() and drop its #ifdef CONFIG_RISCV_ISA_ZICBOM
guard. The reason I'd prefer we always try to parse the block size is
that we always parse the ISA string, and, when zicbom is present, we set
it in the ISA extension bitmap, even when CONFIG_RISCV_ISA_ZICBOM isn't
enabled. This is a reasonable behavior if CONFIG_RISCV_ISA_ZICBOM is meant
to decide whether or not the kernel uses the feature for itself, as its
Kconfig text implies, rather than to mean we should pretend the feature
isn't present, whether it is or not. So, if we're not trying to completely
avoid the feature by disabling CONFIG_RISCV_ISA_ZICBOM, then KVM can still
inform the guest about it. When KVM does that it also needs the block
size.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
