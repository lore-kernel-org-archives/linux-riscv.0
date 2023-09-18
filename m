Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC6FC46CA1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 13:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dRtz8YK9rcWmGqQN8w4UMCDjiKmBTApskO/2/7AfgJE=; b=Cu+B3CSGmc7W6Q
	/5wd3aScCGJP/zSXLcNbz9qiCEDpH2JIV4jXPsAxx1i4o461+aE5oD7Nolu8UfsGl+R1wS0Vy5HcA
	EBSbsaDFz5W9wPhBiiP7ZJqbmkIOtargxnldI1zrxyfkLx/qmWvCI0iS3pZdf7R5aR0VafN5NoXO6
	e1OFtdfa1gcbJVY2ab8ZnDMgJWCEAbGF8hvn3ZLjQTcmGSdJPeSrOyRgahrmylDzdh9nJqZxZFyW5
	zeChl6pxynVzKhYOfjtxyeKZ9hW080XJijqR80+seWMV8KhNR1NzH/tdWaA/JrZsTWWqCJO2nUcAF
	LyfEQP5uL5pPfEURAh+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiE66-00FVlY-0J;
	Mon, 18 Sep 2023 13:15:30 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiE61-00FVj5-2L
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 13:15:27 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2bf5bf33bcdso75811171fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 06:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695042923; x=1695647723; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTiZ9hMTKh0ItREWlKdtTv/LCx2NEpn9SM1Hm5dmra8=;
        b=VV1/ZUOCJcIhTancoWhCNKzvaVEB3NLqOG95JbnCrwxcebFf+nDeZs84kXR3LPCkyl
         E6PhQ9c9xOe1tJfjSBObZMIjiuLXUeCFFced+wEn7dcx+i9P75Oln2UFqw2YufKgtUFr
         H+x/qvvL4hAixYY90Qru8H2jm99m+RPZJOPr/qpYa/J7cJ410i7Lzj+134j/ONI5AQg4
         YtNOt4NkcO1XMtEu5fbHuMxF98wHK6U9rJ2msLFfeT8aMbMWNPXpS3q8v2+naekTIgaE
         ZPGwXmVGzeiqF7kZ9pX4fM8KY0mR2MKBojHnBOz3M0YEXBkWDgX/d62xzL/UPx2XKP/V
         7D5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695042923; x=1695647723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTiZ9hMTKh0ItREWlKdtTv/LCx2NEpn9SM1Hm5dmra8=;
        b=X3wOK5QteWppH9eE6Pu49aiqQYRC/0kvq8t9DAHz0QvPkjw5fu6DBMyfKequHv8qx1
         TD52zTzG+zmgBeB6/CFnUx4VsS9kEchRtJ/Mrx7ACaoRHt1gZV2ZaHaRP7HDGpZS6T3x
         wjFylPK+BWfIuxI7qWcUOFM+62UyB6bLmb3X8Belch28hbWGEhhbAocinfknq32yqqyt
         nGkOrE+zZ7f2u6tGECDDSauawM9uC7sQJj9vjAYOklt5/se9YGz0EOOjlJhLrzzDWfX6
         t6DoBzpDX1Ya0Hzs9ZI425RGimVe/fQoiLTSDaT72xeMHRWBnQWx200YN9nh2cPI4Pu8
         PBOg==
X-Gm-Message-State: AOJu0Yx7XiFO4wXVfphGWa4m8aRWnPinzegBtVuRmfU8YAIklqSW7vfh
	JfdywXd5ZPiQoXGcpLBjy1UgGP4S7Dd3gjdmyEw=
X-Google-Smtp-Source: AGHT+IHGBp/5kZVH3trmy9p0QvhmLnPEiPOvSqQsGcaO5LLtm5af9j9jvLoaZkXQzaoAmnDgzpQ3zw==
X-Received: by 2002:a2e:8215:0:b0:2bc:e2bc:81ff with SMTP id w21-20020a2e8215000000b002bce2bc81ffmr7448960ljg.51.1695042923763;
        Mon, 18 Sep 2023 06:15:23 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id lg13-20020a170906f88d00b009828e26e519sm6389702ejb.122.2023.09.18.06.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 06:15:23 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com,
	xiao.w.wang@intel.com
