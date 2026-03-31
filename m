Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B890AFF60F4
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 17:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8/m+3hXVoDRzM2/oRmNtfUrghdQEvora88op5JGaMSs=; b=b6P3z+xskKOXWI
	CEmzBLS2FUiDm+LOYUHOUdCGPZVNB29WC5jguve9CbHCj0gKt/csC9E6bL70oa/3vCAMl6KNrCb8v
	AnwQ3mgH7FEM6gtcZDOfEqr59jrDH+wLXjWcHrPYq2WvhoxirhvBTRT7tSWSSavY+yjCfKSCHEbdx
	6awuYTNgB4PJ9Vuut2pypleZmUvRPCzi5TFmYG7YmbDdKfASlRqus1uRscOs7eqius4El/5IxlLEN
	/V0c9zKrynlbK8u6E5vbgoleznLBgYQEZSBUgjyYImih2hFQ9tqpDsNB4yinIJVSjxwwkFDixgxqO
	SiaxDKRrO9Wv+DIBGsUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ceC-0000000DK3P-3Zte;
	Tue, 31 Mar 2026 17:13:01 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ceA-0000000DK2S-09Gq
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 17:12:59 +0000
Received: from localhost.localdomain (unknown [223.166.95.230])
	by APP-03 (Coremail) with SMTP id rQCowABnhdyRAMxpydRzDA--.42156S4;
	Wed, 01 Apr 2026 01:12:52 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <gaohan@iscas.ac.cn>,
	Zixian Zeng <sycamoremoon376@gmail.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Han Gao <rabenda.cn@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] riscv: dts: sophgo: Add dma-coherent to SG2042 PCIe controllers
Date: Wed,  1 Apr 2026 01:12:48 +0800
Message-ID: <20260331171248.973014-3-gaohan@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260331171248.973014-1-gaohan@iscas.ac.cn>
References: <20260331171248.973014-1-gaohan@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowABnhdyRAMxpydRzDA--.42156S4
X-Coremail-Antispam: 1UD129KBjvJXoW7WrWrJFyxZFWkXry7tFyftFb_yoW8Gw45pr
	srCF45KFyxXrZYv3W7GFy0gr43JFZYkasxKrnYk3W8W3yYvryUXrn3Aw1Ig3WDGr4jq343
	WFs8tFyrKF1qy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQC14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
	M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
	v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
	IY04v7MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxAqzxv26xkF7I0En4kS
	14v26r4a6rW5MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
	IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI
	42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIx
	AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
	jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjTRNiSHDUUUU
X-Originating-IP: [223.166.95.230]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiBg0DDGnL4ih7zAAAsb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_101258_438910_FD82D8DE 
X-CRM114-Status: UNSURE (   7.45  )
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

SG2042's PCIe root complexes are cache-coherent with the CPU. Mark all
four PCIe controller nodes (pcie_rc0 through pcie_rc3) as dma-coherent
so the kernel uses coherent DMA mappings instead of non-coherent bounce
buffering.

Cc: stable@vger.kernel.org
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index 9fddf3f0b3b9..3af770549742 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -417,6 +417,7 @@ pcie_rc0: pcie@7060000000 {
 			vendor-id = <0x1f1c>;
 			device-id = <0x2042>;
 			cdns,no-bar-match-nbits = <48>;
+			dma-coherent;
 			msi-parent = <&msi>;
 			status = "disabled";
 		};
@@ -439,6 +440,7 @@ pcie_rc1: pcie@7060800000 {
 			vendor-id = <0x1f1c>;
 			device-id = <0x2042>;
 			cdns,no-bar-match-nbits = <48>;
+			dma-coherent;
 			msi-parent = <&msi>;
 			status = "disabled";
 		};
@@ -461,6 +463,7 @@ pcie_rc2: pcie@7062000000 {
 			vendor-id = <0x1f1c>;
 			device-id = <0x2042>;
 			cdns,no-bar-match-nbits = <48>;
+			dma-coherent;
 			msi-parent = <&msi>;
 			status = "disabled";
 		};
@@ -483,6 +486,7 @@ pcie_rc3: pcie@7062800000 {
 			vendor-id = <0x1f1c>;
 			device-id = <0x2042>;
 			cdns,no-bar-match-nbits = <48>;
+			dma-coherent;
 			msi-parent = <&msi>;
 			status = "disabled";
 		};
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
