Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F56AEB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 21:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PAA/W2fjW0DttKJFkQhq7AHWdsr8bpiXpjhQOxRy+xs=; b=NFE+c15tYvFXmO
	lb9u89M0kQCIMD+cjX3fSDPuEh/TzeMIXuSHMVBqt/Kjr26IYgBSuguBw8ztVv4ma7NnyXuV7okOF
	lkCDLu1cjYb3hTq4Zq3u1MIxeFjZIulEveIYeqdKLNu5EUpBeCZODY6zVCfqmlLWqoQNREZNQ9jQx
	NYBOUrMz2bp7EHTHjB3bk80dKM9Mq1BCk3jgKILe2Y9LEhFhug/QNOh9NSZz4Ej2bNqvGW/31UJJH
	qhzEuQXU8q88jInqQU3R6u9gi5/e9lEm+Dl+pSceN8JgExTTaDe03/Z1UlsvMlXtdPp6t+uL8PMZQ
	1v6l+kwwaJ0F/h/HZX2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9XtX-00CjWi-1w;
	Wed, 14 Jun 2023 21:19:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9XtU-00CjW0-30
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jun 2023 21:19:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 70ADA60DF4;
	Wed, 14 Jun 2023 21:19:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268C5C433C8;
	Wed, 14 Jun 2023 21:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686777547;
	bh=UEhz/kpeox3MvxRfpolw9Y3cKpiMR3f1Bj+mCSrsu+w=;
	h=From:Date:Subject:To:Cc:From;
	b=GzJN/pOX0gp/xstmlig24vmyKpwxXIYsnKum50WEILylD4i6NTZFzKYVhffUDxW1Z
	 XfP3kJEiqS+53Z56BzKvRJWl4cEsXDphkVNy+DQNzIwXOwcsHHjnpj3L1guuKBw/hK
	 Nti/cS6HDhwvoFs/OnnPPv1R5aTlFX7llyepiWR9tdJTSxhyAmaw13FMj/V+4t+m12
	 omVscywuF6a6xs8I2zCR2jW1FVzEqxEHt2YFQtmnSO2O0XYMsJR9ULTbp5It/FMSeI
	 scbeCkf0FRyKN6q71Lilt9y90n4UZqGzYZzM5XUc8GNfEr8dGEUIBk9Ks9ZHFkdoQ8
	 YTK3QY5/fgFzw==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 14 Jun 2023 22:18:58 +0100
Subject: [PATCH] selftests/mm: Fix cross compilation with LLVM
MIME-Version: 1.0
Message-Id: <20230614-kselftest-mm-llvm-v1-1-180523f277d3@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMIuimQC/x2NQQqDQAwAvyI5N6Db1kK/UnqImtTg7loSsQXx7
 117nIFhNnA2ZYd7tYHxqq5zLtCcKuhHyi9GHQpDqMO5bpsLTs5RFvYFU8IY14QUrnQbSIRagdJ
 15IydUe7Ho/zMNh36bSz6/a8ez33/AdkJN7h6AAAA
To: Andrew Morton <akpm@linux-foundation.org>, 
 Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 llvm@lists.linux.dev, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-c6835
X-Developer-Signature: v=1; a=openpgp-sha256; l=3189; i=broonie@kernel.org;
 h=from:subject:message-id; bh=UEhz/kpeox3MvxRfpolw9Y3cKpiMR3f1Bj+mCSrsu+w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkii7IGttHdFnUF0lmq6L7TPI3idmAEp2wD+7pMnu+
 wqAt+VyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZIouyAAKCRAk1otyXVSH0OZoCA
 CB/4e2WEwUuvnxjdo+IKA2oPKHQrf9LrGE8Bum4qjdJu1TWsTJNE2T1qrdmYPXAQZFQYlmViy7AeDT
 l21o4NRfo4DZmLv6rx3O49Lq+orAst4ATm/P3+uFGOH08jBnhGTAULa/4edYKGQO/xVq3BKr8zSyBn
 2at4XPXbnZzWMqx/LUDYTS699PrfTxw3ZA1q78EnuQMxxhn+RYZdESgpPYMs7kd6wkGE+d5ZUJbJqL
 ku8wS2yMyX66n13s89P4L824wzcEDcenfJDGTyiQyh3xBP1kueox5NrVPUwAT63but7/Wz82WcRQGZ
 DGUl9W9QiMMHEckJYUrVY6fLz5cnkt
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_141909_075995_D8460736 
X-CRM114-Status: GOOD (  13.65  )
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

