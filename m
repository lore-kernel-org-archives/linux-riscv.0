Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C303FC54E94
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 15:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B3lUs0pXqP7Hg+paCDL+N+uahsdDsxjyuiF4LBLvWRs=; b=LqbEhDO17WR9+/
	pg0nY2S3zoYkTaKbW08byYEUtv04Xf7kFA+FmstSceHyz/28Jg2z3qYIlVker65tE1CeQCpxtZQjN
	gtUdYhj3CAdWBVqb1919nViz9W3J0aHgUmrCsFFe5t0uPHqlNw3WOLujRKQ7dHsBZHVjivPZ5HBze
	osgYyCKCP3WV9/GZOXueLH6CMd77I/6VK/eINe7aH9hMS/dlTTRTA4ybRo5Lmr8MbICMQAjdEgqC8
	kCHpgu7BV+V3btVItZR7Z5jMgAPM54VAh/8BFyOzj4d2S3qcdI/lnOTdPGwgvYfQO/o1G2bZbvxKJ
	mSfLxiinZv7/lA3RGNkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhjV-007p2I-KG; Wed, 25 Jan 2023 15:30:41 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgeK-007V7q-SX
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 14:21:18 +0000
Received: by mail-pj1-x1033.google.com with SMTP id k10-20020a17090a590a00b0022ba875a1a4so2173950pji.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 06:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bShQ9PSu63qbKXGcKlBChSQ7VtBMrED0U/PQ9VL15gE=;
        b=jINU11TgarzbqAG3dUBW4yFk63eMrTLkYHKUgNEa1kauLINr9BQ/oBG/GNUWxpnYFG
         KTgST9E+iIeoLhSzQI0V3jpf8XXnDJEAV+YROcBW2vyRfG5RFbDahvzuzV73K+AeEkio
         tQolGYH+xawCzsa+384JQ1LwAnIb52vRRP/fohzN3j3bjq0iVkIaHddrqJF4YSCj0YXh
         QRulmzIlXAKGDpVVAochwvosh6/poDidQ9bzo7JpIgOLbO9/ITX1Ov/0iF3MRwh0THrO
         T9vPA6KeFr2ilBjnGP9NqsVY2pEjLiNRHDV/ZBpQuCoT7eADukqAC59HQw5VPF3AsG1x
         sY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bShQ9PSu63qbKXGcKlBChSQ7VtBMrED0U/PQ9VL15gE=;
        b=DKe6q9fw4kr3wqs4FeUQFMICcnpzpZlwtHgEUO5fMbx9hKhE/UkhXjJ/wC9y5pXRdG
         6bXKKHwH6/+pxn8G8+1sGJuykZTa8HbYAnIlVAxmNAmZJ760VGLQi8Jn3sLAkp6q4lp/
         cj+jTapmgjbqfBa4Jqrwi37axA61OPssF2wVPygIh164HHh+BN/PhTk8w9on+qvr1zEb
         DUkhSj30j9pQ+aN7n8bim07GM8vj0KUwVYndC4o2YfJGOcXPqANnkgIBb9rzNfouFWBH
         kx7YzFe5M3q7HLp9FxHgQYCRbCP37ikiLcDeIF4Fp5iQVZKmMgqf2+Ex5Ty4c/y5JI96
         Y/zA==
X-Gm-Message-State: AO0yUKXMWFUXgfLHl+xc8+3N5AyGwfejzNtLY31lOJRzS6VKhRHtA2/F
	73ZIt0RYzQ8dbeY4qnl2tzX6F8jn0kKfOOGMyRFbIvYj2iuqDImXKOoB7ib4WgeKtMk2tzjST+X
	rMtO6Ay/rWRoDtyHD2p3bqTXQFqGkQ+hRBfBGAIUnw2tiDJMaZEGwxZAHfOrJmLVRBhtx2wdFMS
	qAZunsvdc/Fg==
X-Google-Smtp-Source: AK7set+rgD5lUcwy+ia3a8oTMQmOXeKzffyDwx7CywwABIvqEHXyJWEVvh82vkywMCu9PvDHfSDApg==
X-Received: by 2002:a05:6a20:5495:b0:bb:9d1c:ede5 with SMTP id i21-20020a056a20549500b000bb9d1cede5mr7904680pzk.19.1674656475161;
        Wed, 25 Jan 2023 06:21:15 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id bu11-20020a63294b000000b004a3510effa5sm3203520pgb.65.2023.01.25.06.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:21:14 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Guo Ren <ren_guo@c-sky.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko@sntech.de>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Guo Ren <guoren@kernel.org>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Dao Lu <daolu@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Tsukasa OI <research_trasio@irq.a4lg.com>
