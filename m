Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F8EC7EE21
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 12:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1J/Vfy5RgiAfiXtMlYtWuMpMJ3guwd7MCFUOeBVo/oo=; b=RWec6KC6/hh8o9
	Ap1ncQszBFSCIpYvK+co4ju2zt+smr7RTFEBobYrTh7gFrzj4yc39eG8ySncNaQmh9FzdS8o11fdx
	F8Qisk5tvjpZHQyM5pqPJjQSPN446XEIpiCz0ws64U/a42galfXXNi4P4W58m9Z3L29Qe5EHNglcf
	eK+UVLsAB+89QRXPvapFX1LTE17BnXuQepbC5ssnhHCGknvNK4F7zgimfdngp6WJV7vkfsrIO5Ppn
	h9wHUhq2ZCGERx2W2MFLp0jzWy6KT1RnW0EsiLue8RA0jhmUXwTjGQ4o0n6ep1vfvES/xSVmq46pI
	ARvnOAXE0IglnTZYvNxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp6io-005JEn-00;
	Wed, 19 Apr 2023 12:15:38 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp5hp-0058Il-2I
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 11:10:36 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-63b5c4c76aaso2295073b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 04:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681902633; x=1684494633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KIa9LYf0ODhdzKLybQD/gUKKX1O1GxO+uhQNo6blW0=;
        b=pUSEDOCWgGuTM6CKmcMbLe7K+VOkG5kdfv7sgvZJDVGFEauQg8GskJ5TTq2rw1I6ez
         a4gXs8myGV03gRZXVVqsyS/7/8DH7w0epDUQ3fvNC7tevtjQjX0gSYw70qXumUZaaFa6
         DH6lCMZCnrzOYMP0MppSRHS0q2PYutLF7G3iwmA9AWub3Qok28lGtTEQVcvehX88Kxzj
         U+7U70eWTaa3h+dXWUwmrKUrXXA+R4glloG/L9M30GuYrk6RwK0JTFwq/4BqBd86WiG4
         uowQOItfzun2u7UVpigFCvFhsY+Q4pjh4qafYnaUIgZfcaXOcwVTIOfBSzvLVMchFfCU
         MtXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681902633; x=1684494633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4KIa9LYf0ODhdzKLybQD/gUKKX1O1GxO+uhQNo6blW0=;
        b=M+uf4rj9zBSqTyQNo/Xt8tAHdFyySnDUmBULd7kpAfwvMvfcEL/9UhgNCLEUHcFViw
         5RSZVIX9R/VZBWMeTjCkbjI+yYM61tVKRTnOwrHSEDrP6+1mgYnhFrXy5NcTuBuVQwtd
         Fz5H9Cp9MQ8t90P4aB66LXsMVTkmSUjhjKdehUw0UFwBrLGpedvSE8NIrpSzSc0Vdq7N
         Rncw9wKcgr693y5VPKRPXMwQO+Ivnua4UV/I1rsmd77d4iOINatAt1g7OahplMP5Kleh
         BsrNyqD1UYvkWuKDVuzrBrYqMda5DTLoPAs0WJN5maiCKH3IdF/jmwpmtYCJ0LH/A9zc
         eoVg==
X-Gm-Message-State: AAQBX9eQYJFkrhHjYRaAHXAkMSHHiDgYsG2YidsykW9HX8r3iau+za5e
	DW3GnFt+tj/sPngjD3rZcFHvk8QllcVcj8vGWIw=
X-Google-Smtp-Source: AKy350alD0YaRVGGNagBcrgS+2r6G4GIg0rKJmQJt7bkhxnweSuXRSxUzkixMdfbGE9ubu0LMJS1wQ==
X-Received: by 2002:a17:902:d4c6:b0:1a6:523c:8583 with SMTP id o6-20020a170902d4c600b001a6523c8583mr5718626plg.68.1681902633050;
        Wed, 19 Apr 2023 04:10:33 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net ([2601:1c2:1800:f680:eaf2:1d7a:7338:16cb])
        by smtp.gmail.com with ESMTPSA id g12-20020a1709026b4c00b001a24cded097sm11180774plt.236.2023.04.19.04.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 04:10:32 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Ved Shanbhogue <ved@rivosinc.com>,
	=?UTF-8?q?Kornel=20Dul=C4=99ba?= <mindal@semihalf.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	Nicolas Pitre <npitre@baylibre.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Peter Newman <peternewman@google.com>,
	x86@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	James Morse <james.morse@arm.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [RFC PATCH 16/21] DO_NOT_MERGE soc: add Foobar SoC cache controller driver
