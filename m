Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFD0C54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2024 09:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O67lSYyaONaX6Vt7w3G+/AS+uW6BdCqzi2KD87bUvrw=; b=Vh5vqw1D5Obczj
	wwrAjXBtSwVB1FU5Ibh4t/DcHtlzxQPq7dl65gpb+D8zg68USRjxAwSjJXyUzRvDvrhZ6driWpte5
	pLS+HgEP1ycit7CGuM+TJX9e5441HXe5pdggB7ECQpRfZuLdvwNLXq3v55joQI/3aTLOtaFsoDP9R
	vmxXXeLfkejUIZCG8c3FL2O2SSddLJ6UTX1jMRrCA0N0R/NOs3zxsJLemO6kdpjIB+5mQrBfVZrK4
	ZqNMI/Dh/WbfbHRlCJ94KCSThqx6MT4l8Onbstc1iJJMsxt8b+AypPQNIGgZ294PcAE/t7Kh/JBBs
	9j5OwVGZ+R43RXJjN4VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjc5b-00000000tWR-2OgV;
	Mon, 11 Mar 2024 09:36:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjc4O-00000000sg7-1YBl
	for linux-riscv@bombadil.infradead.org;
	Mon, 11 Mar 2024 09:35:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=D0H4fA44zT5N27s+Kh4SgtJTB2b28yPECpS+di519/k=; b=pEtrAJpwHr8ymJQ0mopCCLcTxZ
	5sVBdL9lltNyiQh2/A3CWeuOr0PIUbiBN74thLHeTvqW7Qm9dixIxzSYwQH+i8NcOHWFyiGBeRD9+
	H+aADiEYQWqhREQagei+OjpN88k6TcD6DNu9JkCZX/TKfdxs+WFpwDD+0/fxg5AKeUmKhpCK6kIbJ
	2DP/RLP7r2IuD116eVsRC/9yrcqvHugDAMgkatTFh5jEridCGwpH7jOLZWF3sv7SueMVgjqgNI5Fc
	LxxWsWRA44aRw7uhzyvxRYpnprV9UN6rO8rbO0yfaEP7zEb+BocuNppQX8OT/Ynll5r2/y2HVfdlO
	F7V9sODA==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjc4L-00000008svE-0nLQ
	for linux-riscv@lists.infradead.org;
	Mon, 11 Mar 2024 09:35:43 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1dd9066b7c3so5001855ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2024 02:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1710149739; x=1710754539; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D0H4fA44zT5N27s+Kh4SgtJTB2b28yPECpS+di519/k=;
        b=VueC3GrwC2tCXM4eY8FBrNqEvS0/YAxHkn2todl4EfIBTAyXQKENL4Yfo67g6vQ7mY
         Fd7dGEWdkCeLkPgqH2TYX+zHG+CBOTIdNpaI8OVD2x+C5+fGwbjG2JNwTxyqc9QlmJi6
         +KVRAr7p36Ro26roIT5J/NojNSsXz0JNVKYljwdBII/+U3rDZkng8CX2SMDeDLsFyc+m
         TsTtDUvM/w8IbWL/29gOlk7p7Zm12S5F25F360MSuEkomjxHF7MBu1C+LcBy3XLO2H+Y
         n8Njb10N8y1hIJbhIapuU2N5feiZ6r1hFFTMTzwbKPC2gtCcn2D3OorOiXRELCWBV4E+
         mNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710149739; x=1710754539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0H4fA44zT5N27s+Kh4SgtJTB2b28yPECpS+di519/k=;
        b=dJhoZlRxbsBYw9wV517UDnvCXs2gGkw7sbCsLdl4T/QPzjLsng75wZXTRi3OuPeOgW
         62osBjLPICflqPjrMRLLu2A1QeLaXbOcH3YErSdHIa3QW5mpPvrznsBJBZyOnL0h74xL
         CobX5EIaG80DeNsyV7udJ6jJ3yVSKoUVtFxRQPS8BG83W6HlV0cAs36MGCW/Bno3dDwh
         uF08rsF4LgI6koS1mzZdz0rcD6vdr7od9BH+gWb/ClsrwBcUdWvO7BQHue+MiFCGgG3s
         6DWMc769+9RBLAPbLxg2/ZchAuHWo3nAMGRxQx6IFVvx6p9pBamrLrjzqMxUMGiUvfF6
         z+lg==
