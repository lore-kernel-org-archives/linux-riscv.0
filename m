Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A261C61DB2
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 10:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sf7c01rfBpDHBSn1zIBm73Gt2Cx2lwTcusmoa83XuIY=; b=jTqQlLMYe1uYoA
	XQJuO4TCeM/1WWrMQqWIoiiPiWXCHE1WnUAV+vkc349dJoSEC2DGKgZ5cT4zZ1Gm+BMg31TdmgcB/
	4Ixb/9OcffK1cllkQHtFpKXb4RAMk0VtEfi8KrkBYnDx2r5e20mUMFWk84U4FL0hMzO+Zz7528rUU
	nnn/AEjIsV27wc+7uZ6lBiDwDkqaFKv4cqPlOWWAQ4/XX/03HD79jpJ0QcsQDNBoyMKX+rhdtiWx6
	E0CzNCghS0/GLsxj8WObVmUW3o0fngwa5f2MnpMI1hzNJ1ZxbGMgcp5qDOot+S/IZoXMknedv4Zsz
	s2u/BmIcFpF9a9xzU3QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwg5-00000006Zse-3xPx;
	Tue, 10 Jun 2025 10:58:01 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvya-00000006T7g-3d1M
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 10:13:08 +0000
Received: from ubt.. (unknown [210.73.43.2])
	by APP-05 (Coremail) with SMTP id zQCowADXJRQjBUhoCfqKBQ--.1934S4;
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
Subject: [PATCH 2/4] raid6: riscv: Fix NULL pointer dereference issue
Date: Tue, 10 Jun 2025 18:12:32 +0800
Message-Id: <20250610101234.1100660-3-zhangchunyan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610101234.1100660-1-zhangchunyan@iscas.ac.cn>
References: <20250610101234.1100660-1-zhangchunyan@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowADXJRQjBUhoCfqKBQ--.1934S4
X-Coremail-Antispam: 1UD129KBjvJXoW3Xw13Ww1kZF4fXr1xZr13Arb_yoW7tF1fpF
	1rKw4qya97JFsxK3sxurn5XFW5Kr9rt34xKw17Wr4xZ3Z8AFyFvrWj9w1rtFyUu3s5ua4j
	v34UAryrurs0yw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmqb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26F8l6FkdMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x
	0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_Gw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC
	6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
	C2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_
	JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
	WUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIY
	CTnIWIevJa73UjIFyTuYvjxUqm0mUUUUU
X-Originating-IP: [210.73.43.2]
X-CM-SenderInfo: x2kd0wxfkx051dq6x2xfdvhtffof0/1tbiBwoJB2hH3v7GwgABsJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_031305_280252_A32C89CE 
X-CRM114-Status: GOOD (  11.86  )
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

When running the raid6 user-space test program on RISC-V QEMU, there's a
segmentation fault which seems caused by accessing a NULL pointer,
which is the pointer variable p/q in raid6_rvv*_gen/xor_syndrome_real(),
p/q should have been equal to dptr[x], but when I use GDB command to
see its value, which was 0x10 like below:

"
Program received signal SIGSEGV, Segmentation fault.
0x0000000000011062 in raid6_rvv2_xor_syndrome_real (disks=<optimized out>, start=0, stop=<optimized out>, bytes=4096, ptrs=<optimized out>) at rvv.c:386
(gdb) p p
$1 = (u8 *) 0x10 <error: Cannot access memory at address 0x10>
"

The issue was found to be related with:
1) Compile optimization
   There's no segmentation fault if compiling the raid6test program with
   the optimization flag -O0.
2) The RISC-V vector command vsetvli
   If not used t0 as the first parameter in vsetvli, there's no
   segmentation fault either.

This patch selects the 2nd solution to fix the issue.

Fixes: 6093faaf9593 ("raid6: Add RISC-V SIMD syndrome and recovery calculations")
Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
---
 lib/raid6/rvv.c | 48 ++++++++++++++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/lib/raid6/rvv.c b/lib/raid6/rvv.c
