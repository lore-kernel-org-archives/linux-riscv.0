Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38075FA3743
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Oct 2022 21:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wn+yJ30zap1PXPpwb9qTojZ1ZDT+IczflryHl9Sm5IM=; b=YM4J+dpvgbapGE
	dy84nGqFf78/7k/iusR4+/t1xYd8bY6sCnAyDbfV2aQFzxi2t+/1YMhSMDoyTSwVKsJPM1Kkmf+w7
	/aP2LiKpeb/nC5B6SKPlvEORUiL8Rb1OW/7+G727ihxb5ajhBPoZHLg/LJYNs3Gc3m5Hwlw1SqcUg
	jUWOuaRvdjIIArZXS1sJy9K5q+OkVYixwtmXNeSG6mENt/iXoLCEL+As1GQhF3N+voL2ZsP7inG1L
	m8IeyQCZtuPbQ+slcdGJ7ozwzbd70rFlp/j2y7X43jHmNiqFRmp3QNgwxS8aWdqW7pByibNleUKrs
	70CLO9k+k0u8KRpiMADw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opFlz-003K5S-TI; Sun, 30 Oct 2022 21:23:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opFlw-003K30-3T; Sun, 30 Oct 2022 21:23:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A07CA60F43;
	Sun, 30 Oct 2022 21:23:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA81CC433C1;
	Sun, 30 Oct 2022 21:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667164991;
	bh=k19dMyC6Vrx4QZA1BbYPq5YfWDcG/GhtG6TcoZ53c8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uIRzH/wYc16QQ2PtA+FRrAQAIYxt8wjuSvQM/2lc2rMYAY6oE81kKQPVOJhIGh9gc
	 a3/I6vSeCIw5mAv/LgfdqqC3Kb0pm7R3A/YDbg5aRbQCQwAry7AJXGmuYaRmJxbSUB
	 0cbKjzfP9NQFOIrufLaDP6W4ZP7lBH6EqqaSFlxWJF/dI3VRB0BTEQy0mTJ87QSyWQ
	 TvDSl/FTUOC9B80Zi5OgFRVOnrIDlqQAM2dzYEDUcbOZh+b5+kbxGg1/3FG2EJ7TJw
	 N5+IaezUL95QztPkUNBWp7Rpj0sFmc/sAydjM1226fwkde6c/cT10ABQpTgHTYxzyy
	 GOoWkYpvfmtjA==
Date: Sun, 30 Oct 2022 21:23:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH 5/9] RISC-V: KVM: Provide UAPI for Zicboz block size
Message-ID: <Y17rOVVrkCFqVV2Q@spud>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
 <20221027130247.31634-6-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221027130247.31634-6-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_142312_197709_0328690D 
X-CRM114-Status: GOOD (  21.58  )
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

On Thu, Oct 27, 2022 at 03:02:43PM +0200, Andrew Jones wrote:
> We're about to allow guests to use the Zicboz extension. KVM
> userspace needs to know the cache block size in order to
> properly advertise it to the guest. Provide a virtual config
> register for userspace to get it with the GET_ONE_REG API, but
> setting it cannot be supported, so disallow SET_ONE_REG.

This all looks pretty formulaic..
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu.c             | 7 +++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 8985ff234c01..4bbf55cb2b70 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -49,6 +49,7 @@ struct kvm_sregs {
>  struct kvm_riscv_config {
>  	unsigned long isa;
>  	unsigned long zicbom_block_size;
> +	unsigned long zicboz_block_size;
>  };
>  
>  /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 71ebbc4821f0..18a739070b51 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -270,6 +270,11 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
>  			return -EINVAL;
>  		reg_val = riscv_cbom_block_size;
>  		break;
> +	case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
> +		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOZ))
> +			return -EINVAL;
> +		reg_val = riscv_cboz_block_size;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -329,6 +334,8 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
>  		break;
>  	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
>  		return -EOPNOTSUPP;
> +	case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
> +		return -EOPNOTSUPP;
>  	default:
>  		return -EINVAL;
>  	}
> -- 
> 2.37.3
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
