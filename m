Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FE7C5B552
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 12:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GravI5ayyU9nj+324Ycbprgk/U2hsaj0SG2o/J3+tzU=; b=JgF+1oXm0zjfG5
	4bPUHjc1kNbIW9fCk0Jn0MKPSTRKLu0TXZy+ktkw77pV8c4YWJH7kRNVj+oMmTQ3WOH8WNw0qPYc2
	XSn8cmgMurmC2zL6qlFpaIl8vTLWh3qISQDln9pARWuva3yErl54FGKzFarQF0aiMfKYCu8TwCxr4
	uR4BezVFfp1nQyZWtMsO7CuDmB4g/J6NUnFaObpjqIn+gQQfiiZ8eIjhZocHfiXt97XHUUGIYDglz
	gTB0omECaGmJ4Ph/WuFdHfW4een+yoLE9fNiKbf3dCrOcwC2y+vByqHXMdcPFx1r60BlxBjw9GwhW
	kJu9AhiOscBR6NW0KChQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxmh-00000006ioZ-2Rzs;
	Tue, 10 Jun 2025 12:08:55 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvya-00000006T7f-3ZwX
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 10:13:09 +0000
Received: from ubt.. (unknown [210.73.43.2])
	by APP-05 (Coremail) with SMTP id zQCowADXJRQjBUhoCfqKBQ--.1934S5;
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
Subject: [PATCH 3/4] raid6: riscv: Allow code to be compiled in userspace
Date: Tue, 10 Jun 2025 18:12:33 +0800
Message-Id: <20250610101234.1100660-4-zhangchunyan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610101234.1100660-1-zhangchunyan@iscas.ac.cn>
References: <20250610101234.1100660-1-zhangchunyan@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowADXJRQjBUhoCfqKBQ--.1934S5
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrWfXr15Gr47Xw13AF1DZFb_yoW8Zw13pF
	yDAF43Jr13KF1Svas3ZF18WFZ8Ja4IvryUCr47C34UZry3KrykArWkZry0yry3WrWFqFWx
	u34UXr1fCw4Ut3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmqb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUWwA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26F8l6FkdMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x
	0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_Gw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC
	6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
	C2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_
	JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
	WUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIY
	CTnIWIevJa73UjIFyTuYvjxU7UGYDUUUU
X-Originating-IP: [210.73.43.2]
X-CM-SenderInfo: x2kd0wxfkx051dq6x2xfdvhtffof0/1tbiCQ8JB2hH3wrH1QAAsg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_031305_274208_C53ADA23 
X-CRM114-Status: UNSURE (   7.78  )
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

To support userspace raid6test, this patch adds __KERNEL__ ifdef for kernel
header inclusions also userspace wrapper definitions to allow code to be
compiled in userspace.

Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
---
 lib/raid6/recov_rvv.c |  7 +------
 lib/raid6/rvv.c       | 11 ++++-------
 lib/raid6/rvv.h       | 15 +++++++++++++++
 3 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/lib/raid6/recov_rvv.c b/lib/raid6/recov_rvv.c
index 500da521a806..8f2be833c015 100644
--- a/lib/raid6/recov_rvv.c
+++ b/lib/raid6/recov_rvv.c
@@ -4,13 +4,8 @@
  * Author: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
  */
 
-#include <asm/vector.h>
 #include <linux/raid/pq.h>
-
-static int rvv_has_vector(void)
-{
-	return has_vector();
-}
+#include "rvv.h"
 
 static void __raid6_2data_recov_rvv(int bytes, u8 *p, u8 *q, u8 *dp,
 				    u8 *dq, const u8 *pbmul,
diff --git a/lib/raid6/rvv.c b/lib/raid6/rvv.c
index b193ea176d5d..99dfa16d37c7 100644
--- a/lib/raid6/rvv.c
+++ b/lib/raid6/rvv.c
@@ -9,16 +9,13 @@
  *	Copyright 2002-2004 H. Peter Anvin
  */
 
-#include <asm/vector.h>
-#include <linux/raid/pq.h>
 #include "rvv.h"
 
+#ifdef __KERNEL__
 #define NSIZE	(riscv_v_vsize / 32) /* NSIZE = vlenb */
-
-static int rvv_has_vector(void)
-{
-	return has_vector();
-}
+#else
+#define NSIZE  16
+#endif
 
 static void raid6_rvv1_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
 {
diff --git a/lib/raid6/rvv.h b/lib/raid6/rvv.h
index 94044a1b707b..595dfbf95d4e 100644
--- a/lib/raid6/rvv.h
+++ b/lib/raid6/rvv.h
@@ -7,6 +7,21 @@
  * Definitions for RISC-V RAID-6 code
  */
 
+#ifdef __KERNEL__
+#include <asm/vector.h>
+#else
+#define kernel_vector_begin()
+#define kernel_vector_end()
+#define has_vector()		(1)
+#endif
+
+#include <linux/raid/pq.h>
+
+static int rvv_has_vector(void)
+{
+	return has_vector();
+}
+
 #define RAID6_RVV_WRAPPER(_n)						\
 	static void raid6_rvv ## _n ## _gen_syndrome(int disks,		\
 					size_t bytes, void **ptrs)	\
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
