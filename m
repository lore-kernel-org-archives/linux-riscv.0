Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F72C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 20:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qwV5vy32mJlZYnO48S/NiYb7nwdXpxshI92jfqjReug=; b=A6gv/qmNo+OuRi
	OB20NyMCiJsRChbGKZCH1UN9iOHcCwpcXjcIuQDtgNkjv/s+7VvRni0lNKkzkkQNzgF8Z+GgE2AhU
	lsqiPT6mrLxtzSE5M7evIVgxnxssRMyPqbk7WlDTyeLozvIHm03nJF03RaWtWxDI9iwJqvq/oF3mH
	W0mnYlmjV2BT22ljqojXpTr+y1XWb9sC88RgDDKSzZiJQ/E6MtiPJpgp2Kt/dpoVzlC8l2DoyzgbM
	yBPkRbSgmiJi8L/PYujBKDfyfhuko2V/Xw1WWCyUoTw3j0mFIsKsSaEGbxl17eKrLqAaQz3I/YVW1
	CUdGSX7j3EVrJ4AJWMbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whvAk-00000003Yhp-2P7f;
	Thu, 09 Jul 2026 20:16:38 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whvAh-00000003YgV-3lWz
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 20:16:37 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2cad8076b01so1755395ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2026 13:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783628195; x=1784232995; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5lqgggpghOuMWXpzCLQ94POSykk42wtAfFSu9QYNYOQ=;
        b=T+sPNz1J59zPc7pkb8sEYVxWIJp7pHwwY3HiWfuL34CCAIPN6/9Wr7msOnKUmgG9A9
         MI1qK1qsSMSra+Ppq56eYhzLnhu0IkQ0uF9GMxF2KFy7XixVosgDuSvdiN2HonDALxL6
         87YiHEm/MaAQEMZs3P7q1UuCGQC99/C3C72OcqlnDko5OC/Kc2WlX0ArgnY2h7MNPWjl
         JYUlpE1Jr8tlpf4LD6GLJb0Kxdd09xEJKWQ8bJPtXpt3FGkvVHPncQOKqMZqJDPtmw57
         vwZCYjMZHNRXXj7ZBcdHeMr3FhVBH1FJ0jW9osvkcpG8jmW/X6hbVxNk6lLPVVHLlhUQ
         bThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783628195; x=1784232995;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5lqgggpghOuMWXpzCLQ94POSykk42wtAfFSu9QYNYOQ=;
        b=YOuGVHMBX0qs6nq6ztGIbymfLQXVtMx3gi3/RLAsooCJshyBUAycGJYIB4fKgKT+0G
         zXvVPX1R0ZRZr5qtixcu3NhJh3qI9KtDzA6hvUDdi7wVgCQb7wTIrTZ2EFK/4Md+vd1R
         FmMOcS2HMjv0zjp3VEcvJQ4d3CicSvtmkPOUx9IiJ126U+/Rs2nXuO4AvAY2Yqs2W7L6
         oMO/mlFLoUSWkpHTt1zc1b+30bnwJ/IMNigEIPlTZoMeAcxuoI8E/AWj3Tbx7PqsVHKY
         NQcFBGDBY/DNCqEn9Y+jVGKJBLAqoaO3ti2w5iL8bBFPeiwTb8zx6WyQemK/+bqQ5/qN
         PQYQ==
X-Forwarded-Encrypted: i=1; AHgh+RoVU1eMh5iyVGmw4gUbRB5eoxoCicQXnweT0hh5v5E/Zh+HTsowapewhJQKl7/nxhn6aYTLS4+evidaUw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbBKfDCCdpzUP8aWKXm4b3gnkWhOB7snLLj+zZ+3afoTbXK2rY
	eJb9KiIvKB79xsEKvokpbSKNfugDhxT15nsoFGVDbdi7XeBLp+ovUqQR
X-Gm-Gg: AfdE7cl2KeZ01q2gg95E1Slmkss3n7Nxap6wmupLzo9xtcvh274cofXTEEbgrb4R1k7
	gRJsFNJ/UjmTRd8M8mq/TeBRoPaYPgyWRRzsS++lQbtv6JQptvz5vxbfSI0eiC0cNbYu6rCvw3A
	NfW7i0tU362463qwzibYxZXyvwcoMwpmgSLu3p2sa4MA3SUaNJI6cO6Iwk3gyuNPUoTo7Wcwsbo
	wi8bKgy2WOu59goxa4xooP7DHuEaWK5WqK2hNBJwWa8MylK2PPDiT9jW7x3O5iP1snw6e49hHbs
	Yqxb04b0urfhe8iEz9gW+CEABBACsgqyyjjLruZRDQBmAvQx7lsI/3PSdTTRjWbQCftxSyHtsPz
	TiSfeg4B0xDZ5JWC7t4e7thRmtl0O7UfIh7OXV240tPcBXvanzT8FppVwzPeKcz3vF/MoNfw5LU
	HmBFG0+fk/XAmBSQdOSeAnhEX2j4HPiaif9lc8q4MGlccJUfoTs1s58FoDFhlV
