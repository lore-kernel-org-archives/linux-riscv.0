Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C85D3C928
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Dec 2025 16:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KPix6HycwupvmncojUD2gBVRTh0MSfc2ueXR+u3TBRk=; b=jNDV/NFYjJvxsx
	ImkojFCrpVaqpdPQmlENlP5Qq94dja/KVTdjVzLrAVkSGekRLsL+ubRCycH79AwiQme88f+TqHZiN
	2oPkp8tGqzzPd1qE+2BPPQ7FKxBxJmWZW4kj7Kmy1e2JDY66iYAFazjB0WgJVyp7I9oZINViJIRju
	D+x8hFpvB1jdN8m+daMQJOJ/bE/faFvQP6VCliQ+Sm92/81WtCaZO7v39+CaQGKP0UZ7U70bADOM5
	d8lZdqULRlm2njHV/cCOby66LGI33sd5S/MTNjIC9A8T9N3CKU3LR5KtNGwjyZdAavNpiI0kp7Ly6
	6VoBDBv3gwJ7CPjQZF7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMpS-0000000Fc7Y-3FDB;
	Wed, 10 Dec 2025 16:14:14 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMpP-0000000Fc5g-1fgb
	for linux-riscv@lists.infradead.org;
	Wed, 10 Dec 2025 16:14:13 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-7b9387df58cso10735242b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 10 Dec 2025 08:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1765383250; x=1765988050; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kKl+uX1iQ9GGm+7rzgkc69XFfZi7u2dPyahYv9yRQo4=;
        b=NnwNsIyhVjcIpXmkMaQJ3Eqj0dfFitZ3WJZaDFdRQKNVv4EiPQ1D6pCJMOyuCmjHIJ
         lxVZeP+LRimOcbjpiveHRe6WbieQb+ocB9dsRlJQ0iUX0eMWKSmXlkAZUZ5Q+I9UZw7A
         QfRGjmPWge2aXmrc53dxCv3GfdgjYdLbTXeVvV2cm0fT0Rb5/iUMN5BHRqrje8yEb3Wz
         SZ8Pi2xhuf4wjJ+Egk5xKzDNAo2+ZfbRtDjL2qRQm+CxLIwy65w0hEvMDWIFebZcKneY
         Cd1ze7Wusf5GauReU0TOpUyflIZj5LFRF1V12rqWQ2b2OWTrp3pN1wGwq71BaJVH09QQ
         w/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765383250; x=1765988050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kKl+uX1iQ9GGm+7rzgkc69XFfZi7u2dPyahYv9yRQo4=;
        b=X+PtSBjrVeYRsiELituHKaotb/uT0mS6rNJRKXfYOLNBGf86iicLzhFUrjuT9AqfBt
         9H+5uWq0a696u+5tvlMB2/fOm75KcbYoSzdVcOtR3kvTUkWPP2brEX7MHCHCBFEOhixN
         aMxxDu9l5o69k7sW1drr12WI2s6S9Z6R/v49VKHIOk7ZSLWy+kOIH8Ulby8MpvYmW3HM
         IwZIc8VK0Ueyr2xjrnCuO8DV/lCCqUjlcnQIJqI3YpDzVqYxziQ/J2cfeWcewyoZJggv
         lp+DFoz4PahjZIMFHIMaVYOLbJhsCb9yWLsACQ7xC3b1+VxTdM1zZLib5aoVdK5pTRcc
         JiNg==
X-Gm-Message-State: AOJu0YzFJvCITCaXMf4qG3xEaR3YneBtfiXVUpR4YWJcf4yIKXsGP789
	Bg/anQ/pXs9nGI4NO4GYEPvjhztjCaJs17l5bP2ESPfSNy8auBAvnnk1ge2p4obMdPo=
X-Gm-Gg: ASbGnctXU8cU5vhWEp6QAfcjQRO83+6RfPtP1Jw2tMoY8uc+3SmaiJycAk7IEHN8RlX
	OoinFCjE2hLSA2gEOlKUm6w8YJ30qTTVWnZHTNqKOGFmKLUwJq0OmymQzF1ow9imDKvtbp4GCO/
	IrgxtPSrbbQJC2YSNME8M7OxT7l1nmR6mNd3dxjFF21L4+V6RK+UXP+3IZlpdThGlgNQLA5TacD
	902l8sjJzaH50NQ3GK4I2xmF6bvhInWWpXi14+YGYrsD/qcnEktdLY3Z7erlnw9ZwSHsJH68YM0
	qMbR51hNVQkIHKSU9bHM58BNNqIqIw+mjEk57oh28Mbq5Iyw9NMSUiC0mYTNoJF+ABu1TytQFOn
	HVHZ9sJOXWHyq9p9ePNT2UesH431Vu0O5kGhvjXIidz2RU3sdR3vnrPZMZn3lHpvslAk9r8MkZC
	n8r/BTFx5xQEeyYgSsUGrHrSazGvgq2sogBqNwk01Ea5/smQK4QlAMCDTmfrqw7rZEVkdom0FoS
	nauEo4W2LbV
X-Google-Smtp-Source: AGHT+IEPdzDDmvTj6aOtLV4A7G4fnh1iJkTH7bQhLw33qbSjqIpybfiznFUwqOpKUkoa8oxeK0haSg==
X-Received: by 2002:a05:7022:ff46:b0:11e:353:57af with SMTP id a92af1059eb24-11f296f08aamr2605004c88.49.1765383250290;
        Wed, 10 Dec 2025 08:14:10 -0800 (PST)
Received: from [127.0.1.1] (p7838222-ipoefx.ipoe.ocn.ne.jp. [123.225.39.221])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f283d4733sm10364600c88.17.2025.12.10.08.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 08:14:09 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
X-Google-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Wed, 10 Dec 2025 08:13:45 -0800
Subject: [PATCH RFC 08/10] riscv: Optimize cpufeature macros for extension
 assumptions
