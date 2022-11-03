Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70D6C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 08:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dwKRhV50gnz4VRsF/L4WiHY/0LViO/ZguRQZxf0Rqzw=; b=QZln0r3CYQFNms
	QM6aYfSjsRY+XgLu1l09GQqDsnFewM0SBo1PxMkIkHdpJmPn/0fa0th/8FrilubMPsmjjabdp5/gg
	B+WZDmGeXjUg+5B0+vYcWMw68Qx88zXmZ9pRbvfX7cTBaEOAYcOCqpgtyyify9mw57xjsC+tKvmGe
	vpYnebUlPTe7PrPH8GBISr4MJNet5K49eQGXJB0/o1ZtghP+W1Kdi7PE91035NQzKMlZOKz4dTSZ8
	c8AB3B4mN91dCE0Jqve6UHOsfxOZ9V9H7q49b+A86Fol7rblpBv2LP0FTkE+CeSmh0mroLUKZjj0Q
	uB+MpFemlEwwbOOEZ8uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqVDp-00GZUs-MY; Thu, 03 Nov 2022 08:05:09 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqVDm-00GZU3-Ky
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 08:05:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 39448B8252B;
	Thu,  3 Nov 2022 08:05:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 663D7C433C1;
	Thu,  3 Nov 2022 08:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667462704;
	bh=0H/9grb2h1ZdT4tEjfsYpds+m01aFKc77P1+gyy/5Kc=;
	h=From:To:Cc:Subject:Date:From;
	b=S61gmKRQeL/qIkrXM6DcGZ60Mxme4miDWVTrAJLek6OczOIhvnd3ew4OSq5qsaaL6
	 QCFj8EkymGXHCVM61erCNj1zxqL5YMlqVvPStNdgVP83D9/7ZK56YCYt/U4BjP2BSS
	 u3zyHDqNoR9v3t3j3Fu7WRK74jq05iIa7w0y61otsQCG88GQeofE5K2WqATIXiA7uh
	 L9dsUv/FkjxM3VGXui2WiADK5oC9wGa0auHfjlsgw4a6isUYRaf0fXtvFbEOwn+U1C
	 1ktyawcdNc1bXSFZIqfhUE+iDE1XG7Xaiwd+DpQrXJ0AUfhrVkCR2DX5jyH6zdB5YK
	 fuQs6j5P68noQ==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	shuah@kernel.org,
	skhan@linuxfoundation.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	"haocheng . zy" <haocheng.zy@linux.alibaba.com>,
	Mao Han <han_mao@linux.alibaba.com>,
	Guo Ren <guoren@linux.alibaba.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Elliott Hughes <enh@google.com>
Subject: [PATCH V2] selftests/vDSO: Add riscv getcpu & gettimeofday test
Date: Thu,  3 Nov 2022 04:04:51 -0400
Message-Id: <20221103080451.1642500-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_010506_875180_02B848D1 
X-CRM114-Status: GOOD (  10.25  )
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

From: Guo Ren <guoren@kernel.org>

Enable vDSO getcpu & gettimeofday test for riscv. But only riscv64
supports __vdso_gettimeofday and riscv32 is under development.

VERSION
{
        LINUX_4.15 {
        global:
                __vdso_rt_sigreturn;
                __vdso_gettimeofday;
                __vdso_clock_gettime;
                __vdso_clock_getres;
                __vdso_getcpu;
                __vdso_flush_icache;
        local: *;
        };
}

Co-developed-by: haocheng.zy <haocheng.zy@linux.alibaba.com>
Signed-off-by: haocheng.zy <haocheng.zy@linux.alibaba.com>
Suggested-by: Mao Han <han_mao@linux.alibaba.com>
Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Elliott Hughes <enh@google.com>
---
 tools/testing/selftests/vDSO/vdso_test_getcpu.c       | 4 ++++
 tools/testing/selftests/vDSO/vdso_test_gettimeofday.c | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/tools/testing/selftests/vDSO/vdso_test_getcpu.c b/tools/testing/selftests/vDSO/vdso_test_getcpu.c
index fc25ede131b8..1df5d057d79f 100644
--- a/tools/testing/selftests/vDSO/vdso_test_getcpu.c
+++ b/tools/testing/selftests/vDSO/vdso_test_getcpu.c
@@ -14,7 +14,11 @@
 #include "../kselftest.h"
 #include "parse_vdso.h"
 
+#if defined(__riscv)
+const char *version = "LINUX_4.15";
+#else
 const char *version = "LINUX_2.6";
+#endif
 const char *name = "__vdso_getcpu";
 
 struct getcpu_cache;
diff --git a/tools/testing/selftests/vDSO/vdso_test_gettimeofday.c b/tools/testing/selftests/vDSO/vdso_test_gettimeofday.c
index 8ccc73ed8240..e411f287a426 100644
--- a/tools/testing/selftests/vDSO/vdso_test_gettimeofday.c
+++ b/tools/testing/selftests/vDSO/vdso_test_gettimeofday.c
@@ -27,6 +27,9 @@
 #if defined(__aarch64__)
 const char *version = "LINUX_2.6.39";
 const char *name = "__kernel_gettimeofday";
+#elif defined(__riscv)
+const char *version = "LINUX_4.15";
+const char *name = "__vdso_gettimeofday";
 #else
 const char *version = "LINUX_2.6";
 const char *name = "__vdso_gettimeofday";
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
