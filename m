Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A760DC43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 12:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ybsflnJfzgjUU8Kgoo08RF1GW2fVh3X5G+76SRwOYx4=; b=pdW98RGBltRD2v
	cs+tlH3kcutI2K2/SkSivicT76It93tG5k4UeOV5H9vgxOQWYqoInwZQDiHQmd6WJmSbsC/m/P4j7
	v7r3kbIXiEwdoSmRTVSIf0qi+tpDcst4uuo1/Q+Nwb2ka8iG2n+61xZnYzlCoT7pMis8OMeLU7b2Y
	dom0HU2PBa0mq8oRY5VRNYWJcmF8rfhRQKzypw8Y4HJ5p5XB8hmiQQTewKW0IpNBrK5Mzy6xWQ315
	eAW7VQPKSdXcQAqtsLJBsYTAisymj3dx3WgJ/RvqzIK/3xPMda1zZBgbY4brtb34FhodjqLkNyng6
	P2NH8g9saqcSQSJqEhoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuRt-000000023q2-2bHc;
	Wed, 01 Jul 2026 12:53:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuRs-000000023on-0ust
	for linux-riscv@bombadil.infradead.org;
	Wed, 01 Jul 2026 12:53:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=8rhFree8++pTI9ZAZ54v8+CwrfYiao4iARzoIIc8yLM=; b=LbiZSf9EpCtfbvgbebmhVHHcXe
	ZAMFOn+FpXuJkcxF3lE8WMSJzeZjgL/a/+9cU/uHuDF72WVVxK95x55+XPFjKR37UJ56M3hncYy+X
	0GyKX7Y0hQqX3Z3DxizZ5youEbJl/9zpHaiAXH55XCUH1y0E2KLE9jbR2WgueXRNNVZypAmMDc1Ha
	8OUWWJmX5HwzPPrfytq1LgkOf58CtAcLRz6O38hDPGXazFDpNLm7RwP7SSHwdmT8BVsgQjC/t1siC
	sLVx74yvsK9wfVnx1sjBPzrwPZdfzBvKWEwjpd1MGZd4csZ2KOE7NCReOzSADvpc/YnQC8W9cqEYc
	Sj4ZOGsQ==;
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weuRp-00000002mYj-0ysN
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 12:53:51 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so180775a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2026 05:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910427; x=1783515227; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8rhFree8++pTI9ZAZ54v8+CwrfYiao4iARzoIIc8yLM=;
        b=XxcWiH1wQdUnNTCa5oVOc2ES/ZPkbC9vASBLJvSdxf9AqnQYZ0EBvTd/r1nCqeAjIc
         ucZlZpE+gjfQf4YZFT5x82AxQcvxhIAZusEBIDsa0OqJpopfBNb2JSjnXAIuaw2dHaiW
         l6HQVm3pR2kvP9bpBTLI7HoA344Xfl17RM8wqR2HP1HiYNzSe8vr+g9IMX8iKql1y0za
         ZmOqUSKhz+pOKsFu3TtcrRxGuH9+bQNFNDR/xRT0xAzksl0rbEe5pB8vPhySkUuAjzwH
         6QGNKFggKlhm/PcPY7oSqDBgkKoo2YGZ+abFGY7vu9CqBXVKDN/rtF0YUlgDX2cyHbME
         6VAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910427; x=1783515227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8rhFree8++pTI9ZAZ54v8+CwrfYiao4iARzoIIc8yLM=;
        b=R2haK/jkiHv2Bw9qQ6spo/CCCkyNkNB3hZpU2Gd7tnrmFpnqT6GSN/I5iNXCK99sqb
         Ifjig34Qyuq3dHzuH5leRiq6goqnUmw/ktvUOySRSs4TT/E14ayeSObDrBs9nFIv4ESE
         a1DOfYAmXntfqZD+3LWeSjJPUvfXz+xJ6dJOpkNX51ic5cd+2R1CGCbBFiE92q6saRoL
         7M3jwr49IKYCXeUnPNCehFM7L6HTx23ArDZ9GuVTlLMyCBagSxrID/+h7Nxb4gWIdNQ8
         8armuNopA8GYASGPocE7w0M6Aa5EQ1YbPDVsm9hzOIcJlkql6bClA5yYXNz+8vAzI+Vc
         6DeA==
