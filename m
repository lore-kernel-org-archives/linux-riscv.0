Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 101BEC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Oct 2022 18:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z5lWYxJ6vRTVWyLTz+nrjPA4MLyz/rwbPGHFjnh+5GU=; b=kesi1AxinwroaQ
	UuvoOWBGVcSQwPHt2X3/G7P6M0SmZsHod+JSmZBuKdQ5GT9Qy27fNytwgjFLeNMcUn+JCXlUn/2Sv
	bqShjhxLOgBEQufARAoBeXI53lB/6EOetjRYILDWHosPREO41rLvk5qM9PEcqn736yx5QpDLUpv9M
	U0rH53YAvy/6sUN2W9EO4RO/zBLnm6hz0CEeMatmklnV3xbCvTUBA0QRh6l4/Nc/8j010q5sPy/zN
	G6dTkHcAqjioLFvMeexo4UVp9tVz4CSULlbCMph8C+zbsSpjQxetsi+go0qXZNdyA4SwX6xl/Y+8J
	/iwYUPpj5GbthPY3jqpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohxoI-001qUm-0V; Mon, 10 Oct 2022 18:47:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohxoE-001qTq-Hi; Mon, 10 Oct 2022 18:47:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 326DC60DF3;
	Mon, 10 Oct 2022 18:47:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24E71C433D7;
	Mon, 10 Oct 2022 18:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665427645;
	bh=NMDHpqga1Xy6VoK0bMqQwECvpJ1smU1m9s1/cEQycEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r6dUFoANOJvUE1VIYvbYymP9AQxcTe6QqU4Aqmj/v78OrwU0QUUWQ6PTI6v5UHu+p
	 u+bS/hbELzQ8t2PUEZ26iZNddUhuH5s9QSMwlFp6MbtYeVeyuGkKciTXquVOaO1gBG
	 WD7xsaHLqomOrwy9ntw1YarC/50pgbgJP6Uo2l8UroRxpIAcY/Ewf+9XS5+2YSoUae
	 TrXm8x0/+Z34tkrMLeyoW9wOA3OBiHEAEI/pjzXzgXfF/VXNY8/8Ogn6ntb3rNGBg4
	 tYkE/Sk9x/EBo2j7S/kCRyevJF8Ll4pBI+501xsyzPm44B3H/XNyx+J2gDv4KfqsCG
	 PI7AEfQRqK5bA==
Date: Mon, 10 Oct 2022 19:47:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: ajones@ventanamicro.com, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, anup@brainfault.org,
	atishp@atishpatra.org, conor.dooley@microchip.com,
	vernon2gm@gmail.com, lkp@intel.com
Subject: Re: [PATCH] RISC-V: KVM: Fix compilation without RISCV_ISA_ZICBOM
Message-ID: <Y0RouN2ZciAil0YO@spud>
References: <20221010094029.1579672-1-ajones@ventanamicro.com>
 <mhng-62a2d3c7-f08d-4f40-862c-4d4f09a6150a@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-62a2d3c7-f08d-4f40-862c-4d4f09a6150a@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_114726_705776_7DBD7262 
X-CRM114-Status: GOOD (  23.87  )
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
> 
> We might also want the ifdef for KVM, as that would allow us to build KVM that
> doesn't support these VCPU configurations, but that's sort of a different
> question.

I assume (or hope?) this approach has the advantage of also fixing:
https://lore.kernel.org/all/202210102012.iShn6U6Q-lkp@intel.com/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
