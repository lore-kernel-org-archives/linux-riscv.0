Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B0AC6FA8B
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Sep 2022 06:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NA3mg6r2hDQ6nBu2enDM0OMFmirkhp9wq0ndnnxUwDU=; b=bKW0VYoBeHjA2m
	11H2UeJ6mzCzKOCByLHpJkbENf1JEWwyC1ngCkjZgxnZfi1SHvT7anEbsRRtmMU4OEumk8Ap7Btp+
	q3Q8A6yI/I4KCtASKpv26y/fsgfw0NXf9FPrSZFctRMzlTiDDrPoNwx1FX4qxng+xp1fKQxqNYG3z
	B646EBuNzqwlJ/XfH+1fn8MrhFybRTBoCn2qDHsq1nSLWARp8xQqtZ1oQ5SSYBDoccqvhgD7nTFd5
	I/6SksgsRbNQvaIuyOJmcRcwKXnVurAl3x5WIjX1/GjbcvjGfo60B9xz19UicYtRBqWH24FumrZcf
	ygpYDqOpH6+WsJDloFig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obFPR-00DVdj-UQ; Thu, 22 Sep 2022 06:10:05 +0000
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obFPP-00DVch-Bi
	for linux-riscv@lists.infradead.org; Thu, 22 Sep 2022 06:10:04 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id E12DE5C013E;
	Thu, 22 Sep 2022 02:09:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 22 Sep 2022 02:09:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1663826999; x=1663913399; bh=4YJKnNXQtpUjI3Su6aVM4KgAl
	uGM+04lJqhM6atDCbU=; b=hXzwm9+pAbKhMJfsKdF8S1znhZzDuNklA8oMjLvaS
	TiMsb2MoSaH/aYZljM1BJG5h7WGGeZnj1rMPbAegz0RePzow37QH9UbojnacukP7
	gI6Su762xLbs8YsAwEiL6jNfFgX9yDnNjWj+VT1VGnEzMdYvH/19mVcK3rElZXLf
	o+hlXUomOoNMh14EcC4fFrZ6qwKh2y7ejBLMHxecUmqdPgXUudptUBYTTdcvrW7h
	7bezy3MQyc+Y7eWFteyAluhgl3ukRDCDcRNkCH4/MowR+dx2XqZEksaKdIO0Higx
	9itj3fUmhsx+RTgD4rnU5XoUAgHWcZkHEXSMPElUIFBgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1663826999; x=1663913399; bh=4YJKnNXQtpUjI3Su6aVM4KgAluGM+04lJqh
	M6atDCbU=; b=d8yVJY90xOtlxh5jKZn9VPtW8gAl3TH6wciASRedB8NvOy9SQG1
	GQVcuQGhUsPKcL2QJjE2nRWv72hCtTWDv70bYzfyuPoEN5obKmp2S3b6muNEUMXY
	qT0kJsCdNvWm9ABs3dS5PGtC2lraHOQIX590JCG9p+7j3DLoeSmFhYmeziFxe2dQ
	3M/kv8/yVD9mrS3t5PUCtt8qJUXJCnOZjilbLgclRRgZhYV16TLsFUstP0bdQQ51
	ZZzAmLr4+xmLa1/twHg+gvp5zR+JduFc0MfwHhayzqRNFIXSh0NsbjQcrl7TSe7f
	go5+uCn661XuZBpZ0Iw8wb50Kb39vral6jw==
X-ME-Sender: <xms:N_wrY5Ms1qrjrd5YApI4ENdMio90CiVQZQ1CLlhhQGjr_ux7cr43_g>
    <xme:N_wrY78otwIwf2wCIXj6W2YcQQ00xg5k6V2K7wIqlLKk3R8jF-Uv3OQcd96PKb3S9
    jhc4kOGs_OwJ1-6pg>
X-ME-Received: <xmr:N_wrY4RLDOCC1GJvoMC1d5Z9X71YKeipGkEF4i3u9PeQk60bkfVcfzb7iyBQJ7uXc0ORTYix6nS3KzpBgMarbpx5KNyUyO0pZMaXaHz2qER8AFb7LPVc6PUOhZcNdYK0TAchzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefvddguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpeekveelhfejueelleetvdejvdeffeetgeelheeujeffhefgffefkeeh
    hffhkeekgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:N_wrY1srqMvVqxi4PNyxw76LYcEp7tJWs3QORl-7rlcg0MeScY33Mg>
    <xmx:N_wrYxf8tetzt6-I7LPR8EIrpogolmjp-4Fr59APuyutecTr6vvmHA>
    <xmx:N_wrYx2cE7VLg2kedOUNYSGWIfZwB56Jkf3gafOjb9uX2SzkHmoQSg>
    <xmx:N_wrYyXC_68cRu8qOTzM3XsTXzw8suBXOL8BJmMPFg80XFuG-TRUCw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 02:09:59 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel@sholland.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>,
	Dao Lu <daolu@rivosinc.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Fix build with CONFIG_CC_OPTIMIZE_FOR_SIZE=y
