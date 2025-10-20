Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E7BCCD193
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 15:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Ur6grmpWt0sYhd6U+RanllEUkWRZXSeGD+EJ0hl8ek=; b=DmtReisTexgcqZ
	CEXKXLHPOfKrzFb5tJKpiOQkeMQ6OrD4KDQI0EhQUChNiep6ia1KCuMDbCQ5KcjoaQw91Yid+KGs4
	Q70ADiyA3CqXDo6NHhH01tTFmm/ASjrS6yjPLhHKZdMAQVTFa4MlIZp1CLCqFMy1WhMnY/AFJIgdc
	03TOq4ELzM/jsdxdVStFcGuq1LdwHz+PK8B+gNRfRflTKIAPtSnYH6ypcl1EXHgUDlaFJRnNQlbEy
	q86kybn1UBR4xM4FYCtc0aJMYPw/2THouLJqUA9736jE6NCfOXVDzRW0gRuTVi0TsfSn0/a3gYdof
	zN0hHHca9S8y1t8LhXNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vArx5-0000000EA4j-2col;
	Mon, 20 Oct 2025 15:37:39 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vArx1-0000000EA28-1c5u
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 15:37:37 +0000
Received: from Mobilestation.localdomain (unknown [183.6.59.216])
	by APP-01 (Coremail) with SMTP id qwCowADnQaQ0V_ZoU38aEg--.28544S2;
	Mon, 20 Oct 2025 23:37:28 +0800 (CST)
From: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
To: zihong.plct@isrc.iscas.ac.cn
Cc: ajones@ventanamicro.com,
	alex@ghiti.fr,
	alexghiti@rivosinc.com,
	aou@eecs.berkeley.edu,
	cleger@rivosinc.com,
	evan@rivosinc.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	shuah@kernel.org,
	zhangyin2018@iscas.ac.cn,
	zihongyao@outlook.com
Subject: [PATCH v3 2/2] selftests/riscv: Add Zicbop prefetch test
Date: Mon, 20 Oct 2025 23:37:20 +0800
Message-ID: <20251020153721.71842-1-zihong.plct@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251020152924.64551-1-zihong.plct@isrc.iscas.ac.cn>
References: <20251020152924.64551-1-zihong.plct@isrc.iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowADnQaQ0V_ZoU38aEg--.28544S2
X-Coremail-Antispam: 1UD129KBjvJXoW3JFWkGFyrGry5Xr45CrWDtwb_yoWDGrW5pF
	Zxur4SvF45ZF40qrWxJr4kCr1Fqrn2qrWUCrWrG3s8ZayUX398GFWkKa97AFWkKr97Zr1F
	vFn8AFWUua1UGaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUpwZcUUUUU=
X-Originating-IP: [183.6.59.216]
X-CM-SenderInfo: p2lk00vjoszunw6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_083735_882422_A8BBF239 
X-CRM114-Status: GOOD (  17.57  )
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

Add selftest to cbo.c to verify Zicbop extension behavior.

The test checks:
- That hwprobe correctly reports Zicbop presence and block size.
- That prefetch instructions execute without exception on valid and NULL
  addresses when Zicbop is present.
- That prefetch.{i,r,w} do not trigger SIGILL even when Zicbop is absent,
  since Zicbop instructions are defined as hints.

Signed-off-by: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
---
 tools/testing/selftests/riscv/hwprobe/cbo.c | 188 +++++++++++++++++---
 1 file changed, 159 insertions(+), 29 deletions(-)

diff --git a/tools/testing/selftests/riscv/hwprobe/cbo.c b/tools/testing/selftests/riscv/hwprobe/cbo.c
index 5e96ef785d0d..163228e3f2c7 100644
--- a/tools/testing/selftests/riscv/hwprobe/cbo.c
+++ b/tools/testing/selftests/riscv/hwprobe/cbo.c
@@ -15,24 +15,30 @@
 #include <linux/compiler.h>
 #include <linux/kernel.h>
 #include <asm/ucontext.h>
+#include <getopt.h>
 
 #include "hwprobe.h"
 #include "../../kselftest.h"
 
 #define MK_CBO(fn) le32_bswap((uint32_t)(fn) << 20 | 10 << 15 | 2 << 12 | 0 << 7 | 15)
