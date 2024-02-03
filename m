Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D1BC4828F
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Feb 2024 12:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ox9JCa3TqSN28o9axTk5XLWxROqPP2UVHYwFg9UWHB8=; b=BudEAwC4qbBwx6
	/rWXR6jpUOffIqi51pcTdSwpM/2U1ZKEEDQCCfVXEer5JjDm/m3h0nkHGx6ZpqIKHy+7OvOgOLWoZ
	B8ehR92lueUro2UuIfJW4FTi3pa7ZeE+FlN6lImt9o3y1fShDPKbLv6HFSV9iEUi/Hspcb5+AVw0q
	vc4ZIH3NVa8vlhsmnITmlHq5orXgfiX9DdU57hBGRzbALd+qfgNBJHr+dbofTblxtLzhgh676swH5
	KOzVvbDLvQCBcaz0aEAlh/yfbkhIlXQSU2qCSsdhbRhZBpnURwq8OYw2RH4qyA0SdCFyGvQofM4/A
	3BqOviwUdmZ+1Y+kNoHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWFEN-0000000GMFY-0Y0K;
	Sat, 03 Feb 2024 12:34:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWFDX-0000000GLTm-3xVv;
	Sat, 03 Feb 2024 12:34:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1945160A13;
	Sat,  3 Feb 2024 12:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FF01C43390;
	Sat,  3 Feb 2024 12:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706963634;
	bh=9F4zVwazY45NVTLTUMt3+YYK1FhVQKr2kpggbiXDZYk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GAPqK+2Tg7IeoYeLzW/lxHYBxXVbkmr9N6VoDkMRmiAyfvdGrjwwX7jOjEUxTA5Q2
	 /l5z5xzv/EHEDHto4oWGMOcWTtw3z29dh4UP5PMsaQMj2OYKJPMgPsjBtqCLSveCdF
	 IyDHhhvJx+X/psoJdAqnITvdezXyLq91C9qu7pA0aWx1gDFQz4Y+uLqv1+REhdequZ
	 Cl7E/HkNb2okHRTogLu3T3T/3nSExZ/mvLhCOIK1hwvy1DU+qiMyzXgMBIZ3WexOEs
	 hhdMeF6Wgm9W+kWy/RyVU6T36BjgxKklBygRnE33D2JBytL5CISb2tpW7K6I246Xrm
	 vNvTFl7bEOg9Q==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 03 Feb 2024 12:26:03 +0000
Subject: [PATCH v8 37/38] kselftest/arm64: Enable GCS for the FP stress
 tests
MIME-Version: 1.0
Message-Id: <20240203-arm64-gcs-v8-37-c9fec77673ef@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3085; i=broonie@kernel.org;
 h=from:subject:message-id; bh=9F4zVwazY45NVTLTUMt3+YYK1FhVQKr2kpggbiXDZYk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlvjDuRauFkaaPh56HIZRKGO8gNrdgx5cd8fytqaJ9
 gxcZ8/yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZb4w7gAKCRAk1otyXVSH0HvfB/
 45BDOyjlHdP8oMFeAoBIWMZZkmUzrM9aCS8QzG4hHJ4fJUKglzj019pZFVnlgeEtVvYPLOw2Mms9Xz
 QFl96gFHiupPO6gSLIp3YUOe0mDoh0oUhPp7eKc82vvXhQVBvhfgnSKmvd5A9immDtRgiJ4GD35W9x
 YMHaW1UpHJ/0SuU+JwZ+Uzmr2w6Ele0LENiS6hHXWG13qVDAXYqVeV2qdUVUXE6Aai+vRqxkoyXwwN
 YNXtOVmIA5hMiLQIR+BhqJjb+9YDPJaXCpuZUgRgUNOTJ27HIMUb2crVxqMDd+ug5hYHPXG3kq3KQM
 /AA99Qn2fflH/ontmNTg69Ma0JCwb3
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240203_043356_458068_164B95FC 
X-CRM114-Status: UNSURE (   7.97  )
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

