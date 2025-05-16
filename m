Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D41C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 16 May 2025 03:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UYbRT9LAefvEsorOGWDEv529fwxKEShawj2Qun8Z0rQ=; b=XDUpxS3Gqwqm3O
	g/n4YRo40JFgAezwJH9que1iOqTZRUVbAflQsNyehxhUTKEmdhzzRO6eYE+5h1QWNqD6JfPeRcFxb
	bZziX0fdrvx0IwMA25lzhZ2m9K60RUZ3YucwSK3bsRoqUaAEKRBpuxtcb/VD5VRCeZixEGtfP74C3
	OFNBkLQwwcUW/wspZCrZ+QB8kF9a1e/B4q+u9iKHNYRq9pAuF5seqHZvpe5/lYua5tcoHOfQs4SFP
	kvaNZk6G6QzJcuHx5B6EF0tKetoqKj8+S9O23t4w+Nw6n260tjkGS5p7EIKl0w/0rdaP1+fhu9fJU
	SkQ5Pk7ufTCmcYRDC8og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFlOL-00000002Jvz-1X9v;
	Fri, 16 May 2025 03:05:45 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFlOJ-00000002Jui-18jo
	for linux-riscv@lists.infradead.org;
	Fri, 16 May 2025 03:05:44 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22e661313a3so19178675ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 20:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747364742; x=1747969542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6ciFGfibwQSe7Dz2z8LF3Oi63gmDdi7aOYsraaH6S0=;
        b=nC+FrO7l6HsNllUFAqRWJJ/pmvyo/FqR9LlmfnDCupGn3luSIewfgi6+MGjSCpePmg
         loSdLKkhdsBvc1bbYklKSeOkhIaW42cDpIfqyLGHs75U7rp+bxIjC1bykAaF8IQdLvzb
         FgY7p05BZWFSZSLvRNYle84xlVg04Hd+/aKUExvdPZXpRwCcIXqJtNo82m85SBBN00qD
         97/5yXSglLmy/mbLZnta0DKIObcr+3Rm11lbjyS/xiEOSkf0Oig0+yI04KQfImUz7Apa
         Dv4R9LgwG9SiahfSdGDqgDxch6nN2+QWoaMIKR5gi382F1qMe9C3/SdRxVpS/Nn56mc5
         ohXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747364742; x=1747969542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y6ciFGfibwQSe7Dz2z8LF3Oi63gmDdi7aOYsraaH6S0=;
        b=e1oEUe0Vmtv5E3rtNxZYAtjCJ1R+o18JmbcU88mWlhzefDLvYxWw7hfQpo1F4xXymj
         kovlxZv+f1E4EQz9pEGMOV0+T41JD7ISYwNXAfvvcetVQevNhhZeqsMC7r+MdcDFBlHg
         WN9/Mg1gp6xjgTdeH3DMSzuvafAQI5WyZWtNGHZd3z1aSSIeFtLGpId6CE5Ek0oGCA45
         Zms4+Y4ZBynw9FGJT0GIQAgBTg/OSrb+1FlDCUBJ1wQE1OfhsyHBBrWyvXExL260JvjM
         btVh3CmpX+7HKy5bqUFVRy2PqVhpKfvtfmBhITbCR/yXIvECEw+BaZ1tZCbVoGtec1Xv
         TkqA==
X-Forwarded-Encrypted: i=1; AJvYcCWkVtnyng0rwzdtvJ8nxBLDmFfLz9jCz/p0axb3qF7Aqdg7mAy9eQDVE/1RybpJud/jtJz20ioOVrC8Vg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4sUmSkFwhLco62MbSN+/ZJMXxLXWDY+uQHR0Ptrq+MQW4nXmc
	/f5IM/iHeucf+Q7EwayT1zXsowKlVaDgS9YRuKBnrchMY8ulT7aW91JdK697oL+Hb1g=
