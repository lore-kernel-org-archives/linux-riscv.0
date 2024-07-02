Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBFFC3064D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 12:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u7wSbIne4WKv2DTfZ4dl7m9kBrAuW3O+ucEy20IBzs4=; b=NBfsxla0iJ+KtQ
	wsVdkSniWzVqA/qCL+NIuKelCoIGA6l1cvvqnXxhFm8TjGolXsXes+jcpaOuDdvMqNP45K0A3a5Ck
	S+UUoKPthJZEltQ2ouW+9vnztKHfwbJ8WgORvyGJ57F01tb4Kw7hClgHzPQoIt5hEmc8e3RPkv3S3
	erZZzXHzLpm05CHwRWWJTTt6BzXm8dc4ULGR64GEldmDnBPwgZB2Uep9ZP0ZKI1qnr0E0c3K1K4y6
	QAv9Z1dqoDlhf/6axr82Fl0XM7M8dKaiRHtT2QXB2DUupPIZoD5ec+m82W1DyFKYA/d44IVQYpPrV
	8JPp3vwsEl7gaQ1M6+BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOcSd-00000006e6n-445Y;
	Tue, 02 Jul 2024 12:18:15 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOcSX-00000006e35-453s
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 12:18:14 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4WD23x735Wz4f3kFN
	for <linux-riscv@lists.infradead.org>; Tue,  2 Jul 2024 20:17:49 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 2CA0E1A0170
	for <linux-riscv@lists.infradead.org>; Tue,  2 Jul 2024 20:18:01 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP1 (Coremail) with SMTP id cCh0CgBHvnr174NmXMK6Aw--.13394S4;
	Tue, 02 Jul 2024 20:18:00 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pu Lehui <pulehui@huawei.com>
Subject: [PATCH bpf-next v6 2/3] selftests/bpf: Factor out many args tests from tracing_struct
Date: Tue,  2 Jul 2024 12:19:43 +0000
Message-Id: <20240702121944.1091530-3-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240702121944.1091530-1-pulehui@huaweicloud.com>
References: <20240702121944.1091530-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgBHvnr174NmXMK6Aw--.13394S4
X-Coremail-Antispam: 1UD129KBjvJXoW3Wry7Gr47Jry8ZF18JrW3trb_yoWxWF18pa
	409w1UKFW8Jr48Wry8Aa1UZr4S9rs3ZF1jyry7J3sYvFyxt3sFqF1kKa4jyas8G3y5uwnx
	AayqyFs8Ar4UXF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBFb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXw
	A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMc
	Ij6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_
	Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07UC9aPUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_051810_412523_555012EF 
X-CRM114-Status: GOOD (  14.09  )
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

From: Pu Lehui <pulehui@huawei.com>

Factor out many args tests from tracing_struct and rename some function
names to make more sense. Meanwhile, remove unnecessary skeleton detach
operation as it will be covered by skeleton destroy operation.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 .../selftests/bpf/prog_tests/tracing_struct.c | 30 ++++++++--
 .../selftests/bpf/progs/tracing_struct.c      | 54 -----------------
 .../bpf/progs/tracing_struct_many_args.c      | 60 +++++++++++++++++++
 3 files changed, 86 insertions(+), 58 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/progs/tracing_struct_many_args.c

diff --git a/tools/testing/selftests/bpf/prog_tests/tracing_struct.c b/tools/testing/selftests/bpf/prog_tests/tracing_struct.c
index fe0fb0c9849a..cb2a95da2617 100644
--- a/tools/testing/selftests/bpf/prog_tests/tracing_struct.c
+++ b/tools/testing/selftests/bpf/prog_tests/tracing_struct.c
@@ -3,8 +3,9 @@
 
 #include <test_progs.h>
 #include "tracing_struct.skel.h"
+#include "tracing_struct_many_args.skel.h"
 
-static void test_fentry(void)
+static void test_struct_args(void)
 {
 	struct tracing_struct *skel;
 	int err;
@@ -55,6 +56,25 @@ static void test_fentry(void)
 
 	ASSERT_EQ(skel->bss->t6, 1, "t6 ret");
 
+destroy_skel:
+	tracing_struct__destroy(skel);
+}
+
+static void test_struct_many_args(void)
+{
+	struct tracing_struct_many_args *skel;
+	int err;
+
+	skel = tracing_struct_many_args__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "tracing_struct_many_args__open_and_load"))
+		return;
+
+	err = tracing_struct_many_args__attach(skel);
+	if (!ASSERT_OK(err, "tracing_struct_many_args__attach"))
+		goto destroy_skel;
+
+	ASSERT_OK(trigger_module_test_read(256), "trigger_read");
+
 	ASSERT_EQ(skel->bss->t7_a, 16, "t7:a");
 	ASSERT_EQ(skel->bss->t7_b, 17, "t7:b");
 	ASSERT_EQ(skel->bss->t7_c, 18, "t7:c");
@@ -74,12 +94,14 @@ static void test_fentry(void)
 	ASSERT_EQ(skel->bss->t8_g, 23, "t8:g");
 	ASSERT_EQ(skel->bss->t8_ret, 156, "t8 ret");
 
-	tracing_struct__detach(skel);
 destroy_skel:
-	tracing_struct__destroy(skel);
+	tracing_struct_many_args__destroy(skel);
 }
 
 void test_tracing_struct(void)
 {
-	test_fentry();
+	if (test__start_subtest("struct_args"))
+		test_struct_args();
+	if (test__start_subtest("struct_many_args"))
+		test_struct_many_args();
 }