X-Forwarded-Encrypted: i=1; AHgh+RpEfrhzKTzdRl8+DJho1p4oY8HVmznY0DsuBjtDRiQjObA4UaAESCWGcdz7JlMBb7Hsotr+7QKgRYVCpg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw41wvQJ/xhAcx1RsTMQr3l7RYCO4WY4bYMUvZ2k6O+wM/qOSdb
	tBQoK6RKl5h6sOsnQkgBquoLTmHz1F4q/7AzTuOlJfwaQNmeF49SnH21
X-Gm-Gg: AfdE7cmqFLxHfX4Y45N74bjQKlzm+PibtWzKr0wxzalgc11ga0gfM7GZ50BCDyq2lQ3
	QxUfW5+WtGDKz5AVmsp2clJwCY9YIc023O1ZAbtElMwD1WrP7Y7HeodW2VpJPtECP5C63LEHDAx
	zsDKTrtro6Ty4XPveaW1qD1GcOw8CCVBfLLPIGqkMMYhV+denTvbDB3xJ7yj9QsO4GipprEtlUd
	nD7/v3n5P0ofI/JdhcdlVCBZ6w7zlwc2SqTN0asvfWbrgjUjgcSPiTiq7JT1AagZ3aIMDUZKmTQ
	T6VcmY372caNxq2ryhLVXZHzqhn5emsFryIuTM4t6IzN8JWq9ldQTl+QaNMagRoG+FobYqwRR3j
	JtX3yUXrZd7lZ5dRxxMSTp0Iqs4NlC6S3rBQCBznQBZrUO+YqGwzl+IgjpHvK4AIXH8IX4aP+l2
	wQc7RWGkHYLyvxzs7Ih2he
X-Received: by 2002:a05:6a00:21d2:b0:847:88eb:1e08 with SMTP id d2e1a72fcca58-847c090a2d8mr1295877b3a.53.1782910426858;
        Wed, 01 Jul 2026 05:53:46 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:53:46 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 01 Jul 2026 08:52:20 -0400
Subject: [PATCH v5 07/17] riscv: Add B to hwcap and hwprobe
MIME-Version: 1.0
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-7-2c61f94a695a@gmail.com>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Chen Wang <chen.wang@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Jesse Taube <jtaubepe@redhat.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Guodong Xu <docular.xu@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5474; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=lcHI3FDXvXfc0zgjs6SBtBX/h2NdWeA6Wcv2wvsihEs=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3hYlN6mrp50XX35xyUVU8VL9ccbMg0/sN++t23PIt
 eJ13y3+jlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZjITD1Ghq5TRQs3fzx3YJPs
 256HwYJOn15rLAoWPbz1X/8yvmXTTuUy/GLOmvowq27Zb8uOzE7OoxP0lonorH0ocG/L6W4z0/a
 pzzkB
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_135349_570215_268E61A4 
X-CRM114-Status: GOOD (  16.99  )
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

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
[Add B to hwprobe]
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v5: Collected Reviewed-by from Conor Dooley.
v4: No change.
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
index 893e1a1215d23..fc68dea397aae 100644
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
index d76ce21d4a18a..9eee53b264de1 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -450,6 +450,12 @@ static const unsigned int riscv_c_exts[] = {
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
@@ -497,6 +503,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_D, riscv_ext_d_validate),
 	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_Q),
 	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_C, riscv_c_exts),
+	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_B, riscv_b_exts),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts, riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
@@ -1115,6 +1122,7 @@ void __init riscv_fill_hwcap(void)
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