MIME-Version: 1.0
Message-Id: <20251210-profiles-v1-8-315a6ff2ca5a@gmail.com>
References: <20251210-profiles-v1-0-315a6ff2ca5a@gmail.com>
In-Reply-To: <20251210-profiles-v1-0-315a6ff2ca5a@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 Eric Biggers <ebiggers@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765383226; l=40935;
 i=thecharlesjenkins@gmail.com; s=20240124; h=from:subject:message-id;
 bh=9Yg7eiHbbMZ97dsT8VHvna+aVc6IjSnWR+fQ05yjHVk=;
 b=y1deecj3NNapOGbWLEuPBFoCBQliBa2EOcR3LX7oavNutDeqP4AeJjwFcb+33KWWihxDcdVt+
 bVMgcYQIoMDC9P2W0po2ZJNxohQ+34reM44iw9rZ1RJUCVfj51ak4Uh
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=eVndo3OHViAjwuqHqbJB4ZtzJzzvk/r6fUf84tZ3rw4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_081411_513920_0F7E9B8D 
X-CRM114-Status: GOOD (  19.54  )
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

When an extension is compiled into the kernel as "y" in Kconfig, the
runtime alternative patching, along with the nops required for that, can
be removed. Refactor the riscv_has_extension* functions and macros to be
able to account for an extension being selected as "y", "m", or "n" and
emit the optimal code in each case. The functions are converted into
macros so that only code for the selected "y"/"m"/"n" case will be
emited.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 arch/riscv/include/asm/arch_hweight.h      |   4 +-
 arch/riscv/include/asm/archrandom.h        |   2 +-
 arch/riscv/include/asm/bitops.h            |   8 +-
 arch/riscv/include/asm/checksum.h          |   2 +-
 arch/riscv/include/asm/cmpxchg.h           |  12 +--
 arch/riscv/include/asm/cpufeature-macros.h | 136 +++++++++++++++++++----------
 arch/riscv/include/asm/cpufeature.h        |  42 ++++-----
 arch/riscv/include/asm/pgtable.h           |   6 +-
 arch/riscv/include/asm/swab.h              |   2 +-
 arch/riscv/include/asm/switch_to.h         |   4 +-
 arch/riscv/include/asm/uaccess.h           |   2 +-
 arch/riscv/include/asm/vector.h            |   5 +-
 arch/riscv/include/asm/vendor_extensions.h | 113 +++++++++++++-----------
 arch/riscv/kernel/cpufeature.c             |   6 +-
 arch/riscv/kernel/pi/archrandom_early.c    |   1 +
 arch/riscv/kernel/process.c                |   8 +-
 arch/riscv/kernel/suspend.c                |   8 +-
 arch/riscv/kvm/tlb.c                       |   2 +-
 arch/riscv/kvm/vcpu.c                      |  10 +--
 arch/riscv/kvm/vcpu_onereg.c               |   6 +-
 arch/riscv/lib/csum.c                      |   6 +-
 arch/riscv/mm/pgtable.c                    |   2 +-
 arch/riscv/mm/tlbflush.c                   |   2 +-
 arch/riscv/net/bpf_jit.h                   |   2 +-
 drivers/perf/riscv_pmu_sbi.c               |   3 +-
 lib/crc/riscv/crc-t10dif.h                 |   2 +-
 lib/crc/riscv/crc32.h                      |   8 +-
 lib/crc/riscv/crc64.h                      |   4 +-
 28 files changed, 228 insertions(+), 180 deletions(-)

diff --git a/arch/riscv/include/asm/arch_hweight.h b/arch/riscv/include/asm/arch_hweight.h
index f3c0831beefc..95fda1d4e1ac 100644
--- a/arch/riscv/include/asm/arch_hweight.h
+++ b/arch/riscv/include/asm/arch_hweight.h
@@ -21,7 +21,7 @@ static __always_inline unsigned int __arch_hweight32(unsigned int w)
 {
 	if (!(IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
 	      IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
-	      riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)))
+	      riscv_has_extension_likely(ZBB)))
 		return __sw_hweight32(w);
 
 	asm (".option push\n"
@@ -48,7 +48,7 @@ static __always_inline unsigned long __arch_hweight64(__u64 w)
 {
 	if (!(IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
 	      IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
-	      riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)))
+	      riscv_has_extension_likely(ZBB)))
 		return __sw_hweight64(w);
 
 	asm (".option push\n"
diff --git a/arch/riscv/include/asm/archrandom.h b/arch/riscv/include/asm/archrandom.h
index 5345360adfb9..44e97115afd6 100644
--- a/arch/riscv/include/asm/archrandom.h
+++ b/arch/riscv/include/asm/archrandom.h
@@ -63,7 +63,7 @@ static inline size_t __must_check arch_get_random_seed_longs(unsigned long *v, s
 	 * If Zkr is supported and csr_seed_long succeeds, we return one long
 	 * worth of entropy.
 	 */
-	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZKR) && csr_seed_long(v))
+	if (riscv_has_extension_likely(ZKR) && csr_seed_long(v))
 		return 1;
 
 	return 0;
diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
index 238092125c11..52271507598a 100644
--- a/arch/riscv/include/asm/bitops.h
+++ b/arch/riscv/include/asm/bitops.h
@@ -47,7 +47,7 @@
 
 static __always_inline __attribute_const__ unsigned long variable__ffs(unsigned long word)
 {
-	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
+	if (!riscv_has_extension_likely(ZBB))
 		return generic___ffs(word);
 
 	asm volatile (".option push\n"
@@ -72,7 +72,7 @@ static __always_inline __attribute_const__ unsigned long variable__ffs(unsigned
 
 static __always_inline __attribute_const__ unsigned long variable__fls(unsigned long word)
 {
-	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
+	if (!riscv_has_extension_likely(ZBB))
 		return generic___fls(word);
 
 	asm volatile (".option push\n"
@@ -97,7 +97,7 @@ static __always_inline __attribute_const__ unsigned long variable__fls(unsigned
 
 static __always_inline __attribute_const__ int variable_ffs(int x)
 {
-	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
+	if (!riscv_has_extension_likely(ZBB))
 		return generic_ffs(x);
 
 	if (!x)
@@ -125,7 +125,7 @@ static __always_inline __attribute_const__ int variable_ffs(int x)
 
 static __always_inline int variable_fls(unsigned int x)
 {
-	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
+	if (!riscv_has_extension_likely(ZBB))
 		return generic_fls(x);
 
 	if (!x)
diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/checksum.h
index 945cce34be92..e747af23eea2 100644
--- a/arch/riscv/include/asm/checksum.h
+++ b/arch/riscv/include/asm/checksum.h
@@ -51,7 +51,7 @@ static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
 	 */
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
 	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
-	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)) {
+	    riscv_has_extension_likely(ZBB)) {
 		unsigned long fold_temp;
 
 		if (IS_ENABLED(CONFIG_32BIT)) {
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 0fee37752098..7ee50741c4dd 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -20,7 +20,7 @@
 			   swap_append, r, p, n)				\
 ({										\
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&				\
-	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA)) {		\
+	    riscv_has_extension_unlikely(ZABHA)) {		\
 		__asm__ __volatile__ (						\
 			prepend							\
 			"	amoswap" swap_sfx " %0, %z2, %1\n"		\
@@ -135,8 +135,8 @@
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&				\
 	    IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&				\
 	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZACAS) &&				\
-	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA) &&		\
-	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)) {		\
+	    riscv_has_extension_unlikely(ZABHA) &&		\
+	    riscv_has_extension_unlikely(ZACAS)) {		\
 		r = o;								\
 										\
 		__asm__ __volatile__ (						\
@@ -183,7 +183,7 @@
 ({									\
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&			\
 	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZACAS) &&			\
-	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)) {	\
+	    riscv_has_extension_unlikely(ZACAS)) {	\
 		r = o;							\
 									\
 		__asm__ __volatile__ (					\
@@ -320,7 +320,7 @@
 
 #if defined(CONFIG_64BIT) && defined(CONFIG_RISCV_ISA_ZACAS) && defined(CONFIG_TOOLCHAIN_HAS_ZACAS)
 
-#define system_has_cmpxchg128()        riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)
+#define system_has_cmpxchg128()        riscv_has_extension_unlikely(ZACAS)
 
 union __u128_halves {
 	u128 full;
@@ -373,7 +373,7 @@ static __always_inline void __cmpwait(volatile void *ptr,
 	u32 *__ptr32b;
 	ulong __s, __val, __mask;
 
-	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZAWRS)) {
+	if (!riscv_has_extension_likely(ZAWRS)) {
 		ALT_RISCV_PAUSE();
 		return;
 	}
diff --git a/arch/riscv/include/asm/cpufeature-macros.h b/arch/riscv/include/asm/cpufeature-macros.h
index a8103edbf51f..d16bbbeb6a44 100644
--- a/arch/riscv/include/asm/cpufeature-macros.h
+++ b/arch/riscv/include/asm/cpufeature-macros.h
@@ -9,58 +9,100 @@
 #include <asm/hwcap.h>
 #include <asm/alternative-macros.h>
 
+#include <linux/args.h>
+
 #define STANDARD_EXT		0
 
+#define _RISCV_EXTENSION_BEHAVIOR_MODULE_RET_1(vendor, ext, id, fallback, alternative)	\
+	({										\
+		__label__ alt, done;							\
+		__typeof__(fallback) ret;						\
+		asm goto(ALTERNATIVE("j	%l[alt]", "nop", vendor, id, 1) : : : : alt); 	\
+		ret = fallback;								\
+		goto done;								\
+alt:											\
+		ret = alternative;							\
+done:											\
+		ret;									\
+	})
+
+#define _RISCV_EXTENSION_BEHAVIOR_MODULE_RET_0(vendor, ext, id, fallback, alternative)	\
+	({										\
+		__label__ alt, done;							\
+		__typeof__(fallback) ret;						\
+		asm goto(ALTERNATIVE("nop", "j %l[alt]", vendor, id, 1) : : : : alt);	\
+		ret = fallback;								\
+		goto done;								\
+alt:											\
+		ret = alternative;							\
+done:											\
+		ret;									\
+	})
+
+/* Check if extension is required */
+#define _RISCV_DISPATCH_BUILTIN_1(vendor, ext, id, fallback, alternative, likely, suffix) alternative
+
+#define _RISCV_DISPATCH_BUILTIN_0(vendor, ext, id, fallback, alternative, likely, suffix) \
+	_RISCV_DISPATCH_MODULE_CHECK(vendor, ext, id, fallback, alternative, likely, suffix)
+
+/* Check if extension is optional */
+#define _RISCV_DISPATCH_MODULE_CHECK(vendor, ext, id, fallback, alternative, likely, suffix) \
+	CONCATENATE(_RISCV_DISPATCH_MODULE_, IS_MODULE(CONFIG_RISCV_ISA_##ext))(     \
+		vendor, ext, id, fallback, alternative, likely, suffix)
+
+#define _RISCV_DISPATCH_MODULE_1(vendor, ext, id, fallback, alternative, likely, suffix) \
+	_RISCV_EXTENSION_BEHAVIOR_MODULE_##suffix##likely(vendor, ext, id, fallback, alternative)
+
+/* Extension is not selected, use the fallback */
+#define _RISCV_DISPATCH_MODULE_0(vendor, ext, id, fallback, alternative, likely, suffix) fallback
+
+/*
+ * Three possibilities:
+ * 1. Kernel is compiled with RISCV_ISA_EXT_ext=y --> "alternative" will be used
+ * 2. Kernel is compiled with RISCV_ISA_EXT_ext=m --> "alternative" will be
+ *    used if extension detected at boot, otherwise "fallback" will be used.
+ * 3. Kernel is compiled with RISCV_ISA_EXT_ext=n --> "fallback" will be used.
+ */
+#define _RISCV_HAS_EXTENSION_ALTERNATIVE_RET(vendor, ext, id, likely)              \
+	CONCATENATE(_RISCV_DISPATCH_BUILTIN_, IS_BUILTIN(CONFIG_RISCV_ISA_##ext))( \
+		vendor, ext, id, false, true, likely, RET_)
+
 bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, unsigned int bit);
 #define riscv_isa_extension_available(isa_bitmap, ext)	\
 	__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_##ext)
 
-static __always_inline bool __riscv_has_extension_likely(const unsigned long vendor,
-							 const unsigned long ext)
-{
-	asm goto(ALTERNATIVE("j	%l[l_no]", "nop", %[vendor], %[ext], 1)
-	:
-	: [vendor] "i" (vendor), [ext] "i" (ext)
-	:
-	: l_no);
-
-	return true;
-l_no:
-	return false;
-}
-
-static __always_inline bool __riscv_has_extension_unlikely(const unsigned long vendor,
-							   const unsigned long ext)
-{
-	asm goto(ALTERNATIVE("nop", "j	%l[l_yes]", %[vendor], %[ext], 1)
-	:
-	: [vendor] "i" (vendor), [ext] "i" (ext)
-	:
-	: l_yes);
-
-	return false;
-l_yes:
-	return true;
-}
-
-static __always_inline bool riscv_has_extension_unlikely(const unsigned long ext)
-{
-	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
-
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
-		return __riscv_has_extension_unlikely(STANDARD_EXT, ext);
-
-	return __riscv_isa_extension_available(NULL, ext);
-}
-
-static __always_inline bool riscv_has_extension_likely(const unsigned long ext)
-{
-	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
-
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
-		return __riscv_has_extension_likely(STANDARD_EXT, ext);
-
-	return __riscv_isa_extension_available(NULL, ext);
-}
+#define __riscv_has_extension_likely(vendor, ext, id) \
+	_RISCV_HAS_EXTENSION_ALTERNATIVE_RET(vendor, ext, id, 1)
+
+#define __riscv_has_extension_unlikely(vendor, ext, id) \
+	_RISCV_HAS_EXTENSION_ALTERNATIVE_RET(vendor, ext, id, 0)
+
+#define riscv_has_extension_unlikely(ext)							\
+	({											\
+		bool has_extension;								\
+		compiletime_assert(RISCV_ISA_EXT_##ext < RISCV_ISA_EXT_MAX,			\
+				   "ext must be < RISCV_ISA_EXT_MAX");				\
+		if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))					\
+			has_extension = __riscv_has_extension_unlikely(STANDARD_EXT, ext,	\
+								       RISCV_ISA_EXT_##ext);	\
+		else										\
+			has_extension =								\
+				__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_##ext);	\
+		has_extension;									\
+	})
+
+#define riscv_has_extension_likely(ext)								\
+	({											\
+		bool has_extension;								\
+		compiletime_assert(RISCV_ISA_EXT_##ext < RISCV_ISA_EXT_MAX,			\
+				   "ext must be < RISCV_ISA_EXT_MAX");				\
+		if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))					\
+			has_extension = __riscv_has_extension_likely(STANDARD_EXT, ext,		\
+								     RISCV_ISA_EXT_##ext);	\
+		else										\
+			has_extension =								\
+				__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_##ext);	\
+		has_extension;									\
+	})
 
 #endif /* _ASM_CPUFEATURE_MACROS_H */
diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 62837fa981e8..e7903f52bbc5 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -130,26 +130,26 @@ extern const size_t riscv_isa_ext_count;
 extern bool riscv_isa_fallback;
 
 unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
-static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsigned long ext)
-{
-	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
-
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&
-	    __riscv_has_extension_likely(STANDARD_EXT, ext))
-		return true;
-
-	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
-}
-
-static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsigned long ext)
-{
-	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
-
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&
-	    __riscv_has_extension_unlikely(STANDARD_EXT, ext))
-		return true;
-
-	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
-}
+#define riscv_cpu_has_extension_likely(cpu, ext)						\
+	({											\
+		bool has_extension;								\
+		compiletime_assert(RISCV_ISA_EXT_##ext < RISCV_ISA_EXT_MAX,			\
+				   "ext must be < RISCV_ISA_EXT_MAX");				\
+		if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&					\
+		    __riscv_has_extension_likely(STANDARD_EXT, ext, RISCV_ISA_EXT_##ext))	\
+			return true;								\
+		return __riscv_isa_extension_available(hart_isa[cpu].isa, RISCV_ISA_EXT_##ext);	\
+	})
+
+#define riscv_cpu_has_extension_unlikely(cpu, ext)						\
+	({											\
+		bool has_extension;								\
+		compiletime_assert(RISCV_ISA_EXT_##ext < RISCV_ISA_EXT_MAX,			\
+				   "ext must be < RISCV_ISA_EXT_MAX");				\
+		if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&					\
+		    __riscv_has_extension_unlikely(STANDARD_EXT, ext, RISCV_ISA_EXT_##ext))	\
+			return true;								\
+		return __riscv_isa_extension_available(hart_isa[cpu].isa, RISCV_ISA_EXT_##ext);	\
+	})
 
 #endif
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 45b2021eb2c1..85dd7d5e5278 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -293,7 +293,7 @@ static inline pte_t pud_pte(pud_t pud)
 
 static __always_inline bool has_svnapot(void)
 {
-	return riscv_has_extension_likely(RISCV_ISA_EXT_SVNAPOT);
+	return riscv_has_extension_likely(SVNAPOT);
 }
 
 static inline unsigned long pte_napot(pte_t pte)
@@ -501,7 +501,7 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 	 * a bounded timeframe, so when the uarch does not cache invalid
 	 * entries, we don't have to do anything.
 	 */
-	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVVPTC))
+	if (riscv_has_extension_unlikely(SVVPTC))
 		return;
 
 	/*
@@ -663,7 +663,7 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
 #define arch_has_hw_pte_young arch_has_hw_pte_young
 static inline bool arch_has_hw_pte_young(void)
 {
-	return riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU);
+	return riscv_has_extension_unlikely(SVADU);
 }
 
 /*
diff --git a/arch/riscv/include/asm/swab.h b/arch/riscv/include/asm/swab.h
index c1da22aa1326..c87be2477ff4 100644
--- a/arch/riscv/include/asm/swab.h
+++ b/arch/riscv/include/asm/swab.h
@@ -35,7 +35,7 @@
 ({									\
 	unsigned long x = value;					\
 									\
-	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)) {            \
+	if (riscv_has_extension_likely(ZBB)) {				\
 		asm volatile (".option push\n"				\
 			      ".option arch,+zbb\n"			\
 			      "rev8 %0, %1\n"				\
diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index ff35a4d04f85..a2cf333097cd 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -60,8 +60,8 @@ static inline void __switch_to_fpu(struct task_struct *prev,
 
 static __always_inline bool has_fpu(void)
 {
-	return riscv_has_extension_likely(RISCV_ISA_EXT_F) ||
-		riscv_has_extension_likely(RISCV_ISA_EXT_D);
+	return riscv_has_extension_likely(F) ||
+		riscv_has_extension_likely(D);
 }
 #else
 static __always_inline bool has_fpu(void) { return false; }
diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index f5f4f7f85543..4a07ee5d3084 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -15,7 +15,7 @@
 #ifdef CONFIG_RISCV_ISA_SUPM
 static inline unsigned long __untagged_addr_remote(struct mm_struct *mm, unsigned long addr)
 {
-	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SUPM)) {
+	if (riscv_has_extension_unlikely(SUPM)) {
 		u8 pmlen = mm->context.pmlen;
 
 		/* Virtual addresses are sign-extended; physical addresses are zero-extended. */
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 7a506c780874..3788ba060c1e 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -59,7 +59,7 @@ static inline u32 riscv_v_flags(void)
 
 static __always_inline bool has_vector(void)
 {
-	return riscv_has_extension_unlikely(RISCV_ISA_EXT_ZVE32X);
+	return riscv_has_extension_unlikely(ZVE32X);
 }
 
 static __always_inline bool has_xtheadvector_no_alternatives(void)
@@ -73,8 +73,7 @@ static __always_inline bool has_xtheadvector_no_alternatives(void)
 static __always_inline bool has_xtheadvector(void)
 {
 	if (IS_ENABLED(CONFIG_RISCV_ISA_XTHEADVECTOR))
-		return riscv_has_vendor_extension_unlikely(THEAD_VENDOR_ID,
-							   RISCV_ISA_VENDOR_EXT_XTHEADVECTOR);
+		return riscv_has_vendor_extension_unlikely(THEAD_VENDOR_ID, XTHEADVECTOR);
 	else
 		return false;
 }
diff --git a/arch/riscv/include/asm/vendor_extensions.h b/arch/riscv/include/asm/vendor_extensions.h
index 7437304a71b9..e536d8342878 100644
--- a/arch/riscv/include/asm/vendor_extensions.h
+++ b/arch/riscv/include/asm/vendor_extensions.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright 2024 Rivos, Inc
+ * Copyright 2024-2025 Rivos, Inc
  */
 
 #ifndef _ASM_VENDOR_EXTENSIONS_H
@@ -48,57 +48,64 @@ bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsig
 	__riscv_isa_vendor_extension_available(VENDOR_EXT_ALL_CPUS, vendor, \
 					       RISCV_ISA_VENDOR_EXT_##ext)
 
-static __always_inline bool riscv_has_vendor_extension_likely(const unsigned long vendor,
-							      const unsigned long ext)
-{
-	if (!IS_ENABLED(CONFIG_RISCV_ISA_VENDOR_EXT))
-		return false;
-
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
-		return __riscv_has_extension_likely(vendor,
-						    ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
-
-	return __riscv_isa_vendor_extension_available(VENDOR_EXT_ALL_CPUS, vendor, ext);
-}
-
-static __always_inline bool riscv_has_vendor_extension_unlikely(const unsigned long vendor,
-								const unsigned long ext)
-{
-	if (!IS_ENABLED(CONFIG_RISCV_ISA_VENDOR_EXT))
-		return false;
-
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
-		return __riscv_has_extension_unlikely(vendor,
-						      ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
-
-	return __riscv_isa_vendor_extension_available(VENDOR_EXT_ALL_CPUS, vendor, ext);
-}
-
-static __always_inline bool riscv_cpu_has_vendor_extension_likely(const unsigned long vendor,
-								  int cpu, const unsigned long ext)
-{
-	if (!IS_ENABLED(CONFIG_RISCV_ISA_VENDOR_EXT))
-		return false;
-
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&
-	    __riscv_has_extension_likely(vendor, ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE))
-		return true;
-
-	return __riscv_isa_vendor_extension_available(cpu, vendor, ext);
-}
-
-static __always_inline bool riscv_cpu_has_vendor_extension_unlikely(const unsigned long vendor,
-								    int cpu,
-								    const unsigned long ext)
-{
-	if (!IS_ENABLED(CONFIG_RISCV_ISA_VENDOR_EXT))
-		return false;
-
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&
-	    __riscv_has_extension_unlikely(vendor, ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE))
-		return true;
-
-	return __riscv_isa_vendor_extension_available(cpu, vendor, ext);
-}
+#define riscv_has_vendor_extension_likely(vendor, ext)                                            \
+	({                                                                                        \
+		bool has_extension;                                                               \
+		if (!IS_ENABLED(CONFIG_RISCV_ISA_VENDOR_EXT))                                     \
+			return false;                                                             \
+		if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))                                         \
+			has_extension = __riscv_has_extension_likely(                             \
+				vendor, ext,                                                      \
+				RISCV_ISA_VENDOR_EXT_##ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE); \
+		else                                                                              \
+			has_extension = __riscv_isa_vendor_extension_available(                   \
+				VENDOR_EXT_ALL_CPUS, vendor, RISCV_ISA_VENDOR_EXT_##ext);         \
+		has_extension                                                                     \
+	})
+
+#define riscv_has_vendor_extension_unlikely(vendor, ext)                                          \
+	({                                                                                        \
+		bool has_extension;                                                               \
+		if (!IS_ENABLED(CONFIG_RISCV_ISA_VENDOR_EXT))                                     \
+			return false;                                                             \
+		if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))                                         \
+			has_extension = __riscv_has_extension_unlikely(                           \
+				vendor, ext,                                                      \
+				RISCV_ISA_VENDOR_EXT_##ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE); \
+		else                                                                              \
+			has_extension = __riscv_isa_vendor_extension_available(                   \
+				VENDOR_EXT_ALL_CPUS, vendor, RISCV_ISA_VENDOR_EXT_##ext);         \
+		has_extension;                                                                    \
+	})
+
+#define riscv_cpu_has_vendor_extension_likely(vendor, cpu, ext)                                   \
+	({                                                                                        \
+		bool has_extension;                                                               \
+		if (!IS_ENABLED(CONFIG_RISCV_ISA_VENDOR_EXT))                                     \
+			return false;                                                             \
+		if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))                                         \
+			has_extension = __riscv_has_extension_likely(                             \
+				vendor, ext,                                                      \
+				RISCV_ISA_VENDOR_EXT_##ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE); \
+		else                                                                              \
+			has_extension = __riscv_isa_vendor_extension_available(                   \
+				cpu, vendor, RISCV_ISA_VENDOR_EXT_##ext);                         \
+		has_extension;                                                                    \
+	})
+
+#define riscv_cpu_has_vendor_extension_unlikely(vendor, cpu, ext)                                 \
+	({                                                                                        \
+		if (!IS_ENABLED(CONFIG_RISCV_ISA_VENDOR_EXT))                                     \
+			return false;                                                             \
+		if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))                                         \
+			has_extension = __riscv_has_extension_unlikely(                           \
+				vendor, ext,                                                      \
+				RISCV_ISA_VENDOR_EXT_##ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE); \
+                                                                                                  \
+		else                                                                              \
+			has_extension = __riscv_isa_vendor_extension_available(                   \
+				cpu, vendor, RISCV_ISA_VENDOR_EXT_##ext);                         \
+		has_extension;                                                                    \
+	})
 
 #endif /* _ASM_VENDOR_EXTENSIONS_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 47612e9ca1c6..8913fcd6652e 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -1120,17 +1120,17 @@ unsigned long riscv_get_elf_hwcap(void)
 
 void __init riscv_user_isa_enable(void)
 {
-	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOZ))
+	if (riscv_has_extension_unlikely(ZICBOZ))
 		current->thread.envcfg |= ENVCFG_CBZE;
 	else if (any_cpu_has_zicboz)
 		pr_warn("Zicboz disabled as it is unavailable on some harts\n");
 
-	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOM))
+	if (riscv_has_extension_unlikely(ZICBOM))
 		current->thread.envcfg |= ENVCFG_CBCFE;
 	else if (any_cpu_has_zicbom)
 		pr_warn("Zicbom disabled as it is unavailable on some harts\n");
 
-	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOP) &&
+	if (!riscv_has_extension_unlikely(ZICBOP) &&
 	    any_cpu_has_zicbop)
 		pr_warn("Zicbop disabled as it is unavailable on some harts\n");
 }
diff --git a/arch/riscv/kernel/pi/archrandom_early.c b/arch/riscv/kernel/pi/archrandom_early.c
index 3f05d3cf3b7b..0949a44d272a 100644
--- a/arch/riscv/kernel/pi/archrandom_early.c
+++ b/arch/riscv/kernel/pi/archrandom_early.c
@@ -10,6 +10,7 @@
  * for the functions that won't be included.
  */
 #undef riscv_has_extension_unlikely
+#undef riscv_has_extension_likely
 #define riscv_has_extension_likely(...) false
 #undef pr_err_once
 #define pr_err_once(...)
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index e3e501001916..7b46db8f4009 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -185,7 +185,7 @@ void flush_thread(void)
 	clear_tsk_thread_flag(current, TIF_RISCV_V_DEFER_RESTORE);
 #endif
 #ifdef CONFIG_RISCV_ISA_SUPM
-	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SUPM))
+	if (riscv_has_extension_unlikely(SUPM))
 		envcfg_update_bits(current, ENVCFG_PMM, ENVCFG_PMM_PMLEN_0);
 #endif
 }
