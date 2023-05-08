Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDE2C7EE2A
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 18:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x43IEqJZS3Z5NPfQ8chlfRIPzuY4M48Zcj8D1QCFYB0=; b=p5KBXXulpwFm34
	Pq3/vpJTtJjhr37yQJ3SeNxqVHQ0iXSri2MuYHyue7UdUzUDtUa04mCWWYT0/agoPz+1ouezQZq7P
	xkakWfKVRG4O2UMeqmWWkGRq/CBs6vp9y8pEHLNLc6e1UvCtjNTsem2Gm1sdxT6Stxjpw2Q4TNNIg
	5qYOdXkd6IEBZWD5lhpXr8Tia+p/OCd6E2EStAOjQ5DLrWxhos+c1/pFMHJdzgdwe5vCRC9xJlzSa
	ChCf228e4HXkdX1Ks0s0qU89hRYRuya6/YCSLMfXuonEGSTkvzDvM7hrJ8CixsigPKXo5LWpNqPim
	lYP74V8YZ08zELeKiVvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw5QA-0016eb-1o;
	Mon, 08 May 2023 18:17:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw5Q3-0016d3-1H
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 18:17:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B98C062F0F;
	Mon,  8 May 2023 18:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 834AEC433D2;
	Mon,  8 May 2023 18:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683569825;
	bh=m1G1BRdMTCNy9nabH55EoneK/uJPRkjoflMbNgoNWdo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mcnCkZ46j6oxLE98sDmh6+9bihhKsTWmz/1OOC5GKP0XmkLqaeqADDLokqO8i2yeg
	 f04WfpOOh7G2n8F6cSgdUhEastHka1mlLkZIt8mtRKnp102avvMJYzENux1Z1+LXWi
	 P45lZp21BpAkhV0PLNbuN2gnXbJJNB8y+QwDKcEhK+a23j8B4c4D1YJZoP0o8uU0o5
	 s1b4gEScPK7oi5WCNBNwmxZzWzsEu3Q5F+EZ5PNTPED9CUMXQbSQQ4hlvQlIT8JXS0
	 sDQeJYlgXljowOIh7WXW9HrHs/FSF+Fc2Rlh2onuZWEzxvMW5Lxub/6uJkX6Ahtgp9
	 Kl5lM+98qEjsA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Subject: [RFC 3/6] RISC-V: deprecate riscv,isa & replace it with per-extension properties
