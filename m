Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063A2C77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Apr 2023 14:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s7X/aXaAp5M6SAtl4ifXKFdkWa404yC/PKjAUuDqWCs=; b=Cd0WEKQSL3FESt
	U3BIHzCU9D3dE6P8isSsXsxou8d2GO9S6y9hncMvDDp46Lm0aVs/7gANwNlkM+KoAF3FWPcZLSnvi
	O+Ez/ErmxmCom9m254K2GuC3632dEZ+pOXhSA+7AvF2rCjbxnoi32RojDIn6m3Yj5qCLzxdT9MPjW
	SD7ZK8lcn1YkGLyVLWV1gK3PUX3vSVOUVnElfTjHSIEe38CaTGI+uECAJY25gkiYz4580yQjTW1cZ
	sYMPLUMDB4YxpX6/3WW/PyNV3jTbAXaOlTwzBZBYhfqOSh9aMvJp5mMHO9nBfi6aPTVG/INMCqV77
	jN8IOBmSXMwXZQaGgrVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psOto-00Aryz-2J;
	Fri, 28 Apr 2023 14:16:36 +0000
Received: from out162-62-58-211.mail.qq.com ([162.62.58.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psOtk-00ArsG-1U
	for linux-riscv@lists.infradead.org;
	Fri, 28 Apr 2023 14:16:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1682691382; bh=IzugUJb7/4phjX3Y0sEr22Y1Y7HtJJRn5Ka8RNsPSqE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HvFVTjhgOA2jCesYNl8nXKUG759nQjeUyubHk8SCTMkGFzlR1qLSNagBbhSwrxvuf
	 60AnCakn/SYVVAxNmRjuSs6zrCHkWncWavZ31e3Q18ReQK8Wb360HYxwfPUK4VF7Xw
	 URp698ujHj3257XwgcFr8SQlebyTwipYw5QVnAGw=
Received: from cyy-pc.lan ([2001:da8:c800:d084:c65a:644a:13d7:e72c])
	by newxmesmtplogicsvrszb6-0.qq.com (NewEsmtp) with SMTP
	id 4029CE99; Fri, 28 Apr 2023 22:16:02 +0800
X-QQ-mid: xmsmtpt1682691367tols93pky
Message-ID: <tencent_BC90DDC6093E3E41246D3EC73F5CAB189007@qq.com>
X-QQ-XMAILINFO: OOWntbL6xj16iQ7PhPGnOnEfLWtZacxQviXVXFDf2ZiQ+X+Se+ma44Hrt0ch3D
	 mXTjFs6dNjNSwD1D3DyEYb68Vkj/bU3cT/7B25W+8V8ZYEQEl1QPVzdfLzWjwEYiy0Yr0EXldbdR
	 WgJRb+ln2Xs3Iwk6liVaj0bf+bcc3YSg5TBk47cFvHmw6GIJOl4w8LYFkmflbm7AGyO1c86NIhB0
	 9AIr1eUJxAWFi+JKNgMpXP53P/FPrVZuLoSqgMLQBsUHTMMLWRyr+rIvAat7j2wVL+zxTLbkcBcx
	 jCJBJzmahz9kBasaTrkVOcJ+lBk2FSZE2QSXUVoSqVvgjMuacNFX7ap8Ge/xlPpjtLCMXMVZMH7H
	 3fBHWTpDowHtwOBRVx7oCPD1oSfM0SLVvRtDjakcxQe7uAytBdJbnUKz+vPzhw0ZXBdpAvY4I80u
	 KystQ1rPCj891ikjuGlA2pN7fmaKsuULC8SxM1ksYa1WoxT3XnOSdAzeF3OnGwyCBwelHsBjRqj6
	 TgIBzzoDwkoDfwq0LTMvyKIKcIFJ6IGA1AX7EqvISqplNzEs1aWAhMP/Lf+Q2RVMCYQWaXOMUcxU
	 RKrwcVmBzqazWg9AfnNHCEM1bKXVyudwN/f1w67z0PlCFxARfz8/l9OIY/QLoly8kgyOihZaKPSN
	 nX1221/ugcDUQkD6OahkNgWjtc/qROYDiq+bo2E9h86uKnKLVqqQjnL78Zla1v8feS7Om7yotv/5
	 3gTRKLNxDvRNZwemwkiM2s+rnPnT8rM6xl5U6hRrlU+zxPadim5Qlqu+0l/LicRF909kZMa0IK/N
	 TlAYzYjcyZ0AZ9gl2oE5z/HILUKm/M+DfORrXFlomMmISHETVaQ3GAbqV0RVGMfjGSvs/97wYvgY
	 YtNbJR4T5W/96cESl3ZapV1LFHPEQ60oAe8pew0co3DleZZkMbE0OCLaetU44iuxijCjvp/QA2G0
	 vKFJ2tkr+lsOnHbSJiyyeCl/4UY00h2A8A62qdRdoNWUlmgDPMgkRnGA2qafR2
From: Yangyu Chen <cyy@cyyself.name>
To: Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Jones <ajones@ventanamicro.com>,
	Wende Tan <twd2.me@gmail.com>,
	Soha Jin <soha@lohu.info>,
	Hongren Zheng <i@zenithal.me>,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v2 1/2] riscv: allow case-insensitive ISA string parsing
Date: Fri, 28 Apr 2023 22:16:00 +0800
X-OQ-MSGID: <20230428141601.678489-2-cyy@cyyself.name>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230428141601.678489-1-cyy@cyyself.name>
References: <20230428141601.678489-1-cyy@cyyself.name>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_071633_131122_EF824FDC 
X-CRM114-Status: GOOD (  16.29  )
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

According to RISC-V Hart Capabilities Table (RHCT) description in UEFI
Forum ECR, the format of the ISA string is defined in the RISC-V
unprivileged specification which is case-insensitive. However, the
current ISA string parser in the kernel does not support ISA strings
with uppercase letters.

This patch modifies the ISA string parser in the kernel to support
case-insensitive ISA string parsing.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 arch/riscv/kernel/cpu.c        |  3 ++-
 arch/riscv/kernel/cpufeature.c | 25 ++++++++++++-------------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 8400f0cc9704..52b92a267121 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/cpu.h>
+#include <linux/ctype.h>
 #include <linux/init.h>
 #include <linux/seq_file.h>
 #include <linux/of.h>
@@ -41,7 +42,7 @@ int riscv_of_processor_hartid(struct device_node *node, unsigned long *hart)
 		pr_warn("CPU with hartid=%lu has no \"riscv,isa\" property\n", *hart);
 		return -ENODEV;
 	}
