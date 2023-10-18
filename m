Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5101CDB474
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 02:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IREoyMQ2il5CT1/OOhuE8ooIO0UpidyAMY4WNmh09/4=; b=Twrwb2IxjR2cyi
	P7FF06TeRAifIcG0T+VqvYSp0VhoW4+YNMhK2tp0kVy8QFTjOHzcWz4Dqw2wIOf1IhcTdqw28VVH4
	uxqXD4DlUKO/dttSWfZuKP4ZPIjkilOoL93YCHJgD2j3/yjqiQnf4dZ1ivG6qh35OSm8VxPEQPsZf
	Ka/IUWP/OQXhK3Rsb5SdUj884l2Ag/ksVGwVJXdKTDxr5i/EcFjBTnmj+1OyP2uhaS45tFQgKYAQW
	v4Lf3/5o8kq5n8uwmwCK0RVtsRWADZJSidvA4Vdp2xGhQ9lSvs1bgJ+HKZ5dIsOHGwxlv5m7oCvfb
	SW5MusOTeyO6sP0OKkvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsvwM-00DZSw-0k;
	Wed, 18 Oct 2023 02:05:42 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsvwI-00DZQ7-0Q
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 02:05:40 +0000
Received: from dggpeml500003.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4S9DdG4fWszrTWX;
	Wed, 18 Oct 2023 10:02:42 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpeml500003.china.huawei.com
 (7.185.36.200) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 18 Oct
 2023 10:05:20 +0800
From: Yu Liao <liaoyu15@huawei.com>
To: <skhan@linuxfoundation.org>
CC: <liaoyu15@huawei.com>, <liwei391@huawei.com>, <rostedt@goodmis.org>,
	<linux-trace-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <shuah@kernel.org>, <mhiramat@kernel.org>
Subject: [RESEND PATCH 2/2] selftests/ftrace: Add riscv support for kprobe arg tests
Date: Wed, 18 Oct 2023 10:08:58 +0800
Message-ID: <20231018020858.1304218-3-liaoyu15@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231018020858.1304218-1-liaoyu15@huawei.com>
References: <20231018020858.1304218-1-liaoyu15@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500003.china.huawei.com (7.185.36.200)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_190538_402380_C0E6BEEC 
X-CRM114-Status: UNSURE (   7.15  )
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

This is the riscv variant of commit 9855c4626c67 ("selftests/ftrace:
Add ppc support for kprobe args tests").

Signed-off-by: Yu Liao <liaoyu15@huawei.com>
Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 .../selftests/ftrace/test.d/kprobe/kprobe_args_char.tc        | 3 +++
 .../selftests/ftrace/test.d/kprobe/kprobe_args_string.tc      | 3 +++
 .../selftests/ftrace/test.d/kprobe/kprobe_args_syntax.tc      | 4 ++++
 3 files changed, 10 insertions(+)

diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_char.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_char.tc
index 2b04603a3b40..21db6b720754 100644
--- a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_char.tc
+++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_char.tc
@@ -31,6 +31,9 @@ mips*)
 loongarch*)
   ARG1=%r4
 ;;
+riscv*)
+  ARG1=%a0
+;;
 *)
   echo "Please implement other architecture here"
   exit_untested
diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_string.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_string.tc
index a202b2ea4baf..4e086f871cee 100644
--- a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_string.tc
+++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_string.tc
@@ -31,6 +31,9 @@ mips*)
 loongarch*)
   ARG1=%r4
 ;;
+riscv*)
+  ARG1=%a0
+;;
 *)
   echo "Please implement other architecture here"
   exit_untested
diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_syntax.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_syntax.tc
index 1df61e13a812..8f1292ad80ff 100644
--- a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_syntax.tc
+++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_syntax.tc
@@ -44,6 +44,10 @@ loongarch*)
   GOODREG=%r4
   BADREG=%r12
 ;;
+riscv*)
+  GOODREG=%a0
+  BADREG=%a8
+;;
 *)
   echo "Please implement other architecture here"
   exit_untested
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
