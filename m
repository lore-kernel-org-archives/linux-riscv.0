Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E76DC25B79
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 11:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x20VAhRhVfmGpeKp4aV0d00phvyLKB35mgaXKk7xchU=; b=q4pkGoJ1IQon5T
	ZSwFi95Qidw381XDYHs/Z5iOKROb7WftzDBPtRuXl2wjvFBvT+kBGD73KD57k+mMMq4wju5eM8sma
	p8LmQ0Es0YNQjeHOlRMbzTGpeLyzt6bJbxRMkWNbjhCY9Cj42Dzk8BGE23oxV+I0E/LHbBNMS4t/r
	MUggbVDxyJT6ggG+qx+AehOoPyUAZFsdz5smm4afAoqHqJa2NAnvAOVlUXnduXVUjGorERIly/IBO
	LUaAiXbJKETjdnFcdD9P2MyukFVe472GjYtudusc8Abu/VYRtIoO91hq/R7C7uHQLcq2DHmPBYgPW
	DyiD+usYnNiaK7Ajn55Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA6OS-000000060Fi-37o6;
	Thu, 23 May 2024 11:13:56 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA6ON-000000060Cs-0K1I
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 11:13:53 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1f304533064so13855645ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 May 2024 04:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1716462829; x=1717067629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/f2nZESk5IwUhjcBCwDQD5m6WSIwM88cL3SwI9ltT4Q=;
        b=fWhCuygeBY1Zt5xM7exmOCXEVB2UZiti1vu3NMtf/3p77o5THZhm/rgP4xAv1mNp94
         DGRBXnOZKts/L3ddqPjC4vQLmR5zFf8uliYrWBdkSBfBSyXcuwAvDPQ5tsYUATNM8HoD
         SpjJQojjiwSrJjUny85nQEnX/35EzSauBdVhv19qhDpNpkqU/TIP33Kw1wDlyrY6MVkt
         vgfljjXWv77MYZFINBcoI7dyyXBW+RlM9DrJfWgC5p9M2QNHwPxnCOnUUVlXKfwlnBny
         8bdndRIvBwPwrGw0Eg71mz1yu4Kq08x5jmIBf2rgk80CA7d6eBQEZwB/+7pucJ2xYVhY
         rRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716462829; x=1717067629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/f2nZESk5IwUhjcBCwDQD5m6WSIwM88cL3SwI9ltT4Q=;
        b=mjgVMK2/LE1X5JKQvXUGyk77Zv0woDeDl78cjlsA3gX5hS0wRLB6IZUmyzuHknZh+1
         cQ2N/gj4KjhHMB3OhqXH+E/Mp+NKnl3+B9Ys0JeYGIVLtrKDZWbVEL5sq7A7K6uxidf9
         J1b3c0kIltmv8DOX4mkk1UE10B4eI4tO+jI1Eju5xvp9q2O/Q/ccLYF2Y9l3vLxj7nRF
         EpYtm2pks9v8qc62B13WF1iT6MQwTKh/HpMulnoSTO/RXnReWFe/8Vzt87OmStAu2HoH
         vWGgB7YhIzuZVDK/qzsE7WRvTKQ8jLmdH5OGGMuNgQiJwb46TAigI6lhW8hwWPYHBDJv
         FFEg==
X-Forwarded-Encrypted: i=1; AJvYcCXYxtl66bb3sJHtEnJYm7VDq3NnSC7plLGGpNCFVAMTb1xt5iqL1yrgHA6I2/ecZl/TcJOkPUs34nrqXC+jlqRw2YmYahJ7io3owvX+hkdg
X-Gm-Message-State: AOJu0YykULZk/tzNg9GHlKHJOXfOW4sz7en5ORJafZLNTIdz0qwWShvu
	QRo+wmijKo1kCWlqBtLw5Jr88NW6p5b6JOzvwnpUWTXRBJZyftkxLkbKEvU+y5M=
X-Google-Smtp-Source: AGHT+IGZ11ZGVf2+lfQ+CO04h7/H65xj0+v0lVBzHE9gqd6ctUMXI7IPUiUEZxYjkmeoEd9vNdVmxg==
X-Received: by 2002:a17:902:c942:b0:1f3:830:783e with SMTP id d9443c01a7336-1f339f0d128mr27457195ad.20.1716462829566;
        Thu, 23 May 2024 04:13:49 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f2fb4ca0ebsm76399555ad.119.2024.05.23.04.13.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 May 2024 04:13:49 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: rafael@kernel.org,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	sunilvl@ventanamicro.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	bhelgaas@google.com,
	james.morse@arm.com,
	jeremy.linton@arm.com,
	Jonathan.Cameron@huawei.com,
	pierre.gondois@arm.com,
	sudeep.holla@arm.com,
	tiantao6@huawei.com
Cc: Yunhui Cui <cuiyunhui@bytedance.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH RESEND v5 2/3] riscv: cacheinfo: initialize cacheinfo's level and type from ACPI PPTT
Date: Thu, 23 May 2024 19:13:21 +0800
Message-Id: <20240523111322.19243-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20240523111322.19243-1-cuiyunhui@bytedance.com>
References: <20240523111322.19243-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_041351_227591_1DA58936 
X-CRM114-Status: GOOD (  11.64  )
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

Before cacheinfo can be built correctly, we need to initialize level
and type. Since RISC-V currently does not have a register group that
describes cache-related attributes like ARM64, we cannot obtain them
directly, so now we obtain cache leaves from the ACPI PPTT table
(acpi_get_cache_info()) and set the cache type through split_levels.

Suggested-by: Jeremy Linton <jeremy.linton@arm.com>
Suggested-by: Sudeep Holla <sudeep.holla@arm.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Jeremy Linton <jeremy.linton@arm.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/kernel/cacheinfo.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
index 30a6878287ad..d6c108c50cba 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2017 SiFive
  */
 
+#include <linux/acpi.h>
 #include <linux/cpu.h>
 #include <linux/of.h>
 #include <asm/cacheinfo.h>
@@ -78,6 +79,27 @@ int populate_cache_leaves(unsigned int cpu)
 	struct device_node *prev = NULL;
 	int levels = 1, level = 1;
 
+	if (!acpi_disabled) {
+		int ret, fw_levels, split_levels;
+
+		ret = acpi_get_cache_info(cpu, &fw_levels, &split_levels);
+		if (ret)
+			return ret;
+
+		BUG_ON((split_levels > fw_levels) ||
+		       (split_levels + fw_levels > this_cpu_ci->num_leaves));
+
+		for (; level <= this_cpu_ci->num_levels; level++) {
+			if (level <= split_levels) {
+				ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
+				ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
+			} else {
+				ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
+			}
+		}
+		return 0;
+	}
+
 	if (of_property_read_bool(np, "cache-size"))
 		ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
 	if (of_property_read_bool(np, "i-cache-size"))
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
