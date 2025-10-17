Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D93CCD19F
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 15:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q5wghcJj4W34eSQ5HRbvftQK6tn1ZkGhrOXTjB5ENn8=; b=l7kpoBP3cWDj9B
	wJ4wxLYW7vyxeX/jCFhowMTSlpXey95U2xj+pRo7TFUAIrzHdLwKuvC8fh2InZi08q8uxIQuCuaIK
	ZgnXiQGLZIPbdsYCoJNTQicyAM1OBSGkIkulD1/vxjgqpN1NCVaJIMe7rSpVJ3lBbAsHAl78BRYkD
	Rt6pZBO6sHiClvdUkFRyFpGFUh0U2LGi43dmS0tJH/Pl6s6g/64u8bqUo949qC9tZipZVH/D5cCcT
	t86ZaZ4/iP3zVJ4owuhgJZzr/e2YoSCJMs7ga6dZR+oHk7qFThx1subYc+RR3Q2XECQjQeas9sM7s
	9bWZPqLsrKYZ3NubGa4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mkU-00000008Kj3-3lGG;
	Fri, 17 Oct 2025 15:52:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mkU-00000008Kih-0CQM
	for linux-riscv@bombadil.infradead.org;
	Fri, 17 Oct 2025 15:52:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pIG61GxOB4f+willlOFgoEXV7HX79IGhQTc5DPiOLec=; b=ftLl6BoijPp0tofNT/vo0XMdiL
	eHo8newRojEYe3J1yuVk2p75YTgZZlQ5IhOlNNJPX/AEiwIzb9QeqO9CaO5HovAR2JKboOnmfMKJG
	dR7t+1H2YJHQZCn8H4iw6VxsPVLpaCBFRq+uR/e1vEdBj1hpTTQg4da/TEqVF/77i8uekaq3NaM+X
	XLmJIWJc0gL4r3Brw+/ZKcNxffU8McQkg2buh2S9vXXm94YXXkomO0dIKqLA9OGS4Fh7uEtmVSRJa
	MV9mLLs3U7RP2VHZKyTYJ2NuBVvYJ/vpavs1zR/I111zyhwb04m+l+v61xxb4kcTmWdjWjx+yH4Kz
	HVj6CAmQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mkQ-00000007hmd-33mc
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 15:52:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0EFB74B885;
	Fri, 17 Oct 2025 15:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5444CC116B1;
	Fri, 17 Oct 2025 15:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760716324;
	bh=exOzAKYyZqWdz3l/rN4xuKsrpx1NjgptUR/yfAc9w/0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oLE88u86G77oJrcRTZwIecPAKmfrB6e9/tRB1tYMLffW9mPUH4RJqJ1WVwaSJFkXt
	 nGPmwQs1QjumTeLc1rs0NjnkmhRfKwU4pxwRTW2JFYpTibuLzbogPnUT9sXgSExHoQ
	 1CyvTft/pwR1LmSoVXthVo4ck0GfuE2xx2a1NW9I=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Leo Yan <leo.yan@arm.com>,
	Ian Rogers <irogers@google.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Justin Stitt <justinstitt@google.com>,
	Bill Wendling <morbo@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	James Clark <james.clark@linaro.org>,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.15 152/276] tools build: Align warning options with perf
Date: Fri, 17 Oct 2025 16:54:05 +0200
Message-ID: <20251017145148.027432958@linuxfoundation.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017145142.382145055@linuxfoundation.org>
References: <20251017145142.382145055@linuxfoundation.org>
User-Agent: quilt/0.69
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_165207_194211_BD09EF68 
X-CRM114-Status: GOOD (  11.50  )
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

5.15-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Leo Yan <leo.yan@arm.com>

[ Upstream commit 53d067feb8c4f16d1f24ce3f4df4450bb18c555f ]

The feature test programs are built without enabling '-Wall -Werror'
options. As a result, a feature may appear to be available, but later
building in perf can fail with stricter checks.

Make the feature test program use the same warning options as perf.

Fixes: 1925459b4d92 ("tools build: Fix feature Makefile issues with 'O='")
Signed-off-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Ian Rogers <irogers@google.com>
Link: https://lore.kernel.org/r/20251006-perf_build_android_ndk-v3-1-4305590795b2@arm.com
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: Justin Stitt <justinstitt@google.com>
Cc: Bill Wendling <morbo@google.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: James Clark <james.clark@linaro.org>
Cc: linux-riscv@lists.infradead.org
Cc: llvm@lists.linux.dev
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-perf-users@vger.kernel.org
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/build/feature/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
index aa3b0d75e44b7..37aa85a81e0a0 100644
--- a/tools/build/feature/Makefile
+++ b/tools/build/feature/Makefile
@@ -268,10 +268,10 @@ $(OUTPUT)test-libbabeltrace.bin:
 	$(BUILD) # -lbabeltrace provided by $(FEATURE_CHECK_LDFLAGS-libbabeltrace)
 
 $(OUTPUT)test-compile-32.bin:
-	$(CC) -m32 -o $@ test-compile.c
+	$(CC) -m32 -Wall -Werror -o $@ test-compile.c
 
 $(OUTPUT)test-compile-x32.bin:
-	$(CC) -mx32 -o $@ test-compile.c
+	$(CC) -mx32 -Wall -Werror -o $@ test-compile.c
 
 $(OUTPUT)test-zlib.bin:
 	$(BUILD) -lz
-- 
2.51.0




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