Currently the MM selftests attempt to work out the target architecture by
using CROSS_COMPILE or otherwise querying the host machine, storing the
target architecture in a variable called MACHINE rather than the usual ARCH
though as far as I can tell (including for x86_64) the value is the same as
we would use for architecture.

When cross compiling with LLVM we don't need a CROSS_COMPILE as LLVM can
support many target architectures in a single build so this logic does not
work, CROSS_COMPILE is not set and we end up selecting tests for the host
rather than target architecture. Fix this by using the more standard ARCH
to describe the architecture, taking it from the environment if specified.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/mm/Makefile | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index 23af4633f0f4..4f0c50c33ba7 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -5,12 +5,15 @@ LOCAL_HDRS += $(selfdir)/mm/local_config.h $(top_srcdir)/mm/gup_test.h
 
 include local_config.mk
 
+ifeq ($(ARCH),)
+
 ifeq ($(CROSS_COMPILE),)
 uname_M := $(shell uname -m 2>/dev/null || echo not)
 else
 uname_M := $(shell echo $(CROSS_COMPILE) | grep -o '^[a-z0-9]\+')
 endif
-MACHINE ?= $(shell echo $(uname_M) | sed -e 's/aarch64.*/arm64/' -e 's/ppc64.*/ppc64/')
+ARCH ?= $(shell echo $(uname_M) | sed -e 's/aarch64.*/arm64/' -e 's/ppc64.*/ppc64/')
+endif
 
 # Without this, failed build products remain, with up-to-date timestamps,
 # thus tricking Make (and you!) into believing that All Is Well, in subsequent
@@ -65,7 +68,7 @@ TEST_GEN_PROGS += ksm_tests
 TEST_GEN_PROGS += ksm_functional_tests
 TEST_GEN_PROGS += mdwe_test
 
-ifeq ($(MACHINE),x86_64)
+ifeq ($(ARCH),x86_64)
 CAN_BUILD_I386 := $(shell ./../x86/check_cc.sh "$(CC)" ../x86/trivial_32bit_program.c -m32)
 CAN_BUILD_X86_64 := $(shell ./../x86/check_cc.sh "$(CC)" ../x86/trivial_64bit_program.c)
 CAN_BUILD_WITH_NOPIE := $(shell ./../x86/check_cc.sh "$(CC)" ../x86/trivial_program.c -no-pie)
@@ -87,13 +90,13 @@ TEST_GEN_PROGS += $(BINARIES_64)
 endif
 else
 
-ifneq (,$(findstring $(MACHINE),ppc64))
+ifneq (,$(findstring $(ARCH),ppc64))
 TEST_GEN_PROGS += protection_keys
 endif
 
 endif
 
-ifneq (,$(filter $(MACHINE),arm64 ia64 mips64 parisc64 ppc64 riscv64 s390x sparc64 x86_64))
+ifneq (,$(filter $(ARCH),arm64 ia64 mips64 parisc64 ppc64 riscv64 s390x sparc64 x86_64))
 TEST_GEN_PROGS += va_high_addr_switch
 TEST_GEN_PROGS += virtual_address_range
 TEST_GEN_PROGS += write_to_hugetlbfs
@@ -112,7 +115,7 @@ $(TEST_GEN_PROGS): vm_util.c
 $(OUTPUT)/uffd-stress: uffd-common.c
 $(OUTPUT)/uffd-unit-tests: uffd-common.c
 
-ifeq ($(MACHINE),x86_64)
+ifeq ($(ARCH),x86_64)
 BINARIES_32 := $(patsubst %,$(OUTPUT)/%,$(BINARIES_32))
 BINARIES_64 := $(patsubst %,$(OUTPUT)/%,$(BINARIES_64))
 

---
base-commit: 858fd168a95c5b9669aac8db6c14a9aeab446375
change-id: 20230614-kselftest-mm-llvm-a25a7daffa6f

Best regards,
-- 
Mark Brown <broonie@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
