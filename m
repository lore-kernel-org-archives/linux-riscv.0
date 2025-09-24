Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE32CAC5B0
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Sep 2025 12:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BRtDxLQDVSKQ9iONgThUkNNyHoa47NwEF0wXbMoHJFI=; b=U5GNG+eDYfJX9W
	l6UiiIjwPNHGpN7DlkBlkegpos7IpNRH4828EaumXuWcWLY5dfqs0QsDwOiuAqEUZ7MuV5x23hUE8
	gezMeUaaIqPV8pi+vat5PSsY4j3WqbBL8nEmBJP7TR/5kol9PGwQtBLIA493Km/s9Q4pacieE8BVB
	nkdbH5R9r/ONWVnlgCGJ3V1oB4MF5+/x8KMUuylIocOXUcRoHJVRlzlSp2QSsv2BRkbGGgTMQVuvP
	i1PED+729xE/3tFE4YRx0zIb9XD3gqByToRP/VM9chFaDTmWYBazwyYVElvTkdcikD2bJqRdo66rZ
	yYOL9L8nMB8YV4AX7KcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1OdF-0000000HOHK-3Ib7;
	Wed, 24 Sep 2025 12:30:01 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1OdA-0000000HOBt-0fPB
	for linux-riscv@lists.infradead.org;
	Wed, 24 Sep 2025 12:30:00 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 58OBSVsY074427
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Sep 2025 19:28:31 +0800 (+08)
	(envelope-from randolph@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Wed, 24 Sep 2025
 19:28:31 +0800
From: Randolph Lin <randolph@andestech.com>
To: <linux-kernel@vger.kernel.org>
CC: <linux-pci@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <jingoohan1@gmail.com>,
        <mani@kernel.org>, <lpieralisi@kernel.org>, <kwilczynski@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <alex@ghiti.fr>, <aou@eecs.berkeley.edu>,
        <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
        <ben717@andestech.com>, <inochiama@gmail.com>,
        <thippeswamy.havalige@amd.com>, <namcao@linutronix.de>,
        <shradha.t@samsung.com>, <randolph.sklin@gmail.com>,
        <tim609@andestech.com>, Randolph Lin <randolph@andestech.com>
Subject: [PATCH v4 5/5] MAINTAINERS: Add maintainers for Andes QiLai PCIe driver
Date: Wed, 24 Sep 2025 19:28:20 +0800
Message-ID: <20250924112820.2003675-6-randolph@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924112820.2003675-1-randolph@andestech.com>
References: <20250924112820.2003675-1-randolph@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.173]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 58OBSVsY074427
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_052956_532106_D4D296A3 
X-CRM114-Status: UNSURE (   7.65  )
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

Here add maintainer information for Andes QiLai PCIe driver.

Signed-off-by: Randolph Lin <randolph@andestech.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 520fb4e379a3..0fe27108e6b9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19256,6 +19256,13 @@ S:	Supported
 F:	Documentation/devicetree/bindings/pci/altr,pcie-root-port.yaml
 F:	drivers/pci/controller/pcie-altera.c
 
+PCI DRIVER FOR ANDES QILAI PCIE
+M:	Randolph Lin <randolph@andestech.com>
+L:	linux-pci@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/pci/andestech,qilai-pcie.yaml
+F:	drivers/pci/controller/dwc/pcie-andes-qilai.c
+
 PCI DRIVER FOR APPLIEDMICRO XGENE
 M:	Toan Le <toan@os.amperecomputing.com>
 L:	linux-pci@vger.kernel.org
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
