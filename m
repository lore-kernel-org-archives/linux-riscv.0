Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5E0C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 11:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tpcs7FbksCsExAsMiZd6ywj5zNrvPGP4Qq/v5mcfudY=; b=yz6xRQe/W9uIVA
	MD15jyenhfo8LbietIrbWOucVaoDV7erthas8MA74CAPyVyvS0kreFO5Vw/dFNAoC4S6ZzXzTDack
	7QQOrqJsnqlCkF1M6fC0tsk2iA21bAElvXbwQF7Pj8Urd8ZXiooSJ5Riyit3Gj3TAnHbhVYIl2/ld
	mlFssDKU4mw3OWdjkyFdtoWpFziooEctWdTirzWAVfobih7gQvGAyYk/bP2WVFh21PlPENllPLhJk
	JYJgCz+FyLewQFFq91YDQLhgGlhgY4vD6QgzTY41W5T4JbxLxCeEB/ikW/CFy5A+9iZFJeetqXUWb
	FN6k9lU52zckP7uuW9Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp5hc-00588u-0e;
	Wed, 19 Apr 2023 11:10:20 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp5hY-00584t-02
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 11:10:17 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1a69f686345so20889125ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 04:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681902614; x=1684494614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSeKxrM1bks+EefhwDp2KyUEcfeaeDF9wQYuIpi9EW0=;
        b=49f1VRB4kGVGgl4N0u5BK8ILp9SHeHM+SfTX6b8+b51pY3zpNaPJ1K5jK6EgtzX3Y+
         kgWIGu6FPEKFP21/XhNG9ezgg8K2EDcY4BsaH8hKcEgdKBEuXmWAnn7TXhj2pKL8Q80X
         gsM5BK6Q5MzRmp5iQrFFtt4800JiQbPBCGAiDimIVHwL4tXsJ0gdBDYT/3nSwEGUZcEh
         WGOPTVgisYyoEj1/vrQ8+Yu0qA+ueJ9JN+d6q3LauLhlb+RVvV1B/ctylOExID/3S9N4
         IS3ZV6k4Wca8TNpiWs7+F0/PMjynSVx4U5joLQeEYF/fIm9t9xc4G8+hr0OJ8DDfaRLN
         aWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681902614; x=1684494614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iSeKxrM1bks+EefhwDp2KyUEcfeaeDF9wQYuIpi9EW0=;
        b=CpyAfSnEf5TWSsZzZUkdpVwcmbM833HPhP0G8u/ksaJ7SZEtTXyej00cS5d4T8n+wT
         AzeLrr+Sho7GrgJ56evJFmWS1nG4wQQ3h1aS/Rm2pdlTE6/3vKI6ztObtMd5Vi+EMOQt
         usyeduCzOkleEhvHktlSyD+4dy491uZtmW6exg0b/yGLWq4GZvYhaWhaOWwy1IBfOvb5
         pyYx1gEyjMpi+B+ZemKqpE1uCUoIYbrtzcALhYEaTUDb4ik0z1ebnEFi9RlC9J+91ZNt
         GgjCzpV10dJvrpPayYvmbk+3n4lWGhsNNdM9QU3S1WzFsVcm0rYdTpi+cEU/V5cQaj2F
         ShOw==
X-Gm-Message-State: AAQBX9fbXuBO9e37ranKS0dkCN52rS4wz8Feb4lXYoV510Dc+0LHL/wX
	V7lUFj8TH6f9JMv8a2r6FriDAm0uPYOymK2bE/4=
X-Google-Smtp-Source: AKy350YXwjwRD1sLQ1B+t50/t+W8RZ+WsFbplLKM9L7G1ogdxUChyw8fsx9ITeD7FpbPkTpMpgzC+Q==
X-Received: by 2002:a17:902:8d98:b0:1a6:ee5a:7208 with SMTP id v24-20020a1709028d9800b001a6ee5a7208mr4745154plo.18.1681902613761;
        Wed, 19 Apr 2023 04:10:13 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net ([2601:1c2:1800:f680:eaf2:1d7a:7338:16cb])
        by smtp.gmail.com with ESMTPSA id g12-20020a1709026b4c00b001a24cded097sm11180774plt.236.2023.04.19.04.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 04:10:12 -0700 (PDT)
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
Subject: [RFC PATCH 03/21] RISC-V: QoS: define properties of CBQRI controllers
Date: Wed, 19 Apr 2023 04:10:53 -0700
Message-Id: <20230419111111.477118-4-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419111111.477118-1-dfustini@baylibre.com>
References: <20230419111111.477118-1-dfustini@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_041016_050295_5B95AFCE 
X-CRM114-Status: GOOD (  13.64  )
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

Define data structure to represent the CBQRI properties that a driver
for an CBQRI-capable controller would discover during probe.

Each instance of a CBQRI-capable controller is added to a list that the
RISC-V CBQRI resctrl implementation will consume.

Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 include/linux/riscv_qos.h | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 include/linux/riscv_qos.h

diff --git a/include/linux/riscv_qos.h b/include/linux/riscv_qos.h
new file mode 100644
index 000000000000..95016810b575
--- /dev/null
+++ b/include/linux/riscv_qos.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __LINUX_RISCV_QOS_H
+#define __LINUX_RISCV_QOS_H
+
+#include <linux/iommu.h>
+#include <linux/types.h>
+
+#include <asm/qos.h>
+
+enum cbqri_controller_type {
+	CBQRI_CONTROLLER_TYPE_CAPACITY,
+	CBQRI_CONTROLLER_TYPE_BANDWIDTH,
+	CBQRI_CONTROLLER_TYPE_UNKNOWN
+};
+
+struct cbqri_controller_info {
+	unsigned long addr;
+	unsigned long size;
+	enum cbqri_controller_type type;
+	u32 rcid_count;
+	u32 mcid_count;
+	struct list_head list;
+
+	struct cache_controller {
+		int cache_level;
+		u32 cache_size; /* in bytes */
+		struct cpumask cpu_mask;
+	} cache;
+};
+
+extern struct list_head cbqri_controllers;
+
+#endif /* __LINUX_RISCV_QOS_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
