Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4BFC02181
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 08:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bd9s7j2qh1lhUaekM2TOrzUOqbjmSEXzH2EsnWQIZXc=; b=TuccmOICvxSYfh
	/KH5aXJOjUhWVU5/tH8k34wEKscJ8FBPq7K62wT/CgSQrxPEURFic8PMGPr64ZxgHyBDvENPNwVYz
	Pqn/xCL4SR8+6s3svZtINQKRjk2URvDsodv55icKd3/twg7ZQoslfcq5SPiVCGmaVE8xwlNfqbXcw
	+ZfTRHq+TghWzUZWqmC2XtwoI8PTOFCNNtoaxwpMrMUwV9Z3sJWKksQwTs9f+hFUdKzuDtB5Dvamm
	qtdUBmug4CNA9UcLoB6RYKhr2ZpZ0voDzBCJOOaNl9Pi5amI3ORZIvO6qNF73WKGCzC/IXX7vwjhd
	X62SOtlXkOY5HffOC1nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFxM-00000004QEV-1nAS;
	Mon, 13 Jan 2025 08:37:56 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFxH-00000004Q9y-1aEk
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 08:37:52 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2161eb95317so67873315ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 00:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736757471; x=1737362271; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMJOsZFUuGMCCNl6Ap7/zKUJmvdFBz7dQyyFwX4yhfU=;
        b=TwhaaF6oh8epQn5SatU4V+PzoGgcI4n0nXRLLzomo8JNH95QRW85roOJh3eh+jiANO
         Q+SL9+iEWjTa1dGsJuOGIPnZa+RwVewiAj8ib+tpBzta70WGNHVfVOzKkrJePCxBDzae
         GEkwVLOG1Ipb6sIbVrh1eyyPIqRDegzLr5ECDA8NU9iaukLowDOY1PnYnJbDx08jbZ7s
         1SdDWpxwJ4935S4jXQx6ApQYCodi8UhvK8FBqZ+LaaI76XHSp3MbG6YvAzncV9cO44iL
         yTs1NxvuNKHbqyhND4JJWeAeacMNfWevtiphAgBbgfLlNCMJWYlS+AXeSbePMsRzQA1c
         +83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736757471; x=1737362271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qMJOsZFUuGMCCNl6Ap7/zKUJmvdFBz7dQyyFwX4yhfU=;
        b=Iw6epeKNDgIL28F0x1dh8+wSnnmBdGnPfWFVy2ACWq1h5Lskn5gfFUN6qgP7MedZMb
         oW4MkGijToDn8HiXK1jGIiKxi3GEKs/GKEaZzaoOf5ge/LFyrTAthvDekIpf19KzlNro
         O1rB30YqNntK/hIujMS6eVV47C6NpwiF2E4XcrA3Ahj8t/FbPcatcvBX44YlqLfYvIxd
         MYW6j3ej7sArCA4AZXDDMLNdqXqvZIhaifI66aMRH49kf8eBQu2NpnVh+ELIr3plP9RJ
         55N0P1D3my+wYCRrk43lFg4NLkVgKrZz5Q3hdaTiqJY0VatVLLHRCQ7X24R4refe3vIs
         954g==
X-Forwarded-Encrypted: i=1; AJvYcCV53JCcoRl86IBZ74rkAC7DFW9O1wXV77nLzJ1cdWGBvaoHNwLhGdRu+o/vqPCWBsM4R7zvBxQjqfiJww==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFOTRuuydHpOpL9GhSUFuJc9DEg84kDRyFm9tJgZlx8zWCMydz
	tssJBoF5L0jrjuKShW4aoDO0advyy70UJGNZy5ZMuBvQ97WUG5gKSnVUABFi1QI=
X-Gm-Gg: ASbGncs2xiD/OUHY9DcYoCKzFYzAK4rHS71M6yF5bPrlIbl+KVH/qXqVWKMVCcq7tf2
	Q1T8bv0TqRGwRek1U8giptXiE6sNFs0aAe6rQ3h6hxCHv354IEbbsJ1xTs8X1EbnB5F+aFATlMQ
	d5G2SfauUsXhCCCOmDAnYg2Ms/okwFdPoB93/OPg96dhyNbkA18qKCcgXf6iqdS62k2GP9FvebY
	7u0yCHoA1DTthR8uqJjBNUHLFJ4wMol9NZj8K+vRRLPKbgs7O36lLgCJDH79X5qSYm/YjQZoh6Q
	E/h5BYleXXtd9CM=
X-Google-Smtp-Source: AGHT+IFLYk6bgrJ0SOLLV8CBQcEe8+QaPJ84+VNsdagEBMamy215GoqGCmwUbo8FjSJ9Sz2cJj2tMw==
X-Received: by 2002:a05:6a20:7344:b0:1e6:8f10:8ba2 with SMTP id adf61e73a8af0-1e88cf7f796mr31344708637.9.1736757470676;
        Mon, 13 Jan 2025 00:37:50 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a317a07ceedsm6427433a12.6.2025.01.13.00.37.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Jan 2025 00:37:50 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: ajones@ventanamicro.com,
	alexghiti@rivosinc.com,
	andybnac@gmail.com,
	aou@eecs.berkeley.edu,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	conor.dooley@microchip.com,
	conor@kernel.org,
	corbet@lwn.net,
	cuiyunhui@bytedance.com,
	evan@rivosinc.com,
	jesse@rivosinc.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
	shuah@kernel.org
