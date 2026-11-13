Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211F1606A334
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 07:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aGwRnP9F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kw43JTu/ybynpIHlwjds3yKEVO/gEAC7vcICB8j+0l0=; b=aGwRnP9FNOsEv13xWYNcSkF4Ui
	askcQUjziQyWiWA3F61Y/PmZfFnEr8IJtPWMMSghOf+2L/rdw8JXCLdHEG1nVwxn5KYZkdadOL5rz
	daOzjcaJ7MvfWKKmLnXjVTwG+E/5TajizOqUlINemXEILhoucwo6LStR6GJRjyh175+Ep3ZNxcITv
	kp4GyXbNJIr52qKhAxbTY2PhjQ6m/0jUrtV39+RZEi+zuKlWLkiFnh/kTy2r20SEQab+6qk+TtF9R
	lBaXXqC4GsSwp7a/YY/vbb6iMTzcQfWgqyQKMO1HxD9GkLZ5u+3ouyMbN4pNLhAvOKmFqsRqZxR4N
	1lALKp+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlUR-0000000BrBD-3kh4;
	Fri, 13 Nov 2026 07:14:28 +0000
Received: from atcsqr.andestech.com ([220.128.198.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlTv-0000000BquX-2Vxg
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 07:14:10 +0000
Received: from mail.andestech.com (atcpcs53.andestech.com [10.0.1.153])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CTvT059148
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 15:12:29 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs53.andestech.com
 (10.0.1.153) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 13 Nov
 2026 15:12:29 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Nov
 2026 15:12:28 +0800
From: Mina Hui-Min Chou <minachou@andestech.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <conor@kernel.org>, <jic23@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <geert+renesas@glider.be>, <magnus.damm@gmail.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <randolph@andestech.com>, <cyyang772@andestech.com>,
        <tim609@andestech.com>, <minachou@andestech.com>, <az70021@gmail.com>
Subject: [PATCH v2 10/19] cache: andes_llcache: register cache ops only when the errata needs them
Date: Fri, 13 Nov 2026 15:11:34 +0800
Message-ID: <20261113071143.1446167-11-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113071143.1446167-1-minachou@andestech.com>
References: <20261113071143.1446167-1-minachou@andestech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs53.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: Atcsqr.andestech.com 6AD7CTvT059148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_231401_198401_A295035F 
X-CRM114-Status: GOOD (  17.70  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The driver registers its CCTL-based cache ops whenever
riscv_cbom_block_size is non-zero. On Andes cores with Zicbom, it holds
the Zicbom block size, so the CCTL ops would override the standard
Zicbom CMO.

Only register them when riscv_cbom_block_size is 1, the value the Andes
errata sets when the core needs CCTL-based cache maintenance.

Do this check before looking up the LLC node, so the driver does
nothing on platforms that do not need it. Once the errata has asked for
the CCTL ops, the LLC node is required to provide them, so report a
missing node with an error instead of failing silently.

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 drivers/cache/andes_llcache.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/cache/andes_llcache.c b/drivers/cache/andes_llcache.c
index bf49dbcb080b..80c55616ab10 100644
--- a/drivers/cache/andes_llcache.c
+++ b/drivers/cache/andes_llcache.c
@@ -176,25 +176,25 @@ static int __init andes_cache_init(void)
 	struct resource res;
 	int ret;
 
+	/*
+	 * The Andes errata sets riscv_cbom_block_size to 1 only when the
+	 * core needs CCTL-based cache maintenance. Otherwise this driver is
+	 * not needed, so return without probing it any further.
+	 */
+	if (riscv_cbom_block_size != 1)
+		return 0;
+
 	struct device_node *np __free(device_node) =
 		of_find_matching_node(NULL, andes_cache_ids);
-	if (!of_device_is_available(np))
+	if (!of_device_is_available(np)) {
+		pr_err("No Andes LLC node found, cache ops not registered\n");
 		return -ENODEV;
+	}
 
 	ret = of_address_to_resource(np, 0, &res);
 	if (ret)
 		return ret;
 
-	/*
-	 * If IOCP is present on the Andes core riscv_cbom_block_size
-	 * will be 0 for sure, so we can definitely rely on it. If
-	 * riscv_cbom_block_size = 0 we don't need to handle CMO using SW any
-	 * more so we just return success here and only if its being set we
-	 * continue further in the probe path.
-	 */
-	if (!riscv_cbom_block_size)
-		return 0;
-
 	andes_priv.llc_base = ioremap(res.start, resource_size(&res));
 	if (!andes_priv.llc_base)
 		return -ENOMEM;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
