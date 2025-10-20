Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32BCCCD193
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 09:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Htmib5ackO+cOJM//1XjzYxrT7V6vYwdwUAaXRF/m10=; b=mASlAvGT56z4W1
	LJUFQWUB18A3/WUl04X3l81mhZ58tfOhnouf6dA91++KX4KkvEaPNRHnyJwNDJmGlzpAJpxeNO5Od
	vCFgN0cLVLz5fz5FLotN/mOa0tKNWIKHsp5rxCosWB3AbZcwU7aoSMgNYO9RhNOC99IX217JSo7tK
	+VOBldI5mNch70i835EKZIHWNC2+ziXG/MnVa5nf2LGRDdTr2j7Bu/qDfkNspnsfwwn7UsQIYXLYR
	AvHayVDwDpktyDG63d5bTwWEXImkJkXyOPjL3skVhOCe07VDzKhqlWOv7NSaj0E7aPo9a1C8wwXMM
	SzGPvWQz710EFy5lE8fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlu9-0000000CWPm-3yhT;
	Mon, 20 Oct 2025 09:10:13 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlu6-0000000CWO3-2QMR
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 09:10:12 +0000
Received: from [127.0.0.2] (unknown [114.241.85.109])
	by APP-03 (Coremail) with SMTP id rQCowAD3RoFo_PVo4mflEQ--.23190S6;
	Mon, 20 Oct 2025 17:10:01 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Mon, 20 Oct 2025 17:09:59 +0800
Subject: [PATCH v4 4/5] riscv: bitops: Use riscv_has_extension_likely
MIME-Version: 1.0
Message-Id: <20251020-riscv-altn-helper-wip-v4-4-ef941c87669a@iscas.ac.cn>
References: <20251020-riscv-altn-helper-wip-v4-0-ef941c87669a@iscas.ac.cn>
In-Reply-To: <20251020-riscv-altn-helper-wip-v4-0-ef941c87669a@iscas.ac.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Paul Walmsley <pjw@kernel.org>
Cc: Charlie Jenkins <charlie@rivosinc.com>, 
 Xiao Wang <xiao.w.wang@intel.com>, 
 =?utf-8?q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Vivian Wang <uwu@dram.page>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CM-TRANSID: rQCowAD3RoFo_PVo4mflEQ--.23190S6
X-Coremail-Antispam: 1UD129KBjvJXoWxGrW8Kw1rtFWrCw1DCrWDtwb_yoW5AF4xpr
	97K347JFWDta45uFZFyryfXF4ruw47G3yfGryS9FykAFyUA39a9r90k3WFkr15AFWvga47
	Zr4UJ3sxWa1UXw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUma14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
	3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
	x0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
	JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
	ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
	z7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
	AF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1l
	IxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsG
	vfC2KfnxnUUI43ZEXa7VU1zpBDUUUUU==
X-Originating-IP: [114.241.85.109]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_021011_502654_A805208C 
X-CRM114-Status: UNSURE (   9.62  )
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

Use riscv_has_extension_likely() to check for RISCV_ISA_EXT_ZBB,
replacing the use of asm goto with ALTERNATIVE.

The "likely" variant is used to match the behavior of the original
implementation using ALTERNATIVE("j %l[legacy]", "nop", ...).

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 arch/riscv/include/asm/bitops.h | 32 ++++++++------------------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
index 77880677b06e..238092125c11 100644
--- a/arch/riscv/include/asm/bitops.h
+++ b/arch/riscv/include/asm/bitops.h
@@ -47,9 +47,8 @@
 
 static __always_inline __attribute_const__ unsigned long variable__ffs(unsigned long word)
 {
-	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
-				      RISCV_ISA_EXT_ZBB, 1)
-			  : : : : legacy);
+	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
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
+	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
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
+	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
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
+	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
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
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