X-Forwarded-Encrypted: i=1; AJvYcCV4C7WnIy/lVh67mqkVx7h61esNgKQCwI/IRNLvuPSgpTegHqPhtnpkUxOJ+J3Sjbp7M9vzII4XsTAsvV8mKnvu7nx5ZxeCJZUjlyke0gRl
X-Gm-Message-State: AOJu0YyO3nQhiwtRkv1OkJ8V2QUAckJePzwpPRPHCcTo8aU6TTaMqqP1
	gAOqCPdqx+tEoszdjcQCW/dd2/6YeA+Ylk7Akf5g6tEs6t2dfs7yv64eXRXXk1g=
X-Google-Smtp-Source: AGHT+IF9o9Zp/qBA6Xo09/VLeiyzi/BAQ9e7SOdKG4PQAZHA8aQWeEpKs4fq0ske4qR64Qj0bN0ISw==
X-Received: by 2002:a17:902:c947:b0:1dd:a179:5ff3 with SMTP id i7-20020a170902c94700b001dda1795ff3mr1317685pla.9.1710149739100;
        Mon, 11 Mar 2024 02:35:39 -0700 (PDT)
Received: from localhost.localdomain ([43.129.25.208])
        by smtp.gmail.com with ESMTPSA id h9-20020a170902f7c900b001dcad9cbf8bsm4253365plw.239.2024.03.11.02.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 02:35:38 -0700 (PDT)
From: Menglong Dong <dongmenglong.8@bytedance.com>
To: andrii@kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@google.com,
	haoluo@google.com,
	jolsa@kernel.org,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	davem@davemloft.net,
	dsahern@kernel.org,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	quentin@isovalent.com,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Menglong Dong <dongmenglong.8@bytedance.com>
Subject: [PATCH bpf-next v2 9/9] selftests/bpf: add testcases for multi-link of tracing
Date: Mon, 11 Mar 2024 17:35:26 +0800
Message-Id: <20240311093526.1010158-10-dongmenglong.8@bytedance.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_093541_414793_68E371AE 
X-CRM114-Status: GOOD (  18.07  )
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

In this commit, we add some testcases for the following attach types:

BPF_TRACE_FENTRY_MULTI
BPF_TRACE_FEXIT_MULTI
BPF_MODIFY_RETURN_MULTI

Signed-off-by: Menglong Dong <dongmenglong.8@bytedance.com>
---
 net/bpf/test_run.c                            |   3 +
 .../selftests/bpf/bpf_testmod/bpf_testmod.c   |  49 ++++
 .../bpf/prog_tests/tracing_multi_link.c       | 153 +++++++++++++
 .../selftests/bpf/progs/tracing_multi_test.c  | 209 ++++++++++++++++++
 4 files changed, 414 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/tracing_multi_link.c
 create mode 100644 tools/testing/selftests/bpf/progs/tracing_multi_test.c

