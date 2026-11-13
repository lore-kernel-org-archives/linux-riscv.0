Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4A860A5BD2
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 07:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XhJbgF2e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=d23KT9Yx1TGHgvZgzByAeu7NBsPfo8OE2Upb1MINQQw=; b=XhJbgF2eRxbBL1LYvudAomXP74
	iUOwzSyQapla2zHc0TAcVN/Fn8VW85aGW5xmePCeD2PvQZYoIbvymD1IBm0HKEx2x2fRzGLzWfdOh
	9/vWDyNCsnl0qe/rjKaYqgtYdUHPrnu/2x5c8vo8AKvkvJA9mceApcBRahhfYeiUyEgDM03k2Ygmz
	N/pL8A0ZY+K49TVaSsONRNupmJN+xxE1Q/Ra7clH49V88BM8GlFwki+DEYqjxxEGeOgTsYtR/nlh0
	bQzMBCiHlDGL8Fmc4nDnYSfNkCAC2a/E1/Td+J7HdwxMBkpQ0Lkqth6e6QrFo6lesY2cY3vQj3cC8
	oRl9dNJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlTW-0000000Bqi6-0Zhz;
	Fri, 13 Nov 2026 07:13:30 +0000
Received: from atcsqr.andestech.com ([220.128.198.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlTN-0000000Bqdp-15nj
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 07:13:24 +0000
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CR5N059129
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 15:12:29 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 13 Nov
 2026 15:12:29 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Nov
 2026 15:12:29 +0800
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
Subject: [PATCH v2 11/19] cache: andes_llcache: use the hart ID to index the CCTL registers
Date: Fri, 13 Nov 2026 15:11:35 +0800
Message-ID: <20261113071143.1446167-12-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113071143.1446167-1-minachou@andestech.com>
References: <20261113071143.1446167-1-minachou@andestech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs55.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: Atcsqr.andestech.com 6AD7CR5N059129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_231321_659673_BFBD8AEB 
X-CRM114-Status: GOOD (  13.00  )
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

The LLC has a separate set of CCTL registers for each core, selected by
the hart ID of the core. The driver selects the set with
smp_processor_id(), which returns the logical CPU number, not the hart
ID.

The two numbers differ when some harts are not used by Linux, or when
Linux boots on a hart other than 0, as the boot hart is always CPU 0.
A CPU then issues its LLC operations through the registers of another
hart, which may be in use by that hart at the same time.

RZ/Five has a single core with hart ID 0, so the two numbers always
match there and the problem never showed up.

Convert the logical CPU number to the hart ID with
cpuid_to_hartid_map().

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 drivers/cache/andes_llcache.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/cache/andes_llcache.c b/drivers/cache/andes_llcache.c
index 80c55616ab10..9f8fa8964302 100644
--- a/drivers/cache/andes_llcache.c
+++ b/drivers/cache/andes_llcache.c
@@ -65,7 +65,7 @@ static void andes_cpu_cache_operation(unsigned long start, unsigned long end,
 {
 	unsigned long line_size = andes_priv.andes_cache_line_size;
 	void __iomem *base = andes_priv.llc_base;
-	int mhartid = smp_processor_id();
+	unsigned long hartid = cpuid_to_hartid_map(smp_processor_id());
 	phys_addr_t pa;
 
 	while (end > start) {
@@ -74,10 +74,10 @@ static void andes_cpu_cache_operation(unsigned long start, unsigned long end,
 
 		pa = virt_to_phys((void *)start);
 		/* The access line register is 64 bits; written lo-hi on RV32 */
-		writeq(pa, base + ANDES_LLC_REG_CCTL_ACC_OFFSET_BY_CORE(mhartid));
-		writel(llc_op, base + ANDES_LLC_REG_CCTL_CMD_OFFSET_BY_CORE(mhartid));
+		writeq(pa, base + ANDES_LLC_REG_CCTL_ACC_OFFSET_BY_CORE(hartid));
+		writel(llc_op, base + ANDES_LLC_REG_CCTL_CMD_OFFSET_BY_CORE(hartid));
 		while ((andes_cpu_llc_get_cctl_status() &
-			ANDES_LLC_CCTL_STATUS_MASK_BY_CORE(mhartid)) !=
+			ANDES_LLC_CCTL_STATUS_MASK_BY_CORE(hartid)) !=
 			ANDES_LLC_CCTL_STATUS_IDLE)
 			;
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
