Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30585C5DF85
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 18:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uAO0llwwCB92yQSIA8kqNhUFXIf05Ey3VtXlQsFjI2g=; b=S9n7FK86eBuKLi
	+g84t3f0ALm84JhRU0k5cAu+3lZz9Dm5TKJ1HFaEO2vN+9SqKAkNTc8h9KURJVq6E76RBN4y468Hu
	oaGHe8MpR3dbnOGePDD7bVjCkXvvyOymhJSHLXGbj4pr3cb87XuA3QKg+6K5ffLpO7M2rdyd/ADeD
	ySgtqlibpTw21ga2frZKY6+waJ/5kG+8yljgxlU2ztVcHG/v6BoqlbibYhKzsKW/DJ92n98w3DJKo
	eqrvmi5NIgK5zYnjeqdcTCEjl4pcv7U/wtajfdd6lnwM8cJZKhQgpCNMHkrO+Ptz0DmN6b4BUdvV/
	bR7uF1COt0r4VCSx1ijQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwkqL-0000000ALCZ-3nVy;
	Wed, 19 Aug 2026 18:16:53 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwkqH-0000000AL7w-3tlq
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 18:16:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=WSGsNXeWAE/lPx5m93/UJiI7JZPSsRCHYegj4bfx/3o=; b=mYIud6Z1KrWl42S4eUQGcTqd3A
	uT4jzZMKNoCWFiXvF2MFFbVWFTUd+Nbs0E/qWvvVARMD0ZyoS6i6VRFTzilDgaO4yaQGwWToi4aa4
	tvS1b1DPOek2kif+q5a96VXfVtPCJcevIjFFiZZngbbRE2Q4A8EPlBXNnhoTF8QIEUoKeEdmisjOW
	tJAt5TBs1glKFRl44+qwamerP/0w5T4PSNo/mr23cGO+++L/QRNId6xZRHcopfPJrr/T7LOdr8sqA
	DWUDYcVKEhdWFvRTdCtfZ99PpLw7FgqM2AcXXXyjvIsRGPjfrXYb6UBV7O9xLrFt07tHXvJN8SujD
	7XzsdtHQ==;
Received: from 186-249-147-181.shared.desktop.com.br ([186.249.147.181] helo=[127.0.1.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wwkq6-006ENH-0H; Wed, 19 Aug 2026 20:16:38 +0200
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Wed, 19 Aug 2026 15:16:20 -0300
Subject: [PATCH RFC v3 07/13] sysctl, net: update
 register_net_sysctl{_sz}() callers with template arguments
MIME-Version: 1.0
Message-Id: <20260819-sysctl-module-aliases-v3-7-aab90569365d@igalia.com>
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
X-CRM114-CacheID: sfid-20260819_111650_143910_4366B14F 
X-CRM114-Status: GOOD (  10.15  )
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

Update most callers with dynamic table/path to use template arguments.

Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
 net/core/neighbour.c                | 11 ++++++++---
 net/core/sysctl_net_core.c          |  3 ++-
 net/ieee802154/6lowpan/reassembly.c |  2 +-
 net/ipv4/devinet.c                  |  9 +++++++--
 net/ipv4/route.c                    |  3 ++-
 net/ipv4/sysctl_net_ipv4.c          |  2 +-
 net/ipv6/addrconf.c                 |  7 +++++--
 net/ipv6/sysctl_net_ipv6.c          |  3 ++-
 net/mpls/af_mpls.c                  |  9 ++++++---
 net/netfilter/ipvs/ip_vs_lblc.c     |  3 ++-
 net/netfilter/ipvs/ip_vs_lblcr.c    |  3 ++-
 net/sctp/sysctl.c                   |  3 ++-
 net/smc/smc_sysctl.c                |  2 +-
 net/xfrm/xfrm_sysctl.c              |  2 +-
 14 files changed, 42 insertions(+), 20 deletions(-)

diff --git a/net/core/neighbour.c b/net/core/neighbour.c
index 1349c0eedb642539b28391390fd82f543e004353..bdd67dd879d24f41c95c454ca26d63fd6d8e112b 100644
--- a/net/core/neighbour.c
+++ b/net/core/neighbour.c
@@ -12,6 +12,7 @@
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+#define SYSCTL_MODULE_ALIASES_UNIQUE_ID
 
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -3910,11 +3911,15 @@ int neigh_sysctl_register(struct net_device *dev, struct neigh_parms *p,
 	      BUG();
 	}
 
-	snprintf(neigh_path, sizeof(neigh_path), "net/%s/neigh/%s",
-		p_name, dev_name_source);
+#define path_template "net/%s/neigh/%s"
+	snprintf(neigh_path, sizeof(neigh_path), path_template,
+		 p_name, dev_name_source);
 	t->sysctl_header = register_net_sysctl_sz(neigh_parms_net(p),
 						  neigh_path, t->neigh_vars,
-						  neigh_vars_size);
+						  neigh_vars_size,
+						  neigh_sysctl_template.neigh_vars,
+						  path_template);
+#undef path_template
 	if (!t->sysctl_header)
 		goto free;
 
diff --git a/net/core/sysctl_net_core.c b/net/core/sysctl_net_core.c
index eb35da3556f4aa00cecd4582ab94e339d2518506..d8dfce6babc337749cde653fb1308f977ba28ef5 100644
--- a/net/core/sysctl_net_core.c
+++ b/net/core/sysctl_net_core.c
@@ -821,7 +821,8 @@ static __net_init int sysctl_core_net_init(struct net *net)
 			goto err_dup;
 	}
 
