Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13637C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 18 May 2022 01:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P4LPmX8zvdJ1+nPe4Mx17EqnY8NQ/D2sdbNL4+eP//I=; b=4Jll/p3Y2pgqQf
	55dOyS9O4r0hKlk2PzvLTMEqvsuQ4wjBvJLz9R1qg2FvY+kFj/FECORvaP2GxvApmKLZY6OIbuuoH
	7+edRTM7BSYqjhBMrF5WvZNWbRW0Q8hZvVyI9YqlyT/vYMRNSJxoTw23IqnlWNvcsDVClYYJC9dxB
	lwvqKVbX9KWx5NfFU+7LUj+C+8BlNzflnETvPO2/9/duJx6tsBVX6emQTEjCHejZr3QXblVrNeK4y
	kvE5DNwCXLhjwEXQgMseoo7Mz7In2uctDo9kX0bXO4G81wvLSikEbAadrwW0XJo27ZkYrR3zoVSkq
	vpkyM6QAUHV1wNZz697Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr8aL-00Gb7f-QL; Wed, 18 May 2022 01:34:45 +0000
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr8aH-00Gb6m-Js
 for linux-riscv@lists.infradead.org; Wed, 18 May 2022 01:34:43 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
 MF=xianting.tian@linux.alibaba.com; NM=1; PH=DS; RN=21; SR=0;
 TI=SMTPD_---0VDYa6oI_1652837670; 
Received: from localhost(mailfrom:xianting.tian@linux.alibaba.com
 fp:SMTPD_---0VDYa6oI_1652837670) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 18 May 2022 09:34:31 +0800
From: Xianting Tian <xianting.tian@linux.alibaba.com>
To: mick@ics.forth.gr, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, anup@brainfault.org, akpm@linux-foundation.org,
 wangkefeng.wang@huawei.com, rppt@kernel.org, david@redhat.com,
 wangborong@cdjrlc.com, twd2.me@gmail.com, seanjc@google.com, alex@ghiti.fr,
 petr.pavlu@suse.com, atishp@rivosinc.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jianghuaming.jhm@alibaba-inc.com, guoren@kernel.org, heiko@sntech.de,
 Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: [PATCH v3] RISC-V: Mark IORESOURCE_EXCLUSIVE for reserved mem instead
 of IORESOURCE_BUSY
Date: Wed, 18 May 2022 09:34:28 +0800
Message-Id: <20220518013428.1338983-1-xianting.tian@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_183441_868442_3FAE68CE 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Commit 00ab027a3b82 ("RISC-V: Add kernel image sections to the resource tree")
marked IORESOURCE_BUSY for reserved memory, which caused resource map
failed in subsequent operations of related driver, so remove the
IORESOURCE_BUSY flag. In order to prohibit userland mapping reserved
memory, mark IORESOURCE_EXCLUSIVE for it.

The code to reproduce the issue,
dts:
        mem0: memory@a0000000 {
                reg = <0x0 0xa0000000 0 0x1000000>;
                no-map;
        };

        &test {
                status = "okay";
                memory-region = <&mem0>;
        };

code:
        np = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
        ret = of_address_to_resource(np, 0, &r);
        base = devm_ioremap_resource(&pdev->dev, &r);
        // base = -EBUSY

Fixes: 00ab027a3b82 ("RISC-V: Add kernel image sections to the resource tree")
Reported-by: Huaming Jiang <jianghuaming.jhm@alibaba-inc.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Co-developed-by: Nick Kossifidis <mick@ics.forth.gr>
Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
---
Changes from v2:
- Fix typo in commit message: casued -> caused
- Remove Reviewed-by of Nick Kossifidis, who didn't give Reviewed-by actually
- Add Co-developed-by of Nick

Changes from v1:
- Mark reserved memory as IORESOURCE_EXCLUSIVE, suggested by Nick
---
 arch/riscv/kernel/setup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 834eb652a7b9..e0a00739bd13 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -189,7 +189,7 @@ static void __init init_resources(void)
 		res = &mem_res[res_idx--];
 
 		res->name = "Reserved";
-		res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
+		res->flags = IORESOURCE_MEM | IORESOURCE_EXCLUSIVE;
 		res->start = __pfn_to_phys(memblock_region_reserved_base_pfn(region));
 		res->end = __pfn_to_phys(memblock_region_reserved_end_pfn(region)) - 1;
 
@@ -214,7 +214,7 @@ static void __init init_resources(void)
 
 		if (unlikely(memblock_is_nomap(region))) {
 			res->name = "Reserved";
-			res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
+			res->flags = IORESOURCE_MEM | IORESOURCE_EXCLUSIVE;
 		} else {
 			res->name = "System RAM";
 			res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
