Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD47BC6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 11:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PRA+6qbbVCv989P5SA30LJgF498TMc929egRzQStjCk=; b=FFKGnyjDddd/6/
	JrIixAdMZcLzQjA0jdgxRHLj0AMA1qxF5t4l0dTJdcxaYBhUO1CEiKyjx73SzEclHDNLFh8JGdVsY
	3El2ARjHfZRnEZsay4A9wM/qWvaI6fclhiOnp0wysB2y7dVYfnQfYMHO2YNF+JyabctXLS4lmviO0
	LIj6TnSYjTo7xr5Jctr2lVDsioVdiT8X5hwbb0wqdn+od4UX1fnQBOPCI+MsBoIF4xfGXOq1hRUtN
	y2ZjQpzRVwOHeW5xF4fCZRsMMTnE3kab3to5K1iojkzzZgL/saePJlglzdEI6KFJdpPHPVvCATcEi
	7QMSA4AGpYw8YPPSRmrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp6Fc-005E3Y-0D;
	Wed, 19 Apr 2023 11:45:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp6Fa-005E3F-0L
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Apr 2023 11:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=8VRpPNkDuAyz+Ft5imrcs9KDU5p5mtKUYR9cIj3QRd4=; b=iPOHcttdQWpR7jE3yI55MPOIec
	8Pgjr0hX2Fe9eSKxN5fc1wB/OyIPPFwk7Sd+iLfBGRKlATFEJHczQ41s+SB/jkUlbGCobVYeJqf5Z
	5cErZXfuDqGApPqILrJJWbMZrtQNeBCOVT3cYz+Y2CnPX2/3ZWOPDXR1wPAa+6kjDmGAxB+1d+5rp
	uSYlszp1kBLAwxjqd2gmOaiYlRPgT7nRckzv2gimd213azj2d37vwHdsZbpXynALuD4x7utdqiXQB
	KTdNV/PwIexK0EY+4rSbql0Wdt18GDnpMDgRNJBBwrLKVbzBM0d/gWRN81NdbEO2BSKzKbw2o3+4y
	tzk5XeXA==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp5hs-001sOg-38
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 11:10:39 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1a645fd0c6dso24014545ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 04:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681902634; x=1684494634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VRpPNkDuAyz+Ft5imrcs9KDU5p5mtKUYR9cIj3QRd4=;
        b=x/8pGfsLNTo4M60IL76aQ5x040uI2InLj1/EScIFp6VYlhbjP5l3eNVgN+y4avjRTt
         H5fzYWvVhJT2Rq7bzjd2zo6SGa9b70+iPd7q+BYZOfnbxUKSB2gBI+v9EID/w220Xv6A
         ogg1jlEVmqJYIyFKd2qTHBIQq91+m87zuaTfEpDGjS4JjD5plCp7XDP57KjGuKZ+kOiN
         SVYdRu2DZSdcypVQLwcCpNb8l4lKH0jilJ++oP1hk4KiAaDnMtqJcq8eN39x6hZzCeaP
         j6FiQUn7+p1qacItyHJxcwZOT4dU4m7qvkAF3FVlQoqYsjD4V5HP3V7p3ikdeOowNAkl
         8kWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681902634; x=1684494634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8VRpPNkDuAyz+Ft5imrcs9KDU5p5mtKUYR9cIj3QRd4=;
        b=c99Y2snmy76vrNTnUBXwQ2apjODyFPGE7m2cDSY9AIXUgNb4v22MwBcgIUig2nc7hI
         /RvOa6n3c7I0L7FVcAMVOMbqjyHWccF8ONQNcVTD0xbkQtsx1B2kd/wOun6meYRL8lBL
         0zPXVfeQ5kA4yN9QtwgMEwXlfEgpIajuH/XJYYXuEOlyQBD+48QL0R509rasQD+V2+fz
         LuHTtPsam550bgOmqb6p9VyvaLfOq8G3PEpiqOZj5lT2svM7pil1xhtpz6XVbbayRX6C
         WhjL0CAXaYQ1yXprZJZDvNYVGuPXOlu0YSv1Fo9EFN5G8PX4C3wiu2NrzEICqkEolF9r
         Qh3g==
X-Gm-Message-State: AAQBX9eKdp9Wn9MdOIRaNW6sT6NOPfe/di4U1yroNoquOK/RmfYR6Man
	Q1E8zyBhL/rFxTt19ZPr1sI0+U0ZP3b6PSCPbQs=
X-Google-Smtp-Source: AKy350boG05NBC+OyMdfVB4g1lkdqwK+pdBb8M8du2YV2tJ6Pxg4DvMv0hsz2y7ET8IQwFhAUURrrw==
X-Received: by 2002:a17:902:db0f:b0:1a1:a9a4:ba26 with SMTP id m15-20020a170902db0f00b001a1a9a4ba26mr5908976plx.8.1681902634412;
        Wed, 19 Apr 2023 04:10:34 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net ([2601:1c2:1800:f680:eaf2:1d7a:7338:16cb])
        by smtp.gmail.com with ESMTPSA id g12-20020a1709026b4c00b001a24cded097sm11180774plt.236.2023.04.19.04.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 04:10:33 -0700 (PDT)
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
Subject: [RFC PATCH 17/21] DO_NOT_MERGE soc: add Foobar SoC memory controller driver
Date: Wed, 19 Apr 2023 04:11:07 -0700
Message-Id: <20230419111111.477118-18-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419111111.477118-1-dfustini@baylibre.com>
References: <20230419111111.477118-1-dfustini@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_121037_186078_5F6BB143 
X-CRM114-Status: GOOD (  15.99  )
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

Add example driver for a SoC memory controller that implements CBQRI.

Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 drivers/soc/foobar/foobar_cbqri_memory.c | 83 ++++++++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 drivers/soc/foobar/foobar_cbqri_memory.c

diff --git a/drivers/soc/foobar/foobar_cbqri_memory.c b/drivers/soc/foobar/foobar_cbqri_memory.c
new file mode 100644
index 000000000000..0a0c542a25e1
--- /dev/null
+++ b/drivers/soc/foobar/foobar_cbqri_memory.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Foobar Systems CBQRI memory controller
+ */
+
+#define pr_fmt(fmt) "foobar-mem: " fmt
+
+#include <linux/device.h>
+#include <linux/of.h>
+#include <linux/riscv_qos.h>
+
+static const struct of_device_id foobar_cbqri_memory_ids[] = {
+	{ .compatible = "foobar,memory-controller" },
+	{ }
+};
+
+static int __init foobar_cbqri_memory_init(void)
+{
+	struct device_node *np;
+	int err;
+	u32 value;
+	struct cbqri_controller_info *ctrl_info;
+
+	for_each_matching_node(np, foobar_cbqri_memory_ids) {
+		if (!of_device_is_available(np)) {
+			of_node_put(np);
+			continue;
+		}
+
+		ctrl_info = kzalloc(sizeof(*ctrl_info), GFP_KERNEL);
+		if (!ctrl_info)
+			goto err_node_put;
+		ctrl_info->type = CBQRI_CONTROLLER_TYPE_BANDWIDTH;
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
+		of_node_put(np);
+
+		pr_debug("addr=0x%lx max-rcid=%u max-mcid=%u", ctrl_info->addr,
+			 ctrl_info->rcid_count, ctrl_info->mcid_count);
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
+device_initcall(foobar_cbqri_memory_init);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
