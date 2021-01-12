Return-Path: <SRS0=7m3b=GP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 791ECC433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Jan 2021 23:23:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE33323123
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Jan 2021 23:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE33323123
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=iChD3ghWCnnVxkeo+v/xBc6eyQviRGa2ajSmAJUM2Cs=; b=n5o7DClzW8kqF2uVkrgDEsSpH
	2bxSK1BfM9yjDhAwF0sUtOKrjtT9KM4m6gBd7RuZRAmmBECVhiapn8wAZsn2CsAmp8PM7NvARSNr/
	/YKcc6QS633MoQroPv7LnoAs4cLCGx26wZEj4myd+saBL1kDZiSAN/zXd3hUA9Pv63hx2Qc91Dlyn
	i97WAbx+GCgIBWtldRi7y03j5yv2yv9kVhzRKXKp+i7Ds+n4Fmi3H0Qg7fiMNP60maOLQnYnojZ9m
	q9yJSR2WCZWEYo73fGNfFzQglnkWaTp/A5iIdj89iUUYSA4sntyuHO5HoCao0HNJbinNBKmhgPH4Z
	wIxm/y46g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzT07-00015h-1V; Tue, 12 Jan 2021 23:22:59 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzT03-00013L-25
 for linux-riscv@lists.infradead.org; Tue, 12 Jan 2021 23:22:56 +0000
Received: by mail-pf1-x435.google.com with SMTP id m6so57517pfk.1
 for <linux-riscv@lists.infradead.org>; Tue, 12 Jan 2021 15:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=auxzT8WGE14tQXppI+shw5Rz30NghYVmvwU0Vp5iL5k=;
 b=VyfqD7Hmw6QHBNOGpfz7VAedmZJbr38CvUUjNYsf339XkhPbpiP1pAyR1SfboNtHXY
 Jal/49YETAgcA31pn7zRGcgrY9h2PKK+UNzssj1Y1riAMrk/hpQW1BAkF8tCWtyvYHal
 rrW13Yswc47+740p+USRxQmcG8X2EmTobHol6tmkWMRsKs/eIFccHvA3dphT1JjS8oEj
 KNevcfnLooBv6H7M5f4ZwEhajmLjAo5zZvVaDT8GIy/BzBkIbtdnOYa0456kWZhnpyAW
 z+0m2vhw1+bLZfvZbgCHnldoKS4lra3tTscnUQnaHqYLqqlQGyBMYhl4XNuRqbuATIje
 C4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=auxzT8WGE14tQXppI+shw5Rz30NghYVmvwU0Vp5iL5k=;
 b=lfmMG8YkLwEc2H5WPVYBpIaaA38kh9G5FleGo57hXM+yi8osY2GFbgKtKHqhj1TFMM
 aEvBz8KPVtxu/4/d2+CxpScyofcFEBB4Ev8s8W6ggJZQis5JoOhQWvhnGn6/If/LU9y7
 Gaxi+xp1VCBJMFpj3+aM/b4pGZd/WePgwW1iL4bxaytjzjkKIX0fmULgCZbg85rUmJQi
 bvD+hb6R1h6fPZilCQWeN2R7q0idPN781OnjohJaGFxafMBuffNmTYtMCarYfDInWrbe
 pXP0TBt+1Zgutdsptyi3jd5SdMhxewFhrkbwOGIlprS9K4fjgBzOs9swk5lSJ+z/0zZp
 Phxw==
X-Gm-Message-State: AOAM533rwR7D0/n2vQxxRikLir2L3FdQW3V1uKXzyveDBZ9Yr6DnP0U9
 mMGYpSuwczRHvw5QHz9ByHi2Qw==
X-Google-Smtp-Source: ABdhPJzFsGLD7kbS0RgvUR/OZyK9T2638CjYYZ8WQkg+IBAQpIy2f6o7FuoAxQiJst7JYje/ZHTjtw==
X-Received: by 2002:aa7:9f0f:0:b029:19b:c68f:61cd with SMTP id
 g15-20020aa79f0f0000b029019bc68f61cdmr1538881pfr.45.1610493771433; 
 Tue, 12 Jan 2021 15:22:51 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id h5sm17749pgl.86.2021.01.12.15.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 15:22:50 -0800 (PST)
Date: Tue, 12 Jan 2021 15:22:50 -0800 (PST)
X-Google-Original-Date: Tue, 12 Jan 2021 15:22:48 PST (-0800)
Subject: Re: [PATCH RESEND v4] riscv: Enable per-task stack canaries
In-Reply-To: <1608222558-6677-1-git-send-email-guoren@kernel.org>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: guoren@kernel.org
Message-ID: <mhng-a07967fd-5808-4550-a909-954f1a25b53b@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_182255_264671_8E6B19B1 
X-CRM114-Status: GOOD (  29.68  )
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

On Thu, 17 Dec 2020 08:29:18 PST (-0800), guoren@kernel.org wrote:
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
>  GCC's implementation has been merged:
>  commit c931e8d5a96463427040b0d11f9c4352ac22b2b0
>  Author: Cooper Qu <cooper.qu@linux.alibaba.com>
>  Date:   Mon Jul 13 16:15:08 2020 +0800
>
>      RISC-V: Add support for TLS stack protector canary access
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
> Signed-off-by: Cooper Qu <cooper.qu@linux.alibaba.com>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
>  arch/riscv/Kconfig                      |  7 +++++++
>  arch/riscv/Makefile                     | 10 ++++++++++
>  arch/riscv/include/asm/stackprotector.h |  3 ++-
>  arch/riscv/kernel/asm-offsets.c         |  3 +++
>  arch/riscv/kernel/process.c             |  2 +-
>  5 files changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index a627ae2..3d9daee 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -420,6 +420,13 @@ config EFI
>  	  allow the kernel to be booted as an EFI application. This
>  	  is only useful on systems that have UEFI firmware.
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
> index b6eb946..508de08 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -67,6 +67,16 @@ KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-relax)
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
> index 5962f88..09093af 100644
> --- a/arch/riscv/include/asm/stackprotector.h
> +++ b/arch/riscv/include/asm/stackprotector.h
> @@ -24,6 +24,7 @@ static __always_inline void boot_init_stack_canary(void)
>  	canary &= CANARY_MASK;
>
>  	current->stack_canary = canary;
> -	__stack_chk_guard = current->stack_canary;
> +	if (!IS_ENABLED(CONFIG_STACKPROTECTOR_PER_TASK))
> +		__stack_chk_guard = current->stack_canary;
>  }
>  #endif /* _ASM_RISCV_STACKPROTECTOR_H */
> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
> index db20344..877ff65 100644
> --- a/arch/riscv/kernel/asm-offsets.c
> +++ b/arch/riscv/kernel/asm-offsets.c
> @@ -66,6 +66,9 @@ void asm_offsets(void)
>  	OFFSET(TASK_THREAD_F30, task_struct, thread.fstate.f[30]);
>  	OFFSET(TASK_THREAD_F31, task_struct, thread.fstate.f[31]);
>  	OFFSET(TASK_THREAD_FCSR, task_struct, thread.fstate.fcsr);
> +#ifdef CONFIG_STACKPROTECTOR
> +	OFFSET(TSK_STACK_CANARY, task_struct, stack_canary);
> +#endif
>
>  	DEFINE(PT_SIZE, sizeof(struct pt_regs));
>  	OFFSET(PT_EPC, pt_regs, epc);
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index dd5f985..f786b5f 100644
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

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
