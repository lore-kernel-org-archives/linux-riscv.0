Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E8DC5DF81
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 18:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YRPTQASitU1F4DMpNxUrvkkgLha6zGxW6WwPT0J2n9k=; b=TxFCTai69ZtUcx
	wD3Av/2XYAZ5NxCDyx9KCOBE64yfy3UYtP3hyQ4TfJ28ITNXsq1Vv3B2Kkr8iuLLElAQ/lDGHiCFN
	lyIoRXweN3Ha8KrRvdwurymsh+4pB3PACY2FHbAndaRVtNrMfdcY/GnUM20jDlJscBh7wbZEZ3rxY
	+SFbRTH4ARUzrcYN5DjTv2/kzXNfoD1/smDVbQJW3tBCAn0DEkDGaar8+EHDSWmJTgnXw+yTMWsfd
	+c0NZQvSM63B5b/WuRs4WTOIcTFW3xnxiG50CLqhkaSeEIkFIZb/mnXUu9/hQYRp7Hhu3o1OPNF5n
	iFVC+pc0emFBLINgA1Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwkqB-0000000AL3r-3EhL;
	Wed, 19 Aug 2026 18:16:43 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwkq9-0000000AL1b-3AMj
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 18:16:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=XU8q8BLh95waaYKBoAp1NCJxsyOka/nIGvWcgZihLBw=; b=MyutY6rGyDy4+3kvV6rPdLKv9M
	D0/9MW1r/dP6TUCnj9F40ajpfDYKq2YViQWLUCY6QbB3tb29teaDGzTTRbgkE4/65ViBK40pu7UvG
	37x3TLBBVDAz/fgir0WDKIXcJcESDBPL2FtagvSpA376Ek+1jVeQLJsEIx4qyrwjsE2OJs6lyEfTy
	Hwb/OFc/djVkQF5ODKaZ+wAVbsGd7dP+9jCEO56JqfGBpHxy1ZCGUxO3m/qzvMEBNBCE4iIGhk0K8
	ebljwMilvJ6AUc9wrVPDXww7BY1TjHspnjXPomaZPTM9f6QvdJtqhcj1n5FLw0r1Csm7j+KAcUxnU
	vM02QDZg==;
