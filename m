Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7CAC001E0
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 08:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cm4dzZyROGzd+wT1v0CvIG5bf5sVLOsZhKNcDJvoMSk=; b=3eh0hagcLBmi7I
	uc74cT1quoMn6xFFjC3SdR9YuFSrRFevrKa2V17iviTNBEyGIdSCfQtaKZyRT1OZ7T7OhjYF5QG9J
	9q6lmpwYFidJhoCOhbYnsWErJcutUujmzQ/8ufqDFTEwIe4Cu578uL5NeJ4Iji3boCwR2yPyNCe7F
	As5cGIqRvPSboKoKIZoAzf8+PPL00mDBr9GSqoSK1lMnxa4BhlqJYu1DyBMwolGV7topQikmrmrJw
	lmMzlom54zD/7/fu62LdC1Z47Ebz3ctfTH2PH+RO4X1LD29mMHJPt0QZm57E6Bg//puWw7A9tRZpb
	Dd6EsjdPolx6B79mQDtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJVPy-00GwRF-0G;
	Wed, 12 Jul 2023 08:41:50 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJVPu-00GwNJ-2g
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 08:41:48 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-31590e4e27aso4065054f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 01:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689151304; x=1691743304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1czZOouN4R8rvhecyOdxS/fUEZ430UatGfS2CvREC4=;
        b=gwIEGJSQC2lc733QUx0mL7EQanAHivGO25GBSLLMgQRoYPRXALoEAYGOLEivj17mmI
         Nj4adO3RRLQUuocWBGImYB6bGtYnORM9NlRikeifzi0PQ0IL1dGto2Q2nnMlqxqS7sSY
         /tiCrbAcHJHjDDEqAycahauO/NFvxTeu1wiIo6sKj1MQQElsuFtRfiCMi/z7JDe6TuTk
         uKm8BiXX0T2jk24G4j1SqFYu3QCPjEyUSCW5PTT9HPR2Fx3KCavu9WNXTJfq2LZ+GIrJ
         BRO4mnmHVIfy31z+Cq4z1XI2Z8QYYQ/2mKSBLUY16RN5ZOn6IK9aSxkzbWIt0AQOqrhD
         U+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689151304; x=1691743304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v1czZOouN4R8rvhecyOdxS/fUEZ430UatGfS2CvREC4=;
        b=abzkLkQ0CMmh2HVrBC3GXPf7I4MTtDXvL5Ub9TF+Cd5Zlp7O+9g7Lx5qiXtLSwYF2b
         N66Pluxx+GPaBTvAuFcuV0yuY97X6ZqJBD5P5YUb1jGB8sqed57tfFwXcUXN+PLhHhb9
         OCeh3Y+Fkp8uubzuNmkyVg47JModa0Jov8wt9sAdjtDjg7ULbm03kRFV3jc267E1OvAv
         x+iob3Ty067D8KaGg+IIuA3ZhypXZz234EyWEFRJ1t+SODHmoom7AV6WI9ZM9vxJxXXF
         M+6MBAH3vgbxbqiV15S96HbqQII4bRoFmjp4L/jU6QH3onYJJ41nfE03MVbJl/8Ewfwo
         gk+A==
X-Gm-Message-State: ABy/qLYbrc9Q9aBLdae5iuXqSD++tdsi1sKRJDh8E2jtY7wABbBi3Bcq
	CiAj9I3v/J3pqUjG6B896sgvuQ==
X-Google-Smtp-Source: APBJJlGg+rsqRu4BTGL/I9uL08XG6vx+bsh+ed8/X0b+TdypKH3GEvF2pa6eJu2t24MkEFtNLOKYDQ==
X-Received: by 2002:adf:e7c1:0:b0:314:1270:8fc with SMTP id e1-20020adfe7c1000000b00314127008fcmr17540498wrn.0.1689151304363;
        Wed, 12 Jul 2023 01:41:44 -0700 (PDT)
Received: from vermeer.tail79c99.ts.net ([2a01:cb1d:81a9:dd00:b570:b34c:ffd4:c805])
        by smtp.gmail.com with ESMTPSA id z13-20020adfe54d000000b003143ac73fd0sm4496122wrm.1.2023.07.12.01.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 01:41:44 -0700 (PDT)
From: Samuel Ortiz <sameo@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: Samuel Ortiz <sameo@rivosinc.com>,
	linux@rivosinc.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Anup Patel <apatel@ventanamicro.com>,
	linux-kernel@vger.kernel.org,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>,
	Guo Ren <guoren@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	devicetree@vger.kernel.org,
	sorear@fastmail.com
Subject: [PATCH v4 3/4] RISC-V: hwprobe: Expose Zbc and the scalar crypto extensions
Date: Wed, 12 Jul 2023 10:41:19 +0200
Message-ID: <20230712084134.1648008-4-sameo@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230712084134.1648008-1-sameo@rivosinc.com>
References: <20230712084134.1648008-1-sameo@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_014146_917820_DDD8F95D 
X-CRM114-Status: GOOD (  12.59  )
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

