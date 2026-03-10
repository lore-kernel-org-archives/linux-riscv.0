Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41CBFD4F04
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 16:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FfpeCdpArqJuApiEUJqsT1/RKp6ZkJUnDrcUTuP9efo=; b=D5/7SpbjwFDvl+
	z9/Y6W7LGMetMQlsvY79P4NtKr2kRkObLs0dOGZC1v9hAqW9YEIeeu8OrUtnzCMDWiaFjJVSubCAs
	K3deKHBV0MdsigBpFV8BF6J0zR9EAkRczsOBg0ET0pnN0P00I473EK7aAGm6aCHXAtN1UpAT9RZ0C
	ijDZEQ0iklsswxRlM9HEBBIxTDcxIMS2F6LEkpoC6balmm+9ptZ0YBWImniqc1tXDTukHTjGssbcb
	0I66ZjL76bpwnNt5AflyTnYtCZGQPcp4tEwZrLr0CR9TfaIVqPNUQltrWmkzLbKtv706p9GYC2eEb
	hTxBcLEvegSgUIr4pMmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzznd-00000009u4g-3rjU;
	Tue, 10 Mar 2026 16:19:13 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzznX-00000009u1q-023f
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 16:19:10 +0000
Received: from localhost.localdomain (unknown [223.166.92.103])
	by APP-03 (Coremail) with SMTP id rQCowAB3lNtwRLBpMRBECg--.1611S2;
	Wed, 11 Mar 2026 00:18:57 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>
Subject: [PATCH v2 0/4] riscv: dts: spacemit: Add PMIC regulators usb pcie
Date: Wed, 11 Mar 2026 00:18:49 +0800
Message-ID: <20260310161853.3900605-1-gaohan@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CM-TRANSID: rQCowAB3lNtwRLBpMRBECg--.1611S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKryDCr1rXF1UArWrWr4rXwb_yoWkWrX_uF
	1fGasakryDGFs2kFySq3WUtay8Cr4agFy3tF95Kr47tFy5uF1rG3W7JFy7Z3WrGryDAryD
	Wa17AFWfJ3W3ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-Originating-IP: [223.166.92.103]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiBwkCDGmwM1ktHAAAsC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_091907_450184_ACAAC6A9 
X-CRM114-Status: UNSURE (   4.93  )
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

This patch series enables the PMIC, voltage regulators, usb and pcie
for the OrangePi RV2 board.

Changes in v2:
- Merge patch 3/5 into 3
- Merge patch 4/6/7 into 4
  Remove regulator-always-on in pcie_vcc_3v3
  Remove pinctrl in combo_phy
  Add vpcie3v3-supply in pcie*_port
- Link to v1: https://lore.kernel.org/linux-riscv/cover.1769895215.git.gaohan@iscas.ac.cn/

Han Gao (4):
  riscv: dts: spacemit: Enable i2c8 adapter for OrangePi RV2
  riscv: dts: spacemit: Define fixed regulators for OrangePi RV2
  riscv: dts: spacemit: Define the P1 PMIC regulators for OrangePi RV2
  riscv: dts: spacemit: Enable USB3.0/PCIe on OrangePi RV2

 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 233 ++++++++++++++++++
 1 file changed, 233 insertions(+)


base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
prerequisite-patch-id: ef6e9c7b5854d0c08066b72f9a7868db8c2140eb
prerequisite-patch-id: cfe3800f8c791ec4c63e070af9628e88e0fc31b9
prerequisite-patch-id: b76493e625ae257c8adcd67874178458420e4d47
prerequisite-patch-id: 88e01dc92c83bd88ddeb78891d3088209fed8d6b
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
