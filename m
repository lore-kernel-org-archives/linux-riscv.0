Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3452FC77B7E
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Apr 2023 19:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hXfFNSWcN5scaJOLoUDqHzh3QKEZ118bV1mvmNHI57Q=; b=PaOtnvwH6X98Ol
	ZcXaru+Us4KQ/WxYcxfmp30dIc1D8anZ3bK5ogqlzgoawsxZdJj97lJlIwG7Wvhc1yVgf9aKk1iN7
	4Qu5euHTKjM7yQwSTyGMi/0D5Ij7vpJyusSKJWdkly0Q/p42drcKhXEP2DXfrOlGhaWlG4lt5Sqt1
	vCjHIDxNk4IoegaraBKEkJ90QJThf5tzaM17H06d46KbsrPvoN5pS5z7MgpXZyINbM5OkjWmtg6Ao
	kLqgO7nzgBKZPNQoWy3ebBr1JuvmEqIHvcB/4gQeh51UEjqN6FCeEuBNA0ymsL3EE3u+XvTdxMOIZ
	zunCBBJoYWq8AjhbJ64g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pr2Bw-00H4jh-0x;
	Mon, 24 Apr 2023 19:49:40 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pr2Bn-00H4gv-2d
	for linux-riscv@lists.infradead.org;
	Mon, 24 Apr 2023 19:49:34 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pr2Bj-0006Mz-Qx; Mon, 24 Apr 2023 21:49:27 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	linux-riscv@lists.infradead.org,
	paul.walmsley@sifive.com
Cc: heiko@sntech.de,
	kito.cheng@sifive.com,
	jrtc27@jrtc27.com,
	conor.dooley@microchip.com,
	matthias.bgg@gmail.com,
	heinrich.schuchardt@canonical.com,
	greentime.hu@sifive.com,
	nick.knight@sifive.com,
	christoph.muellner@vrull.eu,
	philipp.tomsich@vrull.eu,
	richard.henderson@linaro.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH 4/4] RISC-V: add support for vendor-extensions via AT_BASE_PLATFORM and xthead
