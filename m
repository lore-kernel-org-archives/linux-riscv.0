Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D063E77188
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 02:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ANe7Hvh/9blwnejzthUkPYYKIYQ82S6YDApJ7WqM/j4=; b=rP+EmbHlqRC3dT
	tXdt+bHao2411Sih0RE8ccbZCYJpNiBDNoJUjKgqrG/IeHqZvoXDXTdW/ZDqirfMNs9V2MkMfqU3K
	MrpfvJTFSaB6955iBVlOKLNQimtwa1A42hISf1SaE7FRTL8QA75Be6bzzPyREBZ93YE7YqJYHlV/a
	k2nD8mTgpY7VQ7kgGAnuBeD8JIlxHBG6C/lhVelAkcw3oWBd9Cbovw56o9EMcI74JlI99X0tLhcd0
	y3cYsz24Zqfe2JfB1KXtlxd8mj4Q7EwUBd2JB/nuAkFjyGejBvExQl3chGMUwax/chHD1pAFkuBG/
	FPP1/LS1Q2HxvpH8MzaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXtLH-0000000AQxJ-3zz3;
	Wed, 15 Jan 2025 02:41:15 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXtLG-0000000AQvc-0EMw
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 02:41:15 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2163b0c09afso113987695ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 18:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736908873; x=1737513673; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rT2pVksutJIId1LNuVU67y8Yu8hoO+3APrCNZYHddJA=;
        b=U74Qe48wxw+yQLmpBx7eLL1SVZY9tH4C8n9zvGHgauZwjlRCCUestI6GTsRtTtTBN2
         tI2Gpopcv/UU19HxN8hdHjTJp75oDpM08TYUZqxyVSsISoe2F5Ubz4DYjNv1moGckjjK
         owDB2u6iiiUylV/CBfzZmRtMXnOleYriKzidRTwbpUhF94nnm7Ip2CrjL+Zh+Md2FyjI
         nxL5h5wT7PCpFiuEvu64kL9bC+sdujzCa9sUeoWFuuQqQRC4h0k1RK9qprbbYD+R+S3Z
         kG7fMCSZ0M/fIA4r5eANMlPU6I7Y9lqWPDS87n1es8A5XYb2lqDTkKokfXJJPj5Aflru
         5ciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736908873; x=1737513673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rT2pVksutJIId1LNuVU67y8Yu8hoO+3APrCNZYHddJA=;
        b=utkPwjl8K6D91wOIDgogDE3DoV7TAPmTuqkn/g9GJRuyQASgAIiHVm5xl5dRYZz+Zw
         B09XHLk2/5du2AJTFhhZAaFRRpv0cPlMYSp/wcqjfNntF3BHr23qDFyMCgAowhfHdkTN
         ukEQecv4WeZSI3UjKzFHbAZcQfNlX9NWpvlMsH3mv07iQ2VhD/NzQpNie8RA4bufSMC+
         fUL7Z+Jaumc+CbUXW95jHN0P1OexG6nIuPVdhFRTPmkkJ5thyDogxrpiRPedCZwzoHut
         2zSGCSq7T8+dibb2C7kexjsZZ12oLrnHf7hwdQt555WdqIgULYeWy0SuapxHCZnFUwV+
         jZ7w==
X-Forwarded-Encrypted: i=1; AJvYcCVli0aEhAfdOlZT0zA/p5ttSq2n8ihS4WOdgn8HHOpB9kkVOA9XrheuLP1Qt5g3KJVTTEkDfLIClDDXvw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfaEqUJD1Nwe8LUv7O6tr2Hp7p0Un0j+YtXWQSdi8wiW56EHcF
	InUiV352Ij0u/rMVMV0MLh/VpnY/4lyQPjJVAqCjbTyqLVGZXXKO0CQ3K+frztk=