-	net->core.sysctl_hdr = register_net_sysctl_sz(net, "net/core", tbl, table_size);
+	net->core.sysctl_hdr = register_net_sysctl_sz(net, "net/core", tbl, table_size,
+						      netns_core_table);
 	if (net->core.sysctl_hdr == NULL)
 		goto err_reg;
 
diff --git a/net/ieee802154/6lowpan/reassembly.c b/net/ieee802154/6lowpan/reassembly.c
index ddb6a5817d098eda6b22d802b5f59604b2145ff2..28914524bd0c389877533ed689eaf5af58c46bdd 100644
--- a/net/ieee802154/6lowpan/reassembly.c
+++ b/net/ieee802154/6lowpan/reassembly.c
@@ -386,7 +386,7 @@ static int __net_init lowpan_frags_ns_sysctl_register(struct net *net)
 	table[2].data	= &ieee802154_lowpan->fqdir->timeout;
 
 	hdr = register_net_sysctl_sz(net, "net/ieee802154/6lowpan", table,
-				     table_size);
+				     table_size, lowpan_frags_ns_ctl_table);
 	if (hdr == NULL)
 		goto err_reg;
 
diff --git a/net/ipv4/devinet.c b/net/ipv4/devinet.c
index a90be57c63be1565b2dff51e8264668fd71b9e58..a466163dad7fe7f8b5b1c2897dd5fe548c288442 100644
--- a/net/ipv4/devinet.c
+++ b/net/ipv4/devinet.c
@@ -21,6 +21,7 @@
  *					if no match found.
  */
 
+#define SYSCTL_MODULE_ALIASES_UNIQUE_ID
 
 #include <linux/uaccess.h>
 #include <linux/bitops.h>
@@ -2739,9 +2740,13 @@ static int __devinet_sysctl_register(struct net *net, char *dev_name,
 		t->devinet_vars[i].extra2 = net;
 	}
 
-	snprintf(path, sizeof(path), "net/ipv4/conf/%s", dev_name);
+#define path_template "net/ipv4/conf/%s"
+	snprintf(path, sizeof(path), path_template, dev_name);
 
-	t->sysctl_header = register_net_sysctl(net, path, t->devinet_vars);
+	t->sysctl_header = register_net_sysctl(net, path, t->devinet_vars,
+					       devinet_sysctl.devinet_vars,
+					       path_template);
+#undef path_template
 	if (!t->sysctl_header)
 		goto free;
 
diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index 604cc51dfd9bc5e7351a93140a9e0699a71e6a4e..d5464c7ef7dacdd47c5cb59ca14f605004c43b49 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -3661,7 +3661,8 @@ static __net_init int sysctl_route_net_init(struct net *net)
 	tbl[0].extra1 = net;
 
 	net->ipv4.route_hdr = register_net_sysctl_sz(net, "net/ipv4/route",
-						     tbl, table_size);
+						     tbl, table_size,
+						     ipv4_route_netns_table);
 	if (!net->ipv4.route_hdr)
 		goto err_reg;
 	return 0;
diff --git a/net/ipv4/sysctl_net_ipv4.c b/net/ipv4/sysctl_net_ipv4.c
index 2f0363bca2a88d68276670cfce6fb04398f82bc5..879651f4a57bc1206494a9eb1dd6a3fb752169c9 100644
--- a/net/ipv4/sysctl_net_ipv4.c
+++ b/net/ipv4/sysctl_net_ipv4.c
@@ -1696,7 +1696,7 @@ static __net_init int ipv4_sysctl_init_net(struct net *net)
 	}
 
 	net->ipv4.ipv4_hdr = register_net_sysctl_sz(net, "net/ipv4", table,
-						    table_size);
+						    table_size, ipv4_net_table);
 	if (!net->ipv4.ipv4_hdr)
 		goto err_reg;
 
diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index 9d89be7e0544befb979526fa4f0c4f0ab90582f0..e87c5d2e6e2f49ef4041faa4d8df85f69cabad36 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -7347,10 +7347,13 @@ static int __addrconf_sysctl_register(struct net *net, char *dev_name,
 		}
 	}
 
-	snprintf(path, sizeof(path), "net/ipv6/conf/%s", dev_name);
+#define path_template "net/ipv6/conf/%s"
+	snprintf(path, sizeof(path), path_template, dev_name);
 
 	p->sysctl_header = register_net_sysctl_sz(net, path, table,
-						  table_size);
+						  table_size, addrconf_sysctl,
+						  path_template);
+#undef path_template
 	if (!p->sysctl_header)
 		goto free;
 
diff --git a/net/ipv6/sysctl_net_ipv6.c b/net/ipv6/sysctl_net_ipv6.c
index 1a0a36dcdabc1be961d0ab69e5c93b05c53f46a8..75ba17cb7c0ccb4769d61e74220c75d0b3e2bcd9 100644
--- a/net/ipv6/sysctl_net_ipv6.c
+++ b/net/ipv6/sysctl_net_ipv6.c
@@ -275,7 +275,8 @@ static int __net_init ipv6_sysctl_net_init(struct net *net)
 		goto out_ipv6_route_table;
 
 	net->ipv6.sysctl.hdr = register_net_sysctl_sz(net, "net/ipv6",
-						      ipv6_table, table_size);
+						      ipv6_table, table_size,
+						      ipv6_table_template);
 	if (!net->ipv6.sysctl.hdr)
 		goto out_ipv6_icmp_table;
 
diff --git a/net/mpls/af_mpls.c b/net/mpls/af_mpls.c
index 961be5054a039b3d8bcfd22851beb69c21954bc3..f2025bedc543b5b50eb3c7275e26e6adcdf27ae5 100644
--- a/net/mpls/af_mpls.c
+++ b/net/mpls/af_mpls.c
@@ -1446,9 +1446,12 @@ static int mpls_dev_sysctl_register(struct net_device *dev,
 		table[i].extra2 = net;
 	}
 
-	snprintf(path, sizeof(path), "net/mpls/conf/%s", dev->name);
+#define path_template "net/mpls/conf/%s"
+	snprintf(path, sizeof(path), path_template, dev->name);
 
-	mdev->sysctl = register_net_sysctl_sz(net, path, table, table_size);
+	mdev->sysctl = register_net_sysctl_sz(net, path, table, table_size,
+					      mpls_dev_table, path_template);
+#undef path_template
 	if (!mdev->sysctl)
 		goto free;
 
