Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57AFC7EE23
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 01:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=GlXK5hCF+yNrDhE9Doiqn9wSd2DGyqSWFPYPUim7XjU=; b=q8mMiQHQVfo21GtTv8qBcIVSKD
	9zUEh4+rGEo2ncNZTIZacOiJOD3EbUfxtqhL1Cu4FILMiuU42gCjzdr/pb7SgiiKfAc/4/hduGphA
	V7a3H/Fr3j518pDBpxEAEfYeXN+VXKvQBf6m/F4BoEQc865VheMpqdXDhgFHC1hNcyJtD97NHB3BV
	HcQbvds9oLjcjJ4iBW9G7SleBLSpov/cadsjnT8kCa6LmcYNTxvt+hCntvtrhUcRBSxFdtCfWDOxF
	7S0UZWCX5WGWojCK+1s05OwnKSkewbFeYBcEwQmjADFD4vJDQAbo0TQc/ptMP09DeYdaLe8RwOZod
	f0IQWIQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1dde-00C46e-0A;
	Wed, 24 May 2023 01:50:06 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1cga-00BwbV-06
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 00:49:05 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5289cf35eeaso3876514a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 23 May 2023 17:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1684889342; x=1687481342;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZEexR3f7ga3u1+ZUo8U5i5PeRTDCeVutJWe5pd3c2E=;
        b=fxkvw7v1NA8MqRBMj4197nhuNSOgBQ5scBtnezy4uhWfvsVI5rLFMlEP/nyj5B/TeB
         KMAW2V7y9dbYpyyEe59Nrgs3HT0llDOB54WBjelftCgIu8tGPpmjeOxry8OcwJDIXRDh
         8gQ8B78VNDWIYHzuvc2LTd+I4mTQvqXwCPKqCyEXUAohEAvduAUIS4zMHciE45pyvn3N
         R4gBLN9lDLLj3CgPKf7k6LGvHF/pxGvAaL8UmxFHLVXFCBK5FkbIzddtFNot3mKip8zL
         OO/eN7WSBTkpBlss1c1AbzBka201NXTo1gi/g6TCvpbyqpFfMGncZkrGOoIea/pZrx3i
         QkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684889342; x=1687481342;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZEexR3f7ga3u1+ZUo8U5i5PeRTDCeVutJWe5pd3c2E=;
        b=UKuUbXsqHw+Kwc27+TbSjY6ID3MbIC1Bwi1M+JrMGwTpHmbIWNW65b8PY1Cnns4v6t
         i+XrISg3+5BCrTuyOCLvONW8ZisReYIOgUJYZwNJCI04iOtufSD4YGj3mJM5Hc6DfBq8
         sfUP7WdZY4/S0rVL2bktVYhMCaYoUKgfKSF+NrgLGzy1+HpUqtfxJ4/rroXUdHxm1Jdi
         R4WhY6d5tiG3rPEuZE43RFPV71Q2tkBESMrXskm0Q69ufOqlOG1Kc6RYmsO59GT80RzF
         8OOxFPYh1pESTdxTUoqBt9R3jRaFLGf5q1wE8L+lMsTRWG/+4n2TDqmS/8wAQoF2yp4N
         GrEg==
X-Gm-Message-State: AC+VfDwxxit7UY171s3JhuKXAYbnHuXRAzGDxrZ3wYA+6CD1/uOFWGHQ
	KSIO1pprSE5VIN5HvmLKF3Nr1m9Z+Bky6Tq4boA=
X-Google-Smtp-Source: ACHHUZ4q7vQl/o5VQeHvY+nl2amBxqxF3QxVOIcwyYvRIMFppsrxcLGTWRAhXwdjKdngH9wqdtI/tQ==
X-Received: by 2002:a05:6a20:9189:b0:106:9266:4448 with SMTP id v9-20020a056a20918900b0010692664448mr18159819pzd.16.1684889342075;
        Tue, 23 May 2023 17:49:02 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id q13-20020a62e10d000000b0064d59e194c8sm5214690pfh.115.2023.05.23.17.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 17:49:01 -0700 (PDT)
