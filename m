Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E56D13597
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 07:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yV4MNyYg9uTD+YypQEcPUCP/6zkzQxoFf7rhSlJ31/k=; b=B4lhHTfP+V3hZD
	6nbyURqRkAoWslJpvGTn5v0wx+YXYBJrCTEJcNt2fuVnUPtEcui7VNJdCu9jhVZnos52m11BH4HYT
	V6H8YOzH7dSltnU2iQTZz9f2iElB7HzuxaTwJWrBv1MUXVwLpCgoU/HdumU+MmQEks1yXrOjngTAR
	/hlEIK5NTPqobRS5iglzdhi34lD4lvn1TIXEz1+Khvvt/kH6RAFNV3C4nOB/Xl1Hovk+Bh513DRmE
	mpOYlGkCQj4OCNM/n2w9e9RVtmIUxwkmfJFzdm5ZptfePgJ3B12cwlw/LEv7DCBUSguGYB81wud6i
	iKI206X7LH3UaIYVnQ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5K1o-00000009qH0-0MsL;
	Mon, 28 Oct 2024 07:19:04 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5K14-00000009ppT-0LV3
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 07:18:19 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7ea68af2f62so3139089a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 28 Oct 2024 00:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730099897; x=1730704697; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1uizG+AQKjMiNSyY0/c5FnD4O0HivvPLaMjzCzg5Rho=;
        b=WH7gwaN3BYrWJy7NdUvuRreAvHSyoNYcDScqnZbpy0cKdynbiHGkGI04vWq+tcT7cM
         Hm8naosNQheCiRS/1qIwup5lkNJGMGoVx+jpl+n4WwlrJucKQ9lTjPDG3Qgcj8HKVN5G
         K207JDJR7nZFkuCbccHBZH9vlzejg7/jqTkKOSb61L+vtg5m/r4dM7Ta5Tn2ewtoWUsc
         EcvIiHhtHf6pCQMrtdSGkTjEpf+mk28Al594q2UOTWSSjRbIYyw2w28g1in6ogBLw1As
         7fNhQFQa3EuiVPCFMwRCO7VIsTN0znPqZ1qqv/+oqf/gI352xb7juIAQmV6xmmuPFqSX
         3NHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730099897; x=1730704697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1uizG+AQKjMiNSyY0/c5FnD4O0HivvPLaMjzCzg5Rho=;
        b=jh6ZX958WjfS5y/Gidxg0vMOwPX4nUsjuB+XwPPFAR6nD6pimVN63nezKyXRyvqXDL
         PTjQMCibK5eG0e6Zn5HiXtoH5urNHf0kNEhJ0m+T18R0OPKl3QHev5UdhTKSdtSVuSEu
         GqhSNHP8bT2scWIdb+9ObhIK/bBR442GwokonfnwO02Qa9WMMG8egzBGXtP67ALPN7pV
         pktwc8mp4Z95Zra76+4JdXHpbWptJZ8j9nZZxzVNgNJBE5vtlUW63jzozXNB97VEhsIA
         VcmyKMBw6qtDGbeGXmZweBHdisH0XoApsZlHS5ef/jFo5rJlvviZJAnJ2T/wuuV5i/JR
         z01Q==
X-Forwarded-Encrypted: i=1; AJvYcCVGV4bBtrLZ9s5UUYsOMqjktvYhYvpARoyydlEI6+OnemlGxdP4nc1YvIOT8KnwGyu96iQI3nCjh6FxYw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywxu6/jqv2wATuOFdyYIu+wqkHQR2JdmhTFirLV5fu81DiFF3JC
	JRhkhySref+AB2ZOAD01gNNsiN4Xv8P/33MGNMjC//PvtuY4thk9
X-Google-Smtp-Source: AGHT+IHNfSRs9MLweGhcUMEkHy9O8xX5ZL+PQe11n4eSXAbVgAxJpcl9qI0OLy2nv3XOv1wiXZAMEA==
X-Received: by 2002:a05:6a20:d807:b0:1d4:fc75:8d48 with SMTP id adf61e73a8af0-1d9a83ab0bemr8870713637.3.1730099896702;
        Mon, 28 Oct 2024 00:18:16 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205793189esm5056118b3a.58.2024.10.28.00.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 00:18:16 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Chiu <andybnac@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/3] riscv: add ISA extension parsing for bfloat16 ISA extension
Date: Mon, 28 Oct 2024 15:17:42 +0800
Message-ID: <20241028071746.869740-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028071746.869740-1-inochiama@gmail.com>
References: <20241028071746.869740-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_001818_141114_1CCF3EAF 
X-CRM114-Status: GOOD (  10.07  )
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

Add parsing for Zfbmin, Zvfbfmin, Zvfbfwma ISA extension which
were ratified in 4dc23d62 ("Added Chapter title to BF16") of
the riscv-isa-manual.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/include/asm/hwcap.h | 3 +++
 arch/riscv/kernel/cpufeature.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 46d9de54179e..97657fb63af6 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -93,6 +93,9 @@
 #define RISCV_ISA_EXT_ZCMOP		84
 #define RISCV_ISA_EXT_ZAWRS		85
 #define RISCV_ISA_EXT_SVVPTC		86
+#define RISCV_ISA_EXT_ZFBFMIN		87
+#define RISCV_ISA_EXT_ZVFBFMIN		88
+#define RISCV_ISA_EXT_ZVFBFWMA		89
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3a8eeaa9310c..1b286f5bc591 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -325,6 +325,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
 	__RISCV_ISA_EXT_DATA(zawrs, RISCV_ISA_EXT_ZAWRS),
 	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
+	__RISCV_ISA_EXT_DATA(zfbfmin, RISCV_ISA_EXT_ZFBFMIN),
 	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
 	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
 	__RISCV_ISA_EXT_DATA(zca, RISCV_ISA_EXT_ZCA),
@@ -357,6 +358,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET(zve64d, RISCV_ISA_EXT_ZVE64D, riscv_zve64d_exts),
 	__RISCV_ISA_EXT_SUPERSET(zve64f, RISCV_ISA_EXT_ZVE64F, riscv_zve64f_exts),
 	__RISCV_ISA_EXT_SUPERSET(zve64x, RISCV_ISA_EXT_ZVE64X, riscv_zve64x_exts),
+	__RISCV_ISA_EXT_DATA(zvfbfmin, RISCV_ISA_EXT_ZVFBFMIN),
+	__RISCV_ISA_EXT_DATA(zvfbfwma, RISCV_ISA_EXT_ZVFBFWMA),
 	__RISCV_ISA_EXT_DATA(zvfh, RISCV_ISA_EXT_ZVFH),
 	__RISCV_ISA_EXT_DATA(zvfhmin, RISCV_ISA_EXT_ZVFHMIN),
 	__RISCV_ISA_EXT_DATA(zvkb, RISCV_ISA_EXT_ZVKB),
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
