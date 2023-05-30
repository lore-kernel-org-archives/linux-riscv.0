Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F581C77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 06:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4T8CeOzkivbmS7ySoFwbeBVx5MqDg96cFKcyi+MTeK0=; b=SOzJqX9CD93tXk
	I2od86we0kCDHQDDqxa0FSph4RYCiDCnTM4N1iUFeYO3g86zlaA7VUUK7y5v5wz1mcVBvDCHai3PL
	48kx1VkQPAzmjdqAbeoWI75hsjD6ptZLiuKvzzcL8O0M4oZkiVWDMEbLrpQeSzBCqHnQcKHs7KVFt
	qLB1Dk2K+SUnaZCOaSd/x+kCzv4iLl2xZfR0Zz8+u+BbnOGoOL8/V/PvosrgYhF87/CZ7+uYaRiFb
	J8Fnu3cMUDHx2161QP97iQj9POy/IKlkpyef3WQo1bbIObJuBs4Afui4gRFLot7Zmy1eL3jZeJF7K
	B8CgHr6vJCyFkyJjC8Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3t4e-00CbeZ-2u;
	Tue, 30 May 2023 06:43:16 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3t4b-00Cbdf-0t
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 06:43:14 +0000
X-QQ-mid: bizesmtp82t1685428979t23ocw7f
Received: from linux-lab-host.localdomain ( [119.123.130.226])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 May 2023 14:42:58 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: QityeSR92A2o5sTwmGCD+PqYMSq7MB3IEE8O3t1qtWOzFpvckQlLvvdZrNOgE
	uarJb402gzy9fGIWVhjEYpQDyVh3pANl+z9B3bRnf03I3oT4Z8IS23/bof7tQtzq8n306zg
	rfkF9nyJz0EwgB6+lRhH48uRW1Yn26Wa63FhSP+VEpWjL4h88ydg+O9QTlN1tjcPMc1t78H
	Lu0IRV35MhW/3iu3iLPjt2I6GN62hUKHRs8usz00u+QHRmd27bfqhcoZ1YUR/uHt3KJZ/Vw
	tQDkvr5b+CSZZca3/Zlcg1e1Kta/IIJVePMt3sGEWhxF7kPE1xfj8pZlQvEA7kEfwwJmTWj
	SiRjvuntBLs2VvV4oWQ47+LPVOAvuJ4gnoct3RfMo8LyztoU7oMHjwGgkJujDhOIhrVpOhd
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9349735140151722294
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH 2/2] selftests/nolibc: add sizeof test for the new 64bit data types
Date: Tue, 30 May 2023 14:42:56 +0800
Message-Id: <d1f4073e1dd9a51be93ea9e14ebd746b312646a4.1685428087.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685428087.git.falcon@tinylab.org>
References: <cover.1685428087.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_234313_642302_62A9E5E7 
X-CRM114-Status: UNSURE (   8.11  )
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

These test cases are required to make sure the new added data types are
really 64bit based.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 20d184da9a2b..43ce4d34b596 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -721,6 +721,14 @@ int run_stdlib(int min, int max)
 #else
 # warning "__SIZEOF_LONG__ is undefined"
 #endif /* __SIZEOF_LONG__ */
+		CASE_TEST(sizeof_time_t);           EXPECT_EQ(1, 8,                sizeof(time_t)); break;
+		CASE_TEST(sizeof_timespec);         EXPECT_EQ(1, 16,               sizeof(struct timespec)); break;
+#ifdef NOLIBC
+		CASE_TEST(sizeof_itimerspec);       EXPECT_EQ(1, 32,               sizeof(struct itimerspec)); break;
+#endif
+		CASE_TEST(sizeof_timeval);          EXPECT_EQ(1, 16,               sizeof(struct timeval)); break;
+		CASE_TEST(sizeof_itimerval);        EXPECT_EQ(1, 32,               sizeof(struct itimerval)); break;
+		CASE_TEST(sizeof_off_t);            EXPECT_EQ(1, 8,                sizeof(off_t)); break;
 		case __LINE__:
 			return ret; /* must be last */
 		/* note: do not set any defaults so as to permit holes above */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
