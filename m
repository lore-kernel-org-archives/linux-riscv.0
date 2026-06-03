Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CC8CD5BD1
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 23:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ggt//7IgsGilitCBl8N3QmPUTtFZHOjEcqyAMhLPpAQ=; b=scAognPNPMxHAC
	m4J06F6zkeRcnkUw+5+9ilTrFklS20kPj1KjhEvl/Kx+GwT4f2ZflqSHgdTL49gVtSLJe51Xtlock
	YPY5wH3QxtSHwCvevMiDmNOpU6cjzF3LQHfOJlGEFouFlyHNolvv2JUncOq2sNPG6GUXkVQKZUSzv
	t+9kCFBec2OoiAHtg4nRdd8ZJ0mKv3SfnRHDdilQSWvnjQDFveggC3cNDteeMvzb9Fj2DI7rFzM++
	weSgJW44wFAah5prasYhD7rG7iXcYdcaKI/AYd9GMrktmgDHh0z52Tk5Ndwz0jGQhb4A9NeZkpUiW
	ICowLvwnUN+4afYgm9Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUYIu-0000000DvYk-1Fpi;
	Tue, 02 Jun 2026 23:13:48 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUYIq-0000000DvWN-1927
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 23:13:46 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2bf22d29dabso36421235ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jun 2026 16:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780442023; x=1781046823; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bw7Vrp5oUh2WDw5s8GOf1exSRNbvtmX+nqV+speIpOA=;
        b=mNdb9WBxUVBPz4MTnKWa9oT81ZLv8izZhhVK4xbv7DQn/Z9/BBWn7J7ghUtl2QptuD
         xbySnQrD9nnzMa4QuKGDE9gJBX6KMWDCnOlM10z7MvT/22aQ5vEA64lxpNdBf7z6icMy
         nAlSD5pL4w+8qgsBCFmRVCkVcestx59VnVTeIP5LceGXPr3RMxICHOqfRVaWvIQ31KSz
         ruF4u27DZzEgblCQXuHs8Lzwf4xga6NWqra50FaJEzZsQki+AqRvRRcNTGAmfQgbcDDG
         bctjA5SWa1Yoprf716CZTyrvFnC4cSszAPGfSVa5XVGxABfGmLA4A40WF+LZl9JwtZoD
         Y81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780442023; x=1781046823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bw7Vrp5oUh2WDw5s8GOf1exSRNbvtmX+nqV+speIpOA=;
        b=RNkgBussVfmXVGsLAgjwDAodXqfk9V+kbJsUHtsnNX9+u2Rd4tbpaVL7cyP8hedM+A
         VCg6sm3eOGSbIKcL4Sw5HUhm+4vvkCcpRa5CeYr4lU1J2OPMDPwAyOwcmIBepioRSfoW
         iSyoy3DJ84lrGaUcOXzg85daxTS3Pnhnvl8eyAcH08udzJ6KGCY1RTOoOrnE4hVQik7q
         fqaysSekpP+OrWONVt0T2NOnDM1maHWAjw84iCAFTdh9aE+M+sbT+Lj2fUvY54e7oUpP
         2jdAoROLo33PHFoxiwetNwb9eibI1bc2zfh3Msy4m/XE0XV1/tKqoQqntu2FRVSkiP68
         zCUA==
X-Forwarded-Encrypted: i=1; AFNElJ/BtRp7EFFJWIkh103TDVodugMPHCoLSFsRHvUjgIC9UjqjGdh7m80NL40FOM32nQUFesgjs+BTowwwHA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0MH5HY268ct1ej04ncdtNFWMS8MYebZXMpWzRyEbbpKdLQCDu
	mnWnwgsfuRebCFy5zNOjxaHAISNCr3KUFQWkjK7EPD5GmfZKLsXYoBol
