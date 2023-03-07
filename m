Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E961CC6FD1E
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 20:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VIlv/dLu2WbmwO+vD4XPMoF+wAb1FX/w+Jwgo6WmGLs=; b=nprT4q7ypyRoQs
	sn+J8Oj4PFOIoeiOTtjqCxZZskGhqKGm05lR37N8dEa+cz6qJZ/BpUwB/rqLJM2cMEBv2dHCpHJiT
	1YebQz8GnJ7xLFcOll6tm2gmHdKQGcU0xu9kJVHbBcKinN021hdV/Ou1q6TymeQYnEDTEwpHeNg+H
	CflyGI38gTz8Q8amwQ5E/y0TrwiocKHvXSolbl4OIHQ5rIRN/GRHXXGBlvAc7J5A2YNrJZArwm6IS
	uZD/kQdj+vg7jL0i6eTEnhp6hRRbbuzBKiVJ4ZpukT62K0yhEwxRgW0ApYowpchC7yZOgwQY0ssLz
	mNw+JQ93LFf+UMyl/V1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZdqV-002MRE-9i; Tue, 07 Mar 2023 20:23:39 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZdqT-002MPS-68
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 20:23:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D0040B819C2;
	Tue,  7 Mar 2023 20:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D51C4339C;
	Tue,  7 Mar 2023 20:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678220614;
	bh=9ftp4XSRep9CAFGl5I/cGlZ4Bn7VzUhE3/7xrZNvJco=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wd5oeeEbSyUVMox8/3SeOUbDKlFtbRdeXF9mclqCpw3C4RnGRUW3XkI4N2cQdqeMY
	 HNTa4jT6BBHAtJSRSvItJ1s8d7UqoDawunE6T9glEmXXSGzkD3HYZqbduxk3M/u37C
	 2wkPwVEXGAmIMWF2/c7wbstNCL+ZoMdneRmFxcUFV2oOleV3cYKJM6tfkCCgBu5JWN
	 e0vnSP1I6/mzgHXfIiZQNn3dsVPi8Lv0a81dfvHleVpEYgurCq8cKcYvpwd+9rIKll
	 vWnqJwVaVsdH0fZ1FmGTV1ZBEniEB2CSWgg+lu2fiwP1mgDh9XpsAi2M4v3knia7p5
	 u3gGVujZx1eRw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/8] soc: microchip: mpfs: use a consistent completion timeout
Date: Tue,  7 Mar 2023 20:22:56 +0000
Message-Id: <20230307202257.1762151-7-conor@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307202257.1762151-1-conor@kernel.org>
References: <20230307202257.1762151-1-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1695; i=conor.dooley@microchip.com; h=from:subject; bh=ZbvEWn53vw1ASCu/srw+heRkVpLXaO8RXoKnQ2EVF7c=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCnsc4W7eJJZMt9POxp7cEmjxazMm1nzXhSmnGC8ucvtv dYXc8OQjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzk71+Gv+JJD104p1R3PxHg KNmxu0fdrmunZcLsV8eU4y3+z6vyqmFkuDPx/z6e+7YL3Y/vtTPUlrh/at7B+hKBfsXvEhPkC5s +cQMA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_122337_398885_AAEAA8D7 
X-CRM114-Status: GOOD (  12.73  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Completion timeouts use jiffies, so passing a number directly will
produce inconsistent timeouts depending on config. Define the timeout in
ms and convert it to jiffies instead.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/soc/microchip/mpfs-sys-controller.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
index 12039cb38b33..738ecd624d64 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -11,12 +11,15 @@
 #include <linux/slab.h>
 #include <linux/kref.h>
 #include <linux/module.h>
+#include <linux/jiffies.h>
 #include <linux/interrupt.h>
 #include <linux/of_platform.h>
 #include <linux/mailbox_client.h>
 #include <linux/platform_device.h>
 #include <soc/microchip/mpfs.h>
 
+#define MPFS_SYS_CTRL_TIMEOUT_MS 100
+
 static DEFINE_MUTEX(transaction_lock);
 
 struct mpfs_sys_controller {
@@ -28,6 +31,7 @@ struct mpfs_sys_controller {
 
 int mpfs_blocking_transaction(struct mpfs_sys_controller *sys_controller, struct mpfs_mss_msg *msg)
 {
+	unsigned long timeout = msecs_to_jiffies(MPFS_SYS_CTRL_TIMEOUT_MS);
 	int ret, err;
 
 	err = mutex_lock_interruptible(&transaction_lock);
@@ -38,7 +42,7 @@ int mpfs_blocking_transaction(struct mpfs_sys_controller *sys_controller, struct
 
 	ret = mbox_send_message(sys_controller->chan, msg);
 	if (ret >= 0) {
-		if (wait_for_completion_timeout(&sys_controller->c, HZ)) {
+		if (wait_for_completion_timeout(&sys_controller->c, timeout)) {
 			ret = 0;
 		} else {
 			ret = -ETIMEDOUT;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
