Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D30C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Nov 2022 05:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=apr49fIxQ4yt2z/eIMuatEaq81RIP5Lq8vFf2LNV+uU=; b=ONtgVC/yioXyaE
	MZxvvPwPFg3aAogrbylVik2oCh2iW5Um4WP0S0Yn+e427HcSpnhb6LN8nk4DThVZbQQQLVlrbxbHh
	Lh9bRj3vFBKiHeqA+nMo2cJVZCf/j42Hj7KXIJIVWfDlWiUoSfvx6CMNbDGEmoBdZF/uEIzTPEpFn
	UOOU/ayR3xLr8ulqE/yjKPU2RVIVq15bXNgp0hZICnfzGS30frs/mwPE6qspon7kc4sPImRS4Rh7f
	I0heiSTpRH/loG2K4BfF4Mgyd29xTz0Jf7I4qS6C2CgxTunNZr1OhycjXCRPBtuBZS0FSbplZT9kN
	J625cTrEG8gPt+CHE1Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqopm-002OxZ-7k; Fri, 04 Nov 2022 05:01:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqopj-002Ow4-6X
	for linux-riscv@lists.infradead.org; Fri, 04 Nov 2022 05:01:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9F0DE6202D;
	Fri,  4 Nov 2022 05:01:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D27EC433D6;
	Fri,  4 Nov 2022 05:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1667538089; bh=UC4QqaY95lw4qInX215V9aUJTnKnVXWxx0zctNKV9qo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e+ogq1OZvE0UGCTg1vv7pBCqwNRxO3owbg8QruvLpPmjdvkcN9lWFy1E1c/42jzv0
	 TkKDsyEMHz56amq8ZnXyXMdaai++lsG95SAnHN6qqXFzSxHa81saVYYXJ8yzkRcVV0
	 ddlreiwM2pfK5I0Cvl5VgiW1Psbl0tkwUQkdu36U=
Message-ID: <1c74ac94-50db-ceb3-234d-f8f227de8f6e@linux.dev>
Date: Thu, 3 Nov 2022 22:01:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v12 06/17] riscv: Reset vector register
Content-Language: en-US
To: Chris Stillson <stillson@rivosinc.com>
Cc: Guo Ren <guoren@linux.alibaba.com>, Vincent Chen
 <vincent.chen@sifive.com>, Han-Kuan Chen <hankuan.chen@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, Palmer Dabbelt
 <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Oleg Nesterov <oleg@redhat.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Guo Ren <guoren@kernel.org>, Mayuresh Chitale <mchitale@ventanamicro.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, Andy Chiu <andy.chiu@sifive.com>
References: <20220921214439.1491510-1-stillson@rivosinc.com>
 <20220921214439.1491510-6-stillson@rivosinc.com>
From: Vineet Gupta <vineet.gupta@linux.dev>
In-Reply-To: <20220921214439.1491510-6-stillson@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_220135_383760_7C5779AE 
X-CRM114-Status: GOOD (  19.27  )
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

On 9/21/22 14:43, Chris Stillson wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Reset vector registers at boot-time and disable vector instructions
> execution for kernel mode.

Perhaps bike-shedding, but "Reset" has a different connotation in 
kernel, this is clear registers IMO. And "Reset Vector ..." sounds 
totally different at first glance.


> -	 * Disable the FPU to detect illegal usage of floating point in kernel
> -	 * space.
> +	 * Disable the FPU/Vector to detect illegal usage of floating point
> +	 * or vector in kernel space.
>   	 */
> -	li t0, SR_SUM | SR_FS
> +	li t0, SR_SUM | SR_FS | SR_VS

Is VS writable in implementations not implementing V hardware.

Priv spec seems to be confusing. It states

    "The FS[1:0] and VS[1:0] WARL fields..."

Above implies it can be written always but will read legal values only.
But then this follows.

	"If neither the v registers nor S-mode is implemented, then VS 	
	is read-only zero. If S-mode is implemented but the v registers
	are not, VS may optionally be read-only zero"

What does optionally mean for software ?

>   
>   	REG_L s0, TASK_TI_USER_SP(tp)
>   	csrrc s1, CSR_STATUS, t0
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index b865046e4dbb..2c81ca42ec4e 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -140,10 +140,10 @@ secondary_start_sbi:
>   	.option pop
>   
>   	/*
> -	 * Disable FPU to detect illegal usage of
> -	 * floating point in kernel space
> +	 * Disable FPU & VECTOR to detect illegal usage of
> +	 * floating point or vector in kernel space
>   	 */
> -	li t0, SR_FS
> +	li t0, SR_FS | SR_VS
>   	csrc CSR_STATUS, t0
>   
>   	/* Set trap vector to spin forever to help debug */
> @@ -234,10 +234,10 @@ pmp_done:
>   .option pop
>   
>   	/*
> -	 * Disable FPU to detect illegal usage of
> -	 * floating point in kernel space
> +	 * Disable FPU & VECTOR to detect illegal usage of
> +	 * floating point or vector in kernel space
>   	 */
> -	li t0, SR_FS
> +	li t0, SR_FS | SR_VS
>   	csrc CSR_STATUS, t0

Third instance of duplicated SR_FS | SR_VS. Better to add a helper 
SR_FS_VS or some such macro.

>   
>   #ifdef CONFIG_RISCV_BOOT_SPINWAIT
> @@ -431,6 +431,29 @@ ENTRY(reset_regs)
>   	csrw	fcsr, 0
>   	/* note that the caller must clear SR_FS */
>   #endif /* CONFIG_FPU */
> +
> +#ifdef CONFIG_VECTOR
> +	csrr	t0, CSR_MISA
> +	li	t1, COMPAT_HWCAP_ISA_V
> +	and	t0, t0, t1
> +	beqz	t0, .Lreset_regs_done
> +
> +	/*
> +	 * Clear vector registers and reset vcsr
> +	 * VLMAX has a defined value, VLEN is a constant,
> +	 * and this form of vsetvli is defined to set vl to VLMAX.
> +	 */
> +	li	t1, SR_VS
> +	csrs	CSR_STATUS, t1
> +	csrs	CSR_VCSR, x0
> +	vsetvli t1, x0, e8, m8, ta, ma
> +	vmv.v.i v0, 0
> +	vmv.v.i v8, 0
> +	vmv.v.i v16, 0
> +	vmv.v.i v24, 0
> +	/* note that the caller must clear SR_VS */

Is that actually happening ?



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
