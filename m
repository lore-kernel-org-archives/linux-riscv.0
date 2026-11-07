Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC24606A326
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 19:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KqpCvx8S;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tBY3Jj9Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=o7h32h6d/8UAcUEBWlhYLAWFPR668vtkMCesfZZP8ng=; b=KqpCvx8SfMr+XV9P5n2fIYTTo1
	IJbh0u44LyUirqCnpKrhY/ypN4HhLb3QUVc6FSJtBtbKt9zMXGNfVnB7toXVjkNGQ584fUvKrDMRM
	4o0U9169cSRTB01lyfCqwy5D2mdYTRnUZzvECQykAFZhEYOUNyEv3ZSzpZ9V+M2qFZTUrdBSlajt/
	cB97Qp1xTU+TOhoZyCywQ55hFZC+Yt8JHHe1Mgdr9Un/8nyrNbWmwONLvhJmQtatjIpoVJB90DLuy
	QFpbJ57ADtrAMFL7eYk8ctbIh/Y1e0hHu2aMn0v5y1clpCYrYhb0jzbb6yFUbfsLs/tCHcT5npwbh
	z7jprW3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmQ7-0000000FFCm-40mq;
	Sat, 07 Nov 2026 19:49:47 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmQ5-0000000FFCR-3IJa
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 19:49:46 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so17446325e9.1
        for <linux-riscv@lists.infradead.org>; Sat, 07 Nov 2026 11:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794080983; x=1794685783; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/tu4B3PnObEBYuagThQOs/5KWVKGJisJ4D6xN5Num/E=;
        b=tBY3Jj9Y6xmWu4muVoFo+aIWsLfWc9whNkGYJSQQNei3pPgHgsC/xLFcgoq0RBC/GP
         l1bvdcVWT0r0fQY541DiOhlz2vzZ8fH2uRxePE0Ihy+UYWCpfmKfSjvh5TwIzRDBkX+h
         1WL3l2sdaglEgynxJmoJI81BpiSshUa/NU4JnfgWZSt9w1mK2dFWoKGwfnGHj17/Iw0h
         E/8/fpB9uCuCWfmWsilYvTtgMHDFUx3Y25LPSn42c0i6dBXH8JN1skBRVuHx/jugruE4
         j8LxEEOy9CKNRhhA2N49/mzK+reNpIeuuchPEb3mXRj+xPDiXhv36kCfoI56WQln6oVx
         qllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794080983; x=1794685783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/tu4B3PnObEBYuagThQOs/5KWVKGJisJ4D6xN5Num/E=;
        b=XG1WCO+qE3o1TiEpX9GNVmD28x8CMeurfE26wAcIG/7HXAIcTVrWGU6eutov/1mKOH
         YGZ8JgGVWLS4sQcNEsEmYQ6QbWoHufJuLYRFrZLnoOLiDqzKO7yo5F/CaB2ugjaWtGU3
         6OJkt4taOUlCn3bYVA3fLNHlZfxQ/j54opGPvp8dgcG73awMg/KLq4Wd80t1U5ANWosx
         mY09q18MwghnBbifMl9FSHVFuGjA7DNE/syfvs6nbb1EBhY7exEWT4n0nGAY/emb4sOS
         9GRCfAyN3RoDDFw/bEDKfijbJm0dmT+vJyIrAQg8vf6ng2hcp3bAnCHoZ1rM620weFzN
         LZmg==
X-Forwarded-Encrypted: i=1; AKwUvBzl/2GW/ngDhwp9ManeQJdCyixpQMCONoYD+NErzucVejuL/V3IuOhwPeZ+VBk9rtEjqOAUs/So6bwFGg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/dljMgLMI+MyQC7k7lQGfM6ZCmXcWGyB+yzBlXHPW/Ar+z3ree
	uk5E4fwshe3ayEDoLmdZzxzX+oTqCWM51mibDnhze5uc57dp4lnw3/IT