-	if (isa[0] != 'r' || isa[1] != 'v') {
+	if (tolower(isa[0]) != 'r' || tolower(isa[1]) != 'v') {
 		pr_warn("CPU with hartid=%lu has an invalid ISA of \"%s\"\n", *hart, isa);
 		return -ENODEV;
 	}
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 59d58ee0f68d..d1991c12e546 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -119,13 +119,10 @@ void __init riscv_fill_hwcap(void)
 		}
 
 		temp = isa;
-#if IS_ENABLED(CONFIG_32BIT)
-		if (!strncmp(isa, "rv32", 4))
+		if (IS_ENABLED(CONFIG_32BIT) && !strncasecmp(isa, "rv32", 4))
 			isa += 4;
-#elif IS_ENABLED(CONFIG_64BIT)
-		if (!strncmp(isa, "rv64", 4))
+		else if (IS_ENABLED(CONFIG_64BIT) && !strncasecmp(isa, "rv64", 4))
 			isa += 4;
-#endif
 		/* The riscv,isa DT property must start with rv64 or rv32 */
 		if (temp == isa)
 			continue;
@@ -136,6 +133,7 @@ void __init riscv_fill_hwcap(void)
 			bool ext_long = false, ext_err = false;
 
 			switch (*ext) {
+			case 'S':
 			case 's':
 				/**
 				 * Workaround for invalid single-letter 's' & 'u'(QEMU).
@@ -143,19 +141,20 @@ void __init riscv_fill_hwcap(void)
 				 * not valid ISA extensions. It works until multi-letter
 				 * extension starting with "Su" appears.
 				 */
-				if (ext[-1] != '_' && ext[1] == 'u') {
+				if (ext[-1] != '_' && tolower(ext[1]) == 'u') {
 					++isa;
 					ext_err = true;
 					break;
 				}
 				fallthrough;
+			case 'X':
 			case 'x':
+			case 'Z':
 			case 'z':
 				ext_long = true;
 				/* Multi-letter extension must be delimited */
 				for (; *isa && *isa != '_'; ++isa)
-					if (unlikely(!islower(*isa)
-						     && !isdigit(*isa)))
+					if (unlikely(!isalnum(*isa)))
 						ext_err = true;
 				/* Parse backwards */
 				ext_end = isa;
@@ -166,7 +165,7 @@ void __init riscv_fill_hwcap(void)
 				/* Skip the minor version */
 				while (isdigit(*--ext_end))
 					;
-				if (ext_end[0] != 'p'
+				if (tolower(ext_end[0]) != 'p'
 				    || !isdigit(ext_end[-1])) {
 					/* Advance it to offset the pre-decrement */
 					++ext_end;
@@ -178,7 +177,7 @@ void __init riscv_fill_hwcap(void)
 				++ext_end;
 				break;
 			default:
-				if (unlikely(!islower(*ext))) {
+				if (unlikely(!isalpha(*ext))) {
 					ext_err = true;
 					break;
 				}
@@ -188,7 +187,7 @@ void __init riscv_fill_hwcap(void)
 				/* Skip the minor version */
 				while (isdigit(*++isa))
 					;
-				if (*isa != 'p')
+				if (tolower(*isa) != 'p')
 					break;
 				if (!isdigit(*++isa)) {
 					--isa;
@@ -205,7 +204,7 @@ void __init riscv_fill_hwcap(void)
 #define SET_ISA_EXT_MAP(name, bit)						\
 			do {							\
 				if ((ext_end - ext == sizeof(name) - 1) &&	\
-				     !memcmp(ext, name, sizeof(name) - 1) &&	\
+				     !strncasecmp(ext, name, sizeof(name) - 1) &&	\
 				     riscv_isa_extension_check(bit))		\
 					set_bit(bit, this_isa);			\
 			} while (false)						\
@@ -213,7 +212,7 @@ void __init riscv_fill_hwcap(void)
 			if (unlikely(ext_err))
 				continue;
 			if (!ext_long) {
-				int nr = *ext - 'a';
+				int nr = tolower(*ext) - 'a';
 
 				if (riscv_isa_extension_check(nr)) {
 					this_hwcap |= isa2hwcap[nr];
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
