Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B53CCA0EE4
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 14:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q8nvDU9tAZ4DjeJrwXPeEgygUA6AToJ5uS5g9VqwUQE=; b=zRgCZrYYbtq1/m
	ohJq0ETKrfZZrFZqsW0/pBMILvapMx0cI2EheFK//kKaTZ+WGx7OK+a/FzSIZV6mxoCxgKPWo3q4Q
	y29f6YubgdD33PRnDyzXpbjxy4UR6yNwqYfO1/ZNVbgkQGb4RCJ0Rdbmt7K5CCS96vZf+pDBDl7Pp
	w2fXuets2u9mLv++UXFHl+I4Ii2VyCu0J/NjAnTm34NtokrIcS+oIpVKwyUGlP1NHQWxHjiaG9gpp
	4GDiqxfEcZ/wMhPfdApo0hukrWFWCmkyoySloTn2IGEmDlabgqnxRX6zGHg+SLw0XnzfM1A0k2osi
	pKzIm+nnEmJA5YKyOSSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojw8-0000000E6nF-0WWz;
	Wed, 20 Aug 2025 14:37:12 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoj7a-0000000DsQm-0nLT
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 13:45:00 +0000
Received: from [127.0.0.2] (unknown [114.241.87.235])
	by APP-01 (Coremail) with SMTP id qwCowABHN6tT0aVogOTBDQ--.24665S5;
	Wed, 20 Aug 2025 21:44:52 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Wed, 20 Aug 2025 21:44:47 +0800
Subject: [PATCH 3/6] riscv: checksum: Convert to use_alternative_likely
MIME-Version: 1.0
Message-Id: <20250820-riscv-altn-helper-wip-v1-3-c3c626c1f7e6@iscas.ac.cn>
References: <20250820-riscv-altn-helper-wip-v1-0-c3c626c1f7e6@iscas.ac.cn>
In-Reply-To: <20250820-riscv-altn-helper-wip-v1-0-c3c626c1f7e6@iscas.ac.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>, Vivian Wang <uwu@dram.page>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-CM-TRANSID: qwCowABHN6tT0aVogOTBDQ--.24665S5
X-Coremail-Antispam: 1UD129KBjvJXoW3ArWrAF43ur1fWFyDWr17ZFb_yoW7XrWrpF
	s3trWrKFykCa4Sk34qyrZ8Wrn8Xw4kGwn8KrsxGry8AF90y3sxKr1DtF13Ary5XFyIqa4S
	yayfuw1a93W5AaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVj
	vjDU0xZFpf9x0JUHWlkUUUUU=
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_064458_590600_0CF45698 
X-CRM114-Status: GOOD (  14.05  )
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
implementation using ALTERNATIVE("j %l[no_zbb]", "nop", ...).

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 arch/riscv/include/asm/checksum.h | 13 +++-----
 arch/riscv/lib/csum.c             | 65 +++++++++++++++------------------------
 2 files changed, 28 insertions(+), 50 deletions(-)

diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/checksum.h
index da378856f1d590e22271b90e803c7e55e8dd22e3..14f3942007b55646a0feb82bf73351323350347e 100644
--- a/arch/riscv/include/asm/checksum.h
+++ b/arch/riscv/include/asm/checksum.h
@@ -49,16 +49,11 @@ static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
 	 * ZBB only saves three instructions on 32-bit and five on 64-bit so not
 	 * worth checking if supported without Alternatives.
 	 */