X-Gm-Gg: ASbGncsJHRWWEFxj8cM7jib1yCRqoPGG+K//3TlyD2r1rx9VlqnsJQ2GXwp0B1C/7fm
	JBeus6eS9eb5hb/uKmCdfbXNAF/QqB6pfbRQ4kAZ3zi67kHeH2eGAEerzwslnqY6EaTxec5ybfR
	KqlxHFce2Q4NGL11dAyUG/esgChIcpOEGtDXwvehcWWmYnC2u+a+eUz9GZ8wJWjmDgQuSt3OYNr
	PJ4eKmX0l8l6cGLOB6XR1Exl0IgTBprwlnRTMDkijVXQH4bF9zeR8mS+/eyf3d1LGc6jqjP4DNP
	o0G4hqetItwGGU4=
X-Google-Smtp-Source: AGHT+IFZrkOo1kKHka7uEN46rgjAYm+/LF8Olw/yHOPwTxzyq6Nj2yHjAD5mXgPxO3CwPQSd5i6+xA==
X-Received: by 2002:a05:6a21:151b:b0:1e1:ae4a:1d48 with SMTP id adf61e73a8af0-1e88d2fd01emr46853864637.40.1736908873272;
        Tue, 14 Jan 2025 18:41:13 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40680e67sm8321841b3a.139.2025.01.14.18.41.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jan 2025 18:41:12 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: ajones@ventanamicro.com,
	alexghiti@rivosinc.com,
	andybnac@gmail.com,
	aou@eecs.berkeley.edu,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	conor.dooley@microchip.com,
	conor@kernel.org,
	corbet@lwn.net,
	cuiyunhui@bytedance.com,
	evan@rivosinc.com,
	jesse@rivosinc.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
	shuah@kernel.org
Subject: [PATCH v5 2/3] RISC-V: hwprobe: Expose Zicbom extension and its block size
Date: Wed, 15 Jan 2025 10:40:23 +0800
Message-Id: <20250115024024.84365-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250115024024.84365-1-cuiyunhui@bytedance.com>
References: <20250115024024.84365-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_184114_093272_2A0FC54F 
X-CRM114-Status: GOOD (  12.37  )
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

Expose Zicbom through hwprobe and also provide a key to extract its
respective block size.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 6 ++++++
 arch/riscv/include/asm/hwprobe.h      | 2 +-
 arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
 arch/riscv/kernel/sys_hwprobe.c       | 6 ++++++
 4 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 955fbcd19ce9..21323811a206 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -242,6 +242,9 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_SUPM`: The Supm extension is supported as
        defined in version 1.0 of the RISC-V Pointer Masking extensions.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICBOM`: The Zicbom extension is supported, as
+       ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
      :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
      mistakenly classified as a bitmask rather than a value.
@@ -293,3 +296,6 @@ The following keys are defined:
 
   * :c:macro:`RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED`: Misaligned vector accesses are
     not supported at all and will generate a misaligned address fault.
+
+* :c:macro:`RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE`: An unsigned int which
+  represents the size of the Zicbom block in bytes.
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 1ce1df6d0ff3..89379f9a2e6e 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,7 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 10
+#define RISCV_HWPROBE_MAX_KEY 11
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 3af142b99f77..b15c0bd83ef2 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -73,6 +73,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
 #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
 #define		RISCV_HWPROBE_EXT_SUPM		(1ULL << 49)
+#define		RISCV_HWPROBE_EXT_ZICBOM	(1ULL << 50)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
@@ -94,6 +95,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_MISALIGNED_VECTOR_SLOW		2
 #define		RISCV_HWPROBE_MISALIGNED_VECTOR_FAST		3
 #define		RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED	4
+#define RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE	11
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index cb93adfffc48..04150e62f998 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -106,6 +106,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZCA);
 		EXT_KEY(ZCB);
 		EXT_KEY(ZCMOP);
+		EXT_KEY(ZICBOM);
 		EXT_KEY(ZICBOZ);
 		EXT_KEY(ZICOND);
 		EXT_KEY(ZIHINTNTL);
@@ -278,6 +279,11 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOZ))
 			pair->value = riscv_cboz_block_size;
 		break;
+	case RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE:
+		pair->value = 0;
+		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOM))
+			pair->value = riscv_cbom_block_size;
+		break;
 	case RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS:
 		pair->value = user_max_virt_addr();
 		break;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
