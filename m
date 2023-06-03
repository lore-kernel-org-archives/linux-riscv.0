Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4BFC77B7A
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 08:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8bZtZlBZRTM5Y/f0+A+hig34GuQDF3IZTO8j9iwc7hU=; b=AT97l2D16yJMFb
	AtzAC/D3GXRQ4d0t3/IyHxmSMiwf8JeSCuXl57JkcMlOw21+sEa7v4Ty2hZih/kUQXlK3V5sqhK07
	phJNi3NLb9xRjD7X0NdjLyVXAtMJgDJAw2bseyZFDz+Au19hKbeNlBOctU5kZ7P8EWk5rKH1m6qmU
	e+uroiYUI96ofqKIsw1PrfYO6IRnmNLLfFW9M/MRkb+36P46VovMZCa1KPEUK/kQyUzgggACEj3KI
	7ywSELDghzoywELRLdllWEK2jpkvGTOkgOPLNewmOentwP+CPyRfmn4WGua76uVWeYutlYs/rkR6Y
	Ye4YdpxWHYl/mJVOlr9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5MJd-0093pJ-0f;
	Sat, 03 Jun 2023 08:08:49 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5MJa-0093oB-2A
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jun 2023 08:08:48 +0000
X-QQ-mid: bizesmtp71t1685779713tgcqkwdm
Received: from linux-lab-host.localdomain ( [119.123.130.226])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 03 Jun 2023 16:08:32 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: XBN7tc9DADLabrxk/+QDcnBfINyYg7hhkwxt2+gkdZwvWG8oXdYSvY4ACTUEK
	n+bM6hXEGtjzMWAut9D+MR9IRJiuWBUhAMptGJTyaSGuTS+zNj2PwvFLnK6O+fEod5ePmJ4
	kzos7o/x54UwO+YylckkWOsgZYjfYkkzOkFnysR7xn77a0Nt3bl902/Q6v1226RSUYNfNWu
	rdohXqJ8xtcviTGsD4rZTt4RWdY9+j4APz5jkhrHYiZLLABKtnmK4VRSbYhhKXK0L2JlE+j
	+VGh5GKFc9D/O8lIopK9trH7Kn8+8UfZ2gzyuXCGyx3D6XP+U+U26Td3XAPDP0BjtgJJCkR
	57O8mIZIN1jazn9PjSTbpuzjwHybPXzcb9PFM1ZIXMN3MtM3KCTcxmd9fs22pH2m7/At6HL
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18070674266371447120
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v3 06/12] selftests/nolibc: use INT_MAX instead of __INT_MAX__
Date: Sat,  3 Jun 2023 16:08:12 +0800
Message-Id: <9e48ea5aab5a988fcba923632e6681c111dd5525.1685777982.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685777982.git.falcon@tinylab.org>
References: <cover.1685777982.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_010847_015202_FF6F04A2 
X-CRM114-Status: GOOD (  10.22  )
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

nolibc now has INT_MAX in stdint.h, so, don't mix INT_MAX and
__INT_MAX__, unify them to INT_MAX.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 2a2954cb7bef..a8fcad801cf2 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -931,7 +931,7 @@ static const struct test test_names[] = {
 int main(int argc, char **argv, char **envp)
 {
 	int min = 0;
-	int max = __INT_MAX__;
+	int max = INT_MAX;
 	int ret = 0;
 	int err;
 	int idx;
@@ -979,7 +979,7 @@ int main(int argc, char **argv, char **envp)
 				 * here, which defaults to the full range.
 				 */
 				do {
-					min = 0; max = __INT_MAX__;
+					min = 0; max = INT_MAX;
 					value = colon;
 					if (value && *value) {
 						colon = strchr(value, ':');
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