Date: Mon, 24 Apr 2023 21:49:11 +0200
Message-Id: <20230424194911.264850-5-heiko.stuebner@vrull.eu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230424194911.264850-1-heiko.stuebner@vrull.eu>
References: <20230424194911.264850-1-heiko.stuebner@vrull.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_124932_008478_CAFA8ACE 
X-CRM114-Status: GOOD (  23.05  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

T-Head cores support a number of own ISA extensions that also include
optimized instructions which could benefit userspace to improve
performance.

Extensions supported by current T-Head cores are:
* XTheadBa - bitmanipulation instructions for address calculation
* XTheadBb - conditional basic bit-manipulation instructions
* XTheadBs - instructions to access a single bit in a register
* XTheadCmo - cache management operations
* XTheadCondMov - conditional move instructions
* XTheadFMemIdx - indexed memory operations for floating-point registers
* XTheadFmv - double-precision floating-point high-bit data transmission
              intructions for RV32
* XTheadInt - instructions to reduce the code size of ISRs and/or the
              interrupt latencies that are caused by ISR entry/exit code
* XTheadMac - multiply-accumulate instructions
* XTheadMemIdx - indexed memory operations for GP registers
* XTheadMemPair - two-GPR memory operations
* XTheadSync - multi-core synchronization instructions

In-depth descriptions of these extensions can be found on
    https://github.com/T-head-Semi/thead-extension-spec

Support for those extensions was merged into the relevant toolchains
so userspace programs can select necessary optimizations when needed.

So a mechanism to the isa-string generation to export vendor-extension
lists via the errata mechanism and implement it for T-Head C9xx cores.

This exposes these vendor extensions then both in AT_BASE_PLATFORM
and /proc/cpuinfo.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/errata/thead/errata.c     | 43 ++++++++++++++++++++++++++++
 arch/riscv/include/asm/alternative.h |  4 +++
 arch/riscv/kernel/alternative.c      | 21 ++++++++++++++
 arch/riscv/kernel/cpu.c              | 12 ++++++++
 4 files changed, 80 insertions(+)

diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index 1036b8f933ec..eb635bf80737 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -15,6 +15,7 @@
 #include <asm/errata_list.h>
 #include <asm/hwprobe.h>
 #include <asm/patch.h>
+#include <asm/switch_to.h>
 #include <asm/vendorid_list.h>
 
 static bool errata_probe_pbmt(unsigned int stage,
@@ -125,3 +126,45 @@ void __init_or_module thead_feature_probe_func(unsigned int cpu,
 	if ((archid == 0) && (impid == 0))
 		per_cpu(misaligned_access_speed, cpu) = RISCV_HWPROBE_MISALIGNED_FAST;
 }
+
+
+char *thead_extension_list_func(unsigned long archid,
+				unsigned long impid)
+{
+	if ((archid == 0) && (impid == 0)) {
+		const char *xbase1 = "xtheadba_xtheadbb_xtheadbs_xtheadcmo_xtheadcondmov";
+		const char *xbase2 = "_xtheadint_xtheadmac_xtheadmemidx_xtheadmempair_xtheadsync";
+		const char *xfpu = "_xtheadfmemIdx";
+#ifdef CONFIG_32BIT
+		const char *xfpu32 = "_xtheadfmv";
+#endif
+		int len = strlen(xbase1) + strlen(xbase2);
+		char *str;
+
+		if (has_fpu()) {
+			len += strlen(xfpu);
+#ifdef CONFIG_32BIT
+			len+= strlen(xfpu32);
+#endif
+		}
+
+		str = kzalloc(len, GFP_KERNEL);
+		if (!str)
+			return str;
+
+		strcpy(str, xbase1);
+
+		if (has_fpu()) {
+			strcat(str, xfpu);
+#ifdef CONFIG_32BIT
+			strcat(str, xfpu32);
+#endif
+		}
+
+		strcat(str, xbase2);
+
+		return str;
+	}
+
+	return NULL;
+}
diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index a8f5cf6694a1..8c9aec196649 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -31,6 +31,7 @@
 #define ALT_ALT_PTR(a)			__ALT_PTR(a, alt_offset)
 
 void __init probe_vendor_features(unsigned int cpu);
+char *list_vendor_extensions(void);
 void __init apply_boot_alternatives(void);
 void __init apply_early_boot_alternatives(void);
 void apply_module_alternatives(void *start, size_t length);
@@ -55,6 +56,8 @@ void thead_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 
 void thead_feature_probe_func(unsigned int cpu, unsigned long archid,
 			      unsigned long impid);
+char *thead_extension_list_func(unsigned long archid,
+				unsigned long impid);
 
 void riscv_cpufeature_patch_func(struct alt_entry *begin, struct alt_entry *end,
 				 unsigned int stage);
@@ -62,6 +65,7 @@ void riscv_cpufeature_patch_func(struct alt_entry *begin, struct alt_entry *end,
 #else /* CONFIG_RISCV_ALTERNATIVE */
 
 static inline void probe_vendor_features(unsigned int cpu) { }
+static inline char *list_vendor_extensions(void) { return NULL; }
 static inline void apply_boot_alternatives(void) { }
 static inline void apply_early_boot_alternatives(void) { }
 static inline void apply_module_alternatives(void *start, size_t length) { }
diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index fc65c9293ac5..18913fd1809f 100644
--- a/arch/riscv/kernel/alternative.c
+++ b/arch/riscv/kernel/alternative.c
@@ -29,6 +29,8 @@ struct cpu_manufacturer_info_t {
 				  unsigned int stage);
 	void (*feature_probe_func)(unsigned int cpu, unsigned long archid,
 				   unsigned long impid);
+	char *(*extension_list_func)(unsigned long archid,
+				    unsigned long impid);
 };
 
 static void __init_or_module riscv_fill_cpu_mfr_info(struct cpu_manufacturer_info_t *cpu_mfr_info)
@@ -54,6 +56,7 @@ static void __init_or_module riscv_fill_cpu_mfr_info(struct cpu_manufacturer_inf
 	case THEAD_VENDOR_ID:
 		cpu_mfr_info->patch_func = thead_errata_patch_func;
 		cpu_mfr_info->feature_probe_func = thead_feature_probe_func;
+		cpu_mfr_info->extension_list_func = thead_extension_list_func;
 		break;
 #endif
 	default:
@@ -157,6 +160,24 @@ void __init_or_module probe_vendor_features(unsigned int cpu)
 					cpu_mfr_info.imp_id);
 }
 
+/*
+ * Lists the vendor-specific extensions common to all cores.
+ * Returns a new underscore "_" concatenated string that the
+ * caller is supposed to free after use.
+ */
+char *list_vendor_extensions(void)
+{
+	struct cpu_manufacturer_info_t cpu_mfr_info;
+
+	riscv_fill_cpu_mfr_info(&cpu_mfr_info);
+	if (!cpu_mfr_info.extension_list_func)
+		return NULL;
+
+	return cpu_mfr_info.extension_list_func(cpu_mfr_info.arch_id,
+						cpu_mfr_info.imp_id);
+
+}
+
 /*
  * This is called very early in the boot process (directly after we run
  * a feature detect on the boot CPU). No need to worry about other CPUs
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 71770563199f..6a0a45b2eb20 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -7,6 +7,7 @@
 #include <linux/init.h>
 #include <linux/seq_file.h>
 #include <linux/of.h>
+#include <asm/alternative.h>
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/hwcap.h>
@@ -260,6 +261,7 @@ static char *riscv_create_isa_string(void)
 {
 	int maxlen = 4;
 	char *isa_str;
+	char *vendor_isa;
 	int i;
 
 	/* calculate the needed string length */
@@ -268,6 +270,10 @@ static char *riscv_create_isa_string(void)
 			maxlen++;
 	maxlen += strlen_isa_ext();
 
+	vendor_isa = list_vendor_extensions();
+	if (vendor_isa)
+		maxlen += strlen(vendor_isa) + 1;
+
 	isa_str = kzalloc(maxlen, GFP_KERNEL);
 	if (!isa_str)
 		return ERR_PTR(-ENOMEM);
@@ -287,6 +293,12 @@ static char *riscv_create_isa_string(void)
 
 	strcat_isa_ext(isa_str);
 
+	if(vendor_isa) {
+		strcat(isa_str, "_");
+		strcat(isa_str, vendor_isa);
+		kfree(vendor_isa);
+	}
+
 	return isa_str;
 }
 
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