diff --git a/tools/testing/selftests/bpf/progs/tracing_struct.c b/tools/testing/selftests/bpf/progs/tracing_struct.c
index 515daef3c84b..c435a3a8328a 100644
--- a/tools/testing/selftests/bpf/progs/tracing_struct.c
+++ b/tools/testing/selftests/bpf/progs/tracing_struct.c
@@ -18,11 +18,6 @@ struct bpf_testmod_struct_arg_3 {
 	int b[];
 };
 
-struct bpf_testmod_struct_arg_4 {
-	u64 a;
-	int b;
-};
-
 long t1_a_a, t1_a_b, t1_b, t1_c, t1_ret, t1_nregs;
 __u64 t1_reg0, t1_reg1, t1_reg2, t1_reg3;
 long t2_a, t2_b_a, t2_b_b, t2_c, t2_ret;
@@ -30,9 +25,6 @@ long t3_a, t3_b, t3_c_a, t3_c_b, t3_ret;
 long t4_a_a, t4_b, t4_c, t4_d, t4_e_a, t4_e_b, t4_ret;
 long t5_ret;
 int t6;
-long t7_a, t7_b, t7_c, t7_d, t7_e, t7_f_a, t7_f_b, t7_ret;
-long t8_a, t8_b, t8_c, t8_d, t8_e, t8_f_a, t8_f_b, t8_g, t8_ret;
-
 
 SEC("fentry/bpf_testmod_test_struct_arg_1")
 int BPF_PROG2(test_struct_arg_1, struct bpf_testmod_struct_arg_2, a, int, b, int, c)
@@ -138,50 +130,4 @@ int BPF_PROG2(test_struct_arg_11, struct bpf_testmod_struct_arg_3 *, a)
 	return 0;
 }
 
-SEC("fentry/bpf_testmod_test_struct_arg_7")
-int BPF_PROG2(test_struct_arg_12, __u64, a, void *, b, short, c, int, d,
-	      void *, e, struct bpf_testmod_struct_arg_4, f)
-{
-	t7_a = a;
-	t7_b = (long)b;
-	t7_c = c;
-	t7_d = d;
-	t7_e = (long)e;
-	t7_f_a = f.a;
-	t7_f_b = f.b;
-	return 0;
-}
-
-SEC("fexit/bpf_testmod_test_struct_arg_7")
-int BPF_PROG2(test_struct_arg_13, __u64, a, void *, b, short, c, int, d,
-	      void *, e, struct bpf_testmod_struct_arg_4, f, int, ret)
-{
-	t7_ret = ret;
-	return 0;
-}
-
-SEC("fentry/bpf_testmod_test_struct_arg_8")
-int BPF_PROG2(test_struct_arg_14, __u64, a, void *, b, short, c, int, d,
-	      void *, e, struct bpf_testmod_struct_arg_4, f, int, g)
-{
-	t8_a = a;
-	t8_b = (long)b;
-	t8_c = c;
-	t8_d = d;
-	t8_e = (long)e;
-	t8_f_a = f.a;
-	t8_f_b = f.b;
-	t8_g = g;
-	return 0;
-}
-
-SEC("fexit/bpf_testmod_test_struct_arg_8")
-int BPF_PROG2(test_struct_arg_15, __u64, a, void *, b, short, c, int, d,
-	      void *, e, struct bpf_testmod_struct_arg_4, f, int, g,
-	      int, ret)
-{
-	t8_ret = ret;
-	return 0;
-}
-
 char _license[] SEC("license") = "GPL";
diff --git a/tools/testing/selftests/bpf/progs/tracing_struct_many_args.c b/tools/testing/selftests/bpf/progs/tracing_struct_many_args.c
new file mode 100644
index 000000000000..3de4bb918178
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/tracing_struct_many_args.c
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <vmlinux.h>
+#include <bpf/bpf_tracing.h>
+#include <bpf/bpf_helpers.h>
+
+struct bpf_testmod_struct_arg_4 {
+	u64 a;
+	int b;
+};
+
+long t7_a, t7_b, t7_c, t7_d, t7_e, t7_f_a, t7_f_b, t7_ret;
+long t8_a, t8_b, t8_c, t8_d, t8_e, t8_f_a, t8_f_b, t8_g, t8_ret;
+
+SEC("fentry/bpf_testmod_test_struct_arg_7")
+int BPF_PROG2(test_struct_many_args_1, __u64, a, void *, b, short, c, int, d,
+	      void *, e, struct bpf_testmod_struct_arg_4, f)
+{
+	t7_a = a;
+	t7_b = (long)b;
+	t7_c = c;
+	t7_d = d;
+	t7_e = (long)e;
+	t7_f_a = f.a;
+	t7_f_b = f.b;
+	return 0;
+}
+
+SEC("fexit/bpf_testmod_test_struct_arg_7")
+int BPF_PROG2(test_struct_many_args_2, __u64, a, void *, b, short, c, int, d,
+	      void *, e, struct bpf_testmod_struct_arg_4, f, int, ret)
+{
+	t7_ret = ret;
+	return 0;
+}
+
+SEC("fentry/bpf_testmod_test_struct_arg_8")
+int BPF_PROG2(test_struct_many_args_3, __u64, a, void *, b, short, c, int, d,
+	      void *, e, struct bpf_testmod_struct_arg_4, f, int, g)
+{
+	t8_a = a;
+	t8_b = (long)b;
+	t8_c = c;
+	t8_d = d;
+	t8_e = (long)e;
+	t8_f_a = f.a;
+	t8_f_b = f.b;
+	t8_g = g;
+	return 0;
+}
+
+SEC("fexit/bpf_testmod_test_struct_arg_8")
+int BPF_PROG2(test_struct_many_args_4, __u64, a, void *, b, short, c, int, d,
+	      void *, e, struct bpf_testmod_struct_arg_4, f, int, g,
+	      int, ret)
+{
+	t8_ret = ret;
+	return 0;
+}
+
+char _license[] SEC("license") = "GPL";
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
