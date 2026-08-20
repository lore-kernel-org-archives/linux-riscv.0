Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB112C5DF82
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 06:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ibE61vrD4yehTIkRgWBNq+rEPp6Pz/SIrEpsvPM+79U=; b=2P45IQYbvsOfkS
	DIaSdzDkdgA9eb9gkXKMM2kZYE+RH6huTCNkTuiRZgAcE/7YBFoW2Jg220L9ESaod0AmIEU3Gx2Ef
	TxIi+c2xJ1BoyKVmUGXx4RAMDdMd+QRL+uJEV0WiWOuSx4tVUCZq//rVPGf6zEETHU+oKiq/4WVxK
	kKZ1jDllLnGKU8xvqYWi7ONN+mouG4bvX+vZ2Nt0bpVV6TJwIH4k4NIeMNtcvTayJsfBgi1DzFxe0
	hXLL9ghvY1jYSCYp1PFqpd9n37wbm+le50KKG5VL5YYB+zsD48KLdsP6igFMNZ5xNbJRw11UbsKp8
	3HwI0XulpfPJfT+Hru3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvy9-0000000Aug7-2gAM;
	Thu, 20 Aug 2026 06:09:41 +0000
Received: from atcsqr.andestech.com ([220.128.198.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvy5-0000000Auff-1v6o
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 06:09:39 +0000
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 67K68ujs096255
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Aug 2026 14:08:56 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.43; Thu, 20 Aug
 2026 14:08:56 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Aug
 2026 14:08:56 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: <stable@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin
	<sashal@kernel.org>,
        Alexandre Ghiti <alexghiti@rivosinc.com>,
        Palmer Dabbelt
	<palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou
	<aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>,
        "Ben
 Zong-You Xie" <ben717@andestech.com>
Subject: [PATCH 6.1.y] riscv: Don't use PGD entries for the linear mapping
Date: Thu, 20 Aug 2026 14:08:52 +0800
Message-ID: <20260820060852.1714595-1-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs55.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 67K68ujs096255
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_230937_856654_19063483 
X-CRM114-Status: GOOD (  13.40  )
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

From: Alexandre Ghiti <alexghiti@rivosinc.com>

commit 629db01c64ff6cea08fc61b52426362689ef8618 upstream.

Propagating changes at this level is cumbersome as we need to go through
all the page tables when that happens (either when changing the
permissions or when splitting the mapping).

Note that this prevents the use of 4MB mapping for sv32 and 1GB mapping for
sv39 in the linear mapping.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Link: https://lore.kernel.org/r/20231108075930.7157-2-alexghiti@rivosinc.com
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
[ Ben: Only backport the RV32 guard. 6.1.y can build the RV32 linear
mapping from PGD entries, and there is no splitting in __set_memory().
So a one-page permission change mutates 1024 pages.]
Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 arch/riscv/mm/init.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 72b3462babbf..7e6ea7f0cb68 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -666,8 +666,13 @@ void __init create_pgd_mapping(pgd_t *pgdp,
 
 static uintptr_t __init best_map_size(phys_addr_t base, phys_addr_t size)
 {
-	/* Upgrade to PMD_SIZE mappings whenever possible */
-	if ((base & (PMD_SIZE - 1)) || (size & (PMD_SIZE - 1)))
+	/*
+	 * Upgrade to PMD_SIZE mappings whenever possible. Not on 32-bit,
+	 * where PMD_SIZE == PGDIR_SIZE: such a mapping is a PGD leaf entry
+	 * that __set_memory() is unable to split.
+	 */
+	if (!IS_ENABLED(CONFIG_64BIT) ||
+	    (base & (PMD_SIZE - 1)) || (size & (PMD_SIZE - 1)))
 		return PAGE_SIZE;
 
 	return PMD_SIZE;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
