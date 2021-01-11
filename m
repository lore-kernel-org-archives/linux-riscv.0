Return-Path: <SRS0=44w3=GO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B031C433E6
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 23:45:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3151322D0B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 23:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3151322D0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8UM4XB29gbYuHUbLpaKcw2dZqOaHCkV9YnEw7hW4e9o=; b=ppoLUtpRysTP79kFN4J38QQF9
	pheBAxrTpH+SaCezgzrXoG/UWRDNG+/XopFU0ATaY44sMTPIhFUiPjDlF4Mqpe0U6uVphvah1xx70
	/xcoG2AX79hBbQfXeFjaepru6UjvA8ZaBEuuGt8h8BGh33tX0hlqkIuB14SfxHrnFzHg27SMcglZ/
	x+UbUWvC9l5Z1GYHETtPATC34pqIAUdbPkOksgv64QSaDkBv0+/EZsV0FMh+NvysB+ZBiVoaYI1TF
	DgqCH2bQBElrhn6bQe1zLThkb+cwR91ZSMGvGo9nenLvCENIb63f+jHL9wdsA9/LIcaDTh/6cijNx
	C4A3+ehoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz6sO-0002NS-D7; Mon, 11 Jan 2021 23:45:32 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz6sI-0002KC-6X
 for linux-riscv@lists.infradead.org; Mon, 11 Jan 2021 23:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610408726; x=1641944726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Io1Pp7bw+RC8AMMDpe1YABzZYAEHgEO0leECzsL7CUo=;
 b=Qdi/y0RW1ZJ8cRcCwC93rUrShTvJFYcSuGgCeMQles8u4TFvmpHAjvWH
 stfznQF6AmjUZhvysze9ZX1VEr9WGg+n7Yd465J9Qe+hQPU1YJew2T6HE
 bAiMB0OGrbetZxDufMNdf+giuNI1nRG312pndQzcSJT2cHWC1h8eVVQLV
 33SbAYWehGW6Y+7o2d12N9iY8FGxBsSuW0FXmUm6VSizI+ahPNdcZV/zd
 Pg7mxCZz3V5mpoJkDrlCdIv/fY/qFW+X9Vf9vnWFw0gq1gqZIY4dsrZ+u
 ruqcyT+AqbwqDA8Zq5afmJidVdOAxu+kDY1+VZcWzfjD7t4U7qBDSUwYW A==;
IronPort-SDR: 90oDX7/ov4pgOTZ+tq93OdfzTrMrQXWbDXpCi04Z0yCJihvNgYxqAYn+femwfNi+wGD5QctzZm
 kYJ9wNPkXNhZw9dkYpFB3DXjnFF8D+2wpcaZctg038DUi7begzXlE5CvfCKlZrzG6a04xEHPHr
 bKlcs6wkDALAfBxbHd9lYkUo0sUgXSClPLd55AhbtJ6+ZRjKqO83D1Dy2qf80CyvFMcogsWaSD
 A8sAQJnXN5MjJTSKO31mOk4eaUYyu5Em7U3LJlrCOiVq/UgS+gpvqWY5CpKU64u6uRdLVbkQkh
 8+0=
X-IronPort-AV: E=Sophos;i="5.79,339,1602518400"; d="scan'208";a="161629289"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Jan 2021 07:45:20 +0800
IronPort-SDR: O9WdicAzbw0SKhu8RLpYpaUzTZv0PyOIDm/G7HLVbHp5Gb9EDvGlcnOGM7k/RrEFkVPTISGt+I
 MwtoM0RwgHD4YgL2oMEVKOXhMxBCkuI749MBTFVuLvB2g+r27WWyJJRM3u6ro5bAmHhjCfHJXv
 FHUxOcCZd7Qi8VArQLSJzicS9hZ2j2njIKB1KN7rmazj9hiVskGJHLBpUmoliNybnZdK4apEpz
 UiUL5Pg/AEhodYH4NnGbhh1BTeEYByBg+gZTmqCdtTtkUzdkoSePZi31R00fRzNe0taDtPmm/l
 b86ziH9l0wQm4ESWDv1Pb3s9
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 15:30:06 -0800
IronPort-SDR: ox38t4igJU0HZ0yuKw/XhjcfplepASAM4Swjrpnp6n6vw7ZypirIWOtHz0UmDIdPF9RtAITyO8
 +hBx6NYdR/CaTPR+Gi11KbHw+YZQVRLWaKSeqGuFNX1YVm8W83SIb+sqUEEInb0H0nD/HoecjS
 MTEYF2NATdI4+nLTlJ2MC3WJprR4XaR7eYkiHc6zB2UsP/WdwzKhFTW99qt7w/4uXOX6gdewmG
 XuDPYwEfN7zQw1X5o2WM1P8ofysAfLWfH6GJKsBBpIbSWBLCDgzsZdWfJv+ohqqh8wHzXY2VwG
 W/Y=
WDCIronportException: Internal
Received: from usa002483.ad.shared (HELO jedi-01.hgst.com) ([10.86.62.194])
 by uls-op-cesaip02.wdc.com with ESMTP; 11 Jan 2021 15:45:20 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] RISC-V: Set current memblock limit
Date: Mon, 11 Jan 2021 15:45:02 -0800
Message-Id: <20210111234504.3782179-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111234504.3782179-1-atish.patra@wdc.com>
References: <20210111234504.3782179-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_184526_387538_DFD02BE7 
X-CRM114-Status: GOOD (  16.12  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, linux kernel can not use last 4k bytes of addressable space
because IS_ERR_VALUE macro treats those as an error. This will be an issue
for RV32 as any memblock allocator potentially allocate chunk of memory
from the end of DRAM (2GB) leading bad address error even though the
address was technically valid.

Fix this issue by limiting the memblock if available memory spans the
entire address space.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/mm/init.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index bf5379135e39..7cd4993f4ff2 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -157,9 +157,10 @@ static void __init setup_initrd(void)
 void __init setup_bootmem(void)
 {
 	phys_addr_t mem_start = 0;
-	phys_addr_t start, end = 0;
+	phys_addr_t start, dram_end, end = 0;
 	phys_addr_t vmlinux_end = __pa_symbol(&_end);
 	phys_addr_t vmlinux_start = __pa_symbol(&_start);
+	phys_addr_t max_mapped_addr = __pa(~(ulong)0);
 	u64 i;
 
 	/* Find the memory region containing the kernel */
@@ -181,7 +182,18 @@ void __init setup_bootmem(void)
 	/* Reserve from the start of the kernel to the end of the kernel */
 	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
 
-	max_pfn = PFN_DOWN(memblock_end_of_DRAM());
+	dram_end = memblock_end_of_DRAM();
+
+	/*
+	 * memblock allocator is not aware of the fact that last 4K bytes of
+	 * the addressable memory can not be mapped because of IS_ERR_VALUE
+	 * macro. Make sure that last 4k bytes are not usable by memblock
+	 * if end of dram is equal to maximum addressable memory.
+	 */
+	if (max_mapped_addr == (dram_end - 1))
+		memblock_set_current_limit(max_mapped_addr - 4096);
+
+	max_pfn = PFN_DOWN(dram_end);
 	max_low_pfn = max_pfn;
 	dma32_phys_limit = min(4UL * SZ_1G, (unsigned long)PFN_PHYS(max_low_pfn));
 	set_max_mapnr(max_low_pfn);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