+#define MK_PREFETCH(fn) \
+	le32_bswap(0 << 25 | (uint32_t)(fn) << 20 | 10 << 15 | 6 << 12 | 0 << 7 | 19)
 
 static char mem[4096] __aligned(4096) = { [0 ... 4095] = 0xa5 };
 
-static bool illegal_insn;
+static bool got_fault;
 
 static void sigill_handler(int sig, siginfo_t *info, void *context)
 {
 	unsigned long *regs = (unsigned long *)&((ucontext_t *)context)->uc_mcontext;
 	uint32_t insn = *(uint32_t *)regs[0];
 
-	assert(insn == MK_CBO(regs[11]));
+	if (regs[12] == 0)
+		assert(insn == MK_CBO(regs[11]));
+	else
+		assert(insn == MK_PREFETCH(regs[11]));
 
-	illegal_insn = true;
+	got_fault = true;
 	regs[0] += 4;
 }
 
@@ -41,43 +47,75 @@ static void sigill_handler(int sig, siginfo_t *info, void *context)
 	asm volatile(								\
 	"mv	a0, %0\n"							\
 	"li	a1, %1\n"							\
+	"li	a2, 0\n"							\
 	".4byte	%2\n"								\
-	: : "r" (base), "i" (fn), "i" (MK_CBO(fn)) : "a0", "a1", "memory");	\
+	: : "r" (base), "i" (fn), "i" (MK_CBO(fn)) : "a0", "a1", "a2", "memory");	\
+})
+
+#define prefetch_insn(base, fn)							\
+({										\
+	asm volatile(								\
+	"mv	a0, %0\n"							\
+	"li	a1, %1\n"							\
+	"li	a2, 1\n"							\
+	".4byte	%2\n"								\
+	: : "r" (base), "i" (fn), "i" (MK_PREFETCH(fn)) : "a0", "a1", "a2");\
 })
 
 static void cbo_inval(char *base) { cbo_insn(base, 0); }
 static void cbo_clean(char *base) { cbo_insn(base, 1); }
 static void cbo_flush(char *base) { cbo_insn(base, 2); }
 static void cbo_zero(char *base)  { cbo_insn(base, 4); }
+static void prefetch_i(char *base) { prefetch_insn(base, 0); }
+static void prefetch_r(char *base) { prefetch_insn(base, 1); }
+static void prefetch_w(char *base) { prefetch_insn(base, 3); }
+
+static void test_no_zicbop(void *arg)
+{
+	/* Zicbop prefetch.* are HINT instructions. */
+	ksft_print_msg("Testing Zicbop instructions\n");
+
+	got_fault = false;
+	prefetch_i(&mem[0]);
+	ksft_test_result(!got_fault, "No prefetch.i\n");
+
+	got_fault = false;
+	prefetch_r(&mem[0]);
+	ksft_test_result(!got_fault, "No prefetch.r\n");
+
+	got_fault = false;
+	prefetch_w(&mem[0]);
+	ksft_test_result(!got_fault, "No prefetch.w\n");
+}
 
 static void test_no_cbo_inval(void *arg)
 {
 	ksft_print_msg("Testing cbo.inval instruction remain privileged\n");
-	illegal_insn = false;
+	got_fault = false;
 	cbo_inval(&mem[0]);
-	ksft_test_result(illegal_insn, "No cbo.inval\n");
+	ksft_test_result(got_fault, "No cbo.inval\n");
 }
 
 static void test_no_zicbom(void *arg)
 {
 	ksft_print_msg("Testing Zicbom instructions remain privileged\n");
 
-	illegal_insn = false;
+	got_fault = false;
 	cbo_clean(&mem[0]);
-	ksft_test_result(illegal_insn, "No cbo.clean\n");
+	ksft_test_result(got_fault, "No cbo.clean\n");
 
-	illegal_insn = false;
+	got_fault = false;
 	cbo_flush(&mem[0]);
-	ksft_test_result(illegal_insn, "No cbo.flush\n");
+	ksft_test_result(got_fault, "No cbo.flush\n");
 }
 
 static void test_no_zicboz(void *arg)
 {
 	ksft_print_msg("No Zicboz, testing cbo.zero remains privileged\n");
 
-	illegal_insn = false;
+	got_fault = false;
 	cbo_zero(&mem[0]);
-	ksft_test_result(illegal_insn, "No cbo.zero\n");
+	ksft_test_result(got_fault, "No cbo.zero\n");
 }
 
 static bool is_power_of_2(__u64 n)