Date: Mon,  8 May 2023 19:16:23 +0100
Message-Id: <20230508-luckiness-skimmer-c4a3b7ab35d5@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508-hypnotic-phobia-99598439d828@spud>
References: <20230508-hypnotic-phobia-99598439d828@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9031; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=EZX0K7JP6BwAIxrZk7szxRZe/KOVJqORkMa2rW8UkA8=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmRNmUsmly+aqoNO8qY/Se3cc8z/vUgrPzTF9uyFfaz5 W76Oid2lLIwiHEwyIopsiTe7muRWv/HZYdzz1uYOaxMIEMYuDgFYCJaQYwMzdHcGhn2hzleHot9 oZnw3y1gkccVxZds0QaVe47yhRg5MvyVmOnHZ/3B7/Dq1NSigrbymr6wqomP+XIq6gz29F1W4WQ GAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_111707_536925_B860E7C3 
X-CRM114-Status: GOOD (  20.70  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, conor@kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

riscv,isa is a bit of a problem-in-waiting, as we don't have control
over what the extensions mean. Give us the ability to define what the
versions of an extension mean, and provide a compatible-like interface
for a dts to specify which known-version of an extension a hart is
compatible with.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/hwcap.h |  25 +++++-
 arch/riscv/kernel/cpufeature.c | 147 +++++++++++++++++++++++++++------
 2 files changed, 146 insertions(+), 26 deletions(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index aa61031f7923..f963a7a82ce1 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -14,15 +14,20 @@
 #include <uapi/asm/hwcap.h>
 
 #define RISCV_ISA_EXT_a		('a' - 'a')
+#define RISCV_ISA_EXT_b		('b' - 'a')
 #define RISCV_ISA_EXT_c		('c' - 'a')
 #define RISCV_ISA_EXT_d		('d' - 'a')
 #define RISCV_ISA_EXT_f		('f' - 'a')
 #define RISCV_ISA_EXT_h		('h' - 'a')
 #define RISCV_ISA_EXT_i		('i' - 'a')
+#define RISCV_ISA_EXT_j		('j' - 'a')
+#define RISCV_ISA_EXT_k		('k' - 'a')
 #define RISCV_ISA_EXT_m		('m' - 'a')
+#define RISCV_ISA_EXT_p		('p' - 'a')
+#define RISCV_ISA_EXT_q		('q' - 'a')
 #define RISCV_ISA_EXT_s		('s' - 'a')
 #define RISCV_ISA_EXT_u		('u' - 'a')
-
+#define RISCV_ISA_EXT_v		('v' - 'a')
 /*
  * These macros represent the logical IDs of each multi-letter RISC-V ISA
  * extension and are used in the ISA bitmap. The logical IDs start from
@@ -61,6 +66,24 @@ struct riscv_isa_ext_data {
 	unsigned int isa_ext_id;
 };
 
+struct riscv_isa_extension {
+	const u64 key;
+	const char *name;
+	const char *version;
+	const char *prop_name;
+	const bool multi_letter;
+};
+
+#define RISCV_ISA_EXT_CFG(_name, _key, _version, _multi) {	\
+	.name = #_name,						\
+	.prop_name = "riscv,isa-extension-" #_name,		\
+	.key = _key,						\
+	.version = _version,					\
+	.multi_letter = _multi,					\
+}
+
+extern const struct riscv_isa_extension riscv_isa_extensions[];
+
 unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
 
 #define riscv_isa_extension_mask(ext) BIT_MASK(RISCV_ISA_EXT_##ext)
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 92f0e7b78eef..1ead76adf60f 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -93,12 +93,39 @@ static bool riscv_isa_extension_check(int id)
 	return true;
 }
 
-void __init riscv_fill_hwcap(void)
+const struct riscv_isa_extension riscv_isa_extensions[] = {
+	RISCV_ISA_EXT_CFG(i, RISCV_ISA_EXT_i, "v1.0.0", false),
+	RISCV_ISA_EXT_CFG(m, RISCV_ISA_EXT_m, "v1.0.0", false),
+	RISCV_ISA_EXT_CFG(a, RISCV_ISA_EXT_a, "v1.0.0", false),
+	RISCV_ISA_EXT_CFG(f, RISCV_ISA_EXT_f, "v1.0.0", false),
+	RISCV_ISA_EXT_CFG(d, RISCV_ISA_EXT_d, "v1.0.0", false),
+	RISCV_ISA_EXT_CFG(q, RISCV_ISA_EXT_q, "v1.0.0", false),
+	RISCV_ISA_EXT_CFG(c, RISCV_ISA_EXT_c, "v1.0.0", false),
+	RISCV_ISA_EXT_CFG(b, RISCV_ISA_EXT_b, "v1.0.0", false),
+	RISCV_ISA_EXT_CFG(k, RISCV_ISA_EXT_k, "v1.0.0", false),
+	RISCV_ISA_EXT_CFG(j, RISCV_ISA_EXT_j, "v1.0.0", false),
+	RISCV_ISA_EXT_CFG(p, RISCV_ISA_EXT_p, "v1.0.0", false),
+	RISCV_ISA_EXT_CFG(v, RISCV_ISA_EXT_v, "v1.0.0", false),
+	RISCV_ISA_EXT_CFG(h, RISCV_ISA_EXT_h, "v1.0.0", false),
+	RISCV_ISA_EXT_CFG(zicbom, RISCV_ISA_EXT_ZICBOM, "v1.0.0", true),
+	RISCV_ISA_EXT_CFG(zicboz, RISCV_ISA_EXT_ZICBOZ, "v1.0.0", true),
+	RISCV_ISA_EXT_CFG(zicsr, RISCV_ISA_EXT_ZICSR, "v1.0.0", true),
+	RISCV_ISA_EXT_CFG(zifencei, RISCV_ISA_EXT_ZIFENCEI, "v1.0.0", true),
+	RISCV_ISA_EXT_CFG(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE, "v1.0.0", true),
+	RISCV_ISA_EXT_CFG(zbb, RISCV_ISA_EXT_ZBB, "v1.0.0", true),
+	RISCV_ISA_EXT_CFG(sscofpmf, RISCV_ISA_EXT_SSCOFPMF, "v1.0.0", true),
+	RISCV_ISA_EXT_CFG(sstc, RISCV_ISA_EXT_SSTC, "v1.0.0", true),
+	RISCV_ISA_EXT_CFG(svinval, RISCV_ISA_EXT_SVINVAL, "v1.0.0", true),
+	RISCV_ISA_EXT_CFG(svnapot, RISCV_ISA_EXT_SVNAPOT, "v1.0.0", true),
+	RISCV_ISA_EXT_CFG(svpbmt, RISCV_ISA_EXT_SVPBMT, "v1.0.0", true),
+	RISCV_ISA_EXT_CFG("", RISCV_ISA_EXT_MAX, "", false),
+};
+
+static void __init riscv_fill_hwcap_isa_string(void)
 {
 	struct device_node *node;
 	const char *isa;
-	char print_str[NUM_ALPHA_EXTS + 1];
-	int i, j, rc;
+	int rc;
 	unsigned long isa2hwcap[26] = {0};
 	unsigned int cpu;
 
@@ -109,13 +136,12 @@ void __init riscv_fill_hwcap(void)
 	isa2hwcap['d' - 'a'] = COMPAT_HWCAP_ISA_D;
 	isa2hwcap['c' - 'a'] = COMPAT_HWCAP_ISA_C;
 
-	elf_hwcap = 0;
-
-	bitmap_zero(riscv_isa, RISCV_ISA_EXT_MAX);
+	pr_info("Falling back to reading hwcap from deprecated riscv,isa\n");
 
 	for_each_possible_cpu(cpu) {
 		unsigned long this_hwcap = 0;
 		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
+		bitmap_zero(this_isa, RISCV_ISA_EXT_MAX);
 
 		node = of_cpu_device_node_get(cpu);
 		if (!node) {
@@ -138,7 +164,6 @@ void __init riscv_fill_hwcap(void)
 		 */
 		isa += 4;
 
-		bitmap_zero(this_isa, RISCV_ISA_EXT_MAX);
 		while (*isa) {
 			const char *ext = isa++;
 			const char *ext_end = isa;
@@ -278,26 +303,77 @@ void __init riscv_fill_hwcap(void)
 					set_bit(nr, this_isa);
 				}
 			} else {
-				/* sorted alphabetically */
-				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
-				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
-				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
-				SET_ISA_EXT_MAP("svnapot", RISCV_ISA_EXT_SVNAPOT);
-				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
-				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
-				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
-				SET_ISA_EXT_MAP("zicboz", RISCV_ISA_EXT_ZICBOZ);
-				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
+				for (int i = 0; i < ARRAY_SIZE(riscv_isa_extensions); i++)
+					SET_ISA_EXT_MAP(riscv_isa_extensions[i].name, riscv_isa_extensions[i].key);
 			}
 #undef SET_ISA_EXT_MAP
 		}
 
