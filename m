Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA51CA0EFC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 14:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R0GjW35ooz8zyZUXQCHAPTORIKh5TQmmrRF2T/M6zh8=; b=KjFcSdcS6WQC/g
	SwjtwbxPJn3YPI/hgGapuSMzShpqIR1EybPp5CI3kT0dNz01FIq6kYPogTTuJpZspXIYMCEdX5W1N
	KXL0EXKIRESQgBbtPkcKy8vpgWhSsMhc8XAZV9jZTd4O96ek2Aj+wtHIMhC8pq9/lFgSuVYF82clR
	bI8UOpQg3l5GIwGB2HuQpzu0y4X7yIrFvbLyLfqqGp9nGKFbA3t5e8F3SD2FEHh4XiiPohzJH3eOq
	TpMBGTv6xWpJkAWlyCgHvI1IGGi7GR4vKHZAZ6lso/jbwD/FuHTO6Pdi3sJUQaXv/LAhdYRmH10SH
	kDOtAYGrkiigwJFYHVng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojw5-0000000E6m0-31DX;
	Wed, 20 Aug 2025 14:37:09 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoj7Y-0000000DsQ1-1k0n
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 13:44:58 +0000
Received: from [127.0.0.2] (unknown [114.241.87.235])
	by APP-01 (Coremail) with SMTP id qwCowABHN6tT0aVogOTBDQ--.24665S8;
	Wed, 20 Aug 2025 21:44:52 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Wed, 20 Aug 2025 21:44:50 +0800
Subject: [PATCH 6/6] riscv: cmpxchg: Convert to use_alternative_likely
MIME-Version: 1.0
Message-Id: <20250820-riscv-altn-helper-wip-v1-6-c3c626c1f7e6@iscas.ac.cn>
References: <20250820-riscv-altn-helper-wip-v1-0-c3c626c1f7e6@iscas.ac.cn>
In-Reply-To: <20250820-riscv-altn-helper-wip-v1-0-c3c626c1f7e6@iscas.ac.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>, Vivian Wang <uwu@dram.page>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-CM-TRANSID: qwCowABHN6tT0aVogOTBDQ--.24665S8
X-Coremail-Antispam: 1UD129KBjvJXoWxZF4UZry8tryfXFWfuFW5trb_yoW5ury5pF
	n3CwsrKFWvg343uF9Iy392g3W5t397Kr4qyr9IkF95XF13Krs5ZF1Yk3sa9ry8JFWxJwn8
	tFyYkr95WF1jqrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
	1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
	M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
	v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
	IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnI
	WIevJa73UjIFyTuYvjfUOyIUUUUUU
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_064456_818220_708DC432 
X-CRM114-Status: UNSURE (   8.59  )
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

Use use_alternative_likely() to check for RISCV_ISA_EXT_ZAWRS, replacing
the use of asm goto with ALTERNATIVE.

