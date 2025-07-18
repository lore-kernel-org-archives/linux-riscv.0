Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6E3C83F34
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jul 2025 07:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mHHy3ednASCuzkrSp8djCM+sSvrl8NJWmK9h9GZXiCE=; b=f76adrDTK1A3ia
	GtYGzkwy+VCYoMxwan/IirEgg9GEAE2fLEkX8Gzv33zMyHrdDXSHekRr4AzBsa1cBPR93UmqxBPz0
	QUM/8g9wr3xHXcPICOaQ2IcBpQb1jL245wFNFkj7coWTmEQoKu0pw34OxVzEYs9O9MLHxgulvhH6M
	XOXPmE0N/zuJLIjv918xcLf8qUoX9EgBRHWeXtMpvWrZuMx07ch2UPsaLokgAwqrlV1cutiy9hvEf
	FIWmOTob8fwijoQvuQQH/OyKoEY1S+zZPMiDscwwl1qoWbgOfPbY9BiJYbfJ5KEREbpWWU46rnzLQ
	F+7H7f+qm2w5glvmNgdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucfWl-0000000Bt8w-3mpC;
	Fri, 18 Jul 2025 07:29:07 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucfVH-0000000Bssd-1Aiw
	for linux-riscv@lists.infradead.org;
	Fri, 18 Jul 2025 07:27:36 +0000
Received: from ubt.. (unknown [210.73.43.2])
	by APP-01 (Coremail) with SMTP id qwCowADnD6RT93loK4wdBQ--.27021S4;
	Fri, 18 Jul 2025 15:27:27 +0800 (CST)
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
Subject: [PATCH V3 2/5] raid6: riscv: replace one load with a move to speed up the caculation
Date: Fri, 18 Jul 2025 15:27:08 +0800
Message-Id: <20250718072711.3865118-3-zhangchunyan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250718072711.3865118-1-zhangchunyan@iscas.ac.cn>
References: <20250718072711.3865118-1-zhangchunyan@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowADnD6RT93loK4wdBQ--.27021S4
X-Coremail-Antispam: 1UD129KBjvJXoWxGFyDXrW8uF4xCw43CF4kWFg_yoWrury7p3
	WfKF1xAa4SqryxXrn7Arn7Jr93XFW2yay3tFnxAw47ZayDJw4DKrsYkw1v9F1DAFy8JayD
	ZryUtF1YyryqvaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmqb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x
	0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_GF4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC
	6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
	C2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_
	JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
	WUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIY
	CTnIWIevJa73UjIFyTuYvjxUcHqcUUUUU
X-Originating-IP: [210.73.43.2]
X-CM-SenderInfo: x2kd0wxfkx051dq6x2xfdvhtffof0/1tbiDAgHB2h50cuIwAAAsH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_002735_681984_AB2E92DE 
X-CRM114-Status: UNSURE (   6.99  )
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

Since wp$$==wq$$, it doesn't need to load the same data twice, use move
instruction to replace one of the loads to let the program run faster.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
---
 lib/raid6/rvv.c | 60 ++++++++++++++++++++++++-------------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/lib/raid6/rvv.c b/lib/raid6/rvv.c
