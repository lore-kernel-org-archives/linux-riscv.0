Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976D7606A32A
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 22:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2NEiHI45;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AL71nTsW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lhBi2823Pky7QhQMpQvmygNdc7n3bdtwm6CQAdhBKBw=; b=2NEiHI45ooIfyuWfh2eVnk4waS
	njoaVn8uB3KNvq1ytpZupAzXXXP8eR8jKiqBHvzATEZjT8QvvfAJB/uTATA2lB2eaaVGkGLNir8q6
	yZnBT3HsCcU0K96EkKz5hP/vM0ToDSmyUmH274Qp7BE800Mec1jeA7dkUmeZEhsBJCkSP2O5uqB24
	XPMSz+blnVaofSiZ1rxpXrklHnTFxgNye6A7uuaw1oKFPGOzGCfiVxJn4K+01qwh6MLW6g48w0FIa
	WjJFeInzNW/30+VmUJORG+yj0vM+2sNR9mZoQD/mTbDZp9Yz7yb/XZta1cL0N40N9jHnC2d5n/c64
	ZMrR7/JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRP3-00000007CJi-0YgE;
	Tue, 17 Nov 2026 22:11:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRP1-00000007CJQ-18dw
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 22:11:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C191645AFF;
	Tue, 17 Nov 2026 22:11:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 145741F000C9;
	Tue, 17 Nov 2026 22:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794953506;
	bh=/1hNtICneGhne8iXWQ6cBiRvaRi+/d+2W/uyM2swnSk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AL71nTsWd/A+a2L7joLavNbLv16P8IohWifGOlQt/wWV1ImH7SHi/AaKsdYeZ4O6+
	 A6KQ8fHVQlxgXOYEjjeaftAtKO8CKOy+RrO0R2brBre1EEhwXKtFofS5pxvBBqY0/i
	 bEcssK4wKxczdIkvma1JK7kiDUbDLB6pC5PxIgoVOyg7y9aNK58BOvMi5dgfoXhbTh
	 FaCK6hkM5AHIRYEF3tsXF6qm+EdbdNv6cHnt/mgd/nLid3iGiTHDicpUwJ8QWHaSyx
	 97e3bcDaIZ79gdsZ29hKJ5J4hwkORWoNJlqV0A/8jT2YvZwoloAP6pfh0nLSNv4TVp
	 ou6Ak3Rk9ObMw==
From: "Drew Fustini (Tenstorrent)" <fustini@kernel.org>
Date: Tue, 17 Nov 2026 14:11:27 -0800
Subject: [PATCH 1/3] ACPI: RISC-V: Add RQSC table definitions
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261117-acpi-rqsc-v1-1-381ce645751e@kernel.org>
References: <20261117-acpi-rqsc-v1-0-381ce645751e@kernel.org>
In-Reply-To: <20261117-acpi-rqsc-v1-0-381ce645751e@kernel.org>
To: Sunil V L <sunilvl@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Atish Patra <atish.patra@linux.dev>, 
 Anup Patel <anup.patel@oss.qualcomm.com>, 
 Chen Pei <cp0613@linux.alibaba.com>, yunhui cui <cuiyunhui@bytedance.com>, 
 Reinette Chatre <reinette.chatre@intel.com>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
 Zeng Heng <zengheng@picoheart.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Ben Horgan <ben.horgan@arm.com>, 
 James Morse <james.morse@arm.com>, Tony Luck <tony.luck@intel.com>, 
 Adrien Ricciardi <aricciardi@baylibre.com>, 
 Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>, 
 Gong Shuai <gong.shuai@sanechips.com.cn>, Gong Shuai <gsh517@gmail.com>, 
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Samuel Holland <samuel.holland@sifive.com>, guo.wenjia23@zte.com.cn, 
 liu.qingtao2@zte.com.cn, Dave Martin <Dave.Martin@arm.com>, 
 Babu Moger <babu.moger@amd.com>, Fenghua Yu <fenghuay@nvidia.com>, 
 Peter Newman <peternewman@google.com>, 
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, linux-acpi@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Drew Fustini (Tenstorrent)" <fustini@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2620; i=fustini@kernel.org;
 h=from:subject:message-id; bh=vPNGObNCWR27c+GVYcHocchqXfN4ljgXbem+P0wwc+U=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWT9uajgfdM/XcJ/X8j0z9P/FO3ZLdR3Zfv39H7JhgkyZ
 vWpZfmXO0pZGMS4GGTFFFk2fci7sMQr9OuC+S+2wcxhZQIZwsDFKQAT4ddnZHglWJN5q+3tr8Mi
 1049mSt1d+ahN3417J8WfbeZGLY3cakNI8O+/UeuKBkcC+YoX2I7N6hqmvcRbYfip1EMhlMCWXu
 4uDgB
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The RISC-V Quality of Service Controllers (RQSC) table describes the
CBQRI capacity and bandwidth controllers in a system. RQSC v1.0 was
ratified in June 2026. Add structure definitions for RQSC.

