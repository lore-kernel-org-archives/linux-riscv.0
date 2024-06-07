Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008A6C27C53
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2024 21:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WTeZbmjP3e2zUxYAsoiAo7IlwHq5BI9YKXLV7+xs4bY=; b=MC24IK3pjEbG9vMbNFhAYj1bOl
	vfmqfrSnVNEeApjfhErwUEA1zHzUNDXrv3vNKIv6tQKNt78u3SU8hHxjuL400G2o/Xd1gxNnrCaFo
	x1CXg3wOkCBUc3bj6dk3e2t/NHVz04m2y39/92AAV7ADonBYg5tWtELjj7O6hTW7I+gOAiKKanCQ5
	G6YDNDHVXebZBA+/YtYWJTi8UfR06TJ6ncQ/cy6ohbUWCLYFpx66NNHMqcZ1pXBcM0mkdS2NKoyaJ
	sm3HI4sEJiyghj2G2KgN9vtUJ3mo/EMQW4eDw1AzDWfBjZ+w65J/5+HCzBsNylz/cBc/DVJrqv5Dd
	SKXRpGJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFhc4-0000000Fmiy-3aUh;
	Fri, 07 Jun 2024 21:59:08 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFhc2-0000000FmiH-0z0V
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jun 2024 21:59:07 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-6c4f3e0e3d2so2015013a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 07 Jun 2024 14:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717797543; x=1718402343; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RLl7Z9cmHrlTxhzq50m38fFLsEdzrzYpZmCV1yjgSWk=;
        b=dvPh+fXaA8mUBQNya+/PBPq1EOJEr6+ES8hZgLGz1t1XoxfyeG9T53D6stOREY+enk
         S2OnJO94ZG/HNftaZs3FKybErphuH4/J6PH2eGobswAAZqWIH1F0DX90rOGiHtal7qNw
         4N6rp1d6FhrNHtVvFUNmdYsNNoYoQmUmKhjHXevJZbeunPenloxtH8A3DJh+Ki1+rb/N
         7iM/NDSJuwANusENpKwWp+jV3ZRnoFachiKPM7eyn5H0MzhWUGWL0Mrq+V7TNPqAebxF
         YGHcpanQvqc86nXaUhHShVGywCJu9hmLIKob7jU7Jcq4UIBZnLwPPd+dLpcpun2La4aI
         H1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717797543; x=1718402343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RLl7Z9cmHrlTxhzq50m38fFLsEdzrzYpZmCV1yjgSWk=;
        b=f9ROAx9b1FUR48Tfss8wCCavhxLSEH477Oy83iJW57sKjvA5I+JtkkF+U80jaQmTNZ
         Z/6/Y7RwNMp+XIzfah7ct4Zp0NWOMXwZuvO6CVm8wP3i+IUgYouAGc6Le0HB4/YDNjTS
         ll/E/3F1tGnpSXxrU2XhPoB5Atwt32IjdFjLWDaOHHN/8wC4RxH437ncQxU9Vw9Ko5nq
         lhUMMlpNokvlrUkXmnYe9PhbVCLp3Fvcf2Pn7B8P2nXkX8HhPujlA9Xw94oRPYNAWf7o
         +/+P77aOHNaiAwDZjTISvtUDdq1wsj9W08IKeSXDCaFNjNl+HSuxqv7oAsgTjTpBP6Q7
         Nt3g==
X-Gm-Message-State: AOJu0YxmIG8lb3UacfcGqsxKATqjUgAUSPE/F7F+6fD8TxHXjU/Hp1rR
	uX/6pszFcVcX1mZx7j5G8HpfDz06L8ELsZMqdHHRx/vLGQES4qQY6pE6Y4ilzlU=
X-Google-Smtp-Source: AGHT+IFHUqEwBfucdw7yMbwX8qF9FDrpiVd3tPhrbs74VMEKkqD+jcARbpfEWS9oN2e60xfGbdGsuw==
X-Received: by 2002:a17:90a:cc5:b0:2c0:33a7:2afb with SMTP id 98e67ed59e1d1-2c2bcad0f9fmr3876235a91.10.1717797542975;
        Fri, 07 Jun 2024 14:59:02 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c29c4a574bsm4093594a91.56.2024.06.07.14.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 14:59:02 -0700 (PDT)
