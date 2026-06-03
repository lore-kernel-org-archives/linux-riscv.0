Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FBCCD6E5D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 23:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gGy1Fubg/hl7yBiZGqsnWS2ieuqu3Ixm0Fc3nW0GO/8=; b=Sqe+Gcd2jahCJC
	BsG7E5ahWYZIpBGAAXhRcqSe53Acs/gTxcSUTisD0S5NTDwe0kGsbkj1DiPC/H7UYHLiucCvRhMk1
	ZXfXRfghzT23KQFOaXqa9f9u1O0RYXdF9FWx5mX3nDyiNW/br8W7b441ZWWwjlzVVIXlHIhie7wX+
	6kfdlN+4PP6kpPUyFq9X07K1S+LJysrJhyWSBI5YTDydjkKDf9BuQPrCPBByVGlit0jQfLJTubOOu
	yAf/67Mz/3LSoRkiYrv5DZ4gu3ap9mcZ1dy0No6/m//Ml8MZED9MOy2XIBPXk0JCXIty1dICuvSKh
	mvtwrhhOU7gO5kydI0Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUYJ3-0000000DvdY-1wcx;
	Tue, 02 Jun 2026 23:13:57 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUYJ0-0000000DvbF-3G2U
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 23:13:56 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2c0c2d792c8so20158765ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jun 2026 16:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780442034; x=1781046834; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rhj+nvBHQ+CacSRsmI/cyKsZedwbZNdref0NZfEXqHA=;
        b=kSSyRPM/LRl4G1YVzCkeBBxKyKU0/eWXeLpEWxNp/wnK6ng1VSEAm7edMpdP+RgmaC
         4gq9ZWcN55+41h1+sH77wddjvRVEd/W4yrVU5xJOp412mA1PZK8mcP5sOW2FmT0j3RVK
         lRAu9Tc4ozKOEXvHiprgzHUjU/XaazAuN4+xLi7VhlER1KrjD34nEHnqqVZfcgRT+dR8
         87X/l2pM0+2IQ0cO2iJ/ECf0/llsQ+WSknXzDQywcdS6rSzTVUWVlVQhw7GAlIftg8tX
         0ugXxX92TdL0qh/gBn2mO2SAXDtBFeyR1MtFYhJ85LLiZHMOCSSu4Cs88I5+UURSFCHt
         DSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780442034; x=1781046834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rhj+nvBHQ+CacSRsmI/cyKsZedwbZNdref0NZfEXqHA=;
        b=fPnKpEv5dtsRqJrdRK0obdgVxJOKaedwQHcuyoMmu1VGskVMYKP1jHFMuDzcZEz/0A
         +tCB4bw4xEJ6dMnLWk+tdo+W6eJKq06+gee5icjhnMDhZ5Hv66xJ7JyI4+OP+oWHJSzs
         mJ8bLfvjTmML/0dNiCEiHbty1ZWfKH9E+rU8P7gKiWkI7cjGt8xFV6LrYWdH9KMTp64X
         VHLm+C09/kaOMv9ZooEIWwtfnA2qAzw9scEj3/ROd4oQh2ZXLwFd5bpeK1tqi1iipl5c
         5XLI1io6EKl9nNg9/QlMmNQ+ne3peFAG7G+5OmKF4w6b06lllb0uPbRqKOUgbyuZelG9
         Ljgg==
X-Forwarded-Encrypted: i=1; AFNElJ8nHHC1IY36EWKxe20ezF5CId5c/uCuU0ereiNjXiqRjH/NnMVpU7PSKXspamVa0cYxgY4tQfA9HmcW+g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+eiwLRAFvzAps50djMAQIG1bNOEM4jgXnuwQ0h3T73lWTmNC6
	bDaOKUfXmAcUwrP5bn7Wus1G8IcUYxteWMcO+ACi7U5GPN4xeM9j2b7lXl8IIebDFUPzEg==
X-Gm-Gg: Acq92OHAVTGx7Dg+qNiV+4TSKdfEfwNRRVxfs6nEOm1eqw8NKuQfNSm2cz1jat9BjHk
	9eurjAcY4tLLB7TXvoOyFmlTB8JUXxqXwHTZV8JrKmxHqWr3210ESZMkSzLPENsNjCO0SUbenNu
	RBAc2JW5Xvw1+W0PxAP+HkJQo9m1zaa/c9jf64PwqsxvOcHR25NcXCQK1TzWoFGcslaTtHE7OsX
	5DOTuHBvdfVXeAlWesjREc3x1HCh2QDwKFv7fJJe1CMcDAYsrzhAQM4DE3F6bt46hr5cMo6RF83
	Lfjhe/td5k66bbxru5yTAzwdcv/CT8pfaolm2sPdgv9YW4rDcZk0OD4NVd8FCe+SztsuYV6D5f+
	V5j5wqc2jDAAsdz9/+U8mIMOI1QPBdBx9sKftuAJVGsypOLIjVj5z6+Gagd/odqu8yEPON5MMQv
	7hb/hPx5WnKOA11NUR1Bdu
X-Received: by 2002:a17:903:3808:b0:2bf:26d:3f42 with SMTP id d9443c01a7336-2c163a43429mr7020065ad.18.1780442033831;
        Tue, 02 Jun 2026 16:13:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649d2dfsm3302965ad.75.2026.06.02.16.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 16:13:53 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 03 Jun 2026 07:12:01 -0400
