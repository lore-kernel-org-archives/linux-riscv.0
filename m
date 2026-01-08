Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C469D185F1
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 13:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SEezCpfR5jg8uF2sy80oyEaXX2qKhAReyhoO8m42o24=; b=yGE37e/t5t1rvS
	FDXD8is+rSwENmc2XxqnhNRRIW6P0KAr5PkLomxWt/0kTfBJjRGvla9vaGcYsDVNwOEccHP3PQlDn
	+gkmjGjYhU5UkXxGj7QvfYyPLrX2VWYV9oHsuRHc4zsi+wUQrDq7ND/g/w1dD1NdOycKnBYewFBU+
	IEAc6QI1UCBiDZ7N3dZoG6OxWf8ax9m55wC7hVGJ4t7BUCInLLo98bTVi0AkHn6BWvdsFmAIAKoL+
	nK8dTEWvMSE3g8sSR+tLawqmqew5BcIExnM/+3wLuUdXG2X3tSHGl5seMpjVcnOIYRQVAblk+2j68
	MHQVqfCN/3+d4um1TatQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqFK-0000000HCJl-0hlS;
	Thu, 08 Jan 2026 13:40:14 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqFI-0000000HCIf-0qBo
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 13:40:13 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id CC957341EC9;
	Thu, 08 Jan 2026 13:40:07 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 08 Jan 2026 21:39:22 +0800
Subject: [PATCH v4 1/4] clk: spacemit: prepare common ccu header
MIME-Version: 1.0
Message-Id: <20260108-06-k1-clk-common-v4-1-badf635993d3@gentoo.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1939; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=tv1qlFdPK5F6moCm/WsIv0oyoATpIX70yIzsxIpfdUI=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpX7Olu48TlQH6Ff2nvZMLeW+S96JcApoUmfooB
 SFNQY9tLH+JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaV+zpRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3pdA//cBNMDQAZ53GPl/gyBl9Ce34Khu48jtPLr5mQjnK8t2rjVoWerP7oh
 Jg2GHSUk9sLWBwQi2Co2++YZpJ4ZMlUUhFbzfN496Jn0Gh9wid/ArjsSOZ4zTEe5aGtv52Nr7fr
 JZRvVAahQ9IMTDGPYCfahm52fKiLPck8nNO9FPCr5cMjM7uxZZ88CgwU+AO5M9CfKVSEya5zzJs
 eEwGIUDtUJW3HR4fXo5MNUkgHExT/JLJ4IN9UkCWmUKH8ecCfb/SsFE23A82Y1JJfqVjPa64GKj
 qrMMlmbeN1eulnXQtLSrPSO1shIdtbf4/drqEkg6xJo5LeI+8nh4ZXM/ScBx+uz2LbRyBdEF75J
 2p9zfVDPOOWfyb6HRnPE9zS4wX92BxlUyq0FEA4KVMw+aPF5G5xEuVgCN6YGPVz4BjPSGVHKSVg
 FimbMrgXSOmPe4V7IbGpeLhMCrWk3bLpNP49nz462uHXI98N2G2Bk3husK8SeCHpT2RbGIW6Bnw
 WQn0qFaiTCalX+v+uVf27DxIe4Nq8PWjSth9sg/eEUfsg3WvOl56HYIhWHV6f4mZonvyztqBqRm
 dABd0HPIz43hUuZk/lqBU3TwYHbSXiZjMA+dFXvE+2dnq1KpPO2suw++FgG/Wv/eQuYQzmfEBs5
 9V6j41rFqEw7kj7qZ0uoNjOy08NmhA=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_054012_279524_893C4257 
X-CRM114-Status: GOOD (  11.66  )
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

Reviewed-by: Alex Elder <elder@riscstar.com>
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
