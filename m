Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E19C7EE23
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 20:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=vFM2ANVA5l71rgxJ4uDhQ5WmcB7S0MSzoxA/i/Q5I+U=; b=nRztqhIqRrBGYbpSjtFRyDId8i
	TGR+5hraxHqnmeRa0E3WKNXQSaq7mZlYwX5vhQNOO5NQJ1cL8cqONzrOSYNIw55cgd4POJE0Y3eC6
	R7eeNxyh7GElw+CNnx58wE7eUKdjOjPY3/b5sROD06LHQ5IK8VUvPxX3smheawzjnfahTr/rVGnbD
	uPouWruv2FNB+P4Vb1x6Uu1Q3lBVhixZqody1iohHzIGMMno/KIUskDK/oRA0y86CyDZDr16pNTEv
	aY1m0MOdUTXQBNJFTWwWNg70tqMbVZs5Vz0NNppQmhE2xRzH6BONxOInKaK8YuLiTJ4olKlIX7uhP
	K+1xehXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psqr2-00D5V2-2C;
	Sat, 29 Apr 2023 20:07:36 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psqqw-00D5SY-1e
	for linux-riscv@lists.infradead.org;
	Sat, 29 Apr 2023 20:07:32 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-63b620188aeso1475958b3a.0
        for <linux-riscv@lists.infradead.org>; Sat, 29 Apr 2023 13:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682798847; x=1685390847;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gK6tDOdJW77UWu8ehgn7i7aWpumq/WKr2MIt910Bd7s=;
        b=WUBihcm+a1wpS7sQ0pUFu/12EftxNcYgnMPnivlxueG/BXZLvLXm1D0m9x4TpwKfYM
         WhjlyrxIzgdGQrOSerXLVb+DmP7Im/xmFKyyqN6874MSA0SBwFBwfF7EUBn3uELfAjbH
         QwwAIq6evQjfUTzKJdF+k927U8Z04HG1gaodLLi10V7IR0kBJ3Tj3n+K/4hqysqMX8Qf
         7FXWKtVSdNGRAyd3va/O/CHUiDQ1qbTsw30YAMjfrS6Ov1GmYbupDIMvEVN2Mm1JwCc9
         4t1ZDnDjJVF4MUyJ/DIXUhzqvCfUnLmtrZT35u0xP0Xt0ZXfQh+wC5KSuvdDBa5lD0P4
         /4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682798847; x=1685390847;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gK6tDOdJW77UWu8ehgn7i7aWpumq/WKr2MIt910Bd7s=;
        b=OB2PnGi0dlpAbMKGtLa7Le7yRkc1rheCh9V/7kv1hoxyC77ZlNX9Ldvk9F88ZpScLd
         zzGDGu/zEoHVB1Y8Iszx3XbovtkMZM8t6bIupQLPqMJppYPYJYcEMwJYJgQp9VJKwi5N
         eqWe9qo1IG37J7XLC34r+B5j1FC3S4tFJAuFYxrQv09TwtlSsHBpejrL86AvBIGz30wj
         tEd3rzsJGtog/VX5KpTcvOADhHqQD7GYpZWrowNHqwEQQXh0EmYOdKHiFrJkTq5BnUSt
         Si9l30Vgwvj9mKOBsMlSlH0/sWLaoW8Ur+E1jD8embt1nkVpa4N3QTn3IUGoV7q+n1M9
         X6bg==
X-Gm-Message-State: AC+VfDx3Wwo8TMwjNIzacinG27JhGVj7ZtupvrygRfqQC7+fjYQ3xTLx
	ZuLcpjv5ZB8mT+HnzrFX78V0eg==
X-Google-Smtp-Source: ACHHUZ7o+RBEAbiPHAxuoL8dXfckLdszx41+o6T6toUCBCwkx5RKwC0roj436Q6sHQusz673YDwRsg==
X-Received: by 2002:a17:902:cece:b0:1aa:e451:e22 with SMTP id d14-20020a170902cece00b001aae4510e22mr1548160plg.40.1682798846720;
        Sat, 29 Apr 2023 13:07:26 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id h11-20020a170902748b00b001a641e4738asm15212684pll.1.2023.04.29.13.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 13:07:26 -0700 (PDT)
Date: Sat, 29 Apr 2023 13:07:26 -0700 (PDT)
X-Google-Original-Date: Sat, 29 Apr 2023 13:06:11 PDT (-0700)
Subject: Re: [PATCH 2/3] RISC-V: Track ISA extensions per hart
In-Reply-To: <20230428190609.3239486-3-evan@rivosinc.com>
CC: Evan Green <evan@rivosinc.com>, aou@eecs.berkeley.edu, ajones@ventanamicro.com,
  Conor Dooley <conor.dooley@microchip.com>, heiko.stuebner@vrull.eu, jszhang@kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Evan Green <evan@rivosinc.com>
Message-ID: <mhng-a49186a7-69f7-4f8a-ba14-62277c0f7f59@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_130730_546842_DFCC5F22 
X-CRM114-Status: GOOD (  21.61  )
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

