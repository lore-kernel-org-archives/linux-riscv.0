Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA52FC5DF89
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 18:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xPK55rL7jqokrIzIrZ2kVMM+Y1XixijfDgipYMVL4oE=; b=Uik4hxJlNfekhm
	za9VlflI1sEjwUXtWZ9txL/FRBPuB3v+YeHpncloWAvJRztX7eentberTBhALchWZTG8diO4+b5TL
	BNmZgzFq02kVDa1BzwKZRumy5tQMzVZCBCxZ4UvuIHLOIEru91VkausEIkYyAtOt7hKCoNLbP6mJc
	3MqKcefVfbK/Udg8mZFPNOHF7qRZZZ5R7MDmr+u3HkQ1So/nLXjSd0qOuvZZ9hNGHM4X6VuzkEihz
	rwTdLRQ7MeRb8vCuxFZtIxO4Xvc/GbUjgGf6XHEzsNnTKl12Gd+Z2guSUUZOwnLGsuz5pTugMCBNb
	zslpdnejyVNUCbaygN6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwkpy-0000000AKwO-2B5J;
	Wed, 19 Aug 2026 18:16:30 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwkpw-0000000AKuF-0hWC
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 18:16:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=QKxY/gFZnQu4jxWnpEu3gzJTE7ZyPsLaoqObnd0OYGg=; b=Mzi3TkBeeBV8mL+FYrlmLuIT/U
	FZdRFy43Lt23SSkImSMa2y2bkcjKvPT3+yR7t+VjX+C4kzlPNY1ZcvcTmNs1cJZ60UNDoZGfc1KGx
	wkFHFbtsOLHgvp80D40Deet11YpPlm+5H0KuRAW49v1FDUdaRJMbuyYDWntZx91jRATLiHbXAdC8l
	lZzZgWaVfwvbuKk30WQha2Yn4+8LOLU2OYUW5HTAEneASF/hSGN79hN5es4+gYpX9/AhAXsK9rAkx
	EJ64/DHGVkb6+zUsR4q+oViVus0+CCUiTHV3HZfA0J/JSKx7Krd+Q7NN5V94pGh06RB4Hz89x3faQ
	P1xSt6LQ==;
Received: from 186-249-147-181.shared.desktop.com.br ([186.249.147.181] helo=[127.0.1.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wwkpk-006ENH-CO; Wed, 19 Aug 2026 20:16:16 +0200
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Wed, 19 Aug 2026 15:16:17 -0300
Subject: [PATCH RFC v3 04/13] sysctl: add register_sysctl() wrapper for
 MODULE_SYSCTL_TABLE
MIME-Version: 1.0
Message-Id: <20260819-sysctl-module-aliases-v3-4-aab90569365d@igalia.com>
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
X-CRM114-CacheID: sfid-20260819_111628_230118_3356DE1C 
X-CRM114-Status: GOOD (  12.23  )
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

Add a MODULE_SYSCTL_TABLE call into register_sysctl() for existing callers
to automatically use it.

Add optional 'template arguments' to support a dynamic table/path defined
at run-time based on a 'template' table/path available at build-time.

Split the update of callers with template arguments into another commit for
clarity, disabling them for now.

Note: there is no register_sysctl_sz() wrapper, as it is used in even more
dynamic cases (e.g., table generated at run-time not based on a template).

Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
 drivers/parport/procfs.c |  2 ++
 include/linux/sysctl.h   | 54 ++++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/parport/procfs.c b/drivers/parport/procfs.c
index 3880460e67f25a7d8708a734c6f4d9e6c363c726..cda3221e386ed7a4afc898b3d0313081dee5b49b 100644
--- a/drivers/parport/procfs.c
+++ b/drivers/parport/procfs.c
@@ -13,6 +13,8 @@
  * Cleaned up include files - Russell King <linux@arm.uk.linux.org>
  */
 
+#define SYSCTL_MODULE_ALIASES_DISABLE
+
 #include <linux/string.h>
 #include <linux/init.h>
 #include <linux/module.h>
diff --git a/include/linux/sysctl.h b/include/linux/sysctl.h
index 0adc056ff54d895500c376361fe966bfa5126a3e..b808fbc1d964f453db8e354825fd8800db1eecd3 100644
--- a/include/linux/sysctl.h
+++ b/include/linux/sysctl.h
@@ -335,8 +335,58 @@ struct ctl_table_root {
 #define MODULE_SYSCTL_TABLE(path, table)
 #endif
 
-#define register_sysctl(path, table)	\
-	register_sysctl_sz(path, table, ARRAY_SIZE(table))
+/*
+ * The register_sysctl() wrapper for the MODULE_SYSCTL_TABLE macro
+ * automatically creates symbols in sysctl table registration sites.
+ *
+ * Usage:
+ * - register_sysctl(path, table);
+ * - register_sysctl(path, table, table_tmpl);
+ * - register_sysctl(path, table, table_tmpl, path_tmpl);
+ *
+ * The optional 'template arguments' ('table_tmpl' and 'path_tmpl')
+ * can support callers with non-static variables: dynamic table/path
+ * defined at run-time based on a 'template' available at build-time.
+ *
+ * For example, a sysctl table, or table and path, which is/are:
+ *
+ * - per-namespace: different tables based on a template table
+ *   (i.e., same files in each namespace) with identical path
+ *   (i.e., same path in each namespace).
+ *
+ * - per-device: different tables based on a template table
+ *   (i.e., same files for each device) with different paths
+ *   (i.e., diff paths for each device) based on a template path.
+ *
+ * The wrapper passes the build-time parameters (templates) to the macro
+ * and the dynamic/run-time parameters (instances) to the wrapped function.
+ *
+ * The wrapper reduces to the wrapped function when either the macro or the
+ * config option is disabled.
+ */
+#define _register_sysctl(path, table, table_tmpl, path_tmpl)			\
+({										\
+	MODULE_SYSCTL_TABLE(path_tmpl, table_tmpl);				\
+	register_sysctl_sz(path, table, ARRAY_SIZE(table));			\
+})
+
+#define register_sysctl(path, table, tmpl_args...)				\
+	_register_sysctl(path, table,						\
+			 __sysctl_table_tmpl_or_default(table, ## tmpl_args),	\
+			 __sysctl_path_tmpl_or_default(path, ## tmpl_args))
+
+/* Helper macros for optional template arguments */
+#define __sysctl_table_tmpl(skip, table_tmpl, ...)				\
+	table_tmpl
+
+#define __sysctl_path_tmpl(skip, table_tmpl, path_tmpl, ...)			\
+	path_tmpl
+
+#define __sysctl_table_tmpl_or_default(default, tmpl_args...)			\
+	__sysctl_table_tmpl(, ## tmpl_args, default)
+
+#define __sysctl_path_tmpl_or_default(default, tmpl_args...)			\
+	__sysctl_path_tmpl(, ## tmpl_args, default, default)
 
 #ifdef CONFIG_SYSCTL
 

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
