Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30239C61D9B
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 17:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fs5cDLo9kCWbadSpDXbdP0b7716/VotSMVVx6pbTOSI=; b=fVWOxbqayrdLvD
	q+2OeFg8qvkY0ytky4/aGLbUPeMhOtaW7prdeVPACSNXMOslc/7tGH90vQunG5t4kK4m1yiXz6eYg
	5FemxmdoP1aK71Ufi6L9L9JsK6j6gfv00dlNkoE236QkhCbEt56rhSF0c8XIKmZTdv+SS8qU0HWz6
	6S+hFgO2tz8P0W7mvHsMw7WgnfnxPN44qwOAYboaB/J3pxEqIE9tStzALJFmQEjCmw6lQ5up0XudH
	YaVh5gqKdXZm45IqApvHeIK44z7wHaim/5CudKJpM7mCWnJWQU789eTtQ2iL12yNKjQ+S59xHMSwE
	f5Jc+kuSktOOLGhqGOIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5qru-002da5-0E;
	Wed, 22 Nov 2023 17:18:30 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5qrq-002dY4-2K
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 17:18:28 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-991c786369cso981518866b.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 09:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700673503; x=1701278303; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0g35NXs6oZpeHKDCrGFl46tos66jCgVhUmsOk7azsc8=;
        b=boMtccvbl2x5Dlw3TaUOFjA+xNGTu10YHHCdd2J0v04LEVvyc3yuAMxoTWdfa6RLxp
         ofd7rjHvQki5nuhiCzA8+PCJIh1/c1yaw8r0ZSJThWRFFQ9DW1U4boCmtiBDhio1bwls
         fAxtTBA6WZDY51VHkL/au9rg0voyv4LxEeCmsnBx60AJ6mA75mbyQ0dAM650WV1sl48X
         0yO/wWVTcWKWliMxuUHlmvg/WFDkcMA+7HD+e9GzaVGg+y8Qo32dhuj1E/TRJZ/nAsth
         i7yHC3adwW0N239I9ypsVUFcQdpCC4ct1/kgKJmfcfFQCXkU8LuBVceVxtLpoZyHiuc4
         Hq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700673503; x=1701278303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0g35NXs6oZpeHKDCrGFl46tos66jCgVhUmsOk7azsc8=;
        b=InCLwpbIctYuKFi7MbXFshCS1N2zdma1vuKtUl5MtrX7PXcqyD0o826veiPTjBK74B
         dqH/0Bw3yWDbDtQAxuAO/gsQqYnNnTU2RFALcHEb4yO4heuRbKQIOc68VVYY68UTxTPL
         JPrlH5niBcuxfgmujtU0knn0tUfF1v+yDt0Ls23eE+TJlIQE/i5mDq7ToJKZn5S5OENY
         FgKIYz2Njz9tNW9OND9QqvJHOdU7yc+8k2zIg73EgTmGP8suPx3vUVReWldKbSqUrBUj
         nfP7zVHFcSkSrU2uHr4ruyHeNGR9XaovwyDUpbP/Tgwb3CWmBYVyE0NszJRAyyKhjZjp
         qVzw==
X-Gm-Message-State: AOJu0Ywd+t95v3WbKyrzYja6Ti94rQsvC3ImifA7M8wFnDljMxLjj1Ok
	GwA31mEQylNmFSzb9K0z1/1aravOScy72l45Wvk=
X-Google-Smtp-Source: AGHT+IG8zsv0AGlKCd2Ii2mqhAU8Xa3sGVn2fRDTILjsNOnEkdrnyvj2pg+fIg9ZNVxJaIahmf9xdg==
X-Received: by 2002:a17:907:d046:b0:9be:77cd:4c2c with SMTP id vb6-20020a170907d04600b009be77cd4c2cmr2203161ejc.28.1700673502846;
        Wed, 22 Nov 2023 09:18:22 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id t2-20020a1709064f0200b009eff65e6942sm6888022eju.197.2023.11.22.09.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 09:18:22 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: [PATCH] RISC-V: selftests: Fix compiler warnings
Date: Wed, 22 Nov 2023 18:18:22 +0100
Message-ID: <20231122171821.130854-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_091826_757251_634F5887 
X-CRM114-Status: GOOD (  13.09  )
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

