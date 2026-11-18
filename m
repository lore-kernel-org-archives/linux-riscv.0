Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CB9606A334
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 16:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jGBRffMn;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=lz6/PzzP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=B2kOQZgojZ1S3PYN/VljyJzL/ojlkR/mtZ00xjx+C34=; b=jGBRffMnU8hbCXqI7+kwmHNYxq
	8Udz1DaIpxv7dNJ3Qhgs5iFeP5llxPmQSY9rQm9Fv0kMeeuv6eTkCgJ1mjNIiwfo5AiqNVDQwgM3C
	45k5FeU4QKfIn/Ke4c1qtKhH0e9/R/VEOF8Fw55ToZVdVgoxBqStM2VtqFADjiNtRYfvyGFz7rd8n
	qrxr0VoNJbRM/puc7sM+uBoUBh1EVgbLwLtcV0eQYA0o3FoGVYJZZbQawqhpOkvTLXFPuDc1Ay9Y4
	mQdYXZFqPknBpsnCzEtj4PndCOm8khTtxuNcSHOOG6qo4olGVDoTRxoSdEPSFLxe3leMYCWlJzAPF
	UyfRnL0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiST-00000009Sex-25sx;
	Wed, 18 Nov 2026 16:24:29 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiSH-00000009SYq-091d
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 16:24:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1795019057; x=1826555057;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=f4l4UEm/mrbUezxJAL9dfH/maMLZVctdQGXwsByoKX0=;
  b=lz6/PzzP6OPJF/Z3a/q+xK+YGBgNwU5ZerkamnxiArCchEYh/R8fUvJO
   LWHp94x+5PaOzq6MWdvMuemyJ0RV1nP8sIZ16+GOaJtmGUHn8j93z31EF
   D1H15FnciFvFIH4gL0oTwtFAV71aKZMQIMjGnPARHyjvN4XAy3w5BK/oV
   pjXe1CmO7tpUuex/0G3gDWQmvPS1P+y67hf0N9OhGmRzE2gbVic2yblzX
   iR8wgXw1BEm/k79l83nlGpLVaRxOgqFZwacMtplOp8vhjys6DIArQ8RI7
   b3cjf4nMwaMLmyGsyHirV1yhFrTtK+isr0sUCZlOd7G5R8sflCP2T8PtW
   g==;
X-CSE-ConnectionGUID: qnDv+BfHQgCZGgphH5xyRw==
X-CSE-MsgGUID: XCeOaEUlQ8OsqZ9rkaZojw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 18:24:15 +0200
X-CSE-ConnectionGUID: b2M2PZVoTS6e+msyh/iLpA==
X-CSE-MsgGUID: x5y30ScKTtai8TFDxLfczw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces01_data.me-corp.lan with SMTP; 18 Nov 2026 18:32:35 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Wed, 18 Nov 2026 18:24:13 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Wed, 18 Nov 2026 18:24:01 +0200
Subject: [PATCH v7 5/6] riscv: hwprobe: update the vDSO data after the
 boot-time speed probes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261118-lrsc-only-v7-5-602dcf4c1921@mobileye.com>
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
X-CRM114-CacheID: sfid-20261118_082417_406772_46A7BF81 
X-CRM114-Status: GOOD (  18.82  )
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

init_hwprobe_vdso_data() fills the vDSO copy of the hwprobe answers at
arch_initcall_sync. The misaligned access speed probes run later, at
fs_initcall_sync, so the vDSO keeps RISCV_HWPROBE_MISALIGNED_*_UNKNOWN
for RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF and _VECTOR_PERF, and
every hwprobe() call that the vDSO answers itself, which is the common
"all CPUs" case, returns UNKNOWN where the syscall would return the
measured value.

This was handled by filling the vDSO data lazily on the first syscall,
which commit 7e14e42edfaa ("Revert "riscv: hwprobe: Fix stale vDSO
data for late-initialized keys at boot"") removed once the probes
became synchronous; the ordering between the two initcalls was left
as it was.

Split the filling out of the initcall into
riscv_hwprobe_update_vdso_data() and call it again at the end of
check_unaligned_access_all_cpus(). That still runs before
rootfs_initcall() enables usermode helpers, so no userspace can read
the vDSO data before it is complete.

Fixes: 7e14e42edfaa ("Revert "riscv: hwprobe: Fix stale vDSO data for late-initialized keys at boot"")
Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 arch/riscv/include/asm/hwprobe.h           |  6 ++++++
 arch/riscv/kernel/sys_hwprobe.c            | 16 +++++++++++-----
 arch/riscv/kernel/unaligned_access_speed.c |  8 +++++---
 3 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 9b04377c0f98..1cc83cecbc05 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -43,4 +43,10 @@ static inline bool riscv_hwprobe_pair_cmp(struct riscv_hwprobe *pair,
 	return pair->value == other_pair->value;
 }
 
+#ifdef CONFIG_MMU
+void riscv_hwprobe_update_vdso_data(void);
+#else
+static inline void riscv_hwprobe_update_vdso_data(void) {}
+#endif
+
 #endif
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 52c4c2085d0a..2c64a13c5155 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -534,17 +534,18 @@ static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
 
 #ifdef CONFIG_MMU
 
-static int __init init_hwprobe_vdso_data(void)
+/*
+ * Fill the vDSO data with the answers for the "all CPUs" case, to save a
+ * syscall in the common case. Called once the ISA is known, and again by
+ * the boot-time probes whose results feed some of the keys.
+ */
+void __init riscv_hwprobe_update_vdso_data(void)
 {
 	struct vdso_arch_data *avd = vdso_k_arch_data;
 	u64 id_bitsmash = 0;
 	struct riscv_hwprobe pair;
 	int key;
 
-	/*
-	 * Initialize vDSO data with the answers for the "all CPUs" case, to
-	 * save a syscall in the common case.
-	 */
 	for (key = 0; key <= RISCV_HWPROBE_MAX_KEY; key++) {
 		pair.key = key;
 		hwprobe_one_pair(&pair, cpu_online_mask);
@@ -568,6 +569,11 @@ static int __init init_hwprobe_vdso_data(void)
 	 * vDSO should defer to the kernel for exotic cpu masks.
 	 */
 	avd->homogeneous_cpus = id_bitsmash != 0 && id_bitsmash != -1;
+}
+
+static int __init init_hwprobe_vdso_data(void)
+{
+	riscv_hwprobe_update_vdso_data();
 	return 0;
 }
 
diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 67f1a0371659..3a6f85e3f94c 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -393,13 +393,15 @@ static int __init check_unaligned_access_all_cpus(void)
 	modify_unaligned_access_branches(cpu_online_mask);
 	cpus_read_unlock();
 
+	/* The vDSO was filled before the probes ran; give it the results. */
+	riscv_hwprobe_update_vdso_data();
+
 	return 0;
 }
 
 /*
  * Run after clocksource_done_booting() so measure_cycles() uses a stable
- * clocksource, but before rootfs_initcall() enables usermode helpers. Those
- * helpers can reach hwprobe and populate the vDSO cache, so async hwprobe
- * probes must be registered first.
+ * clocksource, but before rootfs_initcall() enables usermode helpers, which
+ * can reach hwprobe and must see the results in the vDSO data.
  */
 fs_initcall_sync(check_unaligned_access_all_cpus);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
