Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8BE60A5BEB
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 16:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CAaxh+0f;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=OnwXKkhx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QA/luDFuUYzXB5DRGXlX5xbu4wiV6i9ywbs6THLtFjE=; b=CAaxh+0fbUYHVCj4IfLSWJZt+H
	nXJkEcn1MxRfPbgQv+/qO06UtDotWtbX0gglXpE/EXWmJhBvRVXIIdp/knw2YIa/SD0x8OkQii33S
	WunN1Oy2c91PYNHdOWvzvqwfz/l81xL06MXW15nNzfZtny2UYsPhG2lKZ304iySw+3yg42j/7TH1a
	ZX/rtzlXcjkG7SrIs72N7yD45bRsa/QzSVCeJJK6s7QvKLe66Gx1bPrJvQM/xJgYpAFoUM/k+CMAC
	YN5XY5sTsZUqTA20Nkytr5IxkKM2biO/mLdRvSF2X57Uj8guJXTpAWJ/NvgDp8Q680TfFpVAgUfkG
	RmTDigmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiSP-00000009Scx-2BqD;
	Wed, 18 Nov 2026 16:24:25 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiSD-00000009SWi-03UC
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 16:24:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1795019053; x=1826555053;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=SKXT6RSUFkwioTiiM3a3wYtu411WIrfRehlIIhPMF7Y=;
  b=OnwXKkhx+l3cd4DxESheA+Nh24fZhyxkjgvpqbDTJcwp536ZR2yZT+SY
   TkH9rQmtByzBZrrFaBd7zNB+y2RtfjubmNRErPKdv1CGN1u5GccT9UPGz
   L31okc469AvsrlTklcYWI3nmH+0pyOutO/zEmwFuB03nB+NbvC5WKNLzj
   hqPT/xILlqhy/VLx0Y84u5lP4jNZfq4ZAW1pKlajAhZjWkdqxO/UMhOCV
   4Fspj+EzJK3J2ogT4VxbP+gEqA52QhPmyME93fsSLtYEzk4Ubin1PYBbe
   jZ0ezqrY34oQHaVr33Wsho1rDCaAVJnGreF4hpzQ0J+fHP/Hyc0Z0CNml
   g==;
X-CSE-ConnectionGUID: Yw/ltHEJRrygCHWi3lgHsg==
X-CSE-MsgGUID: q6xibXGoQh+TgnIX0zrK5g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 18:24:11 +0200
X-CSE-ConnectionGUID: cEi3bevQQXOjuOQLygAE3Q==
X-CSE-MsgGUID: UX+rdF26TEGwJ/SWFbwsCg==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces02_data.me-corp.lan with SMTP; 18 Nov 2026 18:32:26 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Wed, 18 Nov 2026 18:24:10 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Wed, 18 Nov 2026 18:23:58 +0200
Subject: [PATCH v7 2/6] riscv: accept the atomic extensions this kernel was
 built with
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261118-lrsc-only-v7-2-602dcf4c1921@mobileye.com>
References: <20261118-lrsc-only-v7-0-602dcf4c1921@mobileye.com>
In-Reply-To: <20261118-lrsc-only-v7-0-602dcf4c1921@mobileye.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, 
 Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Chao-ying Fu <chao-ying.fu@globalfoundries.com>, 
 Conor Dooley <conor.dooley@microchip.com>, torvalds@linux-foundation.org, 
 olof@lixom.net, aleksa.paunovic@htecgroup.com, arikalo@gmail.com, 
 Boqun Feng <boqun@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Pu Lehui <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
 Miguel Ojeda <ojeda@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Andrew Jones <ajones@ventanamicro.com>, Boqun Feng <boqun@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Vladimir.Kondratiev@mobileye.com, 
 bpf@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Nam Cao <namcao@linutronix.de>, rust-for-linux@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_082413_499149_834A62C2 
X-CRM114-Status: GOOD (  22.94  )
X-Spam-Score: -4.0 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

riscv_early_of_processor_hartid() rejects a hart unless its
riscv,isa-extensions property contains "a". A hart that lists "zaamo"
and "zalrsc" instead of "a" is rejected, and so is one that lists only
"zalrsc", even when the kernel was built to use only LR/SC.

Accept "a" as before. Without it, require "zalrsc", which every kernel
uses for cmpxchg, and "zaamo" when RISCV_ISA_ZAAMO is enabled. The
default build therefore needs "a", or "zaamo" together with "zalrsc";
a kernel built without Zaamo needs only "zalrsc".