The definitions stay in drivers/acpi/riscv until ACPICA carries them
in actbl2.h.

Link: https://github.com/open-acpica/acpica/pull/1262
Signed-off-by: Drew Fustini (Tenstorrent) <fustini@kernel.org>
---
 drivers/acpi/riscv/rqsc.h | 67 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/acpi/riscv/rqsc.h b/drivers/acpi/riscv/rqsc.h
new file mode 100644
index 000000000000..d9a4ce0f1c10
--- /dev/null
+++ b/drivers/acpi/riscv/rqsc.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Definitions for the RISC-V Quality of Service Controllers (RQSC) ACPI
+ * table, kept here until ACPICA carries them in actbl2.h.
+ */
+#ifndef _DRIVERS_ACPI_RISCV_RQSC_H
+#define _DRIVERS_ACPI_RISCV_RQSC_H
+
+#include <linux/acpi.h>
+#include <linux/types.h>
+
+#define ACPI_SIG_RQSC	"RQSC"	/* RISC-V Quality of Service Controllers Table */
+
+#define ACPI_RQSC_REVISION	1
+
+/* QoS Controller Type */
+#define ACPI_RQSC_CONTROLLER_TYPE_CAPACITY	0
+#define ACPI_RQSC_CONTROLLER_TYPE_BANDWIDTH	1
+
+/* Resource Type */
+#define ACPI_RQSC_RESOURCE_TYPE_CACHE	0
+#define ACPI_RQSC_RESOURCE_TYPE_MEMORY	1
+
+/* Resource ID Type */
+#define ACPI_RQSC_RESOURCE_ID_TYPE_PROCESSOR_CACHE	0
+#define ACPI_RQSC_RESOURCE_ID_TYPE_MEMORY_RANGE		1
+#define ACPI_RQSC_RESOURCE_ID_TYPE_MEMORY_SIDE_CACHE	2
+#define ACPI_RQSC_RESOURCE_ID_TYPE_ACPI_DEVICE		3
+#define ACPI_RQSC_RESOURCE_ID_TYPE_PCI_DEVICE		4
+
+/* Controller Flags */
+#define ACPI_RQSC_CONTROLLER_ZERO_BLOCKS	(1) /* Zero blocks can be allocated to an RCID */
+
+struct acpi_rqsc_resource {
+	u8 type;
+	u8 reserved;
+	u16 length;
+	u16 flags;
+	u8 reserved2;
+	u8 id_type;
+	u64 id1;
+	u32 id2;
+} __packed;
+
+/* Resource Specific Data that follows a memory resource */
+struct acpi_rqsc_memory_data {
+	u64 bandwidth_per_block;	/* In bytes per second, 0 if not provided */
+} __packed;
+
+struct acpi_rqsc_controller {
+	u8 type;
+	u8 reserved;
+	u16 length;
+	struct acpi_generic_address address;
+	u16 rcid_count;
+	u16 mcid_count;
+	u16 flags;
+	u16 num_resources;
+	/* Followed by num_resources struct acpi_rqsc_resource */
+} __packed;
+
+struct acpi_table_rqsc {
+	struct acpi_table_header header;	/* Common ACPI table header */
+	u32 num_controllers;
+} __packed;
+
+#endif /* _DRIVERS_ACPI_RISCV_RQSC_H */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