@@ -2765,7 +2768,7 @@ static __net_init int mpls_net_init(struct net *net)
 		table[i].data = (char *)net + (uintptr_t)table[i].data;
 
 	net->mpls.ctl = register_net_sysctl_sz(net, "net/mpls", table,
-					       table_size);
+					       table_size, mpls_table);
 	if (net->mpls.ctl == NULL) {
 		kfree(table);
 		return -ENOMEM;
diff --git a/net/netfilter/ipvs/ip_vs_lblc.c b/net/netfilter/ipvs/ip_vs_lblc.c
index 693bcc82ccb77b49bfa28a7facac946f0223aba2..efad701b096341dfe44e621ed647e21fd3bfa486 100644
--- a/net/netfilter/ipvs/ip_vs_lblc.c
+++ b/net/netfilter/ipvs/ip_vs_lblc.c
@@ -572,7 +572,8 @@ static int __net_init __ip_vs_lblc_init(struct net *net)
 
 	ipvs->lblc_ctl_header = register_net_sysctl_sz(net, "net/ipv4/vs",
 						       ipvs->lblc_ctl_table,
-						       vars_table_size);
+						       vars_table_size,
+						       vs_vars_table);
 	if (!ipvs->lblc_ctl_header) {
 		if (!net_eq(net, &init_net))
 			kfree(ipvs->lblc_ctl_table);
diff --git a/net/netfilter/ipvs/ip_vs_lblcr.c b/net/netfilter/ipvs/ip_vs_lblcr.c
index f53f05ceea36f02d6d1d435882484005829fe6de..3498e6db6f0d7e9af29a95f1f8ccecd7c8d45cfd 100644
--- a/net/netfilter/ipvs/ip_vs_lblcr.c
+++ b/net/netfilter/ipvs/ip_vs_lblcr.c
@@ -757,7 +757,8 @@ static int __net_init __ip_vs_lblcr_init(struct net *net)
 
 	ipvs->lblcr_ctl_header = register_net_sysctl_sz(net, "net/ipv4/vs",
 							ipvs->lblcr_ctl_table,
-							vars_table_size);
+							vars_table_size,
+							vs_vars_table);
 	if (!ipvs->lblcr_ctl_header) {
 		if (!net_eq(net, &init_net))
 			kfree(ipvs->lblcr_ctl_table);
diff --git a/net/sctp/sysctl.c b/net/sctp/sysctl.c
index 2b94c211427de7b2e9aa374033eac26ddd874e14..891fb447ea480ec95fb66a02bf8e086b3efa58c7 100644
--- a/net/sctp/sysctl.c
+++ b/net/sctp/sysctl.c
@@ -605,7 +605,8 @@ int sctp_sysctl_net_register(struct net *net)
 	table[SCTP_PS_RETRANS_IDX].extra1 = &net->sctp.pf_retrans;
 
 	net->sctp.sysctl_header = register_net_sysctl_sz(net, "net/sctp",
-							 table, table_size);
+							 table, table_size,
+							 sctp_net_table);
 	if (net->sctp.sysctl_header == NULL) {
 		kfree(table);
 		return -ENOMEM;
diff --git a/net/smc/smc_sysctl.c b/net/smc/smc_sysctl.c
index 09dad48337f6164f5765fa793412bdebf47e61ca..4b1dc109afa6c62b4640513336d0862bdcd00f8c 100644
--- a/net/smc/smc_sysctl.c
+++ b/net/smc/smc_sysctl.c
@@ -235,7 +235,7 @@ int __net_init smc_sysctl_net_init(struct net *net)
 	}
 
 	net->smc.smc_hdr = register_net_sysctl_sz(net, "net/smc", table,
-						  table_size);
+						  table_size, smc_table);
 	if (!net->smc.smc_hdr)
 		goto err_reg;
 
diff --git a/net/xfrm/xfrm_sysctl.c b/net/xfrm/xfrm_sysctl.c
index 357152a50faf10e5c33468c034dd1777e0bed079..34bb2097930b61f711a2cafd614e63b5caac0013 100644
--- a/net/xfrm/xfrm_sysctl.c
+++ b/net/xfrm/xfrm_sysctl.c
@@ -60,7 +60,7 @@ int __net_init xfrm_sysctl_init(struct net *net)
 		table_size = 0;
 
 	net->xfrm.sysctl_hdr = register_net_sysctl_sz(net, "net/core", table,
-						      table_size);
+						      table_size, xfrm_table);
 	if (!net->xfrm.sysctl_hdr)
 		goto out_register;
 	return 0;

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
