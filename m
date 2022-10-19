Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B16C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Oct 2022 09:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qkC2yj6SJD7KBeSBks+wS2QGeTn6m4qjsImR2S/W5tY=; b=bQNGoCsQFzk+rO
	qM+l0bGyCJgUETqIZ4TEh/wBsi00JHriaF+HN/HJIj78wzLFf0eGKcTm16+rZn4N22wlEvCt3aViL
	+NCSW1+5jGBdyfYjDMlbGIC1jF6Katkj1eq60MqOu2ic3CwloIDizxK/h3fYBe5bzpTxXSrG8u+b8
	6CAR2BYnPqH7sf176wjVqMaFpszFH624d//uHaTeJe98qzO3Vm1htLYSkTPpSdClGmkY6tnHXY7AX
	CgyDls14RZiUju8ekIZ165F9HS6JT4wNlII0FuPhGZboJNTuYuTxBMkVK6YAG2Fj8/xzwDKwJmfqJ
	QaBaDVMS+piWCKMPejFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol53g-00HCwQ-Vx; Wed, 19 Oct 2022 09:08:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol53e-00HCvM-HW
	for linux-riscv@lists.infradead.org; Wed, 19 Oct 2022 09:08:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 279826186D;
	Wed, 19 Oct 2022 09:08:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72FB6C433D6;
	Wed, 19 Oct 2022 09:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666170494;
	bh=Xz/JYnNX+bv4d5sNBNrD5dHf4bfzzM5L7MEjHHLxJTw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bdo2h2kOyIwqT5X3ec7HmtT9zFHkpMZnleKyT7jkUiEJu+z43Xu2Yw/9oIKm0cO4i
	 cqmDXRVxRpIObpH/vtEywOX8ck4+DIwXKBeSWWO744mmGqsdZ+OvlYosLOaLNWeF9c
	 GSkFQTBQvQLKGonxEWHb+f0e9bk2gpud3Ux5nlJs=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	mingo@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	zanussi@kernel.org,
	liaochang1@huawei.com,
	chris.zjh@huawei.com,
	Yipeng Zou <zouyipeng@huawei.com>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.0 644/862] tracing: kprobe: Make gen test module work in arm and riscv
Date: Wed, 19 Oct 2022 10:32:11 +0200
Message-Id: <20221019083318.377867133@linuxfoundation.org>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221019083249.951566199@linuxfoundation.org>
References: <20221019083249.951566199@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_020814_688096_B94A8C0D 
X-CRM114-Status: GOOD (  13.97  )
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

From: Yipeng Zou <zouyipeng@huawei.com>

[ Upstream commit d8ef45d66c01425ff748e13ef7dd1da7a91cc93c ]

For now, this selftest module can only work in x86 because of the
kprobe cmd was fixed use of x86 registers.
This patch adapted to register names under arm and riscv, So that
this module can be worked on those platform.

Link: https://lkml.kernel.org/r/20220919125629.238242-3-zouyipeng@huawei.com

Cc: <linux-riscv@lists.infradead.org>
Cc: <mingo@redhat.com>
Cc: <paul.walmsley@sifive.com>
Cc: <palmer@dabbelt.com>
Cc: <aou@eecs.berkeley.edu>
Cc: <zanussi@kernel.org>
Cc: <liaochang1@huawei.com>
Cc: <chris.zjh@huawei.com>
Fixes: 64836248dda2 ("tracing: Add kprobe event command generation test module")
Signed-off-by: Yipeng Zou <zouyipeng@huawei.com>
Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
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
2.35.1




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
