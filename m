Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B02DCCA472
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 16:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PPJCI0Qvp3JJZBoYEAeTEtBFKRhXy5tkW9RaGlBFgic=; b=AiysfTM6YAcB8B
	o7VX28Kgq6LKzvrMfuXezX5FzHtQp4mnWNfgobWdfblnVXEPhz/Sz4QtGQLlezFZ5XJadewWhhDWz
	EaG9y/r9d9Gnj6d73UyS69GgCTPYvJBrrrafCkg1J16gFfQxxij24g4zUzj7uIvSqwQSn3twmlsx3
	PDMhUGt5L50hbrbuDB7xKZBDBiIbcrHOfg7UGxdnOTXLZF33RHP8g2tU6B+729A72l/YmHz3AEDaZ
	lH8K/+1uA0vivT1F4DRjffOLz7Icuoh/u2bh/CkqK712VSLh9cuw5NWB5+5hk7E+iJUyzSQs0JihH
	I4judzl3cD5bAJuhMhWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ddR-00000005oYY-1QYp;
	Tue, 30 Sep 2025 16:55:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ddO-00000005oWn-1zXc
	for linux-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 16:55:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68925106F;
	Tue, 30 Sep 2025 09:55:17 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBC5D3F59E;
	Tue, 30 Sep 2025 09:55:22 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 30 Sep 2025 17:54:52 +0100
Subject: [PATCH v2 4/8] perf test coresight: Dismiss clang warning for
 memcpy thread
MIME-Version: 1.0
Message-Id: <20250930-perf_build_android_ndk-v2-4-2ea440b7ef01@arm.com>
References: <20250930-perf_build_android_ndk-v2-0-2ea440b7ef01@arm.com>
In-Reply-To: <20250930-perf_build_android_ndk-v2-0-2ea440b7ef01@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759251311; l=1020;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=cmg2aP/OdJEbju4k0iOcFl8K9ZROTOnbUW84a1thBFk=;
 b=NzpFUhV66bUX0M0Pm4Pz/PqkXq7i194l89hn5IBh5wwZxXbjFJrR5wji5ol2lgY1iOPzIKbUJ
 7G7Jfxa7djGB4lRZv8rn38KcngiSvFQ6kkU5I/55nYuXDh5YsYtJVjU
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_095526_561314_CB5ED392 
X-CRM114-Status: UNSURE (   9.67  )
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

clang-18.1.3 on Ubuntu 24.04.2 reports warning:

  memcpy_thread.c:30:1: warning: non-void function does not return a value in all control paths [-Wreturn-type]
     30 | }
        | ^

Dismiss the warning with returning NULL from the thread function.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/tests/shell/coresight/memcpy_thread/memcpy_thread.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/perf/tests/shell/coresight/memcpy_thread/memcpy_thread.c b/tools/perf/tests/shell/coresight/memcpy_thread/memcpy_thread.c
index 5f886cd09e6b3a62b5690dade94f1f8cae3279d2..7e879217be30a86431989dbf1f36d2134ef259cc 100644
--- a/tools/perf/tests/shell/coresight/memcpy_thread/memcpy_thread.c
+++ b/tools/perf/tests/shell/coresight/memcpy_thread/memcpy_thread.c
@@ -27,6 +27,8 @@ static void *thrfn(void *arg)
 	}
 	for (i = 0; i < len; i++)
 		memcpy(dst, src, a->size * 1024);
+
+	return NULL;
 }
 
 static pthread_t new_thr(void *(*fn) (void *arg), void *arg)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