@@ -85,6 +123,34 @@ static bool is_power_of_2(__u64 n)
 	return n != 0 && (n & (n - 1)) == 0;
 }
 
+static void test_zicbop(void *arg)
+{
+	struct riscv_hwprobe pair = {
+		.key = RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE,
+	};
+	cpu_set_t *cpus = (cpu_set_t *)arg;
+	__u64 block_size;
+	long rc;
+
+	rc = riscv_hwprobe(&pair, 1, sizeof(cpu_set_t), (unsigned long *)cpus, 0);
+	block_size = pair.value;
+	ksft_test_result(rc == 0 && pair.key == RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE &&
+			 is_power_of_2(block_size), "Zicbop block size\n");
+	ksft_print_msg("Zicbop block size: %llu\n", block_size);
+
+	got_fault = false;
+	prefetch_i(&mem[0]);
+	prefetch_r(&mem[0]);
+	prefetch_w(&mem[0]);
+	ksft_test_result(!got_fault, "Zicbop prefetch.* on valid address\n");
+
+	got_fault = false;
+	prefetch_i(NULL);
+	prefetch_r(NULL);
+	prefetch_w(NULL);
+	ksft_test_result(!got_fault, "Zicbop prefetch.* on NULL\n");
+}
+
 static void test_zicbom(void *arg)
 {
 	struct riscv_hwprobe pair = {
@@ -100,13 +166,13 @@ static void test_zicbom(void *arg)
 			 is_power_of_2(block_size), "Zicbom block size\n");
 	ksft_print_msg("Zicbom block size: %llu\n", block_size);
 
-	illegal_insn = false;
+	got_fault = false;
 	cbo_clean(&mem[block_size]);
-	ksft_test_result(!illegal_insn, "cbo.clean\n");
+	ksft_test_result(!got_fault, "cbo.clean\n");
 
-	illegal_insn = false;
+	got_fault = false;
 	cbo_flush(&mem[block_size]);
-	ksft_test_result(!illegal_insn, "cbo.flush\n");
+	ksft_test_result(!got_fault, "cbo.flush\n");
 }
 
 static void test_zicboz(void *arg)
@@ -125,11 +191,11 @@ static void test_zicboz(void *arg)
 			 is_power_of_2(block_size), "Zicboz block size\n");
 	ksft_print_msg("Zicboz block size: %llu\n", block_size);
 
-	illegal_insn = false;
+	got_fault = false;
 	cbo_zero(&mem[block_size]);
-	ksft_test_result(!illegal_insn, "cbo.zero\n");
+	ksft_test_result(!got_fault, "cbo.zero\n");
 
-	if (illegal_insn || !is_power_of_2(block_size)) {
+	if (got_fault || !is_power_of_2(block_size)) {
 		ksft_test_result_skip("cbo.zero check\n");
 		return;
 	}
@@ -148,7 +214,7 @@ static void test_zicboz(void *arg)
 			if (mem[i * block_size + j] != expected) {
 				ksft_test_result_fail("cbo.zero check\n");
 				ksft_print_msg("cbo.zero check: mem[%llu] != 0x%x\n",
-					       i * block_size + j, expected);
+						   i * block_size + j, expected);
 				return;
 			}
 		}
@@ -177,7 +243,19 @@ static void check_no_zicbo_cpus(cpu_set_t *cpus, __u64 cbo)
 		rc = riscv_hwprobe(&pair, 1, sizeof(cpu_set_t), (unsigned long *)&one_cpu, 0);
 		assert(rc == 0 && pair.key == RISCV_HWPROBE_KEY_IMA_EXT_0);
 
