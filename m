Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E51FCA0FE0
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 14:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3zQCgk/OdMJ8H9anN6XaExhV3lDnMynK3HJbvoyjCtI=; b=JAB/lBXQAMDIsx
	WgTCSXEAnSImL1SOmMF2cboL6VH+cJvUkUaaU3WHaABDackKYq9OPw2ru7UXWpg/NVG3cdjtIeMDo
	zrQynI183aTimHa1Bj+8a5sj1ACUa2xm8SlTCAVWzt4qH+Qu2Y1ASbSwC0PWwmhSw00d/iPMNwLn9
	jqiD7mmCg0MTFPHwHlo7SJ5bpa30e1Qy8tvhfrOYgkJ3MYMpMOFqzJ3YT+AumCzYdoODW+dQCgpwO
	+vRu2Euct1kSUpOvLBnDf2zaBa3I/MWjpjpFGayiiRb0YMtzxOkLpzYY9P1Id9dbK7MzIR6Hc0F+s
	1Fkh5AxrULmMWZpvWmKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojw9-0000000E6pI-2YcJ;
	Wed, 20 Aug 2025 14:37:13 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoj7Z-0000000DsQi-3HPm
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 13:45:00 +0000
Received: from [127.0.0.2] (unknown [114.241.87.235])
	by APP-01 (Coremail) with SMTP id qwCowABHN6tT0aVogOTBDQ--.24665S7;
	Wed, 20 Aug 2025 21:44:52 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Wed, 20 Aug 2025 21:44:49 +0800
Subject: [PATCH 5/6] riscv: bitops: Convert to use_alternative_likely
MIME-Version: 1.0
Message-Id: <20250820-riscv-altn-helper-wip-v1-5-c3c626c1f7e6@iscas.ac.cn>
References: <20250820-riscv-altn-helper-wip-v1-0-c3c626c1f7e6@iscas.ac.cn>
In-Reply-To: <20250820-riscv-altn-helper-wip-v1-0-c3c626c1f7e6@iscas.ac.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>, Vivian Wang <uwu@dram.page>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-CM-TRANSID: qwCowABHN6tT0aVogOTBDQ--.24665S7
X-Coremail-Antispam: 1UD129KBjvJXoWxZF4UZry5Aw47ur1UtryrJFb_yoW5tFWxpr
	1kKws7CayDKa4ruFn2yr1fW3WrWrW7J39rGr93GF1kJa4DC39Ykr1Fk3WfKr95AFWvq347
	ZrWUAF95C3WUZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
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
X-CRM114-CacheID: sfid-20250820_064458_188007_70602E21 
X-CRM114-Status: GOOD (  10.77  )
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

Use use_alternative_likely() to check for RISCV_ISA_EXT_ZBB, replacing
the use of asm goto with ALTERNATIVE.

The "likely" variant is used to match the behavior of the original
implementation using ALTERNATIVE("j %l[legacy]", "nop", ...).

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 arch/riscv/include/asm/bitops.h | 112 ++++++++++++++++++----------------------
 1 file changed, 50 insertions(+), 62 deletions(-)

diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
index d59310f74c2ba70caeb7b9b0e9221882117583f5..0257d547a96293909d90b017c8a48b508d0fd642 100644
--- a/arch/riscv/include/asm/bitops.h
+++ b/arch/riscv/include/asm/bitops.h
@@ -47,20 +47,17 @@
 
 static __always_inline unsigned long variable__ffs(unsigned long word)
 {
-	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
-				      RISCV_ISA_EXT_ZBB, 1)
-			  : : : : legacy);
-
-	asm volatile (".option push\n"
-		      ".option arch,+zbb\n"
-		      "ctz %0, %1\n"
-		      ".option pop\n"
-		      : "=r" (word) : "r" (word) :);
-
-	return word;
-
-legacy:
-	return generic___ffs(word);
+	if (use_alternative_likely(0, RISCV_ISA_EXT_ZBB)) {
+		asm volatile (".option push\n"
+			      ".option arch,+zbb\n"
+			      "ctz %0, %1\n"
+			      ".option pop\n"
+			      : "=r" (word) : "r" (word) :);
+
+		return word;
+	} else {
+		return generic___ffs(word);
+	}
 }
 
 /**
@@ -76,20 +73,17 @@ static __always_inline unsigned long variable__ffs(unsigned long word)
 
 static __always_inline unsigned long variable__fls(unsigned long word)
 {
-	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
-				      RISCV_ISA_EXT_ZBB, 1)
-			  : : : : legacy);
-
-	asm volatile (".option push\n"
-		      ".option arch,+zbb\n"
-		      "clz %0, %1\n"
-		      ".option pop\n"
-		      : "=r" (word) : "r" (word) :);
-
-	return BITS_PER_LONG - 1 - word;
-
-legacy:
-	return generic___fls(word);
+	if (use_alternative_likely(0, RISCV_ISA_EXT_ZBB)) {
+		asm volatile (".option push\n"
+			      ".option arch,+zbb\n"
+			      "clz %0, %1\n"
+			      ".option pop\n"
+			      : "=r" (word) : "r" (word) :);
+
+		return BITS_PER_LONG - 1 - word;
+	} else {
+		return generic___fls(word);
+	}
 }
 
 /**
@@ -105,23 +99,20 @@ static __always_inline unsigned long variable__fls(unsigned long word)
 
 static __always_inline int variable_ffs(int x)
 {
-	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
-				      RISCV_ISA_EXT_ZBB, 1)
-			  : : : : legacy);
-
-	if (!x)
-		return 0;
-
-	asm volatile (".option push\n"
-		      ".option arch,+zbb\n"
-		      CTZW "%0, %1\n"
-		      ".option pop\n"
-		      : "=r" (x) : "r" (x) :);
-
-	return x + 1;
-
-legacy:
-	return generic_ffs(x);
+	if (use_alternative_likely(0, RISCV_ISA_EXT_ZBB)) {
+		if (!x)
+			return 0;
+
+		asm volatile (".option push\n"
+			      ".option arch,+zbb\n"
+			      CTZW "%0, %1\n"
+			      ".option pop\n"
+			      : "=r" (x) : "r" (x) :);
+
+		return x + 1;
+	} else {
+		return generic_ffs(x);
+	}
 }
 
 /**
@@ -137,23 +128,20 @@ static __always_inline int variable_ffs(int x)
 
 static __always_inline int variable_fls(unsigned int x)
 {
-	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
-				      RISCV_ISA_EXT_ZBB, 1)
-			  : : : : legacy);
-
-	if (!x)
-		return 0;
-
-	asm volatile (".option push\n"
-		      ".option arch,+zbb\n"
-		      CLZW "%0, %1\n"
-		      ".option pop\n"
-		      : "=r" (x) : "r" (x) :);
-
-	return 32 - x;
-
-legacy:
-	return generic_fls(x);
+	if (use_alternative_likely(0, RISCV_ISA_EXT_ZBB)) {
+		if (!x)
+			return 0;
+
+		asm volatile (".option push\n"
+			      ".option arch,+zbb\n"
+			      CLZW "%0, %1\n"
+			      ".option pop\n"
+			      : "=r" (x) : "r" (x) :);
+
+		return 32 - x;
+	} else {
+		return generic_fls(x);
+	}
 }
 
 /**

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
