Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6986CFF8864
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 07:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nRm0QrRsTPK3ArcOH/xFIzYT9oqJplNbGQ4blR59Grg=; b=HxFqx83b+NrPqO
	OvXQP8U18H57nwGsKhLDnMaWDy0Ruwsyz9oNFwxHGAeaQoJEV1KxTAE7W8gHMSIVGnZxEXWJcucY7
	VgFrQjbi1R+31wRLMTu2mzXXpJfSO9I+FLeOqIhO96IDFdc9870vOIS3mCeptNE3sKCyTWoLO6+MS
	YSO6XQW2e03xhzaet26wceJu7TAjGP6A2gSeAIDiJpucu3oldSbwqPmr0cvpogq21GFUZth323+AL
	dYqbQaND4uRd/T32lTskkVK7mASRocsBkmizk953aRsPyWBtu3uBXIcIitBydAdpQxmFo3iTen5oN
	+Yk6OD9ZHRxxrPb8ay2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHytt-000000035k6-2uMO;
	Wed, 29 Apr 2026 07:00:01 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHytl-000000035aZ-3kcB
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 06:59:56 +0000
Received: by mail-pg1-x541.google.com with SMTP id 41be03b00d2f7-c70fb6aa323so4333761a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 28 Apr 2026 23:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777445993; x=1778050793; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nuWPT+XdRkD5quZoMJ/j/U0upX+W05bC344BAJoReBo=;
        b=L3nK81GOZXZNhp/3hXpYCJO2FcqXuQokXYf5yFBjqo836PowFhlse4oPppN1mgMUj7
         uXQTjSVFDi9WQqipt2OSquoCbjBlb0SFgo862sswObaTfmsZp+uTZLWPotr8FJ3cPnHO
         MQgjvNvmsv4W+IVKcLb3uUGlbDhn6R5tziyfXhMBwUesO+ooPos+I0ERS+mQX96H2v1L
         jMMtoywn7p062kG0/BmqqxQQ7EgTFgjYUqb5xx/3pwK1aq2tvuNjpD+uNRR3hxUEVFho
         6U2N736v2D1a2FiY457hr4Vn/eU89/23NuHwrADdFPHWR6diD29tIg3XhLSNZeF2eRwD
         sECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777445993; x=1778050793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nuWPT+XdRkD5quZoMJ/j/U0upX+W05bC344BAJoReBo=;
        b=TQ1lldE7vFIHYS9baDFt2lhhhsqtXLxx4PMnt2As+ngJ4umQlsEQsJ8QMzgqJwX31i
         tHGb9ZYehPmtIp7oNKDNagIfLAbgXKFksw9oV1/7FWB0k0Ly/vYVVVJdvLZkcjCIhOMJ
         /pi7mHW7Nc+oCtzVMqozpYHyDqy+RJ7nWwuUXgd/2FaaaBhW1BwPabCJqXNDEL1tK5yC
         IUnXxzvnkcNGKoS+QlLswZkXxY6rI+YTTTXXMmFD8u5nLSY60+xUnONIa0k1PyThRekx
         CYHbVgqEgUtgVdu+Bb4S6LJ78TR9ReCU17B8f481/XwHAE1rduFZ3ztU7byx8IbGXGnL
         h8AQ==
X-Forwarded-Encrypted: i=1; AFNElJ9waU+3klxe26CLgDy9t4zYmB5ejHzvOUCOKn6YA+8h4vloDI+6FbM3c5nuW/ofrqSunpe6OnXshWgrww==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfFrU4IT92OJsNle5PRcFKGthBTMPjfaDmYzYgoGBSSXckawWx
	WnHj/61vUvD+zeE5DnTWEzWxHkOxi8ZOeTSMAxLnHyQpCAdpguof5UYO
X-Gm-Gg: AeBDievDr3G+fuS5mn1r3E21oRdXrVT8URR9mgFObBh/XeBEusqF8cmxjtgbE2wuiVP
	ofq3x6Dlkhbb6Ag2AA14dhv31epqRKQb0NQYA0ixABJU5BUMnzyW4YBPdy6kPHi/k1TXkq9DMm5
	2+h7NRIcTUroCxkgYhKlPP/iv24LVkKDe7gSwgLI2oqlVhIz3FEOQs6TfKSDHWo32q5rHLXFsmN
	fbBkTFFUrD7BJgKrGPT5V0v5Tp5qsdLNEdJJQc12VnNFVSWIKMPYcH/7aBm6A7rGSjrNKrJC2pk
	h/sUdG9UmUyY2O39I//U/lRXxl0BcOr9iwSj8UXC5Z2u78c6zKkXtwQXYZJg8YR+XoUJ05+6ORN
	prjjt1XuV9guAstzRS3RpHJrx4UZC2E7ZAO+jT4umfHgUBHPSb7Rd+mrpup/Ni5UEN7g+VmNULW
	3SJY+8j2S6RGQTMt6a8x8XogX8ZKhFkz2Fzn81SUBrF9eKJQsPcvI4di6263M=
