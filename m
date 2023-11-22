Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7ECBC61D9B
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 09:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=72lR6+Pf8mye2mYxIt8zicwfyF6p0MfIONN/JIoMBu0=; b=RK2B3eFUTAdvwG
	apMri9rq6cSSNzT8y60n/KbGVFpnhWKPSq16qWZZp9Z58Ulhi1890xP8FIdvxbs4afR9yuGTXsOHr
	3LUdoT9p3pLGUYY+60B44zEL7iFHLtgrfGz0ClEJZpJiTOkpsev0bIznDtF9Waa9/+boDmvLUhHKe
	sqN+PI2+BL8Yv+mWOfXq77kWZqzKDynRmCCYCvPy0rU06WQnRHch6tFqXTTdfXn0FhMtRlhsRyCin
	QJUMKtE1SyoOVZrjg1L9SFpB25Zdh6LqJ2do3hI3SKy/raQ/rjrHYJkZB3T4nFw6LTbVGKeiyevMx
	j8j6AH5mECH9/QdukY/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jqm-001L69-39;
	Wed, 22 Nov 2023 09:48:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jq0-001KGg-1x;
	Wed, 22 Nov 2023 09:48:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BDF1361CCB;
	Wed, 22 Nov 2023 09:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F11C433C8;
	Wed, 22 Nov 2023 09:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700646483;
	bh=eSCNvWDUi17fRk35d8u5Mk3lnX0Qn/saq0Me9ODMcog=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ky+pdXFqPVvbwLOQUIF5KSUAApd5yTfp+EINHRoVxbFevJpHoyzBoj2b888ngusWk
	 yaqfFa8QVfN25G/u7QdOYZUJScjAIgS0W5IYixhIMpxpcucqib0pQ39x4ovpU/4ei1
	 gVrQagiEjXeCrqjKfim7+VoJe9JtEaWSBTdRJi46N1fKsiwXaGv2WafWlU+6dHq8lN
	 uzmYGPrRen1M+iAo+Yib/uD572QUkvKLXEUJXCTK8GbUTZNFIdU2G16bmX0oplRg+W
	 IAO1TThYj30cSZq36jN5aITacV3zTcxa2zJi6aLLFWvZTAsyIT/vGN0hdk74aRrUiq
	 hXdb6F28yuOyA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 22 Nov 2023 09:42:48 +0000
Subject: [PATCH v7 38/39] kselftest/arm64: Enable GCS for the FP stress
 tests
MIME-Version: 1.0
Message-Id: <20231122-arm64-gcs-v7-38-201c483bd775@kernel.org>
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
In-Reply-To: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
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
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=3085; i=broonie@kernel.org;
 h=from:subject:message-id; bh=eSCNvWDUi17fRk35d8u5Mk3lnX0Qn/saq0Me9ODMcog=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlXc0TxVaHhiADHB3bt1cHAI20VA1kqzEuj0fpj
 P2J54lQhOyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZV3NEwAKCRAk1otyXVSH
 0JlxB/9FubKE8WWTJdmyYLHbycLew6cc6wkr4QsEGDYSbvsH6yUlHMaOFlF8K4bCuYzdet4kVjB
 djl3tnOX8toJbJGgztTuvNDASojBPp75eEaXXBNPtkn8zEZOzMvgXvd09/n0HmXffwhqFr2N495
 TLue+HbFeVDNc0fCIhADVuCrpK+5PEiISx974vYRYvwsGyqLh59DxFuqqJgWVatzyni7JXJWWmJ
 6wgvUBPx9mGzmUZGFi5H5tD93ZTl3+/CXDEPsk4m3sH7wOkaH9ohDus3PfpTRW42Vdad9uAvR4I
 A8kL/AC9KhHYrCxP1U84b4R0Y0z+oLl66/wYlFmPpOJWkdaU
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_014804_735994_797384E8 
X-CRM114-Status: UNSURE (   8.13  )
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
index 547d077e3517..e29ab7c4e824 100644
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
index 9dcd70911397..f789694fa3ea 100644
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
index d63286397638..ea5e55310705 100644
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
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
