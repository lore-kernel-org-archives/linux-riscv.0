Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5C6C53209
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 00:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8YeEr4K1opj/8OsBtYiWNTY5ctulpTisN6NcXcyLSR4=; b=HvU4IGlpQHewsw
	yEhfzxZbcaT5Kkbxo6dSfVeeGNb2m3QOeoL9KYQWnZztp+fcxPudxAYBjtFB7dOmPLqImgMii9iVm
	FjR6yMLCRYC8Qb8jkWJyh44LqojQK0CBYgaXQd4LuSlt/KshysGwCIIjPvFAPL8vNAXL/Kg1sbW/M
	MH4v0tYZIkFXNsILET5tS0JQN/+ZLcXFJJ9vXoRXVTVYyKuuSnoQJUFS3GFpIDrtnuy58TXRSFLs+
	FA3yHFPdWYX5K10w4ElfAQUnxlaytvRiX4n/E4LX+8EsnIELrfld6ns8j8SX1XLrpkt0y929LSm4c
	9WjmgAUHNPxdgCRE6laA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnQ4i-0000000HONV-1szd;
	Sat, 25 Jul 2026 00:17:08 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnQ4f-0000000HOMS-1VJ9
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 00:17:06 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-6aae4823f62so330829eaf.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 17:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784938624; x=1785543424; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OGU5MyZYPm1k01t+UEHEfaJfVMMW6AtUaP5JOZ/42rY=;
        b=d65eBujBIloxlllHl1FkeiuXbWYnnFX9sOL3v7OHhY+bDVOBZmZVBOA3pHMNnR74Hw
         fgUDV8JGLPJCAewtP5XZ9odz2p/qrocrt5GOY1gaYvdLzoKPl0Ty9S61WbaLw6Asdut1
         DjN1jPQZN+TiGKIhEkYZ/l9Qo5YNBChJGYvJYM3rsOcYASYgcexkElZrklwRLJau1yur
         h99XUUVRlp+SNhC2onzOejTkto+Bchp91Lg1uqJECEwW+QVCsO/G2LoWLHqpx0EaDkCr
         NP/hnftvtFIhC8Fy7+aNLrN6hb16qP7kM5MPGjlxpLFqIQs6VpZZ+gHpvpv9P5RDVro3
         BCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784938624; x=1785543424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OGU5MyZYPm1k01t+UEHEfaJfVMMW6AtUaP5JOZ/42rY=;
        b=E4uxVu0Amp/jUHlm2dX4zfjQSjbiu8CDoSMvB9UDwJTKS4YlBJmB5F97WlBNbeHjaK
         w5704En/ZGJcZG/ZMrE4/QXKmeTa0MBCI/YgPg/IutnUgpXae1WUbx86Zlqo/+gHUeFC
         46a7ixnT2114r63qDzKBjcaeWoxs676fizfpuVsju5GO44LCr1XffYFLo100XssTp+Ud
         ratrut1POp4ympF6oNB0YStg/Oyx9zKtXwUJaINOrEPJz/LXssdv8Utw7uVvSMJOwqqW
         QNEstflQ4WkAkE+shTEAOR4EeMDAxBYXvbY+b2E+nZORklrlH4TSfXiqcrGJv2zVedtq
         PzmA==
X-Forwarded-Encrypted: i=1; AHgh+RqfUiGb++qbOk6dMywnGMvsOnYo+aCwBBKm2h1reCIOBcVNjn/LJCBq1uFU3wBbdtGnASQjzcLPz2YThw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3CbPaUh0vZPC+Nm0OD+nPzwDz+rECQ/D2oKi+6z5UOAstSERk
	O4965mGunXVgTPzG+kggwHyURKss7aWf50DVk2jboP5Xh6E4TL2+OyOuf0bc47BScV0=
X-Gm-Gg: AR+sD10vZMLw/LrBoybaz8Rzi1mmFg63ZotOzvAxy1xxE1vAGqHcUCdNG6eSlLVbOIf
	qPEvCXpE7R23TEuvqWS5fGPFZ4gfJcPb4NXzktniFe/HNvuPHQQ1jXUoFg82wXSuuOiWPungCG/
	qcZJG0uxVdeqLudPJnaRFRjCYw4Ot2XoNT7c458sVZft8o+xAbJgnYNrdOEmLCGvHuDd9ByajzU
	JjEYoJiiK/Y+B6t+wryqWKCJU7vKj8tpHCf76t7DwN+oRXPshM5TeL6rJTbvFID5WyZczeNaDz0
	GW5vWp+S0SKVINubN2TxmTA0pKTL26Cn1Y2uXAa+LhyW60svx+aVDR/Ra8zl3/mFMbPkJHJtLHv
	YxLZ+7xiqyVnwHzCvI+2MWcwKJy03zJ6hnqaouV1xNRVTON57Ci89gLB/YCT5IRz6OEM8MkGLIM
	DkTyI+WTU0uBbLTIY4EV7Pjbpby2TID5BtSlQ=
