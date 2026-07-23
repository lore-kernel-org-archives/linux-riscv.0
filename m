Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A006C531CC
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2026 22:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pJLPgYmtiSMs5KHyYu4Q5+tczK10qad+2F0xKE/W1Rs=; b=dLJjnsjVmXCK7d
	r6CLx5jkU392YRCFWM6MUYbv1UoZ1/ZKc/nUl+2oziPimld2m0hKTLq2yV6YLJrMgYtkDV9RIQc/E
	AfCRT67gzqIB3jjgZmD3jyzGvz2rpbQQXwxcMGiLMGfTtB0w7HVhRyPU/sgCH7oqPZVKMqeuTk8Ep
	f9zAII0nP+yeYuDwfWHv0X2mRqGn5468or5TWNB/W5GeFoC1U109FnbQPArKnY7lbeaDoGiAdXhiC
	DD9S8iA+x6/2CIgYpaAuWQiBCifG242SeICbjFVCRRKvW4/cxqc0cuA9mAAwGWIOB3pkIRl+QtyYM
	wMobsxArJ+UCTsBOihaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn1nQ-0000000FCNF-0noD;
	Thu, 23 Jul 2026 22:21:40 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn1nN-0000000FCMK-2XnM
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jul 2026 22:21:39 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7e9ecd7216cso535231a34.3
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jul 2026 15:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784845296; x=1785450096; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jPY3U7ZPdpvP8+yaUUL9eX3pD3n4CR1D4sLsbMUyiOw=;
        b=WO4Uc1bLTvLz7ddYv22fFBK7xjaVWH2vOeSxBLwJBs/aqaTUpLg/Kedi3HgEJI/crA
         pfCV3eeD4XiIGRZgf70tzC15Hybxmzmm4SI+B6FKHEslBXN254wjS7bwV18LJXJ6uKWZ
         qSEM1aNnskZWA8G65J7DVlg6eiPzd+4yW4jMrOn38G52/j4nF1w+2czQquSCBylPXLT6
         HNOIpHiVdVzAzwN+xqE4yjOgbCyC/afF9awoamJSXplqX4ez161ZbIoeAm0zhO2j7mrG
         ieyDr/MdxC4FNSoH+v0gMWd288rg9ULQE4tiZakBk7PACH30wc1DagL2p3klKNvIPS82
         TuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784845296; x=1785450096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jPY3U7ZPdpvP8+yaUUL9eX3pD3n4CR1D4sLsbMUyiOw=;
        b=QcrsRiMMktYsKrKX7S4I1tXlYlOPbJfa13i4tQBy8B1t5XmhCKjGXNN/W4tLbhUD/M
         GGhhCbWqt3HX+J+52l8phvCi/tcPqNQbf+sVvvmotdkirtdp9aGRSvMoRyUKO/K5AVEu
         tQqmf/7iIzFnyXGCvdbV/u36oxXVWYeF5ayroMkGjvxzhXMc+aGx7oromhu7U37Ke3ZZ
         Zkf6w2o86efPcgP+FV+ju36wTzjpNeZYk4HED/ojAu4+flUj5D7xZ2RfCNCtIUjVXDlt
         0CuWhF6M1rrmNS2zCNYbweAbFNfKO2ZiJbiEVa2DgL9LDk6gm2ruHqWyzboRF3XN0kXn
         NjYg==
X-Forwarded-Encrypted: i=1; AHgh+RoB1DcG5ybOOihayfF5RR/4LV4/fl5iQ93jVQjSQBlOQrYQn9LhOjKRzU2jpWu/+F4GRX9wnQnAAJjHCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgoSdoTOt3ypxR1wezaDSHSvg8VKxz5/LGShhs5fM5YFC4vuCq
	u2CbJPyMZn8evlkIMGMhuSBRUj5tcHI9LEYkX3EQv2so/M8kEij/1pCU6DKBOxnXuCg=