Received: from 186-249-147-181.shared.desktop.com.br ([186.249.147.181] helo=[127.0.1.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wwkpy-006ENH-Pi; Wed, 19 Aug 2026 20:16:31 +0200
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Wed, 19 Aug 2026 15:16:19 -0300
Subject: [PATCH RFC v3 06/13] sysctl, net: add register_net_sysctl{_sz}()
 wrappers for MODULE_SYSCTL_TABLE
MIME-Version: 1.0
Message-Id: <20260819-sysctl-module-aliases-v3-6-aab90569365d@igalia.com>
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
X-CRM114-CacheID: sfid-20260819_111641_804944_64499086 
X-CRM114-Status: GOOD (  12.71  )
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

Add a MODULE_SYSCTL_TABLE call into register_net_sysctl{_sz}() for existing
callers to automatically use it.

Add optional 'template arguments' to support a dynamic table/path defined
at run-time based on a 'template' available at build-time.

Split the update of callers with template arguments into separate commits,
disabling the macro for now.

Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
 include/linux/sysctl.h      |  3 +++
 include/net/net_namespace.h | 47 +++++++++++++++++++++++++++++++++++++++------
 net/sysctl_net.c            | 10 +++++-----
 3 files changed, 49 insertions(+), 11 deletions(-)

diff --git a/include/linux/sysctl.h b/include/linux/sysctl.h
index b808fbc1d964f453db8e354825fd8800db1eecd3..7241dbf7eb81ce9f906e33645d03944671c5e6f1 100644
--- a/include/linux/sysctl.h
+++ b/include/linux/sysctl.h
@@ -309,6 +309,9 @@ struct ctl_table_root {
  *
  * Define the macro SYSCTL_MODULE_ALIASES_DISABLE to disable this.
  */
+
+#define SYSCTL_MODULE_ALIASES_DISABLE
+
 #if defined(CONFIG_SYSCTL_MODULE_ALIASES) && defined(MODULE) &&			\
     !defined(SYSCTL_MODULE_ALIASES_DISABLE)
 
diff --git a/include/net/net_namespace.h b/include/net/net_namespace.h
index e5ee673b9fcf846aefcc309d4cca1a8fc870aae2..c38ea2de35fe85c7ab8f1153a5c5681880b84840 100644
--- a/include/net/net_namespace.h
+++ b/include/net/net_namespace.h
@@ -520,17 +520,52 @@ void unregister_pernet_device(struct pernet_operations *);
 
 struct ctl_table;
 
-#define register_net_sysctl(net, path, table)	\
-	register_net_sysctl_sz(net, path, table, ARRAY_SIZE(table))
+/*
+ * The register_net_sysctl{_sz}() wrappers for MODULE_SYSCTL_TABLE
+ * automatically create symbols in sysctl registration sites.
+ *
+ * See register_sysctl() and MODULE_SYSCTL_TABLE() in <linux/sysctl.h>
+ * for information about template arguments and options for the macro.
+ *
+ * Usage:
+ * - register_net_sysctl(net, path, table);
+ * - register_net_sysctl(net, path, table, table_tmpl);
+ * - register_net_sysctl(net, path, table, table_tmpl, path_tmpl);
+ * - register_net_sysctl_sz(net, path, table, size);
+ * - register_net_sysctl_sz(net, path, table, size, table_tmpl);
+ * - register_net_sysctl_sz(net, path, table, size, table_tmpl, path_tmpl);
+ */
+#define _register_net_sysctl_sz(net, path, table, size, table_tmpl, path_tmpl)	\
+({										\
+	MODULE_SYSCTL_TABLE(path_tmpl, table_tmpl);				\
+	__register_net_sysctl_sz(net, path, table, size);			\
+})
+
+#define register_net_sysctl_sz(net, path, table, size, tmpl_args...)		\
+	_register_net_sysctl_sz(net, path, table, size,				\
+				__sysctl_table_tmpl_or_default(table,		\
+							       ## tmpl_args),	\
+				__sysctl_path_tmpl_or_default(path,		\
+							      ## tmpl_args))
+#define register_net_sysctl(net, path, table, tmpl_args...)			\
+	register_net_sysctl_sz(net, path, table,				\
+			       __sysctl_table_array_size(table, ## tmpl_args),	\
+			       ## tmpl_args)
+
+/* Helper macro for optional template arguments */
+#define __sysctl_table_array_size(table, tmpl_args...)	\
+	ARRAY_SIZE(__sysctl_table_tmpl_or_default(table, ## tmpl_args))
+
 #ifdef CONFIG_SYSCTL
 int net_sysctl_init(void);
-struct ctl_table_header *register_net_sysctl_sz(struct net *net, const char *path,
-						const struct ctl_table *table,
-						size_t table_size);
+struct ctl_table_header *__register_net_sysctl_sz(struct net *net,
+						  const char *path,
+						  const struct ctl_table *table,
+						  size_t table_size);
 void unregister_net_sysctl_table(struct ctl_table_header *header);
 #else
 static inline int net_sysctl_init(void) { return 0; }
-static inline struct ctl_table_header *register_net_sysctl_sz(struct net *net,
+static inline struct ctl_table_header *__register_net_sysctl_sz(struct net *net,
 	const char *path, const struct ctl_table *table, size_t table_size)
 {
 	return NULL;
diff --git a/net/sysctl_net.c b/net/sysctl_net.c
index e190a639eef2f6929c4aed85ad625aaf8a6ebd6a..e003210e0917760b707dae1e738c50d7c3969deb 100644
--- a/net/sysctl_net.c
+++ b/net/sysctl_net.c
@@ -160,10 +160,10 @@ static int ensure_safe_net_sysctl(struct net *net, const char *path,
 	return 0;
 }
 
-struct ctl_table_header *register_net_sysctl_sz(struct net *net,
-						const char *path,
-						const struct ctl_table *table,
-						size_t table_size)
+struct ctl_table_header *__register_net_sysctl_sz(struct net *net,
+						  const char *path,
+						  const struct ctl_table *table,
+						  size_t table_size)
 {
 	if (!net_eq(net, &init_net))
 		if (ensure_safe_net_sysctl(net, path, table, table_size))
@@ -171,7 +171,7 @@ struct ctl_table_header *register_net_sysctl_sz(struct net *net,
 
 	return __register_sysctl_table(&net->sysctls, path, table, table_size);
 }
-EXPORT_SYMBOL_GPL(register_net_sysctl_sz);
+EXPORT_SYMBOL_GPL(__register_net_sysctl_sz);
 
 void unregister_net_sysctl_table(struct ctl_table_header *header)
 {

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
