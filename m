Return-Path: <SRS0=wYeJ=CV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF142C433E2
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Sep 2020 01:35:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 688E1221EB
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Sep 2020 01:35:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EmeHaxod";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="G5e883Rb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 688E1221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H4DDdHHmfVKikmhj48rP4FJ3RY1THzKH9CxGi/ayIWY=; b=EmeHaxodH5qWSrBfyU2v3PHui
	izxrsPFnmGm8Fcsz8QEtZpDJVXM7vAvZ0W4DU/qyXwGib2W9nHUuvm81fcZuWc7W0mP04ClTojWTd
	/vQLCtEYC8CoaXV3qheAcUVp0p4Y2KlgRbYsum291SlZ1LP3G0QBN8uaQQYsA4zHw1+GNpV+k1g00
	PDNPbisUmF8a+UDJucnSbYgkplCSrYxZFlUt9/Y6h4bIBEBYRseYDTf7VTl2m/X/YNW98tGy0cLKb
	4IJRZbDNNdFvD72iwDEKU45ciU+DQge67a6HiRGFLlLQpqpPPAokF7h7PpjhpiL8ZdQtiHv5qrY49
	jvW1sAg4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGuRH-0003wP-Pz; Sat, 12 Sep 2020 01:34:51 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGuRE-0003tr-FC
 for linux-riscv@lists.infradead.org; Sat, 12 Sep 2020 01:34:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1599874488; x=1631410488;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VNduA903hGAtFKvfx1wBqQc81Up09t3m8usKMGKsctI=;
 b=G5e883Rb1tLbR5r0zZbivxbGWnwWQQ4j3Bsa4TWb4UZjsL4FTEHOr5/U
 pzS9UJtkhWFz5ukazlgtB1nflKrmifdhDIQRE0ZPoRxWpXSfXfmGwKIWq
 9YeVTohUV4y3nojAdTlLmJP9wpdMFhyMQNEXs48sZTVaypgKb23sNInQH
 2sEUsvGwjumTZJTFVH2LyOswJQarxC7rWwdqvN8eCqsw1nyQGJqolG+dk
 PqiCnMAggLz4Xao+BK/mpkhxaUM9neIORnBlZXI721RYury4inJ8zaWuj
 lW7CWqZPHd2s+KBL8GtMd6IIFFbcF+P+UOXTHvCyPThK6mXqQ7Pt2jB4c Q==;
IronPort-SDR: Jzc3Xkkr3cRxdwBHTB8IcDlpJw9jtw+4zKinekMsXs1t2VcRsCPX2MjgOeZtTyiUqUeS4D6sNh
 xNu9D/bNCT/N5TWxwZjvzHDUfuKFW4pezJociq7oNYW1YK3bU/QuFYsy+gS85T7Ust7lfMAo5a
 KsZrf6oXHjkngX5yqEHvtFkKo4vKbVtd3n7Vc0dREdPQ8//KiuAEcK/Kkr++663fBWg6KoHYhO
 u8pnT5SoziVcgrERWaKEbGZhTCurWmbKcO4zKTWa9BkflWddLZt9r8VBcGCq754dAp41fyW0MM
 RtE=
X-IronPort-AV: E=Sophos;i="5.76,418,1592841600"; d="scan'208";a="256787993"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Sep 2020 09:34:47 +0800
IronPort-SDR: xIaLf4yH2KENCmRKWJwl02KlzgepbMV/8Xi/6AegBL2MOEIQ7dUmUA9EDiI2U2NtyOurooNK2R
 71LGCapXmo7w==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2020 18:21:08 -0700
IronPort-SDR: S0TF4y2bRre0PH+ek52/0KgHP3FiKK6o2STFMwSadOxbMTmksba5IZhyDYDIzis6lyZIdNa73o
 SqpXVaOEtYvg==
WDCIronportException: Internal
Received: from unknown (HELO jedi-01.hgst.com) ([10.86.59.229])
 by uls-op-cesaip02.wdc.com with ESMTP; 11 Sep 2020 18:34:46 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC/RFT PATCH v2 3/5] riscv: Separate memory init from paging init
Date: Fri, 11 Sep 2020 18:34:39 -0700
Message-Id: <20200912013441.9730-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200912013441.9730-1-atish.patra@wdc.com>
References: <20200912013441.9730-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_213448_714802_A2023CC1 
X-CRM114-Status: GOOD (  14.80  )
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
Cc: David Hildenbrand <david@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Atish Patra <atish.patra@wdc.com>, Zong Li <zong.li@sifive.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, Jia He <justin.he@arm.com>,
 Anup Patel <anup@brainfault.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Steven Price <steven.price@arm.com>, Bjorn Helgaas <helgaas@kernel.org>,
 Greentime Hu <greentime.hu@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, we perform some memory init functions in paging init. But,
that will be an issue for NUMA support where DT needs to be flattened
before numa initialization and memblock_present can only be called
after numa initialization.

Move memory initialization related functions to a separate function.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/pgtable.h | 1 +
 arch/riscv/kernel/setup.c        | 1 +
 arch/riscv/mm/init.c             | 6 +++++-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index eaea1f717010..515b42f98d34 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -466,6 +466,7 @@ static inline void __kernel_map_pages(struct page *page, int numpages, int enabl
 extern void *dtb_early_va;
 void setup_bootmem(void);
 void paging_init(void);
+void misc_mem_init(void);
 
 #define FIRST_USER_ADDRESS  0
 
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 2c6dd329312b..07fa6d13367e 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -78,6 +78,7 @@ void __init setup_arch(char **cmdline_p)
 #else
 	unflatten_device_tree();
 #endif
+	misc_mem_init();
 
 #ifdef CONFIG_SWIOTLB
 	swiotlb_init(1);
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 188281fc2816..8f31a5428ce4 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -568,8 +568,12 @@ static void __init resource_init(void)
 void __init paging_init(void)
 {
 	setup_vm_final();
-	sparse_init();
 	setup_zero_page();
+}
+
+void __init misc_mem_init(void)
+{
+	sparse_init();
 	zone_sizes_init();
 	resource_init();
 }
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
