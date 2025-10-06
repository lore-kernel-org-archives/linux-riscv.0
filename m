Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403CCCAC5B8
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Oct 2025 16:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k9G6Rdz2f+4We9Ixb0OXcT1i1FbxqzVgv6e4VJB9HhI=; b=SrI/V/xsHZoOE6
	Ka0gjPbs2CcIRzYEFwbq3PxDRnUQ/ilwXqGsLDXmye15edzKKizqjuv8qQznAbYUMe0XMfkCjfHx1
	0ZhpJ3Yco3c1WILJDUyLrATqb3cTqikZWxmV2od3juKDwTZ7vKgDWXH5W778A/1MnV640yCDMPXQC
	ig1jNI8i1NWS50Rzc6k/lhfPhsV1iXIfdiYJ9fJGiwsbOlOFrV9A/1qG/bhZEwsuPhiN0ZZCOcK/v
	TkA+wgmzQrzPleAuxfsex2iQNaDPGunwhroBEBnQpXoAClhQjYphwjHRkR2EAHGGmeMyjLd12i0SC
	vBID+x2lWut/vHWDG3uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5nyJ-00000000NIT-48dk;
	Mon, 06 Oct 2025 16:21:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5nyH-00000000NGm-1kTd
	for linux-riscv@lists.infradead.org;
	Mon, 06 Oct 2025 16:21:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58DB21516;
	Mon,  6 Oct 2025 09:21:48 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C43C33F738;
	Mon,  6 Oct 2025 09:21:53 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 06 Oct 2025 17:21:28 +0100
Subject: [PATCH v3 6/9] perf test coresight: Dismiss clang warning for
 thread loop
MIME-Version: 1.0
Message-Id: <20251006-perf_build_android_ndk-v3-6-4305590795b2@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759767696; l=2703;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=a3IPmV5jlnePssZURERzGDN5YmfphWeM3ATbsnwKAQg=;
 b=OsSTrd6d//ZmcbwP7/iVL4/KlsaJyKeaLDALKKWQf+IycnhEC8MFr0EWMFuV+FtOy/8aUMlVK
 XiDTqhxx8s0DHMhBJ9B15cITHrjjtS/ShJAyu37L2/Ngklwrhonzipy
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_092157_601320_C5261D43 
X-CRM114-Status: UNSURE (   9.91  )
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

  thread_loop.c:41:23: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
     41 |                 : /* in */ [i] "r" (i), [len] "r" (len)
        |                                     ^
  thread_loop.c:37:8: note: use constraint modifier "w"
     37 |                 "add %[i], %[i], #1\n"
        |                      ^~~~
        |                      %w[i]
  thread_loop.c:41:23: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
     41 |                 : /* in */ [i] "r" (i), [len] "r" (len)
        |                                     ^
  thread_loop.c:37:14: note: use constraint modifier "w"
     37 |                 "add %[i], %[i], #1\n"
        |                            ^~~~
        |                            %w[i]
  thread_loop.c:41:23: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
     41 |                 : /* in */ [i] "r" (i), [len] "r" (len)
        |                                     ^
  thread_loop.c:38:8: note: use constraint modifier "w"
     38 |                 "cmp %[i], %[len]\n"
        |                      ^~~~
        |                      %w[i]
  thread_loop.c:41:38: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
     41 |                 : /* in */ [i] "r" (i), [len] "r" (len)
        |                                                    ^
  thread_loop.c:38:14: note: use constraint modifier "w"
     38 |                 "cmp %[i], %[len]\n"
        |                            ^~~~~~
        |                            %w[len]

Use the modifier "w" for 32-bit register access.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/tests/shell/coresight/thread_loop/thread_loop.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/tests/shell/coresight/thread_loop/thread_loop.c b/tools/perf/tests/shell/coresight/thread_loop/thread_loop.c
index e05a559253ca9d9366ad321d520349042fb07fca..86f3f548b00631682767665fc5e9d5b8551a3634 100644
--- a/tools/perf/tests/shell/coresight/thread_loop/thread_loop.c
+++ b/tools/perf/tests/shell/coresight/thread_loop/thread_loop.c
@@ -34,8 +34,8 @@ static void *thrfn(void *arg)
 	}
 	asm volatile(
 		"loop:\n"
-		"add %[i], %[i], #1\n"
-		"cmp %[i], %[len]\n"
+		"add %w[i], %w[i], #1\n"
+		"cmp %w[i], %w[len]\n"
 		"blt loop\n"
 		: /* out */
 		: /* in */ [i] "r" (i), [len] "r" (len)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
