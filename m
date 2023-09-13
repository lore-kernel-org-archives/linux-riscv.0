Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F15EDEC53
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 13:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dh81vQ7gqdGaQMDDJmrfngGzkCfRDkcuDeB70GO9vq0=; b=OxvekQXT0liYZz
	HNV4VPD0kO6bLWa6Yu9/J+I5wnIOQSBGi1q7tePrqEtxzCuh4NyNfwBpJV1FtX4pdzPIUnVfw1l4K
	tht7Lkoaza3sG1PjZf6Fpzkdq97OzxnP8BmuivYDTFdsDljA3ZTBhdZYdHfdKcTTozkeqEWIsLoi1
	u+Wd/ggXMS//GsWWlB+Ag5n8djOHcid1FPgDYCI6THKpRdkqauSb+CJ0XMlXRIwe9VJO6jhqwBV4A
	u7hSlEcg+lFJ0zSq1oKVpemNSM0v2swTf8f9LeH3aZt6G4y3v1pozqI1V5xzCG0L7weu4EuxsINsQ
	0aXORrsqcV9QWzkxz2cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgQLt-0064I3-0Y;
	Wed, 13 Sep 2023 13:56:21 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgQLq-0064Gq-2w
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 13:56:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 330F1CE2258;
	Wed, 13 Sep 2023 13:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6448AC433C7;
	Wed, 13 Sep 2023 13:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694613372;
	bh=o4jDMBY/hW8fInCN3I+ux6T0Enwz8Oe9i7WgkTQcpOk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ndsj7tPzacC0Ar6PaF4k28acwyFWjDnI3ko/E/fWbfx+h/QwAibD4UXiPEw8iIdXr
	 UOU99wLcXgEVHrIl7zeQZ1V6Dw6b7cHYTCjHVfKcenmM3gKYG04SdvAMCHLZEIkeRh
	 psdDvTStuQ6+kcLwTJynXcufmncpXS2OMHnKrgfxEvb3H9Yz2VeWktdkhPBZYtH/sS
	 sNkg2YnQJq9058UVtH8QYZixcyZCQMh87lOWsWuirZAK651bzKnLBv6Tz+2HkamIvV
	 +hf++tbbi4n1BMBaYK49sxuunA4xs2PzBiA223s5SxTfdwQOCJcJhOBM0kNJEwpvb0
	 VbEZiLtrGzjtA==
From: Conor Dooley <conor@kernel.org>
To: ulf.hansson@linaro.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	arnd@arndb.de,
	changhuang.liang@starfivetech.com,
	jiajie.ho@starfivetech.com,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	robh@kernel.org,
	walker.chen@starfivetech.com
Subject: [GIT PULL 2/5] dt-bindings: power: Add power-domain header for JH7110
Date: Wed, 13 Sep 2023 14:54:25 +0100
Message-Id: <20230913-grumbly-rewrite-34c85539f2ed@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230913-bloomers-scorebook-fb45e0a2aa19@spud>
References: <20230913-bloomers-scorebook-fb45e0a2aa19@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1054; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=UZA+qdMFmjRCS72vsUWIOMkmR/rc8R2MaitOCzwhKaI=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKmM+wUSfWNlL7slf9jvGTC5ReKH7Ykfn17OkbFfen3PM s7UNSkLO0pZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjAR8z+MDL+FEm5m6c4qOFrM vWLbux72+t9/3fYJdR3Zt43r184yLUeG/1FKikGq//azc1h/mz7v1e9+3QaBKmHfJv3yc7eW2B8 5ywkA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_065619_183049_EAB6CAA1 
X-CRM114-Status: GOOD (  10.17  )
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

From: Changhuang Liang <changhuang.liang@starfivetech.com>

Add power-domain header for JH7110 SoC, it can use to operate dphy
power.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 include/dt-bindings/power/starfive,jh7110-pmu.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/power/starfive,jh7110-pmu.h b/include/dt-bindings/power/starfive,jh7110-pmu.h
index 132bfe401fc8..341e2a0676ba 100644
--- a/include/dt-bindings/power/starfive,jh7110-pmu.h
+++ b/include/dt-bindings/power/starfive,jh7110-pmu.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
 /*
- * Copyright (C) 2022 StarFive Technology Co., Ltd.
+ * Copyright (C) 2022-2023 StarFive Technology Co., Ltd.
  * Author: Walker Chen <walker.chen@starfivetech.com>
  */
 #ifndef __DT_BINDINGS_POWER_JH7110_POWER_H__
@@ -14,4 +14,7 @@
 #define JH7110_PD_ISP		5
 #define JH7110_PD_VENC		6
 
+#define JH7110_PD_DPHY_TX	0
+#define JH7110_PD_DPHY_RX	1
+
 #endif
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