@@ -290,7 +290,7 @@ long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg)
 	unsigned long pmm;
 	u8 pmlen;
 
-	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_SUPM))
+	if (!riscv_has_extension_unlikely(SUPM))
 		return -EINVAL;
 
 	if (is_compat_thread(ti))
@@ -348,7 +348,7 @@ long get_tagged_addr_ctrl(struct task_struct *task)
 	struct thread_info *ti = task_thread_info(task);
 	long ret = 0;
 
-	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_SUPM))
+	if (!riscv_has_extension_unlikely(SUPM))
 		return -EINVAL;
 
 	if (is_compat_thread(ti))
@@ -399,7 +399,7 @@ static const struct ctl_table tagged_addr_sysctl_table[] = {
 
 static int __init tagged_addr_init(void)
 {
-	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_SUPM))
+	if (!riscv_has_extension_unlikely(SUPM))
 		return 0;
 
 	/*
diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
index 24b3f57d467f..ea9547bfc6d7 100644
--- a/arch/riscv/kernel/suspend.c
+++ b/arch/riscv/kernel/suspend.c
@@ -14,7 +14,7 @@
 
 void suspend_save_csrs(struct suspend_context *context)
 {
-	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_XLINUXENVCFG))
+	if (riscv_has_extension_unlikely(XLINUXENVCFG))
 		context->envcfg = csr_read(CSR_ENVCFG);
 	context->tvec = csr_read(CSR_TVEC);
 	context->ie = csr_read(CSR_IE);
@@ -30,7 +30,7 @@ void suspend_save_csrs(struct suspend_context *context)
 	 */
 
 #ifdef CONFIG_MMU
