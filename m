Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE20CD98E1
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 13:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/qRoweXdjdfboJoKr4TbxxaxhBKAD77RDh/uw5LGQlA=; b=L3XVAv4l/KAY2H
	R6fNjtznA5U/2Of7kyNtc9jZsIZuSdkjxfakEPnn6/17fCYGTl0W+1en+qz09xR2nAtrhb5tH/bst
	0Klw4IvRHxBRa2rI7SUexlanMmNXQNutohqaI6lC6BU4Xvyo29IT+3e7uKntwiqTjzRI9lkj08fzh
	HTIVc7DZp3jRY08BpESKbjH9Ve8tNGejcYxpuV9nub981ZPuvudoZQv6UyP5qwXsJYR1+lW5/Zann
	BAAIkrLfNvgGaXgRGgVnwsyZRJJ7qFvCBnwrAgFxqkk2OmwqA/z9fYwcL4TN2PeU4pNzl30sXdQ6e
	oWK4uRElzeOcY1NF0/PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZUCd-0000000FsCq-0Gdr;
	Tue, 16 Jun 2026 13:51:43 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZUCZ-0000000FsBq-28Wc
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jun 2026 13:51:41 +0000
Received: from [127.0.0.2] (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAA3VdzjVDFqj0rvFA--.12812S3;
	Tue, 16 Jun 2026 21:51:31 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Tue, 16 Jun 2026 21:51:31 +0800
Subject: [PATCH 1/2] ACPI: tables: Add missing #include <asm/fixmap.h>
MIME-Version: 1.0
Message-Id: <20260616-riscv-acpi-table-upgrade-v1-1-45902d2dedf9@iscas.ac.cn>
References: <20260616-riscv-acpi-table-upgrade-v1-0-45902d2dedf9@iscas.ac.cn>
In-Reply-To: <20260616-riscv-acpi-table-upgrade-v1-0-45902d2dedf9@iscas.ac.cn>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.15.2
X-CM-TRANSID: rQCowAA3VdzjVDFqj0rvFA--.12812S3
X-Coremail-Antispam: 1UD129KBjvdXoWrury5Zr1xZr13uFWDGw18Grg_yoW3Jrb_C3
	W7Xr4S9ryjkw48t3WftFZxZFyqkrykXwn5uF1vqw1ay3WkAryfGa1kX3W8Za1UuFyrKFn8
	u3WDt3s7Cr43GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbkAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGwA2048vs2IY02
	0Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E
	0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67
	AKxVWUXVWUAwAv7VC2z280aVAFwI0_Cr1j6rxdMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
	0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_Jw0_GFyl42
	xK82IYc2Ij64vIr41l4c8EcI0Ec7CjxVAaw2AFwI0_Jw0_GFyl4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
	Ja73UjIFyTuYvjfUwfOzDUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_065139_951169_B049E8C8 
X-CRM114-Status: UNSURE (   7.33  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

drivers/acpi/tables.c uses NR_FIX_BTMAPS without including
<asm/fixmap.h>. This isn't a problem for existing archs, but would be
when ARCH_HAS_ACPI_TABLE_UPGRADE is enabled for RISC-V. Add the missing
include.

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 drivers/acpi/tables.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/acpi/tables.c b/drivers/acpi/tables.c
index 4286e4af1092..eb93c060426f 100644
--- a/drivers/acpi/tables.c
+++ b/drivers/acpi/tables.c
@@ -22,6 +22,7 @@
 #include <linux/initrd.h>
 #include <linux/security.h>
 #include <linux/kmemleak.h>
+#include <asm/fixmap.h>
 #include "internal.h"
 
 #ifdef CONFIG_ACPI_CUSTOM_DSDT

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