X-Received: by 2002:a05:6a21:33a7:b0:3a2:cc5f:2187 with SMTP id adf61e73a8af0-3a3af541a19mr3029899637.28.1777445993005;
        Tue, 28 Apr 2026 23:59:53 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.28.23.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:59:52 -0700 (PDT)
From: Chen Wandun <chenwandun1@gmail.com>
X-Google-Original-From: Chen Wandun <chenwandun@lixiang.com>
To: kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	chenwandun@lixiang.com,
	zhaomeijing@lixiang.com,
	everyzhao@126.com
Subject: [PATCH 07/11] of: reserved_mem: add no-dump crash_mem exclusion helpers
Date: Wed, 29 Apr 2026 14:58:27 +0800
Message-ID: <20260429065831.1510858-8-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429065831.1510858-1-chenwandun@lixiang.com>
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_235953_994300_8E4A55E0 
X-CRM114-Status: GOOD (  16.71  )
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

Provide two kdump-oriented helpers so that arch kexec_file code does
not have to open-code the no-dump filtering loop:

 - of_reserved_mem_no_dump_nr_ranges() returns the number of reserved
   regions flagged with linux,no-dump. Each exclusion may split one
   existing crash_mem range into two, so callers use this count to
   pre-size their crash_mem allocation.

 - of_reserved_mem_exclude_no_dump() walks the reserved_mem[] array
   and calls crash_exclude_mem_range() for each no-dump region.

Both helpers are guarded by CONFIG_KEXEC_FILE; empty inline stubs are
provided for the !KEXEC_FILE case so architecture code can call them
unconditionally.

The consumers are added in the following arm64, riscv and loongarch
patches in this series.

Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
---
 drivers/of/of_reserved_mem.c    | 54 +++++++++++++++++++++++++++++++++
 include/linux/of_reserved_mem.h | 15 +++++++++
 2 files changed, 69 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 4b80420da2d2..038056a6408a 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -27,6 +27,10 @@
 
 #include "of_private.h"
 
+#ifdef CONFIG_KEXEC_FILE
+#include <linux/crash_core.h>
+#endif
+
 static struct reserved_mem reserved_mem_array[MAX_RESERVED_REGIONS] __initdata;
 static struct reserved_mem *reserved_mem __refdata = reserved_mem_array;
 static int total_reserved_mem_cnt = MAX_RESERVED_REGIONS;
@@ -916,6 +920,56 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
 }
 EXPORT_SYMBOL_GPL(of_reserved_mem_lookup);
 
+#ifdef CONFIG_KEXEC_FILE
+/**
+ * of_reserved_mem_no_dump_nr_ranges() - count reserved regions flagged
+ * with the linux,no-dump property.
+ *
+ * Each such region may split an existing crash_mem range into two when
+ * it is excluded, so callers can use this count to pre-size their
+ * crash_mem allocation.
+ */
+unsigned int of_reserved_mem_no_dump_nr_ranges(void)
+{
+	unsigned int i, n = 0;
+
+	for (i = 0; i < reserved_mem_count; i++)
+		if (reserved_mem[i].no_dump)
+			n++;
+	return n;
+}
+
+/**
+ * of_reserved_mem_exclude_no_dump() - exclude no-dump reserved regions
+ * from a crash_mem list.
+ * @cmem: crash memory list to modify
+ *
+ * Walks the reserved_mem[] array and calls crash_exclude_mem_range() for
+ * every region with no_dump set. Intended to be called from arch kdump
+ * code when constructing the elfcorehdr.
+ *
+ * Returns 0 on success, or a negative error returned by
+ * crash_exclude_mem_range() on the first failure.
+ */
+int of_reserved_mem_exclude_no_dump(struct crash_mem *cmem)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		struct reserved_mem *r = &reserved_mem[i];
+
+		if (!r->no_dump || !r->size)
+			continue;
+		ret = crash_exclude_mem_range(cmem, r->base,
+					      r->base + r->size - 1);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+#endif /* CONFIG_KEXEC_FILE */
+
 /**
  * of_reserved_mem_region_to_resource() - Get a reserved memory region as a resource
  * @np:		node containing 'memory-region' property
diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index 29674f572673..cd0f88f29579 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -8,6 +8,7 @@
 struct of_phandle_args;
 struct reserved_mem_ops;
 struct resource;
+struct crash_mem;
 
 struct reserved_mem {
 	const char			*name;
@@ -94,6 +95,20 @@ static inline int of_reserved_mem_region_count(const struct device_node *np)
 }
 #endif
 
+#if defined(CONFIG_OF_RESERVED_MEM) && defined(CONFIG_KEXEC_FILE)
+unsigned int of_reserved_mem_no_dump_nr_ranges(void);
+int of_reserved_mem_exclude_no_dump(struct crash_mem *cmem);
+#else
+static inline unsigned int of_reserved_mem_no_dump_nr_ranges(void)
+{
+	return 0;
+}
+static inline int of_reserved_mem_exclude_no_dump(struct crash_mem *cmem)
+{
+	return 0;
+}
+#endif
+
 /**
  * of_reserved_mem_device_init() - assign reserved memory region to given device
  * @dev:	Pointer to the device to configure
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
