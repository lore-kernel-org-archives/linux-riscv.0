Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54402C369A2
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 08:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B98O30Xdb/WUB23GO9KzqHoKT8iQx/ezWRZAwk2dAnY=; b=Um2XOHYTWSnMAZ
	CDqddNEctJI13LWEtjXQ0RG/KJiGoGU/jYFuQ2zk+l/ZFQD9MtzxA8i8+FpHAMbceGbaQQMiHWNZ4
	VkM7xwMUpvjy1JKq1yCh5dKi22n1XIXoWGTTnPfn3x4meVKdApclM1re92H7zlnBya6pfbv8csVL+
	u0MXlY4jJvoWYx2+/+ssTlIka8gT/AUllXI+Zav3WVWpFOFxvS85BB8mmX6fgj/FzUSBzU99Iscv/
	c1Qy5sLB1A6EO3aOHvvQ2o0VUt0GuR/AIzuSNsEAUC4UkZJcsjzYTuLA+1vpXOvamRicCwGfNcYnR
	7lacnY0qVehZTsF086gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2QYN-00000006XYx-2SlY;
	Wed, 09 Apr 2025 08:12:59 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2QP1-00000006Vqw-3c7X
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 08:03:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DDCDC442BB;
	Wed,  9 Apr 2025 08:03:06 +0000 (UTC)
Message-ID: <fdf8f812-ae36-4327-b345-2df047b85e7a@ghiti.fr>
Date: Wed, 9 Apr 2025 10:03:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 13/28] prctl: arch-agnostic prctl for indirect branch
 tracking
Content-Language: en-US
To: Deepak Gupta <debug@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Christian Brauner <brauner@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com,
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com,
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com,
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org,
 rick.p.edgecombe@intel.com
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-13-e51202b53138@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250314-v5_user_cfi_series-v12-13-e51202b53138@rivosinc.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdehgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeeiudeileemjedtledumegugehfkeemjegttgegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeeiudeileemjedtledumegugehfkeemjegttgegpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeeiudeileemjedtledumegugehfkeemjegttgegngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeegkedprhgtphhtthhopeguvggsuhhgsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehmihhnghhosehrvgguhhgrthdrtghomhdprhgtphhtthhopegsp
 hesrghlihgvnhekrdguvgdprhgtphhtthhopegurghvvgdrhhgrnhhsvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepgiekieeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhhprgesiiihthhorhdrtghomhdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_010320_055619_A78F8319 
X-CRM114-Status: GOOD (  21.45  )
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

