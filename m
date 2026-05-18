Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EECCD4F50
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 18:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P4VBbupYrHnNf6SJUasDNtg48K+hC6TnGhpD7qHV+O4=; b=A853PgSKKr/U4J
	dzr1SOwbnAdhZxjn3j0i5E7So3YMT76UZDfAqUX/NLdsqcY91aZ0LdtLQpnHsNA325SmRHAPyJf8u
	VrOKcv2HJsA7+R50Lk9O0HxQUYi7iiDsnRcsOdS1R7jQKwkUGYrl4v/SuEK48fsCWLHEYyazdkgPZ
	aVTPHbUs8NerZdcwe2Sa//uz4vqn6ppMGoWIk4n5+h+X1cORjG2oACYja2LZtTPzSK2REoq2GLxs6
	cu1qoDTMgK8nnFfppthHPZpI9+s3YgHwZsq9KV4uIaemKCvI3RDSMaTpMUICabxlr71J9sDLV27sC
	0VYd4AVwyty8E8LJ2cCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2t2-0000000GapQ-18YZ;
	Mon, 18 May 2026 18:40:20 +0000
Received: from mail-108-mta224.mxroute.com ([136.175.108.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2sy-0000000Gaoe-1sYT
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 18:40:17 +0000
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta224.mxroute.com (ZoneMTA) with ESMTPSA id 19e3c63705800067f7.006
 for <linux-riscv@lists.infradead.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 18 May 2026 18:40:10 +0000
X-Zone-Loop: be637ba49ac625c68175b7650e6f736371f28f0e7a68
X-Originating-IP: [136.175.111.3]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:
	From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=Gc6e4om4uJVepREiLY2m7U5l7KL9JaLr6L1SAM/U0bo=; b=J
	LKavkVWGOQ2OxnYcJqJDo+8ezNJq2vKesRKQU0figJfKVtjLucvm2qO9KfKaP7441iz/VQmITI7GA
	T0mBHgQcaQWMCIi6tREoKeSiRtNP1UWlAMRqsRtNZAaAlygyBHExRv0U/peiDhAcPs7cGbw4ZabTL
	CRW3uLYn4+YvZmQxva9RfBAKNE7NweT6IBz2X/IsJmRqdHcLGbz4CEtqO4Kq3J2jFoh3o/htSeuOS
	EPK7Ktxy0wHfwFnVqGKggj6wKHfL/uR9JcMLPvh7CRcPqZsWQYoIp3QzI1B+KXGXMIbn1d4yqtJmU
	MOaRfJZ9VozvQyOsGouc+c908pqZQOwJw==;
From: Richard Patel <ripatel@wii.dev>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Deepak Gupta <debug@rivosinc.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Richard Patel <ripatel@wii.dev>
Subject: [PATCH] riscv: cfi: reject unknown flags in PR_SET_CFI
Date: Mon, 18 May 2026 18:39:18 +0000
Message-ID: <20260518183918.322545-1-ripatel@wii.dev>
MIME-Version: 1.0
X-Authenticated-Id: ripatel@wii.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_114016_567960_2425F339 
X-CRM114-Status: UNSURE (   7.85  )
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

prctl(PR_SET_CFI,PR_CFI_BRANCH_LANDING_PADS) silently ignored
unknown control values. Only PR_CFI_{ENABLE,DISABLE,LOCK} should
be permitted.

This is a uABI breaking change (fails previously accepted bits
with EINVAL).

Fixes: 08ee1559052b ("prctl: cfi: change the branch landing pad prctl()s to be more descriptive")
Signed-off-by: Richard Patel <ripatel@wii.dev>
---
 arch/riscv/include/asm/usercfi.h             | 1 +
 arch/riscv/kernel/usercfi.c                  | 3 +++
 tools/testing/selftests/riscv/cfi/cfitests.c | 6 ++++++
 3 files changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/usercfi.h b/arch/riscv/include/asm/usercfi.h
index f56966edbf5c..61ee02cee297 100644
--- a/arch/riscv/include/asm/usercfi.h
+++ b/arch/riscv/include/asm/usercfi.h
@@ -50,6 +50,7 @@ void set_indir_lp_status(struct task_struct *task, bool enable);
 void set_indir_lp_lock(struct task_struct *task, bool lock);
 
 #define PR_SHADOW_STACK_SUPPORTED_STATUS_MASK (PR_SHADOW_STACK_ENABLE)
+#define PR_CFI_SUPPORTED_STATUS_MASK (PR_CFI_ENABLE | PR_CFI_DISABLE | PR_CFI_LOCK)
 
 #else
 
diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index cbfb4e495e9f..5a7113d69bad 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -467,6 +467,9 @@ int arch_prctl_set_branch_landing_pad_state(struct task_struct *t, unsigned long
 	if (!is_user_lpad_enabled())
 		return -EINVAL;
 
+	if (state & ~PR_CFI_SUPPORTED_STATUS_MASK)
+		return -EINVAL;
+
 	/* indirect branch tracking is locked and further can't be modified by user */
 	if (is_indir_lp_locked(t))
 		return -EINVAL;
diff --git a/tools/testing/selftests/riscv/cfi/cfitests.c b/tools/testing/selftests/riscv/cfi/cfitests.c
index 39d097b6881f..0e3943461e7d 100644
--- a/tools/testing/selftests/riscv/cfi/cfitests.c
+++ b/tools/testing/selftests/riscv/cfi/cfitests.c
@@ -141,6 +141,12 @@ int main(int argc, char *argv[])
 
 	ksft_print_msg("Starting risc-v tests\n");
 
+	/* Test unknown PR_CFI bits */
+	ret = my_syscall5(__NR_prctl, PR_SET_CFI, PR_CFI_BRANCH_LANDING_PADS,
+			  PR_CFI_ENABLE | 0xffff0, 0, 0);
+	if (!ret)
+		ksft_exit_fail_msg("PR_SET_CFI accepted reserved branch landing pad bits\n");
+
 	/*
 	 * Landing pad test. Not a lot of kernel changes to support landing
 	 * pads for user mode except lighting up a bit in senvcfg via a prctl.
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