X-Received: by 2002:a05:6a20:12d0:b0:3b1:882a:607b with SMTP id adf61e73a8af0-3c0bc95630amr10563387637.22.1783628195005;
        Thu, 09 Jul 2026 13:16:35 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a583bcsm38446663eec.19.2026.07.09.13.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 13:16:34 -0700 (PDT)
Date: Fri, 10 Jul 2026 01:46:15 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>, 
	linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, 
	Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [patch 03/18] entry: Provide
 [syscall_]enter_from_user_mode_randomize_stack()
Message-ID: <alABgaW3OpGvH_Oc@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190253.816918647@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260707190253.816918647@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_131635_962643_07212F3A 
X-CRM114-Status: GOOD (  26.81  )
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

On Tue, Jul 07, 2026 at 09:06:07PM +0200, Thomas Gleixner wrote:
> Randomizing the syscall stack can only happen after state is established
> via enter_from_user_mode() or syscall_enter_from_user_mode(). The earlier
> it happens the better.
> 
> Provide two new macros to consolidate that:
> 
>   - enter_from_user_mode_randomize_stack()
> 	enter_from_user_mode();
> 	add_random_kstack_offset_irqsoff();
> 
>   - syscall_enter_from_user_mode_randomize_stack()
> 	enter_from_user_mode_randomize_stack();
> 	syscall_enter_from_user_mode_work();
>     
> to reduce boiler plate code.
> 
> Those are macros and not inline functions as the latter would limit the
> stack randomization scope to the inline function itself.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> ---
>  include/linux/entry-common.h |   56 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -6,6 +6,7 @@
>  #include <linux/irq-entry-common.h>
>  #include <linux/livepatch.h>
>  #include <linux/ptrace.h>
> +#include <linux/randomize_kstack.h>
>  #include <linux/resume_user_mode.h>
>  #include <linux/seccomp.h>
>  #include <linux/sched.h>
> @@ -150,6 +151,61 @@ static __always_inline long syscall_ente
>  }
>  
>  /**
> + * enter_from_user_mode_randomize_stack - Establish state and add stack randomization
> + *					  before invoking syscall_enter_from_user_mode_work()
> + * @regs:	Pointer to currents pt_regs
> + *
> + * Invoked from architecture specific syscall entry code with interrupts
> + * disabled. The calling code has to be non-instrumentable. When the function
> + * returns all state is correct, interrupts are still disabled and the
> + * subsequent functions can be instrumented.
> + *
> + * Implemented as a macro so that the stack randomization is effective
> + * throughout the function in which it is invoked. An inline would only make it
> + * effective in the scope of the inline function.
> + */
> +#define enter_from_user_mode_randomize_stack(regs)			\
> +do {									\
> +	enter_from_user_mode(regs);					\
> +	instrumentation_begin();					\
> +	add_random_kstack_offset_irqsoff();				\
> +	instrumentation_end();						\
> +} while (0)
> +
> +/**
> + * syscall_enter_from_user_mode_randomize_stack - Establish state and check and handle work
> + *						  before invoking a syscall
> + * @regs:	Pointer to currents pt_regs
> + * @syscall:	The syscall number
> + *
> + * Invoked from architecture specific syscall entry code with interrupts
> + * disabled. The calling code has to be non-instrumentable. When the
> + * function returns all state is correct, interrupts are enabled and the
> + * subsequent functions can be instrumented.
> + *
> + * This is the combination of enter_from_user_mode_randomize_stack() and
> + * syscall_enter_from_user_mode_work() to be used when there is no
> + * architecture specific work to be done between the two.
> + *
> + * Returns: The original or a modified syscall number. See
> + * syscall_enter_from_user_mode_work() for further explanation.
> + *
> + * Implemented as a macro to make stack randomization effective in the calling
> + * scope.
> + */
> +#define syscall_enter_from_user_mode_randomize_stack(regs, syscall)	\
> +({									\
> +	enter_from_user_mode_randomize_stack(regs);			\
> +									\
> +	instrumentation_begin();					\
> +	local_irq_enable();						\
> +	long _ret = syscall_enter_from_user_mode_work(regs, syscall);	\
> +	instrumentation_end();						\
> +									\
> +	_ret;								\
> +})
> +
> +/**
>   * syscall_enter_from_user_mode - Establish state and check and handle work
>   *				  before invoking a syscall
>   * @regs:	Pointer to currents pt_regs
> 
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> 
> _______________________________________________
> linux-snps-arc mailing list
> linux-snps-arc@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-snps-arc

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