-		cbostr = cbo == RISCV_HWPROBE_EXT_ZICBOZ ? "Zicboz" : "Zicbom";
+		switch (cbo) {
+		case RISCV_HWPROBE_EXT_ZICBOZ:
+			cbostr = "Zicboz";
+			break;
+		case RISCV_HWPROBE_EXT_ZICBOM:
+			cbostr = "Zicbom";
+			break;
+		case RISCV_HWPROBE_EXT_ZICBOP:
+			cbostr = "Zicbop";
+			break;
+		default:
+			ksft_exit_fail_msg("Internal error: invalid cbo %llu\n", cbo);
+		}
 
 		if (pair.value & cbo)
 			ksft_exit_fail_msg("%s is only present on a subset of harts.\n"
@@ -194,6 +272,8 @@ enum {
 	TEST_ZICBOM,
 	TEST_NO_ZICBOM,
 	TEST_NO_CBO_INVAL,
+	TEST_ZICBOP,
+	TEST_NO_ZICBOP
 };
 
 static struct test_info {
@@ -206,27 +286,70 @@ static struct test_info {
 	[TEST_ZICBOM]		= { .nr_tests = 3, test_zicbom },
 	[TEST_NO_ZICBOM]	= { .nr_tests = 2, test_no_zicbom },
 	[TEST_NO_CBO_INVAL]	= { .nr_tests = 1, test_no_cbo_inval },
+	[TEST_ZICBOP]		= { .nr_tests = 3, test_zicbop },
+	[TEST_NO_ZICBOP]	= { .nr_tests = 3, test_no_zicbop },
 };
 
-int main(int argc, char **argv)
+static const struct option long_opts[] = {
+	{"sigill", no_argument, 0, 'i'},
+	{"sigsegv", no_argument, 0, 's'},
+	{"sigbus", no_argument, 0, 'b'},
+	{0, 0, 0, 0}
+};
+
+static void install_sigaction(int argc, char **argv)
 {
+	int rc, opt, long_index;
+	bool sigill;
+
 	struct sigaction act = {
 		.sa_sigaction = &sigill_handler,
 		.sa_flags = SA_SIGINFO,
 	};
+
+	long_index = 0;
+	sigill = false;
+
+	while ((opt = getopt_long(argc, argv, "isb", long_opts, &long_index)) != -1) {
+		switch (opt) {
+		case 'i':
+			rc = sigaction(SIGILL, &act, NULL);
+			assert(rc == 0);
+			sigill = true;
+			break;
+		case 's':
+			rc = sigaction(SIGSEGV, &act, NULL);
+			assert(rc == 0);
+			break;
+		case 'b':
+			rc = sigaction(SIGBUS, &act, NULL);
+			assert(rc == 0);
+			break;
+		case '?':
+			fprintf(stderr, "Unknown option or missing arg\n");
+			exit(1);
+		default:
+			break;
+		}
+	}
+
+	if (sigill) {
+		tests[TEST_NO_ZICBOZ].enabled = true;
+		tests[TEST_NO_ZICBOM].enabled = true;
+		tests[TEST_NO_CBO_INVAL].enabled = true;
+		tests[TEST_NO_ZICBOP].enabled = true;
+	}
+}
+
+int main(int argc, char **argv)
+{
 	struct riscv_hwprobe pair;
 	unsigned int plan = 0;
 	cpu_set_t cpus;
 	long rc;
 	int i;
 
-	if (argc > 1 && !strcmp(argv[1], "--sigill")) {
-		rc = sigaction(SIGILL, &act, NULL);
-		assert(rc == 0);
-		tests[TEST_NO_ZICBOZ].enabled = true;
-		tests[TEST_NO_ZICBOM].enabled = true;
-		tests[TEST_NO_CBO_INVAL].enabled = true;
-	}
+	install_sigaction(argc, argv);
 
 	rc = sched_getaffinity(0, sizeof(cpu_set_t), &cpus);
 	assert(rc == 0);
@@ -253,6 +376,13 @@ int main(int argc, char **argv)
 		check_no_zicbo_cpus(&cpus, RISCV_HWPROBE_EXT_ZICBOM);
 	}
 
+	if (pair.value & RISCV_HWPROBE_EXT_ZICBOP) {
+		tests[TEST_ZICBOP].enabled = true;
+		tests[TEST_NO_ZICBOP].enabled = false;
+	} else {
+		check_no_zicbo_cpus(&cpus, RISCV_HWPROBE_EXT_ZICBOP);
+	}
+
 	for (i = 0; i < ARRAY_SIZE(tests); ++i)
 		plan += tests[i].enabled ? tests[i].nr_tests : 0;
 
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