X-Received: by 2002:a05:6820:2225:b0:6aa:cd74:21e6 with SMTP id 006d021491bc7-6aaffa61774mr420000eaf.40.1784938624162;
        Fri, 24 Jul 2026 17:17:04 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aaf9385b35sm882929eaf.7.2026.07.24.17.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 17:17:03 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: bergner@tenstorrent.com,
	kito.cheng@sifive.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Guodong Xu <docular.xu@gmail.com>,
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>,
	Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Yao Zihong <zihong.plct@isrc.iscas.ac.cn>,
	Jingwei Wang <wangjingwei@iscas.ac.cn>,
	Deepak Gupta <debug@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Subject: [PATCH v3 2/3] riscv: hwprobe: export the availability of vector to user
Date: Fri, 24 Jul 2026 19:15:51 -0500
Message-ID: <20260725001614.2578617-3-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725001614.2578617-1-tchiu@tenstorrent.com>
References: <20260725001614.2578617-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_171705_446921_AEE1719A 
X-CRM114-Status: GOOD (  26.09  )
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

Userland IFUNC resolvers use hwprobe to decide whether to dispatch to
vectorized routines. But RISCV_HWPROBE_KEY_IMA_EXT_0 only reports what
is present in hardware, not what the calling process may actually use:
when Vector is disabled for a process via
prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_OFF), it is still
reported as present. A resolver that trusts this and runs a vector
instruction crashes with SIGILL.

Add RISCV_HWPROBE_KEY_EXT_ENABLED, a positional modifier key that carries
no value of its own. Within a single request, keys placed after it report
extensions that are both present and enabled for the calling process,
while keys before it keep reporting hardware presence. This masks out V
and its V-dependent sub-extensions when V is disabled for the process, and
lets userland obtain both views in one query:

      [ {IMA_EXT_0}, {EXT_ENABLED}, {IMA_EXT_0} ]
          present       modifier       enabled

The enabled view depends on per-process state, so it cannot be served from
the vDSO's process-independent cache; requests carrying the modifier are
deferred to the syscall. Unknown keys are still reported as -1, so the
feature is detectable and existing users are unaffected.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220795
Link: https://lore.kernel.org/all/20260107000609.63892-1-andybnac@gmail.com/
Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
Changelog v2:
 - rebase on top of latest for-next
 - add test_avail to sifive's vector depending extensions
---
 Documentation/arch/riscv/hwprobe.rst          | 27 ++++++++++++++
 arch/riscv/include/asm/hwprobe.h              |  2 +-
 .../asm/vendor_extensions/sifive_hwprobe.h    |  6 ++--
 .../asm/vendor_extensions/thead_hwprobe.h     |  6 ++--
 arch/riscv/include/uapi/asm/hwprobe.h         |  2 ++
 arch/riscv/kernel/sys_hwprobe.c               | 36 +++++++++++++------
 arch/riscv/kernel/vdso/hwprobe.c              | 25 +++++++++----
 .../kernel/vendor_extensions/sifive_hwprobe.c | 16 ++++++---
 .../kernel/vendor_extensions/thead_hwprobe.c  |  9 +++--
 9 files changed, 100 insertions(+), 29 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index d9928641deb9..b9b3cf23c212 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -401,3 +401,30 @@ The following keys are defined:
     as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
     extensions specification, ratified in commit 302a2d45c243
     ("Update build-pdf.yml") of riscv-cfi.