Zbc was missing from a previous Bit-Manipulation extension hwprobe
patch.

Add all scalar crypto extensions bits, and define a macro for setting
the hwprobe key/pair in a more readable way.

Reviewed-by: Evan Green <evan@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Signed-off-by: Samuel Ortiz <sameo@rivosinc.com>
---
 Documentation/riscv/hwprobe.rst       | 35 ++++++++++++++++++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h | 11 ++++++++
 arch/riscv/kernel/sys_riscv.c         | 36 ++++++++++++++++-----------
 3 files changed, 68 insertions(+), 14 deletions(-)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index 19165ebd82ba..105b59e2e780 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -72,11 +72,46 @@ The following keys are defined:
        extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZBB`: The Zbb extension is supported, as defined
+      in version 1.0 of the Bit-Manipulation ISA extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZBC`: The Zbc extension is supported, as defined
        in version 1.0 of the Bit-Manipulation ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZBS`: The Zbs extension is supported, as defined
        in version 1.0 of the Bit-Manipulation ISA extensions.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZBKB`: The Zbkb extension is supported, as defined
+    in version 1.0 of the Scalar Cryptography ISA extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZBKC`: The Zbkc extension is supported, as defined
+    in version 1.0 of the Scalar Cryptography ISA extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZBKX`: The Zbkx extension is supported, as defined
+    in version 1.0 of the Scalar Cryptography ISA extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZKND`: The Zknd extension is supported, as defined
+    in version 1.0 of the Scalar Cryptography ISA extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZKNE`: The Zkne extension is supported, as defined
+    in version 1.0 of the Scalar Cryptography ISA extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZKNH`: The Zknh extension is supported, as defined
+    in version 1.0 of the Scalar Cryptography ISA extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZKR`: The Zkr extension is supported, as defined
+    in version 1.0 of the Scalar Cryptography ISA extensions. Depending on the
+    M-mode `mseccfg` CSR configuration, userspace may not be allowed to directly
+    access the Zkr-defined `seed` CSR.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZKSED`: The Zksed extension is supported, as defined
+    in version 1.0 of the Scalar Cryptography ISA extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZKSH`: The Zksh extension is supported, as defined
+    in version 1.0 of the Scalar Cryptography ISA extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZKT`: The Zkt extension is supported, as defined
+    in version 1.0 of the Scalar Cryptography ISA extensions.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 006bfb48343d..8357052061b3 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -29,6 +29,17 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZBA		(1 << 3)
 #define		RISCV_HWPROBE_EXT_ZBB		(1 << 4)
 #define		RISCV_HWPROBE_EXT_ZBS		(1 << 5)
+#define		RISCV_HWPROBE_EXT_ZBC		(1 << 6)
+#define		RISCV_HWPROBE_EXT_ZBKB		(1 << 7)
+#define		RISCV_HWPROBE_EXT_ZBKC		(1 << 8)
+#define		RISCV_HWPROBE_EXT_ZBKX		(1 << 9)
+#define		RISCV_HWPROBE_EXT_ZKND		(1 << 10)
+#define		RISCV_HWPROBE_EXT_ZKNE		(1 << 11)
+#define		RISCV_HWPROBE_EXT_ZKNH		(1 << 12)
+#define		RISCV_HWPROBE_EXT_ZKR		(1 << 13)
+#define		RISCV_HWPROBE_EXT_ZKSED		(1 << 14)
+#define		RISCV_HWPROBE_EXT_ZKSH		(1 << 15)
+#define		RISCV_HWPROBE_EXT_ZKT		(1 << 16)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 26ef5526bfb4..df15926196b6 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -145,20 +145,28 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
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
+#define SET_HWPROBE_EXT_PAIR(ext)					\
+		do {							\
+			if (riscv_isa_extension_available(isainfo->isa, ext)) \
+				pair->value |= RISCV_HWPROBE_EXT_## ext; \
+			else						\
+				missing |= RISCV_HWPROBE_EXT_## ext;	\
+		} while (false)						\
+
+		SET_HWPROBE_EXT_PAIR(ZBA);
+		SET_HWPROBE_EXT_PAIR(ZBB);
+		SET_HWPROBE_EXT_PAIR(ZBC);
+		SET_HWPROBE_EXT_PAIR(ZBS);
+		SET_HWPROBE_EXT_PAIR(ZBKB);
+		SET_HWPROBE_EXT_PAIR(ZBKC);
+		SET_HWPROBE_EXT_PAIR(ZBKX);
+		SET_HWPROBE_EXT_PAIR(ZKND);
+		SET_HWPROBE_EXT_PAIR(ZKNE);
+		SET_HWPROBE_EXT_PAIR(ZKNH);
+		SET_HWPROBE_EXT_PAIR(ZKR);
+		SET_HWPROBE_EXT_PAIR(ZKSED);
+		SET_HWPROBE_EXT_PAIR(ZKSH);
+		SET_HWPROBE_EXT_PAIR(ZKT);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
