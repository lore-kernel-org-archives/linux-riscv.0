Return-Path: <SRS0=gb7b=AR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A047EC433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 17:26:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F2DF2070C
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 17:26:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="miZ4Kb7v";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Bny9zO8g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F2DF2070C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ijcEaKum8QWSScWucOnkc3EOVhyAG6GTBgw6FLdFFDs=; b=miZ4Kb7v4CI4hGfIvhNqQT1TF
	npXVpzhRLbb7/gVnA7GGzAMu/Uo9ymhDzenx6YT6GPSYmrNPhdUNvvraW4R7v+F/90Zplqr2gWqkN
	4kY5VDMt5NDO89KSikgLNnMt6N8GY3rwTmC/fg3lv6OckgCv5/3KlkEFW8I8LI3qUFJO+FInJ14b+
	Mdeyb4d/3M6b5k/RswLSTYxTetZYqTPVmpZ35BEavgq1C7xErI/Wyf/PovPeWlcU+j3rUWpUVHylb
	ea52sWgx2MP5qFRZ1EqnA23OlJoQe51DH13v71C+4lCv9xyvsy9iLaL5uSGbly2cMsktwFStCE2on
	hEbImtRQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsUtC-0002jc-Mx; Mon, 06 Jul 2020 17:26:46 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsUt2-0002Zt-Dg
 for linux-riscv@lists.infradead.org; Mon, 06 Jul 2020 17:26:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594056397; x=1625592397;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YBy5J4GUHkZ0slWQ+5rpmDzLOi4g2OFkey3S0ni3vEo=;
 b=Bny9zO8gDjvYj5aA/vs1IzKdnR0j2G2qRv9i6zbu+jHBbMsJ6HJ37Ivz
 cXZU+lFU8OyGMdCvKSF2ezyMnmGEPCiAxaKTu6ieb2MlYCj8M0SVwIEmV
 ZL5NgbDh+1xd2Kg7yT4wa+qiFE+DyYXBwqYbDUYWb3dGB4R4QupSqu9ZG
 Ib+M20V0h4hM8RSPVPXXWPXgD1lF7QV9zjR7VwQoWF6bdvyfXV+M85Ccz
 BjccuHlG5DpJOGyXphee4wFeryR3r74odmcj69mW7mW7ODe5XYjbnOgHc
 l+oQaERNRsTaywNb5luDKFVezkshEFyPQYfwct/iF6J75lSJ4atowxoWU Q==;
IronPort-SDR: ZUtXqegXqtFWYENK+hfzoO3rCoRg3BdPKZ66JHfIHr/1IlsBLxZ/vExBGvktnoxjPSEd+4ZD+9
 8PFbnqpDBT67Evka8mkd6VazpY5y2zBU7Dv3sRcZjNdw42hBrXCaLvBfKt50bxa2j3wcOGYCVy
 hCWoUuhNrtgMiP+8W6+zKl0BQHxC51FWbrJTorE7SLEAxdQG0uip5bfq4e714/0n5LjmLpxY3j
 YSG9PbxzV13UHcKTWk4/Nx2apEKSiqsQfAHAlhdx086ESWXP46iCQRzEC18rMy+xtL29DWC+wg
 V5I=
X-IronPort-AV: E=Sophos;i="5.75,320,1589212800"; d="scan'208";a="141930684"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Jul 2020 01:26:33 +0800
IronPort-SDR: q59hrGbCpHP5U8H8BtAak7R8DxkIYXMvKQ/BYEYk4TrrrUF+BKPSGJ5lnakUJY62TFLi6EKdQX
 1GswKygZX9VYXFXqlLWFIRtvQh5JZs7E4=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2020 10:15:13 -0700
IronPort-SDR: VTlm1Z5/SAZEFPfrVJo8CE7qDDYpBSCOWNrJGIMyzYAvnvv9cofETJc83FHruK4hWLEkD67X8x
 qpNsYOLyOR6A==
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO jedi-01.hgst.com) ([10.86.57.161])
 by uls-op-cesaip01.wdc.com with ESMTP; 06 Jul 2020 10:26:31 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 06/11] riscv: Parse all memory blocks to remove
 unusable memory
Date: Mon,  6 Jul 2020 10:26:04 -0700
Message-Id: <20200706172609.25965-7-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200706172609.25965-1-atish.patra@wdc.com>
References: <20200706172609.25965-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_132636_707644_53792EBF 
X-CRM114-Status: GOOD (  13.36  )
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
Cc: linux-efi@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>
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
index 4021706aef81..c5268fe6e6de 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -123,26 +123,29 @@ void __init setup_bootmem(void)
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
