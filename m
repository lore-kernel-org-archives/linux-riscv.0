Return-Path: <SRS0=9SVT=C3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A2E6C43463
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2020 20:13:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 233A82074B
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2020 20:13:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LHkRLVJW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="IQJK7RZ8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 233A82074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4CfdMLcjj5WKzyuaFy0kOAu4Z1nquyuC3bqJcyKK42g=; b=LHkRLVJWoFOordui5bnJl1bYu
	796uwix+0QWf37WIN3rhAy3+R/l+oAw/LbobHAHNtiI+4CUEDomBZByXsbCrNbpZnK1F1BQ8f8VNf
	wP9HP58H2XOQ6d/U+I7eheXIRdlxXz7zCIy45kpPpYt+iX5lPzhcUhXRoFj37pUpDRzXDXRecesE5
	BATZadN50n43DL6OWfg1Br/v2JBcCB19H7orL46M0ImBp++gDr/rbd2jYQ0S1gByCkvbP86KDrMEZ
	MOOIDEjpBKBF3xAPT29p4bKGAhQu+UOQOZgU767DdHCJnGZKFDgBKfyIVBwBZcQkq/fU1lnH7A0d4
	iV65L9Dyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJMkn-0006n9-6I; Fri, 18 Sep 2020 20:13:09 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJMkW-0006hb-To; Fri, 18 Sep 2020 20:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1600459972; x=1631995972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/JpC2RlQXkAFbMviFPpL7wwSbtn1c0inpseLQKJmER4=;
 b=IQJK7RZ8qepGkvb+Hl2Ztn4qmuNttifwmQChLKwi5f23e/GbZ+0+e+rD
 PX3KGXFKza9IQAXrSCAbjlkH8saFHOUDH0P8tSD+q31ywjU4kr0F7oP3d
 4ei2XNLSVvd2UICKufAcVu8uXVFJC2G2llD0/LCXwP0rTfODN0yKzLj7x
 rRyjkXgnq9y94GV6NDo5IC5y+0N+7ocRH2BjPq9OAFwroUfyiz0C7Jzgc
 M9PYTbewmTd0vSXyXKjNhX5u9XFL8adzg+kNtYDRE296AE4fwwAyIaeLE
 yIA+WWspPiDvNHYA+4hw9gAjdl+hEKeg1BPOVQAbMYnJEMHo47fU4XwOD Q==;
IronPort-SDR: 58i8a+8Z7jn2Ognc2SO1E8Y4hrg67OA+8kb9SNHdCqErGg1TPVtQIcc4tUtoUoqfteOM09dJN5
 lLw8l0LEQB2Av43BaGucYSl+F3EMMk1VD+rKxgcYseWLSR7iQ2oYm/q9nBpjzGXT9EF8W1r+ne
 r7HGaKQAPqUBUyeQDRc220rqnlzDClfX3utn3FWefIjP4ABUIJs7CiruqAXipI0zbw7Cm2GzuH
 aLDIw9WvzAOJ53BdcZ/qkX5bO3iPOdGxLuB0EPMEvsKwyemrW7CozYG9xCfrTenC3sUHlJmxi3
 Pvc=
X-IronPort-AV: E=Sophos;i="5.77,274,1596470400"; d="scan'208";a="147671111"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Sep 2020 04:12:49 +0800
IronPort-SDR: U9+6dLBF37Qo9XaO7S6GqhEICQGmOLb0TBgR2DZipNYZpOX9Yxt6DrxUutVtkobfv7Q/pQaSoz
 FeO2zKsuPz8w==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 12:59:02 -0700
IronPort-SDR: kv/bf5NetVldKD0fDiHItkHDfa9EIyHqDySY3Um7OGsv8KjbV4jGrSk4u94L5mrZMnvb9iL7GY
 SmOxNdxICoLQ==
WDCIronportException: Internal
Received: from us3v3d262.ad.shared (HELO jedi-01.hgst.com) ([10.86.60.69])
 by uls-op-cesaip02.wdc.com with ESMTP; 18 Sep 2020 13:12:49 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFT PATCH v3 3/5] riscv: Separate memory init from paging init
Date: Fri, 18 Sep 2020 13:11:38 -0700
Message-Id: <20200918201140.3172284-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918201140.3172284-1-atish.patra@wdc.com>
References: <20200918201140.3172284-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_161253_090174_DC5CD061 
X-CRM114-Status: GOOD (  14.81  )
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
 linux-arch@vger.kernel.org, Anup Patel <anup@brainfault.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Steven Price <steven.price@arm.com>,
 Greentime Hu <greentime.hu@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org,
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
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
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
index ed6e83871112..114c3966aadb 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -565,8 +565,12 @@ static void __init resource_init(void)
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
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
