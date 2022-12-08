Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC1AC4708E
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 02:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJkdASLu9JgZEKD4i3OluTRJt2w+HIZK4X7J4TrAg/g=; b=Kcns7crp/Mlhq3
	90KqvfBROND0FIlZxAwyUN77rWrtC7+4ZC65ai7l4pbqPBzxhLjNy9ol8jPTc5hg8STRnFdEFahOV
	OGzAzU7NyHGt0ypPZfhye4uVdIyxEJ7YWfmveeePkmqnl8pEtXiUse7n1P89q3EiOROyGmutiHFQl
	Yq41t/dzeyOGg+4YS/cxI6m2Lx34q1AXAVSQTdpCFBlYSGy9HlrtvHkX9iUG4kkZV4+KnnZsz8FUW
	w7m1VVzB37X+GWUHj8mpiyR7foSReiMyV+eLoQreUx0TdHyZh9vkofhY+ieOp+BADwu6l2fXdxhm2
	zalesdrzI24+2Hj1SbZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p377V-000c6g-Uc; Thu, 08 Dec 2022 02:58:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p377T-000c5Q-4x
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 02:58:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8BCA561D42;
	Thu,  8 Dec 2022 02:58:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C531C4347C;
	Thu,  8 Dec 2022 02:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670468322;
	bh=W3STfz+q/HLqif/5T6LkLEIliEWH5xJbJ52wW/3KA+A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FpO6gBmHALJhTC1fn2hPPUyNbCq2Da3mgaGbaxZt4coQKztR57vVEqrWWJncgc0Mt
	 uu3QREO80RIPW8sSvQvb7oDMJV5GvYD9dFZ0h1lO66t8xeX4jrPipOzfH1IQXnc+4F
	 WjQDP9FPKW7GOCLIVCBv+wJga4OJwWLSo0JapUJh2m492mlcl47X0PewkHTFG0fUKD
	 Fi08NZ5VBX6VVXwkW8HZ8Da9oRJSOlQPCocp6+hK9bjTob7fkfxV8lq/Yssem20I9L
	 2E2L8Q5bHhRCX2GEOr1i5VkpA2PDTQKlmpAaw0DDNz0WVWAkc1Mnu92sgw/fH6qYcW
	 sbzYsaUfoanng==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	lazyparser@gmail.com,
	falcon@tinylab.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	mark.rutland@arm.com,
	zouyipeng@huawei.com,
	bigeasy@linutronix.de,
	David.Laight@aculab.com,
	chenzhongjin@huawei.com,
	greentime.hu@sifive.com,
	andy.chiu@sifive.com,
	ben@decadent.org.uk,
	bjorn@kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lai Jiangshan <laijs@linux.alibaba.com>,
	Borislav Petkov <bp@alien8.de>,
	Miguel Ojeda <ojeda@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH -next V10 01/10] compiler_types.h: Add __noinstr_section() for noinstr
Date: Wed,  7 Dec 2022 21:58:07 -0500
Message-Id: <20221208025816.138712-2-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221208025816.138712-1-guoren@kernel.org>
References: <20221208025816.138712-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_185843_293445_38401687 
X-CRM114-Status: GOOD (  11.13  )
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

From: Lai Jiangshan <laijs@linux.alibaba.com>

Using __noinstr_section() doesn't automatically disable all
instrumentations on the section. Inhibition for some
instrumentations requires extra code. I.E. KPROBES explicitly
avoids instrumenting on .noinstr.text.

Cc: Borislav Petkov <bp@alien8.de>
Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Suggested-by: Peter Zijlstra <peterz@infradead.org>
Tested-by: Jisheng Zhang <jszhang@kernel.org>
Tested-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Lai Jiangshan <laijs@linux.alibaba.com>
---
 include/linux/compiler_types.h | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index eb0466236661..41e4faa4cd95 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -230,12 +230,19 @@ struct ftrace_likely_data {
 #define __no_sanitize_or_inline __always_inline
 #endif
 
-/* Section for code which can't be instrumented at all */
-#define noinstr								\
-	noinline notrace __attribute((__section__(".noinstr.text")))	\
-	__no_kcsan __no_sanitize_address __no_profile __no_sanitize_coverage \
+/*
+ * Using __noinstr_section() doesn't automatically disable all instrumentations
+ * on the section.  Inhibition for some instrumentations requires extra code.
+ * I.E. KPROBES explicitly avoids instrumenting on .noinstr.text.
+ */
+#define __noinstr_section(section)				\
+	noinline notrace __section(section) __no_profile	\
+	__no_kcsan __no_sanitize_address __no_sanitize_coverage	\
 	__no_sanitize_memory
 
+/* Section for code which can't be instrumented at all */
+#define noinstr __noinstr_section(".noinstr.text")
+
 #endif /* __KERNEL__ */
 
 #endif /* __ASSEMBLY__ */
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
