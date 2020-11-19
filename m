Return-Path: <SRS0=5I1x=EZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC282C56201
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2020 17:04:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43CAE21D7F
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2020 17:04:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GtWXSS5c";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="YWATW9BI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43CAE21D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/IqXeCb0mc+sMHxCPaoxBgpljc6PJ8iwA+8eVhq0/n8=; b=GtWXSS5ct6L0j8U4X1qEtSrg6F
	abK66wfEWrHtUc6+nQSIwke7ZwG3QbzJ+e4JAyf1vNvN/4as0L/Vw9VUqfNBCk9P+CeSpnMVgGwEV
	ND8rsaKN7HwM9ppBsiNNC7HdZWspKyYgu79G4PDw5Udqdu9BCD1U6iHcaVJz/kfeAWNbVL4pD3DxI
	GOrk3rJJ3B0Nf95ItCoYZajVtD2KOEKNl4hS9PqUekOShXzmZZycnepRbktuNLFofxDPhdQfDUG5V
	UJ9qE5vWJj720Y8Xww1wTdF/FhgxtVxREYUDT2FpVb/OxngJ16xiyH07r3jI0YN6O6bmAclQogen+
	hE9uc/Yg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfnMG-0008LF-9d; Thu, 19 Nov 2020 17:04:32 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfnME-0008Hk-I3
 for linux-riscv@lists.infradead.org; Thu, 19 Nov 2020 17:04:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1605805470; x=1637341470;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=vXFruGr2aeW8WhqpRz+OKo5sifRSrF1d5mIcR47IXVQ=;
 b=YWATW9BImYcp+l3d0WNbPQHkJwbVtRHXnGG3Y6z/xs9D0e2YmK5Xeu1A
 TzWynyjRmLsG8WIjyPsbO8jOXn/sDiDy4EoeSmLESGyMfNoVachSkW1ne
 rsq0XXtt7GtDteI2KFIP9lKO8Q3Y9qsQazpsGvn5apcNFZbdD96VuHTkB
 awTpvFzvceObM/Ms0KbzqR6XJoRuTfu1WPWEorpcw5JU2+9lFwe5f6ZWG
 KKf3Eli54hzrxssyumhXJ8hnpZld2XdXTAR/0aqmLwB9I7KBbQv0DMSR9
 0aHbzopshQYqeGpHqYR4OJ6gCVQlqTUPEbhgxgvE9ZCtfO1nnMPxOxjbD A==;
IronPort-SDR: AMkXjyz8d2ibjOIG7F0VpnoFYjx7m6rlDs5Aedbb/9BNxudKVzzyUKWIqWauJfPA9uj93ehevU
 hQtHjKjV4042RD77ybrBjG/sA/6ajIANgaO3vP2QpgC5dsMkceNj36h1+c+ZiU8PGRtNbArAkE
 X/2xaoMT3AHBKyqDsG1CBHFvT8HVCSNMtpiSwkvKZ/cnonLr2c6x5vih/v8J/VhSBsuoIoMChl
 xdGtDh5E4Ey2ah9RKvySedc6WAE0ShZzBTU2ZK4dZXf3cX+UPP1yEwXUVV25YcsQiKYZTZCSV1
 Y7I=
X-IronPort-AV: E=Sophos;i="5.78,353,1599548400"; d="scan'208";a="34319665"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Nov 2020 10:04:28 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 19 Nov 2020 10:04:28 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Thu, 19 Nov 2020 10:04:26 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <aou@eecs.berkeley.edu>, 
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH 2/6] soc: add polarfire soc header file
Date: Thu, 19 Nov 2020 17:04:25 +0000
Message-ID: <20201119170425.18365-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_120430_753568_F0561409 
X-CRM114-Status: GOOD (  11.40  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: cyril.jean@microchip.com, david.abdurachmanov@gmail.com,
 daire.mcnamara@microchip.com, anup.patel@wdc.com, atish.patra@wdc.com,
 Conor Dooley <conor.dooley@microchip.com>, lewis.hanly@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

Add header to support the Microchip PolarFire SoC MSS system
controller mailbox.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 include/soc/microchip/mpfs.h | 50 ++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 include/soc/microchip/mpfs.h

diff --git a/include/soc/microchip/mpfs.h b/include/soc/microchip/mpfs.h
new file mode 100644
index 000000000000..60311ab72b76
--- /dev/null
+++ b/include/soc/microchip/mpfs.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Microchip MPFS mailbox
+ *
+ * Copyright (c) 2020 Microchip Corporation. All rights reserved.
+ *
+ * Author: Conor Dooley <conor.dooley@microchip.com>
+ *
+ */
+
+#ifndef __SOC_MPFS_H__
+#define __SOC_MPFS_H__
+
+#include <linux/types.h>
+#include <linux/of_device.h>
+
+struct mpfs_sys_controller;
+
+struct mpfs_mss_msg {
+	u8 cmd_opcode;
+	u16 cmd_data_size;
+	u16 response_size;
+	u8 *cmd_data;
+	u16 mailbox_offset;
+	u16 response_offset;
+};
+
+#if IS_ENABLED(CONFIG_MPFS_SYS_CONTROLLER)
+
+int mpfs_blocking_transaction(struct mpfs_sys_controller *mpfs_client, void *msg,
+			      void *response, u16 response_size_bytes);
+
+struct mpfs_sys_controller *mpfs_sys_controller_get(struct device_node *mailbox_node);
+
+#else
+
+static int mpfs_blocking_transaction(struct mpfs_sys_controller *mpfs_client, void *msg,
+				     void *response, u16 response_size_bytes)
+{
+	return -ENOSYS;
+};
+
+struct mpfs_sys_controller *mpfs_sys_controller_get(struct device_node *mailbox_node)
+{
+	return NULL;
+}
+
+#endif /* IS_ENABLED(CONFIG_MPFS_SYS_CONTROLLER) */
+
+#endif /* __SOC_MPFS_H__ */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
