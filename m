Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA0AC83F21
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 13:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ERpMwIAru86hyTIaPJ/4NVM34fCdxGz/F9HF5Uz4KF4=; b=dSzgcLhq8wu/YX
	hjMu3JGWyDKS2eN910Yhb2E7dThREljydKw8y5Y6eoPiIOwFjGCNUJRMoHBmmvEeRcN5hiw7hKkvv
	qakc8PpqZIe/N0LDCOIZrvvPGuSqdileAwDMhRk+LqwtLGi/Os6WTH15HAdsAZsjgMDRJi8P4yL0k
	4yzH0sPUa3NjhXKXv9pjgi2Mya09iN8PYzgXukldU+hsftDnqs6eAFiLGAQ6GTnyeDKDMrlSpMJ5S
	dexw2UdMQHjBlCKsJL/8VUMet75j3ij68NTNhvne3nQh0S2gPkbjSL2J1annuCtTDoP+GGjoqb4V7
	7AjZaY32i8KQ6Yjv973Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaE0D-0000000EvS1-0B3V;
	Fri, 11 Jul 2025 13:41:25 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaDqn-0000000EtBv-2nwG
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 13:31:43 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 56BDUjes015105
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Jul 2025 21:30:45 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Fri, 11 Jul 2025
 21:30:45 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: 
CC: <arnd@arndb.de>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <soc@lists.linux.dev>,
        <tim609@andestech.com>, Ben Zong-You Xie <ben717@andestech.com>
Subject: [PATCH v2 9/9] MAINTAINERS: Add entry for Andes SoC
Date: Fri, 11 Jul 2025 21:30:25 +0800
Message-ID: <20250711133025.2192404-10-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711133025.2192404-1-ben717@andestech.com>
References: <20250711133025.2192404-1-ben717@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 56BDUjes015105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_063142_223488_B54BCAA4 
X-CRM114-Status: UNSURE (   7.26  )
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

Add entry for Andes SoC maintainer and related files

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d79d546c2f95..3e16da28de50 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21318,6 +21318,15 @@ F:	drivers/irqchip/irq-riscv-intc.c
 F:	include/linux/irqchip/riscv-aplic.h
 F:	include/linux/irqchip/riscv-imsic.h
 
+RISC-V ANDES SoC Support
+M:	Ben Zong-You Xie <ben717@andestech.com>
+S:	Maintained
+T:	git: https://github.com/ben717-linux/linux
+F:	Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml
+F:	Documentation/devicetree/bindings/riscv/andes.yaml
+F:	Documentation/devicetree/bindings/timer/andestech,plmt0.yaml
+F:	arch/riscv/boot/dts/andes/
+
 RISC-V ARCHITECTURE
 M:	Paul Walmsley <paul.walmsley@sifive.com>
 M:	Palmer Dabbelt <palmer@dabbelt.com>
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
