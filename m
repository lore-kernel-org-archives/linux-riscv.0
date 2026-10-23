Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8ED0606A329
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 13:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pdo2poTb;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=einfochips.com header.i=@einfochips.com header.a=rsa-sha256 header.s=NAESA-Selector1 header.b=sI4xTz9D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Z6GMRTb19DZSaYanond11zyozgoQDLp/QwCQazJRa3Y=; b=pdo2poTbUKkzj3SweX0F1R7045
	CN4ZeoEWBbQ9OQBFHHtZgxaYoQuoxsoGWwNEejhUztbQgmR3/1hoC5FCD0IynygYUoXmzYANmFFao
	JAT75bPjIObUzEQpgiAT7ECZguMiD6gFmAxMYLehF6/YQQX72rPOYp6aeWW5K1TVa0zqlyPkf0gQH
	wFXLNcVRAm8mS5eHzt40AFi96P19aGINXkNkYdnR6El4WpWfHHwG8monOyLI0Bxz01WOhJYuMMpMq
	NF0PCWIHJDzTJJ3XQ5OsCKBSTs00RTGZjDEAB6bgRIgk0015bmwXGW2dccomB82cqCGv5IRS9rwhi
	vITBOe/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFcw-0000000GR2Q-264s;
	Fri, 23 Oct 2026 13:48:10 +0000
Received: from naesa06.arrow.com ([216.150.161.27])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFct-0000000GR1T-1Slu
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 13:48:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=2544; q=dns/txt;
  s=NAESA-Selector1; t=1792763287; x=1824299287;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AKN0NGQ+vVruKbIpxCAzudsaBfTY19Lc9bB37nCu7yc=;
  b=sI4xTz9DaYz9awljuyKfKzIfaoW1Mx8KOg+SPZDr100k1Tb0w0aULnoB
   Q36KeVOq9B71FVQmg7lWWQ9+Y1XrBTmI5gGRSjIQPNOEFMwTOL8qqxu34
   fBKJt1mA2frG/pZLNJn7cZbXFGssBS5e/eGnvEq3fpnlmrqo5H1GyQEWa
   KftJWCDXT0xTrTdVsawR+RaDcDUgPvo7CorvvaA4E6i9oqRSAPI3xJMYk
   EeDJnCNulNhGJ4GYAEeRwZ/V5QVlJfFEBkp65kBXo1aAYw/a8gY8/UKdD
   RsYotwiDQi0bHg/HqN+vMacpGOxbwj5unfFdvfvWp1HC8inRd+oRcmVoV
   w==;
X-CSE-ConnectionGUID: GCWN9C6CTaavHAeJE6Pb4Q==
X-CSE-MsgGUID: vfErdYJrR/G0Kp5VrqqhJw==
X-IronPort-AV: E=Sophos;i="6.27,174,1787032800"; 
   d="scan'208";a="66754007"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa06out.arrow.com with ESMTP; 23 Oct 2026 07:48:03 -0600
Received: from AHMCPU1888.localdomain ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.20348.1);
	 Fri, 23 Oct 2026 19:18:02 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Subject: [PATCH v2] cache: sifive_ccache: Enable all ways on EIC7700
Date: Fri, 23 Oct 2026 19:18:01 +0530
Message-Id: <20261023134801.108890-1-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginalArrivalTime: 23 Oct 2026 13:48:02.0238 (UTC) FILETIME=[1F4925E0:01DD62F5]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_064807_519282_CE22B18A 
X-CRM114-Status: GOOD (  13.26  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

EIC7700 firmware leaves only way 0 enabled when no LIM is reserved, so
Linux can use only one of the implemented cache ways.

Add an EIC7700-specific quirk that reads and validates the implemented
way count, then enables all ways when the cache node has no
memory-region property. Leave WayEnable unchanged when the property is
present because enabled ways cannot be returned to LIM until reset.

Keep this behavior specific to EIC7700 because firmware on other
platforms may have already configured the cache/LIM partition.

Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
---
Changes in v2:
- Restrict automatic way enabling to EIC7700 using a device quirk.

Link to v1: https://lore.kernel.org/all/20261021130906.2501060-1-pinkesh.vaghela@einfochips.com

 drivers/cache/sifive_ccache.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
index e1a283805ea7..b4eac620ad0b 100644
--- a/drivers/cache/sifive_ccache.c
+++ b/drivers/cache/sifive_ccache.c
@@ -68,6 +68,7 @@ enum {
 enum {
 	QUIRK_NONSTANDARD_CACHE_OPS	= BIT(0),
 	QUIRK_BROKEN_DATA_UNCORR	= BIT(1),
+	QUIRK_ENABLE_ALL_WAYS		= BIT(2),
 };
 
 #ifdef CONFIG_DEBUG_FS
@@ -117,9 +118,25 @@ static void ccache_config_read(void)
 	pr_info("Index of the largest way enabled: %u\n", cfg);
 }
 
+static int ccache_enable_all_ways(void)
+{
+	u32 config, ways;
+
+	config = readl(ccache_base + SIFIVE_CCACHE_CONFIG);
+	ways = FIELD_GET(SIFIVE_CCACHE_CONFIG_WAYS_MASK, config);
+	if (!ways) {
+		pr_err("Invalid cache configuration: zero ways\n");
+		return -EINVAL;
+	}
+
+	writel(ways - 1, ccache_base + SIFIVE_CCACHE_WAYENABLE);
+
+	return 0;
+}
+
 static const struct of_device_id sifive_ccache_ids[] = {
 	{ .compatible = "eswin,eic7700-l3-cache",
-	  .data = (void *)(QUIRK_NONSTANDARD_CACHE_OPS) },
+	  .data = (void *)(QUIRK_NONSTANDARD_CACHE_OPS | QUIRK_ENABLE_ALL_WAYS) },
 	{ .compatible = "sifive,fu540-c000-ccache" },
 	{ .compatible = "sifive,fu740-c000-ccache" },
 	{ .compatible = "starfive,jh7100-ccache",
@@ -317,6 +334,13 @@ static int __init sifive_ccache_init(void)
 		goto err_unmap;
 	}
 
+	if ((quirks & QUIRK_ENABLE_ALL_WAYS) &&
+	    !of_property_present(np, "memory-region")) {
+		rc = ccache_enable_all_ways();
+		if (rc)
+			goto err_unmap;
+	}
+
 #ifdef CONFIG_RISCV_NONSTANDARD_CACHE_OPS
 	if (quirks & QUIRK_NONSTANDARD_CACHE_OPS) {
 		riscv_cbom_block_size = SIFIVE_CCACHE_LINE_SIZE;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
