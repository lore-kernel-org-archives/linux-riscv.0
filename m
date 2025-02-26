Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7CFC19F2E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 06:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I072SpVigKjhXZbdjD/Zy/p4v/uircy9lWmhmA5Rh/4=; b=owantw/mt7DE3i
	mVHmuVsKruRoz0a8UtLtpg93YF3s3XU4tW+9019WMVlxOe/cLLK6SFYsfL/Fd4CtsU5OxnrbkyqUx
	JFalYze0Gyfu46O22XWR+NC1R0aTidwokUZDcs1c72Vq373nRHHuSKwP4TVNYWLf6wqTLsOKcnr5v
	4X4ZrulzoN085kic/9mXD6h4fiXmiuK2V709AhEX5D1Mr0399mZcWKgvBTYoFSZQwnJohZcyxRZLP
	DIsqul87GpjQOgEnEOApHomf/cy4aLcIJrh8akyEorbUA161D5m8p00q7Lcd/YTM2bqVD5Egfiwk/
	+iME5VXdVLKQxlIf7UqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnAzB-00000002Xo0-14Mi;
	Wed, 26 Feb 2025 06:33:37 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnAyB-00000002XTw-0GMd
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 06:32:36 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2fe77285e12so2008837a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 25 Feb 2025 22:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740551554; x=1741156354; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T2XeNxbHPPMmfxCJjw+vu4vYKA8Lsa9L2O6TiyKPYYk=;
        b=KY/nI3cq4mDbHow691jUW0pb7FHhgCS87uE84nC5tQph7dmSD1VBbcfOvvmLgd0Upw
         w70LVEDjEwMiWlSnJCzhDO14QW9iFr1fqea9ZUoRAxTYdpGBbIopiOipGLcGcVFGiyd9
         Hy1ARQwiUqe1piIg02J+BVrfVV8uxqPnxNehgHwO0jVN78JHQvbswHmHKGutvUOfLbxP
         ovBr8FGSCvR5xvoLFlH6SQUcmrnx6Bv6bJJSwSsi5++QdpOLSCryVEh4vr1R7sRezfOj
         RTGH6/ZzJfnjGyt09HT5T4k60n0huOJNi8XpC2sqJ7O/EkhaORmdtOORn1E08qgWyzuY
         xlYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740551554; x=1741156354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2XeNxbHPPMmfxCJjw+vu4vYKA8Lsa9L2O6TiyKPYYk=;
        b=ckXHbi1SrLMFIwtmrLLmoeXkiVRxwleiT6VFPsIsnJjecULgERuY6uAMYxKcLSnLme
         wUVW9+JM3gChgHT6w5Ca2/eedvxamVbxA6Re9hH5735sbqcVqi+JxaHsAaTBzDhRwHmq
         vaaMmiCd4aJR7HQrjbEmFzjY64xmxpG4nR8Duk4xbrFbvH+31ojD17k788wgVIMYXLyt
         AzeCNllvosioTTlFO2TodYBU+DaejnRpIH70s1nJ+w76NZrMadDFDIkJRisXjtolD4U4
         dRyVMz7NFxdiP69jw1OvsJq89cz7ZSmFRsWl2y75tmODHSXEzRcyKhgdgz92Ab2NYsa6
         6/7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVgO5ml3JpktF+O7BSBSe/8bTe5umxw/kQpxLN4BXDH8NfR9t1szVHQibK+sozYYg2A8MKOFpHlae2isQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxth7/aWO6n2LyAPFTagW9prRsWyp9DJvYa6d/3RRPjDiMi/fmt
	uD/imZhvTanWaem6em0XNUBhLJPBQRIggq41XAClrt65Mxo17EUmqfgsxq3fXUY=
X-Gm-Gg: ASbGncuA1RVL/ZdGYKT2Ij3jYrvS1ZbqhLAGcBdZ8RpMht8ItNzaRbZFdv8i8EN/jRb
	nhKpaHgVeBiGmdIiXKdYUHP52ftrBBVpzD2TsDoJEFGGsmxBEAixWFjsVdD7T+MvLl+bU87oFan
	IH9AFjF6H++FQIZhGdbPv6n41oB007wzmc6SkJO6UVt+pJ59mq9XjEg6s2rQmh//WZt8JbanERI
	aMJrbxwvxUYTh9c33Oj4EvRLHcRkrtO6p144N1cWQvAIbq9r5o11B9S6kOncJCKSsjJ+HFntGG1
	nKACvvxFlVCxIejoECmrrgXFm0zuSROgzZJk2BWVOxr07lMbP6w4vWh7Zl+8
X-Google-Smtp-Source: AGHT+IHwvV7I7NlJ9jqPsn3374kntVoW/0IqCvSXn/+vGzdzMVefrgZflgML33Q88VI8BAdqqvkLhA==
X-Received: by 2002:a17:90b:2e08:b0:2f5:88bb:12f with SMTP id 98e67ed59e1d1-2fe68ae74ebmr8882080a91.21.1740551554107;
        Tue, 25 Feb 2025 22:32:34 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe8284f152sm682599a91.46.2025.02.25.22.32.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 25 Feb 2025 22:32:33 -0800 (PST)
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
Subject: [PATCH v7 2/3] RISC-V: hwprobe: Expose Zicbom extension and its block size
Date: Wed, 26 Feb 2025 14:32:05 +0800
Message-Id: <20250226063206.71216-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250226063206.71216-1-cuiyunhui@bytedance.com>
References: <20250226063206.71216-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_223235_153044_FB5C8A80 
X-CRM114-Status: GOOD (  12.75  )
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

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 6 ++++++
 arch/riscv/include/asm/hwprobe.h      | 2 +-
 arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
 arch/riscv/kernel/sys_hwprobe.c       | 8 +++++++-
 4 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index f273ea15a8e8..d91e39e19ea0 100644
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
@@ -303,3 +306,6 @@ The following keys are defined:
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR`: The xtheadvector vendor
         extension is supported in the T-Head ISA extensions spec starting from
 	commit a18c801634 ("Add T-Head VECTOR vendor extension. ").
+
+* :c:macro:`RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE`: An unsigned int which
+  represents the size of the Zicbom block in bytes.
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index dd624523981c..1f690fea0e03 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,7 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 11
+#define RISCV_HWPROBE_MAX_KEY 12
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index c3c1cc951cb9..8c706cde3777 100644
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
@@ -95,6 +96,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_MISALIGNED_VECTOR_FAST		3
 #define		RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED	4
 #define RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0	11
+#define RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE	12
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 04a4e5495512..69fe9da320dc 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -107,6 +107,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZCA);
 		EXT_KEY(ZCB);
 		EXT_KEY(ZCMOP);
+		EXT_KEY(ZICBOM);
 		EXT_KEY(ZICBOZ);
 		EXT_KEY(ZICOND);
 		EXT_KEY(ZIHINTNTL);
@@ -161,7 +162,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 	pair->value &= ~missing;
 }
 
-static bool hwprobe_ext0_has(const struct cpumask *cpus, unsigned long ext)
+static bool hwprobe_ext0_has(const struct cpumask *cpus, u64 ext)
 {
 	struct riscv_hwprobe pair;
 
@@ -279,6 +280,11 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
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
