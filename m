Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38252C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 21:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z2jzx7PYrtorFwZ5pSpdZpKg0yQ4+CAlqd7IrpiSGYM=; b=jgu23ulpO6WoIM
	tvw9l3pcDcllhzoFll0dN7OuQXQZqhiybrsybTGDUvSiNvUI9pGO1eTx1pbuAYk84egZZi3FIf5Eg
	zlsuriNqIx1gZ3JuIScx5omYRdFK57EmpTvtxaDpcUDf+AksgzrE6M9P3x43EC6cEwMjJiXREXLCY
	dqyzEJwjkB1nPGtTttptH/MDFkvtzIYC/KRNoCuSUP1CBTI5HV+NgH3aEd1HoCyG31vlJY3m6611w
	aDEOigFNl/kuybdB2Ar8D+kO69CkgceDAfDXW3AbO6//3r/SALl5O+iF/jV9De01PY8KpYEo5PIgG
	52hoVZMgz1adWadZCEZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p07rc-00BLhV-Hb; Tue, 29 Nov 2022 21:10:00 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p07ra-00BLgX-Et
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 21:09:59 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p07rT-00061F-VS; Tue, 29 Nov 2022 22:09:52 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v1 4/5] RISC-V: hwprobe: Support probing of misaligned accesss performance
Date: Tue, 29 Nov 2022 22:09:49 +0100
Message-ID: <3882183.NG923GbCHz@diego>
In-Reply-To: <20221013163551.6775-5-palmer@rivosinc.com>
References: <20221013163551.6775-1-palmer@rivosinc.com> <20221013163551.6775-5-palmer@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_130958_530180_9490D949 
X-CRM114-Status: GOOD (  18.87  )
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

Am Donnerstag, 13. Oktober 2022, 18:35:50 CET schrieb Palmer Dabbelt:
> This allows userspace to select various routines to use based on the
> performance of misaligned access on the target hardware.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

[...]

> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> index cbda062de9bd..54bdcf9a5049 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -18,4 +18,6 @@ struct riscv_cpuinfo {
>  
>  DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
>  
> +DECLARE_PER_CPU(long, misaligned_access_speed);

just my 2ct ... wouldn't it make sense to have struct riscv_cpuinfo
as the central instance for all cpu-related stuff, so
misaligned_access_speed could also be part of it?


> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 553d755483ed..1599e40cd170 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -222,6 +226,22 @@ void __init riscv_fill_hwcap(void)
>  			bitmap_copy(riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
>  		else
>  			bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
> +
> +		/*
> +		 * Check for the performance of misaligned accesses.
> +		 */
> +		cpu = hartid_to_cpuid_map(hartid);
> +		if (cpu < 0)
> +			continue;
> +
> +		if (of_property_read_string(node, "riscv,misaligned-access-performance", &misaligned)) {

I think this wants a "!" in front :-) .

of_property_read_string() returns 0 on success, so running this
results in a nullptr right now.

> +			if (strcmp(misaligned, "emulated") == 0)
> +				per_cpu(misaligned_access_speed, cpu) = RISCV_HWPROBE_MISALIGNED_EMULATED;
> +			if (strcmp(misaligned, "slow") == 0)
> +				per_cpu(misaligned_access_speed, cpu) = RISCV_HWPROBE_MISALIGNED_SLOW;
> +			if (strcmp(misaligned, "fast") == 0)
> +				per_cpu(misaligned_access_speed, cpu) = RISCV_HWPROBE_MISALIGNED_FAST;
> +		}
>  	}
>  
>  	/* We don't support systems with F but without D, so mask those out


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
