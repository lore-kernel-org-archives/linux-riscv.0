Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31855C001DE
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 15:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9w4Cw91WIiJqEcA90kTVzQJzW6G3HY/k0i/23yDB5Ag=; b=kAcmBs9CX1EXFp
	aZiNpT1cq6l0u/lLq4fTD0ETRuuUWOqmcTGguZic/7gLbU3zGI+F+m4rMP+/uEsSDB1cr7kmBhGMN
	zeGLANgBsJI3yT9fmxLGCzYTNCeqXbvH8bueItGcuEXSiqTOX6pWnX5UT4ZVhsgYoz2P+4CnTqBQj
	B8V4qvFvu0OuPFbrzgwJktxFHuppKxObTvpNBQIcX3Y/ye84ULrQDmIiaBelDWt64qakd6IXG6B5d
	t6CsgIrnDDHz8Z294GZJoqyyskyiVh7gW3CHv+jPAQs7k6fLK6YrTuUi2At3pL04CEBD7zTRy8W+V
	pujFGfgfxvxDRw/PSD+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHmxj-004xbZ-0E;
	Fri, 07 Jul 2023 15:01:35 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHmxf-004xa5-2E
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 15:01:33 +0000
X-QQ-mid: bizesmtp74t1688742074tg81aioz
Received: from linux-lab-host.localdomain ( [116.30.131.119])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Jul 2023 23:01:12 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: +bXiSo2NuBc1Cd2zooPSXRsbPXASdUhmi+9wjNyy/hjCxNCxO5qngS1ViteCu
	ns6FJkzManwTtWB7dHIZA8wXwP40Yky4g0FuLECXFu2Ndeaooo69kfrJoOWpX45uzyTGpAJ
	nPnUC0t4URkUa8//XlfzX4YGN4v3zUMSi9ZV8m6LygSdBTdSgSSjIFILqo/I6i5Wms9ANVE
	aV6qpvXLwzFzaQXY6srvtV54bxf/VqOAHBH4yJvqFIe0HX42Oago3jrel90v8a8ausjvOEk
	FMSau3FWLFNI4aFaEsG+uRScy9Trs8rFpplBRLluEWFJhrWXhZQ+mxR1ecuQeGowyBt7WKS
	7k2Ek8ShyF8kd1sCBdBFi6khn2PoKnT3U+WLKIUxsFoTpGVmTx0RBsy60RaMcVWc+wIOZ5x
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11414460270218283821
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	david.laight@aculab.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v6 09/15] selftests/nolibc: export argv0 for some tests
Date: Fri,  7 Jul 2023 23:01:09 +0800
Message-Id: <a7b5d53a8a27eae67625c5a6aec9b420f1217d4f.1688739492.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1688739492.git.falcon@tinylab.org>
References: <cover.1688739492.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_080132_052906_CE50AB42 
X-CRM114-Status: UNSURE (   9.82  )
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

argv0 is the path to nolibc-test program itself, which is a very good
always existing readable file for some tests, let's export it.

Note, the path may be absolute or relative, please make sure the tests
work with both of them. If it is relative, we must make sure the current
path is the one specified by the PWD environment variable.

Suggested-by: Willy Tarreau <w@1wt.eu>
Link: https://lore.kernel.org/lkml/ZKKbS3cwKcHgnGwu@1wt.eu/
Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 486334981e60..88b840f86f52 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -43,6 +43,9 @@
 /* will be used by nolibc by getenv() */
 char **environ;
 
+/* will be used by some test cases as readable file, please don't write it */
+static const char *argv0;
+
 /* definition of a series of tests */
 struct test {
 	const char *name;              /* test name */
@@ -948,6 +951,7 @@ int main(int argc, char **argv, char **envp)
 	int idx;
 	char *test;
 
+	argv0 = argv[0];
 	environ = envp;
 
 	/* when called as init, it's possible that no console was opened, for
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