+
+ * :c:macro:`RISCV_HWPROBE_KEY_EXT_ENABLED`: A modifier key. It reports no
+  value of its own (its value is always 0) and instead changes how the
+  extension-bitmask keys that follow it in the same request are reported.
+  Keys placed before it report the extensions that are present in hardware,
+  as usual. Keys placed after it additionally require each reported extension
+  to be enabled for the calling process, i.e. usable without receiving a
+  SIGILL.
+
+  Currently this applies to Vector. When V has been disabled for the process
+  with ``prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_OFF)``,
+  :c:macro:`RISCV_HWPROBE_IMA_V` and the V-dependent sub-extensions are
+  cleared from any :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0` that follows the
+  modifier, and :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR` is cleared
+  from any :c:macro:`RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0` that follows it,
+  while a preceding key still reports them as present. A single request can
+  therefore return both the hardware-present set and the process-usable
+  set::
+
+      struct riscv_hwprobe pairs[3] = {
+          { .key = RISCV_HWPROBE_KEY_IMA_EXT_0, },   /* present in hardware */
+          { .key = RISCV_HWPROBE_KEY_EXT_ENABLED, }, /* modifier            */
+          { .key = RISCV_HWPROBE_KEY_IMA_EXT_0, },   /* present and enabled */
+      };
+
+  The effect is positional: reordering the pairs changes which keys have the
+  enablement filter applied.
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 8b9f5e1cf4cb..e8364a3eaeef 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,7 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY		16
+#define RISCV_HWPROBE_MAX_KEY		17
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
diff --git a/arch/riscv/include/asm/vendor_extensions/sifive_hwprobe.h b/arch/riscv/include/asm/vendor_extensions/sifive_hwprobe.h
index 90a61abd033c..c961c78a7927 100644
--- a/arch/riscv/include/asm/vendor_extensions/sifive_hwprobe.h
+++ b/arch/riscv/include/asm/vendor_extensions/sifive_hwprobe.h
@@ -7,10 +7,12 @@
 #include <uapi/asm/hwprobe.h>
 
 #ifdef CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE
-void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe *pair, const struct cpumask *cpus);
+void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe *pair,
+				     const struct cpumask *cpus, bool test_avail);
 #else
 static inline void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe *pair,
-						   const struct cpumask *cpus)
+						   const struct cpumask *cpus,
+						   bool test_avail)
 {
 	pair->value = 0;
 }
diff --git a/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h b/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h
index 65a9c5612466..3e1c4271383f 100644
--- a/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h
+++ b/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h
@@ -7,10 +7,12 @@
 #include <uapi/asm/hwprobe.h>
 
 #ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
-void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair, const struct cpumask *cpus);
+void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair,
+				    const struct cpumask *cpus, bool test_avail);
 #else
 static inline void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair,
-						  const struct cpumask *cpus)
+						  const struct cpumask *cpus,
+						  bool test_avail)
 {
 	pair->value = 0;
 }
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9139edba0aec..561483172ce5 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -116,6 +116,8 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE	15
 #define RISCV_HWPROBE_KEY_IMA_EXT_1		16
 #define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 0)
+/* Modifier key working as a signal to the kernel to gather enablement status */
+#define RISCV_HWPROBE_KEY_EXT_ENABLED	17
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index d2bb70fed8b9..5949e3d9146f 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -79,8 +79,9 @@ static void hwprobe_arch_id(struct riscv_hwprobe *pair,
 }
 
 static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