X-Gm-Gg: ASbGnctbDjCCngPbK9ZyOj1TqObZ26VPbyn3B1ofLYYmo7ssCYIeM9hm1wr87JWvZBg
	vSBJKKPtFU+9D9oTLunB7SgRqbNCC7C5WsgXSEXAMZb3m88NsMG4+hDMg+KN0Gt3MJb5XP2yKcb
	0GkIUNZmAbmdIDoPIuzPD7S1v9i+Pan1OAX/bY7Hi6IKTH+EG0It5yysDmoT3hwjZ6v7qOdRK5z
	6Hir7/Op19VDAkxftn9h8Wr1W/QZt/PxrzZuKSHTMA72HQOY6J7GIMB5Ylevv/VDtIQV4TWReVq
	yzREpOQmQLa6fyP0zcFaOT3q4xpt3069ArlujmKhDCYJBPckfWRDIGgG1kBhk8t/YXFIEVGejjf
	/A/fnb+3/JSDjUhUgv83qiw==
X-Google-Smtp-Source: AGHT+IHHAN9KUlQpyndVpMdv3EmGeRNRqlG+KvGrOQcL5JQgzWEKTPLq/Qbd2zlHxnE/jzbP8gbRYw==
X-Received: by 2002:a17:902:d543:b0:22e:4cae:5965 with SMTP id d9443c01a7336-231de37664bmr12056405ad.29.1747364742397;
        Thu, 15 May 2025 20:05:42 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm4804405ad.201.2025.05.15.20.05.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:05:41 -0700 (PDT)
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
Subject: [PATCH v2 02/12] riscv: Add SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions
Date: Fri, 16 May 2025 11:03:00 +0800
Message-Id: <20250516030310.16950-3-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250516030310.16950-1-cyan.yang@sifive.com>
References: <20250516030310.16950-1-cyan.yang@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_200543_313429_3A63721C 
X-CRM114-Status: GOOD (  17.09  )
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

Add SiFive vendor extension support to the kernel with the target of
"xsfvqmaccdod" and "xsfvqmaccqoq".

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 arch/riscv/Kconfig.vendor                     | 13 +++++++++++++
 .../include/asm/vendor_extensions/sifive.h    | 14 ++++++++++++++
 arch/riscv/kernel/vendor_extensions.c         | 10 ++++++++++
 arch/riscv/kernel/vendor_extensions/Makefile  |  1 +
 arch/riscv/kernel/vendor_extensions/sifive.c  | 19 +++++++++++++++++++
 5 files changed, 57 insertions(+)
 create mode 100644 arch/riscv/include/asm/vendor_extensions/sifive.h
 create mode 100644 arch/riscv/kernel/vendor_extensions/sifive.c

diff --git a/arch/riscv/Kconfig.vendor b/arch/riscv/Kconfig.vendor
index b096548fe0ff..e14f26368963 100644
--- a/arch/riscv/Kconfig.vendor
+++ b/arch/riscv/Kconfig.vendor
@@ -16,6 +16,19 @@ config RISCV_ISA_VENDOR_EXT_ANDES
 	  If you don't know what to do here, say Y.
 endmenu
 
+menu "SiFive"
+config RISCV_ISA_VENDOR_EXT_SIFIVE
+	bool "SiFive vendor extension support"
+	select RISCV_ISA_VENDOR_EXT
+	default y
+	help
+	  Say N here if you want to disable all SiFive vendor extension
+	  support. This will cause any SiFive vendor extensions that are
+	  requested by hardware probing to be ignored.
+
+	  If you don't know what to do here, say Y.
+endmenu
+
 menu "T-Head"
 config RISCV_ISA_VENDOR_EXT_THEAD
 	bool "T-Head vendor extension support"
