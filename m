Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0184ECCD185
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 23:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H+ldZXgKeFJGJmzdXovkrseINDZt8fyamEcsdqvDlTk=; b=azmVFoI/ZovyAg
	4y0Bsq6lPADMKtEK6pIfF8bO8JEEl4CpsliQlxsbJ/6MyYNK2bl+kpEGB9ESejMdEWyedcbSmSFNE
	ZzqxpLNXhrLhPMzQng40GWzvoUqvzk21tyRkToJ5u72bvBBsyrszbndQFwqCx1dpggmWZkAl35iZG
	8X//2IYlelLUvjGMls3VKUguyRAi72z0T3/bUYticI6+t5vVjDppxoiWhQiAHJP1lNQBoylnknsjg
	25U/5Y5yKFTash/XNVto/Lg1t7hDbYHYFJPydfm3k6B2AftKJBZG64o64DSIjmQkyfhvxoiHXmBXS
	M8Wvr1dBEVxcwscoGLgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Meo-00000009Wm7-3qZF;
	Fri, 10 Oct 2025 23:36:18 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Mel-00000009WjS-0jEJ
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 23:36:17 +0000
Received: from [127.0.0.2] (unknown [114.241.81.247])
	by APP-05 (Coremail) with SMTP id zQCowADHaxVUmOloXC2IDQ--.41211S4;
	Sat, 11 Oct 2025 07:35:48 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Sat, 11 Oct 2025 07:35:44 +0800
Subject: [PATCH v3 2/5] riscv: checksum: Use __riscv_has_extension_likely
MIME-Version: 1.0
Message-Id: <20251011-riscv-altn-helper-wip-v3-2-d40ddaa1985a@iscas.ac.cn>
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
X-CM-TRANSID: zQCowADHaxVUmOloXC2IDQ--.41211S4
X-Coremail-Antispam: 1UD129KBjvJXoW3WFy7CF17XF4DXw47JFW5Wrg_yoW7XF17pr
	s3trWfKrykAa4YkryqyrZ5urn8Xw4kGwn8KrsxGry8JF90y3y3Kr95tF1fAry5XFyxta4S
	vayfuw13uF1Yya7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
	M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
	v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
	IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2
	KfnxnUUI43ZEXa7VUbH5lUUUUUU==
X-Originating-IP: [114.241.81.247]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_163615_583435_B070FD5F 
X-CRM114-Status: GOOD (  13.84  )
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
implementation using ALTERNATIVE("j %l[no_zbb]", "nop", ...).

While we're at it, also remove bogus comment about Zbb being likely
available. We have to choose between "likely" and "unlikely" due to
limitations of the asm goto feature, but that does not mean we should
put a bad comment on why we pick "likely" over "unlikely".

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 arch/riscv/include/asm/checksum.h | 13 +++-------
 arch/riscv/lib/csum.c             | 53 +++++++++------------------------------
 2 files changed, 16 insertions(+), 50 deletions(-)

diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/checksum.h
index da378856f1d590e22271b90e803c7e55e8dd22e3..70eb50173fb6ab636f9e1534ce2ba58de5ee5c54 100644
--- a/arch/riscv/include/asm/checksum.h
+++ b/arch/riscv/include/asm/checksum.h
@@ -49,16 +49,11 @@ static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
 	 * ZBB only saves three instructions on 32-bit and five on 64-bit so not
 	 * worth checking if supported without Alternatives.
 	 */
-	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB)) {
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
+	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
+	    __riscv_has_extension_likely(0, RISCV_ISA_EXT_ZBB)) {
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
index 9408f50ca59a8901f7cfbcf3297d1492172c6ea2..420e9eb93e8531bb988823e46f23b0bbb7ca0afb 100644
--- a/arch/riscv/lib/csum.c
+++ b/arch/riscv/lib/csum.c
@@ -40,20 +40,11 @@ __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
 	uproto = (__force unsigned int)htonl(proto);
 	sum += uproto;
 
-	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB)) {
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
+	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
+	    __riscv_has_extension_likely(0, RISCV_ISA_EXT_ZBB)) {
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
@@ -66,7 +57,7 @@ __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
 		: [sum] "+r" (sum), [fold_temp] "=&r" (fold_temp));
 		return (__force __sum16)(sum >> 16);
 	}
-no_zbb:
+
 	sum += ror64(sum, 32);
 	sum >>= 32;
 	return csum_fold((__force __wsum)sum);
@@ -152,21 +143,11 @@ do_csum_with_alignment(const unsigned char *buff, int len)
 	csum = do_csum_common(ptr, end, data);
 
 #ifdef CC_HAS_ASM_GOTO_TIED_OUTPUT
-	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB)) {
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
+	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
+	    __riscv_has_extension_likely(0, RISCV_ISA_EXT_ZBB)) {
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
@@ -204,7 +185,7 @@ do_csum_with_alignment(const unsigned char *buff, int len)
 end:
 		return csum >> 16;
 	}
-no_zbb:
+
 #endif /* CC_HAS_ASM_GOTO_TIED_OUTPUT */
 #ifndef CONFIG_32BIT
 	csum += ror64(csum, 32);
@@ -234,21 +215,11 @@ do_csum_no_alignment(const unsigned char *buff, int len)
 	end = (const unsigned long *)(buff + len);
 	csum = do_csum_common(ptr, end, data);
 
-	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB)) {
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
+	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
+	    __riscv_has_extension_likely(0, RISCV_ISA_EXT_ZBB)) {
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
@@ -274,7 +245,7 @@ do_csum_no_alignment(const unsigned char *buff, int len)
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
