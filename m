Return-Path: <SRS0=a4kH=HG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B241CC433E0
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 14:51:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 188C264F4E
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 14:51:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 188C264F4E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=distanz.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/h2fGLAGXH2hVddZhe87LgfrJ1oomr4885jxlcH9kmE=; b=gHWnTC6tY2YOnI5YQNiWj4vB/t
	DiCOa+mMcfzVhbvBG+38pk906fud4xbFFGrvrufKacBpMkGRWS5hVN6An1U6brn7GD5IlWxUQmdvH
	txX+RHzwoSyWgfZ13JjsALarbEldsnfYSuC5WR8V/Jw221nF5WP2ewPMk0jC2SSIJoLVNi6UK44of
	I6P2FcN3M/OO2MLtqhdE/ENrCx4sibq2RDY6Nn9BTJF5HHdbZfXgtla+VbymBDVqkQ8jExt7ych8p
	MVawni0SxuCI1jLk5+HfWBG3XyPslAC2HptykjN1vp/LLszEE8/Bc4YkXTUCxr5a5P26YrgXrUzX4
	//fNEaxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7fyA-0004uq-RC; Thu, 04 Feb 2021 14:50:54 +0000
Received: from sym2.noone.org ([178.63.92.236])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7fy8-0004uA-2O
 for linux-riscv@lists.infradead.org; Thu, 04 Feb 2021 14:50:52 +0000
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 4DWhLW17lHzvjfp; Thu,  4 Feb 2021 15:50:42 +0100 (CET)
From: Tobias Klauser <tklauser@distanz.ch>
To: Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH] selftests/vDSO: fix ABI selftest on riscv
Date: Thu,  4 Feb 2021 15:50:42 +0100
Message-Id: <20210204145042.7345-1-tklauser@distanz.ch>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_095052_252443_0B3F198A 
X-CRM114-Status: UNSURE (   8.40  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Only older versions of the RISC-V GCC toolchain define __riscv__. Check
for __riscv as well, which is used by newer GCC toolchains. Also set
VDSO_32BIT based on __riscv_xlen.

Before (on riscv64):

$ ./vdso_test_abi
[vDSO kselftest] VDSO_VERSION: LINUX_4
Could not find __vdso_gettimeofday
Could not find __vdso_clock_gettime
Could not find __vdso_clock_getres
clock_id: CLOCK_REALTIME [PASS]
Could not find __vdso_clock_gettime
Could not find __vdso_clock_getres
clock_id: CLOCK_BOOTTIME [PASS]
Could not find __vdso_clock_gettime
Could not find __vdso_clock_getres
clock_id: CLOCK_TAI [PASS]
Could not find __vdso_clock_gettime
Could not find __vdso_clock_getres
clock_id: CLOCK_REALTIME_COARSE [PASS]
Could not find __vdso_clock_gettime
Could not find __vdso_clock_getres
clock_id: CLOCK_MONOTONIC [PASS]
Could not find __vdso_clock_gettime
Could not find __vdso_clock_getres
clock_id: CLOCK_MONOTONIC_RAW [PASS]
Could not find __vdso_clock_gettime
Could not find __vdso_clock_getres
clock_id: CLOCK_MONOTONIC_COARSE [PASS]
Could not find __vdso_time

After (on riscv32):

$ ./vdso_test_abi
[vDSO kselftest] VDSO_VERSION: LINUX_4.15
The time is 1612449376.015086
The time is 1612449376.18340784
The resolution is 0 1
clock_id: CLOCK_REALTIME [PASS]
The time is 774.842586182
The resolution is 0 1
clock_id: CLOCK_BOOTTIME [PASS]
The time is 1612449376.22536565
The resolution is 0 1
clock_id: CLOCK_TAI [PASS]
The time is 1612449376.20885172
The resolution is 0 4000000
clock_id: CLOCK_REALTIME_COARSE [PASS]
The time is 774.845491269
The resolution is 0 1
clock_id: CLOCK_MONOTONIC [PASS]
The time is 774.849534200
The resolution is 0 1
clock_id: CLOCK_MONOTONIC_RAW [PASS]
The time is 774.842139684
The resolution is 0 4000000
clock_id: CLOCK_MONOTONIC_COARSE [PASS]
Could not find __vdso_time

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 tools/testing/selftests/vDSO/vdso_config.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vDSO/vdso_config.h b/tools/testing/selftests/vDSO/vdso_config.h
index 6a6fe8d4ff55..6188b16827d1 100644
--- a/tools/testing/selftests/vDSO/vdso_config.h
+++ b/tools/testing/selftests/vDSO/vdso_config.h
@@ -47,10 +47,12 @@
 #elif defined(__x86_64__)
 #define VDSO_VERSION		0
 #define VDSO_NAMES		1
-#elif defined(__riscv__)
+#elif defined(__riscv__) || defined(__riscv)
 #define VDSO_VERSION		5
 #define VDSO_NAMES		1
+#if __riscv_xlen == 32
 #define VDSO_32BIT		1
+#endif
 #else /* nds32 */
 #define VDSO_VERSION		4
 #define VDSO_NAMES		1
-- 
2.30.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
