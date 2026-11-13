Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247E2606BD90
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 07:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0pqzSkdw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=j9+Fd3+Hr9bJjRGWam9XvVgrfEfqBuGgv0ZtvW2l1tI=; b=0pqzSkdwTc6r7H9tRu6ETSpnWQ
	zwlexLGWWfXG1pm9Nbz2ezz8fGPChShBncoQ9gA7JY8WvmeGG2i04sckPrq12+Vo36pDQPKkcenRM
	lkSUXvVeU/gPUvG0d2s2fcQZodTsepnNGiTEjwyn3rDptHtzEEAxRwXbp/AckElYrfrZds6bxodxv
	Xdoi+d2dkLMfa0IKjtAU5bKQwTru930h0/Tb0KQnJ2Myohm1o9y+d75V53vZdevHMdj6J1byBKHHw
	zI/DQYGK7k6MiC6fpp3qTtcKe/CYg3gghFXRcoD4f+fnXadm5O659Smj6K9MXYjOjdf4Z65Rtsbx3
	A23tje/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlUB-0000000Br2k-3Gyo;
	Fri, 13 Nov 2026 07:14:11 +0000
Received: from atcsqr.andestech.com ([220.128.198.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlTt-0000000Bqt7-2WwE
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 07:14:08 +0000
Received: from mail.andestech.com (atcpcs53.andestech.com [10.0.1.153])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CU7G059150
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 15:12:30 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs53.andestech.com
 (10.0.1.153) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 13 Nov
 2026 15:12:30 +0800
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
Subject: [PATCH v2 16/19] riscv: errata: andes: allow ERRATA_ANDES_CMO on all Andes SoCs
Date: Fri, 13 Nov 2026 15:11:40 +0800
Message-ID: <20261113071143.1446167-17-minachou@andestech.com>
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
X-MAIL: Atcsqr.andestech.com 6AD7CU7G059150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_231354_548170_D6770550 
X-CRM114-Status: GOOD (  11.25  )
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

ERRATA_ANDES_CMO depends on ARCH_R9A07G043, so it can only be enabled
for the Renesas RZ/Five, although other Andes SoCs such as those built
on the A27L2 need it too. Drop the dependency, and select
ANDES_LLCACHE and CACHEMAINT_FOR_DMA so that the errata always comes
with its cache driver, which ARCH_R9A07G043 used to guarantee.

As ERRATA_ANDES_CMO is default y, it is now also enabled in the generic
riscv defconfig. The errata only acts on Andes cores at boot, so other
platforms are not affected.

RZ/Five still gets uncached memory for coherent DMA allocations from the
DMA_GLOBAL_POOL that ARCH_R9A07G043 selects. This patch only covers
cache maintenance for streaming DMA; how other platforms provide uncached
memory stays platform specific.

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 arch/riscv/Kconfig.errata | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 4f77b3c6d7fd..3c43e065aa01 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -12,7 +12,9 @@ config ERRATA_ANDES
 
 config ERRATA_ANDES_CMO
 	bool "Apply Andes cache management errata"
-	depends on ERRATA_ANDES && ARCH_R9A07G043
+	depends on ERRATA_ANDES
+	select ANDES_LLCACHE
+	select CACHEMAINT_FOR_DMA
 	select RISCV_DMA_NONCOHERENT
 	default y
 	help
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
