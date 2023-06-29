Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5EACEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 08:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vH9IuCVywwDi+6I7V+FRDf3krcobQbyNkybxl3F/7KQ=; b=rjBJhcmf5giJM0
	5+dbXLusapEmNyzYAzuyyzOll7mhg58hvZcfbFlOqpq/L5t/0Lz+vDyv/GcG6H4C8GppHeGjPVjDH
	aNgc206jNd2ue7sfBaOVxzUgboKlBaDt+CZocaK7wYhIRIGciW0nJvbF/TjKogt2yD698RZpwqTxw
	P83C+3fYLXzUInXdPbxBEgapz7cdpViLQavdk9zoJaPeZyLktUcgbdsYDIQAYdkNhVOWdGIJrlMeO
	SeWibrPABTy4RGensKXV60uPDwkDxCLspsmygWB/kPlCJTzZMGTgNgr6HTFGKc28u7kkBlStW4t2R
	2OE0QFiOH6ueSAZY7ZnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEn2t-000OCE-1o;
	Thu, 29 Jun 2023 08:30:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEn2d-000O0z-1Y
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 08:30:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688027415; x=1719563415;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iGe+YwVNmPq1+zqO9UyiaCBbCGF6aB1MOiyT8TFuwhg=;
  b=f4gArxWGpv6WLeLSGXIwKN0TqUHDSOq6QKSYuY3gdZB8EJZY+VHKwp/9
   vqIYmp9TwPeFPEeyUTgkg6Dc7mdrODv7pvV3gppK9/+dVFbc/pvHiwKm6
   oCX2qiqTdjOouUqOBguhc2q4087G9tlpJ7GDNV9w7IpyElFXXQa4f8YDN
   tXP2l32aXaCIh4zguMHooJiFM+3kX3zKhnKUG8yGxcNpUsrhbWQevT4gV
   fp6hn/jXB3YUwxHCOJVgSnsFcQpQD0KhtW3JxTQ9foLfSY5FCWvg8lPJD
   UoF/130yPpJtumPV9IPC9MSY4Y5sALStW2h34ZAElLIX3gLjBfm9Y7ezO
   w==;
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="159104706"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Jun 2023 01:30:11 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 29 Jun 2023 01:30:06 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Thu, 29 Jun 2023 01:30:03 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v2 07/10] RISC-V: split riscv_fill_hwcap() in 3
Date: Thu, 29 Jun 2023 09:28:53 +0100
Message-ID: <20230629-hazy-creative-cd4e936f6d99@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230629-rebuttal-vagueness-a699deb7c7b3@wendy>
References: <20230629-rebuttal-vagueness-a699deb7c7b3@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11968; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=iGe+YwVNmPq1+zqO9UyiaCBbCGF6aB1MOiyT8TFuwhg=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClzHQ4LM/6OtAp34fj85oLWvKcLvr55Ix0nsrr0QWHO1wVv PpnGdZSyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAitXcY/tfI7WhwKOthvOXFECvB+y 8y9ceqfOecoPgVVVP2furf1cHwPyzNYv2ZJY9X9JgGOpv7Gfqtvn3vi8VNxeuH9wlF3lPbyAsA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_013015_615424_A8A2478E 
X-CRM114-Status: GOOD (  30.02  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, conor@kernel.org, conor.dooley@microchip.com, Rob Herring <robh+dt@kernel.org>, Evan
 Green <evan@rivosinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Before adding more complexity to it, split riscv_fill_hwcap() into 3
distinct sections:
- riscv_fill_hwcap() still is the top level function, into which the
  additional complexity will be added.
- riscv_fill_hwcap_from_isa_string() handles getting the information
  from the riscv,isa/ACPI equivalent across harts & the various quirks
  there
- riscv_parse_isa_string() does what it says on the tin.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v2:
- Drop unused variables
---
 arch/riscv/kernel/cpufeature.c | 345 +++++++++++++++++----------------
 1 file changed, 177 insertions(+), 168 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index bf7e8e8852f0..41aedeaecb61 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -178,29 +178,172 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 
 const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
 
-void __init riscv_fill_hwcap(void)
+static void __init riscv_parse_isa_string(unsigned long *this_hwcap, struct riscv_isainfo *isainfo,
+					  unsigned long *isa2hwcap, const char *isa)
+{
+	/*
+	 * For all possible cpus, we have already validated in
+	 * the boot process that they at least contain "rv" and
+	 * whichever of "32"/"64" this kernel supports, and so this
+	 * section can be skipped.
+	 */
+	isa += 4;
+
+	while (*isa) {
+		const char *ext = isa++;
+		const char *ext_end = isa;
+		bool ext_long = false, ext_err = false;
+
+		switch (*ext) {
+		case 's':
+			/*
+			 * Workaround for invalid single-letter 's' & 'u'(QEMU).
+			 * No need to set the bit in riscv_isa as 's' & 'u' are
+			 * not valid ISA extensions. It works until multi-letter
+			 * extension starting with "Su" appears.
+			 */
+			if (ext[-1] != '_' && ext[1] == 'u') {
+				++isa;
+				ext_err = true;
+				break;
+			}
+			fallthrough;
+		case 'S':
+		case 'x':
+		case 'X':
+		case 'z':
+		case 'Z':
+			/*
+			 * Before attempting to parse the extension itself, we find its end.
+			 * As multi-letter extensions must be split from other multi-letter
+			 * extensions with an "_", the end of a multi-letter extension will
+			 * either be the null character or the "_" at the start of the next
+			 * multi-letter extension.
+			 *
+			 * Next, as the extensions version is currently ignored, we
+			 * eliminate that portion. This is done by parsing backwards from
+			 * the end of the extension, removing any numbers. This may be a
+			 * major or minor number however, so the process is repeated if a
+			 * minor number was found.
+			 *
+			 * ext_end is intended to represent the first character *after* the
+			 * name portion of an extension, but will be decremented to the last
+			 * character itself while eliminating the extensions version number.
+			 * A simple re-increment solves this problem.
+			 */
+			ext_long = true;
+			for (; *isa && *isa != '_'; ++isa)
+				if (unlikely(!isalnum(*isa)))
+					ext_err = true;
+
+			ext_end = isa;
+			if (unlikely(ext_err))
+				break;
+
+			if (!isdigit(ext_end[-1]))
+				break;
+
+			while (isdigit(*--ext_end))
+				;
+
+			if (tolower(ext_end[0]) != 'p' || !isdigit(ext_end[-1])) {
+				++ext_end;
+				break;
+			}
+
+			while (isdigit(*--ext_end))
+				;
+
+			++ext_end;
+			break;
+		default:
+			/*
+			 * Things are a little easier for single-letter extensions, as they
+			 * are parsed forwards.
+			 *
+			 * After checking that our starting position is valid, we need to
+			 * ensure that, when isa was incremented at the start of the loop,
+			 * that it arrived at the start of the next extension.
+			 *
+			 * If we are already on a non-digit, there is nothing to do. Either
+			 * we have a multi-letter extension's _, or the start of an
+			 * extension.
+			 *
+			 * Otherwise we have found the current extension's major version
+			 * number. Parse past it, and a subsequent p/minor version number
+			 * if present. The `p` extension must not appear immediately after
+			 * a number, so there is no fear of missing it.
+			 *
+			 */
+			if (unlikely(!isalpha(*ext))) {
+				ext_err = true;
+				break;
+			}
+
+			if (!isdigit(*isa))
+				break;
+
+			while (isdigit(*++isa))
+				;
+
+			if (tolower(*isa) != 'p')
+				break;
+
+			if (!isdigit(*++isa)) {
+				--isa;
+				break;
+			}
+
+			while (isdigit(*++isa))
+				;
+
+			break;
+		}
+
+		/*
+		 * The parser expects that at the start of an iteration isa points to the
+		 * first character of the next extension. As we stop parsing an extension
+		 * on meeting a non-alphanumeric character, an extra increment is needed
+		 * where the succeeding extension is a multi-letter prefixed with an "_".
+		 */
+		if (*isa == '_')
+			++isa;
+
+#define SET_ISA_EXT_MAP(name, bit)						\
+		do {								\
+			if ((ext_end - ext == sizeof(name) - 1) &&		\
+			     !strncasecmp(ext, name, sizeof(name) - 1) &&	\
+			     riscv_isa_extension_check(bit))			\
+				set_bit(bit, isainfo->isa);			\
+		} while (false)							\
+
+		if (unlikely(ext_err))
+			continue;
+		if (!ext_long) {
+			int nr = tolower(*ext) - 'a';
+
+			if (riscv_isa_extension_check(nr)) {
+				*this_hwcap |= isa2hwcap[nr];
+				set_bit(nr, isainfo->isa);
+			}
+		} else {
+			for (int i = 0; i < riscv_isa_ext_count; i++)
+				SET_ISA_EXT_MAP(riscv_isa_ext[i].name,
+						riscv_isa_ext[i].id);
+		}
+#undef SET_ISA_EXT_MAP
+	}
+}
+
+static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
 {
 	struct device_node *node;
 	const char *isa;
-	char print_str[NUM_ALPHA_EXTS + 1];
-	int i, j, rc;
-	unsigned long isa2hwcap[26] = {0};
+	int rc;
 	struct acpi_table_header *rhct;
 	acpi_status status;
 	unsigned int cpu;
 
-	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
-	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
-	isa2hwcap['a' - 'a'] = COMPAT_HWCAP_ISA_A;
-	isa2hwcap['f' - 'a'] = COMPAT_HWCAP_ISA_F;
-	isa2hwcap['d' - 'a'] = COMPAT_HWCAP_ISA_D;
-	isa2hwcap['c' - 'a'] = COMPAT_HWCAP_ISA_C;
-	isa2hwcap['v' - 'a'] = COMPAT_HWCAP_ISA_V;
-
-	elf_hwcap = 0;
-
-	bitmap_zero(riscv_isa, RISCV_ISA_EXT_MAX);
-
 	if (!acpi_disabled) {
 		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
 		if (ACPI_FAILURE(status))
@@ -232,158 +375,7 @@ void __init riscv_fill_hwcap(void)
 			}
 		}
 
-		/*
-		 * For all possible cpus, we have already validated in
-		 * the boot process that they at least contain "rv" and
-		 * whichever of "32"/"64" this kernel supports, and so this
-		 * section can be skipped.
-		 */
-		isa += 4;
-
-		while (*isa) {
-			const char *ext = isa++;
-			const char *ext_end = isa;
-			bool ext_long = false, ext_err = false;
-
-			switch (*ext) {
-			case 's':
-				/*
-				 * Workaround for invalid single-letter 's' & 'u'(QEMU).
-				 * No need to set the bit in riscv_isa as 's' & 'u' are
-				 * not valid ISA extensions. It works until multi-letter
-				 * extension starting with "Su" appears.
-				 */
-				if (ext[-1] != '_' && ext[1] == 'u') {
-					++isa;
-					ext_err = true;
-					break;
-				}
-				fallthrough;
-			case 'S':
-			case 'x':
-			case 'X':
-			case 'z':
-			case 'Z':
-				/*
-				 * Before attempting to parse the extension itself, we find its end.
-				 * As multi-letter extensions must be split from other multi-letter
-				 * extensions with an "_", the end of a multi-letter extension will
-				 * either be the null character or the "_" at the start of the next
-				 * multi-letter extension.
-				 *
-				 * Next, as the extensions version is currently ignored, we
-				 * eliminate that portion. This is done by parsing backwards from
-				 * the end of the extension, removing any numbers. This may be a
-				 * major or minor number however, so the process is repeated if a
-				 * minor number was found.
-				 *
-				 * ext_end is intended to represent the first character *after* the
-				 * name portion of an extension, but will be decremented to the last
-				 * character itself while eliminating the extensions version number.
-				 * A simple re-increment solves this problem.
-				 */
-				ext_long = true;
-				for (; *isa && *isa != '_'; ++isa)
-					if (unlikely(!isalnum(*isa)))
-						ext_err = true;
-
-				ext_end = isa;
-				if (unlikely(ext_err))
-					break;
-
-				if (!isdigit(ext_end[-1]))
-					break;
-
-				while (isdigit(*--ext_end))
-					;
-
-				if (tolower(ext_end[0]) != 'p' || !isdigit(ext_end[-1])) {
-					++ext_end;
-					break;
-				}
-
-				while (isdigit(*--ext_end))
-					;
-
-				++ext_end;
-				break;
-			default:
-				/*
-				 * Things are a little easier for single-letter extensions, as they
-				 * are parsed forwards.
-				 *
-				 * After checking that our starting position is valid, we need to
-				 * ensure that, when isa was incremented at the start of the loop,
-				 * that it arrived at the start of the next extension.
-				 *
-				 * If we are already on a non-digit, there is nothing to do. Either
-				 * we have a multi-letter extension's _, or the start of an
-				 * extension.
-				 *
-				 * Otherwise we have found the current extension's major version
-				 * number. Parse past it, and a subsequent p/minor version number
-				 * if present. The `p` extension must not appear immediately after
-				 * a number, so there is no fear of missing it.
-				 *
-				 */
-				if (unlikely(!isalpha(*ext))) {
-					ext_err = true;
-					break;
-				}
-
-				if (!isdigit(*isa))
-					break;
-
-				while (isdigit(*++isa))
-					;
-
-				if (tolower(*isa) != 'p')
-					break;
-
-				if (!isdigit(*++isa)) {
-					--isa;
-					break;
-				}
-
-				while (isdigit(*++isa))
-					;
-
-				break;
-			}
-
-			/*
-			 * The parser expects that at the start of an iteration isa points to the
-			 * first character of the next extension. As we stop parsing an extension
-			 * on meeting a non-alphanumeric character, an extra increment is needed
-			 * where the succeeding extension is a multi-letter prefixed with an "_".
-			 */
-			if (*isa == '_')
-				++isa;
-
-#define SET_ISA_EXT_MAP(name, bit)							\
-			do {								\
-				if ((ext_end - ext == sizeof(name) - 1) &&		\
-				     !strncasecmp(ext, name, sizeof(name) - 1) &&	\
-				     riscv_isa_extension_check(bit))			\
-					set_bit(bit, isainfo->isa);			\
-			} while (false)							\
-
-			if (unlikely(ext_err))
-				continue;
-			if (!ext_long) {
-				int nr = tolower(*ext) - 'a';
-
-				if (riscv_isa_extension_check(nr)) {
-					this_hwcap |= isa2hwcap[nr];
-					set_bit(nr, isainfo->isa);
-				}
-			} else {
-				for (int i = 0; i < riscv_isa_ext_count; i++)
-					SET_ISA_EXT_MAP(riscv_isa_ext[i].name,
-							riscv_isa_ext[i].id);
-			}
-#undef SET_ISA_EXT_MAP
-		}
+		riscv_parse_isa_string(&this_hwcap, isainfo, isa2hwcap, isa);
 
 		/*
 		 * Linux requires the following extensions, so we may as well
@@ -420,6 +412,23 @@ void __init riscv_fill_hwcap(void)
 
 	if (!acpi_disabled && rhct)
 		acpi_put_table((struct acpi_table_header *)rhct);
+}
+
+void __init riscv_fill_hwcap(void)
+{
+	char print_str[NUM_ALPHA_EXTS + 1];
+	int i, j;
+	unsigned long isa2hwcap[26] = {0};
+
+	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
+	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
+	isa2hwcap['a' - 'a'] = COMPAT_HWCAP_ISA_A;
+	isa2hwcap['f' - 'a'] = COMPAT_HWCAP_ISA_F;
+	isa2hwcap['d' - 'a'] = COMPAT_HWCAP_ISA_D;
+	isa2hwcap['c' - 'a'] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap['v' - 'a'] = COMPAT_HWCAP_ISA_V;
+
+	riscv_fill_hwcap_from_isa_string(isa2hwcap);
 
 	/* We don't support systems with F but without D, so mask those out
 	 * here. */
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