diff --git a/net/bpf/test_run.c b/net/bpf/test_run.c
index 5535f9adc658..126218297984 100644
--- a/net/bpf/test_run.c
+++ b/net/bpf/test_run.c
@@ -673,6 +673,8 @@ int bpf_prog_test_run_tracing(struct bpf_prog *prog,
 	switch (prog->expected_attach_type) {
 	case BPF_TRACE_FENTRY:
 	case BPF_TRACE_FEXIT:
+	case BPF_TRACE_FENTRY_MULTI:
+	case BPF_TRACE_FEXIT_MULTI:
 		if (bpf_fentry_test1(1) != 2 ||
 		    bpf_fentry_test2(2, 3) != 5 ||
 		    bpf_fentry_test3(4, 5, 6) != 15 ||
@@ -685,6 +687,7 @@ int bpf_prog_test_run_tracing(struct bpf_prog *prog,
 			goto out;
 		break;
 	case BPF_MODIFY_RETURN:
+	case BPF_MODIFY_RETURN_MULTI:
 		ret = bpf_modify_return_test(1, &b);
 		if (b != 2)
 			side_effect++;
diff --git a/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c b/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c
index 39ad96a18123..99a941b26cff 100644
--- a/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c
+++ b/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c
@@ -98,12 +98,61 @@ bpf_testmod_test_struct_arg_8(u64 a, void *b, short c, int d, void *e,
 	return bpf_testmod_test_struct_arg_result;
 }
 
+noinline int
+bpf_testmod_test_struct_arg_9(struct bpf_testmod_struct_arg_2 a,
+			      struct bpf_testmod_struct_arg_1 b) {
+	bpf_testmod_test_struct_arg_result = a.a + a.b  + b.a;
+	return bpf_testmod_test_struct_arg_result;
+}
+
+noinline int
+bpf_testmod_test_struct_arg_10(int a, struct bpf_testmod_struct_arg_2 b) {
+	bpf_testmod_test_struct_arg_result = a + b.a + b.b;
+	return bpf_testmod_test_struct_arg_result;
+}
+
+noinline struct bpf_testmod_struct_arg_2 *
+bpf_testmod_test_struct_arg_11(int a, struct bpf_testmod_struct_arg_2 b, int c) {
+	bpf_testmod_test_struct_arg_result = a + b.a + b.b + c;
+	return (void *)bpf_testmod_test_struct_arg_result;
+}
+
+noinline int
+bpf_testmod_test_struct_arg_12(int a, struct bpf_testmod_struct_arg_2 b, int *c) {
+	bpf_testmod_test_struct_arg_result = a + b.a + b.b + *c;
+	return bpf_testmod_test_struct_arg_result;
+}
+
 noinline int
 bpf_testmod_test_arg_ptr_to_struct(struct bpf_testmod_struct_arg_1 *a) {
 	bpf_testmod_test_struct_arg_result = a->a;
 	return bpf_testmod_test_struct_arg_result;
 }
 
+noinline int
+bpf_testmod_test_arg_ptr_1(struct bpf_testmod_struct_arg_1 *a) {
+	bpf_testmod_test_struct_arg_result = a->a;
+	return bpf_testmod_test_struct_arg_result;
+}
+
+noinline int
+bpf_testmod_test_arg_ptr_2(struct bpf_testmod_struct_arg_2 *a) {
+	bpf_testmod_test_struct_arg_result = a->a + a->b;
+	return bpf_testmod_test_struct_arg_result;
+}
+
+noinline int
+bpf_testmod_test_arg_ptr_3(int a, struct bpf_testmod_struct_arg_2 *b) {
+	bpf_testmod_test_struct_arg_result = a + b->a + b->b;
+	return bpf_testmod_test_struct_arg_result;
+}
+
+noinline int
+bpf_testmod_test_arg_ptr_4(struct bpf_testmod_struct_arg_2 *a, int b) {
+	bpf_testmod_test_struct_arg_result = a->a + a->b + b;
+	return bpf_testmod_test_struct_arg_result;
+}
+
 __bpf_kfunc void
 bpf_testmod_test_mod_kfunc(int i)
 {
diff --git a/tools/testing/selftests/bpf/prog_tests/tracing_multi_link.c b/tools/testing/selftests/bpf/prog_tests/tracing_multi_link.c
new file mode 100644
index 000000000000..61701a5b3494
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/tracing_multi_link.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2024 Bytedance. */
+
+#include <test_progs.h>
+#include "tracing_multi_test.skel.h"
+
+static void test_skel_auto_api(void)
+{
+	struct tracing_multi_test *skel;
+	int err;
+
+	skel = tracing_multi_test__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "tracing_multi_test__open_and_load"))
+		return;
+
+	/* disable all programs that should fail */
+	bpf_program__set_autoattach(skel->progs.fentry_fail_test1, false);
+	bpf_program__set_autoattach(skel->progs.fentry_fail_test2, false);
+	bpf_program__set_autoattach(skel->progs.fentry_fail_test3, false);
+	bpf_program__set_autoattach(skel->progs.fentry_fail_test4, false);
+	bpf_program__set_autoattach(skel->progs.fentry_fail_test5, false);
+	bpf_program__set_autoattach(skel->progs.fentry_fail_test6, false);
+	bpf_program__set_autoattach(skel->progs.fentry_fail_test7, false);
+	bpf_program__set_autoattach(skel->progs.fentry_fail_test8, false);
+
+	bpf_program__set_autoattach(skel->progs.fexit_fail_test1, false);
+	bpf_program__set_autoattach(skel->progs.fexit_fail_test2, false);
+	bpf_program__set_autoattach(skel->progs.fexit_fail_test3, false);
+
+	err = tracing_multi_test__attach(skel);
+	bpf_object__free_btfs(skel->obj);
+	if (!ASSERT_OK(err, "tracing_multi_test__attach"))
+		goto cleanup;
+
+cleanup:
+	tracing_multi_test__destroy(skel);
+}
+
+static void test_skel_manual_api(void)
+{
+	struct tracing_multi_test *skel;
+	struct bpf_link *link;
+	int err;
+
+	skel = tracing_multi_test__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "tracing_multi_test__open_and_load"))
+		return;
+
+#define RUN_TEST(name, success)						\
+do {									\
+	link = bpf_program__attach(skel->progs.name);			\
+	err = libbpf_get_error(link);					\
+	if (!ASSERT_OK(success ? err : !err,				\
+		       "bpf_program__attach: " #name))			\
+		goto cleanup;						\
+	skel->links.name = err ? NULL : link;				\
+} while (0)
+
+	RUN_TEST(fentry_success_test1, true);
+	RUN_TEST(fentry_success_test2, true);
+	RUN_TEST(fentry_success_test3, true);
+	RUN_TEST(fentry_success_test4, true);
+	RUN_TEST(fentry_success_test5, true);
+
+	RUN_TEST(fexit_success_test1, true);
+	RUN_TEST(fexit_success_test2, true);
+
+	RUN_TEST(fmod_ret_success_test1, true);
+
+	RUN_TEST(fentry_fail_test1, false);
+	RUN_TEST(fentry_fail_test2, false);
+	RUN_TEST(fentry_fail_test3, false);
+	RUN_TEST(fentry_fail_test4, false);
+	RUN_TEST(fentry_fail_test5, false);
+	RUN_TEST(fentry_fail_test6, false);
+	RUN_TEST(fentry_fail_test7, false);
+	RUN_TEST(fentry_fail_test8, false);
+
+	RUN_TEST(fexit_fail_test1, false);
+	RUN_TEST(fexit_fail_test2, false);
+	RUN_TEST(fexit_fail_test3, false);
+
+cleanup:
+	tracing_multi_test__destroy(skel);
+}
+
+static void tracing_multi_test_run(struct tracing_multi_test *skel)
+{
+	LIBBPF_OPTS(bpf_test_run_opts, topts);
+	int err, prog_fd;
+
+	prog_fd = bpf_program__fd(skel->progs.fentry_manual_test1);
+	err = bpf_prog_test_run_opts(prog_fd, &topts);
+	ASSERT_OK(err, "test_run");
+	ASSERT_EQ(topts.retval, 0, "test_run");
+
+	ASSERT_EQ(skel->bss->fentry_test1_result, 1, "fentry_test1_result");
+	ASSERT_EQ(skel->bss->fentry_test2_result, 1, "fentry_test2_result");
+	ASSERT_EQ(skel->bss->fentry_test3_result, 1, "fentry_test3_result");
+	ASSERT_EQ(skel->bss->fentry_test4_result, 1, "fentry_test4_result");
+	ASSERT_EQ(skel->bss->fentry_test5_result, 1, "fentry_test5_result");
+	ASSERT_EQ(skel->bss->fentry_test6_result, 1, "fentry_test6_result");
+	ASSERT_EQ(skel->bss->fentry_test7_result, 1, "fentry_test7_result");
+	ASSERT_EQ(skel->bss->fentry_test8_result, 1, "fentry_test8_result");
+}
+
+static void test_attach_api(void)
+{
+	LIBBPF_OPTS(bpf_trace_multi_opts, opts);
+	struct tracing_multi_test *skel;
+	struct bpf_link *link;
+	const char *syms[8] = {
+		"bpf_fentry_test1",
+		"bpf_fentry_test2",
+		"bpf_fentry_test3",
+		"bpf_fentry_test4",
+		"bpf_fentry_test5",
+		"bpf_fentry_test6",
+		"bpf_fentry_test7",
+		"bpf_fentry_test8",
+	};
+	__u64 cookies[] = {1, 7, 2, 3, 4, 5, 6, 8};
+
+	skel = tracing_multi_test__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "tracing_multi_test__open_and_load"))
+		return;
+
+	opts.syms = syms;
+	opts.cookies = cookies;
+	opts.cnt = ARRAY_SIZE(syms);
+	link = bpf_program__attach_trace_multi_opts(skel->progs.fentry_manual_test1,
+						    &opts);
+	bpf_object__free_btfs(skel->obj);
+	if (!ASSERT_OK_PTR(link, "bpf_program__attach_trace_multi_opts"))
+		goto cleanup;
+	skel->links.fentry_manual_test1 = link;
+
+	skel->bss->pid = getpid();
+	skel->bss->test_cookie = true;
+	tracing_multi_test_run(skel);
+cleanup:
+	tracing_multi_test__destroy(skel);
+}
+
+void test_tracing_multi_attach(void)
+{
+	if (test__start_subtest("skel_auto_api"))
+		test_skel_auto_api();
+	if (test__start_subtest("skel_manual_api"))
+		test_skel_manual_api();
+	if (test__start_subtest("attach_api"))
+		test_attach_api();
+}
diff --git a/tools/testing/selftests/bpf/progs/tracing_multi_test.c b/tools/testing/selftests/bpf/progs/tracing_multi_test.c
new file mode 100644
index 000000000000..adfa4c2f6ee3
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/tracing_multi_test.c
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2024 ByteDance */
+#include <linux/bpf.h>
+#include <bpf/bpf_helpers.h>
+#include <bpf/bpf_tracing.h>
+#include "bpf_misc.h"
+
+char _license[] SEC("license") = "GPL";
+
+struct bpf_testmod_struct_arg_1 {
+	int a;
+};
+struct bpf_testmod_struct_arg_2 {
+	long a;
+	long b;
+};
+
+__u64 test_result = 0;
+
+int pid = 0;
+int test_cookie = 0;
+
+__u64 fentry_test1_result = 0;
+__u64 fentry_test2_result = 0;
+__u64 fentry_test3_result = 0;
+__u64 fentry_test4_result = 0;
+__u64 fentry_test5_result = 0;
+__u64 fentry_test6_result = 0;
+__u64 fentry_test7_result = 0;
+__u64 fentry_test8_result = 0;
+
+extern const void bpf_fentry_test1 __ksym;
+extern const void bpf_fentry_test2 __ksym;
+extern const void bpf_fentry_test3 __ksym;
+extern const void bpf_fentry_test4 __ksym;
+extern const void bpf_fentry_test5 __ksym;
+extern const void bpf_fentry_test6 __ksym;
+extern const void bpf_fentry_test7 __ksym;
+extern const void bpf_fentry_test8 __ksym;
+
+SEC("fentry.multi/bpf_testmod_test_struct_arg_1,bpf_testmod_test_struct_arg_9")
+int BPF_PROG2(fentry_success_test1, struct bpf_testmod_struct_arg_2, a)
+{
+	test_result = a.a + a.b;
+	return 0;
+}
+
+SEC("fentry.multi/bpf_testmod_test_struct_arg_2,bpf_testmod_test_struct_arg_10")
+int BPF_PROG2(fentry_success_test2, int, a, struct bpf_testmod_struct_arg_2, b)
+{
+	test_result = a + b.a + b.b;
+	return 0;
+}
+
+SEC("fentry.multi/bpf_testmod_test_arg_ptr_2,bpf_testmod_test_arg_ptr_4")
+int BPF_PROG(fentry_success_test3, struct bpf_testmod_struct_arg_2 *a)
+{
+	test_result = a->a + a->b;
+	return 0;
+}
+
+SEC("fentry.multi/bpf_testmod_test_struct_arg_1,bpf_testmod_test_struct_arg_4")
+int BPF_PROG2(fentry_success_test4, struct bpf_testmod_struct_arg_2, a, int, b,
+	      int, c)
+{
+	test_result = c;
+	return 0;
+}
+
+SEC("fentry.multi/bpf_testmod_test_struct_arg_1,bpf_testmod_test_struct_arg_2")
+int BPF_PROG2(fentry_success_test5, struct bpf_testmod_struct_arg_2, a, int, b,
+	      int, c)
+{
+	test_result = c;
+	return 0;
+}
+
+SEC("fentry.multi/bpf_testmod_test_struct_arg_1,bpf_testmod_test_struct_arg_1")
+int BPF_PROG2(fentry_fail_test1, struct bpf_testmod_struct_arg_2, a)
+{
+	test_result = a.a + a.b;
+	return 0;
+}
+
+SEC("fentry.multi/bpf_testmod_test_struct_arg_1,bpf_testmod_test_struct_arg_2")
+int BPF_PROG2(fentry_fail_test2, struct bpf_testmod_struct_arg_2, a)
+{
+	test_result = a.a + a.b;
+	return 0;
+}
+
+SEC("fentry.multi/bpf_testmod_test_struct_arg_1,bpf_testmod_test_arg_ptr_2")
+int BPF_PROG2(fentry_fail_test3, struct bpf_testmod_struct_arg_2, a)
+{
+	test_result = a.a + a.b;
+	return 0;
+}
+
+SEC("fentry.multi/bpf_testmod_test_struct_arg_2,bpf_testmod_test_struct_arg_2")
+int BPF_PROG2(fentry_fail_test4, int, a, struct bpf_testmod_struct_arg_2, b)
+{
+	test_result = a + b.a + b.b;
+	return 0;
+}
+
+SEC("fentry.multi/bpf_testmod_test_struct_arg_2,bpf_testmod_test_struct_arg_9")
+int BPF_PROG2(fentry_fail_test5, int, a, struct bpf_testmod_struct_arg_2, b)
+{
+	test_result = a + b.a + b.b;
+	return 0;
+}
+
+SEC("fentry.multi/bpf_testmod_test_struct_arg_2,bpf_testmod_test_arg_ptr_3")
+int BPF_PROG2(fentry_fail_test6, int, a, struct bpf_testmod_struct_arg_2, b)
+{
+	test_result = a + b.a + b.b;
+	return 0;
+}
+
+SEC("fentry.multi/bpf_testmod_test_arg_ptr_2,bpf_testmod_test_arg_ptr_3")
+int BPF_PROG(fentry_fail_test7, struct bpf_testmod_struct_arg_2 *a)
+{
+	test_result = a->a + a->b;
+	return 0;
+}
+
+SEC("fentry.multi/bpf_testmod_test_struct_arg_1,bpf_testmod_test_struct_arg_12")
+int BPF_PROG2(fentry_fail_test8, struct bpf_testmod_struct_arg_2, a, int, b,
+	      int, c)
+{
+	test_result = c;
+	return 0;
+}
+
+SEC("fexit.multi/bpf_testmod_test_struct_arg_1,bpf_testmod_test_struct_arg_2,bpf_testmod_test_struct_arg_3")
+int BPF_PROG2(fexit_success_test1, struct bpf_testmod_struct_arg_2, a, int, b,
+	      int, c, int, retval)
+{
+	test_result = retval;
+	return 0;
+}
+
+SEC("fexit.multi/bpf_testmod_test_struct_arg_2,bpf_testmod_test_struct_arg_12")
+int BPF_PROG2(fexit_success_test2, int, a, struct bpf_testmod_struct_arg_2, b,
+	      int, c, int, retval)
+{
+	test_result = a + b.a + b.b + retval;
+	return 0;
+}
+
+SEC("fexit.multi/bpf_testmod_test_struct_arg_1,bpf_testmod_test_struct_arg_4")
+int BPF_PROG2(fexit_fail_test1, struct bpf_testmod_struct_arg_2, a, int, b,
+	      int, c, int, retval)
+{
+	test_result = retval;
+	return 0;
+}
+
+SEC("fexit.multi/bpf_testmod_test_struct_arg_2,bpf_testmod_test_struct_arg_10")
+int BPF_PROG2(fexit_fail_test2, int, a, struct bpf_testmod_struct_arg_2, b,
+	      int, c, int, retval)
+{
+	test_result = a + b.a + b.b + retval;
+	return 0;
+}
+
+SEC("fexit.multi/bpf_testmod_test_struct_arg_2,bpf_testmod_test_struct_arg_11")
+int BPF_PROG2(fexit_fail_test3, int, a, struct bpf_testmod_struct_arg_2, b,
+	      int, c, int, retval)
+{
+	test_result = a + b.a + b.b + retval;
+	return 0;
+}
+
+SEC("fmod_ret.multi/bpf_modify_return_test,bpf_modify_return_test2")
+int BPF_PROG(fmod_ret_success_test1, int a, int *b)
+{
+	return 0;
+}
+
+static void tracing_multi_check(unsigned long long *ctx)
+{
+	if (bpf_get_current_pid_tgid() >> 32 != pid)
+		return;
+
+	__u64 cookie = test_cookie ? bpf_get_attach_cookie(ctx) : 0;
+	__u64 addr = bpf_get_func_ip(ctx);
+
+#define SET(__var, __addr, __cookie) ({			\
+	if (((const void *) addr == __addr) &&		\
+	     (!test_cookie || (cookie == __cookie)))	\
+		__var = 1;				\
+})
+	SET(fentry_test1_result, &bpf_fentry_test1, 1);
+	SET(fentry_test2_result, &bpf_fentry_test2, 7);
+	SET(fentry_test3_result, &bpf_fentry_test3, 2);
+	SET(fentry_test4_result, &bpf_fentry_test4, 3);
+	SET(fentry_test5_result, &bpf_fentry_test5, 4);
+	SET(fentry_test6_result, &bpf_fentry_test6, 5);
+	SET(fentry_test7_result, &bpf_fentry_test7, 6);
+	SET(fentry_test8_result, &bpf_fentry_test8, 8);
+}
+
+SEC("fentry.multi/bpf_fentry_test1")
+int BPF_PROG(fentry_manual_test1)
+{
+	tracing_multi_check(ctx);
+	return 0;
+}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
