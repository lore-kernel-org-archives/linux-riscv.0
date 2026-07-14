Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B205AC43458
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 04:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pw4i4hSPeZm8ZtV6RKcXsAEcgD9pP3hqlX3WZroYdms=; b=U8/iU8mGv2PBBr
	JAdbmv5ugHD7N/hn9IHpAFWN/GIyFCy5PbQTMXAt7zYM9QXmnZztDnNwRHwr2+rPtm6G0CeumfLV7
	5zcu39+RjkE2YTWwPJMxh+5Z9H64xNTIv3V7vLKoT8vrGFIXn9TKi5ZP39llZxAZp4BcNrtR82Vxk
	OQ8KW3HCNrsuZWW6c8/y3J/DqMyF3fr+gS7MI2eEEW0JKNRJ7MNU17KWCizLG6+p4t9AYmz0D2QGN
	YLJEdIk1O8lw73xtPwafC3vWaTPMUjvRsB/jbrkT3lA7dshIWFiDoYO1F5zkcv0PmaorGHA+R0Ke5
	8UaAA/CsIT0GyoAYcLiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjUnk-0000000Asn7-1lcG;
	Tue, 14 Jul 2026 04:31:24 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjUnh-0000000AsmD-3S3O
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 04:31:23 +0000
Received: from hwang4-g16.DHCP (unknown [58.248.157.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 7F36B40373;
	Tue, 14 Jul 2026 04:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1784003477;
	bh=Gi0KRZCr7B+KqdLo/T8hwC2wZEnpSHWjct+XZQ6HPwM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=EbS3oRv5AWR9hZU3JpzBgp7gMoSMfw4y/wItycZ5pi6/8h7p4/Qb65NN6KhIcw/i0
	 /pY9IbAlocArtUIV/+cWdOlHuBK+4dtWfTiVcr/qMJa0yX2LAakkUhpEHdkBChpekC
	 fFqdcB+8J5LlQ+E76uxrst6JCLy2LnzTbHwSm4YtC5sSSBRP29MXrMY8aDqMhfp0nt
	 6C0L6sgZkEHSi+GCMPDfRdIJ85Tdkq9JD62cAj8w/CXxIZuAUhbbOHWiKo0ipBwXmZ
	 Zou3FWJ4gwDCRrMhKD7ycdUOOjiRTjEFh4tvdWoTAMpJtT9xsu2ro2k2tXt9l/kHBg
	 +fXVty4PavAz0aOwnbllF1me99glKuKhm2ErnaIJFGv9y6D/2veHmpmkcd048cosL5
	 9JOAGca8BDalfXSU+kCg7gW7zMyRvk8ucZ3YauhKr16X7B8u4s08Y8XsmkDL38uCc9
	 fgOoF5jWiDkJbQ6Bhz2ufN/ig4/5tTxxJfB375k3KIirIN4OLRY1LmE/B6rLslwm80
	 GiqjAv1Z9LmIVcSkllqwkj2IHvtHBCsvEcXoB6DQkF4/hEfaO4WZATk13LdQaXrV94
	 LUZz69cWkAsqR4N7y9EXv/2NlPsGfo+me+EF4uKmyuAtvbXZ6tIX0bUWtoYrvREj3q
	 Biez+F549EY7NDxFV9ET2U2g=
From: Hui Wang <hui.wang@canonical.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	shuah@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	debug@rivosinc.com,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: hui.wang@canonical.com
Subject: [PATCH] kselftest/riscv: Improve building under native riscv64 environment
Date: Tue, 14 Jul 2026 12:31:08 +0800
Message-ID: <20260714043108.24114-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_213122_165084_FC7478A2 
X-CRM114-Status: UNSURE (   9.16  )
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

When we build the kselftest natively, we usually don't pass an ARCH=
parameter. In this case if I build kselftest/riscv under a riscv64
environment, the testcase will not be built at all because 'uname -m'
returns riscv64 instead of riscv.

    make -C tools/testing/selftests TARGETS=riscv
    make: Entering directory 'linux/tools/testing/selftests'
    make[1]: Entering directory 'linux/tools/testing/selftests/riscv'
    make[1]: Leaving directory 'linux/tools/testing/selftests/riscv'
    make: Leaving directory 'linux/tools/testing/selftests'

This issue can be fixed by getting ARCH from scripts/subarch.include,
whose SUBARCH normalizes 'riscv64' to 'riscv'. This also aligns with
how other selftests (e.g. arm64, x86) already resolve ARCH.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 tools/testing/selftests/riscv/Makefile | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/riscv/Makefile b/tools/testing/selftests/riscv/Makefile
index 5671b4405a12..43eddb919705 100644
--- a/tools/testing/selftests/riscv/Makefile
+++ b/tools/testing/selftests/riscv/Makefile
@@ -1,8 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
 # Originally tools/testing/arm64/Makefile
 
+# A proper top_srcdir is needed by KSFT(lib.mk)
+top_srcdir = $(realpath ../../../../)
+
 # When ARCH not overridden for crosscompiling, lookup machine
-ARCH ?= $(shell uname -m 2>/dev/null || echo not)
+include $(top_srcdir)/scripts/subarch.include
+ARCH ?= $(SUBARCH)
 
 ifneq (,$(filter $(ARCH),riscv))
 RISCV_SUBTARGETS ?= abi hwprobe mm sigreturn vector cfi
@@ -12,9 +16,6 @@ endif
 
 CFLAGS := -Wall -O2 -g
 
-# A proper top_srcdir is needed by KSFT(lib.mk)
-top_srcdir = $(realpath ../../../../)
-
 # Additional include paths needed by kselftest.h and local headers
 CFLAGS += -I$(top_srcdir)/tools/testing/selftests/
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
