Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F5DC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Dec 2021 18:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aHscrgt1BSi6RVdMg0fyKzGXqK0ecYzJV7zEYdC/hHM=; b=zk6DcUKlM77bBd
	DEKj9Q75eVPCfTsts+k5kMNn+x5kAry1J/hjTyuAJw4c6YdgsDHq7FQkKevaAixBbWxay0wAuuhRw
	Tuu6UFGJXzQ3/4IGAWCnH7Kpd/faNTjOdjfOhlLB9EzWHoYCFnemSW5kFq2T3xt3TIluJ6ngnkIrW
	xlVthT8m7iUUU5lSAp0cQL4DEjF5wPAxO0bsrzcS9oEvpH0ygATYnL32rxqz52tliel4os3SK/WFf
	t9Pl3Kq2HIXCHQdq8kA5nIxhnSPGME/NC9NLHQ7+++Rj8O14hll10EK22D9kqL3JimT+5J02uWOBs
	E8BKUcekJZfDhPBTv0mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muess-009ea2-Eo; Tue, 07 Dec 2021 18:08:10 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muesD-009eJF-HS; Tue, 07 Dec 2021 18:07:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDC9F13A1;
 Tue,  7 Dec 2021 10:07:27 -0800 (PST)
Received: from e127744.cambridge.arm.com (e127744.cambridge.arm.com
 [10.1.37.151])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2A8D33F73B;
 Tue,  7 Dec 2021 10:07:23 -0800 (PST)
From: German Gomez <german.gomez@arm.com>
To: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 acme@kernel.org
Cc: German Gomez <german.gomez@arm.com>, John Garry <john.garry@huawei.com>,
 Will Deacon <will@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v2 2/3] perf tools: Rename perf_event_arm_regs for ARM64
 registers
Date: Tue,  7 Dec 2021 18:06:51 +0000
Message-Id: <20211207180653.1147374-3-german.gomez@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207180653.1147374-1-german.gomez@arm.com>
References: <20211207180653.1147374-1-german.gomez@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_100729_652215_93C2CE3B 
X-CRM114-Status: UNSURE (   9.41  )
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

The registers for ARM and ARM64 are enumerated using two enums that have
the same name. In order to be able to import both headers, the name of
one can be replaced using the C preprocessor like so:

  #define perf_event_arm_regs perf_event_arm64_regs
  #include <asm/perf_regs.h>
  #undef perf_event_arm_regs

This patch updates all imports of ARM64's perf_regs.h in order to
prevent the naming collision.

Signed-off-by: German Gomez <german.gomez@arm.com>
---
 tools/perf/arch/arm64/include/perf_regs.h | 2 ++
 tools/perf/util/libunwind/arm64.c         | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/tools/perf/arch/arm64/include/perf_regs.h b/tools/perf/arch/arm64/include/perf_regs.h
index fa3e07459..1f0d78b9f 100644
--- a/tools/perf/arch/arm64/include/perf_regs.h
+++ b/tools/perf/arch/arm64/include/perf_regs.h
@@ -4,7 +4,9 @@
 
 #include <stdlib.h>
 #include <linux/types.h>
+#define perf_event_arm_regs perf_event_arm64_regs
 #include <asm/perf_regs.h>
+#undef perf_event_arm_regs
 
 void perf_regs_load(u64 *regs);
 
diff --git a/tools/perf/util/libunwind/arm64.c b/tools/perf/util/libunwind/arm64.c
index c397be0c2..15f60fd09 100644
--- a/tools/perf/util/libunwind/arm64.c
+++ b/tools/perf/util/libunwind/arm64.c
@@ -23,7 +23,9 @@
 
 #include "unwind.h"
 #include "libunwind-aarch64.h"
+#define perf_event_arm_regs perf_event_arm64_regs
 #include <../../../../arch/arm64/include/uapi/asm/perf_regs.h>
+#undef perf_event_arm_regs
 #include "../../arch/arm64/util/unwind-libunwind.c"
 
 /* NO_LIBUNWIND_DEBUG_FRAME is a feature flag for local libunwind,
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
