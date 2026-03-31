Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB48DFF60F4
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 17:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eEhDKSWi2EQGIP/yG86a8pnfClfPRlFwgZ8Or14ABxU=; b=Y5CnI7joLGZInG
	VOZq/iiDqJEDtRg40cAKSFfaRLKOOi0h8TrCfeaTomyS+YfEzYhOomSGoBaFYFQIJ4qNJTp0K2z1c
	97SMUdGtHqMMgYesPrBxPU4pBoI8w4lL2+0i6JqxZtImWJoYbGh6P0bdGsd94xINyiAUHwnNCAyjG
	L69WB9ASvixFI4lnWH091SzI2CebbTOLJY2fsIzbXL4S+XYSo9eOekpXqSpVdShI9gRc1MtvUdKMB
	j2E2f5aY9M1NSVDthJnrmR/RJ8n2Jf9nfsZ0aDb3k3ZDE4fOPCPzd5YQs9D2wpdh0QcRMw7sWulMW
	ieS60XNdQEU18Oi05z4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7dKw-0000000DNQN-2ufu;
	Tue, 31 Mar 2026 17:57:10 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7dKs-0000000DNNq-43pN
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 17:57:08 +0000
Received: from localhost.localdomain (unknown [223.166.95.230])
	by APP-01 (Coremail) with SMTP id qwCowABH8GvrCsxpCP3GCw--.20050S2;
	Wed, 01 Apr 2026 01:57:00 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
To: Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Lukas Wunner <lukas@wunner.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	Han Gao <gaohan@iscas.ac.cn>,
	Chen Wang <unicorn_wang@outlook.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-pci@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Han Gao <rabenda.cn@gmail.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Yao Zi <me@ziyao.cc>
Subject: [PATCH 0/2] PCI: Allow disabling port services on broken root ports
Date: Wed,  1 Apr 2026 01:56:56 +0800
Message-ID: <20260331175658.1015829-1-gaohan@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CM-TRANSID: qwCowABH8GvrCsxpCP3GCw--.20050S2
X-Coremail-Antispam: 1UD129KBjvJXoW7JryxXF1ktFykZF18tF4DCFg_yoW8JryfpF
	WrWF9YyrWfKryUKwsrX3WUCFy3WF4kAryrC34DGw47urW3AryrXF9rtF93tFsrGr4xAa4Y
	vr95C3W5uFyDZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9214x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
	0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
	1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0pRHUDLUUUUU=
X-Originating-IP: [223.166.95.230]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiBwkDDGnL4t55SwABss
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_105707_380287_76D6A0BE 
X-CRM114-Status: UNSURE (   7.48  )
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

Some PCIe root ports break MSI delivery to downstream devices when
native port services (AER, PME, bwctrl, etc.) are active. The existing
pcie_ports=compat kernel parameter works around this globally, but
affects all ports on the system.

This series adds a per-device mechanism to skip port service probing:
  1. Introduce PCI_DEV_FLAGS_NO_PORT_SERVICES flag and wire it into
     the PCIe port driver
  2. Apply it via quirk to Sophgo SG2042 root ports [1f1c:2042], which
     fail to deliver MSI interrupts when port services are enabled

SG2042's PCIe root ports only support MSI, not MSI-X. The MSI
controller provides only 32 vectors shared across all devices behind
each root port. When native port services claim vectors from this
limited pool, downstream devices are starved of interrupts, resulting
in zero interrupts delivered and driver timeouts (e.g. amdgpu fence
fallback timer expired on all rings).

Han Gao (2):
  PCI: Add per-device flag to disable native PCIe port services
  PCI: Add quirk to disable PCIe port services on Sophgo SG2042

 drivers/pci/pcie/portdrv.c |  3 +++
 drivers/pci/quirks.c       | 12 ++++++++++++
 include/linux/pci.h        |  2 ++
 include/linux/pci_ids.h    |  2 ++
 4 files changed, 19 insertions(+)

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
