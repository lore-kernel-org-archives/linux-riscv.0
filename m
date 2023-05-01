Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8930C77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  1 May 2023 16:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v3WIxOg6POfWj6CV0sqtLtGFeZtKPkkXuFpUXZKvWGE=; b=Qx6kbafUq5ERJm
	ZqJ8Klgo1948fhm/uf4EX3s9dJtvTuC9KrsyqbL/RO5R+G06WEqULnNThzlpBFSlAeRRfNabFTbqm
	U0GQ/5y3eLIiMa86oRqkNxYpw4V4CSIPw1QN8siz+tumJf+EDU2Hcnb34LOF3SZl2soh1UUHE9YZU
	ZUzmsB2zty2VnTOpi7KciDpUP/9W7D2mcWTIQ1xTWV+YfFlAj0fZE1s2f8xDrqqKguHsHzuIrGptt
	S/6prQy/9lLqG5wGPyKhAWD6KbpmbPaPVlqemeGG84C2YvGymWeCdhkGWf4S+h+bK9NTsxKqhbOCN
	ZoXRe3tsgqydg3CUFggA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptWEv-00GIbm-1H;
	Mon, 01 May 2023 16:19:01 +0000
Received: from out203-205-221-205.mail.qq.com ([203.205.221.205])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptWEs-00GIaz-0m
	for linux-riscv@lists.infradead.org;
	Mon, 01 May 2023 16:18:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1682957928; bh=qjJiyzBNBbUlf4yh42f8z12rbSe6xROgU/PEvKYl9WY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=zsdYFVH+eXgM1V4khs9DxIP/19Uscz+GnMj7CB+thDkHHFGvqKw8GfY51znpeFG7k
	 OxM68HAlGswGg7sdFARFPqP8R3ZyT3U6PWkhEv3m1t7HeFTHRbS2OjyxGs1LAcAAhI
	 ej3f3s4sqlyY15OW28iHYFA+wTwZIaxLjYK6/uP0=
Received: from cyy-pc.lan ([2001:da8:c800:d084:c65a:644a:13d7:e72c])
	by newxmesmtplogicsvrsza10-0.qq.com (NewEsmtp) with SMTP
	id 4A78EECC; Tue, 02 May 2023 00:18:39 +0800
X-QQ-mid: xmsmtpt1682957919tn47q1wz9
Message-ID: <tencent_B30EED51C7235CA1988890E5C658BE35C107@qq.com>
X-QQ-XMAILINFO: MmpliBmRb3iCy16tAaa39EEOagJjQ/rnxcLb/w1MiUhusue37gubn/ccZAhw6G
	 roM8215nTTF3jNos8LmPBjZW0CUOzczJMEAx30b5eg1B9mFyJAkBxz8c/QH3qPkz3vZbUDrUb4mI
	 qtp5jjj4V+Fl30GJmSaWo4p+Ip4nkaGvrWd9+NhSbIeYR3157oy8kOTAr9Y/Xc70PTU3tMlcUd5v
	 U90AcX/zwxWIPS6+DyWPaovc7D6GoJSh1N9AULZpfutwGS9mYMMqlydWY0y5Hg3Iew8WzdOUrJBM
	 nlaMjwGuXng93ZQ0fx3omZkVy4F5D/nxvZfDWY+PbnTbeibCwcoImujyW9/0Il72/1aAdi5IOLcX
	 6WNNpPk1ezubO/bvLQte1+iqX+ajJycr+b4649ZCrkBi1W/PlxYWmlPuJzwyypNDu/5j2W4zRGLC
	 J6h90ijjtsEfm9WSxNd9Ae7+oAzuBUFJW0T0P59n9qpqosvJJ/CdDSen09wPOLH/ffmqa2Ctbjg+
	 x8olpSk2ndGcwjkHE5MPI63jPdi81k+tU7TYjR5iowMota7xdQGOBGYnZgQ76owSJGKKRy3XTLrN
	 44mtvMg7GyCb79bUKYSYFgdp7Ebbu+igBLCjdGpRBbrQiiOGGRtVBQq/0+NP4orBIka6XDkQ8OEB
	 5itRtcTNHUmSmCQeOVBDbQO5mlDLQOamciQYpnTRThh9/FL5fzNEuvtCgxw2E5WBGBKjBINOBysy
	 V0HReKhIFa0EECUoQ5aStcL2CRRr6mN08ITB5F7TobII4dM8u2Vbtul/8fnIB+F6sEQiGNrl2FDi
	 3k5jJY3NtL+8PJAPfpBfr6kboIMbJ2XvFgOguqHZeC7Er7B7N86naNOznEAdTNorPD8P3g41EWE9
	 jJ0fJ4myt3jhRTSFrXHjlCsmJcmBM4jGk3hhy4P0ssPoWc898LrPB1JL8OS7t8OS1u0VV8AN9YJa
	 aaIMDyiyWfkF1JvRmjFAf7EAxZKP7oz188IIA2gLNSOWujrMbVPdDQrheoW9OMSF+91vRC4Eg=
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
	Yangyu Chen <cyy@cyyself.name>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/2] riscv: allow case-insensitive ISA string parsing
