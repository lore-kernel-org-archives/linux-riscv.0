Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36B6C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 01:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fuk7BC9RGbLmsXHZH6B1ARgG/kVBuB03+6kO0+VlJoU=; b=T0iQ+pujobRf0R
	BLfSdZsjX0mi8yliA1Gl0NvfAlkJLPPmJb9qrwK66lvC6MVLzAcXOPt/CJJOUVYawfdTdvLL0aboR
	P+lBmoleNAIagCJslPitcE3Smt1ETUc7TS9+m240GGESO6o8Lqp4ndyzGPmgbhcBxgDmbt7TO/TX2
	amvu4aL+WkuNIbqLY+7c3h6fA41kYQXcfa0RvrvWv5oHqO4jqzd7hTSdtk8g/Batkl6MzKZ0/LyN1
	c/hsjtwUWXLGLjmUYq6AM8mSALNtk6y8jR125bf525E8gQksflIpwRn7bRyfGcVAZvT8SdUAFRAoc
	l1g6UEpdRm4QuGdO6XKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osDZA-001kdA-VA; Tue, 08 Nov 2022 01:38:16 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osDZ7-001kcC-Ki
	for linux-riscv@lists.infradead.org; Tue, 08 Nov 2022 01:38:15 +0000
Received: by mail-pf1-x42b.google.com with SMTP id m6so12510454pfb.0
        for <linux-riscv@lists.infradead.org>; Mon, 07 Nov 2022 17:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pdA0+o4nyWXXtAJUwdO+TLMgOFzpgSrlvCyZWaWI2z4=;
        b=uUF3kWMxyWjpSj4fV0JBu57jdZdaitSPay1bfIGp0XFYDlcqtKIDm772KToGoDVuY4
         k9NhItfI5Xy02zSY93Cz8FaCrS8XLcp/MtGhI5bT5m8nQWCfpGn+phXjMMcRfr+8pxZV
         7bxnR51fohdrg2TI+WnAznLqy/w9xciGNh4WQzz/Tn/ccnE40nq6giHICh8zn/xqyAnz
         DDvNBkZWpZI2cm/EKxjqsUV2dtHsRYfVlcokfFJOGJOnzOL4uUUogUKcH7jWFUqRjNCh
         CVLoFVFMOaqlboAbAGKERaafeEe8W3UR9dHov2alPnaf+DPx++C5qIsxy2K0caHLXR6l
         jkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pdA0+o4nyWXXtAJUwdO+TLMgOFzpgSrlvCyZWaWI2z4=;
        b=SZhedLm20aVLVABB72+0dm/wgBv+x1Y7+lqPz5nxqAPtArTYJuD1P47TUil1W6DhhN
         I2c2WXqD1Py+Kg5tMkJPlowU4+jUtydFUgYinfsQA5jcd7LC/QpjYFABI7JFols/X1S5
         6v3qJfK979Wc1iDIGP/O3cgzst46Xv+m1Otm3n/XRfA6wjDAJuyMyKYGk1N9N5kdYS7q
         Y2aOjcdv9TEgq05WV5w421Uj+iIAaFoGxCR9t5hpMWbCCVNiAHs9bPT4YvvM/Cp4Jw1Z
         48F5dyktz4kR+fLA9ckKXODoAQiprjxHXq7Xshy28dQEjHIsmHURYIvvtb72yNi59Fyh
         DyYQ==
X-Gm-Message-State: ACrzQf0byBCKLjj7PswH54iXs+2S65ysVtvr6vyu+KRAMmXXubAenA6j
	76IK3E+Lw1sAipDeLQWdNHvKZg==
X-Google-Smtp-Source: AMsMyM45kxmMVB29FW11WfTPJoOy/nQGourjL5hLHSIUpug+JZdQcZpcSqfddvvyRg+/HMEccH5/cA==
X-Received: by 2002:a63:d90c:0:b0:462:cfa2:285b with SMTP id r12-20020a63d90c000000b00462cfa2285bmr45569279pgg.202.1667871490747;
        Mon, 07 Nov 2022 17:38:10 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id p18-20020a170902ebd200b00176b63535adsm5560623plg.260.2022.11.07.17.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 17:38:10 -0800 (PST)
Message-ID: <1634d6c4-40fa-1298-efa2-c606b1e57fd7@rivosinc.com>
Date: Mon, 7 Nov 2022 17:38:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v12 09/17] riscv: Add ptrace vector support
Content-Language: en-US
To: Chris Stillson <stillson@rivosinc.com>
Cc: Greentime Hu <greentime.hu@sifive.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>, Andy Chiu <andy.chiu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Arnd Bergmann <arnd@arndb.de>
References: <20220921214439.1491510-1-stillson@rivosinc.com>
 <20220921214439.1491510-9-stillson@rivosinc.com>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <20220921214439.1491510-9-stillson@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_173813_936549_4B27A333 
X-CRM114-Status: GOOD (  29.66  )
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

Trimmed CC list

