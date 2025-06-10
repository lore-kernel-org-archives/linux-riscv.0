Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514A8C61DB2
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 10:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VnBv4do3xB3aRLN3fXXDqv8J4kgIOz/GRqFqVJzVkpU=; b=lUhHBoiv0VfkVU
	yZZJYR+hRQsQZdBBt+YG9gG6ItX7JkqZpZkPVqthgTiLnBVnvLU5nir104t02cAZFqR4ZIiEHhvQj
	qCLdd/f8DO5XtD0BTQ7J8fuM8OUJROz7Hlg0v6e2lC5bbxBPzUGwtLMeda/TTbY9ANXl5S14917Eb
	cxfpfQbkLg2ps2HhPwezfuHk8IQWp4ws4sWrynFFb4Iz/G0opBe7n0ZVZxT8j1M3UkO1AmC2bcizM
	2FX6fre0iULqEXKz7ROWxvwMUM/LRvAD3MQ7OeYuOoNZ+Bmhhiq4ZYMAf83SrL24lz2B8jIZ/i+Fj
	sqSUzNkHBzaOO+9LxkGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwg2-00000006Zli-0cV0;
	Tue, 10 Jun 2025 10:57:58 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvya-00000006T7b-3M4l
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 10:13:07 +0000
Received: from ubt.. (unknown [210.73.43.2])
	by APP-05 (Coremail) with SMTP id zQCowADXJRQjBUhoCfqKBQ--.1934S3;
	Tue, 10 Jun 2025 18:12:52 +0800 (CST)
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
Subject: [PATCH 1/4] raid6: riscv: Clean up unused header file inclusion
Date: Tue, 10 Jun 2025 18:12:31 +0800
Message-Id: <20250610101234.1100660-2-zhangchunyan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610101234.1100660-1-zhangchunyan@iscas.ac.cn>
References: <20250610101234.1100660-1-zhangchunyan@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowADXJRQjBUhoCfqKBQ--.1934S3
X-Coremail-Antispam: 1UD129KBjvdXoWrKr45GF4UZr4DArWxuFWrAFb_yoWktFb_Aw
	1xGF1UXa4kAFWjv3WfArs7C34qvwn3Xr1kZw1Sq3W5tFyDZ3yag39xurnrZrW3WrZ8uFn3
	ur15JFW3Wrn0gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb98YjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7
	IE14v26r18M28IrcIa0xkI8VCY1x0267AKxVW8JVW5JwA2ocxC64kIII0Yj41l84x0c7CE
	w4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6x
	kF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY
	1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4
	xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_AcC_ZcWlOx8S6xCa
	FVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I
	0En4kS14v26r1q6r43MxkIecxEwVAFwVW8twCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE
	7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI
	8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWU
	CwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
	1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBI
	daVFxhVjvjDU0xZFpf9x07jFnmiUUUUU=
X-Originating-IP: [210.73.43.2]
X-CM-SenderInfo: x2kd0wxfkx051dq6x2xfdvhtffof0/1tbiBwoJB2hH3v7GwgAAsI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_031305_211343_055DB989 
X-CRM114-Status: UNSURE (   6.89  )
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
index f0887344b274..bf7d5cd659e0 100644
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
