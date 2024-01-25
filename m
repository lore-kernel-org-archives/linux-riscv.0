Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495C6C47DDF
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 07:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RRlXIrvCq6F7ySMsxKushtiI6qTOwqY9Y+AMkV7FQ0I=; b=DNWwwWeuYahrGw
	xI2tOsSODgYLsUxGy2r+1WipcbnGkmX38sandXM86Zg7XMvvheV6qx+q3Nzt8gvBJjC05bCF72gBq
	Ipv4LF70XZUyf5TE9Ee8YAFJda4t6DlMxfeJlXjL/aTaY9vGjqCcDXOO/17zrH3Ut4pL4Oei+HfgM
	l3K3xaA3KNSEjj4AH4vepxPSC+fL9ElNeC1SESigba0OZJHQuDZu+5HhuR0GN0laZBW0nEDb4PqGR
	QcrG3DyVDsTbeuwBOwS7xPQFMMmfYJNnTgUHtURdpFjaZDqisfsoNrxQDiTq+HN6LEkZLld93S8Sk
	L3vp/TflelHGqmHb20mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSuAy-0072U2-1c;
	Thu, 25 Jan 2024 07:29:28 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSuAu-0072Rx-2Z
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 07:29:26 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.nyi.internal (Postfix) with ESMTP id E3D71581314;
	Thu, 25 Jan 2024 02:29:23 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Thu, 25 Jan 2024 02:29:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1706167763; x=1706174963; bh=4/dVYBNNL2
	9STF+/5i846JO1dRke2hCM5JY24OM2ohU=; b=lwTTQ95AoV1u66uCX1R6onpv8v
	N5jd75WVvcYhFf5c2X+9DsNFbWiR9SWsZnsqriQyXjalkaqJtkpkcRmEY+MSlV/t
	mDCaZjqEqXCh77IIxLms87WNEV9/ZVvpdZMsP6wQZ3344eSclRbedjevS2vTpf/9
	nUd7T/wX4cHV6Oy7+MDsDt8B+80Jf1QAPfRfqAPRb6GrLnYBUd4OQONQr/XIhee3
	8XzyeHhgmY2OmAPYsOi6JXT5gT3IowKhXvDYB/3Qy2r+fLRcWCfpYmZ0xi9ZIA6t
	ZghE20tsjmB0dP4eXt6weRVKaMa+n7DzbnWjnmtSToxDDmWjg2TEjs0kd50Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1706167763; x=1706174963; bh=4/dVYBNNL29STF+/5i846JO1dRke
	2hCM5JY24OM2ohU=; b=mTzScfB0K35xIcEgRabZtto4zgIYrnuz0bhqWw1Cj4Au
	AmQkcUDg8Qjc99Sl4GfPbEc1VnWEnQz8Lsxi/In3gDNRpZGLti/nmi5+t32zFU9g
	Xh+dzxdf5GrVet39WVEZcKeZBqdh+5QSPqyh39LFCyNa9fkBYil6OJKkbGMOOwAe
	FoQn8CHFSAXKTJ2DufQ4MQS6vonOE8Whffy39HZr1rHiggYBKHa5/ImT+OMTnXiY
	+PX560DwYqODmummRGz/TsJgGN0ZdnQ8nVqs3N3clQGWSIB7LeqLQTnAEeEkPOsK
	x8PhAdDTNflEdRbe/hOS44unS7p1kZdfDYVvyqh6zA==
X-ME-Sender: <xms:0Q2yZdMOebnDX4yFCFMexnLNBFSey6p40WfPvoSZ-g4V6uKjLK67mA>
    <xme:0Q2yZf_9Vqhz2WyVulUMFJezaKo5KuaffX999C1-F0rZSs5qOU0WRAlJmrE99FzE_
    Bts_PTYoBoAOjg3zQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdelvddguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfu
    thgvfhgrnhcuqfdktfgvrghrfdcuoehsohhrvggrrhesfhgrshhtmhgrihhlrdgtohhmqe
    enucggtffrrghtthgvrhhnpefhtefgffelieduudekgeevueegudegueefhfehhfffiefg
    keffvedtuefggfehteenucffohhmrghinhepvghnthhrhidrshgspdhinhhfrhgruggvrg
    gurdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepshhorhgvrghrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:0Q2yZcSXsRVOSAJZM3l_HcZY_ux4TIv7m_3ArfKUKhlUBHkIqsbstQ>
    <xmx:0Q2yZZsii_CAlugnvZspAAvrWmpg_K1P3OhjO8teThv-Y_w_conHtg>
    <xmx:0Q2yZVfCfPmRkvZibCs6Bcti6fvQYEWGUhItDRV6wYyNslDUg24REw>
    <xmx:0w2yZWVVJg1i0Ptr31HycbYgvfwDIArhZ8XHeVTPvpAMIaUNXjwSkQ>
