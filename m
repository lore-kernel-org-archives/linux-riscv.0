Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CDACCA471
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Oct 2025 16:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vU/zw45OR+aBkDTZZZMwsS2Ac/qDdIDSavVbNTQi0MY=; b=3ukby1WMURoQsD
	ZkBEuGeW+YJ5w188Y5Zglm9Nnkq3nytoR5ea3TzwGDXm1YhVht1ubUEQLSQ983U0iCwa2XmOuR57R
	AylgkmFyIJnxuLmsmSs8x3t0lyMVcLmLZjTlLCVxmUsC3gv4oCiKg5Cm/nX8UJleevjZEal5mQhm3
	uG7abNWflIAVs7Lhhr25YwUYJe0rwACDjNw1zmlZoxPpd0fpPZVwr/sa9DW1ftx7iBTL/a4Ia0y0H
	yFXqHXVSLtRJKzzfsVoCS5kDr7qisCHG0FdwTVHc9cxT07fKnpKGWdEjmLXx6RST0oxdMmewjK37T
	tOOYEFU7EgHbxqQD+edQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5nyA-00000000NE1-0SYU;
	Mon, 06 Oct 2025 16:21:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5ny8-00000000NDO-2bC9
	for linux-riscv@lists.infradead.org;
	Mon, 06 Oct 2025 16:21:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F160C1515;
	Mon,  6 Oct 2025 09:21:39 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 684C33F738;
	Mon,  6 Oct 2025 09:21:45 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 06 Oct 2025 17:21:25 +0100
Subject: [PATCH v3 3/9] perf build: Correct CROSS_ARCH for clang
MIME-Version: 1.0
Message-Id: <20251006-perf_build_android_ndk-v3-3-4305590795b2@arm.com>
References: <20251006-perf_build_android_ndk-v3-0-4305590795b2@arm.com>
In-Reply-To: <20251006-perf_build_android_ndk-v3-0-4305590795b2@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, James Clark <james.clark@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759767696; l=1923;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=m3SmlzRsMKVpO74OXfiVE3r/DuuiN/mWjDes/0cwih0=;
 b=P/jhnB+7EFmN27NsILJyvdp237PuNM9MUTeMFHprYYaxLA9gJqDTnVDbR8lhu5730vVdvjaG0
 /AvvxHOtS/eBQ59/Cb4kIikDOUVFG9H+euApMwSOZP2VL59wm5Fu2M4
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_092148_708865_AF10C9CD 
X-CRM114-Status: GOOD (  10.05  )
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

Clang's -dumpmachine outputs "aarch64-unknown-linux-gnu", which does not
match the MultiArch convention. This prevents the build system from
detecting installed packages.

Fix by stripping the trailing '-' from CROSS_COMPILE when setting
CROSS_ARCH.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/build/feature/Makefile | 2 +-
 tools/perf/Makefile.perf     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
index bd615a708a0aa89ddbe87401f04bd736e384a9c4..214ccaee69181cce1f8e736b85c8dc940efa6c19 100644
--- a/tools/build/feature/Makefile
+++ b/tools/build/feature/Makefile
@@ -94,7 +94,7 @@ else
   # paths are used instead.
   ifdef CROSS_COMPILE
     ifeq ($(PKG_CONFIG_LIBDIR)$(PKG_CONFIG_PATH)$(PKG_CONFIG_SYSROOT_DIR),)
-      CROSS_ARCH = $(shell $(CC) -dumpmachine)
+      CROSS_ARCH = $(notdir $(CROSS_COMPILE:%-=%))
       PKG_CONFIG_LIBDIR := /usr/local/$(CROSS_ARCH)/lib/pkgconfig/
       PKG_CONFIG_LIBDIR := $(PKG_CONFIG_LIBDIR):/usr/local/lib/$(CROSS_ARCH)/pkgconfig/
       PKG_CONFIG_LIBDIR := $(PKG_CONFIG_LIBDIR):/usr/lib/$(CROSS_ARCH)/pkgconfig/
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index e2150acc2c13325f93a2d5cd4a60b4a6bfeedc94..47bc9d8a91df90535408c427909bcb3f7cd50970 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -194,7 +194,7 @@ else
   # paths are used instead.
   ifdef CROSS_COMPILE
     ifeq ($(PKG_CONFIG_LIBDIR)$(PKG_CONFIG_PATH)$(PKG_CONFIG_SYSROOT_DIR),)
-      CROSS_ARCH = $(shell $(CC) -dumpmachine)
+      CROSS_ARCH = $(notdir $(CROSS_COMPILE:%-=%))
       PKG_CONFIG_LIBDIR := /usr/local/$(CROSS_ARCH)/lib/pkgconfig/
       PKG_CONFIG_LIBDIR := $(PKG_CONFIG_LIBDIR):/usr/local/lib/$(CROSS_ARCH)/pkgconfig/
       PKG_CONFIG_LIBDIR := $(PKG_CONFIG_LIBDIR):/usr/lib/$(CROSS_ARCH)/pkgconfig/

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
