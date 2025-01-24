Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F457C0218B
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 04:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/j1ISeSKt2nkNhS121qPjw3TsaBMdygWRIa0+jtpDe4=; b=aDscqX9HXMYBT7
	OtcwmYP3/KZmDQdC46zNJZe1hHEKmDAG0pUg8nUXqjdzCio2SUlmuax+lYn8Pr/uKW4U1rqxrYHts
	aVbnZNUOooX24XkB7qG3ilX8hBktAIEyN0uQCdl/hAef4gh+wfGExLSDdb2c7yAs+Yrj+G/9wQ1WA
	G/uMceusfrXK65OXCp1kRNAHGpBW7FQPOObY2lqgU9Wn6y8jzLWwwhTEncielu+bI0mPniEYg8kDm
	NxHwPharSqcmns44pylEbTRp+4WQp9QnsvRrGsmC/DZeKNgj7oUHN2dPLnigP6lglTynT6tCUljT0
	etN7zpqzVb5KppGaH9Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbAsa-0000000Dqpo-47f7;
	Fri, 24 Jan 2025 04:01:12 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbAsY-0000000Dqot-3voI
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jan 2025 04:01:12 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2166f1e589cso40446345ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jan 2025 20:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737691270; x=1738296070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uhogcwNy3A24ar7Arj4nwWwwc1NEi0tTGPamBbIerrs=;
        b=l1XgPmYnWO4n7rJp/qj4jgojG0yf3osYICFo7zVYkvvjomdiUPXYbwhr9g7DXglunH
         Mp56amHcS4WQ9ZzYPCHdcURLYr6mNLumjIkcBFjtsZazkMPyx9tSqMDWHpEnfM5GG5Z2
         RajFgw/79O01M3k1yKIHYjeGb6sJcIk4AChHqFIAfO9QHfOaC3Ww6ifb+63MLBeSwY1C
         9XZbIlbQVz0ff5NsDAMnOk7Wy3XGFfvuQ1xbRwzswt/92xnS6kX1M+AMmHouX2vz4WKb
         IJFnTAxWrw5jajf5DsYPp63/zZSHmiEZ4dfakW+nbVKlaKlX0ZhLjQbg52AB4akdVEKh
         Bbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737691270; x=1738296070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhogcwNy3A24ar7Arj4nwWwwc1NEi0tTGPamBbIerrs=;
        b=Dn/NNQqN+rm9aRR+t6qshEYlyhmEzwPD3Ot+GY0rmHMJ0qMfkz9i/mrSpV9HwI3itb
         n6bCct2LoEoQUwH4kAjEuzkTpr8tMvSuD4aZ9pOuKjE5bbK7x3lPXoCl30hmW9OA873f
         d8ClKSY6yHuyw3wRUDlRJyOl7DX69fhpED04UzPTOB9nYBghu5dQ+aXu5IMSqRoggi68
         h9ZUaPYsB96KeM7xrQGN4AnaB4SW+Ct6r7k0Cj4BsNsetMDh/ISZnPoQcRadowvuVZ/x
         Cw15pAl0FyzLxN5esFdgvfLw+4XHM2QHTR+04Ux3L5OCz2TSbXBe2DBhOI1KJBmKRfN7
         wL/w==
X-Forwarded-Encrypted: i=1; AJvYcCXLo9GUaRJa94EV+jzsHSEIu59dFfo9iKUZejySdMMlFlSipWeSFJ34KffYXGbcGMHhFYGdjoM/vdmyTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywyl4a8jxZY1wcLDMpGRiDgsMjGVgH18jcQqom+MEXE4kv8CPYv
	hfB9yozD5p/kIKP1xkUb6hKp6svYKu6gaec7n/TOndqNQQLW1TlvO738sMdFuSM=
X-Gm-Gg: ASbGncuIIMsm43G+UwCD2Rcz5DrH+5YTSjoPtuxFrb4E/j6s2SzQ98+mDOf4zB93zPy
	TwVDxHf1NqMAmzdS0jI3Yw0rIz1JoyGV+azedlSrunEVulYuUS9T71YvWl9O4KgHn2JpGAw7tKM
	wauwpZ3hRdDrV2UuYo5nPbtm4F4dE6B/yvkOD3oYctzTZj0I+ttHeXvHdEQy9O3IxPU8s6fNFbe
	d4rv0IiamypZSn3XVpA7/ZBPRMYdGAy+sWT/gRQymdjR4IVJvfssNmQCQJoP3NRj3oYbxd6mP7a
	ZX9IPr9FmLGYmWQjQsmPzK3rfJU07dmTThHe20j1NualxFX21g==
X-Google-Smtp-Source: AGHT+IHypLNaXsQx1FvJy6sHsbSOt7rVRjml9Nk+TXnCiyBsirRqofRzqo0H1bHoO0B4nLDc9UgDlQ==
X-Received: by 2002:a17:903:1381:b0:216:361a:783d with SMTP id d9443c01a7336-21c3562097amr473816585ad.28.1737691270197;
        Thu, 23 Jan 2025 20:01:10 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([2408:8406:78d1:bf49:24c4:f518:9b3b:36de])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da4141d67sm6758915ad.153.2025.01.23.20.01.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Jan 2025 20:01:09 -0800 (PST)
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
Subject: [PATCH v6 2/3] RISC-V: hwprobe: Expose Zicbom extension and its block size
Date: Fri, 24 Jan 2025 11:59:58 +0800
Message-Id: <20250124035959.45499-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250124035959.45499-1-cuiyunhui@bytedance.com>
References: <20250124035959.45499-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_200110_982230_E570FCF8 
X-CRM114-Status: GOOD (  12.93  )
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
index cb93adfffc48..b47939f5ffee 100644
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
@@ -160,7 +161,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 	pair->value &= ~missing;
 }
 
-static bool hwprobe_ext0_has(const struct cpumask *cpus, unsigned long ext)
+static bool hwprobe_ext0_has(const struct cpumask *cpus, u64 ext)
 {
 	struct riscv_hwprobe pair;
 
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