X-Gm-Gg: AYBFou3Cfx/285BjoF1eCGcLtCo0Q9NnzZHtk7rnvuokvt/MVhNTomgVn4mmodEUv2G
	duq46fdgVJNKT3tCLbsnnUbUkGavoLqhrT+Vn1UHbbH5TCU4joxOZDtDIIFQgvgi0ba7NPn9hPq
	hk3esmwfj8ZnZLUBN7XvBq+TF4yyaySjn5B/KbpY6MBg+cnveUH7l+eoXSlmKd38xWWrjHML15J
	kw6b2FEMCJ7EtfvS7B2uFSEP+UnzY4y6VpOoq2ZoIsBMZ/GVsPWKQ7kqJ5nBN858xB6JH2aMW+g
	1nz/zdGPgfYex+57LnDgx+vxkw8Om1yk/RBFxMmgyGme8HzC1BupuTGcZXC3q3E1HFBxsR0BvTe
	7c/kUtv6tI2n9zYREWuHilxjVgM78maZBoq72zjCwTnhxg2XGXq8nXUrAny3C/3YPlKuwVTXiEd
	TJvPZ25qAyl3S/2LNUUJZC1vUw0tnT4jDM1+vIXBmhJrzTAMLtrMYgREsiGuy7EMZtd1C2Rgblj
	A6f3LghI8Wnp4/JRltzcMGXWrnsKvcfYf9g96qh2l+TMHI5aI6Clxr/Pk11vYXJ1Ew74rDgXUz2
	Z7wk8OMVDWO/y/tedShuDBQGyHbHUaNzpAhkzeDCYsl4aMxmT532XHNTHmiewgxURKYBM0G8Nvv
	Wbf46hujeMUlgRc8CWD9MwO1NZQa9/fKTnGJjANIEBE2+MfqZs/4rQoz/IHSROlcaSN/oVxrsPu
	hnQYLvfQOTYLV/mLV5jQL995HtfJGu5xw=
X-Received: by 2002:a05:600c:6211:b0:4a0:1c94:7042 with SMTP id 5b1f17b1804b1-4b6de4a5d5cmr112509125e9.8.1794080983470;
        Sat, 07 Nov 2026 11:49:43 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b149-1401-90c6-65b4-035d-1e3d.310.pool.telefonica.de. [2a02:3100:b149:1401:90c6:65b4:35d:1e3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7da62edb4sm118646645e9.1.2026.11.07.11.49.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 11:49:43 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: entry: Mark ret_from_fork_kernel() and ret_from_fork_user() noinstr
Date: Sat,  7 Nov 2026 20:49:31 +0100
Message-Id: <20261107194931.69176-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_114945_865009_721C9CB1 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ret_from_fork_kernel() and ret_from_fork_user() are traceable and
return after syscall_exit_to_user_mode() enters the RCU extended
quiescent state via user_enter_irqoff() on NO_HZ_FULL CPUs. When
function_graph tracing is enabled with
FTRACE_VALIDATE_RCU_IS_WATCHING, the return hook runs after RCU stops
watching and triggers the ftrace_return_to_handler() warning.

Mark ret_from_fork_kernel() and ret_from_fork_user() noinstr and bracket
the kernel thread callback with instrumentation_begin() and
instrumentation_end().

Fixes: f955aa8723a6 ("riscv: entry: Convert ret_from_fork() to C")
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Assisted by an LLM.

Tested on v7.4-rc1 (d48723711bae) under QEMU riscv64 (-smp 4) with
NO_HZ_FULL, FTRACE_VALIDATE_RCU_IS_WATCHING, PROVE_LOCKING,
nohz_full=1-3 rcu_nocbs=1-3 on the kernel command line, and
function_graph tracing during parallel fork bursts across CPUs 0-3.
Without this patch, two consecutive runs trigger:
  RCU not on for: ret_from_fork_user+0x4/0x368
  WARNING: include/linux/trace_recursion.h:132 at ftrace_return_to_handler+0x2e0/0x2f0, CPU#2
followed by an observed kernel paging request Oops in
ftrace_graph_ret_addr() while unwinding the warning backtrace.
With this patch, two consecutive runs complete without the
ftrace_return_to_handler() warning or unwind fault.

 arch/riscv/kernel/process.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 34c1d498d1cad..10c1bee77145f 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -225,14 +225,17 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	return 0;
 }
 
-asmlinkage void ret_from_fork_kernel(void *fn_arg, int (*fn)(void *), struct pt_regs *regs)
+asmlinkage void noinstr ret_from_fork_kernel(void *fn_arg, int (*fn)(void *),
+					     struct pt_regs *regs)
 {
+	instrumentation_begin();
 	fn(fn_arg);
+	instrumentation_end();
 
 	syscall_exit_to_user_mode(regs);
 }
 
-asmlinkage void ret_from_fork_user(struct pt_regs *regs)
+asmlinkage void noinstr ret_from_fork_user(struct pt_regs *regs)
 {
 	syscall_exit_to_user_mode(regs);
 }
base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee

-- 
2.39.5 (Apple Git-154)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