On 9/21/22 14:43, Chris Stillson wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
> 
> This patch adds ptrace support for riscv vector. The vector registers will
> be saved in datap pointer of __riscv_v_state. This pointer will be set
> right after the __riscv_v_state data structure then it will be put in ubuf
> for ptrace system call to get or set. It will check if the datap got from
> ubuf is set to the correct address or not when the ptrace system call is
> trying to set the vector registers.
> 
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>   arch/riscv/include/uapi/asm/ptrace.h |  6 +++
>   arch/riscv/kernel/ptrace.c           | 71 ++++++++++++++++++++++++++++
>   include/uapi/linux/elf.h             |  1 +
>   3 files changed, 78 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
> index 6ee1ca2edfa7..2491875be80d 100644
> --- a/arch/riscv/include/uapi/asm/ptrace.h
> +++ b/arch/riscv/include/uapi/asm/ptrace.h
> @@ -94,6 +94,12 @@ struct __riscv_v_state {
>   	 */
>   };
>   
> +/*
> + * According to spec: The number of bits in a single vector register,
> + * VLEN >= ELEN, which must be a power of 2, and must be no greater than
> + * 2^16 = 65536bits = 8192bytes
> + */
> +#define RISCV_MAX_VLENB (8192)

Need a line here.

>   #endif /* __ASSEMBLY__ */
>   
>   #endif /* _UAPI_ASM_RISCV_PTRACE_H */
> diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
> index 2ae8280ae475..cce459ff551d 100644
> --- a/arch/riscv/kernel/ptrace.c
> +++ b/arch/riscv/kernel/ptrace.c
> @@ -27,6 +27,9 @@ enum riscv_regset {
>   #ifdef CONFIG_FPU
>   	REGSET_F,
>   #endif
> +#ifdef CONFIG_VECTOR
> +	REGSET_V,
> +#endif
>   };
>   
>   static int riscv_gpr_get(struct task_struct *target,
> @@ -83,6 +86,64 @@ static int riscv_fpr_set(struct task_struct *target,
>   }
>   #endif
>   
> +#ifdef CONFIG_VECTOR
> +static int riscv_vr_get(struct task_struct *target,
> +			const struct user_regset *regset,
> +			struct membuf to)
> +{
> +	struct __riscv_v_state *vstate = &target->thread.vstate;
> +
> +	/*
> +	 * Ensure the vector registers have been saved to the memory before
> +	 * copying them to membuf.
> +	 */
> +	if (target == current)
> +		vstate_save(current, task_pt_regs(current));
> +
> +	/* Copy vector header from vstate. */
> +	membuf_write(&to, vstate, RISCV_V_STATE_DATAP);
> +	membuf_zero(&to, sizeof(void *));
> +#if __riscv_xlen == 32
> +	membuf_zero(&to, sizeof(__u32));
> +#endif
> +
> +	/* Copy all the vector registers from vstate. */
> +	return membuf_write(&to, vstate->datap, riscv_vsize);
> +}
> +
> +static int riscv_vr_set(struct task_struct *target,
> +			 const struct user_regset *regset,
> +			 unsigned int pos, unsigned int count,
> +			 const void *kbuf, const void __user *ubuf)
> +{
> +	int ret, size;
> +	struct __riscv_v_state *vstate = &target->thread.vstate;
> +
> +	/* Copy rest of the vstate except datap and __padding. */
> +	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, vstate, 0,
> +				 RISCV_V_STATE_DATAP);
> +	if (unlikely(ret))
> +		return ret;
> +
> +	/* Skip copy datap. */
> +	size = sizeof(vstate->datap);
> +	count -= size;
> +	ubuf += size;
> +#if __riscv_xlen == 32
> +	/* Skip copy _padding. */
> +	size = sizeof(vstate->__padding);
> +	count -= size;
> +	ubuf += size;
> +#endif
> +
> +	/* Copy all the vector registers. */
> +	pos = 0;
> +	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, vstate->datap,
> +				 0, riscv_vsize);
> +	return ret;
> +}
> +#endif
> +
>   static const struct user_regset riscv_user_regset[] = {
>   	[REGSET_X] = {
>   		.core_note_type = NT_PRSTATUS,
> @@ -102,6 +163,16 @@ static const struct user_regset riscv_user_regset[] = {
>   		.set = riscv_fpr_set,
>   	},
>   #endif
> +#ifdef CONFIG_VECTOR
> +	[REGSET_V] = {
> +		.core_note_type = NT_RISCV_VECTOR,
> +		.align = 16,
> +		.n = (32 * RISCV_MAX_VLENB)/sizeof(__u32),
> +		.size = sizeof(__u32),
> +		.regset_get = riscv_vr_get,
> +		.set = riscv_vr_set,
> +	},
> +#endif
>   };
>   
>   static const struct user_regset_view riscv_user_native_view = {
> diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
> index c7b056af9ef0..5a5056c6a2a1 100644
> --- a/include/uapi/linux/elf.h
> +++ b/include/uapi/linux/elf.h
> @@ -439,6 +439,7 @@ typedef struct elf64_shdr {
>   #define NT_MIPS_DSP	0x800		/* MIPS DSP ASE registers */
>   #define NT_MIPS_FP_MODE	0x801		/* MIPS floating-point mode */
>   #define NT_MIPS_MSA	0x802		/* MIPS SIMD registers */
> +#define NT_RISCV_VECTOR	0x900		/* RISC-V vector registers */
>   #define NT_LOONGARCH_CPUCFG	0xa00	/* LoongArch CPU config registers */
>   #define NT_LOONGARCH_CSR	0xa01	/* LoongArch control and status registers */
>   #define NT_LOONGARCH_LSX	0xa02	/* LoongArch Loongson SIMD Extension registers */

I think we should break this one out as a seperate patch to be applied 
independently, avoid merge conflicts (but this file doesn't change much 
anyways. @Arnd or is it ok to carry with riscv change ?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
