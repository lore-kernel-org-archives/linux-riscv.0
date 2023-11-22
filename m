Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C56DC61D9C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 09:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AwLvTV8/gcXuzZAczGWS4QMWnodIU05J9MfN0xkrG5k=; b=CmdW0jjTB5lcwX
	cSV6s9C16lzEPfDVPeQuHLgbGr2FuZYq4QTMtRLGU890R03s4+rs1XVNH02+X2/4FpRvu8bQBswx5
	QC6RhIxQb6VDNWNwM6hlOVerrTkMtt12XVN0qJE4D/HF3CYr/ijHhrtDp9vBsxweq1HDO5tZvP/Fr
	NrHjmFhHeEGRboEiJ42duZM/XShF0KFtcuI2Y2TWx7CwJkkEIxmRUD0mLymCM8rqlAZqL2ZL6wa0L
	zlBF8ziVxTKJ0SAwJ2JGPC8urFiNkkf9M8tO7oMcELmXQitcSsmxPBfN7Y7nxtNfdggsAbOWtqRAd
	Q4nSuZ3h7bHwUOM4keSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jq1-001KI9-2V;
	Wed, 22 Nov 2023 09:48:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jpG-001JSx-2f;
	Wed, 22 Nov 2023 09:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=WdLZmli9vg8t6fe84vUBdKw/nM+D1l+ZQgyfXgsT10E=; b=S0e7yZ02KLICMdYAyr1oPDb5h0
	cXIrRLaLL14TKZofYD4oS42VA5LSnGbDxI6NOGSKNfScz7YMxv/+eeWmf8CW7aroR8IKAAImRV3q7
	XJbkyVj5NgZUjXSqXIBKWrYfpPDLk1lEq/xJCl0EAUP8qeT+Mla902i8LgZyAPVRNLxLGvsrxXpiW
	zO2X5NPbCbFT9r6WiLVYVCYPr8yzpZRbW4qL3MA0WGIuxd2gKox24JhJ5AeZMdWH7uXhqe7LSNZLD
	JDSlSmvVRDMLf9rfEN1+MD6aBEsFdx2GqIHXuSnqX+LQ1o1IyNLHCu4XPag6X44S7sCr9+KzdyF33
	kik9Y6vQ==;
Received: from ams.source.kernel.org ([145.40.68.75])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jpD-00CGTb-10;
	Wed, 22 Nov 2023 09:47:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id CE428B81674;
	Wed, 22 Nov 2023 09:47:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88DA2C433CB;
	Wed, 22 Nov 2023 09:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700646429;
	bh=b3DUElLZ+Soh0Lccqy2ZSImkcM7zO9jMiCyb9nDJSwQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y9kSWTAVK98zhtVsyhDnKInGWdD30T07Ake/yR4jhC/+XLRShZE6i/o1V6NRBUhLz
	 Dxrc74iwZWGjxvodTdGkItzPGoLKXLdxFS2Kgf26ynO1y5UO6mFbuGEYFRezPYZ3SN
	 BJ6+Cpt7eYespf4hYmoUEvmoRFweNTPbyCFCCMewFKq5ZNXVlAgNurJYmvFMgcKAoz
	 6A5VkqVZkQux3aS2rdDhZOMzrDvsDBVF7gmWW8Wtj1s1MwxG9PDWzmbqkEHXCrQaYg
	 nTZt+W8U2etS7jdzyurIciWhdn9ueX+xYQm+Qiv9r0ECdsUBfiYa9tDRxTCLuOOVc8
	 ssLs3BiYaclDw==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 22 Nov 2023 09:42:42 +0000
Subject: [PATCH v7 32/39] kselftest/arm64: Always run signals tests with
 GCS enabled
MIME-Version: 1.0
Message-Id: <20231122-arm64-gcs-v7-32-201c483bd775@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3590; i=broonie@kernel.org;
 h=from:subject:message-id; bh=b3DUElLZ+Soh0Lccqy2ZSImkcM7zO9jMiCyb9nDJSwQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlXc0Pq69NiV0DZvuQOBOHTJq4Hskdu8ueWsh0A
 OXrPDovxWCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZV3NDwAKCRAk1otyXVSH
 0AvKB/4gIm6EQumGj0Sww0FN0GocO/C+BLqTbwD6sziQA+cF0OfObYvSHOKFbMlhgZBDcbxRj+H
 28uewK7t1SSYel2V8C+ykywrGEfBsUBjsriI5E5CfKOsPUhqtYwfEvHNoVySVobx5Rc1uodWehE
 wD4kxoZug4GzX0A1HdT4HPvZzCYUzCDXeyINi68DPqWrwit2CvDnkhjf8gGKqotnS4KnvHmhtcG
 C29Newlq2zS23qzht35JcPjfcn8Y1kR1IcN6GlS81iqTMkIEXYrjUAOl11+nDynG8e7kSOrapK7
 71JfVueE4JJPVZeyyV05a7VJNsMwlN+yEcRjJzeJj1TAN/mD
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_094715_432468_B5448DD9 
X-CRM114-Status: GOOD (  18.72  )
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

