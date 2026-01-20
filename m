Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF682D2ED11
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 04:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m2FZY0F87OecXe+jjt/koeVlhqfq0t0F1Q+TYsIJhls=; b=IbpAISonRoH+C5
	wrs/nrfA5/GvU/rrZOEAShT7bb5d2Yo0r2zELzjMdeSOJaT/TnAVtDPjjOxwPitdHQoFungVyuvUB
	0WnANOWNHG/bkyJFsWQWaYE6Wc2NAZYWqvPMwQ8pibApiVgUnDfqiy/TW1LOc6y6RsEcUUnhLdhiN
	8xQUvi0dQbUwk6/pl3fi61+tlFbShr4vlPqe1JdkjwIdxdkScSL5Xj3OvvrEHQwnuUn6Gttwl4zXk
	CQuwz420X9pnXLCPW24PaKhF7nb/ZUUcIDsqFIbjPMnR9OH9LUp84GYRw8EhYwgFAaTwSPGkVaKvH
	ByIf/fbXneYJsvJwrHDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi39o-000000039Tg-2oQv;
	Tue, 20 Jan 2026 04:15:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi39L-000000039Mr-30Ia
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 04:15:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 28CE360166;
	Tue, 20 Jan 2026 04:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB6AC19425;
	Tue, 20 Jan 2026 04:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768882526;
	bh=So9iUedCC3u+sUXH12Vr6tmS+PCHIo5F5wnJVHearb0=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=ZOPt/O0/lggO52Wdqgoyk4ZT7fSlplaFQFPkEmhmPi+Yz8LaLhlbmgALIJrx6Qxct
	 KaJgNIlxfnALFw9h9mKpcDMv0npFxJbQTsaSXE1z6+TJG5qW7RX/5Cm48LHwRUVAL6
	 oSfR/TTp5nPBnVrA7wjOmqaaP4Fg5fiNXzUA3JIiL4BQUJjj4dF8Vidayyx+sleQjL
	 hoqmDDtUXZlYKDnfd1AmALPWENyBoG6zcHMckXnN4pGLzDuVlAc6jxN+5q7ay93UWB
	 G+1KaRwbhzTloc1xZrAsr+nW19jITSMDcC/WMPUbIAFRvyvmNVR4H2MJ6eKECnNq8t
	 bL/1NqGjMLsZg==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 19 Jan 2026 20:14:53 -0800
Subject: [PATCH NFU RFC 16/19] resctrl: riscv: build CBQRI drivers
MIME-Version: 1.0
Message-Id: <20260119-ssqosid-cbqri-v1-16-aa2a75153832@kernel.org>
References: <20260119-ssqosid-cbqri-v1-0-aa2a75153832@kernel.org>
In-Reply-To: <20260119-ssqosid-cbqri-v1-0-aa2a75153832@kernel.org>
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
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Reinette Chatre <reinette.chatre@intel.com>, 
 Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, 
 Peter Newman <peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Dave Martin <Dave.Martin@arm.com>, Drew Fustini <fustini@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, x86@kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2641; i=fustini@kernel.org;
 h=from:subject:message-id; bh=So9iUedCC3u+sUXH12Vr6tmS+PCHIo5F5wnJVHearb0=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWTmMwafTDv76crDL4EMJi5SFdMX/G2vbLl3wN6i5O6Zk
 /I6Z9uCO0pZGMS4GGTFFFk2fci7sMQr9OuC+S+2wcxhZQIZwsDFKQATaTvLyHDgy++/e45OWiQf
 /TdkisrqDT/mH2b0m+xRqJT0/UqnT9xCRoajN+8bOG5XCGyRPTRt4gn+4FDLY0EdM+9l7zlpPV1
 yXikjAA==
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
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

[NOT FOR UPSTREAM]

Add RISC-V CBQRI cache and bandwidth controller drivers to the build.

Link: https://github.com/riscv-non-isa/riscv-cbqri/releases/tag/v1.0
Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 drivers/resctrl/Kconfig        |  2 ++
 drivers/resctrl/Makefile       |  2 ++
 drivers/resctrl/riscv/Kconfig  | 25 +++++++++++++++++++++++++
 drivers/resctrl/riscv/Makefile |  4 ++++
 4 files changed, 33 insertions(+)

diff --git a/drivers/resctrl/Kconfig b/drivers/resctrl/Kconfig
index c808e0470394..6c1d909dd20c 100644
--- a/drivers/resctrl/Kconfig
+++ b/drivers/resctrl/Kconfig
@@ -22,3 +22,5 @@ config MPAM_KUNIT_TEST
 	  If unsure, say N.
 
 endif
+
+source "drivers/resctrl/riscv/Kconfig"
diff --git a/drivers/resctrl/Makefile b/drivers/resctrl/Makefile
index 898199dcf80d..48fa4d69d76f 100644
--- a/drivers/resctrl/Makefile
+++ b/drivers/resctrl/Makefile
@@ -2,3 +2,5 @@ obj-$(CONFIG_ARM64_MPAM_DRIVER)			+= mpam.o
 mpam-y						+= mpam_devices.o
 
 ccflags-$(CONFIG_ARM64_MPAM_DRIVER_DEBUG)	+= -DDEBUG
+
+obj-y						+= riscv/
diff --git a/drivers/resctrl/riscv/Kconfig b/drivers/resctrl/riscv/Kconfig
new file mode 100644
index 000000000000..d9a774fb856b
--- /dev/null
+++ b/drivers/resctrl/riscv/Kconfig
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config RESCTRL_RISCV_CBQRI_CACHE
+	bool "RISC-V QoS cache controller (CBQRI)"
+	default y
+	depends on RISCV
+	select RISCV_ISA_SSQOSID
+	help
+	  Support RISC-V platform which implements a QoS capacity
+	  controller according to the RISC-V Capacity and Bandwidth QoS
+	  Register Interface (CBQRI) specification.
+
+	  If you do not care about testing RISC-V CBQRI, then choose 'N'.
+
+config RESCTRL_RISCV_CBQRI_BANDWIDTH
+	bool "RISC-V QoS bandwidth controller (CBQRI)"
+	default y
+	depends on RISCV
+	select RISCV_ISA_SSQOSID
+	help
+	  Support RISC-V platform which implements a QoS bandwidth
+	  controller according to the RISC-V Capacity and Bandwidth QoS
+	  Register Interface (CBQRI) specification.
+
+	  If you do not care about testing RISC-V CBQRI, then choose 'N'.
diff --git a/drivers/resctrl/riscv/Makefile b/drivers/resctrl/riscv/Makefile
new file mode 100644
index 000000000000..e6937a8632d6
--- /dev/null
+++ b/drivers/resctrl/riscv/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_RESCTRL_RISCV_CBQRI_CACHE)      += cbqri_cache.o
+obj-$(CONFIG_RESCTRL_RISCV_CBQRI_BANDWIDTH)  += cbqri_bandwidth.o

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
