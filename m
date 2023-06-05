Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB10C7EE2C
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 03:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DMFXTcnpT3LR/VFbMYQCcPjuafWYuYPw0uwZOzELv6A=; b=1KSRg9AEjppuOg
	y/0OwsaElegHgbcx5pM2MWUXj5EFeSjuUgNbtusdqEaEPoQ3a4tvMF11Wko2yRQ7OZM5PAchNgyh/
	/ihO+2dQzF8hbPe0MAh8rVlcc/XQ+4HmlkNJaAcVnlh4sP3y8lToI2s+0sJr5H9r6Yq6EVRWuVuJb
	zFrlUxy/SBSnBrOh3D6ZQwigkziSylQfMVjvBnoFx3k0XV1nmnx7KIP5zvSZUA+nFaD4i0Rpip6/h
	OrpJSheTmEWJ8jFhqA7B/QsWAHAnxt4D0T5sGye54kkeDtdXcQuJS3b1NKcvNdAq9qRbnFalE/p+d
	ajSQg7F8WsXqD1Yx/evw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q61Kv-00DzXC-1I;
	Mon, 05 Jun 2023 03:56:53 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q61Kt-00DzVA-0I
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 03:56:52 +0000
X-QQ-mid: bizesmtp82t1685937396t1aouh5f
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 05 Jun 2023 11:56:35 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: lm7sZZPcOdbJD8cVKMiASAi6Ml/t7tG1bkV1nfPLPi2vvHA+K/8f3KsCqtD4h
	LE7aT9mS730pQq+6dEcXz/fpRaJJRtqKoGlSuiNVsKvopYVg0cchyzAmQN9oq/txeCU22Sd
	CtnySZNGMOe0xBHD2xeYxw2OQr70b6yN+52l56pzPKka2ALTCEBKeBuW23qLP+UI0C17/ZT
	FDVh4zmtUmyLVGcrRaHhAefpzv6rSxiSNhLs0n/lIGGT3uPSjid8Wb+hDTXXLloZckxNl7C
	Xk8INamYkM+Qj5L/j5hdbxmrrK3ixkkfp0o5M+oHUvvv3n5hMAY+4nr40sgBq2pu3rQgU2K
	dP6IxQmVW1fAi4AhrjN1OKB0FAz02D2lObYwHl7xcncwCU+IL3Csj8V2sYGTTnAA3pKlDul
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9763339930852643474
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH 2/4] selftests/nolibc: allow run test-report directly
Date: Mon,  5 Jun 2023 11:50:04 +0800
Message-Id: <ab62c7a15acbfb6347ddb7569246e46df4e2ec3a.1685936428.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685936428.git.falcon@tinylab.org>
References: <cover.1685936428.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_205651_434547_E6CDA3D1 
X-CRM114-Status: UNSURE (   7.79  )
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

This allows to re-check the test report via 'make test-report' without
the requirement to re-run the dependency targets.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
index 8149ace2938a..5b0af8d8f5f3 100644
--- a/tools/testing/selftests/nolibc/Makefile
+++ b/tools/testing/selftests/nolibc/Makefile
@@ -128,10 +128,10 @@ libc-test: nolibc-test.c
 	$(QUIET_CC)$(CC) -o $@ $<
 
 test-report:
-	$(Q)awk '/\[OK\]$$/{p++} /\[FAIL\]$$/{f++} /\[SKIPPED\]$$/{s++} \
+	$(Q)[ -f $(CURDIR)/run.out ] && awk '/\[OK\]$$/{p++} /\[FAIL\]$$/{f++} /\[SKIPPED\]$$/{s++} \
 	         END{ printf("%d test(s) passed, %d skipped, %d failed.", p, s, f); \
 	         if (s+f > 0) printf(" See all results in %s\n", ARGV[1]); else print; }' \
-	         $(CURDIR)/run.out
+		 $(CURDIR)/run.out || :
 
 # qemu user-land test
 _run-user: nolibc-test
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
