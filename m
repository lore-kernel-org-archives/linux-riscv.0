Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE43C6FA8F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 16:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dyIjRX5QkEcEdrb/mkpb0jb8ktv1uR0OAJY4DG4rQ+8=; b=e71fp3J9+1Lrdc
	XwgXk0auV7KlgGYZ27u4wkVEqIpXqrjzhBs1FOxTZxSyiEN3q7qHka8iQ4yv1mCSyjUoh71eG0YL6
	dk2pF4aW15hFHzoROT6/xQjFrybPr0VZvBeJDM1SsmNo5wx3vlhz8OT3xk2Ozo+rR3/xBhnGNZbNZ
	Eaah7BVwlBehcCH1dCXMCLUMcla4XSa96410rCe20EJnvD2h1hunHf1NNI0QD65LKTkSt3Mt6RWGW
	28DB+PJZ4gw0qdXGzm+BiF08LF2Vl3aBbrwgVoB/4Xwu3qn8bjBsbTkErdJPbgink2ND4u9d3rZPd
	RX0fKBN3AH3g6NtUWDmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbOOO-00DsYx-30;
	Wed, 30 Aug 2023 16:50:08 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbOOI-00DsVp-0B
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 16:50:03 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fef56f7248so54791785e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 09:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693414200; x=1694019000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TN0vhZliR8xZ9RgwQecYcI4Y6wSzyhr0RvkK+nocmq8=;
        b=S85qKE3cC5oeIG9LGNqCsc7/NFjf/2y7O4w0oxJpxY6a+fibhCvyTiL5ycbhoe0KsH
         yryjoDp/D73wQEY0+oAYIqhl2SjYlNormbGv9xV9ito7vKjkIR1KVrDqDGGtbgqer/Ll
         EMo2OBHbWnmjoqzlXDQ0FcvxYS7HlcVrjXLQPku9kr8I8EpsVfDqjnXXqxhUPnvJsnqG
         QYvG7FEINreNdAW8Abvl9YDyhdReK06F1dF3Ib9NGAo5lsMuWMM0n9Y4skODqyM/VwJj
         5nZ7EPtpjmeL4lySBK9JXAW1bIxzSv+O6Nc7/1r6+0T2dHfasIKVzxz5h78DIsxKcmEO
         PhwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693414200; x=1694019000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TN0vhZliR8xZ9RgwQecYcI4Y6wSzyhr0RvkK+nocmq8=;
        b=h8XZmEt9lMZh9RCcEqxCugyMeEZuhWG2uwfdvtRI+mNHf/cpCGhz1h+8BQEsCFnNXo
         7DURiuHke9LxuxmGQPVccZ9LnxYRCf2bkMZkFwlE4IJU3KmIpPQKDh2XUuapkIuvwMVw
         b4tMesWr5632sT6NYPnhyGam34LPkSWKSv/g0TShPjv43ZWGfNlllTrU7QWWZBkfg6+k
         nqL9TwDrF54uPBoGAjILdEjdRutbh6ezJ6JM966SaadoRo1/WM6b9aIWqukXzQsiwrq2
         oesX3Bci3sy3Bj+PCw6CpuqKBxeT1Mhz/DTiGL+7cTPVUBrpt8ZPcoC38G9pFkgNeBYF
         aqDw==
X-Gm-Message-State: AOJu0Yy9L5kuXwlsZuqWkMu0I0jybld9T1f62MY6qAQAzLCAAYWc9fc9
	lu3+9BbGv8V2Tds9TxyAZGaRi+pvmNhxr97FM9p1VA==
X-Google-Smtp-Source: AGHT+IFqueuoNLWwYG9Ad+39S7VktL+lKaEjiM3OmKAlJO8wW/BQH9+BcICqfDhcwDjVCUhvm6mtOA==
X-Received: by 2002:adf:ea4e:0:b0:317:5ece:e16a with SMTP id j14-20020adfea4e000000b003175ecee16amr2135601wrn.50.1693414200315;
        Wed, 30 Aug 2023 09:50:00 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id m28-20020a05600c3b1c00b003fe2bea77ccsm2869670wms.5.2023.08.30.09.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 09:49:59 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH v2 3/6] RISC-V: hwprobe: Expose Zicboz extension and its block size
Date: Wed, 30 Aug 2023 18:49:58 +0200
Message-ID: <20230830164954.91987-11-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230830164954.91987-8-ajones@ventanamicro.com>
References: <20230830164954.91987-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_095002_146764_7C1814B8 
X-CRM114-Status: GOOD (  17.39  )
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
---
 Documentation/riscv/hwprobe.rst       |  6 ++++
 arch/riscv/include/asm/hwprobe.h      |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h |  2 ++
 arch/riscv/kernel/sys_riscv.c         | 46 +++++++++++++++++++--------
 4 files changed, 41 insertions(+), 15 deletions(-)

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
index 26ef5526bfb4..d17cb5b4945b 100644
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
