Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0460EB64D9
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 15:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ELGaFBMUFWnkg23NkLKG5WzB1qk+Lfm++0F3kiQ7Ag4=; b=MrPpC2KP0YiE1j
	oujAiHeQLnefwXX8KsNVIhM99cBDr5AEXuHoQFBJBH0N8PcCyH5KuSX35dugjDldzHdnH7DrVewIf
	ulfFRSRmBeK/gGXu1hTS33PfZgty8TLd+uxnRuEKHJkEpXppFsBsFlhHoBIFfQFHvmemcO2P2NJBa
	/m0wCzYHF6weMxjoxIPrfRfrHMod/vjiv9vvdTPc6V0y3lcQoe+4l0GtPU9Zn9Go6KE5IZd94QUxI
	ie6zuVjae4M8Pb35lxbtLNHW5vxNV2oDMQvnUmbXywB2ow5+A5dO/ZZp4tyhJh9Arj9Fhmw9W0Bx0
	MALXeqz7BzTN6aGrIznQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHmyz-004xsg-1x;
	Fri, 07 Jul 2023 15:02:53 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHmyw-004xqd-0G
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 15:02:51 +0000
X-QQ-mid: bizesmtp63t1688742143tn8jl0ih
Received: from linux-lab-host.localdomain ( [116.30.131.119])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Jul 2023 23:02:22 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: hoArX50alxFmsJ0atZjqbzHeVuse8MtD4x3pgHfFnxe1hIjs3zsPJJljILwPP
	cZOCtJq2GFFmaWMlBnT7xIijoHajHOWxCVCyUgsrmQJI4aJwBx1j1G0/nT9v816H4crLevD
	b2wqhPOTx2jJXGPA0XEf1e4cXnpNe+Ho6HRdAYwOKiwGrv3+FsrXaYQXFnirspceOYnrj5d
	2gD2Mwc5hrF7Tk82JzkwT9vRE8qLrIbfJAFlgLQxBAVjmuqj1HFPF+meU0LnlvFzYUHVQsU
	ALHr5zeDk8O8oofQT+qDeXFlCZuVx8tWjuBG0NsEHzSMmIGDxTHm1aGJR5nGRksKAQw62x2
	856wxltVV+JT2VWIZNTh1T+Ecuwb/jyN6hRoodt577DibVw0p0ypooL8P7v34K9lg6uY0Ni
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7535638931028319636
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	david.laight@aculab.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v6 10/15] selftests/nolibc: prepare: create /dev/zero
Date: Fri,  7 Jul 2023 23:02:16 +0800
Message-Id: <589b6a374e604b6289eb00890cd63e2b7d2ce86f.1688739492.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1688739492.git.falcon@tinylab.org>
References: <cover.1688739492.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_080250_440452_17F2E81C 
X-CRM114-Status: UNSURE (   8.45  )
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

/dev/zero is commonly used to allocate anonymous memory, it is a very
good file for tests, let's prepare it.

Suggested-by: Willy Tarreau <w@1wt.eu>
Link: https://lore.kernel.org/lkml/20230702193306.GK16233@1wt.eu/
Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 88b840f86f52..b759fb25d375 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -894,11 +894,13 @@ int prepare(void)
 	 */
 	if (stat("/dev/.", &stat_buf) == 0 || mkdir("/dev", 0755) == 0) {
 		if (stat("/dev/console", &stat_buf) != 0 ||
-		    stat("/dev/null", &stat_buf) != 0) {
+		    stat("/dev/null", &stat_buf) != 0 ||
+		    stat("/dev/zero", &stat_buf) != 0) {
 			/* try devtmpfs first, otherwise fall back to manual creation */
 			if (mount("/dev", "/dev", "devtmpfs", 0, 0) != 0) {
 				mknod("/dev/console", 0600 | S_IFCHR, makedev(5, 1));
 				mknod("/dev/null",    0666 | S_IFCHR, makedev(1, 3));
+				mknod("/dev/zero",    0666 | S_IFCHR, makedev(1, 5));
 			}
 		}
 	}
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