X-Gm-Gg: Acq92OGPZcotT9VrrDOw4cXGq0kJVGObAiSK4bBkhtidIPZdBatksZX0ggPkojxkpdV
	FeuaFvOkAhBo2Q0Me/ACnDDlQD6mu9F+7yU4cJTN+nqiPuFNjmrP94g4hGGlc8QkrGbGEW9jzGm
	ptUKeJgvlJgBwBG2Xy1AT++rSaPKC5XaCh7ZygElg4jf4GYAMBvscpALjBX7/VVwtaGMb3yVqLm
	2hkIPmpgjrL1tdd+Zi51yPHp6mPZjyUhXRu7URt9hSaPnZnLkxpqDOa3HVKZbBtCKrHHsgwzQ5H
	CvvC6wCYvA9rA012nmHtcMbkcmBfhoQtlSilOGziBN4hOqhx2JCh77cYtocQhy42ORfSstbuN2G
	MThq/9PGPtAyjZPoPI43MsZn4gZvtEUJ+WIpwfO0HVC6JHKLpJ7vpRRLX8vmY/SRp1NjyYwJYUr
	A3RW8q0hdFkQ==
X-Received: by 2002:a17:903:3887:b0:2bd:9061:d544 with SMTP id d9443c01a7336-2c1644b829bmr7231515ad.34.1780442023354;
        Tue, 02 Jun 2026 16:13:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649d2dfsm3302965ad.75.2026.06.02.16.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 16:13:43 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 03 Jun 2026 07:12:00 -0400
Subject: [PATCH v3 05/15] riscv: Add Ziccamoa, Ziccif, Ziccrse, and Za64rs
 to cpufeature and hwprobe
MIME-Version: 1.0
Message-Id: <20260603-rva23u64-hwprobe-v2-v3-5-5529a7b28384@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7482; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=Na9bFIsZ8mb2+W6E0yz8lnHt52zKy2GggwDCAN9B4OQ=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiwFHpYDV7Q6rjApZxi8aVcwzHh95MBPLnYlnt93QgOXp
 WtMsZDvKGVhEONikBVTZDl8tCV76yufaN/nnD9g5rAygQxh4OIUgImEP2P4X/zhZfPf0vRNZdNi
 NlhETbs/v81O8P3vyORlSvk1ypuWMzIyXF/BlOCX3rBne7EIv/+WULmlqV/XLtySJXhuzmKphqV
 LmQE=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_161344_329459_5486B153 
X-CRM114-Status: GOOD (  17.04  )
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

Add Ziccamoa, Ziccif, and Za64rs to riscv_isa_ext[] so they can be
parsed from devicetree/ACPI ISA strings. Ziccrse is already present
in cpufeature; this patch only adds its hwprobe exposure.

Expose all four extensions via hwprobe through new bits in
RISCV_HWPROBE_KEY_IMA_EXT_1 (RISCV_HWPROBE_EXT_ZICCAMOA, _ZICCIF,
_ZICCRSE, _ZA64RS), so userspace can probe each of these
RVA23U64-mandatory extensions individually.

Rationale for the validation dependencies added for Ziccamoa and Za64rs:

