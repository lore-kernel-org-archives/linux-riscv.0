Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4CCC7EE29
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 13:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iw+LB8JtZuJ1IkRJjAyfzS99k88vELjs9VMNB7SI4x4=; b=2J2SUKkdl4Zfl6
	Fhlf4ECIfgTVrtqcKI3GRiDVX/pMtAAbZWTWf+g/SCsfLHuWBM94aNFf1Ha5thcj03df/WJ/W81Cp
	4nL5onxo9O4kT6CUPB3z2a7QnXKKxdS81WJPZMFNsKgaa6+3ksTmM5elc0OFt13FURN+OI9yIbmj5
	uDYaxmxm98H86HGtlkLVpsPS/o+N6rFmpNLS/nD0JzcLPE6z2/EHWGFl6OxWVd2s+YUFOGOiWWM75
	0lzKBc7CHyOEr204fTlmczt2lpLCYBT8BK8GqnYD9F01xhSwHkKliIPLpv2vwOOnNwwTqAAfvfl8n
	7e8780MXNoYn9ZL03eZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3cXu-00AWs8-0B;
	Mon, 29 May 2023 13:04:22 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3cXq-00AWqy-3A
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 13:04:20 +0000
X-QQ-mid: bizesmtp88t1685365445t75bgpzp
Received: from linux-lab-host.localdomain ( [119.123.130.80])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 29 May 2023 21:04:04 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: i75H2eCteEjnLpMewxVxLDrNbTdZ6XaqgT62xHD7GAxbEuya2/NFVic9wlKR2
	a5kdGwQlpfjJNaz/YzSlhC5cSA4kagQIt3PINNuT2Ab6n1K/Gb8hBWDDwrYBCvcAdM5teIy
	tOKnMd4y8XFqHSNySJdqSIpkhrIGm9rMbckS9jbZuSK8O8MSz+MpEsOvJbYu+MaxqANEIjt
	vVBzQ1uUopCjGW00WJxlZOp576mh7k5SXdUajNV+l44GGMjwWPAcNDE7bQDJ4oQTtNsnlxk
	3AkOBDpTGFve+zAiy1AVAdMk3T6BxmWVv7KhdqlE8eHR7U2/3UDQRZ/couHwg6PX65e1LSr
	Mlj0aFqMaSpMWk5ZYcCda4bZ5eGDUnulVfBmOJIeJawj0cMpMwj4MMUoH7DHgASCg7DhcO6
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8875824386806725758
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v2 5/7] selftests/nolibc: use INT_MAX instead of __INT_MAX__
Date: Mon, 29 May 2023 21:04:02 +0800
Message-Id: <330da9ee27aff3500831a936ffdedc08cc481b63.1685362482.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685362482.git.falcon@tinylab.org>
References: <cover.1685362482.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_060419_308636_BF58B01D 
X-CRM114-Status: GOOD (  10.82  )
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
index e75ce6b68565..9ff9d87cc78e 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -935,7 +935,7 @@ static const struct test test_names[] = {
 int main(int argc, char **argv, char **envp)
 {
 	int min = 0;
-	int max = __INT_MAX__;
+	int max = INT_MAX;
 	int ret = 0;
 	int err;
 	int idx;
@@ -983,7 +983,7 @@ int main(int argc, char **argv, char **envp)
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
