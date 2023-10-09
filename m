Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1EEE95A8E
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 12:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wUPQu9eqdf6T4EYgNUJMlgLpudEmv5xNbOlSASmnJ3I=; b=THTw0ggNQS5a3b
	mBrsOBp6b/S931HAGKu9cDZZb2zCgjmocSN9ylJB7b9RXLgDm0DLZfWCX1cVDgWHesUN3JfIMUO24
	jBEG5u8pre+GbcyAGpvZxIhGX7A8ux21FitoGsI9DDgnOyKv9dVzaThIEjR7hMXmE+wDRwr4qM+Ky
	VRnVCqkx9YnM/lteyrAx60J6RqzrpmJwgeT80aSj/P/vTpyKX0utn2KbbuBl5nBICfT4Q99VfYnAP
	KbWynOA2rrkDxYPLQecRYhnpGorrxalS/2u3q1zPvbU4yUW80tSCHhw9ZORx4d7XhlDzPNQjsrEu5
	jHP+vROWMjGuv0irIKAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qppAj-00Ae5Y-2V;
	Mon, 09 Oct 2023 12:15:41 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qppA7-00AdNX-1g;
	Mon, 09 Oct 2023 12:15:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 02255B81189;
	Mon,  9 Oct 2023 12:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D4BC433B6;
	Mon,  9 Oct 2023 12:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696853700;
	bh=o3F0gqwirOzTh8gwGkZMmsXM7Yu/yi+gPnGo/AGnFQM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H6L2zm3OMsRyXQZfw5aCB2cQkw9G1wWr2dacwbrbjZXZPIvYK/weMVGb/cCzZKiC7
	 ZWZE+3KXbORqpB/LvrPa2XKaZcYAjAFSMj4QWQFzw3QNTXKDYCgERhCXIRuk6Sjumc
	 zB5fHswdhfFPA4MwUbxsr8ag7wUXWXMvOwCfogAugBxO+lLIGF8fBuDPcfcrWt9bL/
	 UfwoJNGMVjZIYaA2ZzmhBY6HI7q3jqJtDEajWrgfdPB+xTlJBBPSLdojTFkIx10j12
	 ZNBSMSXaS2qYh9yW/wlBi/EargZA/4mUtrGrQO91UPNkTiaKE8IffZTX8D3vhoHTR8
	 OG9JYN3wJLxnw==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 09 Oct 2023 13:09:12 +0100
Subject: [PATCH v6 38/38] kselftest/arm64: Enable GCS for the FP stress
 tests
MIME-Version: 1.0
Message-Id: <20231009-arm64-gcs-v6-38-78e55deaa4dd@kernel.org>
References: <20231009-arm64-gcs-v6-0-78e55deaa4dd@kernel.org>
In-Reply-To: <20231009-arm64-gcs-v6-0-78e55deaa4dd@kernel.org>
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
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=3085; i=broonie@kernel.org;
 h=from:subject:message-id; bh=o3F0gqwirOzTh8gwGkZMmsXM7Yu/yi+gPnGo/AGnFQM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlI+2vG7XbuVEpS5pxDaAIrEX013t37tEVAfRK24qD
 lhEdNXWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZSPtrwAKCRAk1otyXVSH0O9gB/
 9FoGr0eST8WBd+FIsUjhsE3d9wYovTCREYw/+Ayy30NkoVgB2HmjZh7K+hb1YN/LMp4ABI6gQv9m7U
 CD4WfBwvZ66QhtkrTfCIAGZpIQukSOsbVk6gdZYFnG7YW+e8eW3WDSRw9MC8WvY4S8Se1kCKCSUCeb
 Qz3siqGYszHBGhCUXtGLknYBqrkRfkRcrLwD25GetvYNDznn9zMYXqk6yRPx0AfSoebviB+WXqPi2L
 dbp5/fysyysuQlZh6LF/DXv7rc3dApbApo0DQVkQsmIg1LX6vsrhlBVTV2UmFdpn3sqVmIl8CtGlBA
 iYNaW3vGcLHl9DSvc6WgiC/Kg5uRyg
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_051503_866791_DC655222 
X-CRM114-Status: UNSURE (   8.59  )
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
index 4328895dfc87..486634bc7def 100644
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
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
