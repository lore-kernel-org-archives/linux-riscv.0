Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B234FC6165
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 00:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KAFcL2fC9gaKEQjTrZrW2BLHisDkJCKD/Y5qN7AWzng=; b=iWNjM+UlahVEJy
	AZl9yEeyvId53CiNPLSuPiAgeQ2OsFVzeFvyiGAEjzUhtalJHKMY8cz2X3jK8nJSvarUay1Hte01q
	CeAld7bnE4U/5K1ZM1yGTF3MpL+W111ydtCT4hHpoRCM22a7MvTC0ZfL5IkjG1S/+WZAFczA3OdAr
	iNalVbsjKRJ+p978g9YirV27Sir/AGYMj0ZPwOeNQEmTKBZNflSLQOneH9nInZL5M6EO0ERZtwHPg
	7AzJORNxBOGvkn7I+W8R+V8/y4GJcRvK1Ca6SP1W9vNCR7FPK9L4gL9/zIs7FJ75yVf/PxbbEh8jK
	eVCUM2o/UvukMwvitiMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbpTw-00000008oTz-33iH;
	Sat, 03 Jan 2026 00:27:00 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbpTu-00000008oTb-0kMh
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 00:26:59 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-64baaa754c6so13921328a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 Jan 2026 16:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767400016; x=1768004816; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lu2XOwAewPAf2hIqWYAVG0zECJ1HMFf+2EIxiKJs26A=;
        b=i5yak7p/S11nMDo9AvIOhZJNm1w2+fkX0V04Y/hy5VdO9sC58H2FntkwQ8d18lzlrX
         6YmtO82fqazbGo4OtpI6TcyaTrkOfHt1sQCSVvu8C+8yDKdTx50egMSvyeszSpt2FbZL
         CHqkOFDyxr0CqC467cXbdcQEn2FPxnovbG211kkyhhZGq/s1dPE0Vd8pwGRoZBNGcMRh
         ad+kDzRIVix2PLKtdB5u87Uo3O+nmHn6gLH4Fk8FMu1BhEQmkyfX+vJiiAzIoRWYpgp+
         z3Ml/wYsPA7ALHtl50YczPEGAnDmaQLM4QpLE74c9d9RzADLhp3RcvK1t48GKDz5sOrV
         fcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767400016; x=1768004816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lu2XOwAewPAf2hIqWYAVG0zECJ1HMFf+2EIxiKJs26A=;
        b=bgZ9MP7gBJUYVAU1gROzvtW8rNR9qAtm0l6MPV6oY2uucY8nx7F6s3PKUC5hYMxfGC
         XlHOLIHVxooxWCMY+14hT2n4W/6qSsSvn25qOLIHD4xmaFtuPutO6ex6VlNmlK2qF3s7
         jnzY7IX+8I4Gesoe21v9EVmlRFj35aP8sAjwrYrID7rOt1AfLZr8vhp2Fpl2hl+zGuil
         FwQf84zQKq18nosDAQtRGCTSv2sNem7Z4YDf0uf93brHqvAk9uVwVYwFze89/XV1NcZ9
         0z+rKdOgq/EXPfEZp9uDGKcgcoPll37ZARbG8qkijyAxKjtU9Vchh6EN+NCnozhVHzA2
         AAGA==
X-Forwarded-Encrypted: i=1; AJvYcCVEIFxZU6z0kEitDxi7IfK+lFm6nHocpzKSDap3YDTqeXybm60yaZ8KWsmfwf8BagYEtJDqg9tKzPmprw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzndBp94WcCIyInIVUrixROFyCn8QNJw/C6Z4TOH/W9ngVKTlub
	QzdOvJIpFLeZs1nV2htZzUFlu5FaKwO5tDgd1gYIO4iHIsE7R6goYEyI
X-Gm-Gg: AY/fxX5NEnV2H4G0k2w7zLlIscAFRDFbxOdm9lHJffr75g9rEk3d4fw5W41TlE2eHuo
	VvyW44TZ76iw2dBwYIHFmtMERF0YayFUcaAFLwH8YqUhJgm9U84azh8IoonBKi1/LM2gk0zHBB1
	gozbO1Y5kjGuEeaw5zhol0jxdMtyfNu4VgHiazI+dWUbVKpR8wQ9E93kjIHu5zLqqURi4K2WuOA
	MLMrbWheV6qbZc78hzo3RWAIawSmqOQEHYoaDxeE9lrKeRvo5MGsDDy87ZLaTZnBKjFkJe/AB3X
	PsTU795lpBHG2SxSoLNYc3LMLyQauBzNhhuEGKQ9XtvQiGS+dG5OBJmshotz5hTvw8+3oUIqhiT
	aOnU6cLRu2SonrM+5jMNPirOfi36CB+aHcpz2AmwLQiGJdQjpRTKuSApjctqxh6/SYdvLuMU9pH
	9myl/3bN3TjZtAXDBYLvvP1k1oJrdR38o6AWYR2pemgQ2WjZ1s57FT
