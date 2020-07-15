Return-Path: <SRS0=uYfr=A2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 904BAC433DF
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 23:30:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6113820658
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 23:30:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KAv2oDmL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="iFnqblvN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6113820658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5xgU6ReSoZZM7lQHoFoujvwqE709HEOHpZUZweXfr04=; b=KAv2oDmLqFOhGkN2QS8m+H2hA
	N2KuOK7DTsnidLyDNOfOkcb6uBeHYV0vVn5nXe9uy07cWcY4RLOTTOA+j9cfTnZ6kKg2fvefJwvu0
	k5siT8K5ypuYQf404pe+AX/KPo2Sd+zbQdsLxAsYwxmT3ZZj9Jxh0O1iwzYc7bkCFaPlVSM230GI2
	JaB33LK+HcXmjUS2Km1VwjWoQqLn0ygFbcdHOY+5Vann6dx0hTlIi40n7CKUhrKa+qZ5Y06y7lOok
	KW1vm1COJ5wuLZbczVNkAQkowzhHtXq7ocO150mNbk8Y2w8IOZGO8g7S3E0fdIIZ7y6zUmVqE6/gS
	avAiAMJkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvqr4-000735-5i; Wed, 15 Jul 2020 23:30:26 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvqr1-00070Y-5c
 for linux-riscv@lists.infradead.org; Wed, 15 Jul 2020 23:30:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594855823; x=1626391823;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1WUJsuuWe1ZBua62bFIdOijTgWGShB9OAlNDVmWfFmY=;
 b=iFnqblvNgVxX2nM7N8hXqErBFcXqQeU2TpK6DF911wbsXe4IfxMojUB3
 /ZZb8zhWLMBlNSnVOIdsNU03EdeojNUmmiaeNRzWZ4OMJnM1FoEYLu6SV
 BXA+7xzE8/mGu1NQ/kBBMgUAbWvYPY38B6RXBYZqLz8+CdMk0jCEasCV6
 eV0+z+E1RWkLUlm/ZoZGtrKCi7cXQJFphkLl71e86r0vgssP2RgHiBRNf
 Djg81+lxyUnhFQvvMeHbEatMXpiKPbxzckEi5LmDh1O1Mp10n/PQ+Y27t
 kJA5U4LWUzYumlFlS1c36PGFs3hwa9vIL4qi655YRCOa87WUOcgVZe22U Q==;
IronPort-SDR: rXSxn17a4ZFev/Xiv3N+qCF8QGlLHBeUToxijfnUTSkRiOzAN3nTb+u2NDWwVKxZi0iUC9jiwm
 UJr9KO2jIQMze9I7BS0Hzk13tqfhiHmxV7zYOY7gz7l5uuh4skv/UQf6oVm1wkcXcoWuBQ8U4t
 V5E0uFVxDDXmaS7EnVE1lUNFfeXbcNIQs18v9O8U0KCVSXErmEVbbFTqY/YWP0hU5R5VaGnoMq
 TlXPt+e3AzlvUAotoR94G8j9lHrW8o7n2LzoKArpTfJ5PasLhk1uKoFMY3xBc5PbCMPLaJiZ+M
 HX8=
X-IronPort-AV: E=Sophos;i="5.75,357,1589212800"; d="scan'208";a="245592888"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Jul 2020 07:30:23 +0800
IronPort-SDR: jJkidqY3AYMI6A7KMayYEQ0F6E3de9gaQw0doc8A5lRLDNpkL2mACgWypxh9SXP+aPxM7+ULXv
 +L4gop3Spsi2G+MKXqVeWz34kY6oc+eG4=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 16:18:15 -0700
IronPort-SDR: jolcTqH56Kqn7iIi8sFylTtgUKK7/Idjrhr2qok3aASAzRD1+74v7auysvNA/+tadSVs44nyYc
 W3zYMoqRAm7g==
WDCIronportException: Internal
Received: from cnf009656.ad.shared (HELO jedi-01.hgst.com) ([10.86.58.5])
 by uls-op-cesaip01.wdc.com with ESMTP; 15 Jul 2020 16:30:21 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] riscv: Parse all memory blocks to remove unusable memory
Date: Wed, 15 Jul 2020 16:30:09 -0700
Message-Id: <20200715233009.27183-5-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200715233009.27183-1-atish.patra@wdc.com>
References: <20200715233009.27183-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_193023_378830_2B01CAEE 
X-CRM114-Status: GOOD (  13.41  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Vincent Chen <vincent.chen@sifive.com>,
 Anup Patel <anup.patel@wdc.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, maximum physical memory allowed is equal to -PAGE_OFFSET.
That's why we remove any memory blocks spanning beyond that size. However,
it is done only for memblock containing linux kernel which will not work
if there are multiple memblocks.

Process all memory blocks to figure out how much memory needs to be removed
and remove at the end instead of updating the memblock list in place.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/mm/init.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index f818a47a72d1..79e9d55bdf1a 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -147,26 +147,29 @@ void __init setup_bootmem(void)
 {
 	struct memblock_region *reg;
 	phys_addr_t mem_size = 0;
+	phys_addr_t total_mem = 0;
+	phys_addr_t mem_start, end = 0;
 	phys_addr_t vmlinux_end = __pa_symbol(&_end);
 	phys_addr_t vmlinux_start = __pa_symbol(&_start);
 
 	/* Find the memory region containing the kernel */
 	for_each_memblock(memory, reg) {
-		phys_addr_t end = reg->base + reg->size;
-
-		if (reg->base <= vmlinux_start && vmlinux_end <= end) {
-			mem_size = min(reg->size, (phys_addr_t)-PAGE_OFFSET);
-
-			/*
-			 * Remove memblock from the end of usable area to the
-			 * end of region
-			 */
-			if (reg->base + mem_size < end)
-				memblock_remove(reg->base + mem_size,
-						end - reg->base - mem_size);
-		}
+		end = reg->base + reg->size;
+		if (!total_mem)
+			mem_start = reg->base;
+		if (reg->base <= vmlinux_start && vmlinux_end <= end)
+			BUG_ON(reg->size == 0);
+		total_mem = total_mem + reg->size;
 	}
-	BUG_ON(mem_size == 0);
+
+	/*
+	 * Remove memblock from the end of usable area to the
+	 * end of region
+	 */
+	mem_size = min(total_mem, (phys_addr_t)-PAGE_OFFSET);
+	if (mem_start + mem_size < end)
+		memblock_remove(mem_start + mem_size,
+				end - mem_start - mem_size);
 
 	/* Reserve from the start of the kernel to the end of the kernel */
 	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