Date: Tue,  2 May 2023 00:17:38 +0800
X-OQ-MSGID: <20230501161739.152403-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <tencent_E6911C8D71F5624E432A1AFDF86804C3B509@qq.com>
References: <tencent_E6911C8D71F5624E432A1AFDF86804C3B509@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_091858_576580_63C53F6B 
X-CRM114-Status: GOOD (  15.67  )
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

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 arch/riscv/kernel/cpu.c        |  3 ++-
 arch/riscv/kernel/cpufeature.c | 35 +++++++++++++++++-----------------
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 3df38052dcbd..f4dadbfecd04 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/cpu.h>
+#include <linux/ctype.h>
 #include <linux/init.h>
 #include <linux/seq_file.h>
 #include <linux/of.h>
@@ -42,7 +43,7 @@ int riscv_of_processor_hartid(struct device_node *node, unsigned long *hart)
 		pr_warn("CPU with hartid=%lu has no \"riscv,isa\" property\n", *hart);
 		return -ENODEV;
 	}
-	if (isa[0] != 'r' || isa[1] != 'v') {
+	if (tolower(isa[0]) != 'r' || tolower(isa[1]) != 'v') {
 		pr_warn("CPU with hartid=%lu has an invalid ISA of \"%s\"\n", *hart, isa);
 		return -ENODEV;
 	}
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 52585e088873..af2b468642a4 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -126,13 +126,10 @@ void __init riscv_fill_hwcap(void)
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
@@ -156,13 +153,15 @@ void __init riscv_fill_hwcap(void)
 					break;
 				}
 				fallthrough;
+			case 'S':
 			case 'x':
+			case 'X':
 			case 'z':
+			case 'Z':
 				ext_long = true;
 				/* Multi-letter extension must be delimited */
 				for (; *isa && *isa != '_'; ++isa)
-					if (unlikely(!islower(*isa)
-						     && !isdigit(*isa)))
+					if (unlikely(!isalnum(*isa)))
 						ext_err = true;
 				/* Parse backwards */
 				ext_end = isa;
@@ -173,7 +172,7 @@ void __init riscv_fill_hwcap(void)
 				/* Skip the minor version */
 				while (isdigit(*--ext_end))
 					;
-				if (ext_end[0] != 'p'
+				if (tolower(ext_end[0]) != 'p'
 				    || !isdigit(ext_end[-1])) {
 					/* Advance it to offset the pre-decrement */
 					++ext_end;
@@ -185,7 +184,7 @@ void __init riscv_fill_hwcap(void)
 				++ext_end;
 				break;
 			default:
-				if (unlikely(!islower(*ext))) {
+				if (unlikely(!isalpha(*ext))) {
 					ext_err = true;
 					break;
 				}
@@ -195,7 +194,7 @@ void __init riscv_fill_hwcap(void)
 				/* Skip the minor version */
 				while (isdigit(*++isa))
 					;
-				if (*isa != 'p')
+				if (tolower(*isa) != 'p')
 					break;
 				if (!isdigit(*++isa)) {
 					--isa;
@@ -209,18 +208,18 @@ void __init riscv_fill_hwcap(void)
 			if (*isa != '_')
 				--isa;
 
-#define SET_ISA_EXT_MAP(name, bit)						\
-			do {							\
-				if ((ext_end - ext == sizeof(name) - 1) &&	\
-				     !memcmp(ext, name, sizeof(name) - 1) &&	\
-				     riscv_isa_extension_check(bit))		\
-					set_bit(bit, this_isa);			\
-			} while (false)						\
+#define SET_ISA_EXT_MAP(name, bit)							\
+			do {								\
+				if ((ext_end - ext == sizeof(name) - 1) &&		\
+				     !strncasecmp(ext, name, sizeof(name) - 1) &&	\
+				     riscv_isa_extension_check(bit))			\
+					set_bit(bit, this_isa);				\
+			} while (false)							\
 
 			if (unlikely(ext_err))
 				continue;
 			if (!ext_long) {
-				int nr = *ext - 'a';
+				int nr = tolower(*ext) - 'a';
 
 				if (riscv_isa_extension_check(nr)) {
 					this_hwcap |= isa2hwcap[nr];
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
