Return-Path: <SRS0=3sXM=4C=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F38C3B19F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 14 Feb 2020 15:34:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88D322467D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 14 Feb 2020 15:34:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WcnMecKL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88D322467D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=siemens.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:To:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Sk8qulBB48VBCjAV9WtWjZkN0tUyfJAz8rQUcFJ/wWE=; b=WcnMecKL5pmv3L
	ip9TALJv/JtHteeRSoO0MMO7UpsO7OgG1UNJjp+4S8XRZXLpMu6h+QE2GgpivBAmzElzGikxaAkFo
	2gkoZI5n+fwQwAX8vECOs/CsSCTiyjRwfEyT3qHIy3aEbIZFg2cvWWKbHc/xOLVSoejeltcJegdIE
	lkkx9bdikSe34FTS+uGblkNL3GuSqakIz1axnhxPBxOi0cQI5LOYpoJbZ44ahK4Momzkjb4Ql5CvY
	KItzUWruRkfradf+Y1JsE8N2glqMBzbWtPzfKhtZ8Z6PTcuVPz/1uNvz2W3NbLbDGNi+pjTYMV8fT
	Vk2rWJMfXrKneXFH26gw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2cyg-00009O-ID; Fri, 14 Feb 2020 15:34:02 +0000
Received: from david.siemens.de ([192.35.17.14])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2cyd-000082-Bt
 for linux-riscv@lists.infradead.org; Fri, 14 Feb 2020 15:34:00 +0000
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
 by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 01EFXoue022931
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Feb 2020 16:33:50 +0100
Received: from [139.25.68.37] ([139.25.68.37])
 by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 01EFXnI9026125;
 Fri, 14 Feb 2020 16:33:49 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] riscv: Add support for mem=
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Message-ID: <899dc26e-aca5-0a81-ccb5-c0fda59503f0@siemens.com>
Date: Fri, 14 Feb 2020 16:33:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_073359_715503_B8F6FE3D 
X-CRM114-Status: GOOD (  11.41  )
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Jan Kiszka <jan.kiszka@siemens.com>

This sets a memory limit provided via mem= on the command line,
analogously to many other architectures.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 arch/riscv/mm/init.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 965a8cf4829c..09948e43741b 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -488,8 +488,26 @@ static inline void setup_vm_final(void)
 }
 #endif /* CONFIG_MMU */
 
+static phys_addr_t memory_limit = PHYS_ADDR_MAX;
+
+/*
+ * Limit the memory size that was specified via FDT.
+ */
+static int __init early_mem(char *p)
+{
+	if (!p)
+		return 1;
+
+	memory_limit = memparse(p, &p) & PAGE_MASK;
+	pr_notice("Memory limited to %lldMB\n", memory_limit >> 20);
+
+	return 0;
+}
+early_param("mem", early_mem);
+
 void __init paging_init(void)
 {
+	memblock_enforce_memory_limit(memory_limit);
 	setup_vm_final();
 	memblocks_present();
 	sparse_init();
-- 
2.16.4


-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