While it's a bit off topic for them the floating point stress tests do give
us some coverage of context thrashing cases, and also of active signal
delivery separate to the relatively complicated framework in the actual
signals tests. Have the tests enable GCS on startup, ignoring failures so
they continue to work as before on systems without GCS.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/assembler.h   | 15 +++++++++++++++
 tools/testing/selftests/arm64/fp/fpsimd-test.S |  2 ++
 tools/testing/selftests/arm64/fp/sve-test.S    |  2 ++
 tools/testing/selftests/arm64/fp/za-test.S     |  2 ++
 tools/testing/selftests/arm64/fp/zt-test.S     |  2 ++
 5 files changed, 23 insertions(+)

diff --git a/tools/testing/selftests/arm64/fp/assembler.h b/tools/testing/selftests/arm64/fp/assembler.h
index 9b38a0da407d..7012f9f796de 100644
--- a/tools/testing/selftests/arm64/fp/assembler.h
+++ b/tools/testing/selftests/arm64/fp/assembler.h
@@ -65,4 +65,19 @@ endfunction
 	bl	puts
 .endm
 
+#define PR_SET_SHADOW_STACK_STATUS      72
+# define PR_SHADOW_STACK_ENABLE         (1UL << 0)
+
+.macro enable_gcs
+	// Run with GCS
+	mov	x0, PR_SET_SHADOW_STACK_STATUS
+	mov	x1, PR_SHADOW_STACK_ENABLE
+	mov	x2, xzr
+	mov	x3, xzr
+	mov	x4, xzr
+	mov	x5, xzr
+	mov	x8, #__NR_prctl
+	svc	#0
+.endm
+
 #endif /* ! ASSEMBLER_H */
diff --git a/tools/testing/selftests/arm64/fp/fpsimd-test.S b/tools/testing/selftests/arm64/fp/fpsimd-test.S
index 8b960d01ed2e..b16fb7f42e3e 100644
--- a/tools/testing/selftests/arm64/fp/fpsimd-test.S
+++ b/tools/testing/selftests/arm64/fp/fpsimd-test.S
@@ -215,6 +215,8 @@ endfunction
 // Main program entry point
 .globl _start
 function _start
+	enable_gcs
+
 	mov	x23, #0		// signal count
 
 	mov	w0, #SIGINT
diff --git a/tools/testing/selftests/arm64/fp/sve-test.S b/tools/testing/selftests/arm64/fp/sve-test.S
index fff60e2a25ad..2fb4f0b84476 100644
--- a/tools/testing/selftests/arm64/fp/sve-test.S
+++ b/tools/testing/selftests/arm64/fp/sve-test.S
@@ -378,6 +378,8 @@ endfunction
 // Main program entry point
 .globl _start
 function _start
+	enable_gcs
+
 	mov	x23, #0		// Irritation signal count
 
 	mov	w0, #SIGINT
diff --git a/tools/testing/selftests/arm64/fp/za-test.S b/tools/testing/selftests/arm64/fp/za-test.S
index 095b45531640..b2603aba99de 100644
--- a/tools/testing/selftests/arm64/fp/za-test.S
+++ b/tools/testing/selftests/arm64/fp/za-test.S
@@ -231,6 +231,8 @@ endfunction
 // Main program entry point
 .globl _start
 function _start
+	enable_gcs
+
 	mov	x23, #0		// signal count
 
 	mov	w0, #SIGINT
diff --git a/tools/testing/selftests/arm64/fp/zt-test.S b/tools/testing/selftests/arm64/fp/zt-test.S
index b5c81e81a379..8d9609a49008 100644
--- a/tools/testing/selftests/arm64/fp/zt-test.S
+++ b/tools/testing/selftests/arm64/fp/zt-test.S
@@ -200,6 +200,8 @@ endfunction
 // Main program entry point
 .globl _start
 function _start
+	enable_gcs
+
 	mov	x23, #0		// signal count
 
 	mov	w0, #SIGINT

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
