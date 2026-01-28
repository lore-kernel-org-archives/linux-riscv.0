Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DA1D46BFC
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 20:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9SF/Kf6izbRhqG31Dl2IgsLOhcptYWgePJGrpru6Sb4=; b=ov/Ut7i1I69pi0
	isvdUq3HCBfXXHKxbm02oVDss5dIjPXwZHT4KwphMAvk2zxCgJUU0dYLN6vfCJUW8hi0d4eOo94UD
	Li1p3WFJEbewUL5GodIiQboZLP8abe3DnPOmgGDzLKcEd4+1NdM22lTElsu2vBc82YXkmJstnDjO8
	Iwm0bTEinL8I2PB7qemw8ntaWyw9AWzbYfqGeWrD/fsWTJbpzsK93QSUcgVfDhKDbPSbYucXQPsWz
	HUOgDhB9rr8G8c/NYJtvoL/D/CXqlCeW4Mp4VdB73oLDY4Q6Vit8G0AL3KTBpomS3sP2Keytfkp6m
	jelNXQDFUP4Enu+KYiVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlC95-0000000Gk52-0K9V;
	Wed, 28 Jan 2026 20:28:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlC8z-0000000Gk0f-3g9Z
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 20:28:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6702B44537;
	Wed, 28 Jan 2026 20:28:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF73C2BCAF;
	Wed, 28 Jan 2026 20:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769632085;
	bh=e1gD37k8W4Pzp7U55pR9/mebQe/hwn2pjhUSiquHa+s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RCoi2aWY/oZS67ocZqD2asZzFlXYhQYfYhe3wqNa6gStwaGO2FSunPiQni46XQpSQ
	 v+1mkd1Zi76k+jAK7BCTvTUqnvaTWrXRVi6KyTCxJOUkKxs2/ViSLefTPmB4M6TYfp
	 zgygXHEFdMq8RyNpJks8Ckn43dqM6a4lvqOEVNmoUXQ9XxGregt3JOmmtKLgsSjGsF
	 3DQcYdFAJ0FMYBe4PNJ5JST/NIi4UA9Wj3bLJQXJTzehMYVVJ2IFQjbSlGkzagdyaM
	 c7JBsIVir62difcOv6pNT3HM0+QnQeoK5MC82ctYZTuWro0r3JwENByHgcYGVw0yak
	 mRzMX4TE7tbIg==
From: Drew Fustini <fustini@kernel.org>
Date: Wed, 28 Jan 2026 12:27:25 -0800
Subject: [PATCH RFC v2 04/17] RISC-V: QoS: define properties of CBQRI
 controllers
MIME-Version: 1.0
Message-Id: <20260128-ssqosid-cbqri-v2-4-dca586b091b9@kernel.org>
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
In-Reply-To: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Adrien Ricciardi <aricciardi@baylibre.com>, 
 Nicolas Pitre <npitre@baylibre.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Atish Patra <atish.patra@linux.dev>, 
 Atish Kumar Patra <atishp@rivosinc.com>, 
 Vasudevan Srinivasan <vasu@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, Chen Pei <cp0613@linux.alibaba.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
 guo.wenjia23@zte.com.cn, liu.qingtao2@zte.com.cn, 
 Reinette Chatre <reinette.chatre@intel.com>, 
 Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, 
 Peter Newman <peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Dave Martin <Dave.Martin@arm.com>, Drew Fustini <fustini@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, Rob Herring <robh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Sunil V L <sunilvl@ventanamicro.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, linux-acpi@vger.kernel.org, 
 acpica-devel@lists.linux.dev, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1881; i=fustini@kernel.org;
 h=from:subject:message-id; bh=e1gD37k8W4Pzp7U55pR9/mebQe/hwn2pjhUSiquHa+s=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWRWFfo/PsmQs8/5uN0n4RmuNZbNnaqKh08JWp8PniEvI
 bZA5vf0jlIWBjEuBlkxRZZNH/IuLPEK/bpg/ottMHNYmUCGMHBxCsBEplxlZLhUc3PVNvcCloD3
 kWI1zKbTl3BYzC5zeF0/S6nPd/bORDOGv7KKuyXYZZdlXPyvsccx8XE9U12Qqvt2Y92ekIhmPZU
 nHAA=
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_122805_962251_88ADEBDE 
X-CRM114-Status: GOOD (  12.76  )
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
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 MAINTAINERS               |  1 +
 include/linux/riscv_qos.h | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e98d553bd0ca..31e536304972 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22511,6 +22511,7 @@ L:	linux-riscv@lists.infradead.org
 S:	Supported
 F:	arch/riscv/include/asm/qos.h
 F:	arch/riscv/kernel/qos/
+F:	include/linux/riscv_qos.h
 
 RISC-V RPMI AND MPXY DRIVERS
 M:	Rahul Pathak <rahul@summations.net>
diff --git a/include/linux/riscv_qos.h b/include/linux/riscv_qos.h
new file mode 100644
index 000000000000..51c3a96bbcd0
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
+		u32 cache_level;
+		u32 cache_size; /* in bytes */
+		struct cpumask cpu_mask;
+	} cache;
+};
+
+extern struct list_head cbqri_controllers;
+
+#endif /* __LINUX_RISCV_QOS_H */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