Feedback-ID: i84414492:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7A9091700093; Thu, 25 Jan 2024 02:29:21 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-119-ga8b98d1bd8-fm-20240108.001-ga8b98d1b
MIME-Version: 1.0
Message-Id: <ab343d4b-d8b0-47fc-8040-83313a3d735e@app.fastmail.com>
In-Reply-To: <20240125062739.1339782-8-debug@rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
 <20240125062739.1339782-8-debug@rivosinc.com>
Date: Thu, 25 Jan 2024 02:29:01 -0500
From: "Stefan O'Rear" <sorear@fastmail.com>
To: debug <debug@rivosinc.com>, rick.p.edgecombe@intel.com,
 broonie@kernel.org, Szabolcs.Nagy@arm.com,
 "kito.cheng@sifive.com" <kito.cheng@sifive.com>,
 "Kees Cook" <keescook@chromium.org>,
 "Andrew Jones" <ajones@ventanamicro.com>, paul.walmsley@sifive.com,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Conor Dooley" <conor.dooley@microchip.com>, cleger@rivosinc.com,
 "Atish Patra" <atishp@atishpatra.org>, "Alexandre Ghiti" <alex@ghiti.fr>,
 =?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>,
 "Alexandre Ghiti" <alexghiti@rivosinc.com>
Cc: "Jonathan Corbet" <corbet@lwn.net>, "Albert Ou" <aou@eecs.berkeley.edu>,
 oleg@redhat.com, akpm@linux-foundation.org, arnd@arndb.de,
 "Eric W. Biederman" <ebiederm@xmission.com>, shuah@kernel.org,
 "Christian Brauner" <brauner@kernel.org>, guoren <guoren@kernel.org>,
 samitolvanen@google.com, "Evan Green" <evan@rivosinc.com>,
 xiao.w.wang@intel.com, "Anup Patel" <apatel@ventanamicro.com>,
 mchitale@ventanamicro.com, waylingii@gmail.com, greentime.hu@sifive.com,
 "Heiko Stuebner" <heiko@sntech.de>, "Jisheng Zhang" <jszhang@kernel.org>,
 shikemeng@huaweicloud.com, david@redhat.com,
 "Charlie Jenkins" <charlie@rivosinc.com>, panqinglin2020@iscas.ac.cn,
 willy@infradead.org, "Vincent Chen" <vincent.chen@sifive.com>,
 "Andy Chiu" <andy.chiu@sifive.com>, "Greg Ungerer" <gerg@kernel.org>,
 jeeheng.sia@starfivetech.com, mason.huo@starfivetech.com,
 ancientmodern4@gmail.com, mathis.salmen@matsal.de,
 cuiyunhui@bytedance.com, bhe@redhat.com, chenjiahao16@huawei.com,
 ruscur@russell.cc, bgray@linux.ibm.com, alx@kernel.org,
 baruch@tkos.co.il, zhangqing@loongson.cn,
 "Catalin Marinas" <catalin.marinas@arm.com>, revest@chromium.org,
 josh@joshtriplett.org, joey.gouly@arm.com, shr@devkernel.io,
 omosnace@redhat.com, ojeda@kernel.org, jhubbard@nvidia.com,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v1 07/28] riscv: kernel handling on trap entry/exit for user
 cfi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_232924_922389_88D36AC5 
X-CRM114-Status: GOOD (  28.98  )
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