-	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SSTC)) {
+	if (riscv_has_extension_unlikely(SSTC)) {
 		context->stimecmp = csr_read(CSR_STIMECMP);
 #if __riscv_xlen < 64
 		context->stimecmph = csr_read(CSR_STIMECMPH);
@@ -44,13 +44,13 @@ void suspend_save_csrs(struct suspend_context *context)
 void suspend_restore_csrs(struct suspend_context *context)
 {
 	csr_write(CSR_SCRATCH, 0);
-	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_XLINUXENVCFG))
+	if (riscv_has_extension_unlikely(XLINUXENVCFG))
 		csr_write(CSR_ENVCFG, context->envcfg);
 	csr_write(CSR_TVEC, context->tvec);
 	csr_write(CSR_IE, context->ie);
 
 #ifdef CONFIG_MMU
-	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SSTC)) {
+	if (riscv_has_extension_unlikely(SSTC)) {
 		csr_write(CSR_STIMECMP, context->stimecmp);
 #if __riscv_xlen < 64
 		csr_write(CSR_STIMECMPH, context->stimecmph);
diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index 3c5a70a2b927..50796c4ee8b6 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -18,7 +18,7 @@
 #include <asm/kvm_tlb.h>
 #include <asm/kvm_vmid.h>
 
-#define has_svinval()	riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
+#define has_svinval()	riscv_has_extension_unlikely(SVINVAL)
 
 void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
 					  gpa_t gpa, gpa_t gpsz,
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 5ce35aba6069..91556a897bb5 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -561,7 +561,7 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
 	    !riscv_isa_extension_available(isa, SVADE))
 		cfg->henvcfg |= ENVCFG_ADUE;
 
-	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
+	if (riscv_has_extension_unlikely(SMSTATEEN)) {
 		cfg->hstateen0 |= SMSTATEEN0_HSENVCFG;
 		if (riscv_isa_extension_available(isa, SSAIA))
 			cfg->hstateen0 |= SMSTATEEN0_AIA_IMSIC |
@@ -596,7 +596,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 		nacl_csr_write(nsh, CSR_HENVCFG, cfg->henvcfg);
 		if (IS_ENABLED(CONFIG_32BIT))
 			nacl_csr_write(nsh, CSR_HENVCFGH, cfg->henvcfg >> 32);
-		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
+		if (riscv_has_extension_unlikely(SMSTATEEN)) {
 			nacl_csr_write(nsh, CSR_HSTATEEN0, cfg->hstateen0);
 			if (IS_ENABLED(CONFIG_32BIT))
 				nacl_csr_write(nsh, CSR_HSTATEEN0H, cfg->hstateen0 >> 32);
@@ -615,7 +615,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 		csr_write(CSR_HENVCFG, cfg->henvcfg);
 		if (IS_ENABLED(CONFIG_32BIT))
 			csr_write(CSR_HENVCFGH, cfg->henvcfg >> 32);
-		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
+		if (riscv_has_extension_unlikely(SMSTATEEN)) {
 			csr_write(CSR_HSTATEEN0, cfg->hstateen0);
 			if (IS_ENABLED(CONFIG_32BIT))
 				csr_write(CSR_HSTATEEN0H, cfg->hstateen0 >> 32);
@@ -754,7 +754,7 @@ static __always_inline void kvm_riscv_vcpu_swap_in_guest_state(struct kvm_vcpu *
 
 	vcpu->arch.host_scounteren = csr_swap(CSR_SCOUNTEREN, csr->scounteren);
 	vcpu->arch.host_senvcfg = csr_swap(CSR_SENVCFG, csr->senvcfg);
-	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN) &&
+	if (riscv_has_extension_unlikely(SMSTATEEN) &&
 	    (cfg->hstateen0 & SMSTATEEN0_SSTATEEN0))
 		vcpu->arch.host_sstateen0 = csr_swap(CSR_SSTATEEN0,
 						     smcsr->sstateen0);
@@ -768,7 +768,7 @@ static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm_vcpu *v
 
 	csr->scounteren = csr_swap(CSR_SCOUNTEREN, vcpu->arch.host_scounteren);
 	csr->senvcfg = csr_swap(CSR_SENVCFG, vcpu->arch.host_senvcfg);
-	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN) &&
+	if (riscv_has_extension_unlikely(SMSTATEEN) &&
 	    (cfg->hstateen0 & SMSTATEEN0_SSTATEEN0))
 		smcsr->sstateen0 = csr_swap(CSR_SSTATEEN0,
 					    vcpu->arch.host_sstateen0);
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index b6f5d1a74aec..e77779666463 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -240,7 +240,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 		return false;
 	/* Extensions which can be disabled using Smstateen */
 	case KVM_RISCV_ISA_EXT_SSAIA:
-		return riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN);
+		return riscv_has_extension_unlikely(SMSTATEEN);
 	case KVM_RISCV_ISA_EXT_SVADE:
 		/*
 		 * The henvcfg.ADUE is read-only zero if menvcfg.ADUE is zero.
@@ -592,7 +592,7 @@ static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
 		break;
 	case KVM_REG_RISCV_CSR_SMSTATEEN:
 		rc = -EINVAL;
-		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
+		if (riscv_has_extension_unlikely(SMSTATEEN))
 			rc = kvm_riscv_vcpu_smstateen_get_csr(vcpu, reg_num,
 							      &reg_val);
 		break;
@@ -637,7 +637,7 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
 		break;
 	case KVM_REG_RISCV_CSR_SMSTATEEN:
 		rc = -EINVAL;
-		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
+		if (riscv_has_extension_unlikely(SMSTATEEN))
 			rc = kvm_riscv_vcpu_smstateen_set_csr(vcpu, reg_num,
 							      reg_val);
 		break;
diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
index 75bd0abffd63..4db35dd698eb 100644
--- a/arch/riscv/lib/csum.c
+++ b/arch/riscv/lib/csum.c
@@ -42,7 +42,7 @@ __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
 
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
 	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
-	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)) {
+	    riscv_has_extension_likely(ZBB)) {
 		unsigned long fold_temp;
 
 		asm(".option push					\n\
@@ -145,7 +145,7 @@ do_csum_with_alignment(const unsigned char *buff, int len)
 #ifdef CC_HAS_ASM_GOTO_TIED_OUTPUT
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
 	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
-	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)) {
+	    riscv_has_extension_likely(ZBB)) {
 		unsigned long fold_temp;
 
 #ifdef CONFIG_32BIT
@@ -217,7 +217,7 @@ do_csum_no_alignment(const unsigned char *buff, int len)
 
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
 	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
-	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)) {
+	    riscv_has_extension_likely(ZBB)) {
 		unsigned long fold_temp;
 
 #ifdef CONFIG_32BIT
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index 807c0a0de182..68fa589d2d11 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -9,7 +9,7 @@ int ptep_set_access_flags(struct vm_area_struct *vma,
 			  unsigned long address, pte_t *ptep,
 			  pte_t entry, int dirty)
 {
-	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVVPTC)) {
+	if (riscv_has_extension_unlikely(SVVPTC)) {
 		if (!pte_same(ptep_get(ptep), entry)) {
 			__set_pte_at(vma->vm_mm, ptep, entry);
 			/* Here only not svadu is impacted */
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 8404530ec00f..f92b2428f0e8 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -9,7 +9,7 @@
 #include <asm/mmu_context.h>
 #include <asm/cpufeature.h>
 
-#define has_svinval()	riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
+#define has_svinval()	riscv_has_extension_unlikely(SVINVAL)
 
 static inline void local_sfence_inval_ir(void)
 {
diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
index 632ced07bca4..34d0d9c44dfc 100644
--- a/arch/riscv/net/bpf_jit.h
+++ b/arch/riscv/net/bpf_jit.h
@@ -15,7 +15,7 @@
 
 /* verify runtime detection extension status */
 #define rv_ext_enabled(ext) \
-	(IS_ENABLED(CONFIG_RISCV_ISA_##ext) && riscv_has_extension_likely(RISCV_ISA_EXT_##ext))
+	(IS_ENABLED(CONFIG_RISCV_ISA_##ext) && riscv_has_extension_likely(ext))
 
 static inline bool rvc_enabled(void)
 {
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 7dd282da67ce..25bbb64a22a8 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -1204,8 +1204,7 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
 		   riscv_cached_mimpid(0) == 0) {
 		riscv_pmu_irq_num = THEAD_C9XX_RV_IRQ_PMU;
 		riscv_pmu_use_irq = true;
-	} else if (riscv_has_vendor_extension_unlikely(ANDES_VENDOR_ID,
-						       RISCV_ISA_VENDOR_EXT_XANDESPMU) &&
+	} else if (riscv_has_vendor_extension_unlikely(ANDES_VENDOR_ID, XANDESPMU) &&
 		   IS_ENABLED(CONFIG_ANDES_CUSTOM_PMU)) {
 		riscv_pmu_irq_num = ANDES_SLI_CAUSE_BASE + ANDES_RV_IRQ_PMOVI;
 		riscv_pmu_use_irq = true;
diff --git a/lib/crc/riscv/crc-t10dif.h b/lib/crc/riscv/crc-t10dif.h
index cd6136cbfda1..749eb577dd32 100644
--- a/lib/crc/riscv/crc-t10dif.h
+++ b/lib/crc/riscv/crc-t10dif.h
@@ -12,7 +12,7 @@
 
 static inline u16 crc_t10dif_arch(u16 crc, const u8 *p, size_t len)
 {
-	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBC))
+	if (riscv_has_extension_likely(ZBC))
 		return crc16_msb_clmul(crc, p, len, &crc16_msb_0x8bb7_consts);
 	return crc_t10dif_generic(crc, p, len);
 }
diff --git a/lib/crc/riscv/crc32.h b/lib/crc/riscv/crc32.h
index 3ec6eee98afa..e2581cd6e179 100644
--- a/lib/crc/riscv/crc32.h
+++ b/lib/crc/riscv/crc32.h
@@ -12,7 +12,7 @@
 
 static inline u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
 {
-	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBC))
+	if (riscv_has_extension_likely(ZBC))
 		return crc32_lsb_clmul(crc, p, len,
 				       &crc32_lsb_0xedb88320_consts);
 	return crc32_le_base(crc, p, len);
@@ -20,7 +20,7 @@ static inline u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
 
 static inline u32 crc32_be_arch(u32 crc, const u8 *p, size_t len)
 {
-	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBC))
+	if (riscv_has_extension_likely(ZBC))
 		return crc32_msb_clmul(crc, p, len,
 				       &crc32_msb_0x04c11db7_consts);
 	return crc32_be_base(crc, p, len);
@@ -28,7 +28,7 @@ static inline u32 crc32_be_arch(u32 crc, const u8 *p, size_t len)
 
 static inline u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
 {
-	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBC))
+	if (riscv_has_extension_likely(ZBC))
 		return crc32_lsb_clmul(crc, p, len,
 				       &crc32_lsb_0x82f63b78_consts);
 	return crc32c_base(crc, p, len);
@@ -36,7 +36,7 @@ static inline u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
 
 static inline u32 crc32_optimizations_arch(void)
 {
-	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBC))
+	if (riscv_has_extension_likely(ZBC))
 		return CRC32_LE_OPTIMIZATION |
 		       CRC32_BE_OPTIMIZATION |
 		       CRC32C_OPTIMIZATION;
diff --git a/lib/crc/riscv/crc64.h b/lib/crc/riscv/crc64.h
index a1b7873fde57..86abacf2914e 100644
--- a/lib/crc/riscv/crc64.h
+++ b/lib/crc/riscv/crc64.h
@@ -12,7 +12,7 @@
 
 static inline u64 crc64_be_arch(u64 crc, const u8 *p, size_t len)
 {
-	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBC))
+	if (riscv_has_extension_likely(ZBC))
 		return crc64_msb_clmul(crc, p, len,
 				       &crc64_msb_0x42f0e1eba9ea3693_consts);
 	return crc64_be_generic(crc, p, len);
@@ -20,7 +20,7 @@ static inline u64 crc64_be_arch(u64 crc, const u8 *p, size_t len)
 
 static inline u64 crc64_nvme_arch(u64 crc, const u8 *p, size_t len)
 {
-	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBC))
+	if (riscv_has_extension_likely(ZBC))
 		return crc64_lsb_clmul(crc, p, len,
 				       &crc64_lsb_0x9a6c9329ac4bc9b5_consts);
 	return crc64_nvme_generic(crc, p, len);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
