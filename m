Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E754EEF319
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 08:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZ2t5XKUdZecQA/1g3Uic3hzeN0wG/Jjz9nnQ/6uUtQ=; b=1uxlrEr5OEJDdW
	o5fhnFokiBT4QjEjE8026ozVyfQE6vyQEM1Ciz+Sh09jPPlkG13vmmIMfn4ejGKlAqSCmvrr4nfhK
	mWwlsnAUnRK/9t1ijW3L2z/pKNTkennHT30ECBOzTKYVvQz5GGFCe1jggVegnkSjKQzDc3zOm/0N7
	Wu2SnuGYjL7vRs5LbkpltI84KPy3zJ/eSd++1vxWHkteV8ly/LWO6J79ylVngEHCMfURkXPKzzBYC
	exg/A4UJ111y18veyMtEHIHOplH8z+Sc5rZ3ZkzR+ltLRTHLGjWaYy5DksRO9nrD7QwVQF02YmEim
	xQABib0wiz/h2xy0SGeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy3oU-000000019nk-0Yej;
	Thu, 05 Mar 2026 08:12:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy3oS-000000019kw-2PPA
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 08:12:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E1C8061340;
	Thu,  5 Mar 2026 08:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C0B1C2BCB0;
	Thu,  5 Mar 2026 08:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772698322;
	bh=9LP7nlSjlZICynTt9XDTwozxYwtIquJTVqNP+9kcEYE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ibK3WHUvegVVAuH5880+YVhkyR57UzKG6AmrbSsbgkVfb4lrQ/Jss/cGOlWh77o6E
	 20cTghovAQb11XqwuWtXsIE12OclwI47ADHm6WnZpjBCxWk7RQTUEhTWa1FZGE8RO4
	 vjjHq3OwWJXxtvc0Bx6X0Q/i/eEPvE2MF64MTLNv67Yti3NyZCSdYXnOsnmQnSpSPv
	 BaE0kMxhn3Rjk9mjmyLxl7xpW/Umrbrgld4H4QiLJWB9Rf+gdZ7sYw7XsP7Rm82Ki4
	 71YK5XMV/eXd/cfGjQ+kkdyD6mW4CdaZp2h5NGCbwxymdNQw+MoieO8bgO+WYow510
	 n0hzAqJ9G5h9Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F31AEEF31B;
	Thu,  5 Mar 2026 08:12:02 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Date: Thu, 05 Mar 2026 00:11:29 -0800
Subject: [PATCH 1/4] selftests: riscv: Add definition of BIT() macro
MIME-Version: 1.0
Message-Id: <20260305-fix_selftests-v1-1-61b62d23500b@gmail.com>
References: <20260305-fix_selftests-v1-0-61b62d23500b@gmail.com>
In-Reply-To: <20260305-fix_selftests-v1-0-61b62d23500b@gmail.com>
To: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sergey Matyukevich <geomatsi@gmail.com>, Andy Chiu <andybnac@gmail.com>, 
 Deepak Gupta <debug@rivosinc.com>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772698321; l=1614;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=M9wZ+QYEsaJi68PSnz9JK4iYBoPubDLiHbEPbHDQLxE=;
 b=C/Lh7aPi35cf9hAmcFgh1b97ibEZIit+zZ7krQ7MxKyZjRNMGPA3EN4xr5iSQAuxYwSAp5avy
 DU94JT+vRpdA54bpDp7gvH+4ZHCs365DiBiOlsUYE0XkeewVPJE35eJ
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=vpF2USrG+aB6CTbSt34rzJKsAVe/l+GAXo1IomCMETk=
X-Endpoint-Received: by B4 Relay for thecharlesjenkins@gmail.com/2026030
 with auth_id=663
X-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
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
Reply-To: thecharlesjenkins@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Charlie Jenkins <thecharlesjenkins@gmail.com>

The BIT() macros is used by the validate_v_ptrace() test case, but not
defined. Include linux/bits.h to pull in this definition. To ensure that
the header in the kernel source is used, add tools/include to the header
search path.

Fixes: 30eb191c895b ("selftests: riscv: verify ptrace rejects invalid vector csr inputs")
Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 tools/testing/selftests/riscv/vector/Makefile            | 2 ++
 tools/testing/selftests/riscv/vector/validate_v_ptrace.c | 1 +
 2 files changed, 3 insertions(+)

diff --git a/tools/testing/selftests/riscv/vector/Makefile b/tools/testing/selftests/riscv/vector/Makefile
index 326dafd739bf..92c4cfe5f34d 100644
--- a/tools/testing/selftests/riscv/vector/Makefile
+++ b/tools/testing/selftests/riscv/vector/Makefile
@@ -2,6 +2,8 @@
 # Copyright (C) 2021 ARM Limited
 # Originally tools/testing/arm64/abi/Makefile
 
+CFLAGS += -I$(top_srcdir)/tools/include
+
 TEST_GEN_PROGS := v_initval vstate_prctl vstate_ptrace validate_v_ptrace
 TEST_GEN_PROGS_EXTENDED := vstate_exec_nolibc v_exec_initval_nolibc
 TEST_GEN_LIBS := v_helpers.c sys_hwprobe.c
diff --git a/tools/testing/selftests/riscv/vector/validate_v_ptrace.c b/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
index 3589549f7228..257de36274e9 100644
--- a/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
+++ b/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
@@ -6,6 +6,7 @@
 #include <unistd.h>
 #include <errno.h>
 
+#include <linux/bits.h>
 #include <linux/ptrace.h>
 #include <linux/elf.h>
 

-- 
2.52.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
