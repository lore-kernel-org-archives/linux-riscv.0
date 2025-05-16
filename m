Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E198C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 16 May 2025 03:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rSRjCF+tZZdYQ9SGreH8SeWw+Jb6hYNfuZR3DyBaTuY=; b=XeZafAydK2qY51
	ZmAiLkMlYbhaU/cwYinNKlUcWjUpAG5rm3lA7bWqqsMFgkJ09sf0fOpTr0l5WljaBMWI9h9ggKCeI
	Ap6ZFbnlsEQgJtrspnvrn8VFq9W9UKgI9XysZhHPSAWoDmovz2Jp6CD9CRdDpL5hY5XTRIeYmWfkM
	J6Qh7Rq/VPdcy+MKj5wcNsNmMuiIWBabRaHmAEQKxDWVzAeN3oGk5ORz7hvsLkQujpymINakYG7UV
	/jVKobIu7h82q9MIvS6Eh2V7Eae4PdQob8/TKj2dJfoVNypGUN8i+TyFyj3oG81bKq8ddC1jWMAwg
	KV5E8ATKsfcvV6HHuLZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFlOR-00000002Jz1-2S37;
	Fri, 16 May 2025 03:05:51 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFlOP-00000002Jxb-1Oy7
	for linux-riscv@lists.infradead.org;
	Fri, 16 May 2025 03:05:50 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-22c33677183so15632585ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 20:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747364748; x=1747969548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Vt4avVN1JMW1dLLTypBf6HyDWimdmGBTky31Gipgqs=;
        b=KtWWfoYYFXbXOqTBjMRfzCqTqQPTfk8miM+qyP+nuAMi1RdmlXJ+Yo2EJqIYKZnk1W
         wTpW/qdhKYmDMrgZ5vzolf3RqPImp1glWAa9Oj2WFLlclZUvV1LnBsxdZk8VY4yzMgZA
         GJrZH9ra/3XylIy2DjIHWTTc+s0eor0kD6Q/PqwEu4O7WObwSGLO/JRpRlrN6DxuEZTs
         xcyBLdv7A57z6DULERWQnV90rsV4u9Sf/XLw9fbDSj97PM9wvPAu6jTOiMUM7nfqp2E0
         WOqsas5TMkiJmaVSJr4Ego1oiSGXUl2N4onrvmq3mYIrGofM5y+pv2WtvwIAQPmG4YA9
         Dvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747364748; x=1747969548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Vt4avVN1JMW1dLLTypBf6HyDWimdmGBTky31Gipgqs=;
        b=XCX4VlV54+iJ4dm7TZs0gLuRQkqiVs9vfpic7bcdGI6IFpe/LPYXKmsX2HE/MVhtJ3
         E7tAK23vFAC2zZq/QPdWen6UjhyyMOAQrDF3t/rCF46UAw8rcf/XY4owUER8JW8AEF5d
         t7HkInDIrmgNC5lUrmflEaf2pZo7QFDrwLuCdWQnLyXL34o+BMfbaG2/TNQE9MLzbGnM
         a8zopWvr1weyT0dDMaAgwSBtloyAJMZoONL5GGCi+q9vxcQjKAuXj3JdwH37cHiqHe9V
         Uz6h8yuMf6ZrPGbJTln3FQorgL1SLo7QAif5l0OoaZEMI9KI2iubPNzvGGHUPoS7rlQQ
         LYuw==
X-Forwarded-Encrypted: i=1; AJvYcCVf8ldalkejajaAINbVnoWSBlB8v9BcYG/Nr5mohbdVeLVJLhp2jyW6KxyXB1PerKbTGWzDQGt2h+cgPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMuh7gsdZRCPDb9bcLoA8S5QubRz6OqII6XX7v5CKjGLp3LOBb
	abtyjHHfTdEf0JVwyWcCHA/wsxfOjgRi3Af3gqY1k9dBY6hFvOrTU0JQNCAYBBtMBbs=
X-Gm-Gg: ASbGncutHtfJsJlb7PULjwYbx0twRdFyQIWW++ipv+Kck1qeRsX1OjuYR4O+H7xez0X
	FNTPokBMoXkcpqx2SKFuABpU5cVQ/bn4H3IYCrxwvk3n+nGk4g6NUIQlZEdtRvpt86opejAjNyk
	vBRQgkSnEQW1hdTuBS1jHKS6aweK4IEvRTYDLNXYsVdtwDT3dYiUHKVE2dzLg/w+7Bvn1499ToR
	UYz1x7KU08+i6VvSI7XYfZaNDC8iXh0f1E14aSPMAO0eQv9Y6Zg9Q7MsZ7XAiXdQM3zSKXtG82C
	ReDmvvUSovBaDPswmQkhIi5JyZhLZw1D4HmJG6DGhjq+Ie8HnCkRqHFKiIWqLUCl85k4Yqtcg87
	MqMeDnoOZA2DF+X6RlygSyw==
X-Google-Smtp-Source: AGHT+IFrDHDI6jFyMdlNAcCJx/pSir2AtLkYuzD7zLd9+Mx8cd+OY5EwjsAwoSuuGlRkVPdDwKz98Q==
X-Received: by 2002:a17:903:32ce:b0:21f:6fb9:9299 with SMTP id d9443c01a7336-231de375e8cmr9043405ad.27.1747364748415;
        Thu, 15 May 2025 20:05:48 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm4804405ad.201.2025.05.15.20.05.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:05:47 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>