The legacy "riscv,isa" fallback keeps its rv{32,64}ima check.

Once such a hart can boot, hwprobe must stop telling userspace that
the base behaviour is IMA regardless of the hardware: report
RISCV_HWPROBE_BASE_BEHAVIOR_IMA only when every selected hart has A.
A hart with Zalrsc alone still shows what it has through
RISCV_HWPROBE_EXT_ZALRSC in RISCV_HWPROBE_KEY_IMA_EXT_0.

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 Documentation/arch/riscv/hwprobe.rst |  4 +++-
 arch/riscv/kernel/cpu.c              | 23 ++++++++++++++++++++---
 arch/riscv/kernel/sys_hwprobe.c      | 23 ++++++++++++++++++-----
 3 files changed, 41 insertions(+), 9 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index bb1e0cbab36f..63d7ef028bf8 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -61,7 +61,9 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: Support for rv32ima or
     rv64ima, as defined by version 2.2 of the user ISA and version 1.10 of the
     privileged ISA, with the following known exceptions (more exceptions may be
-    added, but only if it can be demonstrated that the user ABI is not broken):
+    added, but only if it can be demonstrated that the user ABI is not broken).
+    This bit is clear on a hart that implements Zalrsc without Zaamo; such a
+    hart lists its atomic support in :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`.
 
     * The ``fence.i`` instruction cannot be directly executed by userspace
       programs (it may still be executed in userspace via a
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 3dbc8cc557dd..9ba0d49c87bc 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -82,12 +82,29 @@ int __init riscv_early_of_processor_hartid(struct device_node *node, unsigned lo
 		return -ENODEV;
 
 	if (of_property_match_string(node, "riscv,isa-extensions", "i") < 0 ||
-	    of_property_match_string(node, "riscv,isa-extensions", "m") < 0 ||
-	    of_property_match_string(node, "riscv,isa-extensions", "a") < 0) {
-		pr_warn("CPU with hartid=%lu does not support ima", *hart);
+	    of_property_match_string(node, "riscv,isa-extensions", "m") < 0) {
+		pr_warn("CPU with hartid=%lu does not support im", *hart);
 		return -ENODEV;
 	}
 
+	/*
+	 * Require the atomic extensions this kernel was built with. "a"
+	 * covers both; otherwise LR/SC is always needed and AMO is needed
+	 * when the kernel uses it.
+	 */
+	if (of_property_match_string(node, "riscv,isa-extensions", "a") < 0) {
+		if (of_property_match_string(node, "riscv,isa-extensions", "zalrsc") < 0) {
+			pr_warn("CPU with hartid=%lu does not support zalrsc", *hart);
+			return -ENODEV;
+		}
+
+		if (IS_ENABLED(CONFIG_RISCV_ISA_ZAAMO) &&
+		    of_property_match_string(node, "riscv,isa-extensions", "zaamo") < 0) {
+			pr_warn("CPU with hartid=%lu does not support zaamo", *hart);
+			return -ENODEV;
+		}
+	}
+
 	return 0;
 
 old_interface:
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 7818e1d32622..52c4c2085d0a 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -213,6 +213,18 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 	pair->value &= ~missing;
 }
 
+static bool hwprobe_all_cpus_have(const struct cpumask *cpus, unsigned long ext)
+{
+	int cpu;
+
+	for_each_cpu(cpu, cpus) {
+		if (!__riscv_isa_extension_available(hart_isa[cpu].isa, ext))
+			return false;
+	}
+
+	return true;
+}
+
 static bool hwprobe_ext0_has(const struct cpumask *cpus, u64 ext)
 {
 	struct riscv_hwprobe pair;
@@ -306,13 +318,14 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		hwprobe_arch_id(pair, cpus);
 		break;
 	/*
-	 * The kernel already assumes that the base single-letter ISA
-	 * extensions are supported on all harts, and only supports the
-	 * IMA base, so just cheat a bit here and tell that to
-	 * userspace.
+	 * The kernel requires I and M on every hart, so IMA holds when
+	 * every selected hart has A as well. A hart that lists only
+	 * Zalrsc boots on a kernel built without Zaamo, but it has no
+	 * AMO instructions and must not be reported as IMA.
 	 */
 	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
-		pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		if (hwprobe_all_cpus_have(cpus, RISCV_ISA_EXT_A))
+			pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
 		break;
 
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
