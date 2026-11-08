Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83AE606A322
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 10:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DbBwkc11;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.a=rsa-sha256 header.s=default header.b=QYWI+OfY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=qMXPQ3DzowWojH/p6s78rxU8DCtuQ6efLFytiMeLLu4=; b=DbBwkc11sRZ0wL+8+dAPXfOEVV
	UvEfCcKO/5IbhGIvvWNbcPVKgbo6kxGRNuLyI0Oqf5WHxkoozik8nxZhY4fNVfs4Beu63e5gBNmkn
	1i5O2r6wy9FDM6U5kwiFV3/SNl8yuMMvUbSBUM0ioVFmoK8Zk+5VQlO2fxEKs09RJ2KvZ3PG1hWWf
	Uc4ZVGuvFGztLFmYbJyxhPbEre8JjiehDM5O+qoNGw7KBrWU+queAGC4liM+gTXossVfesfVho5B3
	a40VKauEhcvi/pmqq6czdoQmCWaOBweGLIAlutBTGxTWJRW3yNi4SXNcKxT0QcLnVPA3tlJqFJYBh
	9a5w3E8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0a3-0000000G0Q7-2Xvc;
	Sun, 08 Nov 2026 10:56:59 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0Zy-0000000G0Mk-2yg1;
	Sun, 08 Nov 2026 10:56:56 +0000
Received: from LAPTOP-99KJFSET (unknown [223.75.64.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 53e3dfdd9;
	Sun, 8 Nov 2026 18:56:41 +0800 (GMT+08:00)
From: Hongyan Xu <getshell@seu.edu.cn>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Robert Richter <rric@kernel.org>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hongyan Xu <getshell@seu.edu.cn>
Subject: [PATCH 0/3] PCI: Fix ECAM config window use-after-free in five drivers
Date: Sun,  8 Nov 2026 18:56:36 +0800
Message-ID: <20261108105640.875-1-getshell@seu.edu.cn>
X-Mailer: git-send-email 2.50.1.windows.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-HM-Tid: 0aa1bacda3db03a1kunm546e4281ce696
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTUpJVktCHR4dSkkeHkIZHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVTE5VTU9VQ0lZV1kWGg8SFR0UWUFZT0tIVUpLSUJDQ0
	xVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=QYWI+OfYUyLjpbyMqMN5fJs14PBc1lVUJKUIdzK6W8iuOtsyYsJCCSgqQjccvS2PiQJlDRRFeyTvgLuVttsNZaLkI0Ok2Ryyo/oGoM6lwMtp2cARTfu6bJMn2vZ4kKvflKzyMhqAGmg9yT/zhPtsq6CWr8gaZpWY/I91WPLak7s=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=2EQJ24xhE/gqkBYq4fXAFxjW7usX/BJnOafpsVnIudM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_025654_935799_F39F812E 
X-CRM114-Status: UNSURE (   6.69  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Five PCI host controller drivers use pci_host_common_probe() or
pci_host_common_init() but install no ->remove, so unbinding frees the ECAM
config window through devres while the bus tree is still registered, and
the next config space access is a use-after-free.

Patch 1/3 is the apple driver.  CONFIG_PCIE_APPLE=m plus
module_platform_driver() means one root command, "rmmod apple_pcie", is
enough to trigger it.

This series fixes the lifetime of cfg only.  It does not make these drivers
safe to unload: apple's IRQ handlers and microchip's PLDA IRQ domains are
still not released, both pre-existing and out of scope here.

The defect was found by code review; the trigger steps are in each patch,
but no oops or KASAN report is attached, as none was measured.

Patch 3/3 is one commit for the three remaining drivers and therefore
carries three Fixes: tags; it can be split apart if you prefer.

Hongyan Xu (3):
  PCI: apple: Fix ECAM config window use-after-free
  PCI: microchip: Fix ECAM config window use-after-free
  PCI: thunder-pem, hisi, thunder-ecam: Fix ECAM config window
    use-after-free

 drivers/pci/controller/dwc/pcie-hisi.c            | 1 +
 drivers/pci/controller/pci-thunder-ecam.c         | 1 +
 drivers/pci/controller/pci-thunder-pem.c          | 1 +
 drivers/pci/controller/pcie-apple.c               | 1 +
 drivers/pci/controller/plda/pcie-microchip-host.c | 1 +
 5 files changed, 5 insertions(+)

-- 
2.50.1.windows.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