X-Gm-Gg: AR+sD10Q+/2zSVU4EYlYiSSF2XzZNcIO06OWH1e2+y/+bM2nVwiX35V3YGgdsT39kAp
	eiXQlq+QVU5B5c+ze4/xX6vvQiubi9U3+mSu7wTpCUl+W5JP/XD6bMZ3yI8eDl1pCYrZ17SMPt1
	dlK574zF7d9eBWDb4w2zCijJ8LVpX8azwXrGeY2BB37F3FRTR+SdR6CWnTV+sbFPNTpI9fBJCBe
	f+plb31vi1G21XQyoPiPHaZ/0poAEJHmZMMWaOh9BnKqCEcZnc+dasuG4GRoonOMxLep1Uf+Dmg
	8SwfTcCHUvjnUy7YVTPOQgnDACkFNPtLxH+06l8DNFU5nnq9T29vsd8spNYXwh5vPsB6vIzEr6f
	OtOW0sYUqsKDSQBt9KoG/mihDLuzOjCv9zvMH/dJQQKgsWBihpqpTIquXtirbuHbgg8oH+mvMd1
	D/qrnGQpmk4nw+R1thWwhKUCiiTiXbbXLlZwg=
X-Received: by 2002:a05:6820:1a04:b0:6a3:74c8:c057 with SMTP id 006d021491bc7-6aad4050d27mr2292473eaf.32.1784845296309;
        Thu, 23 Jul 2026 15:21:36 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aaddc93c54sm1316877eaf.11.2026.07.23.15.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 15:21:35 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: bergner@tenstorrent.com,
	kito.cheng@sifive.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Nutty Liu <nutty.liu@hotmail.com>,
	Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
	Yao Zihong <zihong.plct@isrc.iscas.ac.cn>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>,
	Jingwei Wang <wangjingwei@iscas.ac.cn>,
	Zong Li <zong.li@sifive.com>,
	Deepak Gupta <debug@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Subject: [PATCH 1/2] riscv: hwprobe: export the availability of vector to user
Date: Thu, 23 Jul 2026 17:20:56 -0500
Message-ID: <20260723222109.2229089-2-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723222109.2229089-1-tchiu@tenstorrent.com>
References: <20260723222109.2229089-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_152137_743400_1201CF55 
X-CRM114-Status: GOOD (  27.77  )
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
 Documentation/arch/riscv/hwprobe.rst          | 27 +++++++++++++++
 arch/riscv/include/asm/hwprobe.h              |  2 +-
 .../asm/vendor_extensions/thead_hwprobe.h     |  6 ++--
 arch/riscv/include/uapi/asm/hwprobe.h         |  2 ++
 arch/riscv/kernel/sys_hwprobe.c               | 34 +++++++++++++------
 arch/riscv/kernel/vdso/hwprobe.c              | 25 ++++++++++----
 .../kernel/vendor_extensions/thead_hwprobe.c  |  9 +++--
 7 files changed, 84 insertions(+), 21 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index c420a8349bc6..b58b7c734c30 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -391,3 +391,30 @@ The following keys are defined:
 * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
   extensions that are compatible with the
   :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
+
+* :c:macro:`RISCV_HWPROBE_KEY_EXT_ENABLED`: A modifier key. It reports no
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
index 1659d31fd288..64d598d1a05d 100644
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
 	switch (pair->key) {
 	case RISCV_HWPROBE_KEY_MVENDORID:
@@ -312,7 +314,7 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		break;
 
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:
-		hwprobe_isa_ext0(pair, cpus);
+		hwprobe_isa_ext0(pair, cpus, test_avail);
 		break;
 
 	case RISCV_HWPROBE_KEY_IMA_EXT_1:
@@ -356,7 +358,7 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		break;
 
 	case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
-		hwprobe_isa_vendor_ext_thead_0(pair, cpus);
+		hwprobe_isa_vendor_ext_thead_0(pair, cpus, test_avail);
 		break;
 	case RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0:
 		hwprobe_isa_vendor_ext_mips_0(pair, cpus);
@@ -379,6 +381,7 @@ static int hwprobe_get_values(struct riscv_hwprobe __user *pairs,
 			      unsigned long __user *cpus_user,
 			      unsigned int flags)
 {
+	bool test_avail = false;
 	size_t out;
 	int ret;
 	cpumask_t cpus;
@@ -419,7 +422,10 @@ static int hwprobe_get_values(struct riscv_hwprobe __user *pairs,
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
@@ -438,6 +444,7 @@ static int hwprobe_get_cpus(struct riscv_hwprobe __user *pairs,
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