Date: Tue, 23 May 2023 17:49:01 -0700 (PDT)
X-Google-Original-Date: Tue, 23 May 2023 17:31:48 PDT (-0700)
Subject: Re: [PATCH -next v20 12/26] riscv: Add ptrace vector support
In-Reply-To: <20230518161949.11203-13-andy.chiu@sifive.com>
CC: linux-riscv@lists.infradead.org, anup@brainfault.org, atishp@atishpatra.org,
  kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, Vineet Gupta <vineetg@rivosinc.com>,
  greentime.hu@sifive.com, guoren@linux.alibaba.com, vincent.chen@sifive.com, andy.chiu@sifive.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, oleg@redhat.com, ebiederm@xmission.com,
  keescook@chromium.org, heiko.stuebner@vrull.eu, Conor Dooley <conor.dooley@microchip.com>,
  chenhuacai@kernel.org, frankja@linux.ibm.com, zhangqing@loongson.cn, eb@emlix.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: andy.chiu@sifive.com, Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-f92fa24d-c8bd-4794-819d-7563c1193430@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_174904_067225_C95C19AB 
X-CRM114-Status: GOOD (  32.75  )
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

On Thu, 18 May 2023 09:19:35 PDT (-0700), andy.chiu@sifive.com wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
>
> This patch adds ptrace support for riscv vector. The vector registers will
> be saved in datap pointer of __riscv_v_ext_state. This pointer will be set
> right after the __riscv_v_ext_state data structure then it will be put in
> ubuf for ptrace system call to get or set. It will check if the datap got
> from ubuf is set to the correct address or not when the ptrace system call
> is trying to set the vector registers.
>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changelog V18:
>  - Use sizeof(vstate->datap) instead of sizeof(void*) (Eike)
> ---
>  arch/riscv/include/uapi/asm/ptrace.h |  7 +++
>  arch/riscv/kernel/ptrace.c           | 70 ++++++++++++++++++++++++++++
>  include/uapi/linux/elf.h             |  1 +
>  3 files changed, 78 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
> index 586786d023c4..e8d127ec5cf7 100644
> --- a/arch/riscv/include/uapi/asm/ptrace.h
> +++ b/arch/riscv/include/uapi/asm/ptrace.h
> @@ -94,6 +94,13 @@ struct __riscv_v_ext_state {
>  	 */
>  };
>
> +/*
> + * According to spec: The number of bits in a single vector register,
> + * VLEN >= ELEN, which must be a power of 2, and must be no greater than
> + * 2^16 = 65536bits = 8192bytes
> + */
> +#define RISCV_MAX_VLENB (8192)
> +
>  #endif /* __ASSEMBLY__ */
>
>  #endif /* _UAPI_ASM_RISCV_PTRACE_H */
> diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
> index 23c48b14a0e7..1d572cf3140f 100644
> --- a/arch/riscv/kernel/ptrace.c
> +++ b/arch/riscv/kernel/ptrace.c
> @@ -7,6 +7,7 @@
>   * Copied from arch/tile/kernel/ptrace.c
>   */
>
> +#include <asm/vector.h>
>  #include <asm/ptrace.h>
>  #include <asm/syscall.h>
>  #include <asm/thread_info.h>
> @@ -24,6 +25,9 @@ enum riscv_regset {
>  #ifdef CONFIG_FPU
>  	REGSET_F,
>  #endif
> +#ifdef CONFIG_RISCV_ISA_V
> +	REGSET_V,
> +#endif
>  };
>
>  static int riscv_gpr_get(struct task_struct *target,
> @@ -80,6 +84,61 @@ static int riscv_fpr_set(struct task_struct *target,
>  }
>  #endif
>
> +#ifdef CONFIG_RISCV_ISA_V
> +static int riscv_vr_get(struct task_struct *target,
> +			const struct user_regset *regset,
> +			struct membuf to)
> +{
> +	struct __riscv_v_ext_state *vstate = &target->thread.vstate;
> +
> +	if (!riscv_v_vstate_query(task_pt_regs(target)))
> +		return -EINVAL;
> +
> +	/*
> +	 * Ensure the vector registers have been saved to the memory before
> +	 * copying them to membuf.
> +	 */
> +	if (target == current)
> +		riscv_v_vstate_save(current, task_pt_regs(current));
> +
> +	/* Copy vector header from vstate. */
> +	membuf_write(&to, vstate, offsetof(struct __riscv_v_ext_state, datap));
> +	membuf_zero(&to, sizeof(vstate->datap));
> +
> +	/* Copy all the vector registers from vstate. */
> +	return membuf_write(&to, vstate->datap, riscv_v_vsize);
> +}
> +
> +static int riscv_vr_set(struct task_struct *target,
> +			const struct user_regset *regset,
> +			unsigned int pos, unsigned int count,
> +			const void *kbuf, const void __user *ubuf)
> +{
> +	int ret, size;
> +	struct __riscv_v_ext_state *vstate = &target->thread.vstate;
> +
> +	if (!riscv_v_vstate_query(task_pt_regs(target)))
> +		return -EINVAL;
> +
> +	/* Copy rest of the vstate except datap */
> +	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, vstate, 0,
> +				 offsetof(struct __riscv_v_ext_state, datap));
> +	if (unlikely(ret))
> +		return ret;
> +
> +	/* Skip copy datap. */
> +	size = sizeof(vstate->datap);
> +	count -= size;
> +	ubuf += size;
> +
> +	/* Copy all the vector registers. */
> +	pos = 0;
> +	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, vstate->datap,
> +				 0, riscv_v_vsize);
> +	return ret;
> +}
> +#endif
> +
>  static const struct user_regset riscv_user_regset[] = {
>  	[REGSET_X] = {
>  		.core_note_type = NT_PRSTATUS,
> @@ -99,6 +158,17 @@ static const struct user_regset riscv_user_regset[] = {
>  		.set = riscv_fpr_set,
>  	},
>  #endif
> +#ifdef CONFIG_RISCV_ISA_V
> +	[REGSET_V] = {
> +		.core_note_type = NT_RISCV_VECTOR,
> +		.align = 16,
> +		.n = ((32 * RISCV_MAX_VLENB) +
> +		      sizeof(struct __riscv_v_ext_state)) / sizeof(__u32),
> +		.size = sizeof(__u32),
> +		.regset_get = riscv_vr_get,
> +		.set = riscv_vr_set,
> +	},
> +#endif
>  };
>
>  static const struct user_regset_view riscv_user_native_view = {
> diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
> index ac3da855fb19..7d8d9ae36615 100644
> --- a/include/uapi/linux/elf.h
> +++ b/include/uapi/linux/elf.h
> @@ -440,6 +440,7 @@ typedef struct elf64_shdr {
>  #define NT_MIPS_DSP	0x800		/* MIPS DSP ASE registers */
>  #define NT_MIPS_FP_MODE	0x801		/* MIPS floating-point mode */
>  #define NT_MIPS_MSA	0x802		/* MIPS SIMD registers */
> +#define NT_RISCV_VECTOR	0x900		/* RISC-V vector registers */

IIUC we're OK to define note types here, as they're all sub-types of the 
"LINUX" note as per the comment?  I'm not entirely sure, though.

Maybe Arnd knows?

>  #define NT_LOONGARCH_CPUCFG	0xa00	/* LoongArch CPU config registers */
>  #define NT_LOONGARCH_CSR	0xa01	/* LoongArch control and status registers */
>  #define NT_LOONGARCH_LSX	0xa02	/* LoongArch Loongson SIMD Extension registers */

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com> # aside from NT_RISCV_VECTOR

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
