Return-Path: <SRS0=n1sQ=GK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40B4C433DB
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jan 2021 09:27:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EC532312E
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jan 2021 09:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EC532312E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IgBvbEsTa8hyOWw5o32lyuH0SnG5LR9lUKFhhedjih8=; b=IRe8xpoMY/Ss9Hm8Gr2bwB/ZA
	DM6HW4hAqKcuwbuk6ydhrJx4HT8mAHz+Jz3pbRXjSuzAQbCKIyTVfWZ2adl2gqlA9FbvVMb/k9fWR
	jU1A6KTok/CBWzfxcH6WpEnPQz7IAKGfKyynWcoaYL3FiQkNA2jTUXaEkGXy178yRpHJg4D+ZBzkx
	Sm6IG4p+6fKZ40AJUL1beziclJsZ1SnMM7RXjgzBAQMoB2Cpmna/3l9fa/6BWbzANDaRmTE0GP673
	06KNFVeO5oi4b+jd99HUJ+W50QHaYe5UTxlFofkJ11KXBo4xbKJBJ6JaAQSBVsn/0K8VB3QHJwz4X
	r7bMlciTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxRZx-0001B0-Sx; Thu, 07 Jan 2021 09:27:37 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxRZu-00019E-I9
 for linux-riscv@lists.infradead.org; Thu, 07 Jan 2021 09:27:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610011654; x=1641547654;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M5vIqNGUKsHMdFcPSrix1DQ77zV4rtwvAiAcgNpAPDw=;
 b=gJQE6mpP94AX8nv1/ajwpi7kevPgrgvHiWbX1TFYPaKd2q+LkuI/bfgA
 PauPKchT1V8gIJQBoAZObU44HOOlDfEhH1SZmRpQhsF6H/qrEKdDem3de
 cwc+eREFb9Smme4OhJOXa9sWZhvCF/zFlmMO0Ut0eZNqmAz70Iitv8wUi
 xTIuPa9/FhHDhOJMQ8rS+plO6DiapSvn4WQvwxCBg5WBbG34ife1KFUZt
 0cwDVcpMbEWVAuaaXuiYBpL+Sbbd6v/SuSvwqJvIE/a7N7lsW5Ev7duXL
 jcBILf5c9vDE7RKgG9CflTpeG5/egqcqLquweGVPaqgSeR/C2L3iT6gT3 A==;
IronPort-SDR: wPz4hJmsGXcZmwuUkPmvMANlqEVETm09oh0jYxNw6mLk8ng2Ug48RdnpuzG0T1GA6SCEbTiTB/
 +2Ghj7zeZu63vVOsQkIfS36xKXyvNuRatx1DALpWAsTcHcSrR4z9z74mUwNP7xg/F4NAsUbBJu
 +kWOpJLogfLwzgEITHCIHyqdleKZurV3E/v8tyDSreUmoifI0GXYhXENwr7gVGg9vM2+oQh6ic
 9SavNiy92WtAV8I9SiCwgEmYNzNrsnlYB1d3BNhAujJVHvTYJ3dIBv9Ra1hVe806+dvnBKL6mF
 D44=
X-IronPort-AV: E=Sophos;i="5.79,329,1602518400"; d="scan'208";a="156751190"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Jan 2021 17:27:29 +0800
IronPort-SDR: vmHDqPvXREUfAIHK5Shl6vrcGAghKE4Q3cH5K7Sf+cZ9E3oYiEXub4pKG8GlUE7s7bHBflWSsU
 lH8hDkxJNIQEW1FuTc9b2xoKN94fzNyW8+wM0RtrlkfxvmgWDrob8QoiCTUm1LkgKHOwaRvlVU
 fJ+s2udLzzRzE+gKPsgVsxfrW2mSZlKoBbwghuezDilv7lLajkW5w/ujg+PCHPPqaGhV5hBC1U
 9orGM5OUBRx7CJTTo0QfURUDBjU/JHMwVZsnH6oeorG2iNx98OQsfsrNYLEAq7L/tJpbMxch8d
 79MjA112lnib7Nosz8tQSlY+
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2021 01:12:21 -0800
IronPort-SDR: zSv8gBFiIWRny6FjEV8Yh1InJHxQN7lciB7TEACKijT9oMMn4Tl9SSMq5naYBX+V7UCT6WEv2Z
 Z0HeSBhGLtYefyMzDZTigNYRqc24ppYws+x8SVISbFqIGpR2ntO6AHRB9EO/DH5K3UBXbjRkuT
 OoVJlsGpCksgX/BTluFubRa2KIe+HQqnMAa7p0tc9+bYi44CrVIeSwrk9W0umSP8hRnCF0Nbmd
 xpNy9jsRxwfU81LaiCOHwItEbAvCdjq2sd1f8hHe76owjXGvF577atF8HZs5h5i9J0qhY07Jee
 1jw=
WDCIronportException: Internal
Received: from usa002483.ad.shared (HELO jedi-01.hgst.com) ([10.86.62.136])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jan 2021 01:27:29 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] RISC-V: Set current memblock limit
Date: Thu,  7 Jan 2021 01:26:50 -0800
Message-Id: <20210107092652.3438696-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107092652.3438696-1-atish.patra@wdc.com>
References: <20210107092652.3438696-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_042734_732874_700213B0 
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
 linux-riscv@lists.infradead.org, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Nick Kossifidis <mick@ics.forth.gr>, Andrew Morton <akpm@linux-foundation.org>,
 Ard Biesheuvel <ardb@kernel.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, linux kernel can not use last 4k bytes of addressable space because
IS_ERR_VALUE macro treats those as an error. This will be an issue for RV32
as any memblock allocator potentially allocate chunk of memory from the end
of DRAM (2GB) leading bad address error even though the address was technically
valid.

Fix this issue by limiting the memblock if available memory spans the entire
address space.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/mm/init.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index bf5379135e39..da53902ef0fc 100644
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
+	phys_addr_t max_mapped_addr = __pa(PHYS_ADDR_MAX);
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
