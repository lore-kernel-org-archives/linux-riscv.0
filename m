Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56213C88CB2
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 17:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dRtz8YK9rcWmGqQN8w4UMCDjiKmBTApskO/2/7AfgJE=; b=RtBCte/ocKICoW
	dGR3I9BKXxi6Xjljeh0HBhzK1E1pmtphHZmZnPsFVcsfi1lj9pKJJ2vAb77OUDBzrRZ4iKmrco6Ck
	ztXJkksFN8Pxhtx3zew+qmLcQokm/WS/HHO8sQ6gbddeawz22OpYZmwA/TPzTvsVJJ4ETkE7nRVPR
	gLU1qRijt8CTI7C2OkorcPC8xPWB6Ka+04ikbQNsCRHlETOeozALx6dV+zzy6mb9liSydz1KRTeNv
	OuZ9OgVBoVYi6dHzCYljg4bhomm9pP01SqqXhOxyFqfvuRfv/SSXrNMs5DH0B6nhGOuMI0sFfxxLG
	i7McnsQOWJqdJ2Pj5I6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdCy8-004UVE-27;
	Mon, 04 Sep 2023 17:02:32 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdCy6-004UTa-09
	for linux-riscv@lists.infradead.org;
	Mon, 04 Sep 2023 17:02:31 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-99bcf2de59cso250305266b.0
        for <linux-riscv@lists.infradead.org>; Mon, 04 Sep 2023 10:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693846946; x=1694451746; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTiZ9hMTKh0ItREWlKdtTv/LCx2NEpn9SM1Hm5dmra8=;
        b=R6bNAgrCj0Kt/SmRYzkcOZHZ9P1JUOuVpx0LeHhTUEAuXuWH+BfLDtcY+tAq5qGNgp
         DeOjyKV7v3t3LtFLpJ+re/S+fAbBoCfRT7bbqcFflaQQkCa09/EKNHJdkwceU6FAS3ib
         9EmZVX/jBJH/PReMe89dhZd+Im+rQdyAY5Q5upBDSl8Wozi+TH3T7zcmOD1IrnuNxnSs
         TSqkbObtE/lWXcjMpZFM5QlsfG6KZpq2C4l5Yhh7zgffmuu5aSEfodRJ2cUoD0m1XUzw
         ljvMjgWhCZ/KzABpouLC5ph0jMtklBzrU4DHxBLKY6FxtGWOg1iuwYX7CePHxP1ZeFAX
         cHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693846946; x=1694451746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTiZ9hMTKh0ItREWlKdtTv/LCx2NEpn9SM1Hm5dmra8=;
        b=NksCq1rVcGnSwkRP0mNoyJWdXrhi/nWfWtGexmsF4KheNznAYPhyXrrzpu5UD/ZwKW
         ZYR7bZsZjekKUbLEtMC3ZyA3EBgHy90txinpp6JQQe3z6UBomT4JFfKV441Rb4re3Xfc
         s9PoN7nLDIOAxR8p5zxnJkCKom6IfHzOvL1QSWxBHUU2g7cjdQL2VjnI2fBgReaC7zS7
         3CieWAoVRjp0nCEUiMVUInbcgzdyPIMttdCWYZ2FQPklTpkoceMFcacRL0k0gi/36x1f
         2WNzTU9/N6syLRg1puj9Q4aPfxt6+spAPsnQRDxjS7nvqQHjYJBUDfOaezpG1MOqd1o/
         Q4ng==
X-Gm-Message-State: AOJu0YzTfFhC0kk5r2Gsq9NW6Uq/muaPbHEcxNJP2dLHHhseugjFH2i0
	Xr94kGlKY7cbCDqSUqNVZWE1MzDBjIcEl1S6SMWTbA==
X-Google-Smtp-Source: AGHT+IHTnxUK8npTQIEQPRnbqBv/eBG+W3nEzQP3GcpnogBBIwNrW5dxX4Zrlr+j+ndxGe0d3dK1Yg==
X-Received: by 2002:a17:907:7751:b0:9a6:5340:c335 with SMTP id kx17-20020a170907775100b009a65340c335mr2222626ejc.45.1693846946263;
        Mon, 04 Sep 2023 10:02:26 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id kg12-20020a17090776ec00b0099364d9f0e6sm6415530ejc.117.2023.09.04.10.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 10:02:25 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH v3 3/6] RISC-V: hwprobe: Expose Zicboz extension and its block size
Date: Mon,  4 Sep 2023 19:02:24 +0200
Message-ID: <20230904170220.167816-11-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230904170220.167816-8-ajones@ventanamicro.com>
References: <20230904170220.167816-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_100230_083408_FD316B31 
X-CRM114-Status: GOOD (  17.71  )
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
