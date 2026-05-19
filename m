Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2D0CD4851
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 12:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BppBk55z4NuOkmp+Dn3eTUGdQ7WDYnTblmwN7UVUIDQ=; b=B+g535CfNRBlHw
	YdqfQ/zwmdWZ0dB/ZIYv5k6BKuy1Ha+zlkuMd97r5gGJaUaYxrUKnjerEzKJYw0mnVbi+onnZ5kFO
	0zm24p5wqLhGzppgBBtigqM1XbRXTXTGTC5/I2XedpbaJaZocbMI+/4EDIzQ0xfmu2fy8jb3sW9Xz
	oLaiL2jOGCgSZvza1zuTmePJc89RVzmuMw3jIWxgyw12hE5hio916uZCVxz7APipxH3bhqfWQpC1B
	HJGNe8Z7LuPYw/SLVTe1NxRs9MIm8ZGflK3lZ1vXhDSu0u2yhb3OWuGENVYdrctNc8ZqN6wITF4E5
	ggsqmgjBIYUpWFuDWfUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJCW-00000001PbZ-0pkl;
	Tue, 19 May 2026 12:05:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJCU-00000001PbM-377X
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 12:05:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AE19960207;
	Tue, 19 May 2026 12:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC23C2BCB3;
	Tue, 19 May 2026 12:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779192329;
	bh=THGyUvx4DC+KGoqXpVJngXBgtVzEKA1S3sgU9A6u/1w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IRoFchW3iBFqBKUSJ3Ia7349aT5CqS9B3euwBTMvelbbL/PcexWBR1qouA2nEPuSP
	 Igz/FKuBs/1wKVmkZlYBl5XwhPU4C49j24hJ7UyB5haWJFUFbtBGZy4n+eEo9aQAEl
	 2GNk188Y+dVhTohq82C4DMGw4EXr2EjypVFL8xVl9VNG34mLBg+VmybelafJwt1v8r
	 pjx43SO5wsNzaraQAih7Q086uRK9Wh8UrQYAooca6IkW4rYgJwgQ7EviZd4tomRIeY
	 NXgEJlqjLmtTDjmgsPTv7nKxjFgFDZZS6iNYbkSpSSuThYJbVuMagdOwvWU0/ndHeW
	 BYFS520uC5qAA==
Message-ID: <78e7f039-74a4-4499-a896-a20912ebc6fb@kernel.org>
Date: Tue, 19 May 2026 22:05:21 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: track effective hardware PTE A/D updates
To: Yunhui Cui <cuiyunhui@bytedance.com>, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, akpm@linux-foundation.org,
 pasha.tatashin@soleen.com, andrew+kernel@donnellan.id.au,
 rmclure@linux.ibm.com, debug@rivosinc.com, baolin.wang@linux.alibaba.com,
 zhangchunyan@iscas.ac.cn, apopple@nvidia.com, namcao@linutronix.de,
 wangruikang@iscas.ac.cn, apatel@ventanamicro.com, liu.xuemei1@zte.com.cn,
 ajones@ventanamicro.com, cleger@rivosinc.com, charlie@rivosinc.com,
 hui.wang@canonical.com, guodong@riscstar.com,
 pincheng.plct@isrc.iscas.ac.cn, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Qingwei Hu <qingwei.hu@bytedance.com>
References: <20260519031927.70683-1-cuiyunhui@bytedance.com>
Content-Language: en-US
From: Michael Ellerman <mpe@kernel.org>
In-Reply-To: <20260519031927.70683-1-cuiyunhui@bytedance.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 19/5/2026 13:19, Yunhui Cui wrote:
> Separate Svadu capability discovery from the host's effective ADUE
> state. Enable SBI FWFT PTE A/D hardware updating on each online CPU
> through CPUHP when both Svade and Svadu are present, use the resulting
> runtime state for arch_has_hw_pte_young(), and fall back to
> software-managed A/D updates when enabling the feature fails.
> 
> Platforms with Svadu but without Svade are treated as always using
> hardware PTE A/D updates. Expose the runtime state through an inline
> getter so hot MM paths avoid an out-of-line function call.

I'm not sure what you mean here. The current code doesn't use an 
out-of-line function call AFAICS? More comments below ...

> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> Reviewed-by: Qingwei Hu <qingwei.hu@bytedance.com>
> ---
>   arch/riscv/include/asm/cpufeature.h |  6 +++
>   arch/riscv/include/asm/pgtable.h    |  8 ++--
>   arch/riscv/kernel/cpufeature.c      | 73 ++++++++++++++++++++++++++---
>   3 files changed, 77 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> index 739fcc84bf7b2..877d71a1ea755 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -128,6 +128,12 @@ struct riscv_isa_ext_data {
>   extern const struct riscv_isa_ext_data riscv_isa_ext[];
>   extern const size_t riscv_isa_ext_count;
>   extern bool riscv_isa_fallback;
> +extern bool riscv_hw_pte_ad_updating_enabled;
> +
> +static __always_inline bool riscv_has_hw_pte_ad_updating(void)
> +{
> +	return READ_ONCE(riscv_hw_pte_ad_updating_enabled);
> +}
>   
>   unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
>   static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsigned long ext)
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index a1a7c6520a095..20663a466cf6c 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -732,14 +732,14 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
>   #define pgprot_dmacoherent pgprot_writecombine
>   
>   /*
> - * Both Svade and Svadu control the hardware behavior when the PTE A/D bits need to be set. By
> - * default the M-mode firmware enables the hardware updating scheme when only Svadu is present in
> - * DT.
> + * Both Svade and Svadu control the hardware behavior when the PTE A/D bits
> + * need to be set. The core MM code only cares whether hardware updating of
> + * the accessed/dirty state is currently active.
>    */
>   #define arch_has_hw_pte_young arch_has_hw_pte_young
>   static inline bool arch_has_hw_pte_young(void)
>   {
> -	return riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU);
> +	return riscv_has_hw_pte_ad_updating();
>   }

riscv_has_extension_unlikely() uses an asm alternative, ie. it's patched 
at boot so there's no runtime cost. But now you've changed it to just 
test a bool.

I'm not sure arch_has_hw_pte_young() is a particularly hot path, but 
seems like you could use a static key, so that the code is patched to 
avoid the runtime test?

> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index f46aa5602d74d..e46b2d2b49eed 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -35,6 +35,8 @@
>   static bool any_cpu_has_zicboz;
>   static bool any_cpu_has_zicbop;
>   static bool any_cpu_has_zicbom;
> +bool riscv_hw_pte_ad_updating_enabled __read_mostly;
> +EXPORT_SYMBOL_GPL(riscv_hw_pte_ad_updating_enabled);
>   
>   unsigned long elf_hwcap __read_mostly;
>   
> @@ -287,15 +289,74 @@ static int riscv_ext_zvfbfwma_validate(const struct riscv_isa_ext_data *data,
...
>   
> +static int __init riscv_hw_pte_ad_updating_init(void)
> +{
> +	bool has_svade, has_svadu;
> +	int state;
> +
> +	has_svade = riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADE);
> +	has_svadu = riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU);
> +
> +	if (!has_svadu)
> +		return 0;
> +
> +	if (!has_svade) {
> +		riscv_set_hw_pte_ad_updating(true);
> +		pr_info("riscv: hardware PTE A/D updating enabled\n");
> +		return 0;

This block is identical to the tail of the function. I'd probably use 
"goto enable", with an "enable" label below.

> +	}
> +
> +	state = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> +				  "riscv/pte-ad:starting",
> +				  riscv_hw_pte_ad_updating_starting,
> +				  riscv_hw_pte_ad_updating_dying);
> +	if (state < 0) {
> +		pr_info("riscv: leave PTE A/D updates software-managed (%d)\n",
> +			state);
> +		return 0;
> +	}
> +
> +	/*
> +	 * A successful CPUHP_AP_ONLINE_DYN registration means the startup
> +	 * callback has already succeeded on all online CPUs.
> +	 */

enable:
> +	riscv_set_hw_pte_ad_updating(true);
> +	pr_info("riscv: hardware PTE A/D updating enabled\n");

pr_info() might be a bit verbose for this. I think printk(KERN_DEBUG ..) 
would be better, that way the message is always available in dmesg but 
isn't sent to the console

>   	return 0;
>   }
> +arch_initcall(riscv_hw_pte_ad_updating_init);

cheers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