On Thu, Jan 25, 2024, at 1:21 AM, debug@rivosinc.com wrote:
> From: Deepak Gupta <debug@rivosinc.com>
>
> Carves out space in arch specific thread struct for cfi status and shadow stack
> in usermode on riscv.
>
> This patch does following
> - defines a new structure cfi_status with status bit for cfi feature
> - defines shadow stack pointer, base and size in cfi_status structure
> - defines offsets to new member fields in thread in asm-offsets.c
> - Saves and restore shadow stack pointer on trap entry (U --> S) and exit
>   (S --> U)
>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/include/asm/processor.h   |  1 +
>  arch/riscv/include/asm/thread_info.h |  3 +++
>  arch/riscv/include/asm/usercfi.h     | 24 ++++++++++++++++++++++++
>  arch/riscv/kernel/asm-offsets.c      |  5 ++++-
>  arch/riscv/kernel/entry.S            | 25 +++++++++++++++++++++++++
>  5 files changed, 57 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/include/asm/usercfi.h
>
> diff --git a/arch/riscv/include/asm/processor.h 
> b/arch/riscv/include/asm/processor.h
> index ee2f51787ff8..d4dc298880fc 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -14,6 +14,7 @@
> 
>  #include <asm/ptrace.h>
>  #include <asm/hwcap.h>
> +#include <asm/usercfi.h>
> 
>  #ifdef CONFIG_64BIT
>  #define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
> diff --git a/arch/riscv/include/asm/thread_info.h 
> b/arch/riscv/include/asm/thread_info.h
> index 320bc899a63b..6a2acecec546 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -58,6 +58,9 @@ struct thread_info {
>  	int			cpu;
>  	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
>  	unsigned long envcfg;
> +#ifdef CONFIG_RISCV_USER_CFI
> +	struct cfi_status       user_cfi_state;
> +#endif
>  #ifdef CONFIG_SHADOW_CALL_STACK
>  	void			*scs_base;
>  	void			*scs_sp;
> diff --git a/arch/riscv/include/asm/usercfi.h 
> b/arch/riscv/include/asm/usercfi.h
> new file mode 100644
> index 000000000000..080d7077d12c
> --- /dev/null
> +++ b/arch/riscv/include/asm/usercfi.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + * Copyright (C) 2023 Rivos, Inc.
> + * Deepak Gupta <debug@rivosinc.com>
> + */
> +#ifndef _ASM_RISCV_USERCFI_H
> +#define _ASM_RISCV_USERCFI_H
> +
> +#ifndef __ASSEMBLY__
> +#include <linux/types.h>
> +
> +#ifdef CONFIG_RISCV_USER_CFI
> +struct cfi_status {
> +	unsigned long ubcfi_en : 1; /* Enable for backward cfi. */
> +	unsigned long rsvd : ((sizeof(unsigned long)*8) - 1);
> +	unsigned long user_shdw_stk; /* Current user shadow stack pointer */
> +	unsigned long shdw_stk_base; /* Base address of shadow stack */
> +	unsigned long shdw_stk_size; /* size of shadow stack */
> +};
> +
> +#endif /* CONFIG_RISCV_USER_CFI */
> +
> +#endif /* __ASSEMBLY__ */
> +
> +#endif /* _ASM_RISCV_USERCFI_H */
> diff --git a/arch/riscv/kernel/asm-offsets.c 
> b/arch/riscv/kernel/asm-offsets.c
> index cdd8f095c30c..5e1f412e96ba 100644
> --- a/arch/riscv/kernel/asm-offsets.c
> +++ b/arch/riscv/kernel/asm-offsets.c
> @@ -43,8 +43,11 @@ void asm_offsets(void)
>  #ifdef CONFIG_SHADOW_CALL_STACK
>  	OFFSET(TASK_TI_SCS_SP, task_struct, thread_info.scs_sp);
>  #endif
> -
>  	OFFSET(TASK_TI_CPU_NUM, task_struct, thread_info.cpu);
> +#ifdef CONFIG_RISCV_USER_CFI
> +	OFFSET(TASK_TI_CFI_STATUS, task_struct, thread_info.user_cfi_state);
> +	OFFSET(TASK_TI_USER_SSP, task_struct, 
> thread_info.user_cfi_state.user_shdw_stk);
> +#endif
>  	OFFSET(TASK_THREAD_F0,  task_struct, thread.fstate.f[0]);
>  	OFFSET(TASK_THREAD_F1,  task_struct, thread.fstate.f[1]);
>  	OFFSET(TASK_THREAD_F2,  task_struct, thread.fstate.f[2]);
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 63c3855ba80d..410659e2eadb 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -49,6 +49,21 @@ SYM_CODE_START(handle_exception)
>  	REG_S x5,  PT_T0(sp)
>  	save_from_x6_to_x31
> 
> +#ifdef CONFIG_RISCV_USER_CFI
> +	/*
> +	* we need to save cfi status only when previous mode was U
> +	*/
> +	csrr s2, CSR_STATUS
> +	andi s2, s2, SR_SPP
> +	bnez s2, skip_bcfi_save
> +	/* load cfi status word */
> +	lw s3, TASK_TI_CFI_STATUS(tp)
> +	andi s3, s3, 1
> +	beqz s3, skip_bcfi_save
> +	csrr s3, CSR_SSP
> +	REG_S s3, TASK_TI_USER_SSP(tp) /* save user ssp in thread_info */
> +skip_bcfi_save:
> +#endif
>  	/*
>  	 * Disable user-mode memory access as it should only be set in the
>  	 * actual user copy routines.
> @@ -141,6 +156,16 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
>  	 * structures again.
>  	 */
>  	csrw CSR_SCRATCH, tp
> +
> +#ifdef CONFIG_RISCV_USER_CFI
> +	lw s3, TASK_TI_CFI_STATUS(tp)
> +	andi s3, s3, 1
> +	beqz s3, skip_bcfi_resume
> +	REG_L s3, TASK_TI_USER_SSP(tp) /* restore user ssp from thread struct */
> +	csrw CSR_SSP, s3
> +skip_bcfi_resume:
> +#endif
> +

We shouldn't need any of this in the entry/exit code, at least as long as
the kernel itself is not using Zicfiss.  ssp can keep its value in the
kernel and swap it on task switches.  Our entry/exit code is rather short
and I'd like to keep it that way.

-s

>  1:
>  	REG_L a0, PT_STATUS(sp)
>  	/*
> -- 
> 2.43.0
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
