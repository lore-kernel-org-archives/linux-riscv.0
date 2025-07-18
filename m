Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFD7C83F3B
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jul 2025 07:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rrP0zIQvXusZHKYvtT5cs2RxBazNZOdFOGTB4vk77Pc=; b=GW48ARFZggQol/
	9JdCo1X7vx5mxDRMfalZb4o9PUxDnHyhTkMFsYvfUPN9UxRB2wl/t32RhtloJEWGrdLc5tf7NPDHO
	yLE1TSKfHTa3g0EXBcE8IBpiWab/4lZP/oBfH4uYJAgGfleh1RdnvjTnRsNs7KR8+78xjgEWrcBzZ
	H03GdvRTQzuH0ynIcE9aUZtjlGsAeuwyoXDsOpJ71zqD3ZORUDnCVnPKi40LB7TSSkzsPptxGl+87
	FOrYJUGZusYxQx2bZG0vqmiOGcXKqt8h6WzmsLaa22u0ehrvjpsfGvXB7JRpnRB7g84mk3OISINlN
	HgvIM3KFPqY2Cht3fWXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucfWk-0000000Bt8E-2cRI;
	Fri, 18 Jul 2025 07:29:06 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucfVF-0000000Bsrp-2oMg
	for linux-riscv@lists.infradead.org;
	Fri, 18 Jul 2025 07:27:35 +0000
Received: from ubt.. (unknown [210.73.43.2])
	by APP-01 (Coremail) with SMTP id qwCowADnD6RT93loK4wdBQ--.27021S3;
	Fri, 18 Jul 2025 15:27:26 +0800 (CST)
From: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>
Cc: linux-riscv@lists.infradead.org,
	linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH V3 1/5] raid6: riscv: Clean up unused header file inclusion
Date: Fri, 18 Jul 2025 15:27:07 +0800
Message-Id: <20250718072711.3865118-2-zhangchunyan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250718072711.3865118-1-zhangchunyan@iscas.ac.cn>
References: <20250718072711.3865118-1-zhangchunyan@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowADnD6RT93loK4wdBQ--.27021S3
X-Coremail-Antispam: 1UD129KBjvJXoWrKr45GF4UZr4DArWxtw4Dtwb_yoW8JrW7pF
	1DCr47Jr9xKr1fJF9ruF10kFs5Ja4q9ryUGFyUu34DXw13tF95X39YvayjyFy8Z3yjqFWx
	uFWUXr1rZ3yjq3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmSb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY
	1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4
	xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCa
	FVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I
	0En4kS14v26r1q6r43MxkIecxEwVAFwVW8CwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE
	7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI
	8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWU
	CwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
	1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBI
	daVFxhVjvjDU0xZFpf9x07jV7KxUUUUU=
X-Originating-IP: [210.73.43.2]
X-CM-SenderInfo: x2kd0wxfkx051dq6x2xfdvhtffof0/1tbiBwoHB2h50QGLTwAAsI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_002734_068475_C46E64EA 
X-CRM114-Status: UNSURE (   6.56  )
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

These two C files don't reference things defined in simd.h or types.h
so remove these redundant #inclusions.

Fixes: 6093faaf9593 ("raid6: Add RISC-V SIMD syndrome and recovery calculations")
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
---
 lib/raid6/recov_rvv.c | 2 --
 lib/raid6/rvv.c       | 3 ---
 2 files changed, 5 deletions(-)

diff --git a/lib/raid6/recov_rvv.c b/lib/raid6/recov_rvv.c
index f29303795ccf..500da521a806 100644
--- a/lib/raid6/recov_rvv.c
+++ b/lib/raid6/recov_rvv.c
@@ -4,9 +4,7 @@
  * Author: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
  */
 
-#include <asm/simd.h>
 #include <asm/vector.h>
-#include <crypto/internal/simd.h>
 #include <linux/raid/pq.h>
 
 static int rvv_has_vector(void)
diff --git a/lib/raid6/rvv.c b/lib/raid6/rvv.c
index 7d82efa5b14f..b193ea176d5d 100644
--- a/lib/raid6/rvv.c
+++ b/lib/raid6/rvv.c
@@ -9,11 +9,8 @@
  *	Copyright 2002-2004 H. Peter Anvin
  */
 
-#include <asm/simd.h>
 #include <asm/vector.h>
-#include <crypto/internal/simd.h>
 #include <linux/raid/pq.h>
-#include <linux/types.h>
 #include "rvv.h"
 
 #define NSIZE	(riscv_v_vsize / 32) /* NSIZE = vlenb */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
