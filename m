Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32042CF318B
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 01:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZMx3DimI7cjY9nHjCJ7XlRdV7ls8aw7YkyqdfQ8EpE=; b=TQOSS9HYm7AieX
	rdLwJBpAqmEASajrnlnkiuJQye/YnVEO//cZJp10AJcJcgrk8TjXaSvfBqcM2h5ZJAHM0qG3Kux1b
	wtXd7vGq0c+h9xRFmu7gW/Z6HTdaVR2VrwDoOb1dPI+o8Rsk7+a64+gKX+XG/qMB5D4UWSazBvsEr
	y1bVvKtgJ6cDHL+w4xfdqC1slPGYuO0/iGRTmCy5e4+0z5ytJvu5gr4btLAhpoIFV7HyLv29FKW/l
	RkP/GNd603YJ8oh4VB8OV+3VNdp3+1cg24nPvqUvP4DsB/IVX5KgGoSa5dUwX5VEzJKeAoAU4VKGl
	c0/1R5BmkbWUaeGRErdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svnkM-00000004Ujo-2hmM;
	Wed, 02 Oct 2024 01:01:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svlxZ-00000004IwS-1WHk;
	Tue, 01 Oct 2024 23:07:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D8515C0339;
	Tue,  1 Oct 2024 23:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 079AFC4CED1;
	Tue,  1 Oct 2024 23:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727824032;
	bh=ZVQOrXstPU5gR3A8Ckx0lxDGx6pZ/VSu5l6FgDY2wws=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pGG18lc2vPv29gIqkMAgxe+tMLf+4YOSLTVwbD/QjeQ+DvjTcSnhA7jJROEaXnoqZ
	 Sk7q9z9Ik6EYvQw8wHgkFpjni48cdseqWXNSDA3ME5Y4jiMtNIFbXFi/Q4Y6Qx9DwF
	 CjbEr1Q9cpzsDu2LAVgTT9fQjiQWKTngRmKBXEN7BSy7+OVyloW50UqBsYSAQgLQzI
	 dfLXYIT6H9J9EGSKdxsCiJYQYuaK6ZHNrAAHm9yKovSUDtANbzIELnFp7jRx4qdDNO
	 t/OM6qvVSZzaXHRKgKE3J05TO1D0sCqUjuUxevCHFlz6IcybO63cbV6unXyWRUYs81
	 /uCRBTD6TpHcQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Oct 2024 23:59:18 +0100
Subject: [PATCH v13 39/40] kselftest/arm64: Enable GCS for the FP stress
 tests
MIME-Version: 1.0
Message-Id: <20241001-arm64-gcs-v13-39-222b78d87eee@kernel.org>
References: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
In-Reply-To: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
 Shuah Khan <shuah@kernel.org>, 
 "Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, 
 Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Kees Cook <kees@kernel.org>
Cc: "H.J. Lu" <hjl.tools@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Florian Weimer <fweimer@redhat.com>, Christian Brauner <brauner@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 Ross Burton <ross.burton@arm.com>, David Spickett <david.spickett@arm.com>, 
 Yury Khrustalev <yury.khrustalev@arm.com>, 
 Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=openpgp-sha256; l=3215; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ZVQOrXstPU5gR3A8Ckx0lxDGx6pZ/VSu5l6FgDY2wws=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm/H7irfZPEvRvl3o5vpBr8BsBVzwq7I5CnEYGxfwZ
 gyf+MGWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZvx+4gAKCRAk1otyXVSH0DS3B/
 96I6K/hdbGr5DSrgzJPe0+7XKencBMwk/ceJm2y031cJaJPViPOQuTZAendfczyGkbAaZt9UeDVPAO
 gCkbqR4XLO9PBxjo5YScfTmU9r99+zSj+zwQC5ucr66eT1x77VygKzJd8j2rR1NQZy3HquSDHylyJC
 ESOMtP6qcQKwhdA09cJ8P0dj/L95TlsXTza8OyudflyIIVmrrmpDc09CU+GCTAfUusoUv9E42T4DBi
 TW0WXck2w1AHyKmsaRL0eCusUSj9mjvtBiInM5ZzFL6Li07LZB1ECqhlt4eYMKED4AvXPIrM4w5bqY
 Sud8jJ/dLx7hEM40eyum2Ok+hHChEA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_160713_647996_5F4921FA 
X-CRM114-Status: UNSURE (   8.47  )
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

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Tested-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/assembler.h   | 15 +++++++++++++++
 tools/testing/selftests/arm64/fp/fpsimd-test.S |  2 ++
 tools/testing/selftests/arm64/fp/sve-test.S    |  2 ++
 tools/testing/selftests/arm64/fp/za-test.S     |  2 ++
 tools/testing/selftests/arm64/fp/zt-test.S     |  2 ++
 5 files changed, 23 insertions(+)

diff --git a/tools/testing/selftests/arm64/fp/assembler.h b/tools/testing/selftests/arm64/fp/assembler.h
index 9b38a0da407d..1fc46a5642c2 100644
--- a/tools/testing/selftests/arm64/fp/assembler.h
+++ b/tools/testing/selftests/arm64/fp/assembler.h
@@ -65,4 +65,19 @@ endfunction
 	bl	puts
 .endm
 
+#define PR_SET_SHADOW_STACK_STATUS      75
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
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