Since it is not possible to return from the function that enabled GCS
without disabling GCS it is very inconvenient to use the signal handling
tests to cover GCS when GCS is not enabled by the toolchain and runtime,
something that no current distribution does. Since none of the testcases
do anything with stacks that would cause problems with GCS we can sidestep
this issue by unconditionally enabling GCS on startup and exiting with a
call to exit() rather than a return from main().

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../testing/selftests/arm64/signal/test_signals.c  | 17 ++++++++++++-
 .../selftests/arm64/signal/test_signals_utils.h    | 29 ++++++++++++++++++++++
 2 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/signal/test_signals.c b/tools/testing/selftests/arm64/signal/test_signals.c
index 00051b40d71e..30e95f50db19 100644
--- a/tools/testing/selftests/arm64/signal/test_signals.c
+++ b/tools/testing/selftests/arm64/signal/test_signals.c
@@ -7,6 +7,10 @@
  * Each test provides its own tde struct tdescr descriptor to link with
  * this wrapper. Framework provides common helpers.
  */
+
+#include <sys/auxv.h>
+#include <sys/prctl.h>
+
 #include <kselftest.h>
 
 #include "test_signals.h"
@@ -16,6 +20,16 @@ struct tdescr *current = &tde;
 
 int main(int argc, char *argv[])
 {
+	/*
+	 * Ensure GCS is at least enabled throughout the tests if
+	 * supported, otherwise the inability to return from the
+	 * function that enabled GCS makes it very inconvenient to set
+	 * up test cases.  The prctl() may fail if GCS was locked by
+	 * libc setup code.
+	 */
+	if (getauxval(AT_HWCAP2) & HWCAP2_GCS)
+		gcs_set_state(PR_SHADOW_STACK_ENABLE);
+
 	ksft_print_msg("%s :: %s\n", current->name, current->descr);
 	if (test_setup(current) && test_init(current)) {
 		test_run(current);
@@ -23,5 +37,6 @@ int main(int argc, char *argv[])
 	}
 	test_result(current);
 
-	return current->result;
+	/* Do not return in case GCS was enabled */
+	exit(current->result);
 }
diff --git a/tools/testing/selftests/arm64/signal/test_signals_utils.h b/tools/testing/selftests/arm64/signal/test_signals_utils.h
index 762c8fe9c54a..1e80808ee105 100644
--- a/tools/testing/selftests/arm64/signal/test_signals_utils.h
+++ b/tools/testing/selftests/arm64/signal/test_signals_utils.h
@@ -18,6 +18,35 @@ void test_cleanup(struct tdescr *td);
 int test_run(struct tdescr *td);
 void test_result(struct tdescr *td);
 
+#ifndef __NR_prctl
+#define __NR_prctl 167
+#endif
+
+/*
+ * The prctl takes 1 argument but we need to ensure that the other
+ * values passed in registers to the syscall are zero since the kernel
+ * validates them.
+ */
+#define gcs_set_state(state)					\
+	({								\
+		register long _num  __asm__ ("x8") = __NR_prctl;	\
+		register long _arg1 __asm__ ("x0") =  PR_SET_SHADOW_STACK_STATUS; \
+		register long _arg2 __asm__ ("x1") = (long)(state);	\
+		register long _arg3 __asm__ ("x2") = 0;			\
+		register long _arg4 __asm__ ("x3") = 0;			\
+		register long _arg5 __asm__ ("x4") = 0;			\
+	                                                                      \
+		__asm__  volatile (					\
+			"svc #0\n"					\
+			: "=r"(_arg1)					\
+			: "r"(_arg1), "r"(_arg2),			\
+			  "r"(_arg3), "r"(_arg4),			\
+			  "r"(_arg5), "r"(_num)				\
+			: "memory", "cc"				\
+			);						\
+		_arg1;							\
+	})
+
 static inline bool feats_ok(struct tdescr *td)
 {
 	if (td->feats_incompatible & td->feats_supported)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