X-Google-Smtp-Source: AGHT+IFdvdEcrAIYSA22XzNr2wKPflwtXqsVf2mK8AXHiedc5sR4d+y6uOcJKoLds0TT7gNd5aiiog==
X-Received: by 2002:a05:600c:458e:b0:47a:9560:ec28 with SMTP id 5b1f17b1804b1-47d19566d27mr540529425e9.13.1767393875116;
        Fri, 02 Jan 2026 14:44:35 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d452c69sm6169675e9.9.2026.01.02.14.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 14:44:34 -0800 (PST)
Date: Fri, 2 Jan 2026 22:44:32 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Jeremy
 Linton <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v3 1/3] randomize_kstack: Maintain kstack_offset per
 task
Message-ID: <20260102224432.172b1247@pumpkin>
In-Reply-To: <20260102131156.3265118-2-ryan.roberts@arm.com>
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
	<20260102131156.3265118-2-ryan.roberts@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_162658_537447_223BC5B9 
X-CRM114-Status: GOOD (  37.21  )
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

On Fri,  2 Jan 2026 13:11:52 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> kstack_offset was previously maintained per-cpu, but this caused a
> couple of issues. So let's instead make it per-task.
> 
> Issue 1: add_random_kstack_offset() and choose_random_kstack_offset()
> expected and required to be called with interrupts and preemption
> disabled so that it could manipulate per-cpu state. But arm64, loongarch
> and risc-v are calling them with interrupts and preemption enabled. I
> don't _think_ this causes any functional issues, but it's certainly
> unexpected and could lead to manipulating the wrong cpu's state, which
> could cause a minor performance degradation due to bouncing the cache
> lines. By maintaining the state per-task those functions can safely be
> called in preemptible context.
> 
> Issue 2: add_random_kstack_offset() is called before executing the
> syscall and expands the stack using a previously chosen rnadom offset.
                                                           <>
	David

