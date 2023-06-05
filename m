Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94F7C7EE2C
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 03:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SzvR8mo9RrvALVoO2BVMeMw2gvtKwGKD/d6cd2TC8as=; b=DPA0+RzNZKdZYu
	HGKvyphGqcXWJzj85lrNI5ZKCXiq8hbAKWSqJOXu2JE8Fi8RzILerht5Aa1ql4STQdQHYih416TXd
	hwQ0wEWTGNRBol0upQ6x3QoKi8DWiabrDTkooJcczOF7dqsWuBmtIjfkvGAZiRikLEL6F+bqPlz5G
	1RrjCTxCLdL+QfZN9t9IKe8IrM4kuf5A2QDeQXIkLE16EzsZdrXGiduNHFSqx6WUwwGi9sA8gNNlW
	xvfSckgunWkhtDh7iOC92E2cN1ncGoFbwlozaxGnnICKL23ZWddvUNeqwgto7FBcjPsiD082fRg2u
	7VA/3p+qBX+cnNLcsaGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q61No-00E0F5-3D;
	Mon, 05 Jun 2023 03:59:53 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q61Nm-00E0Dw-27
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 03:59:52 +0000
X-QQ-mid: bizesmtp68t1685937578tx69i1ko
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 05 Jun 2023 11:59:37 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: lm7sZZPcOdYzjWmXFGgj6E3I64yRDtOeBkKpihw5JkC6Lh5HJLerIyruOvXGE
	kZaWrOoWRl3kQBx61WfeP9JGjH3DVcuICln3tJb6hodrhPrC4CzBb293lFd6sXzKdXUSkYo
	fkvOPxW86R2WYemPnw5yHFVCGrS3BXT5m82EELWi4l7NsT1L7/a3d+SgCnA3y7Z5KDgIUzM
	Lj4owyhk4zremCkMU+87WSmz4hMxzd3fzkDRBRpSbTUgzsPtC7vT3pz4IzKim/SlQr7rYHW
	9K3/kzT9fCpGzRik5GAItVGrbM4SqnTp0TF3XyrNqJlcoFgoB5zbOI1CE0Is01X4gJuhpil
	bAXNTEUPVGbvTyowOFEia/SH6FHOIeTHxV04gii9MpmlGM8W0BVdODaI+JQBQ==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 185392236661113198
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH 4/4] selftests/nolibc: fix up test-report for run target
Date: Mon,  5 Jun 2023 11:58:56 +0800
Message-Id: <48a994c40ac739a0e20ed7a34f290637e417bb0b.1685936428.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685936428.git.falcon@tinylab.org>
References: <cover.1685936428.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_205951_002778_C1256A28 
X-CRM114-Status: UNSURE (   8.84  )
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

There is a '\r' at the end of every log line when run nolibc-test on
qemu-system (make run), add support for this case, otherwise, the test
result will like this:

    0 test(s) passed, 0 skipped, 0 failed.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
index 518f85c77fe3..70a27fc41c22 100644
--- a/tools/testing/selftests/nolibc/Makefile
+++ b/tools/testing/selftests/nolibc/Makefile
@@ -128,7 +128,7 @@ libc-test: nolibc-test.c
 	$(QUIET_CC)$(CC) -o $@ $<
 
 test-report:
-	$(Q)[ -f $(CURDIR)/run.out ] && awk '/\[OK\]$$/{p++} /\[FAIL\]$$/{f++} /\[SKIPPED\]$$/{s++} \
+	$(Q)[ -f $(CURDIR)/run.out ] && awk '/\[OK\][\r]*$$/{p++} /\[FAIL\][\r]*$$/{f++} /\[SKIPPED\][\r]*$$/{s++} \
 	         END{ printf("%d test(s) passed, %d skipped, %d failed.", p, s, f); \
 	         printf(" See all results in %s\n", ARGV[1]); }' \
 		 $(CURDIR)/run.out || :
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