Date: Wed, 19 Apr 2023 04:11:06 -0700
Message-Id: <20230419111111.477118-17-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419111111.477118-1-dfustini@baylibre.com>
References: <20230419111111.477118-1-dfustini@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_041033_762476_35710E69 
X-CRM114-Status: GOOD (  17.33  )
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

Add example driver for a cache controller that implements CBQRI.

Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 drivers/soc/foobar/foobar_cbqri_cache.c | 110 ++++++++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 drivers/soc/foobar/foobar_cbqri_cache.c

diff --git a/drivers/soc/foobar/foobar_cbqri_cache.c b/drivers/soc/foobar/foobar_cbqri_cache.c
new file mode 100644
index 000000000000..e880488243d8
--- /dev/null
+++ b/drivers/soc/foobar/foobar_cbqri_cache.c
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Foobar Systems CBQRI cache controller
+ */
+
+#define pr_fmt(fmt) "foobar-cache: " fmt
+
+#include <linux/device.h>
+#include <linux/of.h>
+#include <linux/riscv_qos.h>
+
+static const struct of_device_id foobar_cbqri_cache_ids[] = {
+	{ .compatible = "foobar,cache-controller" },
+	{ }
+};
+
+static int __init foobar_cbqri_cache_init(void)
+{
+	struct device_node *np;
+	int err;
+	u32 value;
+	struct cbqri_controller_info *ctrl_info;
+
+	for_each_matching_node(np, foobar_cbqri_cache_ids) {
+		if (!of_device_is_available(np)) {
+			of_node_put(np);
+			continue;
+		}
+
+		ctrl_info = kzalloc(sizeof(*ctrl_info), GFP_KERNEL);
+		if (!ctrl_info)
+			goto err_node_put;
+		ctrl_info->type = CBQRI_CONTROLLER_TYPE_CAPACITY;
+
+		err = of_property_read_u32_index(np, "reg", 1, &value);
+		if (err) {
+			pr_err("Failed to read reg base address (%d)", err);
+			goto err_kfree_ctrl_info;
+		}
+		ctrl_info->addr = value;
+
+		err = of_property_read_u32_index(np, "reg", 3, &value);
+		if (err) {
+			pr_err("Failed to read reg size (%d)", err);
+			goto err_kfree_ctrl_info;
+		}
+		ctrl_info->size = value;
+
+		err = of_property_read_u32(np, "cache-level", &value);
+		if (err) {
+			pr_err("Failed to read cache level (%d)", err);
+			goto err_kfree_ctrl_info;
+		}
+		ctrl_info->cache.cache_level = value;
+
+		err = of_property_read_u32(np, "cache-size", &value);
+		if (err) {
+			pr_err("Failed to read cache size (%d)", err);
+			goto err_kfree_ctrl_info;
+		}
+		ctrl_info->cache.cache_size = value;
+
+		err = of_property_read_u32(np, "riscv,cbqri-rcid", &value);
+		if (err) {
+			pr_err("Failed to read RCID count (%d)", err);
+			goto err_kfree_ctrl_info;
+		}
+		ctrl_info->rcid_count = value;
+
+		err = of_property_read_u32(np, "riscv,cbqri-mcid", &value);
+		if (err) {
+			pr_err("Failed to read MCID count (%d)", err);
+			goto err_kfree_ctrl_info;
+		}
+		ctrl_info->mcid_count = value;
+
+		/*
+		 * For CBQRI, any cpu (technically a hart in RISC-V terms)
+		 * can access the memory-mapped registers of any CBQRI
+		 * controller in the system. Therefore, set the CPU mask
+		 * to 'FF' to allow all 8 cores in the example Foobar SoC
+		 */
+		err = cpumask_parse("FF", &ctrl_info->cache.cpu_mask);
+		if (err) {
+			pr_err("Failed to convert cores mask string to cpumask (%d)", err);
+			goto err_kfree_ctrl_info;
+		}
+
+		of_node_put(np);
+
+		pr_debug("addr=0x%lx max-rcid=%u max-mcid=%u level=%d size=%u",
+			 ctrl_info->addr, ctrl_info->rcid_count, ctrl_info->mcid_count,
+			 ctrl_info->cache.cache_level, ctrl_info->cache.cache_size);
+
+		/* Fill the list shared with RISC-V QoS resctrl */
+		INIT_LIST_HEAD(&ctrl_info->list);
+		list_add_tail(&ctrl_info->list, &cbqri_controllers);
+	}
+
+	return 0;
+
+err_kfree_ctrl_info:
+	kfree(ctrl_info);
+
+err_node_put:
+	of_node_put(np);
+
+	return err;
+}
+device_initcall(foobar_cbqri_cache_init);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