Subject: [PATCH v3 3/3] RISC-V: selftests: Add TEST_ZICBOM into CBO tests
Date: Mon, 13 Jan 2025 16:36:35 +0800
Message-Id: <20250113083635.73826-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250113083635.73826-1-cuiyunhui@bytedance.com>
References: <20250113083635.73826-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_003751_413132_D6A7EA59 
X-CRM114-Status: GOOD (  14.28  )
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

Add test for Zicbom and its block size into CBO tests, when
Zicbom is present, test that cbo.clean/flush may be issued and works.
As the software can't verify the clean/flush functions, we just judged
that cbo.clean/flush isn't executed illegally.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 tools/testing/selftests/riscv/hwprobe/cbo.c | 49 ++++++++++++++++++---
 1 file changed, 43 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/riscv/hwprobe/cbo.c b/tools/testing/selftests/riscv/hwprobe/cbo.c
index a40541bb7c7d..b63e23f95e08 100644
--- a/tools/testing/selftests/riscv/hwprobe/cbo.c
+++ b/tools/testing/selftests/riscv/hwprobe/cbo.c
@@ -81,6 +81,30 @@ static bool is_power_of_2(__u64 n)
 	return n != 0 && (n & (n - 1)) == 0;
 }
 
+static void test_zicbom(void *arg)
+{
+	struct riscv_hwprobe pair = {
+		.key = RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE,
+	};
+	cpu_set_t *cpus = (cpu_set_t *)arg;
+	__u64 block_size;
+	long rc;
+
+	rc = riscv_hwprobe(&pair, 1, sizeof(cpu_set_t), (unsigned long *)cpus, 0);
+	block_size = pair.value;
+	ksft_test_result(rc == 0 && pair.key == RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE &&
+			 is_power_of_2(block_size), "Zicbom block size\n");
+	ksft_print_msg("Zicbom block size: %llu\n", block_size);
+
+	illegal_insn = false;
+	cbo_clean(&mem[block_size]);
+	ksft_test_result(!illegal_insn, "cbo.clean\n");
+
+	illegal_insn = false;
+	cbo_flush(&mem[block_size]);
+	ksft_test_result(!illegal_insn, "cbo.flush\n");
+}
+
 static void test_zicboz(void *arg)
 {
 	struct riscv_hwprobe pair = {
@@ -129,7 +153,7 @@ static void test_zicboz(void *arg)
 	ksft_test_result_pass("cbo.zero check\n");
 }
 
-static void check_no_zicboz_cpus(cpu_set_t *cpus)
+static void check_no_zicbo_cpus(cpu_set_t *cpus, __u64 cbo)
 {
 	struct riscv_hwprobe pair = {
 		.key = RISCV_HWPROBE_KEY_IMA_EXT_0,
@@ -137,6 +161,7 @@ static void check_no_zicboz_cpus(cpu_set_t *cpus)
 	cpu_set_t one_cpu;
 	int i = 0, c = 0;
 	long rc;
+	char *cbostr;
 
 	while (i++ < CPU_COUNT(cpus)) {
 		while (!CPU_ISSET(c, cpus))
@@ -148,10 +173,13 @@ static void check_no_zicboz_cpus(cpu_set_t *cpus)
 		rc = riscv_hwprobe(&pair, 1, sizeof(cpu_set_t), (unsigned long *)&one_cpu, 0);
 		assert(rc == 0 && pair.key == RISCV_HWPROBE_KEY_IMA_EXT_0);
 
-		if (pair.value & RISCV_HWPROBE_EXT_ZICBOZ)
-			ksft_exit_fail_msg("Zicboz is only present on a subset of harts.\n"
-					   "Use taskset to select a set of harts where Zicboz\n"
-					   "presence (present or not) is consistent for each hart\n");
+		cbostr = cbo == RISCV_HWPROBE_EXT_ZICBOZ ? "Zicboz" : "Zicbom";
+
+		if (pair.value & cbo)
+			ksft_exit_fail_msg("%s is only present on a subset of harts.\n"
+					   "Use taskset to select a set of harts where %s\n"
+					   "presence (present or not) is consistent for each hart\n",
+					   cbostr, cbostr);
 		++c;
 	}
 }
@@ -159,6 +187,7 @@ static void check_no_zicboz_cpus(cpu_set_t *cpus)
 enum {
 	TEST_ZICBOZ,
 	TEST_NO_ZICBOZ,
+	TEST_ZICBOM,
 	TEST_NO_ZICBOM,
 };
 
@@ -169,6 +198,7 @@ static struct test_info {
 } tests[] = {
 	[TEST_ZICBOZ]		= { .nr_tests = 3, test_zicboz },
 	[TEST_NO_ZICBOZ]	= { .nr_tests = 1, test_no_zicboz },
+	[TEST_ZICBOM]		= { .nr_tests = 3, test_zicbom },
 	[TEST_NO_ZICBOM]	= { .nr_tests = 3, test_no_zicbom },
 };
 
@@ -206,7 +236,14 @@ int main(int argc, char **argv)
 		tests[TEST_ZICBOZ].enabled = true;
 		tests[TEST_NO_ZICBOZ].enabled = false;
 	} else {
-		check_no_zicboz_cpus(&cpus);
+		check_no_zicbo_cpus(&cpus, RISCV_HWPROBE_EXT_ZICBOZ);
+	}
+
+	if (pair.value & RISCV_HWPROBE_EXT_ZICBOM) {
+		tests[TEST_ZICBOM].enabled = true;
+		tests[TEST_NO_ZICBOM].enabled = false;
+	} else {
+		check_no_zicbo_cpus(&cpus, RISCV_HWPROBE_EXT_ZICBOM);
 	}
 
 	for (i = 0; i < ARRAY_SIZE(tests); ++i)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
