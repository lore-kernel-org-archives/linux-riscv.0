Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FCA606A319
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 13:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AMVrd1AZ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=einfochips.com header.i=@einfochips.com header.a=rsa-sha256 header.s=NAESA-Selector1 header.b=oEYYQDHB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aJxJOZumQqUK0ReSZx2/lG1ohatQd5RJ8376c10p6tE=; b=AMVrd1AZr+oZGX
	KlxhpVDwktM+y+2kYbvH+zAqynpMoAzR4z7NfXEwiKQex6LHv0h2aw2yVqWrokEcrSFVd+A9JGQrg
	OqXWTOIFSiVU8eZ0lbgya2LnrWy0jN9N9yOj4jYfCmdAw+j3QlYJhdh8sQMHNEa8YdY5D4L/5kj9z
	888LiX3eTIac1NUMcbGu02cniJdmBd6reJ8kyGQb4C/osegXexrHKxbfdCL0o2aM8Wx7uQ9CTQt1s
	M5P3RWqUcmZZLx6GRyxDz8OTtgbwIlMqHkYqGu7niGa26U8HevUZqy4vzwJcaBQCVFWLk0hQAvTO7
	HjQdVWqTnTZSeCTyflVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJW49-0000000Brwi-1MyZ;
	Wed, 21 Oct 2026 13:09:13 +0000
Received: from naesa05.arrow.com ([216.150.161.26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJW46-0000000Brvv-1FWF
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 13:09:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=2223; q=dns/txt;
  s=NAESA-Selector1; t=1792588150; x=1824124150;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8kkSuKGZybMITxdUyrxJVnS/iDczXbL5N4Q9M2Ulz30=;
  b=oEYYQDHBLQ/+aKy3GNvAMqsB4IW52yCWsWBDhTwaf8LEWbq+O2U0UPps
   Q495vBZp5xIdYUUk+y8V4QMiqilngpXnyY6+Zm06WyiOw1sjXu32OshmQ
   /rJFqAQMmpsrQu+vcTMlWS3V/j2l5bIMXQDDwQ9fDqN7wEaQZvZKSCGsq
   lg+1Gz/SHxC5ujFbPxJ/aJJxLxVD5G5fyid5KtqfO+ntQGAeookptDaWQ
   NHPbSb92ig5KIJ6FYEMVg4yznnS8FVm0YpwttVohmh8rSN9AKPHFYX8q2
   W0/7bxHLGxRI5BdCuBZ5PB0t6cxFxQyKvA4kr2IgFTyBnAr+9MVSBKGHr
   g==;
X-CSE-ConnectionGUID: PpkI369eTKORBgX4vZNpbg==
X-CSE-MsgGUID: 9NfeorQ0S86xS7G6gemHSA==
X-IronPort-AV: E=Sophos;i="6.27,170,1787032800"; 
   d="scan'208";a="66110695"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa05out.arrow.com with ESMTP; 21 Oct 2026 07:09:07 -0600
Received: from AHMCPU1888.localdomain ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.20348.1);
	 Wed, 21 Oct 2026 18:39:06 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Subject: [PATCH] cache: sifive_ccache: Enable all ways when no LIM is reserved
Date: Wed, 21 Oct 2026 18:39:06 +0530
Message-Id: <20261021130906.2501060-1-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginalArrivalTime: 21 Oct 2026 13:09:06.0684 (UTC) FILETIME=[5A5C63C0:01DD615D]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_060910_449095_079D10DE 
X-CRM114-Status: GOOD (  11.72  )
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

The composable cache resets with only way 0 enabled, while the remaining
ways are available as Loosely Integrated Memory (LIM). Systems that do
not reserve LIM therefore use only one cache way unless software
increases WayEnable.

When no memory-region property is present, DT describes no LIM
reservation for the cache controller. Validate the reported way count,
then enable all cache ways so Linux can use the full cache capacity.

When memory-region is present, leave WayEnable unchanged because enabled
ways cannot be returned to LIM until reset. This may leave more ways
assigned to LIM than required, but avoids consuming reserved LIM.

Apply this policy to all compatibles handled by the driver. Firmware or
DT configurations that require LIM must provide memory-region;
otherwise, Linux will convert all disabled ways to cache.

Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
---
 drivers/cache/sifive_ccache.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
index 2acb8bdf06d5..17b6ba8ab984 100644
--- a/drivers/cache/sifive_ccache.c
+++ b/drivers/cache/sifive_ccache.c
@@ -117,6 +117,22 @@ static void ccache_config_read(void)
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
 	  .data = (void *)(QUIRK_NONSTANDARD_CACHE_OPS) },
@@ -319,6 +335,12 @@ static int __init sifive_ccache_init(void)
 		goto err_unmap;
 	}
 
+	if (!of_property_present(np, "memory-region")) {
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
