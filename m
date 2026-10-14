Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A22CC6B2A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 15:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qopd0E8uQwK4ayUhr8Zu5k4upRnQBnSVLQH+YtTf0H4=; b=fLrNvTL0xeIaJh
	3+HFiSOxDWNH4TPubaN8e5WRCyqJ1aplez+e22epPUokueat7OGUdoBvclbse28SQhIQxMVK6av9M
	efdQizJUL2IoqmDbVgi8Avw+JKj8Vj8+X1aFObuP4i1nfHqvyNOtKDZ7T8lX91MndkcMejuq5iDUd
	NuPa2zeNvGnmbHF9vEU19ZOViPnNoH/l1HVSNp1so24dhZAPLZeAsUIg7TjoJoywUsUattUR2L/y5
	udpdYVBjlUg0vFyrmYuPrfqZeYpsxJZlYsQEDrugIFp9SsGmLyiiBLC24jR5eDxLObUJgiDOTbNCG
	bI9OgSBBQ+v3Q4+he3Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH0Th-0000000Fn9f-00wo;
	Wed, 14 Oct 2026 15:01:15 +0000
Received: from frasgout12.his.huawei.com ([14.137.139.154])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH0Tc-0000000Fn7W-1lSI
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 15:01:11 +0000
Received: from mail.maildlp.com (unknown [172.18.224.235])
	by frasgout12.his.huawei.com (SkyGuard) with ESMTPS id 4j4Z2Y2rp0ztBnr
	for <linux-riscv@lists.infradead.org>; Wed, 14 Oct 2026 22:53:25 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.47])
	by mail.maildlp.com (Postfix) with ESMTP id 028F840558
	for <linux-riscv@lists.infradead.org>; Wed, 14 Oct 2026 23:01:00 +0800 (CST)
Received: from huaweicloud.com (unknown [10.204.63.22])
	by APP1 (Coremail) with UTF8SMTPA id LxC2BwAX6Rgbmc9qaZI3AA--.19900S2;
	Wed, 14 Oct 2026 16:00:59 +0100 (CET)
From: Roberto Sassu <roberto.sassu@huaweicloud.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	robh@kernel.org,
	saravanak@kernel.org
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	zohar@linux.ibm.com,
	noodles@fb.com,
	linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Roberto Sassu <roberto.sassu@huawei.com>
Subject: [PATCH] kexec: Select ima_get/free_kexec_buffer() with CONFIG_HAVE_IMA_KEXEC(_OF)
Date: Wed, 14 Oct 2026 17:00:05 +0200
Message-ID: <20261014150005.138309-1-roberto.sassu@huaweicloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: LxC2BwAX6Rgbmc9qaZI3AA--.19900S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtw1DWry8XFyfZFWkWw4Uurg_yoW7XFWfpw
	sIyr1UJrZrXFs8t3yqg348Wry5Z3Z7JrW3ur1rC34kZFy3A3yDur1vq3W7ZFyj9rWkKFyx
	uFyFgFy0gr4UKw7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAa
	w2AFwI0_Wrv_ZF1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
	Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a
	6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
	kF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
	xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
	xUsPfHUUUUU
X-CM-SenderInfo: purev21wro2thvvxqx5xdzvxpfor3voofrz/1tbiAgAGBGrPKR9GdAADsi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_080108_765674_988330BF 
X-CRM114-Status: GOOD (  19.40  )
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

From: Roberto Sassu <roberto.sassu@huawei.com>

The ima_get/free_kexec_buffer() device tree implementation relies on the
arch code calling of_kexec_alloc_and_setup_fdt() to pass the information
about where the IMA kexec buffer is located. Only the arm64, powerpc and
riscv architectures support that. LoongArch implicitly assumes that the
device tree implementation is used, but it does not call that function.

The ima_get/free_kexec_buffer() x86 implementation instead still relies on
the setup data to pass the kexec buffer information, and is built only if
CONFIG_OF_FLATTREE is not defined.

However, if CONFIG_OF_FLATTREE is selected in x86, x86 attempts to use the
device tree implementations of ima_get/free_kexec_buffer(), which are never
going to succeed because of_kexec_alloc_and_setup_fdt() is not called for
that architecture.

Instead, define CONFIG_HAVE_IMA_KEXEC_OF (automatically selects
HAVE_IMA_KEXEC), select it for the architectures that should use the
ima_get/free_kexec_buffer() device tree implementation, and enable these
functions if the new config option is enabled. Set it also on LoongArch, to
preserve the current behavior and avoid a link failure. LoongArch does not
pass the buffer location to the next kernel yet; this will be addressed
separately.

