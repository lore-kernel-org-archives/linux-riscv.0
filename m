Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3916C27C79
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 07:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dNWXxEjzW8esYR0OKrwJxp9APhFFWl0OApBfC5/1jGc=; b=juft4iPLYq+loL
	N/U9q+1WzSLznkQt/YQ1E8KwHY7F0Nutoe8AhFvPpHvTHzbF0oUzeq3yTRJWaMcGGcEy0vjU7OW/w
	BP1aL1x088EVqeIuJvELr+dzxiBxvataJtwEwsGpaJ4WnrrS4j7kEAoaMECbkpGeLYP8q2CT1Cn9R
	37aToocB/7XCqokQ++0wmRsYQF9eDN9O/a60folKilXzQk1BndzvErvwumB4jZ+gdCivqIrXX2Y85
	FkRBCLv7+s/O5Ld1zEEnMZJmCDG6KhvDCfGd3U175Tyw086uZ+y3IJsFspO51t2S8mfwBBAUEWtL8
	30addTkitl7Z1k3gv/Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHexJ-0000000FUZq-04kn;
	Thu, 13 Jun 2024 07:33:09 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHexF-0000000FUXG-0dWf
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 07:33:06 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3d227b1f4f0so332943b6e.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jun 2024 00:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718263984; x=1718868784; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wBQdisfSIcfLCxaUXLlDTwMoYdzfD8LhoeZl0/Tj/fA=;
        b=THq8Q48G8FK3MzohjaUsKMljBTKanTMJOlKnjODpzJBqhAEUnm8I/ee83ZgFlCboNp
         PeQtD15fwu128R1OmnLyD/6N9x0xENOxuD0ZxtOBZ0IUf3Er7ji8KaFB9SEyVKEFHB4Q
         DShrU4kltQ8SkOsiWkRZKdXPd7vj6wpTo06T/xuSyidDqHE4lNT46EKPSHUWAKxp/q2s
         hCKL6tejXzfj7T2EjTT6w8JG8C6N8w8YHVNM4u+EmF/JRKVMIKmPkOxu90VxLQDDDFoM
         tVQBie1yQg538rh1wfNfJTtuba3NmkYf1bmA1wZb+/e/1WQbqNpcOeFEMFw+R3xqr/HN
         DeKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718263984; x=1718868784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBQdisfSIcfLCxaUXLlDTwMoYdzfD8LhoeZl0/Tj/fA=;
        b=JFLlpJw9zsF+2ABuIqQUn9f6QBf+46VwLnV1cvMZOLAHeUUJBdOX50xgZ0NlJlvAGN
         D3HdQxZjxOKZXVM+uabIyngGePZn/KI7Ut9zx9oCJJKsuDfLepnowZmYMDgvbiWjjxjl
         jclHXpjUXZOdVQ5Qpqw6geESl+hMCEYj8D4w0eRWYOPvYLwKsaMJ+bM3Bn3KbkxTb7Ps
         6tILw85H4CS6r+gxH8Z/JJwJ2TfInjqkjH+qznUVE0kapGLU5MI9A3fRUfBeveXrhmbq
         G+GbsvpZoeuZJc/2zxRlA+FL/Ue6vIiYGXFnn63Xoz4eFI632aZwQImkKOvudYdNuGGK
         PvLg==
X-Forwarded-Encrypted: i=1; AJvYcCUAZIEwFJc/rPRoZqpWfktNxaPVihhnDQyDZr0gltyDMsiNRtukLOPCbsjvbu3ja1qbByxPHWXu9k2BQx2e3mMIpeGKBjGVBmfRPLUvFZ/q
X-Gm-Message-State: AOJu0YynE3u/+Z1AcUEqkxQjCqs8EtiXv3TeTN+pdGpb7IjHDQc2G4LB
	Dx1Wz8gYijvpTOW1vLMx5yT7C4H4lCvwtPuwpmyOQl5oh5E8bJwqjmiLrSeHWKg=
X-Google-Smtp-Source: AGHT+IHI/57UF4ERYhNsT8IgBFHVZFnNkvkL7rNY4vjoxvdn096FWUD3qDYx3RYqModhDDSYikhCvg==
X-Received: by 2002:a05:6870:4412:b0:254:6eb5:ab2f with SMTP id 586e51a60fabf-25514afc016mr4471125fac.6.1718263983791;
        Thu, 13 Jun 2024 00:33:03 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc78a1a0sm730028b3a.0.2024.06.13.00.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 00:33:03 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 13 Jun 2024 15:11:11 +0800
Subject: [PATCH 6/8] riscv: ftrace: do not use stop_machine to update code
MIME-Version: 1.0
Message-Id: <20240613-dev-andyc-dyn-ftrace-v4-v1-6-1a538e12c01e@sifive.com>
References: <20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com>
In-Reply-To: <20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Puranjay Mohan <puranjay@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Andy Chiu <andy.chiu@sifive.com>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_003305_400316_D49C7D9C 
X-CRM114-Status: GOOD (  12.95  )
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

Now it is safe to remove dependency from stop_machine() for us to patch
code in ftrace.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/kernel/ftrace.c | 53 ++++------------------------------------------
 1 file changed, 4 insertions(+), 49 deletions(-)

diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index f3b09f2d3ecc..9a421e151b1d 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -13,23 +13,13 @@
 #include <asm/patch.h>
 
 #ifdef CONFIG_DYNAMIC_FTRACE
-void ftrace_arch_code_modify_prepare(void) __acquires(&text_mutex)
+void arch_ftrace_update_code(int command)
 {
 	mutex_lock(&text_mutex);
-
-	/*
-	 * The code sequences we use for ftrace can't be patched while the
-	 * kernel is running, so we need to use stop_machine() to modify them
-	 * for now.  This doesn't play nice with text_mutex, we use this flag
-	 * to elide the check.
-	 */
-	riscv_patch_in_stop_machine = true;
-}
-
-void ftrace_arch_code_modify_post_process(void) __releases(&text_mutex)
-{
-	riscv_patch_in_stop_machine = false;
+	command |= FTRACE_MAY_SLEEP;
+	ftrace_modify_all_code(command);
 	mutex_unlock(&text_mutex);
+	flush_icache_all();
 }
 
 static int ftrace_check_current_call(unsigned long hook_pos,
@@ -158,41 +148,6 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 	return __ftrace_modify_call_site(&ftrace_call_dest, func, true);
 }
 
-struct ftrace_modify_param {
-	int command;
-	atomic_t cpu_count;
-};
-
-static int __ftrace_modify_code(void *data)
-{
-	struct ftrace_modify_param *param = data;
-
-	if (atomic_inc_return(&param->cpu_count) == num_online_cpus()) {
-		ftrace_modify_all_code(param->command);
-		/*
-		 * Make sure the patching store is effective *before* we
-		 * increment the counter which releases all waiting CPUs
-		 * by using the release variant of atomic increment. The
-		 * release pairs with the call to local_flush_icache_all()
-		 * on the waiting CPU.
-		 */
-		atomic_inc_return_release(&param->cpu_count);
-	} else {
-		while (atomic_read(&param->cpu_count) <= num_online_cpus())
-			cpu_relax();
-	}
-
-	local_flush_icache_all();
-
-	return 0;
-}
-
-void arch_ftrace_update_code(int command)
-{
-	struct ftrace_modify_param param = { command, ATOMIC_INIT(0) };
-
-	stop_machine(__ftrace_modify_code, &param, cpu_online_mask);
-}
 #endif
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
