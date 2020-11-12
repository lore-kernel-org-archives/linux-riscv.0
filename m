Return-Path: <SRS0=fdZL=ES=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C596FC2D0A3
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 06:44:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D9ED208FE
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 06:44:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="glf/XL4I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D9ED208FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ozz+t86Lt90pLjbxfSWJnEf8ssXydvfdJ89Lv7HBL+4=; b=glf/XL4IrtQwGjqfCQ4hP1tDnM
	noLPaXz8BPwAMaxaLeuGB1gWOMnbFfTw9yVS9EayalW9XJA5fpCYcA6o+LftKc3oyClE4W/1uJJeO
	XpFl9+lZdzNjsi6oHg0CkA9WrnhHIL1wR+kU9fRB6r24i9UFE1lMz+ER9LwFfxJq/FpKK6T3lfvy2
	Ip9QTVi/Hh0ItXRXn8XPanTFEv6gMK7OevPkEtmGhrULewr7EJuLZwo6THDeHrxSt36fWPVlF/sEY
	/Hr0eDEPqKGk/jO1mhk+C/niCWGI2ZMqMvddDRGv1ltmb3BYJIwEO/ispMV8h+yfR3Xm8oPhxT76B
	qZPOPmMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kd6L2-0002gI-Un; Thu, 12 Nov 2020 06:44:09 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kd6Kz-0002fS-4p
 for linux-riscv@lists.infradead.org; Thu, 12 Nov 2020 06:44:06 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CWsWR0qCbzkj6r;
 Thu, 12 Nov 2020 14:43:47 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Thu, 12 Nov 2020 14:43:49 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <linux-riscv@lists.infradead.org>
Subject: [PATCH] riscv: Fix W+X mapping warning
Date: Thu, 12 Nov 2020 14:48:55 +0800
Message-ID: <20201112064855.99578-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_014405_501541_D3979237 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

When boot with DEBUG_WX triggers the WX warning,
  riscv/mm: Found insecure W+X mapping at address ffffffe000000000/0xffffffe000000000
  WARNING: CPU: 1 PID: 1 at arch/riscv/mm/ptdump.c:236 note_page+0x248/0x25a
  ...
  Checked W+X mappings: failed, 512 W+X pages found

The kernel_page_tables shows first 2M(kernel image) is with W attribute,
Use _start instead of text_start in mark_rodata_ro().

Before,
0xffffffe000000000-0xffffffe000200000    0x0000000080200000         2M PMD     D A . . X W R V
0xffffffe000200000-0xffffffe000a00000    0x0000000080400000         8M PMD     D A . . X . R V
0xffffffe000a00000-0xffffffe001000000    0x0000000080c00000         6M PMD     D A . . . . R V
0xffffffe001000000-0xffffffe17fe00000    0x0000000081200000      6126M PMD     D A . . . W R V

After,
0xffffffe000000000-0xffffffe000a00000    0x0000000080200000        10M PMD     D A . . X . R V
0xffffffe000a00000-0xffffffe001000000    0x0000000080c00000         6M PMD     D A . . . . R V
0xffffffe001000000-0xffffffe17fe00000    0x0000000081200000      6126M PMD     D A . . . W R V

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/mm/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 1d330bde9cf1..d739a46d9fc4 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -624,13 +624,13 @@ static inline void setup_vm_final(void)
 #ifdef CONFIG_STRICT_KERNEL_RWX
 void mark_rodata_ro(void)
 {
-	unsigned long text_start = (unsigned long)_text;
+	unsigned long start = (unsigned long)_start;
 	unsigned long text_end = (unsigned long)_etext;
 	unsigned long rodata_start = (unsigned long)__start_rodata;
 	unsigned long data_start = (unsigned long)_data;
 	unsigned long max_low = (unsigned long)(__va(PFN_PHYS(max_low_pfn)));
 
-	set_memory_ro(text_start, (text_end - text_start) >> PAGE_SHIFT);
+	set_memory_ro(start, (text_end - start) >> PAGE_SHIFT);
 	set_memory_ro(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
 	set_memory_nx(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
 	set_memory_nx(data_start, (max_low - data_start) >> PAGE_SHIFT);
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
