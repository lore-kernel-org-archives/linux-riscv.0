Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0991BC5CFCF
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 07:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iNI9X3vCIiWAwGyQadiwejN8lbplRzbNe663tvACu5Y=; b=Xpej5JeIJv3467
	7X20GAzAWF5siSkakb4eUiLonNUIORWsk8NpbTKhfpvD7ER6wm+PK44jyYyAIiDioFixClbnwTIog
	ePEqQRHJapZVkLD70WhlqhKKLcLnbtquJMuXAYNjf3NwmnRzXxPS05djnzp/b+3dSA/e0CCGREnkB
	T0aWSC2cmEp4d6rAxT8zg81mVa75cY6Q9Np65tJ5YWhoyEHTPkyNEuAlfm4PrhAdIyLM/QsPCZzBd
	fuCBBFBHyghUEiFwlqh1tY7S0xpsKnCIMiEOJ+i6kU0xGNycoVuNVnC85+q/elbnZmKUjZ2mxJRax
	vJGcPUMFGiOlVZs00TUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wultu-000000024JL-01ai;
	Fri, 14 Aug 2026 07:00:22 +0000
Received: from naesa05.arrow.com ([216.150.161.26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wultr-000000024Gp-3WPs
	for linux-riscv@lists.infradead.org;
	Fri, 14 Aug 2026 07:00:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=1013; q=dns/txt;
  s=NAESA-Selector1; t=1786690820; x=1818226820;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RFCB65wa4dZGmLVFZqs+LWJsSkVireZtnJei79QMCq4=;
  b=aAWOlwveYchTQaCLn7P1jljpH4ehqKDuSqZKpBZHX3H098Merf+Jmsz2
   3TtDuWClKP6Ny82vvauoK7FRvKPbpAWoZJFiPGrYpMArQ1VCmLo/KXmgj
   tVVDIFOA9VuchKKJ1USMzOR5lnyP8/97g5ZmNodUohmMkOA981UfRJNvv
   DCNyPNzFHPrJ8xxVS9K0oiK22Wod0ORDrt5k0OKUnjiX6f/o7acVTWfdd
   XxWyVIcoslVcsU1x04wjhM/J/F9uN1yUqXSHrZwf6llRki7XjXjvqDeYy
   1tifRd7TlHCfOqMmK2BfUrUk8l767vyAS8RiD8gsRezPVCi4cSy2lMn+z
   w==;
X-CSE-ConnectionGUID: UfXBPLLNRxiPI1eKkaMJ/w==
X-CSE-MsgGUID: cHZ7lFKvQHi9JIdY02nR3w==
X-IronPort-AV: E=Sophos;i="6.25,222,1779170400"; 
   d="scan'208";a="60479748"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa05out.arrow.com with ESMTP; 14 Aug 2026 01:00:14 -0600
Received: from AHMCPU1888.localdomain ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.20348.1);
	 Fri, 14 Aug 2026 12:30:07 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>
Cc: Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: [PATCH v4 5/7] dt-bindings: i2c: dw: add ESWIN EIC7700 SoC I2C controller
Date: Fri, 14 Aug 2026 12:30:05 +0530
Message-Id: <20260814070007.1662455-6-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260814070007.1662455-1-pinkesh.vaghela@einfochips.com>
References: <20260814070007.1662455-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 14 Aug 2026 07:00:07.0755 (UTC) FILETIME=[8A70E9B0:01DD2BBA]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_000020_000967_B8B23AB7 
X-CRM114-Status: UNSURE (   5.86  )
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

From: Pritesh Patel <pritesh.patel@einfochips.com>

Add compatible string for the DesignWare-based I2C controllers present
in ESWIN EIC7700 SoC.

Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
---
 Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index 467bdcbb8538..ea3d4d4c299f 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -40,6 +40,7 @@ properties:
           - const: snps,designware-i2c
       - items:
           - enum:
+              - eswin,eic7700-i2c
               - mobileye,eyeq6lplus-i2c
               - mscc,ocelot-i2c
               - sophgo,sg2044-i2c
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
