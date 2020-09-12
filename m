Return-Path: <SRS0=wYeJ=CV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D75DBC433E2
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Sep 2020 00:24:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F135E221E3
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Sep 2020 00:24:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ANcqenNn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Q3xu/fR8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F135E221E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cpoFROULG0yIEPk2t/IpTh/i6ZaCT6nVS6CnsuhcAbM=; b=ANcqenNnJH/+2IyOuzkXXsU0Vv
	54rPkpQRCnzCIOoVUS0CMejWlpbifd51EXu83DFMJ5MdC5QrEZfT6Izm9NCs2tFM1HaZANY6a8E5j
	6AWKJIRGSu/Lkul+ei5vI9AT6X6vhlSYZBDfDRH4TT/19s+f/Vfqf246IrEud2PCibnQToyIGfIdj
	qCFrtiiPsZ9mOobF93iYypq4bj867148RRzqqiUq5lNg8G1TfmfO1euBswto+XF9k2KtbAe8rS9ku
	WJuzHi8VmQi4lMVXTw39qo3OM1Gp93wvi7sZ9x5ST7DiGcTbh6tX/wdz5dBV6SC9Nip3PWQR/u2Kn
	qOrYT9dA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGtKY-0008D7-2W; Sat, 12 Sep 2020 00:23:50 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGtKV-0008Co-Eh
 for linux-riscv@lists.infradead.org; Sat, 12 Sep 2020 00:23:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1599870227; x=1631406227;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/hsea2x47F0MN5xVlvN7uaRSxJBMCY8XyO44RdpLtjI=;
 b=Q3xu/fR8yfvPSZ0xtqIjKGJMv0La5ymMlM2LQ2osfvASzvdTjEtKEb7m
 3OTmE5eVS60ORXIkdaeO3No7uJBXnKl96/KG4NXXTUc0iiE0zb8Lr1YFj
 sKZZuQmJZfyyctrnd166vde1OenwRCH38AvnEabeuxNiKkWRQmq9IjCPt
 z1lQf3ekARRFStOfIgFzudtwNYYUmDYpq11jq5Id8NHuEhSgVDVoEztrF
 A1qBa/CRqDJmJuQjS0F+ao/I0KLTodzTTd1rtt2KPRDY0k0utKvnL89DY
 TMHa2hagBsy4Oy0KUmXVB/LTN7wLgeAF3yWSzkSZ0VAmQezx9SdXu8/IG g==;
IronPort-SDR: 9Rt491RJQOLbnXzDRABJfJ2WPoaDWt2pK9OHttDoyjuKeoDM002+hoA82qJHM1eT7sY+/9fQ+Q
 sotpqzravtiNwalNQY6ic+9UdFd7KkgwnSr6aj9k8+W5YD8zvY7GiTQr/eMUm0gFi7GLKyVxwe
 lSWJPUPgIlBdeLVR7QwBu5h32kMhEKdwqNleTAGf6JfMrVByHdnc5gpObdFtGpP7DmVErr0NJb
 a/t6oqsng6ylbuUWN5/qFucQz4zf0V3uXUvg6m0lRl5WdfVJGKA74Gsny4Ttm4tysbKNm3qQGf
 ooI=
X-IronPort-AV: E=Sophos;i="5.76,418,1592841600"; d="scan'208";a="148407742"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Sep 2020 08:23:44 +0800
IronPort-SDR: oFTtDQDhe/mFhMSJ568EIL0YYkM2O7zAoGdsedbe84L0MihO20XSluCigrDj7k9OYdcGwxCGKY
 qNjWN72Qieww==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2020 17:10:04 -0700
IronPort-SDR: AyWggxGakAL0OV49dIZqCueRDcobwmAd0LGIlkqV8w1WCFzOuTkNrgG2qsCRYMQvV0pYvpGeca
 x3D9x7AmYBQw==
WDCIronportException: Internal
Received: from unknown (HELO jedi-01.hgst.com) ([10.86.59.229])
 by uls-op-cesaip02.wdc.com with ESMTP; 11 Sep 2020 17:23:43 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: Consider sparse memory while removing unusable memory
Date: Fri, 11 Sep 2020 17:23:41 -0700
Message-Id: <20200912002341.4869-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_202347_678265_0ED8EC2D 
X-CRM114-Status: GOOD (  15.72  )
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
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, any usable memory area beyond page_offset is removed by adding the
memory sizes from each memblock. That may not work for sparse memory
as memory regions can be very far apart resulting incorrect removal of some
usable memory.

Just use the start of the first memory block and the end of the last memory
block to compute the size of the total memory that can be used.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/mm/init.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 787c75f751a5..188281fc2816 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -147,7 +147,6 @@ void __init setup_bootmem(void)
 {
 	struct memblock_region *reg;
 	phys_addr_t mem_size = 0;
-	phys_addr_t total_mem = 0;
 	phys_addr_t mem_start, end = 0;
 	phys_addr_t vmlinux_end = __pa_symbol(&_end);
 	phys_addr_t vmlinux_start = __pa_symbol(&_start);
@@ -155,18 +154,17 @@ void __init setup_bootmem(void)
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
 	 * Remove memblock from the end of usable area to the
 	 * end of region
 	 */
-	mem_size = min(total_mem, (phys_addr_t)-PAGE_OFFSET);
+	mem_size = min(end - mem_start, (phys_addr_t)-PAGE_OFFSET);
 	if (mem_start + mem_size < end)
 		memblock_remove(mem_start + mem_size,
 				end - mem_start - mem_size);
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