-	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB)) {
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
+	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
+	    use_alternative_likely(0, RISCV_ISA_EXT_ZBB)) {
 		unsigned long fold_temp;
 
-		asm goto(ALTERNATIVE("j %l[no_zbb]", "nop", 0,
-					      RISCV_ISA_EXT_ZBB, 1)
-		    :
-		    :
-		    :
-		    : no_zbb);
-
 		if (IS_ENABLED(CONFIG_32BIT)) {
 			asm(".option push				\n\
 			.option arch,+zbb				\n\
@@ -81,7 +76,7 @@ static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
 		}
 		return (__force __sum16)(csum >> 16);
 	}
-no_zbb:
+
 #ifndef CONFIG_32BIT
 	csum += ror64(csum, 32);
 	csum >>= 32;
diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
index 9408f50ca59a8901f7cfbcf3297d1492172c6ea2..659d3b51d0db1010deda042134bdef1f79cf8b42 100644
--- a/arch/riscv/lib/csum.c
+++ b/arch/riscv/lib/csum.c
@@ -40,20 +40,15 @@ __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
 	uproto = (__force unsigned int)htonl(proto);
 	sum += uproto;
 
-	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB)) {
+	/*
+	 * Zbb is likely available when the kernel is compiled with Zbb
+	 * support.
+	 */
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
+	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
+	    use_alternative_likely(0, RISCV_ISA_EXT_ZBB)) {
 		unsigned long fold_temp;
 
-		/*
-		 * Zbb is likely available when the kernel is compiled with Zbb
-		 * support, so nop when Zbb is available and jump when Zbb is
-		 * not available.
-		 */
-		asm goto(ALTERNATIVE("j %l[no_zbb]", "nop", 0,
-					      RISCV_ISA_EXT_ZBB, 1)
-				  :
-				  :
-				  :
-				  : no_zbb);
 		asm(".option push					\n\
 		.option arch,+zbb					\n\
 			rori	%[fold_temp], %[sum], 32		\n\
@@ -66,7 +61,7 @@ __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
 		: [sum] "+r" (sum), [fold_temp] "=&r" (fold_temp));
 		return (__force __sum16)(sum >> 16);
 	}
-no_zbb:
+
 	sum += ror64(sum, 32);
 	sum >>= 32;
 	return csum_fold((__force __wsum)sum);
@@ -151,22 +146,16 @@ do_csum_with_alignment(const unsigned char *buff, int len)
 	end = (const unsigned long *)(buff + len);
 	csum = do_csum_common(ptr, end, data);
 
+	/*
+	 * Zbb is likely available when the kernel is compiled with Zbb
+	 * support.
+	 */
 #ifdef CC_HAS_ASM_GOTO_TIED_OUTPUT
-	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB)) {
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
+	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
+	    use_alternative_likely(0, RISCV_ISA_EXT_ZBB)) {
 		unsigned long fold_temp;
 
-		/*
-		 * Zbb is likely available when the kernel is compiled with Zbb
-		 * support, so nop when Zbb is available and jump when Zbb is
-		 * not available.
-		 */
-		asm goto(ALTERNATIVE("j %l[no_zbb]", "nop", 0,
-					      RISCV_ISA_EXT_ZBB, 1)
-				  :
-				  :
-				  :
-				  : no_zbb);
-
 #ifdef CONFIG_32BIT
 		asm_goto_output(".option push			\n\
 		.option arch,+zbb				\n\
@@ -204,7 +193,7 @@ do_csum_with_alignment(const unsigned char *buff, int len)
 end:
 		return csum >> 16;
 	}
-no_zbb:
+
 #endif /* CC_HAS_ASM_GOTO_TIED_OUTPUT */
 #ifndef CONFIG_32BIT
 	csum += ror64(csum, 32);
@@ -234,21 +223,15 @@ do_csum_no_alignment(const unsigned char *buff, int len)
 	end = (const unsigned long *)(buff + len);
 	csum = do_csum_common(ptr, end, data);
 
-	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB)) {
+	/*
+	 * Zbb is likely available when the kernel is compiled with Zbb
+	 * support.
+	 */
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
+	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
+	    use_alternative_likely(0, RISCV_ISA_EXT_ZBB)) {
 		unsigned long fold_temp;
 
-		/*
-		 * Zbb is likely available when the kernel is compiled with Zbb
-		 * support, so nop when Zbb is available and jump when Zbb is
-		 * not available.
-		 */
-		asm goto(ALTERNATIVE("j %l[no_zbb]", "nop", 0,
-					      RISCV_ISA_EXT_ZBB, 1)
-				  :
-				  :
-				  :
-				  : no_zbb);
-
 #ifdef CONFIG_32BIT
 		asm (".option push				\n\
 		.option arch,+zbb				\n\
@@ -274,7 +257,7 @@ do_csum_no_alignment(const unsigned char *buff, int len)
 #endif /* !CONFIG_32BIT */
 		return csum >> 16;
 	}
-no_zbb:
+
 #ifndef CONFIG_32BIT
 	csum += ror64(csum, 32);
 	csum >>= 32;

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