> choose_random_kstack_offset() is called after executing the syscall and
> chooses and stores a new random offset for the next syscall. With
> per-cpu storage for this offset, an attacker could force cpu migration
> during the execution of the syscall and prevent the offset from being
> updated for the original cpu such that it is predictable for the next
> syscall on that cpu. By maintaining the state per-task, this problem
> goes away because the per-task random offset is updated after the
> syscall regardless of which cpu it is executing on.
> 
> Fixes: 39218ff4c625 ("stack: Optionally randomize kernel stack offset each syscall")
> Closes: https://lore.kernel.org/all/dd8c37bc-795f-4c7a-9086-69e584d8ab24@arm.com/
> Cc: stable@vger.kernel.org
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  include/linux/randomize_kstack.h | 26 +++++++++++++++-----------
>  include/linux/sched.h            |  4 ++++
>  init/main.c                      |  1 -
>  kernel/fork.c                    |  2 ++
>  4 files changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/include/linux/randomize_kstack.h b/include/linux/randomize_kstack.h
> index 1d982dbdd0d0..5d3916ca747c 100644
> --- a/include/linux/randomize_kstack.h
> +++ b/include/linux/randomize_kstack.h
> @@ -9,7 +9,6 @@
>  
>  DECLARE_STATIC_KEY_MAYBE(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,
>  			 randomize_kstack_offset);
> -DECLARE_PER_CPU(u32, kstack_offset);
>  
>  /*
>   * Do not use this anywhere else in the kernel. This is used here because
> @@ -50,15 +49,14 @@ DECLARE_PER_CPU(u32, kstack_offset);
>   * add_random_kstack_offset - Increase stack utilization by previously
>   *			      chosen random offset
>   *
> - * This should be used in the syscall entry path when interrupts and
> - * preempt are disabled, and after user registers have been stored to
> - * the stack. For testing the resulting entropy, please see:
> - * tools/testing/selftests/lkdtm/stack-entropy.sh
> + * This should be used in the syscall entry path after user registers have been
> + * stored to the stack. Preemption may be enabled. For testing the resulting
> + * entropy, please see: tools/testing/selftests/lkdtm/stack-entropy.sh
>   */
>  #define add_random_kstack_offset() do {					\
>  	if (static_branch_maybe(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,	\
>  				&randomize_kstack_offset)) {		\
> -		u32 offset = raw_cpu_read(kstack_offset);		\
> +		u32 offset = current->kstack_offset;			\
>  		u8 *ptr = __kstack_alloca(KSTACK_OFFSET_MAX(offset));	\
>  		/* Keep allocation even after "ptr" loses scope. */	\
>  		asm volatile("" :: "r"(ptr) : "memory");		\
> @@ -69,9 +67,9 @@ DECLARE_PER_CPU(u32, kstack_offset);
>   * choose_random_kstack_offset - Choose the random offset for the next
>   *				 add_random_kstack_offset()
>   *
> - * This should only be used during syscall exit when interrupts and
> - * preempt are disabled. This position in the syscall flow is done to
> - * frustrate attacks from userspace attempting to learn the next offset:
> + * This should only be used during syscall exit. Preemption may be enabled. This
> + * position in the syscall flow is done to frustrate attacks from userspace
> + * attempting to learn the next offset:
>   * - Maximize the timing uncertainty visible from userspace: if the
>   *   offset is chosen at syscall entry, userspace has much more control
>   *   over the timing between choosing offsets. "How long will we be in
> @@ -85,14 +83,20 @@ DECLARE_PER_CPU(u32, kstack_offset);
>  #define choose_random_kstack_offset(rand) do {				\
>  	if (static_branch_maybe(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,	\
>  				&randomize_kstack_offset)) {		\
> -		u32 offset = raw_cpu_read(kstack_offset);		\
> +		u32 offset = current->kstack_offset;			\
>  		offset = ror32(offset, 5) ^ (rand);			\
> -		raw_cpu_write(kstack_offset, offset);			\
> +		current->kstack_offset = offset;			\
>  	}								\
>  } while (0)
> +
> +static inline void random_kstack_task_init(struct task_struct *tsk)
> +{
> +	tsk->kstack_offset = 0;
> +}
>  #else /* CONFIG_RANDOMIZE_KSTACK_OFFSET */
>  #define add_random_kstack_offset()		do { } while (0)
>  #define choose_random_kstack_offset(rand)	do { } while (0)
> +#define random_kstack_task_init(tsk)		do { } while (0)
>  #endif /* CONFIG_RANDOMIZE_KSTACK_OFFSET */
>  
>  #endif
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index d395f2810fac..9e0080ed1484 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1591,6 +1591,10 @@ struct task_struct {
>  	unsigned long			prev_lowest_stack;
>  #endif
>  
> +#ifdef CONFIG_RANDOMIZE_KSTACK_OFFSET
> +	u32				kstack_offset;
> +#endif
> +
>  #ifdef CONFIG_X86_MCE
>  	void __user			*mce_vaddr;
>  	__u64				mce_kflags;
> diff --git a/init/main.c b/init/main.c
> index b84818ad9685..27fcbbde933e 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -830,7 +830,6 @@ static inline void initcall_debug_enable(void)
>  #ifdef CONFIG_RANDOMIZE_KSTACK_OFFSET
>  DEFINE_STATIC_KEY_MAYBE_RO(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,
>  			   randomize_kstack_offset);
> -DEFINE_PER_CPU(u32, kstack_offset);
>  
>  static int __init early_randomize_kstack_offset(char *buf)
>  {
> diff --git a/kernel/fork.c b/kernel/fork.c
> index b1f3915d5f8e..b061e1edbc43 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -95,6 +95,7 @@
>  #include <linux/thread_info.h>
>  #include <linux/kstack_erase.h>
>  #include <linux/kasan.h>
> +#include <linux/randomize_kstack.h>
>  #include <linux/scs.h>
>  #include <linux/io_uring.h>
>  #include <linux/bpf.h>
> @@ -2231,6 +2232,7 @@ __latent_entropy struct task_struct *copy_process(
>  	if (retval)
>  		goto bad_fork_cleanup_io;
>  
> +	random_kstack_task_init(p);
>  	stackleak_task_init(p);
>  
>  	if (pid != &init_struct_pid) {


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