Date: Thu, 22 Sep 2022 01:09:58 -0500
Message-Id: <20220922060958.44203-1-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_231003_496911_313F1E65 
X-CRM114-Status: GOOD (  12.51  )
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

commit 8eb060e10185 ("arch/riscv: add Zihintpause support") broke
building with CONFIG_CC_OPTIMIZE_FOR_SIZE enabled (gcc 11.1.0):

  CC      arch/riscv/kernel/vdso/vgettimeofday.o
In file included from <command-line>:
./arch/riscv/include/asm/jump_label.h: In function 'cpu_relax':
././include/linux/compiler_types.h:285:33: warning: 'asm' operand 0 probably does not match constraints
  285 | #define asm_volatile_goto(x...) asm goto(x)
      |                                 ^~~
./arch/riscv/include/asm/jump_label.h:41:9: note: in expansion of macro 'asm_volatile_goto'
   41 |         asm_volatile_goto(
      |         ^~~~~~~~~~~~~~~~~
././include/linux/compiler_types.h:285:33: error: impossible constraint in 'asm'
  285 | #define asm_volatile_goto(x...) asm goto(x)
      |                                 ^~~
./arch/riscv/include/asm/jump_label.h:41:9: note: in expansion of macro 'asm_volatile_goto'
   41 |         asm_volatile_goto(
      |         ^~~~~~~~~~~~~~~~~
make[1]: *** [scripts/Makefile.build:249: arch/riscv/kernel/vdso/vgettimeofday.o] Error 1
make: *** [arch/riscv/Makefile:128: vdso_prepare] Error 2

Having a static branch in cpu_relax() is problematic because that
function is widely inlined, including in some quite complex functions
like in the VDSO. A quick measurement shows this static branch is
responsible by itself for around 40% of the jump table.

Drop the static branch, which ends up being the same number of
instructions anyway. If Zihintpause is supported, we trade the nop from
the static branch for a div. If Zihintpause is unsupported, we trade the
jump from the static branch for (what gets interpreted as) a nop.

Fixes: 8eb060e10185 ("arch/riscv: add Zihintpause support")
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 arch/riscv/include/asm/hwcap.h          |  3 ---
 arch/riscv/include/asm/vdso/processor.h | 25 ++++++++++---------------
 2 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 6f59ec64175e..b21d46e68386 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -68,7 +68,6 @@ enum riscv_isa_ext_id {
  */
 enum riscv_isa_ext_key {
 	RISCV_ISA_EXT_KEY_FPU,		/* For 'F' and 'D' */
-	RISCV_ISA_EXT_KEY_ZIHINTPAUSE,
 	RISCV_ISA_EXT_KEY_MAX,
 };
 
@@ -88,8 +87,6 @@ static __always_inline int riscv_isa_ext2key(int num)
 		return RISCV_ISA_EXT_KEY_FPU;
 	case RISCV_ISA_EXT_d:
 		return RISCV_ISA_EXT_KEY_FPU;
-	case RISCV_ISA_EXT_ZIHINTPAUSE:
-		return RISCV_ISA_EXT_KEY_ZIHINTPAUSE;
 	default:
 		return -EINVAL;
 	}
diff --git a/arch/riscv/include/asm/vdso/processor.h b/arch/riscv/include/asm/vdso/processor.h
index 1e4f8b4aef79..789bdb8211a2 100644
--- a/arch/riscv/include/asm/vdso/processor.h
+++ b/arch/riscv/include/asm/vdso/processor.h
@@ -4,30 +4,25 @@
 
 #ifndef __ASSEMBLY__
 
-#include <linux/jump_label.h>
 #include <asm/barrier.h>
-#include <asm/hwcap.h>
 
 static inline void cpu_relax(void)
 {
-	if (!static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_ZIHINTPAUSE])) {
 #ifdef __riscv_muldiv
-		int dummy;
-		/* In lieu of a halt instruction, induce a long-latency stall. */
-		__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
+	int dummy;
+	/* In lieu of a halt instruction, induce a long-latency stall. */
+	__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
 #endif
-	} else {
-		/*
-		 * Reduce instruction retirement.
-		 * This assumes the PC changes.
-		 */
+	/*
+	 * Reduce instruction retirement.
+	 * This assumes the PC changes.
+	 */
 #ifdef __riscv_zihintpause
-		__asm__ __volatile__ ("pause");
+	__asm__ __volatile__ ("pause");
 #else
-		/* Encoding of the pause instruction */
-		__asm__ __volatile__ (".4byte 0x100000F");
+	/* Encoding of the pause instruction */
+	__asm__ __volatile__ (".4byte 0x100000F");
 #endif
-	}
 	barrier();
 }
 
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
