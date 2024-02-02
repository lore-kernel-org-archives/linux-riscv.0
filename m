Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293B3C4828E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 23:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pcOLUi80KCgfKcCrnClH20gnegj/TI4+r4JKXkS9JIA=; b=OjHtyQj3mSIHy5
	SDfnkyJ6UrR3ubiJpFEW3qZfmmyg6iY+9wcnFU3M1IJRFqZBzADRDa3ewaCc1DSyXtQB6FFCazyBg
	mlHK/5fX9nPG/hYI7ccuCSKXPAtOBOc80gtA3KTrDmOh6HnqapG3ATdwyNPb7+LOVQyPFRUsQFDbV
	JTcMUn5rNRMvEe0i6ZavLPb5o5Gipkz6Uh8ydkLOP2KSFtxkgCnQxXTzCsB8C+4SB5qS0l8FXfUlS
	+QlBXBVUP/i7gcPsBZX/CBPYDdXiNBt+SzcGNPQ8F38JG7/Cc/ReEwV40gF+AvMw6dnGrq++mxOpj
	6psZfWJrPjZ+ZFwFtxLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW2X2-0000000Djny-0pK3;
	Fri, 02 Feb 2024 23:01:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW2Wv-0000000Djmt-1YV2
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 23:01:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E2DFB628CD;
	Fri,  2 Feb 2024 23:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD12C433F1;
	Fri,  2 Feb 2024 23:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706914863;
	bh=aT1AHnBF7mBOjZaTwOi86ygyf4KXlSwVYeC30/NWI1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BMK3mHZnugD1ntQHv4RfpdjacKnxdBJLv428m5TiYZRfxaJSBXQNUxebJ9F9TIV9g
	 qbwTlqDqHtXH4v2RS9JMeEI1FB0eqTQdEdm+XOkP0dlGgICsz3ijIzDJyEDQ/n2P3b
	 2zuF6xor+J5yAXtjfc/BvM3RlTcZC4Dv0q68Y4go2DH7qU/LKsk7ml9dZjNZG7rQp6
	 IuHA/1oWEKtL3iihOl5cakXkdxj8+sgfywvhDL3Z2SRHOLps0WXwATFGpInmuyC8+f
	 v7EM7ciRL0VXiHhU64qij2v12OneZzmljOiB86uJaTNym4mg7eKvs5c8hQWCgMXcSd
	 aiwIoUqJvm8fA==
Date: Fri, 2 Feb 2024 15:01:01 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv: Disable misaligned access probe when
 CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
Message-ID: <20240202230101.GB2055@sol.localdomain>
References: <20240201-disable_misaligned_probe_config-v2-0-77c368bed7b2@rivosinc.com>
 <20240201-disable_misaligned_probe_config-v2-2-77c368bed7b2@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240201-disable_misaligned_probe_config-v2-2-77c368bed7b2@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_150109_652797_AC796AF7 
X-CRM114-Status: GOOD (  12.08  )
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

On Thu, Feb 01, 2024 at 03:30:46PM -0800, Charlie Jenkins wrote:
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> index eb3ac304fc42..3a29d8e30e05 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -51,6 +51,7 @@ static inline bool check_unaligned_access_emulated(int cpu)
>  static inline void unaligned_emulation_finish(void) {}
>  #endif
>  
> +#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS

#ifdef..#else..#endif is more readable than #ifndef..#else..#endif.

> diff --git a/arch/riscv/include/asm/misaligned_access_speed.h b/arch/riscv/include/asm/misaligned_access_speed.h
> new file mode 100644
> index 000000000000..81df2aa6fa6b
> --- /dev/null
> +++ b/arch/riscv/include/asm/misaligned_access_speed.h

This new header file isn't included from anywhere.

> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index f71910718053..8be7f17da9ab 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -62,6 +62,9 @@ obj-y	+= tests/
>  obj-$(CONFIG_MMU) += vdso.o vdso/
>  
>  obj-$(CONFIG_RISCV_MISALIGNED)	+= traps_misaligned.o
> +ifneq ($(RISCV_EFFICIENT_UNALIGNED_ACCESS), y)
> +obj-y	+= misaligned_access_speed.o
> +endif

CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS

> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index a7c56b41efd2..3f1a6edfdb08 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -149,6 +149,7 @@ static bool hwprobe_ext0_has(const struct cpumask *cpus, unsigned long ext)
>  
>  static u64 hwprobe_misaligned(const struct cpumask *cpus)
>  {
> +#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
>  	int cpu;
>  	u64 perf = -1ULL;
>  
> @@ -168,6 +169,9 @@ static u64 hwprobe_misaligned(const struct cpumask *cpus)
>  		return RISCV_HWPROBE_MISALIGNED_UNKNOWN;
>  
>  	return perf;
> +#else
> +	return RISCV_HWPROBE_MISALIGNED_FAST;
> +#endif

#ifdef..#else..#endif is more readable than #ifndef..#else..#endif.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