Since commit e33a02ed6a4f ("selftests: Add printf attribute to
kselftest prints") RISC-V selftests are generating format warnings
when compiled. Follow the warnings' instructions to fix them up.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/testing/selftests/riscv/hwprobe/cbo.c             | 6 +++---
 tools/testing/selftests/riscv/hwprobe/hwprobe.c         | 4 ++--
 tools/testing/selftests/riscv/vector/v_initval_nolibc.c | 2 +-
 tools/testing/selftests/riscv/vector/vstate_prctl.c     | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/riscv/hwprobe/cbo.c b/tools/testing/selftests/riscv/hwprobe/cbo.c
index 50a2cc8aef38..99abb1d4a777 100644
--- a/tools/testing/selftests/riscv/hwprobe/cbo.c
+++ b/tools/testing/selftests/riscv/hwprobe/cbo.c
@@ -97,7 +97,7 @@ static void test_zicboz(void *arg)
 	block_size = pair.value;
 	ksft_test_result(rc == 0 && pair.key == RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE &&
 			 is_power_of_2(block_size), "Zicboz block size\n");
-	ksft_print_msg("Zicboz block size: %ld\n", block_size);
+	ksft_print_msg("Zicboz block size: %lld\n", block_size);
 
 	illegal_insn = false;
 	cbo_zero(&mem[block_size]);
@@ -121,7 +121,7 @@ static void test_zicboz(void *arg)
 		for (j = 0; j < block_size; ++j) {
 			if (mem[i * block_size + j] != expected) {
 				ksft_test_result_fail("cbo.zero check\n");
-				ksft_print_msg("cbo.zero check: mem[%d] != 0x%x\n",
+				ksft_print_msg("cbo.zero check: mem[%lld] != 0x%x\n",
 					       i * block_size + j, expected);
 				return;
 			}
@@ -201,7 +201,7 @@ int main(int argc, char **argv)
 	pair.key = RISCV_HWPROBE_KEY_IMA_EXT_0;
 	rc = riscv_hwprobe(&pair, 1, sizeof(cpu_set_t), (unsigned long *)&cpus, 0);
 	if (rc < 0)
-		ksft_exit_fail_msg("hwprobe() failed with %d\n", rc);
+		ksft_exit_fail_msg("hwprobe() failed with %ld\n", rc);
 	assert(rc == 0 && pair.key == RISCV_HWPROBE_KEY_IMA_EXT_0);
 
 	if (pair.value & RISCV_HWPROBE_EXT_ZICBOZ) {
diff --git a/tools/testing/selftests/riscv/hwprobe/hwprobe.c b/tools/testing/selftests/riscv/hwprobe/hwprobe.c
index c474891df307..a78c207d60a7 100644
--- a/tools/testing/selftests/riscv/hwprobe/hwprobe.c
+++ b/tools/testing/selftests/riscv/hwprobe/hwprobe.c
@@ -29,7 +29,7 @@ int main(int argc, char **argv)
 		/* Fail if the kernel claims not to recognize a base key. */
 		if ((i < 4) && (pairs[i].key != i))
 			ksft_exit_fail_msg("Failed to recognize base key: key != i, "
-					   "key=%ld, i=%ld\n", pairs[i].key, i);
+					   "key=%lld, i=%ld\n", pairs[i].key, i);
 
 		if (pairs[i].key != RISCV_HWPROBE_KEY_BASE_BEHAVIOR)
 			continue;
@@ -37,7 +37,7 @@ int main(int argc, char **argv)
 		if (pairs[i].value & RISCV_HWPROBE_BASE_BEHAVIOR_IMA)
 			continue;
 
-		ksft_exit_fail_msg("Unexpected pair: (%ld, %ld)\n", pairs[i].key, pairs[i].value);
+		ksft_exit_fail_msg("Unexpected pair: (%lld, %lld)\n", pairs[i].key, pairs[i].value);
 	}
 
 	out = riscv_hwprobe(pairs, 8, 0, 0, 0);
diff --git a/tools/testing/selftests/riscv/vector/v_initval_nolibc.c b/tools/testing/selftests/riscv/vector/v_initval_nolibc.c
index 66764edb0d52..5f6858f862c0 100644
--- a/tools/testing/selftests/riscv/vector/v_initval_nolibc.c
+++ b/tools/testing/selftests/riscv/vector/v_initval_nolibc.c
@@ -27,7 +27,7 @@ int main(void)
 
 	datap = malloc(MAX_VSIZE);
 	if (!datap) {
-		ksft_test_result_fail("fail to allocate memory for size = %lu\n", MAX_VSIZE);
+		ksft_test_result_fail("fail to allocate memory for size = %u\n", MAX_VSIZE);
 		exit(-1);
 	}
 
diff --git a/tools/testing/selftests/riscv/vector/vstate_prctl.c b/tools/testing/selftests/riscv/vector/vstate_prctl.c
index b348b475be57..8ad94e08ff4d 100644
--- a/tools/testing/selftests/riscv/vector/vstate_prctl.c
+++ b/tools/testing/selftests/riscv/vector/vstate_prctl.c
@@ -68,7 +68,7 @@ int test_and_compare_child(long provided, long expected, int inherit)
 	}
 	rc = launch_test(inherit);
 	if (rc != expected) {
-		ksft_test_result_fail("Test failed, check %d != %d\n", rc,
+		ksft_test_result_fail("Test failed, check %d != %ld\n", rc,
 				      expected);
 		return -2;
 	}
@@ -87,7 +87,7 @@ int main(void)
 	pair.key = RISCV_HWPROBE_KEY_IMA_EXT_0;
 	rc = riscv_hwprobe(&pair, 1, 0, NULL, 0);
 	if (rc < 0) {
-		ksft_test_result_fail("hwprobe() failed with %d\n", rc);
+		ksft_test_result_fail("hwprobe() failed with %ld\n", rc);
 		return -1;
 	}
 
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
