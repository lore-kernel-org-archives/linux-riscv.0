Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F01FF885D
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 01:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y9Hq0OfeqDV2Atm4wrAko0hJlQA655v/0cIn1fpjPjY=; b=lZa4mtHPyBYyS5
	Z7+CXdEOA6qRq4ujIx8spJ2R8aC1mNbdWLfrCTlTpLp+BxgD3IWvcyHx0E1qQ+2KeqR3MTga7+p76
	79dcQVdSBC3pmgakM4Q1jmgkxYd9++4CgBxETgciavsshNfalIs6GQn0fShZ1kHW8A1VzryHem+xi
	I7ZqbZOFnhJdmcr1L+2pXqLqcyDHspuAeCfp6QNp5LwdZY3eSxBNbxFVZD0ByEetOxLNvTIznKyFy
	AKtS5Dq011f87Jdz8e6+nv/OP6m8NRSvBdi/gNknvZjPc0yEUYZtw2kw5+oX4drl828svlj2VrXol
	rygoa6A98Q7WBupPm3Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHApz-0000000G12O-1pyg;
	Mon, 27 Apr 2026 01:32:39 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHApw-0000000G11X-3WWU
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 01:32:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Date:Subject:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc; bh=eQFrKZlyykJUvAf7cH1ltvcwo0fJKri
	xuIUmANqBSKM=; b=hKPFaOWurshbXRPwokWX++MQJ0h5ALZ1vk7HqZrShy1ai5H
	aAH0+CUxhoA6I8YaI4p0ZUYf/mJ/3qJIaPb9JttMuVU6wDJ5FRJdrGtSTgt1aU1M
	Blc/rSuyD0KMUyvUqk+UFXreQEcDWSQE0XML9sg2mPg/RiKuTGx9GJB50oxo=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwA3cULPvO5ps_0CAA--.1758S3;
	Mon, 27 Apr 2026 09:33:06 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Date: Mon, 27 Apr 2026 09:32:10 +0800
Subject: [PATCH v4 1/3] riscv: add UltraRISC SoC family Kconfig support
MIME-Version: 1.0
Message-Id: <20260427-ultrarisc-pcie-v4-1-98935f6cdfb5@ultrarisc.com>
References: <20260427-ultrarisc-pcie-v4-0-98935f6cdfb5@ultrarisc.com>
In-Reply-To: <20260427-ultrarisc-pcie-v4-0-98935f6cdfb5@ultrarisc.com>
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
 Jia Wang <wangjia@ultrarisc.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777253539; l=811;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=k7xaltOxr1FPtLfLBpXG0T+uklw6wvxgverm552wOjM=;
 b=zaln2mLqZ1Yv0Fad/TPkjQDpkYqh8P2/CDZDbEDXOJQ2aHm+YQx0BCCsrZqUwqQ/c6+1CnQ7h
 jm6uQnLUiWhBRsVJyQ6/6hJBb9dWVbls9r9OlCy6OpCwlicJfG6NJO5
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwA3cULPvO5ps_0CAA--.1758S3
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw45XFy3Xry8JF1Uuw1Utrb_yoW3ZFb_C3
	4xJ348ZFyrAFW09a98Wrs3WF95Aws5WFy5Gr1ftryDuryxXw1xW3yDKr1jyw1Uuw15Xay8
	XrZayFWfAryayjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAKEWnti78ABQAAsv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_183237_441682_5F45B724 
X-CRM114-Status: UNSURE (   7.32  )
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
UltraRISC CP100 cores.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig.socs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index d621b85dd63b..0b4d06a7b4bf 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -84,6 +84,12 @@ config ARCH_THEAD
 	help
 	  This enables support for the RISC-V based T-HEAD SoCs.
 
+config ARCH_ULTRARISC
+	bool "UltraRISC RISC-V SoCs"
+	help
+	  This enables support for UltraRISC SoC platform hardware,
+	  including boards based on the UR-DP1000.
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
