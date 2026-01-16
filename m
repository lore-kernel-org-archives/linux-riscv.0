Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334AAD47CD0
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 11:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pWfmqW0p6TPIyjAvOCPWoXo7ZtYCBgrEuTTdWrLvQnQ=; b=l+Zi/FT9DNfyl+
	YyTyk0YRQ6eP5jEhsnM1NDTgG9SA/CKBQpdY8N9GlJy7qCF6OuN6xRXEIaUahOl22jdXK8OhMbL5d
	hu85tAaq9u6/KSo21/A9GMtd9zfJOIOfom5jSda0EpyB4ej8ewAinI0aEG64nWpOXU062adUFsYST
	XfEUzRcJ8W6ICTy+gDYAFTc6aiW3z4lGAegIq6NZ32R8AmZu2Hs1evbGi1zGqr40Yae1fDCcCXRSJ
	OCRUYhIMEq/BVDURv1k4xht8we0ABuSEz8qNxekzz+ShfNKd0qPEXfoZWU9P5RWuNoRWo83/EUYMH
	LeV+VAjPtEdKFuNcO+/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vghp4-0000000E1Xs-0aBp;
	Fri, 16 Jan 2026 11:16:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vghp2-0000000E1XT-2p3F
	for linux-riscv@bombadil.infradead.org;
	Fri, 16 Jan 2026 11:16:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=g3RYuvY/GBV1m8icwYuUdsObGmp4joyssOcDuHKPoeQ=; b=XFMYvzt97RLFL9Gc+NNAuM5j0p
	r6T/73/bARSev/PwqWZ98JFtNf39nIcWf2XLTWEtjONoDhv2HTMLZ5GsX9S+n6gWulq0mlga+PFNl
	sWxsWh3JNDURe4naoOaM3w45f6X5FY5yCQJxEgg+q1pQGw73FdCvZoPUxZCfMh91MuNQDd0ipNwVL
	AnKbQkJ1pKXLxQdSswe0XvRoF8Cg0llISk2lLrZPbrm80ixyWTghMv2YXraBN1vxbbYijO+lz8GL1
	T52FdZsbMptfZLhBl6Hllz++nrtz+DAZrlFXAhZGb8G3v51EeM8bwD881ErKcM38UIlbs7t+vGlYg
	LMRsiSlw==;
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vghov-00000009GsB-461O
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 11:16:55 +0000
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
	by Atcsqr.andestech.com with ESMTP id 60GB71cB034331
	for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 19:07:01 +0800 (+08)
	(envelope-from randolph@andestech.com)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 60GB2fo1031253
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Fri, 16 Jan 2026 19:02:42 +0800 (+08)
	(envelope-from randolph@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 Jan
 2026 19:02:41 +0800
From: Randolph <randolph@andestech.com>
To: <linux-kernel@vger.kernel.org>
CC: <linux-pci@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <jingoohan1@gmail.com>,
        <mani@kernel.org>, <lpieralisi@kernel.org>, <kwilczynski@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <alex@ghiti.fr>, <aou@eecs.berkeley.edu>,
        <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
        <ben717@andestech.com>, <inochiama@gmail.com>,
        <thippeswamy.havalige@amd.com>, <namcao@linutronix.de>,
        <shradha.t@samsung.com>, <pjw@kernel.org>,
        <christian.bruel@foss.st.com>, <quic_wenbyao@quicinc.com>,
        <vincent.guittot@linaro.org>, <elder@riscstar.com>,
        <s-vadapalli@ti.com>, <randolph.sklin@gmail.com>,
        <tim609@andestech.com>, Randolph Lin <randolph@andestech.com>
Subject: [PATCH v10 4/4] MAINTAINERS: Add maintainers for Andes QiLai PCIe driver
Date: Fri, 16 Jan 2026 19:02:34 +0800
Message-ID: <20260116110234.1908263-5-randolph@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116110234.1908263-1-randolph@andestech.com>
References: <20260116110234.1908263-1-randolph@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 60GB71cB034331
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_111650_568619_195EA6FF 
X-CRM114-Status: UNSURE (   5.87  )
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

From: Randolph Lin <randolph@andestech.com>

Here add maintainer information for Andes QiLai PCIe driver.

Signed-off-by: Randolph Lin <randolph@andestech.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0d044a58cbfe..a441db539d57 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19898,6 +19898,13 @@ S:	Supported
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