diff --git a/arch/riscv/include/asm/vendor_extensions/sifive.h b/arch/riscv/include/asm/vendor_extensions/sifive.h
new file mode 100644
index 000000000000..608004250e2e
--- /dev/null
+++ b/arch/riscv/include/asm/vendor_extensions/sifive.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_VENDOR_EXTENSIONS_SIFIVE_H
+#define _ASM_RISCV_VENDOR_EXTENSIONS_SIFIVE_H
+
+#include <asm/vendor_extensions.h>
+
+#include <linux/types.h>
+
+#define RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD		0
+#define RISCV_ISA_VENDOR_EXT_XSFVQMACCQOQ		1
+
+extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_sifive;
+
+#endif
diff --git a/arch/riscv/kernel/vendor_extensions.c b/arch/riscv/kernel/vendor_extensions.c
index 9feb7f67a0a3..92d8ff81f42c 100644
--- a/arch/riscv/kernel/vendor_extensions.c
+++ b/arch/riscv/kernel/vendor_extensions.c
@@ -6,6 +6,7 @@
 #include <asm/vendorid_list.h>
 #include <asm/vendor_extensions.h>
 #include <asm/vendor_extensions/andes.h>
+#include <asm/vendor_extensions/sifive.h>
 #include <asm/vendor_extensions/thead.h>
 
 #include <linux/array_size.h>
@@ -15,6 +16,9 @@ struct riscv_isa_vendor_ext_data_list *riscv_isa_vendor_ext_list[] = {
 #ifdef CONFIG_RISCV_ISA_VENDOR_EXT_ANDES
 	&riscv_isa_vendor_ext_list_andes,
 #endif
+#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE
+	&riscv_isa_vendor_ext_list_sifive,
+#endif
 #ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
 	&riscv_isa_vendor_ext_list_thead,
 #endif
@@ -45,6 +49,12 @@ bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsig
 		cpu_bmap = riscv_isa_vendor_ext_list_andes.per_hart_isa_bitmap;
 		break;
 	#endif
+	#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE
+	case SIFIVE_VENDOR_ID:
+		bmap = &riscv_isa_vendor_ext_list_sifive.all_harts_isa_bitmap;
+		cpu_bmap = riscv_isa_vendor_ext_list_sifive.per_hart_isa_bitmap;
+		break;
+	#endif
 	#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
 	case THEAD_VENDOR_ID:
 		bmap = &riscv_isa_vendor_ext_list_thead.all_harts_isa_bitmap;
diff --git a/arch/riscv/kernel/vendor_extensions/Makefile b/arch/riscv/kernel/vendor_extensions/Makefile
index 866414c81a9f..d5fdde0e863b 100644
--- a/arch/riscv/kernel/vendor_extensions/Makefile
+++ b/arch/riscv/kernel/vendor_extensions/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_ANDES)	+= andes.o
+obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE)	+= sifive.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead_hwprobe.o
diff --git a/arch/riscv/kernel/vendor_extensions/sifive.c b/arch/riscv/kernel/vendor_extensions/sifive.c
new file mode 100644
index 000000000000..6042cc3021de
--- /dev/null
+++ b/arch/riscv/kernel/vendor_extensions/sifive.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <asm/cpufeature.h>
+#include <asm/vendor_extensions.h>
+#include <asm/vendor_extensions/sifive.h>
+
+#include <linux/array_size.h>
+#include <linux/types.h>
+
+/* All SiFive vendor extensions supported in Linux */
+static const struct riscv_isa_ext_data riscv_isa_vendor_ext_sifive[] = {
+	__RISCV_ISA_EXT_DATA(xsfvqmaccdod, RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD),
+	__RISCV_ISA_EXT_DATA(xsfvqmaccqoq, RISCV_ISA_VENDOR_EXT_XSFVQMACCQOQ),
+};
+
+struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_sifive = {
+	.ext_data_count = ARRAY_SIZE(riscv_isa_vendor_ext_sifive),
+	.ext_data = riscv_isa_vendor_ext_sifive,
+};
-- 
2.39.5 (Apple Git-154)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