The "likely" variant is used to match the behavior of the original
implementation using ALTERNATIVE("j %l[no_zawrs]", "nop", ...).

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 arch/riscv/include/asm/cmpxchg.h | 125 +++++++++++++++++++--------------------
 1 file changed, 61 insertions(+), 64 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 0b749e7102162477432f7cf9a34768fbdf2e8cc7..1ef6e9de5f6d2721d325fa07f2e636ebc951dc7e 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -370,74 +370,71 @@ static __always_inline void __cmpwait(volatile void *ptr,
 	u32 *__ptr32b;
 	ulong __s, __val, __mask;
 
-	asm goto(ALTERNATIVE("j %l[no_zawrs]", "nop",
-			     0, RISCV_ISA_EXT_ZAWRS, 1)
-		 : : : : no_zawrs);
-
-	switch (size) {
-	case 1:
-		__ptr32b = (u32 *)((ulong)(ptr) & ~0x3);
-		__s = ((ulong)(ptr) & 0x3) * BITS_PER_BYTE;
-		__val = val << __s;
-		__mask = 0xff << __s;
-
-		asm volatile(
-		"	lr.w	%0, %1\n"
-		"	and	%0, %0, %3\n"
-		"	xor	%0, %0, %2\n"
-		"	bnez	%0, 1f\n"
-			ZAWRS_WRS_NTO "\n"
-		"1:"
-		: "=&r" (tmp), "+A" (*(__ptr32b))
-		: "r" (__val), "r" (__mask)
-		: "memory");
-		break;
-	case 2:
-		__ptr32b = (u32 *)((ulong)(ptr) & ~0x3);
-		__s = ((ulong)(ptr) & 0x2) * BITS_PER_BYTE;
-		__val = val << __s;
-		__mask = 0xffff << __s;
-
-		asm volatile(
-		"	lr.w	%0, %1\n"
-		"	and	%0, %0, %3\n"
-		"	xor	%0, %0, %2\n"
-		"	bnez	%0, 1f\n"
-			ZAWRS_WRS_NTO "\n"
-		"1:"
-		: "=&r" (tmp), "+A" (*(__ptr32b))
-		: "r" (__val), "r" (__mask)
-		: "memory");
-		break;
-	case 4:
-		asm volatile(
-		"	lr.w	%0, %1\n"
-		"	xor	%0, %0, %2\n"
-		"	bnez	%0, 1f\n"
-			ZAWRS_WRS_NTO "\n"
-		"1:"
-		: "=&r" (tmp), "+A" (*(u32 *)ptr)
-		: "r" (val));
-		break;
+	if (use_alternative_likely(0, RISCV_ISA_EXT_ZAWRS)) {
+		switch (size) {
+		case 1:
+			__ptr32b = (u32 *)((ulong)(ptr) & ~0x3);
+			__s = ((ulong)(ptr) & 0x3) * BITS_PER_BYTE;
+			__val = val << __s;
+			__mask = 0xff << __s;
+
+			asm volatile(
+			"	lr.w	%0, %1\n"
+			"	and	%0, %0, %3\n"
+			"	xor	%0, %0, %2\n"
+			"	bnez	%0, 1f\n"
+				ZAWRS_WRS_NTO "\n"
+			"1:"
+			: "=&r" (tmp), "+A" (*(__ptr32b))
+			: "r" (__val), "r" (__mask)
+			: "memory");
+			break;
+		case 2:
+			__ptr32b = (u32 *)((ulong)(ptr) & ~0x3);
+			__s = ((ulong)(ptr) & 0x2) * BITS_PER_BYTE;
+			__val = val << __s;
+			__mask = 0xffff << __s;
+
+			asm volatile(
+			"	lr.w	%0, %1\n"
+			"	and	%0, %0, %3\n"
+			"	xor	%0, %0, %2\n"
+			"	bnez	%0, 1f\n"
+				ZAWRS_WRS_NTO "\n"
+			"1:"
+			: "=&r" (tmp), "+A" (*(__ptr32b))
+			: "r" (__val), "r" (__mask)
+			: "memory");
+			break;
+		case 4:
+			asm volatile(
+			"	lr.w	%0, %1\n"
+			"	xor	%0, %0, %2\n"
+			"	bnez	%0, 1f\n"
+				ZAWRS_WRS_NTO "\n"
+			"1:"
+			: "=&r" (tmp), "+A" (*(u32 *)ptr)
+			: "r" (val));
+			break;
 #if __riscv_xlen == 64
-	case 8:
-		asm volatile(
-		"	lr.d	%0, %1\n"
-		"	xor	%0, %0, %2\n"
-		"	bnez	%0, 1f\n"
-			ZAWRS_WRS_NTO "\n"
-		"1:"
-		: "=&r" (tmp), "+A" (*(u64 *)ptr)
-		: "r" (val));
-		break;
+		case 8:
+			asm volatile(
+			"	lr.d	%0, %1\n"
+			"	xor	%0, %0, %2\n"
+			"	bnez	%0, 1f\n"
+				ZAWRS_WRS_NTO "\n"
+			"1:"
+			: "=&r" (tmp), "+A" (*(u64 *)ptr)
+			: "r" (val));
+			break;
 #endif
-	default:
-		BUILD_BUG();
-	}
+		default:
+			BUILD_BUG();
+		}
 
-	return;
+		return;
+	}
 
-no_zawrs:
 	asm volatile(RISCV_PAUSE : : : "memory");
 }
 

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
