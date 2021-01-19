Return-Path: <SRS0=fDxE=GW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D785CC433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jan 2021 08:10:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3338020878
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jan 2021 08:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3338020878
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=49N2zrNSEU8KebhGYE8GU8lIHu+PMn+AixG6Yjph9iM=; b=jMDrvsslI2uxvydLkdFQPjG21l
	d9HRFkC+E5nWIKXaCSnW1nh+8bsmRdeyg5hQDWVQ14ZWpKIXWvPTp0L0jF6X4iXwSf8/rrkq5woSH
	/vQKSJokVhC6ID4PkDVS4pAp+geKerdsWzjPPZEhQ8XAfu3FwvFzFYMOoUBdGpQcZQ+ZpmTTHgYGF
	VPPxOOQ8KAajOdN6I1zrZA3A+hRZT6PDS0XjWfyRRNMN6nVrWI7AJcd4AaymxK3aNaAxI4mcdAogK
	THF42W3TeG0Y7yxZtsBRZhRCuXqmEFGiAtEeUxr2LHbERWS60jVl18z/Awh5y0I3ujbkkzgKrZMZq
	+o5vV/2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1m5J-0000Rs-NK; Tue, 19 Jan 2021 08:09:53 +0000
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1m5H-0000RG-Dp
 for linux-riscv@lists.infradead.org; Tue, 19 Jan 2021 08:09:52 +0000
Received: from ramsan.of.borg ([84.195.186.194])
 by xavier.telenet-ops.be with bizsmtp
 id JY9g2400H4C55Sk01Y9gdg; Tue, 19 Jan 2021 09:09:43 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1l1m56-004oHH-3o; Tue, 19 Jan 2021 09:09:40 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1l1m55-007gn0-Dl; Tue, 19 Jan 2021 09:09:39 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Stafford Horne <shorne@gmail.com>, Karol Gugala <kgugala@antmicro.com>,
 Mateusz Holenko <mholenko@antmicro.com>
Subject: [PATCH v4] drivers/soc/litex: Add restart handler
Date: Tue, 19 Jan 2021 09:09:38 +0100
Message-Id: <20210119080938.1832733-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_030951_586863_3BD6FC30 
X-CRM114-Status: GOOD (  15.94  )
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
Cc: Gabriel Somlo <gsomlo@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Let the LiteX SoC Controller register a restart handler, which resets
the LiteX SoC by writing 1 to CSR_CTRL_RESET_ADDR.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v4:
  - Drop bogus "a" from description,
  - Get rid of static litex_soc_ctrl_device and litex_reset_nb
    instances,
  - Unregister handler on driver unbind,

v3:
  - Rebase on top of openrisc/for-next,

v2:
  - Rebase on top of v5.11-rc1,
  - Change reset handler priority to recommended default value of 128
    (was 192).

(v1 was not sent to a mailing list)
---
 drivers/soc/litex/litex_soc_ctrl.c | 42 +++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/litex/litex_soc_ctrl.c b/drivers/soc/litex/litex_soc_ctrl.c
index da17ba56b7956c84..a7dd5be9fd5bd8ad 100644
--- a/drivers/soc/litex/litex_soc_ctrl.c
+++ b/drivers/soc/litex/litex_soc_ctrl.c
@@ -15,6 +15,11 @@
 #include <linux/module.h>
 #include <linux/errno.h>
 #include <linux/io.h>
+#include <linux/reboot.h>
+
+/* reset register located at the base address */
+#define RESET_REG_OFF           0x00
+#define RESET_REG_VALUE         0x00000001
 
 #define SCRATCH_REG_OFF         0x04
 #define SCRATCH_REG_VALUE       0x12345678
@@ -66,8 +71,19 @@ static int litex_check_csr_access(void __iomem *reg_addr)
 
 struct litex_soc_ctrl_device {
 	void __iomem *base;
+	struct notifier_block reset_nb;
 };
 
+static int litex_reset_handler(struct notifier_block *this, unsigned long mode,
+			       void *cmd)
+{
+	struct litex_soc_ctrl_device *soc_ctrl_dev =
+		container_of(this, struct litex_soc_ctrl_device, reset_nb);
+
+	litex_write32(soc_ctrl_dev->base + RESET_REG_OFF, RESET_REG_VALUE);
+	return NOTIFY_DONE;
+}
+
 static const struct of_device_id litex_soc_ctrl_of_match[] = {
 	{.compatible = "litex,soc-controller"},
 	{},
@@ -78,6 +94,7 @@ MODULE_DEVICE_TABLE(of, litex_soc_ctrl_of_match);
 static int litex_soc_ctrl_probe(struct platform_device *pdev)
 {
 	struct litex_soc_ctrl_device *soc_ctrl_dev;
+	int error;
 
 	soc_ctrl_dev = devm_kzalloc(&pdev->dev, sizeof(*soc_ctrl_dev), GFP_KERNEL);
 	if (!soc_ctrl_dev)
@@ -87,7 +104,29 @@ static int litex_soc_ctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(soc_ctrl_dev->base))
 		return PTR_ERR(soc_ctrl_dev->base);
 
-	return litex_check_csr_access(soc_ctrl_dev->base);
+	error = litex_check_csr_access(soc_ctrl_dev->base);
+	if (error)
+		return error;
+
+	platform_set_drvdata(pdev, soc_ctrl_dev);
+
+	soc_ctrl_dev->reset_nb.notifier_call = litex_reset_handler;
+	soc_ctrl_dev->reset_nb.priority = 128;
+	error = register_restart_handler(&soc_ctrl_dev->reset_nb);
+	if (error) {
+		dev_warn(&pdev->dev, "cannot register restart handler: %d\n",
+			 error);
+	}
+
+	return 0;
+}
+
+static int litex_soc_ctrl_remove(struct platform_device *pdev)
+{
+	struct litex_soc_ctrl_device *soc_ctrl_dev = platform_get_drvdata(pdev);
+
+	unregister_restart_handler(&soc_ctrl_dev->reset_nb);
+	return 0;
 }
 
 static struct platform_driver litex_soc_ctrl_driver = {
@@ -96,6 +135,7 @@ static struct platform_driver litex_soc_ctrl_driver = {
 		.of_match_table = of_match_ptr(litex_soc_ctrl_of_match)
 	},
 	.probe = litex_soc_ctrl_probe,
+	.remove = litex_soc_ctrl_remove,
 };
 
 module_platform_driver(litex_soc_ctrl_driver);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