On 14/03/2025 22:39, Deepak Gupta wrote:
> Three architectures (x86, aarch64, riscv) have support for indirect branch
> tracking feature in a very similar fashion. On a very high level, indirect
> branch tracking is a CPU feature where CPU tracks branches which uses
> memory operand to perform control transfer in program. As part of this
> tracking on indirect branches, CPU goes in a state where it expects a
> landing pad instr on target and if not found then CPU raises some fault
> (architecture dependent)
>
> x86 landing pad instr - `ENDBRANCH`
> arch64 landing pad instr - `BTI`
> riscv landing instr - `lpad`
>
> Given that three major arches have support for indirect branch tracking,
> This patch makes `prctl` for indirect branch tracking arch agnostic.
>
> To allow userspace to enable this feature for itself, following prtcls are
> defined:
>   - PR_GET_INDIR_BR_LP_STATUS: Gets current configured status for indirect
>     branch tracking.
>   - PR_SET_INDIR_BR_LP_STATUS: Sets a configuration for indirect branch
>     tracking.
>     Following status options are allowed
>         - PR_INDIR_BR_LP_ENABLE: Enables indirect branch tracking on user
>           thread.
>         - PR_INDIR_BR_LP_DISABLE; Disables indirect branch tracking on user
>           thread.
>   - PR_LOCK_INDIR_BR_LP_STATUS: Locks configured status for indirect branch
>     tracking for user thread.
>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> ---
>   include/linux/cpu.h        |  4 ++++
>   include/uapi/linux/prctl.h | 27 +++++++++++++++++++++++++++
>   kernel/sys.c               | 30 ++++++++++++++++++++++++++++++
>   3 files changed, 61 insertions(+)
>
> diff --git a/include/linux/cpu.h b/include/linux/cpu.h
> index 6a0a8f1c7c90..fb0c394430c6 100644
> --- a/include/linux/cpu.h
> +++ b/include/linux/cpu.h
> @@ -204,4 +204,8 @@ static inline bool cpu_mitigations_auto_nosmt(void)
>   }
>   #endif
>   
> +int arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status);
> +int arch_set_indir_br_lp_status(struct task_struct *t, unsigned long status);
> +int arch_lock_indir_br_lp_status(struct task_struct *t, unsigned long status);
> +
>   #endif /* _LINUX_CPU_H_ */
> diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
> index 5c6080680cb2..6cd90460cbad 100644
> --- a/include/uapi/linux/prctl.h
> +++ b/include/uapi/linux/prctl.h
> @@ -353,4 +353,31 @@ struct prctl_mm_map {
>    */
>   #define PR_LOCK_SHADOW_STACK_STATUS      76
>   
> +/*
> + * Get the current indirect branch tracking configuration for the current
> + * thread, this will be the value configured via PR_SET_INDIR_BR_LP_STATUS.
> + */
> +#define PR_GET_INDIR_BR_LP_STATUS      77
> +
> +/*
> + * Set the indirect branch tracking configuration. PR_INDIR_BR_LP_ENABLE will
> + * enable cpu feature for user thread, to track all indirect branches and ensure
> + * they land on arch defined landing pad instruction.
> + * x86 - If enabled, an indirect branch must land on `ENDBRANCH` instruction.
> + * arch64 - If enabled, an indirect branch must land on `BTI` instruction.
> + * riscv - If enabled, an indirect branch must land on `lpad` instruction.
> + * PR_INDIR_BR_LP_DISABLE will disable feature for user thread and indirect
> + * branches will no more be tracked by cpu to land on arch defined landing pad
> + * instruction.
> + */
> +#define PR_SET_INDIR_BR_LP_STATUS      78
> +# define PR_INDIR_BR_LP_ENABLE		   (1UL << 0)


Are we missing PR_INDIR_BR_LP_DISABLE definition here?


> +
> +/*
> + * Prevent further changes to the specified indirect branch tracking
> + * configuration.  All bits may be locked via this call, including
> + * undefined bits.
> + */
> +#define PR_LOCK_INDIR_BR_LP_STATUS      79
> +
>   #endif /* _LINUX_PRCTL_H */
> diff --git a/kernel/sys.c b/kernel/sys.c
> index cb366ff8703a..f347f3518d0b 100644
> --- a/kernel/sys.c
> +++ b/kernel/sys.c
> @@ -2336,6 +2336,21 @@ int __weak arch_lock_shadow_stack_status(struct task_struct *t, unsigned long st
>   	return -EINVAL;
>   }
>   
> +int __weak arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
> +{
> +	return -EINVAL;
> +}
> +
> +int __weak arch_set_indir_br_lp_status(struct task_struct *t, unsigned long status)
> +{
> +	return -EINVAL;
> +}
> +
> +int __weak arch_lock_indir_br_lp_status(struct task_struct *t, unsigned long status)
> +{
> +	return -EINVAL;
> +}
> +
>   #define PR_IO_FLUSHER (PF_MEMALLOC_NOIO | PF_LOCAL_THROTTLE)
>   
>   #ifdef CONFIG_ANON_VMA_NAME
> @@ -2811,6 +2826,21 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
>   			return -EINVAL;
>   		error = arch_lock_shadow_stack_status(me, arg2);
>   		break;
> +	case PR_GET_INDIR_BR_LP_STATUS:
> +		if (arg3 || arg4 || arg5)
> +			return -EINVAL;
> +		error = arch_get_indir_br_lp_status(me, (unsigned long __user *)arg2);
> +		break;
> +	case PR_SET_INDIR_BR_LP_STATUS:
> +		if (arg3 || arg4 || arg5)
> +			return -EINVAL;
> +		error = arch_set_indir_br_lp_status(me, arg2);
> +		break;
> +	case PR_LOCK_INDIR_BR_LP_STATUS:
> +		if (arg3 || arg4 || arg5)
> +			return -EINVAL;
> +		error = arch_lock_indir_br_lp_status(me, arg2);
> +		break;
>   	default:
>   		trace_task_prctl_unknown(option, arg2, arg3, arg4, arg5);
>   		error = -EINVAL;
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