index bf7d5cd659e0..b193ea176d5d 100644
--- a/lib/raid6/rvv.c
+++ b/lib/raid6/rvv.c
@@ -23,9 +23,9 @@ static int rvv_has_vector(void)
 static void raid6_rvv1_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
 {
 	u8 **dptr = (u8 **)ptrs;
-	unsigned long d;
-	int z, z0;
 	u8 *p, *q;
+	unsigned long vl, d;
+	int z, z0;
 
 	z0 = disks - 3;		/* Highest data disk */
 	p = dptr[z0 + 1];		/* XOR parity */
@@ -33,8 +33,9 @@ static void raid6_rvv1_gen_syndrome_real(int disks, unsigned long bytes, void **
 
 	asm volatile (".option	push\n"
 		      ".option	arch,+v\n"
-		      "vsetvli	t0, x0, e8, m1, ta, ma\n"
+		      "vsetvli	%0, x0, e8, m1, ta, ma\n"
 		      ".option	pop\n"
+		      : "=&r" (vl)
 	);
 
 	 /* v0:wp0, v1:wq0, v2:wd0/w20, v3:w10 */
@@ -96,7 +97,7 @@ static void raid6_rvv1_xor_syndrome_real(int disks, int start, int stop,
 {
 	u8 **dptr = (u8 **)ptrs;
 	u8 *p, *q;
-	unsigned long d;
+	unsigned long vl, d;
 	int z, z0;
 
 	z0 = stop;		/* P/Q right side optimization */
@@ -105,8 +106,9 @@ static void raid6_rvv1_xor_syndrome_real(int disks, int start, int stop,
 
 	asm volatile (".option	push\n"
 		      ".option	arch,+v\n"
-		      "vsetvli	t0, x0, e8, m1, ta, ma\n"
+		      "vsetvli	%0, x0, e8, m1, ta, ma\n"
 		      ".option	pop\n"
+		      : "=&r" (vl)
 	);
 
 	/* v0:wp0, v1:wq0, v2:wd0/w20, v3:w10 */
@@ -192,9 +194,9 @@ static void raid6_rvv1_xor_syndrome_real(int disks, int start, int stop,
 static void raid6_rvv2_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
 {
 	u8 **dptr = (u8 **)ptrs;
-	unsigned long d;
-	int z, z0;
 	u8 *p, *q;
+	unsigned long vl, d;
+	int z, z0;
 
 	z0 = disks - 3;		/* Highest data disk */
 	p = dptr[z0 + 1];		/* XOR parity */
@@ -202,8 +204,9 @@ static void raid6_rvv2_gen_syndrome_real(int disks, unsigned long bytes, void **
 
 	asm volatile (".option	push\n"
 		      ".option	arch,+v\n"
-		      "vsetvli	t0, x0, e8, m1, ta, ma\n"
+		      "vsetvli	%0, x0, e8, m1, ta, ma\n"
 		      ".option	pop\n"
+		      : "=&r" (vl)
 	);
 
 	/*
@@ -284,7 +287,7 @@ static void raid6_rvv2_xor_syndrome_real(int disks, int start, int stop,
 {
 	u8 **dptr = (u8 **)ptrs;
 	u8 *p, *q;
-	unsigned long d;
+	unsigned long vl, d;
 	int z, z0;
 
 	z0 = stop;		/* P/Q right side optimization */
@@ -293,8 +296,9 @@ static void raid6_rvv2_xor_syndrome_real(int disks, int start, int stop,
 
 	asm volatile (".option	push\n"
 		      ".option	arch,+v\n"
-		      "vsetvli	t0, x0, e8, m1, ta, ma\n"
+		      "vsetvli	%0, x0, e8, m1, ta, ma\n"
 		      ".option	pop\n"
+		      : "=&r" (vl)
 	);
 
 	/*
@@ -410,9 +414,9 @@ static void raid6_rvv2_xor_syndrome_real(int disks, int start, int stop,
 static void raid6_rvv4_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
 {
 	u8 **dptr = (u8 **)ptrs;
-	unsigned long d;
-	int z, z0;
 	u8 *p, *q;
+	unsigned long vl, d;
+	int z, z0;
 
 	z0 = disks - 3;	/* Highest data disk */
 	p = dptr[z0 + 1];	/* XOR parity */
@@ -420,8 +424,9 @@ static void raid6_rvv4_gen_syndrome_real(int disks, unsigned long bytes, void **
 
 	asm volatile (".option	push\n"
 		      ".option	arch,+v\n"
-		      "vsetvli	t0, x0, e8, m1, ta, ma\n"
+		      "vsetvli	%0, x0, e8, m1, ta, ma\n"
 		      ".option	pop\n"
+		      : "=&r" (vl)
 	);
 
 	/*
@@ -536,7 +541,7 @@ static void raid6_rvv4_xor_syndrome_real(int disks, int start, int stop,
 {
 	u8 **dptr = (u8 **)ptrs;
 	u8 *p, *q;
-	unsigned long d;
+	unsigned long vl, d;
 	int z, z0;
 
 	z0 = stop;		/* P/Q right side optimization */
@@ -545,8 +550,9 @@ static void raid6_rvv4_xor_syndrome_real(int disks, int start, int stop,
 
 	asm volatile (".option	push\n"
 		      ".option	arch,+v\n"
-		      "vsetvli	t0, x0, e8, m1, ta, ma\n"
+		      "vsetvli	%0, x0, e8, m1, ta, ma\n"
 		      ".option	pop\n"
+		      : "=&r" (vl)
 	);
 
 	/*
@@ -718,9 +724,9 @@ static void raid6_rvv4_xor_syndrome_real(int disks, int start, int stop,
 static void raid6_rvv8_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
 {
 	u8 **dptr = (u8 **)ptrs;
-	unsigned long d;
-	int z, z0;
 	u8 *p, *q;
+	unsigned long vl, d;
+	int z, z0;
 
 	z0 = disks - 3;	/* Highest data disk */
 	p = dptr[z0 + 1];	/* XOR parity */
@@ -728,8 +734,9 @@ static void raid6_rvv8_gen_syndrome_real(int disks, unsigned long bytes, void **
 
 	asm volatile (".option	push\n"
 		      ".option	arch,+v\n"
-		      "vsetvli	t0, x0, e8, m1, ta, ma\n"
+		      "vsetvli	%0, x0, e8, m1, ta, ma\n"
 		      ".option	pop\n"
+		      : "=&r" (vl)
 	);
 
 	/*
@@ -912,7 +919,7 @@ static void raid6_rvv8_xor_syndrome_real(int disks, int start, int stop,
 {
 	u8 **dptr = (u8 **)ptrs;
 	u8 *p, *q;
-	unsigned long d;
+	unsigned long vl, d;
 	int z, z0;
 
 	z0 = stop;		/* P/Q right side optimization */
@@ -921,8 +928,9 @@ static void raid6_rvv8_xor_syndrome_real(int disks, int start, int stop,
 
 	asm volatile (".option	push\n"
 		      ".option	arch,+v\n"
-		      "vsetvli	t0, x0, e8, m1, ta, ma\n"
+		      "vsetvli	%0, x0, e8, m1, ta, ma\n"
 		      ".option	pop\n"
+		      : "=&r" (vl)
 	);
 
 	/*
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
