Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46390C3064D
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 12:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oayNPq4YZ2zDz+AkolP0Y1G7DVxgDlq52zsg1494KYU=; b=hyyOBLjkWmcky2
	3AKScMXVI8G9sxQoU5SX1cbs+JLI5JsKOOrIHDY2QH763gqXnIoMsUExv+rPdk9r+IESDMAFEwqUe
	5UcuZcL7AvOdxk2L/GaEUdCvueQcLNeqt2pk4kMxULSL3iOOj6/349AhtmxsIVDP3Qtq31l7wK9+V
	kPUM0RXevS4/CPgXHjFYTd1pQCDk4J5XTAf3vJiG6RmljRQFtvgoD00nOBOch2jMStDqwVMlzW19O
	E4ZmcKnvLGDzLSw/Ua4GOgoKTiUu/QJM8pwAEpcC1nDcVC13e0l3b+FyLwQnUD1aXsJClyclgdQti
	M7Uj4b1+ifMOP7FDWm8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLixF-0000000Gn9Z-3hHn;
	Mon, 24 Jun 2024 12:37:53 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLixC-0000000Gn8W-1aEq
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 12:37:52 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1f9cd92b146so33241955ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 05:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1719232668; x=1719837468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zbZyZ7fz7ak/B9v8/rQ3CdUP5dwY5kUtPEgHFuTvKOM=;
        b=Kbv0ZfgF7zRGw3IAXZ70Dztbh3p6DjFv52kdqKzqtGOcC5OLpAzygaujSSBVcv1Igh
         94rzg5Jxuby7rlCdWIkwY5XGcf6NhrncYGtBrMmVOXBiq73aNm3pMgjXbUS9pw+2gKpG
         vJaNwKwHZKEoynkkRR4sj+gfyi6V0QqhDiiYXVbGUFXr/KNVcJqur8bJ91pvSUseAtUU
         aBam9GWiKA2DoyVfT/u35mmP9TR7JOqpFlWjL5i1gwwCmpoIXC5D7Rhq+xxhpZV+qWP3
         5LcwNuoiwtxOhyFGLc4IQX92J11ANy096KhAy4hd8zYxFkNCRaIC3/J3yOFq2KPrRfsO
         nbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719232668; x=1719837468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zbZyZ7fz7ak/B9v8/rQ3CdUP5dwY5kUtPEgHFuTvKOM=;
        b=h9O40iUSSAErMQCuy6PJ5EhSYNZJb1+CAn0PAh+9P2W9vYmX1oSvmCPppzlUqD+zda
         cMSKZp6fW7VSV+yE6rmkRIv46PFsWsnUmo5oRB3Bv8F8cuEkgwXPm+LaavhsaaSX5Jlb
         j9gQUGeAsRPLHDxLdaodHNRNjQDuXINtCDro84Rl9COWoV7PJBRNyRd6YM2iiJVKviX6
         UzbfTP3bphR68SWpyzPlI77UASpt91HLd5w0kehIuQrNXOnA/2XW3zJIv5OdRPIc8AKX
         5wNdyM++6Q5ytPqMrB5wmUnSK7umsC6sLc+D20n7M9epvwJOFvWTq67PEkBSRMcctklp
         wYsA==
X-Forwarded-Encrypted: i=1; AJvYcCXxug4A0ERPeOYtB9h6z2CqB5ymd/gZ3sfZrzTwFo+vQhLFEg2G0y5T3aM7j4SMvQ1hZ/MzQlmELF7OmIN5le+66C+MNuosYS+y3qV+1d1B
X-Gm-Message-State: AOJu0Yy5GfISnHOeerniSZSOrYQonkWc2lEZcrA181lzDnOJBxEz9aW2
	XJLqVJSjxOg1f5FY99LfkGkKtKQxfIWwXKdXPIOy6vIm92fZU3DTG0gKgX0YvI0=
X-Google-Smtp-Source: AGHT+IHJ9F4XF7VGHuPvKjcxxMV8vO98uROcYUIEgAeMFW3fBwLSElryc+wH0ZZPa4HI2F5PgJ5AjA==
X-Received: by 2002:a17:90a:ea17:b0:2c2:df58:bb8c with SMTP id 98e67ed59e1d1-2c8581d4effmr3947874a91.18.1719232668592;
        Mon, 24 Jun 2024 05:37:48 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c738c1b741sm8675666a91.1.2024.06.24.05.37.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 24 Jun 2024 05:37:48 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: charlie@rivosinc.com,
	rppt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alexghiti@rivosinc.com,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	dawei.li@shingroup.cn,
	jszhang@kernel.org,
	namcao@linutronix.de,
	chenjiahao16@huawei.com,
	bjorn@rivosinc.com,
	cuiyunhui@bytedance.com,
	vishal.moola@gmail.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] RISC-V: cmdline: Add support for 'memmap' parameter
Date: Mon, 24 Jun 2024 20:37:39 +0800
Message-Id: <20240624123739.43604-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_053750_774598_F5E4809E 
X-CRM114-Status: GOOD (  10.40  )
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

Add parsing of 'memmap' to use or reserve a specific region of memory.

Implement the following memmap variants:
- memmap=nn[KMG]@ss[KMG]: force usage of a specific region of memory;
- memmap=nn[KMG]$ss[KMG]: mark specified memory as reserved;

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/mm/init.c | 46 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index e3405e4b99af..8e1d93ae5cb2 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -208,6 +208,52 @@ static int __init early_mem(char *p)
 }
 early_param("mem", early_mem);
 
+static void __init parse_memmap_one(char *p)
+{
+	char *oldp;
+	unsigned long start_at, mem_size;
+
+	if (!p)
+		return;
+
+	oldp = p;
+	mem_size = memparse(p, &p);
+	if (p == oldp)
+		return;
+
+	switch (*p) {
+	case '@':
+		start_at = memparse(p + 1, &p);
+		memblock_add(start_at, mem_size);
+		break;
+
+	case '$':
+		start_at = memparse(p + 1, &p);
+		memblock_reserve(start_at, mem_size);
+		break;
+
+	default:
+		pr_warn("Unrecognized memmap syntax: %s\n", p);
+		break;
+	}
+}
+
+static int __init parse_memmap_opt(char *str)
+{
+	while (str) {
+		char *k = strchr(str, ',');
+
+		if (k)
+			*k++ = 0;
+
+		parse_memmap_one(str);
+		str = k;
+	}
+
+	return 0;
+}
+early_param("memmap", parse_memmap_opt);
+
 static void __init setup_bootmem(void)
 {
 	phys_addr_t vmlinux_end = __pa_symbol(&_end);
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
