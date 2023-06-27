Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA56EB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 14:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FWGuEZzTzIO/7LmVQ65+QsCqmUUOIFr/VYQo8dACENk=; b=V6iLaR4ts2Y14Q
	Bo0zOCOGjXa2IUXioZ1W6s5ZlqCG/iXUp/6RfCAfBtze1EwSv4C+Djd1csNc8yhIKqU8DNeanXIMm
	vMlPYbiBm0z54d6IPZrO4mWsQmDL2yOuyNZHfSS8nNNtGGPYPye/+GXFEVF4D4NPM3ay5ltB7PnLz
	CdlcrXc+ChEHgmo9GichquUismZIibpAD7IuIfpRbTuhAK88GdNr6b/rS9C/pCTFvqKHyod6+wVxb
	/kD2/1MC3hF6o7eUNMA1xUe6xDJe27piq+u527H2LNPtiG8L2YAATj3thlmv3eAoaltmeZEuJizXl
	wdLz5nM7ihLNAK7SX8vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE9px-00DOX3-2l;
	Tue, 27 Jun 2023 14:38:33 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE9ps-00DOUj-1x
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 14:38:30 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fb10fd9ad3so19909685e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jun 2023 07:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687876704; x=1690468704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHx3gYl8Iw0W58X86iiLjYiqWHDrUKQgdW58J9hMNFo=;
        b=FTtFb9NUP/FASOPS8uXn1Ce/tmrUwlVuNX2PR/86vGMwUod6PgNIRCWP1uks54i4F9
         Pds5XWsywwWck3JhyC7zwYuKbYWBMfHYS7NhW/0MxwH43Z0rMp3SZBfMINhwqXsRt4L6
         BWZmF2mpKAqelz1kMm0/Yj8eR4jfqKpL8uwKGeoRP5lR2L5B5PGvVb2gjqs/RMdgaK/d
         /sT1/2lEtasaKEJFEFOhWdgkU8Rp/mrpkfYXUUqBEPQ5cMOyet5zVpa5fnfkbIEnEycp
         lZCJkbMpt+mAYj8wvVyGSxpqwxMFwfWu5ihjRrR/qR8Jvq0F/W9OCbTmCKmjyg8oAnRg
         rkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687876704; x=1690468704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHx3gYl8Iw0W58X86iiLjYiqWHDrUKQgdW58J9hMNFo=;
        b=QkhVPPiQi8xGp8tGzqhqT2pvgLydct6Uis5nmXn9Fn9QH1GuwtNWS1qwS6ycPyO4lU
         DcSMI0nT8eayttUFPIxZ/KEp5tpqtDoAIIvch8nNz/w1zSI5FoPq9E/nI3HMf3beouy/
         M1ENzGAEbZ0Id1jt7MifAsVY4bX312RECCw0GrKktX4JK3ar7SjuAoRQlEydTOzXNPqA
         tcM+IeEjtx7rmtFDs+p/Dvk1nc0aGmv0r1BCKbg6T4A3Bz5dOnVVJFG2woCcR27t/UZQ
         SrLzuRTFSxUPfGsDyg17bc0X8rQq19qKvidbzhRMl7YmhDBvf+pUdJibPEoTHQ2vjS5W
         YCjQ==
X-Gm-Message-State: AC+VfDwVN+gGvTltzoiMFVqiq0brh9G93MHE4QodrUlZyWKnBa2PTMZs
	yHIEmvmPAGP7bFZAoWyHkQm1qw==
X-Google-Smtp-Source: ACHHUZ4nqjMHBfhSsc2aV/a4aCgpIz8HXNz9mgF/6ym4aPv0kI9lcEjphKs7zOHhm0vLztzwNlDDTA==
X-Received: by 2002:a7b:cd1a:0:b0:3fb:7184:53eb with SMTP id f26-20020a7bcd1a000000b003fb718453ebmr2396351wmj.18.1687876704481;
        Tue, 27 Jun 2023 07:38:24 -0700 (PDT)
Received: from vermeer.tail79c99.ts.net ([2a01:cb1d:81a9:dd00:b570:b34c:ffd4:c805])
        by smtp.gmail.com with ESMTPSA id c21-20020a7bc855000000b003f8fac0ad4bsm10894793wml.17.2023.06.27.07.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 07:38:24 -0700 (PDT)
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
	Evan Green <evan@rivosinc.com>
Subject: [PATCH 2/3] RISC-V: hwprobe: Expose Zbc and the scalar crypto extensions
Date: Tue, 27 Jun 2023 16:37:43 +0200
Message-ID: <20230627143747.1599218-3-sameo@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230627143747.1599218-1-sameo@rivosinc.com>
References: <20230627143747.1599218-1-sameo@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_073828_640790_89A69E2B 
X-CRM114-Status: GOOD (  12.39  )
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

Signed-off-by: Samuel Ortiz <sameo@rivosinc.com>
---
 Documentation/riscv/hwprobe.rst       | 33 ++++++++++++++++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h | 11 ++++++++
 arch/riscv/kernel/sys_riscv.c         | 36 ++++++++++++++++-----------
 3 files changed, 66 insertions(+), 14 deletions(-)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index 19165ebd82ba..3177550106e0 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -72,11 +72,44 @@ The following keys are defined:
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
+    in version 1.0 of the Scalar Cryptography ISA extensions.
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
