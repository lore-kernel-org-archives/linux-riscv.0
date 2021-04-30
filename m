Return-Path: <SRS0=p8lL=J3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E43BDC433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Apr 2021 07:57:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 948AA6145A
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Apr 2021 07:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 948AA6145A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tBDm4Vlx0JY/Q5eis3R/1X5OYUQSecMxGgONd1zy5zI=; b=XqL85n38bL7E4XMJLIgKXUNUy
	9H2ymgWfu5Tcwa4ItD3GtLnBDIft82/vYFO1KXLdVvW2W2Vrux9K/UmcU9RNvIqjK3riQfEFEFihg
	nePtSkwTbRwFyRekP813zkcKLbipoPscEmXAsn8JX2k51IKBCv7QlYh3ijTb9B/Aec4NxcLqkZSoY
	2Sp85mff0Z4Mv7KHQasHrp+3tfpvzzNgxGuBh1tl6SlpO8U0Qtt3DQNHgOEcF9ZvrADYHY4pXnCTe
	161H+GygVdvz6Ir2BCbRODloeajervv7XhyNHFVesZ4RuFsBAUhUmE/XHLKCD/1OVsFn8tG8sYPj1
	DLFh9RIyw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcO12-007Svy-Sj; Fri, 30 Apr 2021 07:56:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcO0x-007Suu-P9
 for linux-riscv@desiato.infradead.org; Fri, 30 Apr 2021 07:56:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
 :Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=vfGssGB9eFRKXmPsFL0dyP7FAbvhKa2jy/g3CZDNuK8=; b=0NuFeqA2pZP8bCY979z8pzo9T0
 RwWaeR7PS7KHQLWNDzbolX3Z52+k02Lffq9DxmXnr27ITvc7SOcNsXMLrMLamkkRjhzrc6ZJFiVSQ
 6SUejnPrss+EGLY0g80GehBwx1uSJKabBpsyCmqv48MD0fe3dQaPScIyjUql30EYygRrhpRXhU/zB
 OFWqy7jKHtCl6lXT/woQ8h81UW6zzSIPaDCdg1Xk63s6L9GKrZlJ2c57db57LQODYw1rFDfPY5KNO
 lVxo2tC+Oxv9dLOlNBuZ6s84RMQIoau4E5F0QKmaX3j2NYkaKJ9IYxpjQGEj87vJ+sYJGJTVrgu5Z
 JQ4VXbKw==;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcO0u-001DWU-PC
 for linux-riscv@lists.infradead.org; Fri, 30 Apr 2021 07:56:42 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FWl4T18j5zBtLk;
 Fri, 30 Apr 2021 15:54:01 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.498.0; Fri, 30 Apr 2021
 15:56:22 +0800
From: Nanyong Sun <sunnanyong@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <palmerdabbelt@google.com>, <atish.patra@wdc.com>,
 <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>
Subject: [PATCH -next 3/4] riscv: mm: add param stride for
 __sbi_tlb_flush_range
Date: Fri, 30 Apr 2021 16:28:49 +0800
Message-ID: <20210430082850.462609-4-sunnanyong@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430082850.462609-1-sunnanyong@huawei.com>
References: <20210430082850.462609-1-sunnanyong@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_005641_007592_3BC9431C 
X-CRM114-Status: GOOD (  11.12  )
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

Add a parameter: stride for __sbi_tlb_flush_range(),
represent the page stride between the address of start and end.
Normally, the stride is PAGE_SIZE, and when flush huge page
address, the stride can be the huge page size such as:PMD_SIZE,
then it only need to flush one tlb entry if the address range
within PMD_SIZE.

Signed-off-by: Nanyong Sun <sunnanyong@huawei.com>
---
 arch/riscv/mm/tlbflush.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 720b443c4..382781abf 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -15,7 +15,7 @@ void flush_tlb_all(void)
  * Kernel may panic if cmask is NULL.
  */
 static void __sbi_tlb_flush_range(struct cpumask *cmask, unsigned long start,
-				  unsigned long size)
+				  unsigned long size, unsigned long stride)
 {
 	struct cpumask hmask;
 	unsigned int cpuid;
@@ -27,7 +27,7 @@ static void __sbi_tlb_flush_range(struct cpumask *cmask, unsigned long start,
 
 	if (cpumask_any_but(cmask, cpuid) >= nr_cpu_ids) {
 		/* local cpu is the only cpu present in cpumask */
-		if (size <= PAGE_SIZE)
+		if (size <= stride)
 			local_flush_tlb_page(start);
 		else
 			local_flush_tlb_all();
@@ -41,16 +41,16 @@ static void __sbi_tlb_flush_range(struct cpumask *cmask, unsigned long start,
 
 void flush_tlb_mm(struct mm_struct *mm)
 {
-	__sbi_tlb_flush_range(mm_cpumask(mm), 0, -1);
+	__sbi_tlb_flush_range(mm_cpumask(mm), 0, -1, PAGE_SIZE);
 }
 
 void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 {
-	__sbi_tlb_flush_range(mm_cpumask(vma->vm_mm), addr, PAGE_SIZE);
+	__sbi_tlb_flush_range(mm_cpumask(vma->vm_mm), addr, PAGE_SIZE, PAGE_SIZE);
 }
 
 void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 		     unsigned long end)
 {
-	__sbi_tlb_flush_range(mm_cpumask(vma->vm_mm), start, end - start);
+	__sbi_tlb_flush_range(mm_cpumask(vma->vm_mm), start, end - start, PAGE_SIZE);
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
