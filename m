Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEB9C001B0
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 11:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rarOHNvseGVgSp0bAKPiptlmyXpnYQLhNcwMSfDAN5c=; b=mnfTGo2TIrX+KW
	hAAG98lbOmBkrGqdQMHjFDiQTKXL5XD9JsR9t0g2+5U6Rj+IjsY0HLxdQb4z5bPUqRFZjcCXlwIZi
	v432g3/+PkYWDngpTOB8fHjGiNi4U9K/tzBK2eweKmF7O0BUdzrn0bXQpJkSUo8FEjZ5XFGqOWjGg
	ABhAFZrw107y1ja0h+3yJ676J5efJuqM//ybP03NawsN1vJHV5nsM9beCRWZ7LeVk932BrkQVBzZp
	1+jZ0XKrvZWZnRIKUyJFDrw6dNNhGkNVbOdZsVWVdUpPcoAHA7qXSE+ZSisM570BIWta06rVOvTeI
	rEaOxaZ4/8KCdlDeeKcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qThmh-004pbf-2K;
	Wed, 09 Aug 2023 11:55:27 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qThmd-004pZ4-2k
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 11:55:25 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5232bb5e47bso5109494a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 09 Aug 2023 04:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691582121; x=1692186921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJKxAc/rsfQ1pKY1wZPiDjJLoGc1XAwGd/zLFuicKnI=;
        b=PnGtiWsOJbI1KZUTkFqrUxdUNciFZ1SRprWcG6Zl+KDyngjU/BSEIpSvICbWyb1fFm
         bfK6DqBLMpJNJBiIZQoit4Sw2iQYIRZXHL9P3RMPRpdaf80rqWo2qc19gSXCZfqZ55p0
         QS7Qbd0EuoIs6pcgplo79s6GpyRacOK2XUySNoFUZx6i+sfEuZzRxcA7H6JwN5Tw44tU
         2DKHlW2tzHGBPl+snWQtRfaiibkiaz/qVreGx41wGaW4nx6sGXY7Q2nevgyZ5rAFUgVu
         iLBLP3LupFjK7LlTKAJ7CsbsAk9whZHUCfGSrvbO6kOLxgIj3gzxIr3eieuKHhUpsgZ2
         9dfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691582121; x=1692186921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MJKxAc/rsfQ1pKY1wZPiDjJLoGc1XAwGd/zLFuicKnI=;
        b=TDaCQcfe/yvYI7T2WmGhs/Em1Mti9kOBp96AWfzTzpY241+GNUOVfNVDTt4uDYU50R
         AxXgSm3JnlFlvybdFQ9gIGOjLpqW2KSuED2CCG8jMclSCYmyuLzDpOFXAd+A/sF8QiX7
         I+G5CrBwPKMgbvpObIG2oIh9zFwVBO30+mdMukG8YJw6hQX5dTwoissa/782wCR41Let
         9LEAlJOLbCFWIvX2u7OmfvlRl/yS/MWMFuttZlrBz1/VF8xHsMtnmI/T5PfbOcPnziEV
         Xg8w10V2zTda0RtIN3e5/U5eLtyI9d8NhBfe9kyVvvmdAlLFtk1tEiCrZBXemqCKOpVr
         hU5g==
X-Gm-Message-State: AOJu0YzBVkK2jrdFEyScjpnMF8V22D+0eOlO+i3Ano2BDyP3/I3LBNdb
	HfpXr5gOqFyWxZHS0lyEaLvs9PJy7kuSua3lj+3wXXcp
X-Google-Smtp-Source: AGHT+IHz9mT0wAG2lH/iYYnE+OaJjMCGTKZdGflgBIwlyplgGsxToQdetE4Dnn6PJUMLVdM/xXOvPQ==
X-Received: by 2002:a05:6402:b12:b0:523:18db:e3ab with SMTP id bm18-20020a0564020b1200b0052318dbe3abmr1865397edb.39.1691582121427;
        Wed, 09 Aug 2023 04:55:21 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a22-20020aa7d756000000b005232cf13b02sm5613604eds.37.2023.08.09.04.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 04:55:21 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH 3/6] RISC-V: hwprobe: Expose Zicboz extension and its block size
Date: Wed,  9 Aug 2023 13:55:20 +0200
Message-ID: <20230809115516.214537-11-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809115516.214537-8-ajones@ventanamicro.com>
References: <20230809115516.214537-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_045523_891961_B1169C42 
X-CRM114-Status: GOOD (  16.80  )
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
---
 Documentation/riscv/hwprobe.rst       |  6 ++++
 arch/riscv/include/asm/hwprobe.h      |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h |  2 ++
 arch/riscv/kernel/sys_riscv.c         | 41 ++++++++++++++++++---------
 4 files changed, 36 insertions(+), 15 deletions(-)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index 933c715065d6..6a17c2872660 100644
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
 
@@ -97,3 +100,6 @@ The following keys are defined:
 
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
index 26ef5526bfb4..7d970358597b 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -145,26 +145,33 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
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
@@ -215,6 +222,12 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
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
