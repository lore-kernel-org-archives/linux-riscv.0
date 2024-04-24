Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22CBC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 20:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZavZq/XDgCnQ1d0q0r4Brixzi+72PHPKNrg47+uX8CA=; b=DiMm49o77YcDhY
	X4piQFUZ8IlpmVEUOip+EYQBVHEOfucoTV7WStWqww6xeVJRFnSURvIXncr9fLiIow+Rqg0IwkrKH
	rehccRQd9E3LAWzSYSwY4qROps7fdHcFHkZiAa1+92L4xRH28Lt94p3Fim8e5deQE9cdD0WboW+u4
	kO3vwm2NhUChpgaEfzR//BI4DAnmcVhbtEBsnbQO1ivreOVPmkU1KB6mDACLcaZeN9kaD7vA12Yc4
	EwZ1kbx/0x44qD0m++fLjHif7gQrEQmoi+TZ/zDi1PzUOZ8OqvzSBQziVrWMC0q0+FwjNjbvdZqMR
	SDQUIfj0sX7SWmtRZb4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzio3-00000005mxT-1hKh;
	Wed, 24 Apr 2024 20:01:27 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzio0-00000005mtd-1hUM
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 20:01:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB2E1240004;
	Wed, 24 Apr 2024 20:01:15 +0000 (UTC)
Message-ID: <4acc62d0-d62b-4d42-805b-0bc7f663a81c@ghiti.fr>
Date: Wed, 24 Apr 2024 22:01:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] riscv: smp: fail booting up smp if inconsistent
 vlen is detected
Content-Language: en-US
To: Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley
 <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>,
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Evan Green <evan@rivosinc.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>, Vincent Chen
 <vincent.chen@sifive.com>, Greentime Hu <greentime.hu@sifive.com>,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
 <20240412-zve-detection-v4-2-e0c45bb6b253@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240412-zve-detection-v4-2-e0c45bb6b253@sifive.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_130124_786922_670D19A3 
X-CRM114-Status: GOOD (  24.00  )
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

Hi Andy,

On 12/04/2024 08:48, Andy Chiu wrote:
> Currently we only support Vector for SMP platforms, that is, all SMP
> cores have the same vlenb. If we happen to detect a mismatching vlen, it
> is better to just fail bootting it up to prevent further race/scheduling
> issues.
>
> Also, move .Lsecondary_park forward and chage `tail smp_callin` into a
> regular call in the early assembly. So a core would be parked right
> after a return from smp_callin. Note that a successful smp_callin
> does not return.
>
> Fixes: 7017858eb2d7 ("riscv: Introduce riscv_v_vsize to record size of Vector context")
> Reported-by: Conor Dooley <conor.dooley@microchip.com>
> Closes: https://lore.kernel.org/linux-riscv/20240228-vicinity-cornstalk-4b8eb5fe5730@spud/
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
> Changelog v4:
>   - update comment also in the assembly code (Yunhui)
> Changelog v2:
>   - update commit message to explain asm code change (Conor)
> ---
>   arch/riscv/kernel/head.S    | 19 ++++++++++++-------
>   arch/riscv/kernel/smpboot.c | 14 +++++++++-----
>   2 files changed, 21 insertions(+), 12 deletions(-)
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 4236a69c35cb..a00f7523cb91 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -165,9 +165,20 @@ secondary_start_sbi:
>   #endif
>   	call .Lsetup_trap_vector
>   	scs_load_current
> -	tail smp_callin
> +	call smp_callin
>   #endif /* CONFIG_SMP */
>   
> +.align 2
> +.Lsecondary_park:
> +	/*
> +	 * Park this hart if we:
> +	 *  - have too many harts on CONFIG_RISCV_BOOT_SPINWAIT
> +	 *  - receive an early trap, before setup_trap_vector finished
> +	 *  - fail in smp_callin(), as a successful one wouldn't return
> +	 */
> +	wfi
> +	j .Lsecondary_park
> +
>   .align 2
>   .Lsetup_trap_vector:
>   	/* Set trap vector to exception handler */
> @@ -181,12 +192,6 @@ secondary_start_sbi:
>   	csrw CSR_SCRATCH, zero
>   	ret
>   
> -.align 2
> -.Lsecondary_park:
> -	/* We lack SMP support or have too many harts, so park this hart */
> -	wfi
> -	j .Lsecondary_park
> -
>   SYM_CODE_END(_start)
>   
>   SYM_CODE_START(_start_kernel)
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index d41090fc3203..673437ccc13d 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -214,6 +214,15 @@ asmlinkage __visible void smp_callin(void)
>   	struct mm_struct *mm = &init_mm;
>   	unsigned int curr_cpuid = smp_processor_id();
>   
> +	if (has_vector()) {
> +		/*
> +		 * Return as early as possible so the hart with a mismatching
> +		 * vlen won't boot.
> +		 */
> +		if (riscv_v_setup_vsize())
> +			return;
> +	}
> +
>   	/* All kernel threads share the same mm context.  */
>   	mmgrab(mm);
>   	current->active_mm = mm;
> @@ -226,11 +235,6 @@ asmlinkage __visible void smp_callin(void)
>   	numa_add_cpu(curr_cpuid);
>   	set_cpu_online(curr_cpuid, 1);
>   
> -	if (has_vector()) {
> -		if (riscv_v_setup_vsize())
> -			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
> -	}
> -
>   	riscv_user_isa_enable();
>   
>   	/*
>

So this should go into -fixes, would you mind sending a single patch for 
this fix?

Your patch 8 is actually already fixed by Clement's patch 
https://lore.kernel.org/linux-riscv/20240409143839.558784-1-cleger@rivosinc.com/ 
and I already mentioned this one to Palmer.

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