index b193ea176d5d..89da5fc247aa 100644
--- a/lib/raid6/rvv.c
+++ b/lib/raid6/rvv.c
@@ -44,7 +44,7 @@ static void raid6_rvv1_gen_syndrome_real(int disks, unsigned long bytes, void **
 		asm volatile (".option	push\n"
 			      ".option	arch,+v\n"
 			      "vle8.v	v0, (%[wp0])\n"
-			      "vle8.v	v1, (%[wp0])\n"
+			      "vmv.v.v	v1, v0\n"
 			      ".option	pop\n"
 			      : :
 			      [wp0]"r"(&dptr[z0][d + 0 * NSIZE])
@@ -117,7 +117,7 @@ static void raid6_rvv1_xor_syndrome_real(int disks, int start, int stop,
 		asm volatile (".option	push\n"
 			      ".option	arch,+v\n"
 			      "vle8.v	v0, (%[wp0])\n"
-			      "vle8.v	v1, (%[wp0])\n"
+			      "vmv.v.v	v1, v0\n"
 			      ".option	pop\n"
 			      : :
 			      [wp0]"r"(&dptr[z0][d + 0 * NSIZE])
@@ -218,9 +218,9 @@ static void raid6_rvv2_gen_syndrome_real(int disks, unsigned long bytes, void **
 		asm volatile (".option	push\n"
 			      ".option	arch,+v\n"
 			      "vle8.v	v0, (%[wp0])\n"
-			      "vle8.v	v1, (%[wp0])\n"
+			      "vmv.v.v	v1, v0\n"
 			      "vle8.v	v4, (%[wp1])\n"
-			      "vle8.v	v5, (%[wp1])\n"
+			      "vmv.v.v	v5, v4\n"
 			      ".option	pop\n"
 			      : :
 			      [wp0]"r"(&dptr[z0][d + 0 * NSIZE]),
@@ -310,9 +310,9 @@ static void raid6_rvv2_xor_syndrome_real(int disks, int start, int stop,
 		asm volatile (".option	push\n"
 			      ".option	arch,+v\n"
 			      "vle8.v	v0, (%[wp0])\n"
-			      "vle8.v	v1, (%[wp0])\n"
+			      "vmv.v.v	v1, v0\n"
 			      "vle8.v	v4, (%[wp1])\n"
-			      "vle8.v	v5, (%[wp1])\n"
+			      "vmv.v.v	v5, v4\n"
 			      ".option	pop\n"
 			      : :
 			      [wp0]"r"(&dptr[z0][d + 0 * NSIZE]),
@@ -440,13 +440,13 @@ static void raid6_rvv4_gen_syndrome_real(int disks, unsigned long bytes, void **
 		asm volatile (".option	push\n"
 			      ".option	arch,+v\n"
 			      "vle8.v	v0, (%[wp0])\n"
-			      "vle8.v	v1, (%[wp0])\n"
+			      "vmv.v.v	v1, v0\n"
 			      "vle8.v	v4, (%[wp1])\n"
-			      "vle8.v	v5, (%[wp1])\n"
+			      "vmv.v.v	v5, v4\n"
 			      "vle8.v	v8, (%[wp2])\n"
-			      "vle8.v	v9, (%[wp2])\n"
+			      "vmv.v.v	v9, v8\n"
 			      "vle8.v	v12, (%[wp3])\n"
-			      "vle8.v	v13, (%[wp3])\n"
+			      "vmv.v.v	v13, v12\n"
 			      ".option	pop\n"
 			      : :
 			      [wp0]"r"(&dptr[z0][d + 0 * NSIZE]),
@@ -566,13 +566,13 @@ static void raid6_rvv4_xor_syndrome_real(int disks, int start, int stop,
 		asm volatile (".option	push\n"
 			      ".option	arch,+v\n"
 			      "vle8.v	v0, (%[wp0])\n"
-			      "vle8.v	v1, (%[wp0])\n"
+			      "vmv.v.v	v1, v0\n"
 			      "vle8.v	v4, (%[wp1])\n"
-			      "vle8.v	v5, (%[wp1])\n"
+			      "vmv.v.v	v5, v4\n"
 			      "vle8.v	v8, (%[wp2])\n"
-			      "vle8.v	v9, (%[wp2])\n"
+			      "vmv.v.v	v9, v8\n"
 			      "vle8.v	v12, (%[wp3])\n"
-			      "vle8.v	v13, (%[wp3])\n"
+			      "vmv.v.v	v13, v12\n"
 			      ".option	pop\n"
 			      : :
 			      [wp0]"r"(&dptr[z0][d + 0 * NSIZE]),
@@ -754,21 +754,21 @@ static void raid6_rvv8_gen_syndrome_real(int disks, unsigned long bytes, void **
 		asm volatile (".option	push\n"
 			      ".option	arch,+v\n"
 			      "vle8.v	v0, (%[wp0])\n"
-			      "vle8.v	v1, (%[wp0])\n"
+			      "vmv.v.v	v1, v0\n"
 			      "vle8.v	v4, (%[wp1])\n"
-			      "vle8.v	v5, (%[wp1])\n"
+			      "vmv.v.v	v5, v4\n"
 			      "vle8.v	v8, (%[wp2])\n"
-			      "vle8.v	v9, (%[wp2])\n"
+			      "vmv.v.v	v9, v8\n"
 			      "vle8.v	v12, (%[wp3])\n"
-			      "vle8.v	v13, (%[wp3])\n"
+			      "vmv.v.v	v13, v12\n"
 			      "vle8.v	v16, (%[wp4])\n"
-			      "vle8.v	v17, (%[wp4])\n"
+			      "vmv.v.v	v17, v16\n"
 			      "vle8.v	v20, (%[wp5])\n"
-			      "vle8.v	v21, (%[wp5])\n"
+			      "vmv.v.v	v21, v20\n"
 			      "vle8.v	v24, (%[wp6])\n"
-			      "vle8.v	v25, (%[wp6])\n"
+			      "vmv.v.v	v25, v24\n"
 			      "vle8.v	v28, (%[wp7])\n"
-			      "vle8.v	v29, (%[wp7])\n"
+			      "vmv.v.v	v29, v28\n"
 			      ".option	pop\n"
 			      : :
 			      [wp0]"r"(&dptr[z0][d + 0 * NSIZE]),
@@ -948,21 +948,21 @@ static void raid6_rvv8_xor_syndrome_real(int disks, int start, int stop,
 		asm volatile (".option	push\n"
 			      ".option	arch,+v\n"
 			      "vle8.v	v0, (%[wp0])\n"
-			      "vle8.v	v1, (%[wp0])\n"
+			      "vmv.v.v	v1, v0\n"
 			      "vle8.v	v4, (%[wp1])\n"
-			      "vle8.v	v5, (%[wp1])\n"
+			      "vmv.v.v	v5, v4\n"
 			      "vle8.v	v8, (%[wp2])\n"
-			      "vle8.v	v9, (%[wp2])\n"
+			      "vmv.v.v	v9, v8\n"
 			      "vle8.v	v12, (%[wp3])\n"
-			      "vle8.v	v13, (%[wp3])\n"
+			      "vmv.v.v	v13, v12\n"
 			      "vle8.v	v16, (%[wp4])\n"
-			      "vle8.v	v17, (%[wp4])\n"
+			      "vmv.v.v	v17, v16\n"
 			      "vle8.v	v20, (%[wp5])\n"
-			      "vle8.v	v21, (%[wp5])\n"
+			      "vmv.v.v	v21, v20\n"
 			      "vle8.v	v24, (%[wp6])\n"
-			      "vle8.v	v25, (%[wp6])\n"
+			      "vmv.v.v	v25, v24\n"
 			      "vle8.v	v28, (%[wp7])\n"
-			      "vle8.v	v29, (%[wp7])\n"
+			      "vmv.v.v	v29, v28\n"
 			      ".option	pop\n"
 			      : :
 			      [wp0]"r"(&dptr[z0][d + 0 * NSIZE]),
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
