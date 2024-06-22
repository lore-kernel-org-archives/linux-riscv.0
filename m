Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB05CC27C4F
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jun 2024 02:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7VJj4SeZkLDvQURXcsDYvSn7uP8jOAEdJuuF1ug0vBY=; b=wrc409yO7TW6mX
	k/c1zfk1vA6mws+VgwH+LtCDbmQ08fj3JOARGaD2xsWbjx81KPdjSyxdzTRqmaf3tVcIdLVNj/EkD
	BFqiIoBHgMrjl5bvKOMs2KwpKYUuLGgula8U+5i+GrSOx1Sgo4unkU5LgbpR4CFAkBeyyfZr9uegW
	5cny7iEeO8Y/NvAl/xymPv+ttjrTI3ltRvezxboYEPKx/8xdMevyvjJh1TuiKpHeSU3Kz1OUvYrwb
	LugV1mNu/WF/090DEoCnKtVdQCqtKCqXd8pbj836EASZXlQVBFXeGFreePEKSC6sI9U91OkIkH5JW
	O/oY/Nlq0kHiYK3F5b2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKquj-0000000BEaX-2wFE;
	Sat, 22 Jun 2024 02:55:41 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKqug-0000000BEZO-03Iy
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jun 2024 02:55:40 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-36dd56cf5f5so9426215ab.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 19:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1719024935; x=1719629735; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5if2KmJRWjBL76ROZgI/17GyYKcY5wCvGdrrlEk4u0Q=;
        b=XsoxBW011gMGFGrI/GRiJKefhYhWV7RYmnWDw8k+/PYj3bLskApZFeobqs/Ak+CihJ
         xb8YPQTr/x2pPJhhFR3tlUQ2Ewx9eVDRe+h0Jx1HsxWEGspbvt871FH4au153GZJCb0U
         r5R89axVMcWO00za4f3HpBrrBMFnJIBF7Mqb6B8v2EHlhMrIet7bldFXzxmZ2LW6WKrJ
         tdj3AY0bYVr6qtpbAsrMFa9FjNBLsLfOtJqol1nyivPxQfFtFu47SBz2uJj6l8Lqe05I
         IXVxTX0HSfGb032DNd9hDWmhh2CoKKK6ZuAa/0D8SvB7RUr+6uQ5ynbvQn6zVAn0J1ka
         cEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719024935; x=1719629735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5if2KmJRWjBL76ROZgI/17GyYKcY5wCvGdrrlEk4u0Q=;
        b=iIB/zCHL8269G0s8G/m1N0FJuv6WW6AvJDHWWaIXlpfMHsbwUUYUmkL69F1YPvDgH7
         EOPNVgrM+FeV0cdu0Nr6YWZwyx1bdkxGnjKqUmrGL9z7ttI4xj3Eikkby0m2yesY0X/X
         X6nyfwbyygT3HC1fmma9VprrAJqdMw0cDZrom4hStamLb15MJnguhdB/yrhors8v4DUf
         vS1IGkldfl05qP6MgsT3djBGocd7THR7uQA18yt6l7wjocLIKGjoqcMOFkYW2rhPJ/PF
         CBjKL9CaNiyCLDFy78LmXZcx7XzNpuWhnT5G0NS+RChAfVmtF9icsngJl1nvFgXc21fC
         wJSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQm5oPHXtchM/YI75qUqP+AfHr894o1c13ocaBe2hplwe82LSwFY2lt7Fewne60vEbg7DxulacM24n5vahmOKRYnsT6y4Ddckd6LgZtTn7
X-Gm-Message-State: AOJu0Yya9QVJfS6AZ8usKcM75+oApDMCfFsVR0bCC72ho2OJfKlhCFQI
	ui4NUc7i6nbuNtjTiUKOMqdDqMAHOu4nbmdV+HMK4mwuuoi37ospyQQ8sCxyBuk=
X-Google-Smtp-Source: AGHT+IEDqRRjk5TKBUDCMz6j3upGcBor/M5o4HP05d0yYUEeFU9td2Hhs5KyDe0neUdvKGxG88q+Sg==
X-Received: by 2002:a05:6e02:1808:b0:375:8a71:4cbf with SMTP id e9e14a558f8ab-3761d708893mr106035865ab.23.1719024935423;
        Fri, 21 Jun 2024 19:55:35 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.253])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-716ba7a0699sm1776286a12.67.2024.06.21.19.55.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 21 Jun 2024 19:55:35 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: jesse@rivosinc.com,
	jrtc27@jrtc27.com,
	corbet@lwn.net,
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
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH v3] RISC-V: Provide the frequency of time CSR via hwprobe
Date: Sat, 22 Jun 2024 10:55:14 +0800
Message-Id: <20240622025514.66537-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_195538_363092_39A236E8 
X-CRM114-Status: GOOD (  11.86  )
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
time CSR.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 Documentation/arch/riscv/hwprobe.rst  | 2 ++
 arch/riscv/include/asm/hwprobe.h      | 2 +-
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 5 +++++
 4 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index df5045103e73..ec3c99474ed7 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -233,3 +233,5 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicboz block in bytes.
+
+* :c:macro:`RISCV_HWPROBE_KEY_TIME_CSR_FREQ`: Frequency (in Hz) of `time CSR`.
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 150a9877b0af..ef01c182af2b 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,7 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 7
+#define RISCV_HWPROBE_MAX_KEY 8
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 2fb8a8185e7a..5053a9b18710 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -74,6 +74,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
 #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
 #define RISCV_HWPROBE_KEY_MISALIGNED_PERF	7
+#define RISCV_HWPROBE_KEY_TIME_CSR_FREQ	8
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index e4ec9166339f..3d47edc04a3f 100644
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
@@ -227,6 +228,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 			pair->value = riscv_cboz_block_size;
 		break;
 
+	case RISCV_HWPROBE_KEY_TIME_CSR_FREQ:
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
