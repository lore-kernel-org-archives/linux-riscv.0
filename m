Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158E5EB64D9
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 15:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ej4uSQca2GHtt9um9aZfAbIi4Gt0nWPbiAsIxEeZJZo=; b=KSmHGio2UKh//G
	wucKCdyrbNgtI4ZPwUGDSPDtbe5QWrY5PtYd6HHuCmTiUJlQ19noV2lIbalaVIidN4indVW9Reycm
	GawRJ10cgOnlNjO4T5IQljzVUCOB5e21KHPAyveU+YTO3UFE1K+jnerVgw3Il5WAbAP6VmWwFChDJ
	BkYmq00muaATiQkDNiqs5aJ3eyHhlrzvRhycaKKlNxUpbFPYQyhSciCm9SYJl3TFR010A4ZMIfhtJ
	1zw8SMdDC+4Jx05n9jii5fbHugwQc6SFg8CO3C3RaiVsr5q3ywPiAU9NMDh6l1jiZLmN1L3t72oBe
	xExs3rqXVPlY549PJngQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHn3a-004ydf-1F;
	Fri, 07 Jul 2023 15:07:38 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHn3X-004ybP-1n
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 15:07:37 +0000
X-QQ-mid: bizesmtp90t1688742437tcr8anue
Received: from linux-lab-host.localdomain ( [116.30.131.119])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Jul 2023 23:07:15 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: mRz6/7wsmIg+4CzfesqpnlhD9XXjDu45isJCglf5hPCGD0jR5QLXdzjRlVIQ6
	mmO6/WeU/h56+WwaqGBPYOWFEc03dMive8tkSFGo2uxhES+B9CjOOsEhcE2pm2tY4S7XXgx
	KPEaV+tS3ZY9PhO+3cnptxVVAUVvYyqXhMMkuyz2BhX5oVg9mGBm47uw9hyskv+N3FA+SBD
	uG4zoMJdLVJmaGMdPBTXDzLCa3Mkn26Y0pWBYeUUJRJXnc/gVcI12s9A9VxyEeanAfwO/qp
	zdHFwTe+Hz/74ftL/dLu1jF8T0e1MB9uPDRgfvzfwEgTYME2ad3zS6KJ5nSPzVOOAlyQFm1
	P8Voz8E8sHZJbgQwFA0JqWED7G59t0HcpmvyivohPpIt1rnSgx7CB9PAtd31Q==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7592088167357566417
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	david.laight@aculab.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v6 14/15] selftests/nolibc: add munmap_bad test case
Date: Fri,  7 Jul 2023 23:07:13 +0800
Message-Id: <f8e3ef34125baea1503ea037da09d5105b964be8.1688739493.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1688739492.git.falcon@tinylab.org>
References: <cover.1688739492.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_080735_915404_CDDFF316 
X-CRM114-Status: UNSURE (   6.10  )
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

The addr argument of munmap() must be a multiple of the page size,
passing invalid (void *)1 addr expects failure with -EINVAL.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 4026772ed4c5..8644e415cb66 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -670,6 +670,7 @@ int run_syscall(int min, int max)
 		CASE_TEST(lseek_0);           EXPECT_SYSER(1, lseek(0, 0, SEEK_SET), -1, ESPIPE); break;
 		CASE_TEST(mkdir_root);        EXPECT_SYSER(1, mkdir("/", 0755), -1, EEXIST); break;
 		CASE_TEST(mmap_bad);          EXPECT_PTRER(1, mmap(NULL, 0, PROT_READ, MAP_PRIVATE, 0, 0), MAP_FAILED, EINVAL); break;
+		CASE_TEST(munmap_bad);        EXPECT_SYSER(1, munmap((void *)1, 0), -1, EINVAL); break;
 		CASE_TEST(open_tty);          EXPECT_SYSNE(1, tmp = open("/dev/null", 0), -1); if (tmp != -1) close(tmp); break;
 		CASE_TEST(open_blah);         EXPECT_SYSER(1, tmp = open("/proc/self/blah", 0), -1, ENOENT); if (tmp != -1) close(tmp); break;
 		CASE_TEST(poll_null);         EXPECT_SYSZR(1, poll(NULL, 0, 0)); break;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
