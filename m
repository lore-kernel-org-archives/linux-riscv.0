Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069B0C5DF8A
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 18:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X48wzqmll1Mxg3ksEj0CfFSXeKgkT5HKWr3/CtW4kOI=; b=DGcCQjhphQZ97/
	46772C8wmzUYl22pRLF01TS/nsYiMMTWC3ifC1crvbUglsRBY3terMHX0N732zeSfms+CaBjRbOHa
	EVXyJJ4QpOFfyGFOPE3aTSkraeh2pyp3HaYZPF9EIpcfUFCYYvM3PJvZHIsNRYFVCrTAxfP79sgPS
	+M8vGHHK7fPrGEzvy4yjF+XxCQj+okWCuUgjp/tYzR/1IF9xhteiNubhRhes+I9A77XgGfzTJH2SD
	U5Z83ZuhS5wpOtfJdSCim/1d9TIwnAbI1uqwoQz8TkMd7/ldphHsG6J3mkDW8qocTTkYuFw9sqLHO
	P6kpHNZJ5unV2TA07udA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwkq5-0000000AL02-2do0;
	Wed, 19 Aug 2026 18:16:37 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwkq2-0000000AKxp-3neb
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 18:16:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=joqvbHqdM9HpjwaYMD+5G7FBevrqRTEc0btSZWyP7jQ=; b=FDOOVmnEQUiY/vACI1d5qtUYpE
	L4yHNPeTmCytvNHHbIcvv+Yp03iI8RpOe8mEW9LqX+tIRa774tmLLgCG2KSW9q/oA1jK3fI1ow9yA
	U94MJCsZyG3xSiOtUAN/8KikJ/hoZOXhWq9ZfxUxwpT+MehaeOdKScINDMNzW3P4WRG0+lftHhyB7
	4xmfXmBa5oaF5ALkEHCVD6olVN7IcueXx/aypnA2nkREVfJpE2Y2n0BQI+Cs2pTMJW2Gmk70OucwW
	tHlQeqjYCanmvCTkPwDkPSiX4RUn/OA/a+RCffMtM4gvXx5i39FYab6cZKyM4lCfjxwMi1PH2Pfcj
	h4ihah+Q==;
Received: from 186-249-147-181.shared.desktop.com.br ([186.249.147.181] helo=[127.0.1.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wwkpr-006ENH-JA; Wed, 19 Aug 2026 20:16:23 +0200
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Wed, 19 Aug 2026 15:16:18 -0300
Subject: [PATCH RFC v3 05/13] sysctl, parport: update register_sysctl()
 callers with template arguments
MIME-Version: 1.0
Message-Id: <20260819-sysctl-module-aliases-v3-5-aab90569365d@igalia.com>
References: <20260819-sysctl-module-aliases-v3-0-aab90569365d@igalia.com>
In-Reply-To: <20260819-sysctl-module-aliases-v3-0-aab90569365d@igalia.com>
To: Kees Cook <kees@kernel.org>, Joel Granados <joel.granados@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: kernel-dev@igalia.com, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, fsverity@lists.linux.dev, 
 keyrings@vger.kernel.org, bpf@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 netdev@vger.kernel.org, linux-wpan@vger.kernel.org, 
 lvs-devel@vger.kernel.org, netfilter-devel@vger.kernel.org, 
 coreteam@netfilter.org, linux-sctp@vger.kernel.org, 
 linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org, 
 bridge@lists.linux.dev, mptcp@lists.linux.dev, rds-devel@oss.oracle.com, 
 virtualization@lists.linux.dev, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_111634_946890_6174BF84 
X-CRM114-Status: UNSURE (   8.66  )
X-CRM114-Notice: Please train this message.
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

Update callers with dynamic table/path to use template arguments.

Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
 drivers/parport/procfs.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/parport/procfs.c b/drivers/parport/procfs.c
index cda3221e386ed7a4afc898b3d0313081dee5b49b..7c048e9a973aa96251930e21581aed045c41cc35 100644
--- a/drivers/parport/procfs.c
+++ b/drivers/parport/procfs.c
@@ -13,7 +13,7 @@
  * Cleaned up include files - Russell King <linux@arm.uk.linux.org>
  */
 
-#define SYSCTL_MODULE_ALIASES_DISABLE
+#define SYSCTL_MODULE_ALIASES_UNIQUE_ID
 
 #include <linux/string.h>
 #include <linux/init.h>
@@ -434,13 +434,17 @@ int parport_proc_register(struct parport *port)
 #endif /* IEEE 1284 support */
 	}
 
-	tmp_dir_path = kasprintf(GFP_KERNEL, "dev/parport/%s/devices", port->name);
+#define tmp_dir_tmpl "dev/parport/%s/devices"
+	tmp_dir_path = kasprintf(GFP_KERNEL, tmp_dir_tmpl, port->name);
 	if (!tmp_dir_path) {
 		err = -ENOMEM;
 		goto exit_free_t;
 	}
 
-	t->devices_header = register_sysctl(tmp_dir_path, t->device_dir);
+	t->devices_header = register_sysctl(tmp_dir_path, t->device_dir,
+					    parport_sysctl_template.device_dir,
+					    tmp_dir_tmpl);
+#undef tmp_dir_tmpl
 	if (t->devices_header == NULL) {
 		err = -ENOENT;
 		goto  exit_free_tmp_dir_path;
@@ -448,13 +452,17 @@ int parport_proc_register(struct parport *port)
 
 	kfree(tmp_dir_path);
 
-	tmp_dir_path = kasprintf(GFP_KERNEL, "dev/parport/%s", port->name);
+#define tmp_dir_tmpl "dev/parport/%s"
+	tmp_dir_path = kasprintf(GFP_KERNEL, tmp_dir_tmpl,  port->name);
 	if (!tmp_dir_path) {
 		err = -ENOMEM;
 		goto unregister_devices_h;
 	}
 
-	t->port_header = register_sysctl(tmp_dir_path, t->vars);
+	t->port_header = register_sysctl(tmp_dir_path, t->vars,
+					 parport_sysctl_template.vars,
+					 tmp_dir_tmpl);
+#undef tmp_dir_tmpl
 	if (t->port_header == NULL) {
 		err = -ENOENT;
 		goto unregister_devices_h;
@@ -500,7 +508,8 @@ int parport_device_proc_register(struct pardevice *device)
 		return -ENOMEM;
 
 	/* Allocate a buffer for two paths: dev/parport/PORT/devices/DEVICE. */
-	tmp_dir_path = kasprintf(GFP_KERNEL, "dev/parport/%s/devices/%s", port->name, device->name);
+#define tmp_dir_tmpl "dev/parport/%s/devices/%s"
+	tmp_dir_path = kasprintf(GFP_KERNEL, tmp_dir_tmpl, port->name, device->name);
 	if (!tmp_dir_path) {
 		err = -ENOMEM;
 		goto exit_free_t;
@@ -508,7 +517,10 @@ int parport_device_proc_register(struct pardevice *device)
 
 	t->vars[0].data = &device->timeslice;
 
-	t->sysctl_header = register_sysctl(tmp_dir_path, t->vars);
+	t->sysctl_header = register_sysctl(tmp_dir_path, t->vars,
+					   parport_device_sysctl_template.vars,
+					   tmp_dir_tmpl);
+#undef tmp_dir_tmpl
 	if (t->sysctl_header == NULL) {
 		kfree(t);
 		t = NULL;

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
