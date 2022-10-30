Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD162ECAAA1
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Oct 2022 21:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XEs+44PxNe4phUT9IyF+N1gUWWoXRh8mkRqmtUn/tXA=; b=uX4DmydiDRPbZ7
	lEptD+ovN9gPR1UV7vu+WqsOaXTJCAWrg8/66ZPJ7lJ7gQF30KHMrRMeBbU7E0GeRKrGu9Uo6beRB
	EC2y3ctKdSOrydQnoo80liEWJV6hCgUnpaK36Rq/gb6dDobN1Hm1nmqkakDEHDZFIawUAXYq1zWE9
	Wv0tKcRbmwPDCe+tXSzq65F64Ko0JXg98F6y71WRAAHC2WldFkfoaKSJKdJtZz13BXYOSvaFxHTHE
	py443vHLSFpgPZzq/bYGgitroTV1T6cqj2In1gHZ1KIEcLhMJXbB2WA+zht8+nEyNbj+eYVn6r3nC
	cZlZcunkYBh9umQE/veg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opFmn-003KXK-VR; Sun, 30 Oct 2022 21:24:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opFmk-003KT8-M2; Sun, 30 Oct 2022 21:24:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1A8AA60F43;
	Sun, 30 Oct 2022 21:23:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45637C433C1;
	Sun, 30 Oct 2022 21:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667165038;
	bh=MZXYnbDxYLpuLQnXFUBZl4NRjEWgToHPL0CaW13Bngw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mNXckRaoPxITW4RSNEO6PP67/6RyWXQ3RH2Da8Ab5ncq21OJWHuenEw/iwbRwctPd
	 tCHKD35AsKpXGFRpc1OFpXYo77Et+1kjxwRBA94YXx9Nd0mHrrgfp4fBSFbcaORW9M
	 db4WGNpbwLqnx5FSDqz2mPGCfWFp2dRI2viDJU6K+RC64j5bAZsv69UG82j3rY6FjL
	 kBxlP93svuKpnBjKIRY0rLq82hZjml+/vat6iM/Thrx9nrIYYgPGxxIu2qCMzMSIEd
	 ouBCAGwnuUBp8Ser+Pbv7D6pOkUnlahQfTPYvLaX/vIdoOjGRTTLqT8XWV2ZMJ5X6K
	 2hX1jxuG+q5BA==
Date: Sun, 30 Oct 2022 21:23:53 +0000
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
Subject: Re: [PATCH 6/9] RISC-V: KVM: Expose Zicboz to the guest
Message-ID: <Y17raZlWvu1GBmBX@spud>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
 <20221027130247.31634-7-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221027130247.31634-7-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_142402_779758_AC820982 
X-CRM114-Status: GOOD (  19.47  )
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

On Thu, Oct 27, 2022 at 03:02:44PM +0200, Andrew Jones wrote:
> Guests may use the cbo.zero instruction when the CPU has the Zicboz
> extension and the hypervisor sets henvcfg.CBZE.
> 
> Add Zicboz support for KVM guests which may be enabled and
> disabled from KVM userspace using the ISA extension ONE_REG API.

Ditto re: formulaic.. Doubt it's needed here, but:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu.c             | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 4bbf55cb2b70..8dc21ceee7aa 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -103,6 +103,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_SVINVAL,
>  	KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
>  	KVM_RISCV_ISA_EXT_ZICBOM,
> +	KVM_RISCV_ISA_EXT_ZICBOZ,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 18a739070b51..7758faec590a 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -62,6 +62,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	KVM_ISA_EXT_ARR(SVPBMT),
>  	KVM_ISA_EXT_ARR(ZIHINTPAUSE),
>  	KVM_ISA_EXT_ARR(ZICBOM),
> +	KVM_ISA_EXT_ARR(ZICBOZ),
>  };
>  
>  static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
> @@ -821,6 +822,9 @@ static void kvm_riscv_vcpu_update_config(const unsigned long *isa)
>  	if (riscv_isa_extension_available(isa, ZICBOM))
>  		henvcfg |= (ENVCFG_CBIE | ENVCFG_CBCFE);
>  
> +	if (riscv_isa_extension_available(isa, ZICBOZ))
> +		henvcfg |= ENVCFG_CBZE;
> +
>  	csr_write(CSR_HENVCFG, henvcfg);
>  #ifdef CONFIG_32BIT
>  	csr_write(CSR_HENVCFGH, henvcfg >> 32);
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