1) Ziccamoa depends on Zaamo.  The RVA23 profile prose was updated
post-ratification to spell out the Zaamo reference: commit
2b218613752d in riscv/riscv-profiles ("Improve description of
Ziccamoa (#224)") reworded the rva23-profile.adoc (and other profiles
that include Ziccamoa) text from "must support all atomics in A" to
"must support all atomics in the Zaamo extension" [1].

2) Za64rs depends on Zalrsc. The unprivileged ISA manual src/zars.adoc,
integrated in commit ebe06adc22cd ("Integrate profiles as Volume III
(#2771)"), defines Za64rs as: "The Za64rs extension requires that the
reservation sets used by the instructions in the Zalrsc extension be
contiguous, naturally aligned, and at most 64 bytes in size" [2].

Link: https://github.com/riscv/riscv-profiles/commit/2b218613752d63287286b5ae801b820cbd8cc10c [1]
Link: https://github.com/riscv/riscv-isa-manual/blob/main/src/unpriv/zars.adoc [2]
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v3: Indent the added hwprobe.rst entries to match the normalized style; no other change.
v2:
- Rebased to v7.1-rc2.
- Reworded subject and expanded commit message.
- Validation added for Ziccamoa depending on Zaamo and Za64rs depending
  on Zalrsc.
---
 Documentation/arch/riscv/hwprobe.rst  | 16 ++++++++++++++++
 arch/riscv/include/asm/hwcap.h        |  3 +++
 arch/riscv/include/uapi/asm/hwprobe.h |  4 ++++
 arch/riscv/kernel/cpufeature.c        | 21 +++++++++++++++++++++
 arch/riscv/kernel/sys_hwprobe.c       |  4 ++++
 5 files changed, 48 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index fa2810bfc1477..b1b2d8803e5c2 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -405,3 +405,19 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZICCLSM`: The Zicclsm extension is supported,
     as defined in the RISC-V Profiles specification starting from commit
     b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCAMOA`: The Ziccamoa extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCIF`: The Ziccif extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCRSE`: The Ziccrse extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZA64RS`: The Za64rs extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e8f4a7dd96a93..0acb7a01ecc0f 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -113,6 +113,9 @@
 #define RISCV_ISA_EXT_ZICFILP		104
 #define RISCV_ISA_EXT_ZICFISS		105
 #define RISCV_ISA_EXT_ZICCLSM		106
+#define RISCV_ISA_EXT_ZICCAMOA		107
+#define RISCV_ISA_EXT_ZICCIF		108
+#define RISCV_ISA_EXT_ZA64RS		109
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 6819df159c51e..58d1e86e47ae7 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -117,6 +117,10 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_IMA_EXT_1		16
 #define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 0)
 #define		RISCV_HWPROBE_EXT_ZICCLSM	(1ULL << 1)
+#define		RISCV_HWPROBE_EXT_ZICCAMOA	(1ULL << 2)
+#define		RISCV_HWPROBE_EXT_ZICCIF	(1ULL << 3)
+#define		RISCV_HWPROBE_EXT_ZICCRSE	(1ULL << 4)
+#define		RISCV_HWPROBE_EXT_ZA64RS	(1ULL << 5)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1fb595581adcf..b9538e69fa1b3 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -90,6 +90,24 @@ static int riscv_ext_f_depends(const struct riscv_isa_ext_data *data,
 	return -EPROBE_DEFER;
 }
 
+static int riscv_ext_zaamo_depends(const struct riscv_isa_ext_data *data,
+				   const unsigned long *isa_bitmap)
+{
+	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZAAMO))
+		return 0;
+
+	return -EPROBE_DEFER;
+}
+
+static int riscv_ext_zalrsc_depends(const struct riscv_isa_ext_data *data,
+				    const unsigned long *isa_bitmap)
+{
+	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZALRSC))
+		return 0;
+
+	return -EPROBE_DEFER;
+}
+
 static int riscv_ext_zicbom_validate(const struct riscv_isa_ext_data *data,
 				     const unsigned long *isa_bitmap)
 {
@@ -502,6 +520,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
+	__RISCV_ISA_EXT_DATA_VALIDATE(ziccamoa, RISCV_ISA_EXT_ZICCAMOA, riscv_ext_zaamo_depends),
+	__RISCV_ISA_EXT_DATA(ziccif, RISCV_ISA_EXT_ZICCIF),
 	__RISCV_ISA_EXT_DATA(zicclsm, RISCV_ISA_EXT_ZICCLSM),
 	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfilp, RISCV_ISA_EXT_ZICFILP, riscv_xlinuxenvcfg_exts,
@@ -516,6 +536,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
 	__RISCV_ISA_EXT_DATA(zimop, RISCV_ISA_EXT_ZIMOP),
+	__RISCV_ISA_EXT_DATA_VALIDATE(za64rs, RISCV_ISA_EXT_ZA64RS, riscv_ext_zalrsc_depends),
 	__RISCV_ISA_EXT_DATA(zaamo, RISCV_ISA_EXT_ZAAMO),
 	__RISCV_ISA_EXT_DATA(zabha, RISCV_ISA_EXT_ZABHA),
 	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 9cf62266f1890..b15ac9adf7920 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -206,6 +206,10 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		 */
 		EXT_KEY(isainfo->isa, ZICFISS, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICCLSM, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICCAMOA, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICCIF, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICCRSE, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZA64RS, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
