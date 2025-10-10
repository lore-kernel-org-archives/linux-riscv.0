Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C8ECCD18A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 23:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sN+VfZLc9o35u7W07ILrDg2JXM68rzmTDGR1eF8+Ftg=; b=YiEEqVaYvXusAi
	qSBC1sKFWuDDqRpN3LXWBwAPf89UjrW7ojXA0BvdTzUS6VVOzjaRnCQRD+Z7KjZmGlCdPoDTeHe4o
	1YYdf4LthwRSQTbe3zq8w3pJG32vB6CFeZDUaBJHtVFB45dfEm0dE/wWly8OdIHxqsjl57jgbMxlj
	9CBfh8K/Mt2fvAkZYrSIEfpgUt0csVFZiNBK77CyUoNQQyBgLKNRKlSprLHqqJBeMAcTUBVw6RQfw
	3kgH5+slEfIElWnkK9ZBrX1lOfADN4NtMcAMyv3nW3RGFgujNuqGwhlDJjLEezFlbDHft97xHrjG7
	hAbFWRDYWw4P+llEw/jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Men-00000009Wl2-0qYN;
	Fri, 10 Oct 2025 23:36:17 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Mek-00000009WjQ-3bTN
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 23:36:16 +0000
Received: from [127.0.0.2] (unknown [114.241.81.247])
	by APP-05 (Coremail) with SMTP id zQCowADHaxVUmOloXC2IDQ--.41211S5;
	Sat, 11 Oct 2025 07:35:48 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Sat, 11 Oct 2025 07:35:45 +0800
Subject: [PATCH v3 3/5] riscv: hweight: Use __riscv_has_extension_likely
MIME-Version: 1.0
Message-Id: <20251011-riscv-altn-helper-wip-v3-3-d40ddaa1985a@iscas.ac.cn>
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
X-CM-TRANSID: zQCowADHaxVUmOloXC2IDQ--.41211S5
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw4kWFy8WrWDtF43Zw48Xrb_yoW8KF4kpF
	4Iy3s3GFWkJa18uF90yr1kZa1rZan3G347GrW3u3yxXFyjyw4Ykrn8KFn8Cr98tFyvv3WS
	qFWfA343u3W2qaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
	JwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
	kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
	CI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnI
	WIevJa73UjIFyTuYvjfUO_MaUUUUU
X-Originating-IP: [114.241.81.247]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_163615_268019_9DBFDA66 
X-CRM114-Status: UNSURE (   9.66  )
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
 arch/riscv/include/asm/arch_hweight.h | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/include/asm/arch_hweight.h b/arch/riscv/include/asm/arch_hweight.h
index 0e7cdbbec8efd3c293da2fa96a8c6d0a93faf56f..021bc671de299d604a33301e68c10cb1c28ad2c1 100644
--- a/arch/riscv/include/asm/arch_hweight.h
+++ b/arch/riscv/include/asm/arch_hweight.h
@@ -19,10 +19,10 @@
 
 static __always_inline unsigned int __arch_hweight32(unsigned int w)
 {
-#if defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)
-	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
-				      RISCV_ISA_EXT_ZBB, 1)
-			  : : : : legacy);
+	if (!(IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
+	      IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
+	      __riscv_has_extension_likely(0, RISCV_ISA_EXT_ZBB)))
+		return __sw_hweight32(w);
 
 	asm (".option push\n"
 	     ".option arch,+zbb\n"
@@ -31,10 +31,6 @@ static __always_inline unsigned int __arch_hweight32(unsigned int w)
 	     : "=r" (w) : "r" (w) :);
 
 	return w;
-
-legacy:
-#endif
-	return __sw_hweight32(w);
 }
 
 static inline unsigned int __arch_hweight16(unsigned int w)
@@ -50,10 +46,10 @@ static inline unsigned int __arch_hweight8(unsigned int w)
 #if BITS_PER_LONG == 64
 static __always_inline unsigned long __arch_hweight64(__u64 w)
 {
-#if defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)
-	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
-				      RISCV_ISA_EXT_ZBB, 1)
-			  : : : : legacy);
+	if (!(IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
+	      IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
+	      __riscv_has_extension_likely(0, RISCV_ISA_EXT_ZBB)))
+		return __sw_hweight64(w);
 
 	asm (".option push\n"
 	     ".option arch,+zbb\n"
@@ -62,10 +58,6 @@ static __always_inline unsigned long __arch_hweight64(__u64 w)
 	     : "=r" (w) : "r" (w) :);
 
 	return w;
-
-legacy:
-#endif
-	return __sw_hweight64(w);
 }
 #else /* BITS_PER_LONG == 64 */
 static inline unsigned long __arch_hweight64(__u64 w)

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
