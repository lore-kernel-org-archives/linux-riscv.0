Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E8BC48BC4
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 11:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dhVJu7QrL3VRwE+5h93oobPUrvD6DeUsAcH02aVC9cA=; b=vLFGWJF0WQ9V9u
	nvtyBRQZBC0YOm+lOtdRTpX/OwScXGGcT6LVquHUPp5D00+db+4In4GbJ+d+Mj7ezziZq0ulCYciD
	2vKZ5yItml/iWiALIpjWOEXDRmLFjXgSEfAL/Fi7v1Oha8SYX43+H6ksaYDBBVji1E+QkiI/qI5qO
	kL2yEwpneSxx3j3fc5KpH6Sk/ysCrKVZQvjDr+tYcp0Td0gtrwpfs2B6qbJkeO92e+cCuDR3YyCve
	7CFHITCe3BwnRDhNJMF2M3LLqkHwIGN5lCrh3YMBn7Zo2AGKdld2eymncr2WBAyOA8PCPSIZ1/EP6
	lpav+4qgVlp854KXRcCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raDd7-0000000ChxU-3kd1;
	Wed, 14 Feb 2024 11:40:45 +0000
Received: from out-184.mta0.migadu.com ([2001:41d0:1004:224b::b8])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raDd4-0000000Chun-317p
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 11:40:44 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1707910840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ceIPkkMA3m3CUBnXP3Si9TKYLZlh1ovGGEt5qyffvMM=;
	b=Vg3hlHC9ifATj2zwM4zqt65oYEOYkZjfvbjqdT7Vp7OLdAAhGPY8detKJ1ebR0CveIPXFl
	hPFbjlGoQ7ZhrUFFq6IWLcmgfTnjG4PuMg9WVQrJMe+jxmkeYjwVG/8+Hk5i9PRfmBeMR4
	kiAH5tHAI0XeIRT9JImIt+/xV7SeY5g=
From: Leo Yan <leo.yan@linux.dev>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>,
	James Clark <james.clark@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ming Wang <wangming01@loongson.cn>,
	Kan Liang <kan.liang@linux.intel.com>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Leo Yan <leo.yan@linux.dev>
Subject: [PATCH v1 4/4] perf build: Cleanup perf register configuration
Date: Wed, 14 Feb 2024 19:39:47 +0800
Message-Id: <20240214113947.240957-5-leo.yan@linux.dev>
In-Reply-To: <20240214113947.240957-1-leo.yan@linux.dev>
References: <20240214113947.240957-1-leo.yan@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_034042_917301_BBE44690 
X-CRM114-Status: UNSURE (   9.07  )
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

The target is to allow the tool to always enable the perf register
feature for native parsing and cross parsing, and current code doesn't
depend on the macro 'HAVE_PERF_REGS_SUPPORT'.

This patch remove the variable 'NO_PERF_REGS' and the defined macro
'HAVE_PERF_REGS_SUPPORT' from the Makefile.

Signed-off-by: Leo Yan <leo.yan@linux.dev>
---
 tools/perf/Makefile.config | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 8b740c668ab7..7de7111c0226 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -28,8 +28,6 @@ include $(srctree)/tools/scripts/Makefile.arch
 
 $(call detected_var,SRCARCH)
 
-NO_PERF_REGS := 1
-
 ifneq ($(NO_SYSCALL_TABLE),1)
   NO_SYSCALL_TABLE := 1
 
@@ -50,7 +48,6 @@ endif
 
 # Additional ARCH settings for ppc
 ifeq ($(SRCARCH),powerpc)
-  NO_PERF_REGS := 0
   CFLAGS += -I$(OUTPUT)arch/powerpc/include/generated
   LIBUNWIND_LIBS := -lunwind -lunwind-ppc64
 endif
@@ -66,41 +63,27 @@ ifeq ($(SRCARCH),x86)
   else
     LIBUNWIND_LIBS = -lunwind-x86 -llzma -lunwind
   endif
-  NO_PERF_REGS := 0
 endif
 
 ifeq ($(SRCARCH),arm)
-  NO_PERF_REGS := 0
   LIBUNWIND_LIBS = -lunwind -lunwind-arm
 endif
 
 ifeq ($(SRCARCH),arm64)
-  NO_PERF_REGS := 0
   CFLAGS += -I$(OUTPUT)arch/arm64/include/generated
   LIBUNWIND_LIBS = -lunwind -lunwind-aarch64
 endif
 
 ifeq ($(SRCARCH),loongarch)
-  NO_PERF_REGS := 0
   CFLAGS += -I$(OUTPUT)arch/loongarch/include/generated
   LIBUNWIND_LIBS = -lunwind -lunwind-loongarch64
 endif
 
-ifeq ($(SRCARCH),riscv)
-  NO_PERF_REGS := 0
-endif
-
-ifeq ($(SRCARCH),csky)
-  NO_PERF_REGS := 0
-endif
-
 ifeq ($(ARCH),s390)
-  NO_PERF_REGS := 0
   CFLAGS += -fPIC -I$(OUTPUT)arch/s390/include/generated
 endif
 
 ifeq ($(ARCH),mips)
-  NO_PERF_REGS := 0
   CFLAGS += -I$(OUTPUT)arch/mips/include/generated
   LIBUNWIND_LIBS = -lunwind -lunwind-mips
 endif
@@ -161,10 +144,6 @@ endif
 FEATURE_CHECK_CFLAGS-libopencsd := $(LIBOPENCSD_CFLAGS)
 FEATURE_CHECK_LDFLAGS-libopencsd := $(LIBOPENCSD_LDFLAGS) $(OPENCSDLIBS)
 
-ifeq ($(NO_PERF_REGS),0)
-  CFLAGS += -DHAVE_PERF_REGS_SUPPORT
-endif
-
 # for linking with debug library, run like:
 # make DEBUG=1 LIBDW_DIR=/opt/libdw/
 ifdef LIBDW_DIR
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
