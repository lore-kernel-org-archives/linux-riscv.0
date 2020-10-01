Return-Path: <SRS0=Vlvd=DI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2726C4727E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2020 19:06:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F4B1208A9
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2020 19:06:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uFoDqX1C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="T4cNPYIU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F4B1208A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KaiZQ3lpYTOK/7nJRw8ymuErJW+ZfOBgkLHbGePAOT4=; b=uFoDqX1CSt9+8nDATpdpld8Qq6
	MoNoSYKcAcGSnsBybjDfNW0aFvAbBCIZDkDfQR3QMlh8g35TgqzV7Cq8ffDBZZPuyvcV8sVTaLNfZ
	kTAQor/zNrPmjI8kID/1vupzMf6hmKvk2UxQWNoz1Qy2z/ofKyZHlu3xw/cnA5kahRmy2xoSrmb/G
	Hlsos6G36AaW4jO+ODu0MrAzJM92J2XljLv3AU3bLXd4hWy0dcneBwYGYCn/QpyNIBS5TJsEzJPe5
	SjIW9Muu/44VWsc/iAM0I7hw4q+itQ31oOR3MTd9/U8Ptj2clMVIA1hYT7hna9BKlaPQ875T0Emwn
	LEOX46Ug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kO3u2-0000da-RA; Thu, 01 Oct 2020 19:06:06 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kO3tx-0000bL-6B
 for linux-riscv@lists.infradead.org; Thu, 01 Oct 2020 19:06:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1601579161; x=1633115161;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ulQnabrQ3jIylqco3wGP6BdFDL6aVGXR3PWdQHcEP2w=;
 b=T4cNPYIU6FslIvFT7A9FuXZSFstMqCv8RUsa3pSuixDs89Q0876Cb5vm
 e//PB7jT6vHfYYn71QqW1xqMI3nWht7+Ks5fUMXz6QRvBdNHZTp9Vw//8
 +N17j4Rb3lFE6OiyGhC3tVRQ0amerLMcoiv7jI/zJ8q0X7Mc0pRGr2QWl
 sBRJmqud9MM/sWwXG5LtdBCozuh2ElJIFIkbP8ZLhn1GRUwUcweNAtY8y
 CVGoEWm6tNN69XBfA60ecxo/st4oJhr3Rp6T2oDvuvFTm9qQeMHWr5W2t
 T6K4NrFumOwfiizdFYVsMVXFz2Tf7xwCztfPQEtaQcHHC30ijeiB87ilw A==;
IronPort-SDR: wagIBM5mYBUxZ3z30o+fH1U22hcVAFaINzQN6oIOo/MC/brq7wOdLprCDBs3LuSJTVY4yQaLp1
 97bIGvHn8t3fcu9EmdCCj7EwV1r68oZTAM3EM6jMtr7H/zGX1Pke8N7vRNkoyZdlxhRBsBsOdM
 CZiRy5MzQeRE3U+rR6Hyx9kRX6n9W8zCeasxLQUH151YwluUjmvGFeY9LbdKO+FsxoNdJwkTGR
 hW0lxYb+kICsUOVlxY0oWE2TemiNGNY0yFIh6JUz0w7NWY0QpO+ik/PhH2Dj8LtdOBsPHXkG4a
 j+0=
X-IronPort-AV: E=Sophos;i="5.77,324,1596470400"; d="scan'208";a="148874678"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 02 Oct 2020 03:06:00 +0800
IronPort-SDR: orbVZwuLgP5i+azYz4PFZNJJpbxkZGru91vnBow0zVU4ugHcSEhmYQJNdrUTukg+owD0w4Xunv
 tNoJAZTBMpfA==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 11:52:51 -0700
IronPort-SDR: mvbPBDuJNTR0nqO9Lt8qZ/T52jy0A+M4P5lzYhD22tEfN/14+jnWpZRem5hTJzK89KUjTP6zXy
 4Tdxnni4PDFQ==
WDCIronportException: Internal
Received: from 30tyk72.ad.shared (HELO jedi-01.hgst.com) ([10.86.59.249])
 by uls-op-cesaip02.wdc.com with ESMTP; 01 Oct 2020 12:05:59 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3] RISC-V: Remove any memblock representing unusable memory
 area
Date: Thu,  1 Oct 2020 12:05:57 -0700
Message-Id: <20201001190557.2860741-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_150601_398164_16258F78 
X-CRM114-Status: GOOD (  14.87  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RISC-V limits the physical memory size by -PAGE_OFFSET. Any memory beyond
that size from DRAM start is unusable. Just remove any memblock pointing
to those memory region without worrying about computing the maximum size.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>

---
Changes from v2->v3
Updated comment as per Mike's suggestion.
---
 arch/riscv/mm/init.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index ca03762a3733..564e0be677b7 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -146,8 +146,6 @@ static phys_addr_t dtb_early_pa __initdata;
 void __init setup_bootmem(void)
 {
 	struct memblock_region *reg;
-	phys_addr_t mem_size = 0;
-	phys_addr_t total_mem = 0;
 	phys_addr_t mem_start, end = 0;
 	phys_addr_t vmlinux_end = __pa_symbol(&_end);
 	phys_addr_t vmlinux_start = __pa_symbol(&_start);
@@ -155,21 +153,18 @@ void __init setup_bootmem(void)
 	/* Find the memory region containing the kernel */
 	for_each_memblock(memory, reg) {
 		end = reg->base + reg->size;
-		if (!total_mem)
+		if (!mem_start)
 			mem_start = reg->base;
 		if (reg->base <= vmlinux_start && vmlinux_end <= end)
 			BUG_ON(reg->size == 0);
-		total_mem = total_mem + reg->size;
 	}
 
 	/*
-	 * Remove memblock from the end of usable area to the
-	 * end of region
+	 * The maximal physical memory size is -PAGE_OFFSET.
+	 * Make sure that any memory beyond mem_start + (-PAGE_OFFSET) is removed
+	 * as it is unusable by kernel.
 	 */
-	mem_size = min(total_mem, (phys_addr_t)-PAGE_OFFSET);
-	if (mem_start + mem_size < end)
-		memblock_remove(mem_start + mem_size,
-				end - mem_start - mem_size);
+	memblock_enforce_memory_limit(mem_start - PAGE_OFFSET);
 
 	/* Reserve from the start of the kernel to the end of the kernel */
 	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
