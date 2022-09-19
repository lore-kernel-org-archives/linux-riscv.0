Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CDCC6FA8B
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Sep 2022 13:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/J/R2WGpWuLti1AJA/gpFvmgSR0qwQNnBtQ5MHiWp+M=; b=jR7KNfZYamOCij
	ZhPXDjnvKZEnnCIyUmARQS+S4qZu5k/E2xkVB456jrCAfKc54ofiml4fUYRA1nFAT6EDg5WjzQY3z
	9WkZtajfwNjxRu3SiA3rPeytln7TV1HQFcccno4/OZAv5q8kdV1eJhsHr44fYT2fhispFm4+GWZEY
	RpsZxT32jsL5yaHW81SlA5+kvpFsWc3PdU+IhiNuT99mQvmuVVW9YlSKvuUNuW2e/2mdlYN6Js5Ek
	LJaxMCBvTBWq+WLc3y/s8Yb7wHTXt7kqAlSjeUIblROQ8WGQ6FrFh2iRarHmzdA2XGt3o/LC8rJ6s
	teNb05YqRWmT8JdYDGPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaGOo-00Bn38-TJ; Mon, 19 Sep 2022 13:01:22 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaGOj-00Bmxw-40
	for linux-riscv@lists.infradead.org; Mon, 19 Sep 2022 13:01:19 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MWPp90GWdz14QRj;
	Mon, 19 Sep 2022 20:57:05 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 21:01:09 +0800
Received: from huawei.com (10.67.175.41) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 19 Sep
 2022 21:01:09 +0800
From: Yipeng Zou <zouyipeng@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<rostedt@goodmis.org>, <mingo@redhat.com>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <zanussi@kernel.org>,
	<mhiramat@kernel.org>, <liaochang1@huawei.com>, <chris.zjh@huawei.com>
CC: <zouyipeng@huawei.com>
Subject: [PATCH 2/2] tracing: kprobe: make gen test module work in arm and riscv
Date: Mon, 19 Sep 2022 20:56:29 +0800
Message-ID: <20220919125629.238242-3-zouyipeng@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220919125629.238242-1-zouyipeng@huawei.com>
References: <20220919125629.238242-1-zouyipeng@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.175.41]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_060117_552116_BD0C6E7F 
X-CRM114-Status: UNSURE (   9.90  )
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

For now, this selftest module can only work in x86 because of the
kprobe cmd was fixed use of x86 registers.
This patch adapted to register names under arm and riscv, So that
this module can be worked on those platform.

Fixes: 64836248dda2 ("tracing: Add kprobe event command generation test module")
Signed-off-by: Yipeng Zou <zouyipeng@huawei.com>
---
 kernel/trace/kprobe_event_gen_test.c | 47 +++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 4 deletions(-)

diff --git a/kernel/trace/kprobe_event_gen_test.c b/kernel/trace/kprobe_event_gen_test.c
index e023154be0f8..80e04a1e1977 100644
--- a/kernel/trace/kprobe_event_gen_test.c
+++ b/kernel/trace/kprobe_event_gen_test.c
@@ -35,6 +35,45 @@
 static struct trace_event_file *gen_kprobe_test;
 static struct trace_event_file *gen_kretprobe_test;
 
+#define KPROBE_GEN_TEST_FUNC	"do_sys_open"
+
+/* X86 */
+#if defined(CONFIG_X86_64) || defined(CONFIG_X86_32)
+#define KPROBE_GEN_TEST_ARG0	"dfd=%ax"
+#define KPROBE_GEN_TEST_ARG1	"filename=%dx"
+#define KPROBE_GEN_TEST_ARG2	"flags=%cx"
+#define KPROBE_GEN_TEST_ARG3	"mode=+4($stack)"
+
+/* ARM64 */
+#elif defined(CONFIG_ARM64)
+#define KPROBE_GEN_TEST_ARG0	"dfd=%x0"
+#define KPROBE_GEN_TEST_ARG1	"filename=%x1"
+#define KPROBE_GEN_TEST_ARG2	"flags=%x2"
+#define KPROBE_GEN_TEST_ARG3	"mode=%x3"
+
+/* ARM */
+#elif defined(CONFIG_ARM)
+#define KPROBE_GEN_TEST_ARG0	"dfd=%r0"
+#define KPROBE_GEN_TEST_ARG1	"filename=%r1"
+#define KPROBE_GEN_TEST_ARG2	"flags=%r2"
+#define KPROBE_GEN_TEST_ARG3	"mode=%r3"
+
+/* RISCV */
+#elif defined(CONFIG_RISCV)
+#define KPROBE_GEN_TEST_ARG0	"dfd=%a0"
+#define KPROBE_GEN_TEST_ARG1	"filename=%a1"
+#define KPROBE_GEN_TEST_ARG2	"flags=%a2"
+#define KPROBE_GEN_TEST_ARG3	"mode=%a3"
+
+/* others */
+#else
+#define KPROBE_GEN_TEST_ARG0	NULL
+#define KPROBE_GEN_TEST_ARG1	NULL
+#define KPROBE_GEN_TEST_ARG2	NULL
+#define KPROBE_GEN_TEST_ARG3	NULL
+#endif
+
+
 /*
  * Test to make sure we can create a kprobe event, then add more
  * fields.
@@ -58,14 +97,14 @@ static int __init test_gen_kprobe_cmd(void)
 	 * fields.
 	 */
 	ret = kprobe_event_gen_cmd_start(&cmd, "gen_kprobe_test",
-					 "do_sys_open",
-					 "dfd=%ax", "filename=%dx");
+					 KPROBE_GEN_TEST_FUNC,
+					 KPROBE_GEN_TEST_ARG0, KPROBE_GEN_TEST_ARG1);
 	if (ret)
 		goto free;
 
 	/* Use kprobe_event_add_fields to add the rest of the fields */
 
-	ret = kprobe_event_add_fields(&cmd, "flags=%cx", "mode=+4($stack)");
+	ret = kprobe_event_add_fields(&cmd, KPROBE_GEN_TEST_ARG2, KPROBE_GEN_TEST_ARG3);
 	if (ret)
 		goto free;
 
@@ -128,7 +167,7 @@ static int __init test_gen_kretprobe_cmd(void)
 	 * Define the kretprobe event.
 	 */
 	ret = kretprobe_event_gen_cmd_start(&cmd, "gen_kretprobe_test",
-					    "do_sys_open",
+					    KPROBE_GEN_TEST_FUNC,
 					    "$retval");
 	if (ret)
 		goto free;
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