-			     const struct cpumask *cpus)
+			     const struct cpumask *cpus, bool report_avail)
 {
+	bool report_v;
 	int cpu;
 	u64 missing = 0;
 
@@ -91,7 +92,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 	if (riscv_isa_extension_available(NULL, c))
 		pair->value |= RISCV_HWPROBE_IMA_C;
 
-	if (has_vector() && riscv_isa_extension_available(NULL, v))
+	report_v = report_avail ? riscv_v_vstate_ctrl_user_allowed() : true;
+	if (has_vector() && riscv_isa_extension_available(NULL, v) && report_v)
 		pair->value |= RISCV_HWPROBE_IMA_V;
 
 	/*
@@ -146,7 +148,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		 * All the following extensions must depend on the kernel
 		 * support of V.
 		 */
-		if (has_vector()) {
+		if (has_vector() && report_v) {
 			EXT_KEY(isainfo->isa, ZVBB, pair->value, missing);
 			EXT_KEY(isainfo->isa, ZVBC, pair->value, missing);
 			EXT_KEY(isainfo->isa, ZVE32F, pair->value, missing);
@@ -215,7 +217,7 @@ static bool hwprobe_ext0_has(const struct cpumask *cpus, u64 ext)
 {
 	struct riscv_hwprobe pair;
 
-	hwprobe_isa_ext0(&pair, cpus);
+	hwprobe_isa_ext0(&pair, cpus, false);
 	return (pair.value & ext);
 }
 
@@ -293,7 +295,7 @@ static u64 hwprobe_vec_misaligned(const struct cpumask *cpus)
 #endif
 
 static void hwprobe_one_pair(struct riscv_hwprobe *pair,
-			     const struct cpumask *cpus)
+			     const struct cpumask *cpus, bool test_avail)
 {
 	pair->value = 0;
 
@@ -314,7 +316,7 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		break;
 
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:
-		hwprobe_isa_ext0(pair, cpus);
+		hwprobe_isa_ext0(pair, cpus, test_avail);
 		break;
 
 	case RISCV_HWPROBE_KEY_IMA_EXT_1:
@@ -351,11 +353,11 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		break;
 
 	case RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0:
-		hwprobe_isa_vendor_ext_sifive_0(pair, cpus);
+		hwprobe_isa_vendor_ext_sifive_0(pair, cpus, test_avail);
 		break;
 
 	case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
-		hwprobe_isa_vendor_ext_thead_0(pair, cpus);
+		hwprobe_isa_vendor_ext_thead_0(pair, cpus, test_avail);
 		break;
 	case RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0:
 		hwprobe_isa_vendor_ext_mips_0(pair, cpus);
@@ -378,6 +380,7 @@ static int hwprobe_get_values(struct riscv_hwprobe __user *pairs,
 			      unsigned long __user *cpus_user,
 			      unsigned int flags)
 {
+	bool test_avail = false;
 	size_t out;
 	int ret;
 	cpumask_t cpus;
@@ -418,7 +421,10 @@ static int hwprobe_get_values(struct riscv_hwprobe __user *pairs,
 			return -EFAULT;
 
 		pair.value = 0;
-		hwprobe_one_pair(&pair, &cpus);
+		if (pair.key == RISCV_HWPROBE_KEY_EXT_ENABLED)
+			test_avail = true;
+		else
+			hwprobe_one_pair(&pair, &cpus, test_avail);
 		ret = put_user(pair.key, &pairs->key);
 		if (ret == 0)
 			ret = put_user(pair.value, &pairs->value);
@@ -437,6 +443,7 @@ static int hwprobe_get_cpus(struct riscv_hwprobe __user *pairs,
 {
 	cpumask_t cpus, one_cpu;
 	bool clear_all = false;
+	bool test_avail = false;
 	size_t i;
 	int ret;
 
@@ -476,6 +483,10 @@ static int hwprobe_get_cpus(struct riscv_hwprobe __user *pairs,
 			if (ret)
 				return -EFAULT;
 		}
+		if (pair.key == RISCV_HWPROBE_KEY_EXT_ENABLED) {
+			test_avail = true;
+			continue;
+		}
 
 		if (clear_all)
 			continue;
@@ -485,7 +496,7 @@ static int hwprobe_get_cpus(struct riscv_hwprobe __user *pairs,
 		for_each_cpu(cpu, &cpus) {
 			cpumask_set_cpu(cpu, &one_cpu);
 
-			hwprobe_one_pair(&tmp, &one_cpu);
+			hwprobe_one_pair(&tmp, &one_cpu, test_avail);
 
 			if (!riscv_hwprobe_pair_cmp(&tmp, &pair))
 				cpumask_clear_cpu(cpu, &cpus);
@@ -535,8 +546,11 @@ static int complete_hwprobe_vdso_data(void)
 	 * save a syscall in the common case.
 	 */
 	for (key = 0; key <= RISCV_HWPROBE_MAX_KEY; key++) {
+		if (key == RISCV_HWPROBE_KEY_EXT_ENABLED)
+			continue;
+
 		pair.key = key;
-		hwprobe_one_pair(&pair, cpu_online_mask);
+		hwprobe_one_pair(&pair, cpu_online_mask, false);
 
 		WARN_ON_ONCE(pair.key < 0);
 
diff --git a/arch/riscv/kernel/vdso/hwprobe.c b/arch/riscv/kernel/vdso/hwprobe.c
index 8f45500d0a6e..f40c21e44ef9 100644
--- a/arch/riscv/kernel/vdso/hwprobe.c
+++ b/arch/riscv/kernel/vdso/hwprobe.c
@@ -14,7 +14,7 @@ extern int riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
 
 static int riscv_vdso_get_values(struct riscv_hwprobe *pairs, size_t pair_count,
 				 size_t cpusetsize, unsigned long *cpus,
-				 unsigned int flags)
+				 unsigned int flags, bool avail_test)
 {
 	const struct vdso_arch_data *avd = &vdso_u_arch_data;
 	bool all_cpus = !cpusetsize && !cpus;
@@ -27,7 +27,8 @@ static int riscv_vdso_get_values(struct riscv_hwprobe *pairs, size_t pair_count,
 	 * homogeneous, then this function can handle requests for arbitrary
 	 * masks.
 	 */
-	if (flags != 0 || (!all_cpus && !avd->homogeneous_cpus) || unlikely(!avd->ready))
+	if (flags != 0 || (!all_cpus && !avd->homogeneous_cpus) ||
+	    unlikely(!avd->ready) || avail_test)
 		return riscv_hwprobe(pairs, pair_count, cpusetsize, cpus, flags);
 
 	/* This is something we can handle, fill out the pairs. */
@@ -48,7 +49,7 @@ static int riscv_vdso_get_values(struct riscv_hwprobe *pairs, size_t pair_count,
 
 static int riscv_vdso_get_cpus(struct riscv_hwprobe *pairs, size_t pair_count,
 			       size_t cpusetsize, unsigned long *cpus,
-			       unsigned int flags)
+			       unsigned int flags, bool avail_test)
 {
 	const struct vdso_arch_data *avd = &vdso_u_arch_data;
 	struct riscv_hwprobe *p = pairs;
@@ -68,7 +69,8 @@ static int riscv_vdso_get_cpus(struct riscv_hwprobe *pairs, size_t pair_count,
 		}
 	}
 
-	if (empty_cpus || flags != RISCV_HWPROBE_WHICH_CPUS || !avd->homogeneous_cpus)
+	if (empty_cpus || flags != RISCV_HWPROBE_WHICH_CPUS ||
+	    !avd->homogeneous_cpus || avail_test)
 		return riscv_hwprobe(pairs, pair_count, cpusetsize, cpus, flags);
 
 	while (p < end) {
@@ -105,10 +107,21 @@ int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
 			 size_t cpusetsize, unsigned long *cpus,
 			 unsigned int flags)
 {
+	struct riscv_hwprobe *p = pairs;
+	bool avail_test = false;
+	size_t i;
+
+	for (i = 0; i < pair_count; i++) {
+		if (p[i].key == RISCV_HWPROBE_KEY_EXT_ENABLED) {
+			avail_test = true;
+			break;
+		}
+	}
+
 	if (flags & RISCV_HWPROBE_WHICH_CPUS)
 		return riscv_vdso_get_cpus(pairs, pair_count, cpusetsize,
-					   cpus, flags);
+					   cpus, flags, avail_test);
 
 	return riscv_vdso_get_values(pairs, pair_count, cpusetsize,
-				     cpus, flags);
+				     cpus, flags, avail_test);
 }
diff --git a/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c b/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
index 1f77f6309763..379ea16bd89f 100644
--- a/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
+++ b/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
@@ -6,17 +6,23 @@
 
 #include <linux/cpumask.h>
 #include <linux/types.h>
+#include <asm/vector.h>
 
 #include <uapi/asm/hwprobe.h>
 #include <uapi/asm/vendor/sifive.h>
 
-void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe *pair, const struct cpumask *cpus)
+void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe *pair, const struct cpumask *cpus,
+				     bool test_avail)
 {
+	bool report_v = test_avail ? riscv_v_vstate_ctrl_user_allowed() : true;
+
 	VENDOR_EXTENSION_SUPPORTED(pair, cpus,
 				   riscv_isa_vendor_ext_list_sifive.per_hart_isa_bitmap, {
-		VENDOR_EXT_KEY(XSFVQMACCDOD);
-		VENDOR_EXT_KEY(XSFVQMACCQOQ);
-		VENDOR_EXT_KEY(XSFVFNRCLIPXFQF);
-		VENDOR_EXT_KEY(XSFVFWMACCQQQ);
+		if (report_v) {
+			VENDOR_EXT_KEY(XSFVQMACCDOD);
+			VENDOR_EXT_KEY(XSFVQMACCQOQ);
+			VENDOR_EXT_KEY(XSFVFNRCLIPXFQF);
+			VENDOR_EXT_KEY(XSFVFWMACCQQQ);
+		}
 	});
 }
diff --git a/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c b/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
index 2eba34011786..28c58a7123d5 100644
--- a/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
+++ b/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
@@ -6,14 +6,19 @@
 
 #include <linux/cpumask.h>
 #include <linux/types.h>
+#include <asm/vector.h>
 
 #include <uapi/asm/hwprobe.h>
 #include <uapi/asm/vendor/thead.h>
 
-void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair, const struct cpumask *cpus)
+void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair, const struct cpumask *cpus,
+				    bool test_avail)
 {
+	bool report_v = test_avail ? riscv_v_vstate_ctrl_user_allowed() : true;
+
 	VENDOR_EXTENSION_SUPPORTED(pair, cpus,
 				   riscv_isa_vendor_ext_list_thead.per_hart_isa_bitmap, {
-		VENDOR_EXT_KEY(XTHEADVECTOR);
+		if (report_v)
+			VENDOR_EXT_KEY(XTHEADVECTOR);
 	});
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
