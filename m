Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F53FC6171
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 07:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NeKnhwJTAwo+SoSOSg8T4qnlWGBeNX3PSCQZpjwdV60=; b=wGcs5pldMuh6Jl
	1TpBo+AsSaCHFG/uHbyL9iOnOC+3eladPf7h2hQxPAmUOyzvAzMBFH0nN18xbapf5TLJu1ToM1RFv
	srqPOjHXo7mNerHLcKwUFOzP3awH+Fw7tLt0dVeZhrrrK9Jq7oAAMq7XP+G/jHjyWoRYDkUpC7N22
	GQb302IiNhjsOoGsz0oD1+p6AOvqyUv6sDJa5AOoFmWvhiEA2pxQlp507S1FUYpOZSPlcQkX+e+8t
	FxpLueJvNhTH+zWZikNAZVkeyEwB72Obt2rAjhfgk0lUEw1ZrKNSgonet1uoTYo5E1Iy+KdSeERL5
	Ph5GioGLLTe/0auvB/OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbw2K-000000093TX-1EpI;
	Sat, 03 Jan 2026 07:26:56 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbw2I-000000093Ss-2Dk9
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 07:26:55 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 30C403417FE;
	Sat, 03 Jan 2026 07:26:46 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sat, 03 Jan 2026 15:26:12 +0800
Subject: [PATCH v3 1/4] clk: spacemit: prepare common ccu header
MIME-Version: 1.0
Message-Id: <20260103-06-k1-clk-common-v3-1-6061d9f69eef@gentoo.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1893; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=xNlizd+/tLBFwWM/QUTD8wjj7jKVFFciZx8duLxiagc=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpWMSjMsasj4EDOZgwIbQGVcwaiPbE8iIjU7r6p
 4583BmjhTWJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaVjEoxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1DYg//UHandxt5TxGFWljk13yi5AVTCy4MAGyNLCxiIvQq/FqbkuYctKb7g
 hUU+Gq4QdNxFIdFnkEpBG/g1Vy5DRgYU/XPTjWfSeJB+6coa4Hj6PQT1DFMMs7KswIBggnK4k1s
 99tJKNhBOWEM4FVZnO8t/OYrwqA29GGWbTljD0xU453xqoSIE0rKrbtv50mhBaFT0xz0y4Nnz2R
 xUxZqufnHBF+3N8cF2Psd4KVpayaIszFF+86uRqkJJLpK45PHvjYvEMqr2t/bv8oaUIKYtDKFjQ
 glhlBdCRIrRM1uLUD9FadIl2YxmL8qzSQA4Bid8+Y2KRH9R+rzB1kEiRzm9esfWBKj99SgJ2mQC
 cQi05e0xwe5S9DUQO6YJnpOeMyBCdefDB5KeP9+k1luS2aPHL0v0N8nGBL0VnbZCK6ar+q8VUSQ
 OkWUqq72L+IjqosVNKS3kq3YR5j7j+WaQ0wCTtPRslCyAZrhk0NOHmFwaYUsQ5JYUTGvzcjRPL9
 jlCTzRG0XVqcYdTYnsy6FWMzunpjHR6VUh8M2WRv6qpOvJ2OacP5tQ7Wyp5xpvelo+Yyjq+F8cU
 /M3Cf4J6e5asxAQEqL7R1nvIehxzx5/Sn6t5V2ggkQxB0RXzqawn2AHlrhf0v8HsB2jSYErFQYa
 egbqdz/okiAnmyZsuCiBhPHvgy9wC0=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_232654_640406_BDAE9471 
X-CRM114-Status: GOOD (  11.46  )
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

In order to prepare adding clock driver for new K3 SoC, extract generic
code to a separate common ccu header file, so they are not defined
in K1 SoC-specific file, and then can be shared by all clock drivers.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 include/soc/spacemit/ccu.h       | 21 +++++++++++++++++++++
 include/soc/spacemit/k1-syscon.h | 12 +-----------
 2 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/include/soc/spacemit/ccu.h b/include/soc/spacemit/ccu.h
new file mode 100644
index 000000000000..84dcdecccc05
--- /dev/null
+++ b/include/soc/spacemit/ccu.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __SOC_SPACEMIT_CCU_H__
+#define __SOC_SPACEMIT_CCU_H__
+
+#include <linux/auxiliary_bus.h>
+#include <linux/regmap.h>
+
+/* Auxiliary device used to represent a CCU reset controller */
+struct spacemit_ccu_adev {
+	struct auxiliary_device adev;
+	struct regmap *regmap;
+};
+
+static inline struct spacemit_ccu_adev *
+to_spacemit_ccu_adev(struct auxiliary_device *adev)
+{
+	return container_of(adev, struct spacemit_ccu_adev, adev);
+}
+
+#endif /* __SOC_SPACEMIT_CCU_H__ */
diff --git a/include/soc/spacemit/k1-syscon.h b/include/soc/spacemit/k1-syscon.h
index 354751562c55..0be7a2e8d445 100644
--- a/include/soc/spacemit/k1-syscon.h
+++ b/include/soc/spacemit/k1-syscon.h
@@ -5,17 +5,7 @@
 #ifndef __SOC_K1_SYSCON_H__
 #define __SOC_K1_SYSCON_H__
 
-/* Auxiliary device used to represent a CCU reset controller */
-struct spacemit_ccu_adev {
-	struct auxiliary_device adev;
-	struct regmap *regmap;
-};
-
-static inline struct spacemit_ccu_adev *
-to_spacemit_ccu_adev(struct auxiliary_device *adev)
-{
-	return container_of(adev, struct spacemit_ccu_adev, adev);
-}
+#include "ccu.h"
 
 /* APBS register offset */
 #define APBS_PLL1_SWCR1			0x100

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