Subject: [PATCH v4 3/6] RISC-V: hwprobe: Expose Zicboz extension and its block size
Date: Mon, 18 Sep 2023 15:15:22 +0200
Message-ID: <20230918131518.56803-11-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918131518.56803-8-ajones@ventanamicro.com>
References: <20230918131518.56803-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_061525_762888_3F570B07 
X-CRM114-Status: GOOD (  17.61  )
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

Expose Zicboz through hwprobe and also provide a key to extract its
respective block size. Opportunistically add a macro and apply it to
current extensions in order to avoid duplicating code.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/riscv/hwprobe.rst       |  6 ++++
 arch/riscv/include/asm/hwprobe.h      |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h |  2 ++
 arch/riscv/kernel/sys_riscv.c         | 46 +++++++++++++++++++--------
 4 files changed, 41 insertions(+), 15 deletions(-)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index a52996b22f75..7b2384de471f 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -77,6 +77,9 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZBS`: The Zbs extension is supported, as defined
        in version 1.0 of the Bit-Manipulation ISA extensions.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICBOZ`: The Zicboz extension is supported, as
+       ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
@@ -96,3 +99,6 @@ The following keys are defined:
 
   * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned accesses are
     not supported at all and will generate a misaligned address fault.
+
+* :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
+  represents the size of the Zicboz block in bytes.
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 78936f4ff513..39df8604fea1 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,6 +8,6 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 5
+#define RISCV_HWPROBE_MAX_KEY 6
 
 #endif
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 006bfb48343d..86d08a0e617b 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -29,6 +29,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZBA		(1 << 3)
 #define		RISCV_HWPROBE_EXT_ZBB		(1 << 4)
 #define		RISCV_HWPROBE_EXT_ZBS		(1 << 5)
+#define		RISCV_HWPROBE_EXT_ZICBOZ	(1 << 6)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
@@ -36,6 +37,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_MISALIGNED_FAST		(3 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
+#define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 #endif
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 473159b5f303..d7266a9abc66 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -145,26 +145,38 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 	for_each_cpu(cpu, cpus) {
 		struct riscv_isainfo *isainfo = &hart_isa[cpu];
 
-		if (riscv_isa_extension_available(isainfo->isa, ZBA))
-			pair->value |= RISCV_HWPROBE_EXT_ZBA;
-		else
-			missing |= RISCV_HWPROBE_EXT_ZBA;
-
-		if (riscv_isa_extension_available(isainfo->isa, ZBB))
-			pair->value |= RISCV_HWPROBE_EXT_ZBB;
-		else
-			missing |= RISCV_HWPROBE_EXT_ZBB;
-
-		if (riscv_isa_extension_available(isainfo->isa, ZBS))
-			pair->value |= RISCV_HWPROBE_EXT_ZBS;
-		else
-			missing |= RISCV_HWPROBE_EXT_ZBS;
+#define EXT_KEY(ext)									\
+	do {										\
+		if (__riscv_isa_extension_available(isainfo->isa, RISCV_ISA_EXT_##ext))	\
+			pair->value |= RISCV_HWPROBE_EXT_##ext;				\
+		else									\
+			missing |= RISCV_HWPROBE_EXT_##ext;				\
+	} while (false)
+
+		/*
+		 * Only use EXT_KEY() for extensions which can be exposed to userspace,
+		 * regardless of the kernel's configuration, as no other checks, besides
+		 * presence in the hart_isa bitmap, are made.
+		 */
+		EXT_KEY(ZBA);
+		EXT_KEY(ZBB);
+		EXT_KEY(ZBS);
+		EXT_KEY(ZICBOZ);
+#undef EXT_KEY
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */
 	pair->value &= ~missing;
 }
 
+static bool hwprobe_ext0_has(const struct cpumask *cpus, unsigned long ext)
+{
+	struct riscv_hwprobe pair;
+
+	hwprobe_isa_ext0(&pair, cpus);
+	return (pair.value & ext);
+}
+
 static u64 hwprobe_misaligned(const struct cpumask *cpus)
 {
 	int cpu;
@@ -215,6 +227,12 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		pair->value = hwprobe_misaligned(cpus);
 		break;
 
+	case RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE:
+		pair->value = 0;
+		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOZ))
+			pair->value = riscv_cboz_block_size;
+		break;
+
 	/*
 	 * For forward compatibility, unknown keys don't fail the whole
 	 * call, but get their element key set to -1 and value set to 0
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
