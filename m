Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9057D185F8
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 13:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CD7sQj1boDV86HWinrpkWUavY893NDQ9nEhoWI0koxA=; b=Ryp9aBpD6r8YIt
	WFaaDdrJG+hDw/O9JZTpRZlde8ARl5YywaqeAKVXEcYd9r5GsVFBuZl8jQM2HUYDaBO7yjy3zpAsa
	fwLT1Djba7UxIxhtTPNE88zjI1JRg6eMhWgR/h6e3OCWZ7S2Cz7IZZqfDtHO7+k5UipfKt5UTzRJ8
	p+aI/4wMkY2ZAgTe/kRU6zIToY5f8b1jsH/jS2WP+cndaX71COX0wRcQhSUj2LQF9q8oyT6GM4INk
	f9xoeVJCeEeTMOMwPxSiiJFUtUZo3Ki56zs11J1uUFXSctoWAhjQU0v3htJ8QFTe8668olKh2OyRU
	cFzaklApNwBH8iMCuGDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqFU-0000000HCOP-1LlX;
	Thu, 08 Jan 2026 13:40:24 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqFQ-0000000HCMd-29RK
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 13:40:22 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 0B0F0341EC9;
	Thu, 08 Jan 2026 13:40:15 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 08 Jan 2026 21:39:24 +0800
Subject: [PATCH v4 3/4] clk: spacemit: add platform SoC prefix to reset
 name
MIME-Version: 1.0
Message-Id: <20260108-06-k1-clk-common-v4-3-badf635993d3@gentoo.org>
References: <20260108-06-k1-clk-common-v4-0-badf635993d3@gentoo.org>
In-Reply-To: <20260108-06-k1-clk-common-v4-0-badf635993d3@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2313; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=y46B++74XJZhaiqzj4f4dZZT9CJ1nDQjfA9Aref6lV0=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpX7Or4znHv7fFH5P5hyMKb2zjYhnFCIqLSMEvh
 faRGE9IBweJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaV+zqxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1OPQ/8CHyUffWJfqCg1OOScglpE4LG83/kQZSon3DGctzZFwfcuq6i737W3
 2/dmdFjwuhTQ4okGLYtRfy+fU7XgRCW+5sVQ6ZeuzdNv5gXSRUpYNtgcCQeIEjynn7k4n5LnSs6
 lLQNMGhlKYANZvOskjYmo0PiKgaSLzVPIKuQOQloFOkVLwYwGavoGKhL4e949y83AGJCh4WNKd8
 4U7OXPlX5ANDK3KjksTC5njjUzql602fpnd/E7RisU965iXwMbKMOBSCyrSTIe8Jj2nC16wpRu2
 /GPHYVS/9rfzqBnwIcINMvuU9/9bgI6VN8wTMMXyLoGKFJH/hS0KakIXzpKiVT3bmvdKNe/bhSm
 JKS+uBQqG6Q4aZ013e9R+O495ZyQ3i+Sk+8qX15oCPU6eyTSdWBIBRRVub/GF7p+kQ9lRw8QCYl
 69XzAQ1FUzveHbJqcef0U+YdN/w4t30H5Qm9uk/XIZsc/bpOsX2SVi25Ru097KUwgWHQMjTwgAU
 pB79ZnytvLRKHAq62qlube0QaxYTSjlWY9mt/azV7vgouw8dkpUs618tUxeq9nveSxLPK8CMMGb
 vCI/QQz6YoCDcgo13QhxWfoZQLrlS+harz73a9MUfcnzmjyRwxaXOEY1T4Pmv3P3dA72gV4wnwF
 7VGg06nF9ptH/XwzFWVOrOV3YLvchE=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_054020_623557_04DFCD52 
X-CRM114-Status: GOOD (  11.18  )
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

This change will introduce a runtime break to reset driver, and will be
fixed in follow-up commit:
("reset: spacemit: fix auxiliary device id")

Reviewed-by: Alex Elder <elder@riscstar.com>
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
