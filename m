Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7370BC433E5
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 21:37:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AD4020656
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 21:37:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sAWfF3FB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="bhlOrFqq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AD4020656
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=piU63txstSqlzlNTx46ddQ7yWfUIVLnCSzsouJgGtMg=; b=sAWfF3FBR1c7MkaSC96MaaaCK
	bChXuLZodpccgTlQ/jz5NJ6KQ5kzGSgO9aNM0hXyEsX7LKQsuiEO08e+o4SgLO9M36GYROdkCfXIX
	BncgW2hnxa10e9o3Ae8M0ExEzh1cV/WTAvrqDEYPHx58gDWquR6sCRiB2qw5TuTpYRobRfuhLmjVL
	2+1DhP1Cp73po1NABknal9IgOgw9ae+zaUJh/+3GgV8Ghrt1Nj6pUruUc+ps8wEmN/wzqBGfxfBRg
	wCAO+7o+/pKj9n/CvzDx3DrlgUHu34zx+u3DsLhpdsQJTDl1Crgr5X2/7pZK8qTURris/oy5jGjof
	CO5cJeyFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvScE-00085T-Hn; Tue, 14 Jul 2020 21:37:30 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvScC-00084h-CU
 for linux-riscv@lists.infradead.org; Tue, 14 Jul 2020 21:37:29 +0000
Received: by mail-pg1-x542.google.com with SMTP id s189so3283357pgc.13
 for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2020 14:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=YJ0G1WscJm4FfZPiovvokq1HLkA2cFUNl9/Ll9hz56Y=;
 b=bhlOrFqq49tLbK37KIEbbFF0YS7WVT1j4BIcVWCY1z+DhlHPzW6Ei7oUWauYcOaeL0
 BUIyjZqvrIPiy2BmUEw3Usbqut8KFxSiSwaRmjXKgLGwoX2sR/TkIpKm8HjEmODSsGdr
 dKJ7hgWmGou4ifi3YJatsQP2zJYh9YXVvo5LjO8hJb21TbFIBeNUltyMRp9UvdoMDu60
 NkZX8ZospCIqOAqVNC3SA2RbnMTMIlKRjR1qLpRyf1d2d3sq6KeLA9LpOukqNgYuYLGo
 HSJXAv2DUlDDaoNE/gh2ZZZplHHA9r2+NsIZk6169hV7ZdCbVU10dUBBT0MTwlEx9Mva
 S3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=YJ0G1WscJm4FfZPiovvokq1HLkA2cFUNl9/Ll9hz56Y=;
 b=i/dA6PH/D3NGD6XIpkV5WMjh+ksHgs0tiz+lWRXONFhTUeVbNcjViygFDAsU5L7pzo
 QhZsCL8wf9pm68mnbM9MCQy5gG1NeaNFhXd6HCKLZChM//JNAZZo/0/GglFJ28OIuDar
 jmqo+kp6bIGsy8YCzS7pM6Yq9xx0pPD07GyrWblx3yP7N8uECPfi3ODYGnA5J/pUncCG
 oVYm6LiE9SKC3pPYNej5QpUcDDoWYxTEOv4V6ciYp/OguNuZZatr0XndPp1abmTHazDu
 GhrI1wVLlipGy3hVwJaAPPk4rWuvfeJ+3B721JtddB0VpNsxMShLh1gVvZKqliso1wU0
 UlLw==
X-Gm-Message-State: AOAM5336e1u0uZ7j2Dg92dfruPCRzldaMkSLqMdfC1nmqKe77rgaSzLB
 uqaEcQUSXYqNh80HPX2qJCS3kQ==
X-Google-Smtp-Source: ABdhPJx5GhHJyhVweUPdY3X0RJfcQ8peciN79Bv6P89HIfszH5h2UWvvhuZvNxkMJBuTpBesMjPIbA==
X-Received: by 2002:a63:dc50:: with SMTP id f16mr4714443pgj.19.1594762645146; 
 Tue, 14 Jul 2020 14:37:25 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 191sm110567pfw.150.2020.07.14.14.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 14:37:24 -0700 (PDT)