On Fri, 28 Apr 2023 12:06:07 PDT (-0700), Evan Green wrote:
> The kernel maintains a mask of ISA extensions ANDed together across all
> harts. Let's also keep a bitmap of ISA extensions for each CPU. Although
> the kernel is currently unlikely to enable a feature that exists only on
> some CPUs, we want the ability to report asymmetric CPU extensions
> accurately to usermode.
>
> Note that riscv_fill_hwcaps() runs before the per_cpu_offsets are built,
> which is why I've used a [NR_CPUS] array rather than per_cpu() data.
>
> Signed-off-by: Evan Green <evan@rivosinc.com>
> ---
>
>  arch/riscv/include/asm/cpufeature.h | 10 ++++++++++
>  arch/riscv/kernel/cpufeature.c      | 18 ++++++++++++------
>  2 files changed, 22 insertions(+), 6 deletions(-)
>
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> index 808d5403f2ac..23fed53b8815 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -6,6 +6,9 @@
>  #ifndef _ASM_CPUFEATURE_H
>  #define _ASM_CPUFEATURE_H
>
> +#include <linux/bitmap.h>
> +#include <asm/hwcap.h>
> +
>  /*
>   * These are probed via a device_initcall(), via either the SBI or directly
>   * from the corresponding CSRs.
> @@ -16,8 +19,15 @@ struct riscv_cpuinfo {
>  	unsigned long mimpid;
>  };
>
> +struct riscv_isainfo {
> +	DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
> +};
> +
>  DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
>
>  DECLARE_PER_CPU(long, misaligned_access_speed);
>
> +/* Per-cpu ISA extensions. */
> +extern struct riscv_isainfo hart_isa[NR_CPUS];
> +
>  #endif
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 1a80474e308e..0e9d66580478 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -14,6 +14,7 @@
>  #include <linux/of.h>
>  #include <asm/alternative.h>
>  #include <asm/cacheflush.h>
> +#include <asm/cpufeature.h>
>  #include <asm/hwcap.h>
>  #include <asm/patch.h>
>  #include <asm/processor.h>
> @@ -25,6 +26,9 @@ unsigned long elf_hwcap __read_mostly;
>  /* Host ISA bitmap */
>  static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
>
> +/* Per-cpu ISA extensions. */
> +struct riscv_isainfo hart_isa[NR_CPUS];
> +
>  /* Performance information */
>  DEFINE_PER_CPU(long, misaligned_access_speed);
>
> @@ -112,14 +116,17 @@ void __init riscv_fill_hwcap(void)
>  	bitmap_zero(riscv_isa, RISCV_ISA_EXT_MAX);
>
>  	for_each_of_cpu_node(node) {
> +		struct riscv_isainfo *isainfo;
>  		unsigned long this_hwcap = 0;
> -		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
>  		const char *temp;
> +		unsigned int cpu_id;
>
>  		rc = riscv_of_processor_hartid(node, &hartid);
>  		if (rc < 0)
>  			continue;
>
> +		cpu_id = riscv_hartid_to_cpuid(hartid);
> +		isainfo = &hart_isa[cpu_id];
>  		if (of_property_read_string(node, "riscv,isa", &isa)) {
>  			pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
>  			continue;
> @@ -136,7 +143,6 @@ void __init riscv_fill_hwcap(void)
>  		/* The riscv,isa DT property must start with rv64 or rv32 */
>  		if (temp == isa)
>  			continue;
> -		bitmap_zero(this_isa, RISCV_ISA_EXT_MAX);
>  		for (; *isa; ++isa) {
>  			const char *ext = isa++;
>  			const char *ext_end = isa;
> @@ -214,7 +220,7 @@ void __init riscv_fill_hwcap(void)
>  				if ((ext_end - ext == sizeof(name) - 1) &&	\
>  				     !memcmp(ext, name, sizeof(name) - 1) &&	\
>  				     riscv_isa_extension_check(bit))		\
> -					set_bit(bit, this_isa);			\
> +					set_bit(bit, isainfo->isa);		\
>  			} while (false)						\
>
>  			if (unlikely(ext_err))
> @@ -224,7 +230,7 @@ void __init riscv_fill_hwcap(void)
>
>  				if (riscv_isa_extension_check(nr)) {
>  					this_hwcap |= isa2hwcap[nr];
> -					set_bit(nr, this_isa);
> +					set_bit(nr, isainfo->isa);
>  				}
>  			} else {
>  				/* sorted alphabetically */
> @@ -253,9 +259,9 @@ void __init riscv_fill_hwcap(void)
>  			elf_hwcap = this_hwcap;
>
>  		if (bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX))
> -			bitmap_copy(riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
> +			bitmap_copy(riscv_isa, isainfo->isa, RISCV_ISA_EXT_MAX);
>  		else
> -			bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
> +			bitmap_and(riscv_isa, riscv_isa, isainfo->isa, RISCV_ISA_EXT_MAX);
>  	}
>
>  	/* We don't support systems with F but without D, so mask those out

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
