Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD1FFB5180
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 02:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QF1WnklRwreTvHckkdOoOBMCMagGcOmgxs/A2vv0MbY=; b=dCzAYzkTjvHClQ
	DsI5PG28fb+8bt8QFUxADWJ2hrsAv2G1/mRk1ZhlTYsVMfyqJMuBSGk/EPOqt8LqayW5zo4ov4Z8u
	/w3+4YmnR2M+Q2zYs5WXrg6KTiL/6BV71q6ynraIUlYAIRmwFbiwH1DH8jbtfySPSJV1JfI9GDCo9
	ZiJi8pxDd7v3M8a0orbWNUwx0/+KrVzh05hJChn8AHA+jvkJDCXcnSZFp6dcrnjIxjlilQ5ZvYaxC
	d4ydHnY619XMoFHUCgqVprKfXVVN1v7UNwRmLnDnHBmS8+WwnmcTIRwtoG5ifFu5ZJ0jQqH4FcPQ7
	dSOwcVYi6dwnM/iI1B2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9wOs-00000005mKn-0wHm;
	Tue, 07 Apr 2026 02:42:46 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9wOo-00000005mJq-3L4B
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 02:42:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Date:Subject:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc; bh=ZN/5/S7kTbegEsZX6fYTTdSKmL1BGcO
	/nPWfivSkaKs=; b=TA1e7L7051NM8AitD5TKUlWWZHz09DMtdf9WO2m6lGfsJs4
	/1oJVzroDc8Y18PbSsqeIO1R/Hr3Ui+cB/+khfPU+CakcTVpI1vRjvbKWeoWdnYu
	nuWKa13xBxDh0bSaJ2KMxSIH6jwV+0LM8A67OHgaxITKgnlKo7y19DuEdvd4=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDXEELwbtRpBZsBAA--.862S3;
	Tue, 07 Apr 2026 10:41:56 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Date: Tue, 07 Apr 2026 10:40:52 +0800
Subject: [PATCH v2 1/4] riscv: add UltraRISC SoC family Kconfig support
MIME-Version: 1.0
Message-Id: <20260407-ultrarisc-pcie-v2-1-2aa2a19a7fb3@ultrarisc.com>
References: <20260407-ultrarisc-pcie-v2-0-2aa2a19a7fb3@ultrarisc.com>
In-Reply-To: <20260407-ultrarisc-pcie-v2-0-2aa2a19a7fb3@ultrarisc.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
 Xincheng Zhang <zhangxincheng@ultrarisc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775529665; l=924;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=P4GjG77njFnhJKKg9A7TX9zCDvXFIHaSQNO7h4lqj9E=;
 b=qbn5R6x4HJ8lCpXBgSbCqIU+8E7QUq5mB8cvupA3fI4AFYPa3fOMLgNxZdcftfBX2kGVzsjWh
 c3Bp9M21LRtDbXla88kbnP98xT1D0Xc/mwXRA/JzM0hWfkj/qIxdoWE
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwDXEELwbtRpBZsBAA--.862S3
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw45Gr4DJry7tw1Utry8uFg_yoWfAwb_C3
	s7J3y8ua48AFW8ua98Wr4fWFyrCws8WFy3Gr1SqryUua4xXr17Xw4Dt3W8tr15uw15Xa1k
	ZrZ3JFWfurySyjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb9kFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGwA2048vs2IY02
	0Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1le2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
	AFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
	0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI
	1lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCa
	FVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
	Wlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j
	6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr
	0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
	cSsGvfC2KfnxnUUI43ZEXa7sREUDG3UUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAKEWnTLbsAIAAAsW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_194243_237480_5A82529A 
X-CRM114-Status: UNSURE (   7.67  )
X-CRM114-Notice: Please train this message.
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

The first SoC in the UltraRISC series is UR-DP1000, containing octa
UltraRISC C100 cores.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 arch/riscv/Kconfig.socs | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index d621b85dd63b..98708569ec6a 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -84,6 +84,15 @@ config ARCH_THEAD
 	help
 	  This enables support for the RISC-V based T-HEAD SoCs.
 
+config ARCH_ULTRARISC
+	bool "UltraRISC RISC-V SoCs"
+	help
+	  This enables support for UltraRISC SoC platform hardware,
+	  including boards based on the UR-DP1000.
+	  UR-DP1000 is an 8-core 64-bit RISC-V SoC that supports
+	  the RV64GCBHX ISA. It supports Hardware Virtualization
+	  and RISC-V RV64 ISA H(v1.0) Extension.
+
 config ARCH_VIRT
 	bool "QEMU Virt Machine"
 	select POWER_RESET

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
