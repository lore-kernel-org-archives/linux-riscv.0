Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1EFCCD187
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 23:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iq5xPB57ty6dfbXlCM8HGnZCmmXKC46C+5fwsd+zjNw=; b=YYlv5MP8Q0c98+
	Of6g2Dxgn34WYD7zQ6CP9rjyqSiI+jOmFofCwhy8pdr5xuVSOQvqB6EYe9F0FNGv80sB87e8Rume5
	WuIMR9BKZ7g2N1BFPjTAd4yQJ8QuB7HcFtmFBPE0yV6Xz0PRDgDW0XaZ4rAkh7BeJ/Xq+dohyfRiU
	rIVAx7DvsKMjFBk/z2KMu1Nf5tUs49Pqxho+9EEMnHz3R7sbMBbNdtINxXiViLP0ekUzEDeTYqmKA
	XK+SFkx9GiZRGc/bWfGjDTeES+ftS+ILNvozcBEHmUAJy0iCluZVa8ox4JeaHqvFVaQI0N6DPV7c1
	ibzljiMhbL32L6q+V6Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Mem-00000009Wkn-3r11;
	Fri, 10 Oct 2025 23:36:16 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Mek-00000009WjP-2xjc
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 23:36:16 +0000
Received: from [127.0.0.2] (unknown [114.241.81.247])
	by APP-05 (Coremail) with SMTP id zQCowADHaxVUmOloXC2IDQ--.41211S6;
	Sat, 11 Oct 2025 07:35:49 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Sat, 11 Oct 2025 07:35:46 +0800
Subject: [PATCH v3 4/5] riscv: bitops: Use __riscv_has_extension_likely
MIME-Version: 1.0
Message-Id: <20251011-riscv-altn-helper-wip-v3-4-d40ddaa1985a@iscas.ac.cn>
References: <20251011-riscv-altn-helper-wip-v3-0-d40ddaa1985a@iscas.ac.cn>
In-Reply-To: <20251011-riscv-altn-helper-wip-v3-0-d40ddaa1985a@iscas.ac.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Paul Walmsley <pjw@kernel.org>
Cc: Charlie Jenkins <charlie@rivosinc.com>, 
 Xiao Wang <xiao.w.wang@intel.com>, 
 =?utf-8?q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Vivian Wang <uwu@dram.page>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-CM-TRANSID: zQCowADHaxVUmOloXC2IDQ--.41211S6
X-Coremail-Antispam: 1UD129KBjvJXoWxGrW8Kw18Kw4kWr15tr18Krg_yoW5Crykpr
	95K347JFWDta45uFZFyryfXr4ruw47G393GrWS93y8AFWUA39a9r90k3WFkr15AFWvga47
	Zr4UJ3s3W3W5Xw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmq14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
	1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j
	6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7V
	C0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j
	6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x0262
	8vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE
	7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI
	8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWU
	CwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
	WUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIY
	CTnIWIevJa73UjIFyTuYvjfUOyIUUUUUU
X-Originating-IP: [114.241.81.247]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_163615_124308_1CEBCD37 
X-CRM114-Status: UNSURE (   9.71  )
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

Use __riscv_has_extension_likely() to check for RISCV_ISA_EXT_ZBB,
replacing the use of asm goto with ALTERNATIVE.

The "likely" variant is used to match the behavior of the original
implementation using ALTERNATIVE("j %l[legacy]", "nop", ...).

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 arch/riscv/include/asm/bitops.h | 32 ++++++++------------------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
index 77880677b06e03875721f33515a6d2ac9166c373..d566747a341bb2e04a63eb5455656fd73585bc55 100644
--- a/arch/riscv/include/asm/bitops.h
+++ b/arch/riscv/include/asm/bitops.h
@@ -47,9 +47,8 @@
 
 static __always_inline __attribute_const__ unsigned long variable__ffs(unsigned long word)
 {
-	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
-				      RISCV_ISA_EXT_ZBB, 1)
-			  : : : : legacy);
+	if (!__riscv_has_extension_likely(0, RISCV_ISA_EXT_ZBB))
+		return generic___ffs(word);
 
 	asm volatile (".option push\n"
 		      ".option arch,+zbb\n"
@@ -58,9 +57,6 @@ static __always_inline __attribute_const__ unsigned long variable__ffs(unsigned
 		      : "=r" (word) : "r" (word) :);
 
 	return word;
-
-legacy:
-	return generic___ffs(word);
 }
 
 /**
@@ -76,9 +72,8 @@ static __always_inline __attribute_const__ unsigned long variable__ffs(unsigned
 
 static __always_inline __attribute_const__ unsigned long variable__fls(unsigned long word)
 {
-	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
-				      RISCV_ISA_EXT_ZBB, 1)
-			  : : : : legacy);
+	if (!__riscv_has_extension_likely(0, RISCV_ISA_EXT_ZBB))
+		return generic___fls(word);
 
 	asm volatile (".option push\n"
 		      ".option arch,+zbb\n"
@@ -87,9 +82,6 @@ static __always_inline __attribute_const__ unsigned long variable__fls(unsigned
 		      : "=r" (word) : "r" (word) :);
 
 	return BITS_PER_LONG - 1 - word;
-
-legacy:
-	return generic___fls(word);
 }
 
 /**
@@ -105,9 +97,8 @@ static __always_inline __attribute_const__ unsigned long variable__fls(unsigned
 
 static __always_inline __attribute_const__ int variable_ffs(int x)
 {
-	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
-				      RISCV_ISA_EXT_ZBB, 1)
-			  : : : : legacy);
+	if (!__riscv_has_extension_likely(0, RISCV_ISA_EXT_ZBB))
+		return generic_ffs(x);
 
 	if (!x)
 		return 0;
@@ -119,9 +110,6 @@ static __always_inline __attribute_const__ int variable_ffs(int x)
 		      : "=r" (x) : "r" (x) :);
 
 	return x + 1;
-
-legacy:
-	return generic_ffs(x);
 }
 
 /**
@@ -137,9 +125,8 @@ static __always_inline __attribute_const__ int variable_ffs(int x)
 
 static __always_inline int variable_fls(unsigned int x)
 {
-	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
-				      RISCV_ISA_EXT_ZBB, 1)
-			  : : : : legacy);
+	if (!__riscv_has_extension_likely(0, RISCV_ISA_EXT_ZBB))
+		return generic_fls(x);
 
 	if (!x)
 		return 0;
@@ -151,9 +138,6 @@ static __always_inline int variable_fls(unsigned int x)
 		      : "=r" (x) : "r" (x) :);
 
 	return 32 - x;
-
-legacy:
-	return generic_fls(x);
 }
 
 /**

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
