Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42126C982FA
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 13:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BxuXLKYVR+Yje6ssRDDeS8kNKPdn/f+hOq3tMhz9Cz4=; b=P7vajWlEuqss/+
	KcmJhHrcH3HAhJQMpt6QZz7Pefnv0nxDf6W4ca7PRLI2qyaeipEZEfiQpLi4v8MTvIuVq8dIvEjRZ
	SSwoNgEKaRtx3vMUIy1YcI+7X3x6WAS5z+htSzNbqI0UC4Uy7qgRasubs8MqYXe7AQwXoW50DIsZ1
	DUHB0R3YvOvz98R6h4/og8lZl21jtTEv1HbMXMajiz4ThwYs9P+bRUCXpfIQ7m0rcHBums3Itia/b
	u+tndpsUlg7I+RI1Zu3zjKAVvReQVQqzKgXU26F/7tfmr/m80Q1zHMRkEroYEaMmVCGXz8oaA5hIu
	9KormkuCgZDMciSnbU3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MjD-00000008LOd-2lNh;
	Wed, 23 Sep 2026 13:09:39 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Mj9-00000008LN5-11pW
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 13:09:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790168969; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=qDsY6laUwuanA+jJYyeUYogdaMe7dOVPNrzeOBRqPVI=;
	b=iuOYGxb0N9BlMMbWwRyqJlw+hbDw+czUPZk2A3P9GkLAjDQSo5lWOwrS76gEEZCA3XOpXzGwRVwi54b9WZpMvN6vlfYp5FS5qqwC/AX4Tfv3vXHqpmxRSgUNzKsIZBfHDxcB2wV2cxNEYnKcuPhFqk1si+WE5ByBIf/LnnOxGRU=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XBX4ZPj_1790168968;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XBX4ZPj_1790168968 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 23 Sep 2026 21:09:28 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	memxor@gmail.com,
	bjorn@kernel.org,
	puranjay@kernel.org
Cc: ihor.solodrai@linux.dev,
	eddyz87@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	pulehui@huawei.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	shuah@kernel.org,
	guoren@kernel.org,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next 2/2] selftests/bpf: Enable gotox tests for riscv64
Date: Wed, 23 Sep 2026 21:08:56 +0800
Message-ID: <20260923130856.1157-3-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923130856.1157-1-cp0613@linux.alibaba.com>
References: <20260923130856.1157-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_060935_459738_65162FBF 
X-CRM114-Status: UNSURE (   7.40  )
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

The riscv64 JIT now supports the gotox instruction and jump tables, so
run the tests in verifier_gotox.c on riscv64 too, mirroring what was done
for arm64 and powerpc.

The guard is 64-bit only because the RV32 JIT does not implement gotox.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 tools/testing/selftests/bpf/progs/verifier_gotox.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/verifier_gotox.c b/tools/testing/selftests/bpf/progs/verifier_gotox.c
index 5b18c9a27717..4a38f7da720a 100644
--- a/tools/testing/selftests/bpf/progs/verifier_gotox.c
+++ b/tools/testing/selftests/bpf/progs/verifier_gotox.c
@@ -6,7 +6,9 @@
 #include "bpf_misc.h"
 #include "../../../include/linux/filter.h"
 
-#if defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_powerpc)
+#if defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64) || \
+	defined(__TARGET_ARCH_powerpc) || \
+	(defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64)
 
 #define DEFINE_SIMPLE_JUMP_TABLE_PROG(NAME, SRC_REG, OFF, IMM, OUTCOME)	\
 									\
@@ -409,6 +411,8 @@ __naked void spill_fill_ptr_to_insn(void)
 	: __clobber_all);
 }
 
-#endif /* __TARGET_ARCH_x86 || __TARGET_ARCH_arm64 || __TARGET_ARCH_powerpc*/
+#endif /* __TARGET_ARCH_x86 || __TARGET_ARCH_arm64 ||
+	* __TARGET_ARCH_powerpc || __TARGET_ARCH_riscv
+	*/
 
 char _license[] SEC("license") = "GPL";
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