Date: Tue, 14 Jul 2020 14:37:24 -0700 (PDT)
X-Google-Original-Date: Tue, 14 Jul 2020 14:23:00 PDT (-0700)
Subject: Re: [PATCH v3 2/2] riscv: Enable per-task stack canaries
In-Reply-To: <1594397998-10221-2-git-send-email-guoren@kernel.org>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: guoren@kernel.org
Message-ID: <mhng-1f027fd5-a558-4bf4-8168-59a75f36caac@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_173728_552760_017618BD 
X-CRM114-Status: GOOD (  26.23  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: guoren@linux.alibaba.com, keescook@chromium.org, anup@brainfault.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 guoren@kernel.org, zong.li@sifive.com, Bjorn Topel <bjorn.topel@gmail.com>,
 cooper.qu@linux.alibaba.com, greentime.hu@sifive.com,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 10 Jul 2020 09:19:58 PDT (-0700), guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> This enables the use of per-task stack canary values if GCC has
> support for emitting the stack canary reference relative to the
> value of tp, which holds the task struct pointer in the riscv
> kernel.
>
> After compare arm64 and x86 implementations, seems arm64's is more
> flexible and readable. The key point is how gcc get the offset of
> stack_canary from gs/el0_sp.
>
> x86: Use a fix offset from gs, not flexible.
>
> struct fixed_percpu_data {
> 	/*
> 	 * GCC hardcodes the stack canary as %gs:40.  Since the
> 	 * irq_stack is the object at %gs:0, we reserve the bottom
> 	 * 48 bytes of the irq stack for the canary.
> 	 */
> 	char            gs_base[40]; // :(
> 	unsigned long   stack_canary;
> };
>
> arm64: Use -mstack-protector-guard-offset & guard-reg
> 	gcc options:
> 	-mstack-protector-guard=sysreg
> 	-mstack-protector-guard-reg=sp_el0
> 	-mstack-protector-guard-offset=xxx
>
> riscv: Use -mstack-protector-guard-offset & guard-reg
> 	gcc options:
> 	-mstack-protector-guard=tls
> 	-mstack-protector-guard-reg=tp
> 	-mstack-protector-guard-offset=xxx
>
> Here is riscv gcc's work [1].
>
> [1] https://gcc.gnu.org/pipermail/gcc-patches/2020-July/549583.html
>
> In the end, these codes are inserted by gcc before return:
>
> *  0xffffffe00020b396 <+120>:   ld      a5,1008(tp) # 0x3f0
> *  0xffffffe00020b39a <+124>:   xor     a5,a5,a4
> *  0xffffffe00020b39c <+126>:   mv      a0,s5
> *  0xffffffe00020b39e <+128>:   bnez    a5,0xffffffe00020b61c <_do_fork+766>
>    0xffffffe00020b3a2 <+132>:   ld      ra,136(sp)
>    0xffffffe00020b3a4 <+134>:   ld      s0,128(sp)
>    0xffffffe00020b3a6 <+136>:   ld      s1,120(sp)
>    0xffffffe00020b3a8 <+138>:   ld      s2,112(sp)
>    0xffffffe00020b3aa <+140>:   ld      s3,104(sp)
>    0xffffffe00020b3ac <+142>:   ld      s4,96(sp)
>    0xffffffe00020b3ae <+144>:   ld      s5,88(sp)
>    0xffffffe00020b3b0 <+146>:   ld      s6,80(sp)
>    0xffffffe00020b3b2 <+148>:   ld      s7,72(sp)
>    0xffffffe00020b3b4 <+150>:   addi    sp,sp,144
>    0xffffffe00020b3b6 <+152>:   ret
>    ...
> *  0xffffffe00020b61c <+766>:   auipc   ra,0x7f8
> *  0xffffffe00020b620 <+770>:   jalr    -1764(ra) # 0xffffffe000a02f38 <__stack_chk_fail>
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: cooper <cooper.qu@linux.alibaba.com>

IIRC we're required to use full names here.  I'm assuming that's meant to be
"Signed-off-by: Cooper Qu ...", and I know it's a bit procedural but I can't
make that change.

Otherwise these two look good, the first one is on for-next.  I can boot with a
defconfig ammended with CONFIG_STACKPROTECTOR=y, 

Thanks!

> Cc: cooper <cooper.qu@linux.alibaba.com>
> Cc: Kees Cook <keescook@chromium.org>
> ---
> Change v2:
>  - Change to -mstack-protector-guard=tls for gcc final define
>  - Solve compile error by changing position of KBUILD_CFLAGS in
>    Makefile
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> ---
>  arch/riscv/Kconfig                      |  7 +++++++
>  arch/riscv/Makefile                     | 10 ++++++++++
>  arch/riscv/include/asm/stackprotector.h |  3 ++-
>  arch/riscv/kernel/asm-offsets.c         |  3 +++
>  arch/riscv/kernel/process.c             |  2 +-
>  5 files changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 4b0e308..d98ce29 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -394,6 +394,13 @@ config CMDLINE_FORCE
>
>  endchoice
>
> +config CC_HAVE_STACKPROTECTOR_TLS
> +	def_bool $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=tp -mstack-protector-guard-offset=0)
> +
> +config STACKPROTECTOR_PER_TASK
> +	def_bool y
> +	depends on STACKPROTECTOR && CC_HAVE_STACKPROTECTOR_TLS
> +
>  endmenu
>
>  config BUILTIN_DTB
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index fb6e37d..f5f8ee9 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -68,6 +68,16 @@ KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-relax)
>  # architectures.  It's faster to have GCC emit only aligned accesses.
>  KBUILD_CFLAGS += $(call cc-option,-mstrict-align)
>
> +ifeq ($(CONFIG_STACKPROTECTOR_PER_TASK),y)
> +prepare: stack_protector_prepare
> +stack_protector_prepare: prepare0
> +	$(eval KBUILD_CFLAGS += -mstack-protector-guard=tls		  \
> +				-mstack-protector-guard-reg=tp		  \
> +				-mstack-protector-guard-offset=$(shell	  \
> +			awk '{if ($$2 == "TSK_STACK_CANARY") print $$3;}' \
> +					include/generated/asm-offsets.h))
> +endif
> +
>  # arch specific predefines for sparse
>  CHECKFLAGS += -D__riscv -D__riscv_xlen=$(BITS)
>
> diff --git a/arch/riscv/include/asm/stackprotector.h b/arch/riscv/include/asm/stackprotector.h
> index d95f7b2..a895e07 100644
> --- a/arch/riscv/include/asm/stackprotector.h
> +++ b/arch/riscv/include/asm/stackprotector.h
> @@ -28,6 +28,7 @@ static __always_inline void boot_init_stack_canary(void)
>  	canary &= CANARY_MASK;
>
>  	current->stack_canary = canary;
> -	__stack_chk_guard = current->stack_canary;
> +	if (!IS_ENABLED(CONFIG_STACKPROTECTOR_PER_TASK))
> +		__stack_chk_guard = current->stack_canary;
>  }
>  #endif /* _ASM_RISCV_STACKPROTECTOR_H */
> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
> index 07cb9c1..999b465 100644
> --- a/arch/riscv/kernel/asm-offsets.c
> +++ b/arch/riscv/kernel/asm-offsets.c
> @@ -29,6 +29,9 @@ void asm_offsets(void)
>  	OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
>  	OFFSET(TASK_THREAD_SP, task_struct, thread.sp);
>  	OFFSET(TASK_STACK, task_struct, stack);
> +#ifdef CONFIG_STACKPROTECTOR
> +	OFFSET(TSK_STACK_CANARY, task_struct, stack_canary);
> +#endif
>  	OFFSET(TASK_TI, task_struct, thread_info);
>  	OFFSET(TASK_TI_FLAGS, task_struct, thread_info.flags);
>  	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 6548929..cb4ac65 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -24,7 +24,7 @@
>
>  register unsigned long gp_in_global __asm__("gp");
>
> -#ifdef CONFIG_STACKPROTECTOR
> +#if defined(CONFIG_STACKPROTECTOR) && !defined(CONFIG_STACKPROTECTOR_PER_TASK)
>  #include <linux/stackprotector.h>
>  unsigned long __stack_chk_guard __read_mostly;
>  EXPORT_SYMBOL(__stack_chk_guard);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
