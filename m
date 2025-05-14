Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F65C3ABD8
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 12:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jb8itdZk5y+uHFdIigpFMQaTbXMLZMX4l11RSe1/zmQ=; b=EGcHcHSo/eDogY
	PSsXX4mjAi7Pn5mFOVpQJGj+gTmTmQWoU0ypSZWiQG0hTFc2Bn+vJcJS5jreoJBi2JYC7nVwIbw/s
	wr9HdD22wzKaeSImhZF/wLffi0VNsHflKvxtmagFMBUQif9i2IH40GFMwcYrfiS/PuF4P4NGT68sD
	r0hj06iHxKj/7y0an8Vd7w8Pw3KIRYSBVODmSmrZkLD49Xt7ltPKyn1v0Z1aO7ZxLsSP67O73EHCn
	jJrsKCKHwCiQIoAmk1L58WVnuiJtRmxzs/BrGHDUteMIYzAGGNGau5O4U7ZaqUeSZUDGFjmzfPHyT
	WKeoRUNRohvAugKcgJlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB5S-0000000F30N-0h1Q;
	Wed, 14 May 2025 12:19:50 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8p8-0000000EjFi-0LAu
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 09:54:52 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 54E9rrw0092296
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 17:53:53 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Wed, 14 May 2025
 17:53:53 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: 
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <geert+renesas@glider.be>, <magnus.damm@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <tim609@andestech.com>,
        Ben Zong-You Xie <ben717@andestech.com>
Subject: [PATCH v4 1/9] riscv: add Andes SoC family Kconfig support
Date: Wed, 14 May 2025 17:53:42 +0800
Message-ID: <20250514095350.3765716-2-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514095350.3765716-1-ben717@andestech.com>
References: <20250514095350.3765716-1-ben717@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 54E9rrw0092296
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_025450_457195_3D59C87B 
X-CRM114-Status: GOOD (  10.23  )
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

The first SoC in the Andes series is QiLai. It includes a high-performance
quad-core RISC-V AX45MP cluster and one NX27V vector processor.

For further information, refer to [1].

[1] https://www.andestech.com/en/products-solutions/andeshape-platforms/qilai-chip/

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 arch/riscv/Kconfig.errata | 2 +-
 arch/riscv/Kconfig.socs   | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index e318119d570d..be76883704a6 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -12,7 +12,7 @@ config ERRATA_ANDES
 
 config ERRATA_ANDES_CMO
 	bool "Apply Andes cache management errata"
-	depends on ERRATA_ANDES && ARCH_R9A07G043
+	depends on ERRATA_ANDES && (ARCH_R9A07G043 || ARCH_ANDES)
 	select RISCV_DMA_NONCOHERENT
 	default y
 	help
diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index a9c3d2f6debc..1bf5637f2601 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -1,5 +1,14 @@
 menu "SoC selection"
 
+config ARCH_ANDES
+	bool "Andes SoCs"
+	depends on MMU && !XIP_KERNEL
+	select ERRATA_ANDES
+	select ERRATA_ANDES_CMO
+	select AX45MP_L2_CACHE
+	help
+	  This enables support for Andes SoC platform hardware.
+
 config ARCH_MICROCHIP_POLARFIRE
 	def_bool ARCH_MICROCHIP
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