Finally, don't select it for x86, and use x86's own setup_data-based
implementation regardless of CONFIG_OF_FLATTREE.

Fixes: b69a2afd5afc ("x86/kexec: Carry forward IMA measurement log on kexec")
Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
---
 arch/arm64/Kconfig      | 2 +-
 arch/loongarch/Kconfig  | 2 +-
 arch/powerpc/Kconfig    | 2 +-
 arch/riscv/Kconfig      | 2 +-
 arch/x86/kernel/setup.c | 2 +-
 drivers/of/kexec.c      | 4 ++--
 kernel/Kconfig.kexec    | 4 ++++
 7 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5a51b0ef944..4b7e248b6c91 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1697,7 +1697,7 @@ config ARCH_SUPPORTS_KEXEC_FILE
 config ARCH_SELECTS_KEXEC_FILE
 	def_bool y
 	depends on KEXEC_FILE
-	select HAVE_IMA_KEXEC if IMA
+	select HAVE_IMA_KEXEC_OF if IMA
 
 config ARCH_SUPPORTS_KEXEC_SIG
 	def_bool y
diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 2067d1f2ad7a..b5420d482da4 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -690,7 +690,7 @@ config ARCH_SELECTS_KEXEC_FILE
 	depends on KEXEC_FILE
 	select KEXEC_ELF
 	select RELOCATABLE
-	select HAVE_IMA_KEXEC if IMA
+	select HAVE_IMA_KEXEC_OF if IMA
 
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool 64BIT
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 2580e27e4328..096c6061893b 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -643,7 +643,7 @@ config ARCH_SELECTS_KEXEC_FILE
 	def_bool y
 	depends on KEXEC_FILE
 	select KEXEC_ELF
-	select HAVE_IMA_KEXEC if IMA
+	select HAVE_IMA_KEXEC_OF if IMA
 
 config PPC64_BIG_ENDIAN_ELF_ABI_V2
 	# Option is available to BFD, but LLD does not support ELFv1 so this is
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index f8e26c4bed2b..161bf8a65beb 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -1118,7 +1118,7 @@ config ARCH_SUPPORTS_KEXEC_FILE
 config ARCH_SELECTS_KEXEC_FILE
 	def_bool y
 	depends on KEXEC_FILE
-	select HAVE_IMA_KEXEC if IMA
+	select HAVE_IMA_KEXEC_OF if IMA
 	select KEXEC_ELF
 
 config ARCH_SUPPORTS_KEXEC_PURGATORY
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index cda6adb9f69c..bc17e353c099 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -421,7 +421,7 @@ static void __init add_early_ima_buffer(u64 phys_addr)
 #endif
 }
 
-#if defined(CONFIG_HAVE_IMA_KEXEC) && !defined(CONFIG_OF_FLATTREE)
+#ifdef CONFIG_HAVE_IMA_KEXEC
 int __init ima_free_kexec_buffer(void)
 {
 	if (!ima_kexec_buffer_size)
diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
index 029903b986cb..724f29fef0c0 100644
--- a/drivers/of/kexec.c
+++ b/drivers/of/kexec.c
@@ -116,7 +116,7 @@ static int do_get_kexec_buffer(const void *prop, int len, unsigned long *addr,
 	return 0;
 }
 
-#ifdef CONFIG_HAVE_IMA_KEXEC
+#ifdef CONFIG_HAVE_IMA_KEXEC_OF
 /**
  * ima_get_kexec_buffer - get IMA buffer from the previous kernel
  * @addr:	On successful return, set to point to the buffer contents.
@@ -196,7 +196,7 @@ static void remove_ima_buffer(void *fdt, int chosen_node)
 	size_t size;
 	const void *prop;
 
-	if (!IS_ENABLED(CONFIG_HAVE_IMA_KEXEC))
+	if (!IS_ENABLED(CONFIG_HAVE_IMA_KEXEC_OF))
 		return;
 
 	prop = fdt_getprop(fdt, chosen_node, "linux,ima-kexec-buffer", &len);
diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
index 15632358bcf7..c6ed60f04ea4 100644
--- a/kernel/Kconfig.kexec
+++ b/kernel/Kconfig.kexec
@@ -17,6 +17,10 @@ config KEXEC_ELF
 config HAVE_IMA_KEXEC
 	bool
 
+config HAVE_IMA_KEXEC_OF
+	bool
+	select HAVE_IMA_KEXEC
+
 config KEXEC
 	bool "Enable kexec system call"
 	depends on ARCH_SUPPORTS_KEXEC
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