Subject: [PATCH v2 04/12] riscv: hwprobe: Add SiFive vendor extension support and probe for xsfqmaccdod and xsfqmaccqoq
Date: Fri, 16 May 2025 11:03:02 +0800
Message-Id: <20250516030310.16950-5-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250516030310.16950-1-cyan.yang@sifive.com>
References: <20250516030310.16950-1-cyan.yang@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_200549_379126_4A810816 
X-CRM114-Status: GOOD (  14.79  )
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

Add a new hwprobe key "RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0" which allows
userspace to probe for the new vendor extensions from SiFive. Also, add
new hwprobe for SiFive "xsfvqmaccdod" and "xsfvqmaccqoq" vendor
extensions.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 arch/riscv/include/asm/hwprobe.h              |  1 +
 .../asm/vendor_extensions/sifive_hwprobe.h    | 19 ++++++++++++++++++
 arch/riscv/include/uapi/asm/vendor/sifive.h   |  4 ++++
 arch/riscv/kernel/sys_hwprobe.c               |  5 +++++
 arch/riscv/kernel/vendor_extensions/Makefile  |  1 +
 .../kernel/vendor_extensions/sifive_hwprobe.c | 20 +++++++++++++++++++
 6 files changed, 50 insertions(+)
 create mode 100644 arch/riscv/include/asm/vendor_extensions/sifive_hwprobe.h
 create mode 100644 arch/riscv/include/uapi/asm/vendor/sifive.h
 create mode 100644 arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c

diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 1c6977305776..7fe0a379474a 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -22,6 +22,7 @@ static inline bool hwprobe_key_is_bitmask(__s64 key)
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:
 	case RISCV_HWPROBE_KEY_CPUPERF_0:
 	case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
+	case RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0:
 		return true;
 	}
 
diff --git a/arch/riscv/include/asm/vendor_extensions/sifive_hwprobe.h b/arch/riscv/include/asm/vendor_extensions/sifive_hwprobe.h
new file mode 100644
index 000000000000..90a61abd033c
--- /dev/null
+++ b/arch/riscv/include/asm/vendor_extensions/sifive_hwprobe.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_VENDOR_EXTENSIONS_SIFIVE_HWPROBE_H
+#define _ASM_RISCV_VENDOR_EXTENSIONS_SIFIVE_HWPROBE_H
+
+#include <linux/cpumask.h>
+
+#include <uapi/asm/hwprobe.h>
+
+#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE
+void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe *pair, const struct cpumask *cpus);
+#else
+static inline void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe *pair,
+						   const struct cpumask *cpus)
+{
+	pair->value = 0;
+}
+#endif
+
+#endif
diff --git a/arch/riscv/include/uapi/asm/vendor/sifive.h b/arch/riscv/include/uapi/asm/vendor/sifive.h
new file mode 100644
index 000000000000..f25d8cf110d1
--- /dev/null
+++ b/arch/riscv/include/uapi/asm/vendor/sifive.h
@@ -0,0 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+
+#define	RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCDOD		(1 << 0)
+#define	RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCQOQ		(1 << 1)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 249aec8594a9..138e74f05de7 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -15,6 +15,7 @@
 #include <asm/uaccess.h>
 #include <asm/unistd.h>
 #include <asm/vector.h>
+#include <asm/vendor_extensions/sifive_hwprobe.h>
 #include <asm/vendor_extensions/thead_hwprobe.h>
 #include <vdso/vsyscall.h>
 
@@ -300,6 +301,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		pair->value = riscv_timebase;
 		break;
 
+	case RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0:
+		hwprobe_isa_vendor_ext_sifive_0(pair, cpus);
+		break;
+
 	case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
 		hwprobe_isa_vendor_ext_thead_0(pair, cpus);
 		break;
diff --git a/arch/riscv/kernel/vendor_extensions/Makefile b/arch/riscv/kernel/vendor_extensions/Makefile
index d5fdde0e863b..a4eca96d1c8a 100644
--- a/arch/riscv/kernel/vendor_extensions/Makefile
+++ b/arch/riscv/kernel/vendor_extensions/Makefile
@@ -2,5 +2,6 @@
 
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_ANDES)	+= andes.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE)	+= sifive.o
+obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE)	+= sifive_hwprobe.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead_hwprobe.o
diff --git a/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c b/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
new file mode 100644
index 000000000000..461ce0f305ce
--- /dev/null
+++ b/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <asm/vendor_extensions/sifive.h>
+#include <asm/vendor_extensions/sifive_hwprobe.h>
+#include <asm/vendor_extensions/vendor_hwprobe.h>
+
+#include <linux/cpumask.h>
+#include <linux/types.h>
+
+#include <uapi/asm/hwprobe.h>
+#include <uapi/asm/vendor/sifive.h>
+
+void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe *pair, const struct cpumask *cpus)
+{
+	VENDOR_EXTENSION_SUPPORTED(pair, cpus,
+				   riscv_isa_vendor_ext_list_sifive.per_hart_isa_bitmap, {
+		VENDOR_EXT_KEY(XSFVQMACCDOD);
+		VENDOR_EXT_KEY(XSFVQMACCQOQ);
+	});
+}
-- 
2.39.5 (Apple Git-154)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