Date: Fri, 7 Jun 2024 14:59:00 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] riscv: Add support for per-thread envcfg CSR values
Message-ID: <ZmOCpF5ACdQiSfcm@debug.ba.rivosinc.com>
References: <20240605205658.184399-1-samuel.holland@sifive.com>
 <20240605205658.184399-3-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240605205658.184399-3-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_145906_370876_2D502852 
X-CRM114-Status: GOOD (  18.93  )
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

On Wed, Jun 05, 2024 at 01:56:46PM -0700, Samuel Holland wrote:
>Some bits in the [ms]envcfg CSR, such as the CFI state and pointer
>masking mode, need to be controlled on a per-thread basis. Support this
>by keeping a copy of the CSR value in struct thread_struct and writing
>it during context switches. It is safe to discard the old CSR value
>during the context switch because the CSR is modified only by software,
>so the CSR will remain in sync with the copy in thread_struct.
>
>Use ALTERNATIVE directly instead of riscv_has_extension_unlikely() to
>minimize branchiness in the context switching code.
>
>Since thread_struct is copied during fork(), setting the value for the
>init task sets the default value for all other threads.
>
>Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>---
>
> arch/riscv/include/asm/processor.h | 1 +
> arch/riscv/include/asm/switch_to.h | 8 ++++++++
> arch/riscv/kernel/cpufeature.c     | 2 +-
> 3 files changed, 10 insertions(+), 1 deletion(-)
>
>diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
>index 68c3432dc6ea..0838922bd1c8 100644
>--- a/arch/riscv/include/asm/processor.h
>+++ b/arch/riscv/include/asm/processor.h
>@@ -118,6 +118,7 @@ struct thread_struct {
> 	unsigned long s[12];	/* s[0]: frame pointer */
> 	struct __riscv_d_ext_state fstate;
> 	unsigned long bad_cause;
>+	unsigned long envcfg;
> 	u32 riscv_v_flags;
> 	u32 vstate_ctrl;
> 	struct __riscv_v_ext_state vstate;
>diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
>index 7594df37cc9f..9685cd85e57c 100644
>--- a/arch/riscv/include/asm/switch_to.h
>+++ b/arch/riscv/include/asm/switch_to.h
>@@ -70,6 +70,13 @@ static __always_inline bool has_fpu(void) { return false; }
> #define __switch_to_fpu(__prev, __next) do { } while (0)
> #endif
>
>+static inline void __switch_to_envcfg(struct task_struct *next)
>+{
>+	asm volatile (ALTERNATIVE("nop", "csrw " __stringify(CSR_ENVCFG) ", %0",
>+				  0, RISCV_ISA_EXT_XLINUXENVCFG, 1)
>+			:: "r" (next->thread.envcfg) : "memory");
>+}
>+
> extern struct task_struct *__switch_to(struct task_struct *,
> 				       struct task_struct *);
>
>@@ -103,6 +110,7 @@ do {							\
> 		__switch_to_vector(__prev, __next);	\
> 	if (switch_to_should_flush_icache(__next))	\
> 		local_flush_icache_all();		\
>+	__switch_to_envcfg(__next);			\
> 	((last) = __switch_to(__prev, __next));		\
> } while (0)

Suggestion:
Probably make this patch 1

>
>diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>index 2879e26dbcd8..1153b96346ae 100644
>--- a/arch/riscv/kernel/cpufeature.c
>+++ b/arch/riscv/kernel/cpufeature.c
>@@ -728,7 +728,7 @@ unsigned long riscv_get_elf_hwcap(void)
> void riscv_user_isa_enable(void)
> {
> 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOZ))
>-		csr_set(CSR_ENVCFG, ENVCFG_CBZE);
>+		current->thread.envcfg |= ENVCFG_CBZE;

Suggestion:
Squash this with current patch 1 and call it patch 2.

> 	else if (any_cpu_has_zicboz)
> 		pr_warn_once("Zicboz disabled as it is unavailable on some harts\n");
> }
>-- 
>2.44.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