Subject: [PATCH v3 06/15] riscv: Add B to hwcap and hwprobe
MIME-Version: 1.0
Message-Id: <20260603-rva23u64-hwprobe-v2-v3-6-5529a7b28384@gmail.com>
References: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
In-Reply-To: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Shuah Khan <shuah@kernel.org>, 
 Christian Brauner <brauner@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charles Jenkins <thecharlesjenkins@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5356; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=NxvCb+UtcmfgO40y2Ax6jmE3kx7ULzNHJSgIED+/XZU=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiwFHhZ+FavHaUpXTARZTOadzV9/W3xZ/Nt0/87vsRM6k
 yqW6zB3lLIwiHExyIopshw+2pK99ZVPtO9zzh8wc1iZQIYwcHEKwETmLWD4X+B+vt4scxnbmZVf
 7BKi501N/dJbyRLZtc3qVURaf9S76Qx/pdacVp2tks223PJ3BPtptiN9Vj++MCvsmRnKvfPYzeP
 V/AA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_161354_814066_D4BDD7BB 
X-CRM114-Status: GOOD (  16.88  )
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

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

Add B to hwcap and ensure when B is present that Zba, Zbb, and Zbs
are all set. Also expose B via hwprobe (RISCV_HWPROBE_EXT_B in
RISCV_HWPROBE_KEY_IMA_EXT_1) so that userspace can probe B directly,
mirroring the F/D/C/V pattern where each is reported via both hwcap
and hwprobe.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
[Add B to hwprobe]
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v3:
- Indent the added hwprobe.rst entry to match the normalized style.
- Rebased onto v7.1-rc6: index isa2hwcap[] via RISCV_ISA_EXT_B to match the
  macro-ization in commit 41337097f2823.
v2:
- Rebased to v7.1-rc2
- Add B to hwprobe (RISCV_HWPROBE_EXT_B at IMA_EXT_1 bit 6) and
  document it in hwprobe.rst, so userspace can probe B directly.
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/asm/hwcap.h        | 1 +
 arch/riscv/include/uapi/asm/hwcap.h   | 1 +
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/cpufeature.c        | 8 ++++++++
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 6 files changed, 16 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index b1b2d8803e5c2..002d5046ab689 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -421,3 +421,7 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZA64RS`: The Za64rs extension is supported,
     as defined in the RISC-V Profiles specification starting from commit
     b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_B`: The B extension is supported, as defined
+    in version 1.0 of the Bit-Manipulation ISA extensions, and implies the
+    presence of the Zba, Zbb, and Zbs sub-extensions.
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 0acb7a01ecc0f..58523b3a1998a 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -11,6 +11,7 @@
 #include <uapi/asm/hwcap.h>
 
 #define RISCV_ISA_EXT_A		('a' - 'a')
+#define RISCV_ISA_EXT_B		('b' - 'a')
 #define RISCV_ISA_EXT_C		('c' - 'a')
 #define RISCV_ISA_EXT_D		('d' - 'a')
 #define RISCV_ISA_EXT_F		('f' - 'a')
diff --git a/arch/riscv/include/uapi/asm/hwcap.h b/arch/riscv/include/uapi/asm/hwcap.h
index c52bb7bbbabe9..96b7cf854e090 100644
--- a/arch/riscv/include/uapi/asm/hwcap.h
+++ b/arch/riscv/include/uapi/asm/hwcap.h
@@ -21,6 +21,7 @@
 #define COMPAT_HWCAP_ISA_F	(1 << ('F' - 'A'))
 #define COMPAT_HWCAP_ISA_D	(1 << ('D' - 'A'))
 #define COMPAT_HWCAP_ISA_C	(1 << ('C' - 'A'))
+#define COMPAT_HWCAP_ISA_B	(1 << ('B' - 'A'))
 #define COMPAT_HWCAP_ISA_V	(1 << ('V' - 'A'))
 
 #endif /* _UAPI_ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 58d1e86e47ae7..430dc49a82863 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -121,6 +121,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICCIF	(1ULL << 3)
 #define		RISCV_HWPROBE_EXT_ZICCRSE	(1ULL << 4)
 #define		RISCV_HWPROBE_EXT_ZA64RS	(1ULL << 5)
+#define		RISCV_HWPROBE_EXT_B		(1ULL << 6)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index b9538e69fa1b3..e0197160af6dd 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -468,6 +468,12 @@ static const unsigned int riscv_c_exts[] = {
 	RISCV_ISA_EXT_ZCD,
 };
 
+static const unsigned int riscv_b_exts[] = {
+	RISCV_ISA_EXT_ZBA,
+	RISCV_ISA_EXT_ZBB,
+	RISCV_ISA_EXT_ZBS,
+};
+
 /*
  * The canonical order of ISA extension names in the ISA string is defined in
  * chapter 27 of the unprivileged specification.
@@ -515,6 +521,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_D, riscv_ext_d_validate),
 	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_Q),
 	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_C, riscv_c_exts),
+	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_B, riscv_b_exts),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts, riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
@@ -1133,6 +1140,7 @@ void __init riscv_fill_hwcap(void)
 	isa2hwcap[RISCV_ISA_EXT_F] = COMPAT_HWCAP_ISA_F;
 	isa2hwcap[RISCV_ISA_EXT_D] = COMPAT_HWCAP_ISA_D;
 	isa2hwcap[RISCV_ISA_EXT_C] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap[RISCV_ISA_EXT_B] = COMPAT_HWCAP_ISA_B;
 	isa2hwcap[RISCV_ISA_EXT_V] = COMPAT_HWCAP_ISA_V;
 
 	if (!acpi_disabled) {
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index b15ac9adf7920..dcc102bf8f183 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -210,6 +210,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		EXT_KEY(isainfo->isa, ZICCIF, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICCRSE, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZA64RS, pair->value, missing);
+		EXT_KEY(isainfo->isa, B, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
