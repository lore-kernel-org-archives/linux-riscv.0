Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7AEC7EE2C
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 03:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j/6ESjCqAlPW91rHYchgQwybVoZum641XbUcT0/qYRw=; b=UlgnKofEXp8j+c
	Wt7TZLiJDk3mNogLb+BVwSjSwbXuehN/V7veG3jpg9ovBra751fN+rWz79J6C0hg9iXC8ncWWCC6A
	i5+fqf+xBFW3o0mkVBxCKpScxEvHHz21BRRRVLzm49VTWM/zxJFHcxCdxt6F+415C+oCGV2fYQJyJ
	bGgXWw4JZIlrQ84EpDJzlWevEcAhWnT+xx3PrRtmPXw2RYkw2XvGFLGAmnT0WnkfXIw3l42jb2fha
	yd0XTw4dy3rjbbb+Gi9X4oHMArWMg6pcpFVCUv13hbNeZdU3c2CJKRaTAwGiVAL7PCduEcPvtWhEu
	CkJDjCZQ8eoL6vvfCWSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q61M9-00Dzii-2z;
	Mon, 05 Jun 2023 03:58:09 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q61M6-00Dzh0-2r
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 03:58:08 +0000
X-QQ-mid: bizesmtp89t1685937468tqznavd2
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 05 Jun 2023 11:57:47 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: dKvkn8qoLrGXN8h42NRMms+7urQ9WLIQF9jRVidEDJkV0vebFHsuJOValBm6o
	C3EIJxwfkS/a6CpLXS6bvhkA8SoIR1mt3nnZIMpbGaF3twWVbG9DPbwawMfrPT12NcT0xVy
	xxNaUL0PXRcrUQlpm8LPUUvB7Dkgd9ZBgsnt7GRinn9m0wQjnptaR3GWLjyfb5vdEny1J4r
	F4gXLkQBHKu9v1ynmmr7AROd+QdNG66n1ZBKVVI+JGuyNStZawuednjxkv98BAXHYs3JsvE
	FrgTtDwUxyzrgkjN9v6YQAGfJyW1gnxEUkatJDGzoncqAoREl4aTkk/RSNL5x9xWOWXNK93
	yDz01PwbYdrwhRDrKfO6HDEyPbNya71Pu7D/TIflfmDDAfhUCwlPPoDVdNefg==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2171116470520406675
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH 3/4] selftests/nolibc: always print the log file
Date: Mon,  5 Jun 2023 11:57:44 +0800
Message-Id: <835e118943d257b7a83066fb4fb77c0e5cf71534.1685936428.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685936428.git.falcon@tinylab.org>
References: <cover.1685936428.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_205807_217776_9F5CEB39 
X-CRM114-Status: UNSURE (   9.24  )
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

This allows to check the other issues of the output file manually even
when all of them passed.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
index 5b0af8d8f5f3..518f85c77fe3 100644
--- a/tools/testing/selftests/nolibc/Makefile
+++ b/tools/testing/selftests/nolibc/Makefile
@@ -130,7 +130,7 @@ libc-test: nolibc-test.c
 test-report:
 	$(Q)[ -f $(CURDIR)/run.out ] && awk '/\[OK\]$$/{p++} /\[FAIL\]$$/{f++} /\[SKIPPED\]$$/{s++} \
 	         END{ printf("%d test(s) passed, %d skipped, %d failed.", p, s, f); \
-	         if (s+f > 0) printf(" See all results in %s\n", ARGV[1]); else print; }' \
+	         printf(" See all results in %s\n", ARGV[1]); }' \
 		 $(CURDIR)/run.out || :
 
 # qemu user-land test
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
