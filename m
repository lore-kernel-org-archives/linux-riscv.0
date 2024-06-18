Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984E1C27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 11:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gsnQehJAxw0N98Du/PaWMSY28NhF7UALcEjKwJuIhrk=; b=Yr2S0vtrbD9xaJ
	owam78mRtayfEL+YQ6LVNj5jZ1RocCVDadVeunxOFW4LnS752QI37btCebgVlUMuzAaussZF543o6
	jiXRf4GhlKXtBIyf1Ch5R2ZkEPzzmxuOX8Qjq/S50+WkMQ7WCR/rmj1hKiQRckriETP7e1rES5tiF
	dpfQr2xisu4YR8o3pxa4FRU4wK7QLFdZ+Agg/yGlHNzUh8L8Hpdu6qyz9/POvAU3DJlU5W+4e/TiO
	EFobZOAwCZghgHYz7HJDWr3l/XXnxCNpucXVns1sT53uOZeIlesZK3Kwr52tQjf95usur0oWbICre
	jv+tDEQ4FAZUpiXKrc5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJXIs-0000000EhWV-0TGH;
	Tue, 18 Jun 2024 11:47:10 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJXIo-0000000EhU4-1Y91
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 11:47:09 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-6e4dbca52f0so3935597a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jun 2024 04:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1718711224; x=1719316024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N8+RGABEO6lna9EhwFH7VWtP9seFYP+2PecyhqqiBFA=;
        b=eJuXHOOofkJBom/RMsUFWI6Fg4VCfWtipe1s0WT/nU5a6GNh3eb7htncr2FpTMgk6S
         6hMbWP4V4CzJMh9je0Fgo9z3OltQ8lPvrHJWmDtCrrzbZYLEoVuoy0xtIE3miez5pLCz
         02GGef5iZqOTzrg6omOEoJh0C0pUyzyaCd/axKWrl6WWGendyPiq1bZg25jeL+fPIyjS
         RCB6/A731qY8ePhStR56ZJwGtysonpag2UNv1RyWVuD9wHZi2OwyEthDp8vWXNvIW0Nq
         ykyTgZp/sh60sv2jvU9reKJUz+BLB+y2mvM+Gqw6LbDur/AWGjGG6cnaN6xH+Rie2m9Q
         mMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718711224; x=1719316024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N8+RGABEO6lna9EhwFH7VWtP9seFYP+2PecyhqqiBFA=;
        b=YvZLmJ9b8M6UnpITaN9lOxHaA0GqJd7FD8JImLhXfu1OFfTLLHHR6p9a+WYKyEwsT5
         ktY66jNscvF9vNyOrmRh2amJe0TnYS/GYXcSdXtTpOAbG3Y3WhcEFJi9et5piSiJghCy
         NPnjzfFtQKw0mXtfjKM5XT3aM8Kv1WKfQt+6Xkhn7J2SrtguMmTvuFd1oPtc9saSFHdT
         iD4RVO1TXjkd4a7h7o2gu9edS+WQlOiAftSH2EM1vQV+utVX7iw83cktoL1Hgj4iXfKL
         Q+MXZ/LsFmgQu5w9ogPjSNk6cx7hEH4BPQwMqTJE6Z4s5Swr7n3Z2v7iBt9P/f+nWSwK
         oyHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDyFemX0TwAn/J+HNglgMVcq1Hw6CcZsRvwKgDEkoqWSEivsmq6PaDprNcxQ4AbNEaNr+w5yLMFBWEO8pENk5Eh3VNtlHijblo+NIj5YD0
X-Gm-Message-State: AOJu0YxqYCXBTQWEVkCu9yX55oNppp2hX/zBKHPozvDQYwbc4mtHKmzv
	gOCS/HhchkBbqyGSqKdKFKQTPPdPCOEkTXjtMjfRLnVtMMUCuu0wmIc8QJ1qpbk=
X-Google-Smtp-Source: AGHT+IGFDOB6kB9pshWCoiP1FpV8JeCOOgnEc3F8axKP2a4fh9M2ef6HmKlyehClnbcRTMajNGf0mQ==
X-Received: by 2002:a05:6a21:81a9:b0:1b5:69cd:87e with SMTP id adf61e73a8af0-1bae7eb46afmr9188496637.21.1718711224523;
        Tue, 18 Jun 2024 04:47:04 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.245])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855eeff53sm95717365ad.181.2024.06.18.04.46.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 18 Jun 2024 04:47:04 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	cleger@rivosinc.com,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	cuiyunhui@bytedance.com,
	costa.shul@redhat.com,
	andy.chiu@sifive.com,
	samitolvanen@google.com,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH] RISC-V: Provide the frequency of mtime via hwprobe
Date: Tue, 18 Jun 2024 19:46:53 +0800
Message-Id: <20240618114653.12485-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_044706_650350_D71748CC 
X-CRM114-Status: GOOD (  12.69  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

A handful of user-visible behavior is based on the frequency of the
machine-mode time.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 2 ++
 arch/riscv/include/asm/hwprobe.h      | 2 +-
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 5 +++++
 4 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index fc015b452ebf..0cc3ef5b5541 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -229,3 +229,5 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicboz block in bytes.
+
+* :c:macro:`RISCV_HWPROBE_KEY_MTIME_FREQ`: Frequency (in Hz) of `mtime`.
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 630507dff5ea..150a9877b0af 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,7 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 6
+#define RISCV_HWPROBE_MAX_KEY 7
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 7b95fadbea2a..f7d9646ff4ba 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -73,6 +73,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
 #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
+#define RISCV_HWPROBE_KEY_MTIME_FREQ	7
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 83fcc939df67..3fa519035416 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -8,6 +8,7 @@
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
 #include <asm/hwprobe.h>
+#include <asm/delay.h>
 #include <asm/sbi.h>
 #include <asm/switch_to.h>
 #include <asm/uaccess.h>
@@ -226,6 +227,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 			pair->value = riscv_cboz_block_size;
 		break;
 
+	case RISCV_HWPROBE_KEY_MTIME_FREQ:
+		pair->value = riscv_timebase;
+		break;
+
 	/*
 	 * For forward compatibility, unknown keys don't fail the whole
 	 * call, but get their element key set to -1 and value set to 0
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