-		/*
-		 * Linux requires Zicsr & Zifencei, so we may as well always
-		 * set them.
-		 */
-		set_bit(RISCV_ISA_EXT_ZIFENCEI, this_isa);
-		set_bit(RISCV_ISA_EXT_ZICSR, this_isa);
+	/*
+	 * Linux requires Zicsr & Zifencei, so we may as well always
+	 * set them.
+	 */
+	set_bit(RISCV_ISA_EXT_ZIFENCEI, this_isa);
+	set_bit(RISCV_ISA_EXT_ZICSR, this_isa);
+
+	/*
+	 * All "okay" hart should have same isa. Set HWCAP based on
+	 * common capabilities of every "okay" hart, in case they don't
+	 * have.
+	 */
+	if (elf_hwcap)
+		elf_hwcap &= this_hwcap;
+	else
+		elf_hwcap = this_hwcap;
+
+	if (bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX))
+		bitmap_copy(riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
+	else
+		bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
+	}
+}
+
+static bool __init riscv_fill_hwcap_new(void)
+{
+	struct device_node *node;
+	bool detected;
+	unsigned long isa2hwcap[26] = {0};
+	unsigned int cpu;
+
+	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
+	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
+	isa2hwcap['a' - 'a'] = COMPAT_HWCAP_ISA_A;
+	isa2hwcap['f' - 'a'] = COMPAT_HWCAP_ISA_F;
+	isa2hwcap['d' - 'a'] = COMPAT_HWCAP_ISA_D;
+	isa2hwcap['c' - 'a'] = COMPAT_HWCAP_ISA_C;
+
+	for_each_possible_cpu(cpu) {
+		unsigned long this_hwcap = 0;
+		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
+
+		node = of_cpu_device_node_get(cpu);
+		if (!node) {
+			pr_warn("Unable to find cpu node\n");
+			continue;
+		}
+
+		for (int k = 0; k < ARRAY_SIZE(riscv_isa_extensions) - 1; k++) {
+			const char *tmp;
+
+			of_property_read_string(node, riscv_isa_extensions[k].prop_name, &tmp);
+			if (!tmp)
+				continue;
+
+			detected = true;
+
+			if (riscv_isa_extension_check(riscv_isa_extensions[k].key) &&
+			    !strcmp(riscv_isa_extensions[k].version, tmp)) {
+				if (!riscv_isa_extensions[k].multi_letter)
+					this_hwcap |= isa2hwcap[riscv_isa_extensions[k].key];
+
+				set_bit(riscv_isa_extensions[k].key, this_isa);
+			}
+		}
 
 		/*
 		 * All "okay" hart should have same isa. Set HWCAP based on
@@ -315,8 +391,29 @@ void __init riscv_fill_hwcap(void)
 			bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
 	}
 
-	/* We don't support systems with F but without D, so mask those out
-	 * here. */
+	return detected;
+}
+
+void __init riscv_fill_hwcap(void)
+{
+	char print_str[NUM_ALPHA_EXTS + 1];
+	int i, j;
+
+	elf_hwcap = 0;
+
+	bitmap_zero(riscv_isa, RISCV_ISA_EXT_MAX);
+
+	/*
+	 * Since old dtbs must continue to work just as well/badly as they ever
+	 * did, fall back to the isa string if the new method doesn't work.
+	 */
+	if (!riscv_fill_hwcap_new())
+		riscv_fill_hwcap_isa_string();
+
+	/*
+	 * We don't support systems with F but without D, so mask those out
+	 * here.
+	 */
 	if ((elf_hwcap & COMPAT_HWCAP_ISA_F) && !(elf_hwcap & COMPAT_HWCAP_ISA_D)) {
 		pr_info("This kernel does not support systems with F but not D\n");
 		elf_hwcap &= ~COMPAT_HWCAP_ISA_F;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
