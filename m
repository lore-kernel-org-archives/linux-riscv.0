Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F890FC6171
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 07:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=COx1bZWlVQ1fZB4FNdnz4biSuJeMmD7zve6E4pS9ZbM=; b=q+P4PKPWH5OO//
	oSQTaMUZ0LgSHcEAALaWs2HlPG6HnyMT66kgBiiuc7OOKybEXfAPz5Tfsl+Vn8ScDKrYzHG/2G9aV
	0SvrnnwmPZOtt2JNjeKvx5bvCspyd24b0gIOcU9g+loIiDoVHstEvyc87oqAIpfb4mTrvg0LKoPQd
	CwohTcPyrylmxrNvA4Vmp6PU1CH99uVJd7cfbMe6d70ZprtkQ+muA8HYpObltJLghQsHgrWYJ/Q4o
	nLDqm8sMGbcj4YxucNW+W5EL498NBybJiq969MIvgiAoqGVN+carTx6rOpoHcjg/LBXf4gaecqTRC
	qZvwhfYT+WBukDQ5MfSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbw2T-000000093VW-46mM;
	Sat, 03 Jan 2026 07:27:08 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbw2R-000000093Uv-0y38
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 07:27:04 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 52C8F3417FE;
	Sat, 03 Jan 2026 07:26:58 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sat, 03 Jan 2026 15:26:14 +0800
Subject: [PATCH v3 3/4] clk: spacemit: add platform SoC prefix to reset
 name
MIME-Version: 1.0
Message-Id: <20260103-06-k1-clk-common-v3-3-6061d9f69eef@gentoo.org>
References: <20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org>
In-Reply-To: <20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2118; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=a0l0Hwtc8AX9/uTm8puy0kd/nzf/RxGqjZIZTzVv96M=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpWMSqrrh3fUziF5/wgj9P0hv3eufyArdSVEIfu
 G7O5m0rT6qJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaVjEqhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3g4g/9EDeNvG2pbBYxE9jt07jAd5giC77CrVOu5lEvMtA9EQ8mNQtidhnrF
 soK9/0MZ+teAeSweejMVxv+wOHaEoXX1pY8ve4ri7N66ZtCqq6UhbZiB1IG6J1VktWPDpiGzR55
 rynXgGToP3lON2jkmsLDYAHHa4h1chQZpzOF9UHem4SrN31m/mBC9I4xi3/DMeOTwN43eVGoNn+
 wCnNew8AJjTzzMnaLOrNTRDeZR1wcDVdLTLPNOT+TjB20aWAiReduDDfZSJu/xW0RlPnf54inK8
 N+d2kVfVcz9ht3nXRMiupDYr9ytMP1FLJycjtAgRbTTVUjFaKZaun+i+voAkaRKT0iQKZJF8SoU
 aTeSvP1FD8qqapuMLzCDdjIURswx1GbSUBq3JfO6O0JDnkWXp6LuKlMiEpoa0qOXKpfSoeLH2Go
 nJMTJS2ApUEjo6sr34im1QZ28aqD71Jxrfq8aynzGgz9jCbIsV3YqG12rXd3VUhn0EbwsW8/RsZ
 w1Xm2WxxgX21EPkrswAHyTklkC15hbCOPGHbZV+Dli9VmHRc9m8fSZwTFJ2JZJ/zuTj+3ZjvLB7
 GY4IAOYJqseRQrxxluxGobcbwHk/vnsmY0pmQbHVnTvmAznAu+oal/hl/GEauLlsWqWkceDNx/f
 CceQDhCJHv+i9yHWkaRkYdJXJINNsc=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_232703_300403_573AB18D 
X-CRM114-Status: GOOD (  10.79  )
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

This change is needed for adding future new SpacemiT K3 reset driver.

Since both K1 and K3 reset code register via the same module which its
name changed to spacemit_ccu, it's necessary to encode the platform/SoC
in the reset auxiliary device name to distinguish them, otherwise two
reset drivers will claim to support same "compatible" auxiliary device
even in the case of only one CCU clock driver got registered, which in
the end lead to a broken reset driver.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/clk/spacemit/ccu-k1.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 02c792a73759..dee14d25f75d 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -789,7 +789,7 @@ static struct clk_hw *k1_ccu_mpmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
-	.reset_name	= "mpmu-reset",
+	.reset_name	= "k1-mpmu-reset",
 	.hws		= k1_ccu_mpmu_hws,
 	.num		= ARRAY_SIZE(k1_ccu_mpmu_hws),
 };
@@ -900,7 +900,7 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apbc_data = {
-	.reset_name	= "apbc-reset",
+	.reset_name	= "k1-apbc-reset",
 	.hws		= k1_ccu_apbc_hws,
 	.num		= ARRAY_SIZE(k1_ccu_apbc_hws),
 };
@@ -971,21 +971,21 @@ static struct clk_hw *k1_ccu_apmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apmu_data = {
-	.reset_name	= "apmu-reset",
+	.reset_name	= "k1-apmu-reset",
 	.hws		= k1_ccu_apmu_hws,
 	.num		= ARRAY_SIZE(k1_ccu_apmu_hws),
 };
 
 static const struct spacemit_ccu_data k1_ccu_rcpu_data = {
-	.reset_name	= "rcpu-reset",
+	.reset_name	= "k1-rcpu-reset",
 };
 
 static const struct spacemit_ccu_data k1_ccu_rcpu2_data = {
-	.reset_name	= "rcpu2-reset",
+	.reset_name	= "k1-rcpu2-reset",
 };
 
 static const struct spacemit_ccu_data k1_ccu_apbc2_data = {
-	.reset_name	= "apbc2-reset",
+	.reset_name	= "k1-apbc2-reset",
 };
 
 static const struct of_device_id of_k1_ccu_match[] = {

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
