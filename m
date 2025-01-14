Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7447C02180
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 02:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1dg/oMDOgyi11/MyUeef+l48F2wt4V1/n9ShlxwyAHo=; b=RrUm9EceNYaGrA
	jWLSFpsrxc09OrbsYWlwQS6aOEldWyBTpi7d0E+sI3ztskqGAoG1rvE/Sc65GLGRksEe7/YH6AJjF
	AWM9SHeaBBtQ3HJmaq4dFQFSGy/rbt8+idgvxruojLiPDaxlbatogX5yie2k8quJtr+jtwj4n4dVX
	SfWvNRGX94Zq55lk1bXWJFPMb++0nKL0k4f6CB0c0OCdT/zI3j/IRJC9RRBz+8VKZQw5gMmf4U/us
	ARgNiARv0XpWSY8xTpWV8ayGVSPHael6JB8IjUG7ubNIzyCqxdabX5lWs8nBTe/hLK0sMOy0q8gc0
	c/ZbrkqEOFGcFXGvid7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXWXe-00000007EL0-3cJq;
	Tue, 14 Jan 2025 02:20:30 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXWXb-00000007EJf-3JmQ
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 02:20:29 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-216401de828so81770875ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 18:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736821227; x=1737426027; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cBNMHaJ4/jliKhn3dX1fpdixipAbOn0nv46ZAdfBeMA=;
        b=OfMbfTv3VkOyruRV+kaprsMRrQUvoAkeFi1DDhUqHczvtyhW3mk8xLtad3fsMw6U1P
         iwcwMFbkE4Mdy7DMr0oTV871xuaw/JMzk9YEEsHx+4m9HQ8Tf600nMnAVPSp25GKQK0+
         s2mW8ZCnTY4Xq9GUwjZvGQ5kJT3BDLYavjbfVjBSbHT3w2Yt6jjeRqK+9w9uHPNfg3E1
         dd1GPsUzOfQ9kpxpijsGsEnz363X4upUPIkB+M+enHxsm2eiAVwgK7J5nnTnDyS0cb9C
         i742rMXX1hRi6YvtIhsAm/7vk77S5zM42F36jAJBbrkpbgCxBcITXKx2DRVGrtYPDLv7
         M7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736821227; x=1737426027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBNMHaJ4/jliKhn3dX1fpdixipAbOn0nv46ZAdfBeMA=;
        b=DbkChm1lbImYkvdvy+Pl3CQfo/xNVqEbALGdMu/DfYcrWISPOaKEWLe2n8C0SFa+oZ
         0L4jzFRaqE38OwI44nqW1aRfvdb5QQcBkfuioA8U63YpCmrs1ibKRuG7JUg9sCvSplz5
         UsLmxKNspC5OrUWxFqKVCM5/YjmVDdm8Nj2xTnTVHfrjO9r35WmuRRMDBNBDetLCi488
         Or2Axdfc0kKAbwm4KVkuCbsC9js4T5C/BOvZWarFJauWo0foVA0/48nmq8BCzoeXiyxn
         trOtmI10vABbbZqnb1uBcP4LuCrtRlFWoPJm6MtkamsWlt8u+AmQnm5wFq5gQLg94Agt
         hjoA==
X-Forwarded-Encrypted: i=1; AJvYcCXcSFmd1Z/Rs683DeHkK5/6qzR58mZaYgVjttKvT9mhjELVtqA6iCgfq9t134Z7FqnBj19vibcu9JHEzw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzgtnoDqo9g8PwLVj/4Rfq5IbniRWufg6+HbpCrZU9BqaQwDtFP
	cqzlO0Cn1oyCMMkfFWzxBD4xevFmv6Rzds4vr7jag3K2PJyeNmb6Lrg+cnEorpE=
X-Gm-Gg: ASbGncudqo3Z5GpBnytnaxFGVnGjWFe3XnZBqWCUsKd/OUpST7gvLo9M5CaO+PSL2ni
	ngNhGeSKOKI3O5byba59QEo7HSTc8DKXzKwVtWzS63L2Miyh5zwfgLIRVTOClG4pWMx29ye6uMQ
	X1TFB+KP6bL57mSGj12FPGNHDPdm8s6DjqZGea2h1UFQIvcihqbpNAc/GzsebpdgXoKFwrXMfEC
	TGvytx1+zSbJ3bgzCmmxgsCnht9dlZAf+FgArG7SNYhM7dAtwp8NS71wCnzMRMYG2ADIKGFbjUM
	hEZofCBoT6j8epk=
X-Google-Smtp-Source: AGHT+IE8gXNlz9uvRlAxGGGoxzeSxnCrgIxrMIHzdxRxrwL5DTCwEfXr5I7vV5OOSc2ZZIkB+wm2Yw==
X-Received: by 2002:a17:903:124d:b0:20b:7210:5859 with SMTP id d9443c01a7336-21a83fe4982mr290497735ad.38.1736821227154;
        Mon, 13 Jan 2025 18:20:27 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f217b38sm58948065ad.145.2025.01.13.18.20.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Jan 2025 18:20:26 -0800 (PST)
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
Subject: [PATCH v4 2/3] RISC-V: hwprobe: Expose Zicbom extension and its block size
Date: Tue, 14 Jan 2025 10:19:35 +0800
Message-Id: <20250114021936.17234-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250114021936.17234-1-cuiyunhui@bytedance.com>
References: <20250114021936.17234-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_182027_826636_A2F4962B 
X-CRM114-Status: GOOD (  12.26  )
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
index 955fbcd19ce9..0ea7754b2049 100644
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
@@ -281,6 +284,9 @@ The following keys are defined:
 * :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF`: An enum value describing the
      performance of misaligned vector accesses on the selected set of processors.
 
+* :c:macro:`RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE`: An unsigned int which
+  represents the size of the Zicbom block in bytes.
+
   * :c:macro:`RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN`: The performance of misaligned
     vector accesses is unknown.
 
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