Subject: [PATCH -next v13 02/19] riscv: Extending cpufeature.c to detect V-extension
Date: Wed, 25 Jan 2023 14:20:39 +0000
Message-Id: <20230125142056.18356-3-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125142056.18356-1-andy.chiu@sifive.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_062116_933698_D7504BB5 
X-CRM114-Status: GOOD (  17.06  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <ren_guo@c-sky.com>

Add V-extension into riscv_isa_ext_keys array and detect it with isa
string parsing.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/asm/hwcap.h      |  4 ++++
 arch/riscv/include/asm/vector.h     | 26 ++++++++++++++++++++++++++
 arch/riscv/include/uapi/asm/hwcap.h |  1 +
 arch/riscv/kernel/cpufeature.c      | 12 ++++++++++++
 4 files changed, 43 insertions(+)
 create mode 100644 arch/riscv/include/asm/vector.h

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 57439da71c77..f413db6118e5 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -35,6 +35,7 @@ extern unsigned long elf_hwcap;
 #define RISCV_ISA_EXT_m		('m' - 'a')
 #define RISCV_ISA_EXT_s		('s' - 'a')
 #define RISCV_ISA_EXT_u		('u' - 'a')
+#define RISCV_ISA_EXT_v		('v' - 'a')
 
 /*
  * Increse this to higher value as kernel support more ISA extensions.
@@ -73,6 +74,7 @@ static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);
 enum riscv_isa_ext_key {
 	RISCV_ISA_EXT_KEY_FPU,		/* For 'F' and 'D' */
 	RISCV_ISA_EXT_KEY_SVINVAL,
+	RISCV_ISA_EXT_KEY_VECTOR,	/* For 'V' */
 	RISCV_ISA_EXT_KEY_ZIHINTPAUSE,
 	RISCV_ISA_EXT_KEY_MAX,
 };
@@ -95,6 +97,8 @@ static __always_inline int riscv_isa_ext2key(int num)
 		return RISCV_ISA_EXT_KEY_FPU;
 	case RISCV_ISA_EXT_SVINVAL:
 		return RISCV_ISA_EXT_KEY_SVINVAL;
+	case RISCV_ISA_EXT_v:
+		return RISCV_ISA_EXT_KEY_VECTOR;
 	case RISCV_ISA_EXT_ZIHINTPAUSE:
 		return RISCV_ISA_EXT_KEY_ZIHINTPAUSE;
 	default:
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
new file mode 100644
index 000000000000..917c8867e702
--- /dev/null
+++ b/arch/riscv/include/asm/vector.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2020 SiFive
+ */
+
+#ifndef __ASM_RISCV_VECTOR_H
+#define __ASM_RISCV_VECTOR_H
+
+#include <linux/types.h>
+
+#ifdef CONFIG_RISCV_ISA_V
+
+#include <asm/hwcap.h>
+
+static __always_inline bool has_vector(void)
+{
+	return static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_VECTOR]);
+}
+
+#else /* ! CONFIG_RISCV_ISA_V  */
+
+static __always_inline bool has_vector(void) { return false; }
+
+#endif /* CONFIG_RISCV_ISA_V */
+
+#endif /* ! __ASM_RISCV_VECTOR_H */
diff --git a/arch/riscv/include/uapi/asm/hwcap.h b/arch/riscv/include/uapi/asm/hwcap.h
index 46dc3f5ee99f..c52bb7bbbabe 100644
--- a/arch/riscv/include/uapi/asm/hwcap.h
+++ b/arch/riscv/include/uapi/asm/hwcap.h
@@ -21,5 +21,6 @@
 #define COMPAT_HWCAP_ISA_F	(1 << ('F' - 'A'))
 #define COMPAT_HWCAP_ISA_D	(1 << ('D' - 'A'))
 #define COMPAT_HWCAP_ISA_C	(1 << ('C' - 'A'))
+#define COMPAT_HWCAP_ISA_V	(1 << ('V' - 'A'))
 
 #endif /* _UAPI_ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index dde0e91d7668..c433899542ff 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -101,6 +101,7 @@ void __init riscv_fill_hwcap(void)
 	isa2hwcap['f' - 'a'] = COMPAT_HWCAP_ISA_F;
 	isa2hwcap['d' - 'a'] = COMPAT_HWCAP_ISA_D;
 	isa2hwcap['c' - 'a'] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap['v' - 'a'] = COMPAT_HWCAP_ISA_V;
 
 	elf_hwcap = 0;
 
@@ -256,6 +257,17 @@ void __init riscv_fill_hwcap(void)
 		elf_hwcap &= ~COMPAT_HWCAP_ISA_F;
 	}
 
+	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
+#ifndef CONFIG_RISCV_ISA_V
+		/*
+		 * ISA string in device tree might have 'v' flag, but
+		 * CONFIG_RISCV_ISA_V is disabled in kernel.
+		 * Clear V flag in elf_hwcap if CONFIG_RISCV_ISA_V is disabled.
+		 */
+		elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
+#endif
+	}
+
 	memset(print_str, 0, sizeof(print_str));
 	for (i = 0, j = 0; i < NUM_ALPHA_EXTS; i++)
 		if (riscv_isa[0] & BIT_MASK(i))
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
