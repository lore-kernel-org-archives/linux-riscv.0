Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF76C48295
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Feb 2024 13:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0UEzuTjACbP/iDd/bjnM/UikDn/tW3ge39Yk6bE95Ao=; b=pOJvxHTg8tI/U0
	XHoA6fABx9qxKiFrKzJAonkxVMaxgyPnJLJBkao93E/Pn7GmqqXafmZKhV6xnIIoTNXbgU0Su2HhG
	G7yfvUyPUNHaVAfH1uf/eoG9Eia+64HsCYijm8NKbp0lCmT2MKQGCjUEsvYSwoL4Had/BuY1Jh+cf
	Go9KSYNRqU7TJCNUdVGWC7ntN6aKarumgbo8KQtVFk2eZMEWrQW++Q1cHsYzEZfqWC+b73TcB+OgM
	Ppj7wJYS6ZRaJ6hLBqmx9nIkqW+1+GiiJlFUDCGsk+ota4/eAviyA9KZN9WPIfZ6NGOi51hCkgo2F
	xNMYjGl7HYrN3ObRNifA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWGNu-0000000GZRz-0wmi;
	Sat, 03 Feb 2024 13:48:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWFDe-0000000GLZf-3bKg;
	Sat, 03 Feb 2024 12:34:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C073060A67;
	Sat,  3 Feb 2024 12:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D85C43394;
	Sat,  3 Feb 2024 12:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706963641;
	bh=WXqbYsgYYOXFEeMs+roJ3AXRYBhuL60ozPF+o7O4bAk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=F78PhGGK2tKTlc1p2op6t75h6sAseztGvobKzgGSABUqePNhCLv6h7b0MXYZozVvf
	 TMoM8VKK0ZO5F2e6/66jeGgtskS0UMHEiCAZUXqg+6vxYh1xgH6tpBdIJiNPgo7YpK
	 EnaGYjMB/A//4+Sjcv0gbyN2txDslqcYGoLlVah+34dTkNIBFZPTZDpK5wR3pQL70I
	 Dzxx0jU1Bjxx/D0JoI4d/HNBk5LzI9/lGYtAoE48s/fM91juriLFdFQwpik4auJ+g4
	 1D/HN4P1oVK7bX97yoTav7bFx3jIr53qvhASYz8zdLRC/yDEo0s7d2QHFhc9ilv97S
	 gLO6O0zcUVi6Q==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 03 Feb 2024 12:26:04 +0000
Subject: [PATCH v8 38/38] kselftest: Provide shadow stack enable helpers
 for arm64
MIME-Version: 1.0
Message-Id: <20240203-arm64-gcs-v8-38-c9fec77673ef@kernel.org>
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
In-Reply-To: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
 Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, 
 "Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, 
 Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Cc: "H.J. Lu" <hjl.tools@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Florian Weimer <fweimer@redhat.com>, Christian Brauner <brauner@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-a684c
X-Developer-Signature: v=1; a=openpgp-sha256; l=2372; i=broonie@kernel.org;
 h=from:subject:message-id; bh=WXqbYsgYYOXFEeMs+roJ3AXRYBhuL60ozPF+o7O4bAk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlvjDvM7ObtGoCDxxiAl89DYa6RzxdLnWQy+FkForz
 aUSU5kiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZb4w7wAKCRAk1otyXVSH0NEICA
 CCvybEtXLigY0Lceu5RSwEZ8U+9W6svq5+knPV3mZQY4TSxy9Yy4lyeVk8Pv21v/12qFvp6uqzLp0g
 k6+WV9GRZ/Pqfacx9BQ00Oc/rfhKVczK0MsQz3mDGVuLKbJ4qSNpb8/dqtFqZr2ObsOcGe2ZV7T/CG
 ALJt/tNjptHMxvEWIyQI3z/Smo1ZEdn4C7yaVXufiGkwDmFEB8wquT7O7Dh3npGDpxL78q4rAtfJy+
 8dPSdobFohDZMcnrMhjgw8Klf2bbVp8Sut5M7DVJ/t3nRkqxRoYhyVFTjjG6NdjDWhhL+IKQdltpt4
 8U4+ItNFhfAZrHX27/JjU9V30WRy/h
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240203_043403_561029_41BDB169 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

Allow test programs to use the shadow stack helpers on arm64.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/ksft_shstk.h | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tools/testing/selftests/ksft_shstk.h b/tools/testing/selftests/ksft_shstk.h
index 85d0747c1802..223e24b4eb80 100644
--- a/tools/testing/selftests/ksft_shstk.h
+++ b/tools/testing/selftests/ksft_shstk.h
@@ -50,6 +50,43 @@ static inline __attribute__((always_inline)) void enable_shadow_stack(void)
 
 #endif
 
+#ifdef __aarch64__
+#define PR_SET_SHADOW_STACK_STATUS      72
+# define PR_SHADOW_STACK_ENABLE         (1UL << 0)
+
+#define my_syscall2(num, arg1, arg2)                                          \
+({                                                                            \
+	register long _num  __asm__ ("x8") = (num);                           \
+	register long _arg1 __asm__ ("x0") = (long)(arg1);                    \
+	register long _arg2 __asm__ ("x1") = (long)(arg2);                    \
+	register long _arg3 __asm__ ("x2") = 0;                               \
+	register long _arg4 __asm__ ("x3") = 0;                               \
+	register long _arg5 __asm__ ("x4") = 0;                               \
+	                                                                      \
+	__asm__  volatile (                                                   \
+		"svc #0\n"                                                    \
+		: "=r"(_arg1)                                                 \
+		: "r"(_arg1), "r"(_arg2),                                     \
+		  "r"(_arg3), "r"(_arg4),                                     \
+		  "r"(_arg5), "r"(_num)					      \
+		: "memory", "cc"                                              \
+	);                                                                    \
+	_arg1;                                                                \
+})
+
+#define ENABLE_SHADOW_STACK
+static inline __attribute__((always_inline))  void enable_shadow_stack(void)
+{
+	int ret;
+
+	ret = my_syscall2(__NR_prctl, PR_SET_SHADOW_STACK_STATUS,
+			  PR_SHADOW_STACK_ENABLE);
+	if (ret == 0)
+		shadow_stack_enabled = true;
+}
+
+#endif
+
 #ifndef __NR_map_shadow_stack
 #define __NR_map_shadow_stack 453
 #endif

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
