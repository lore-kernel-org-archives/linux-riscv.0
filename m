Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C99CD98C7
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 12:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lopdtsRmLFOGjs9Ffz7sgCe30il2FAKkOvIBS3qpg84=; b=ZGuM8pVFBltvMc
	jTcXc0tNN9a2NxjeCm2ihnlwWOSRVtSJdyA+qRJvywpRx7vMvJyx6dV1z4x8saI1Ep77mPpYMfh6+
	SxHebY4rAErHSH058+FNrCZICqmeiXgrKCvdWnNakt0+HyhN53B/sdsH72uDFGn8yhpNECmfoq1l5
	OWDna71GzM5k6Agts9XmMMHW37N8ClGxkPSoy8y5cSc9M0Pyxc9tanN3/45/FOmGmR3VfEJYmXJM3
	9LugEs7cKPPNq8xGOEAXpbJroo1Jf2OlXj1LlQubp5Ph/JppxG+PHuxFDfkCtDWilR0pv3xfckhBT
	OJNrEIImWj3tMDBJfkjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6Il-0000000E9uz-1tMo;
	Mon, 15 Jun 2026 12:20:27 +0000
Received: from naesa05.arrow.com ([216.150.161.26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6Ii-0000000E9rs-0ykN
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jun 2026 12:20:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=973; q=dns/txt;
  s=NAESA-Selector1; t=1781526024; x=1813062024;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=93XT2CFEttEQnwRkUkGt+mqMWaXh6HjcoOK57M858G0=;
  b=IGgytbdYJhtdnTOxvY55HNsGlcqTetFlDnULm1hMuJv3okPU5CAjF5kc
   fXP+5SeX1HQKtdB/vyoUAB+Nc9LHZJy9Vg5+xLot+tuGLB5sRPQ2Tyh2O
   Q5kcHQj2++7A1WbI1scczbsQJDW+tNkW4MhspnNPaKMvJlVq3FZr/wON1
   u1upXxRgTOECxFsA4M04urMBti12N467ttDeFwgphgwToatsatwM9Pm9H
   VZccVzQrPniTMrcWphlkkFaXo7WeYu5Eml2AVuGPQOvkeY5rTREHN46Xb
   FgwsirpEeHn61i4BHtjXgJigkVTO1S8ogpp3Uh96IeZVPFQZ4e8KdNCB3
   w==;
X-CSE-ConnectionGUID: VPFatQJHSea9q3nWSKALAg==
X-CSE-MsgGUID: cFr0gn4hS/GyvWFh1CIsuQ==
X-IronPort-AV: E=Sophos;i="6.24,206,1774332000"; 
   d="scan'208";a="55984205"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa05out.arrow.com with ESMTP; 15 Jun 2026 06:20:22 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.20348.1);
	 Mon, 15 Jun 2026 17:50:16 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>
Cc: Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: [PATCH 4/7] dt-bindings: mfd: syscon: add ESWIN EIC7700 compatible
Date: Mon, 15 Jun 2026 17:50:13 +0530
Message-Id: <20260615122016.1110206-5-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260615122016.1110206-1-pinkesh.vaghela@einfochips.com>
References: <20260615122016.1110206-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 15 Jun 2026 12:20:16.0973 (UTC) FILETIME=[533DF7D0:01DCFCC1]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_052024_330108_6EFD6D36 
X-CRM114-Status: UNSURE (   6.33  )
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

Document ESWIN EIC7700 SoC compatible for syscon registers.

Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index e22867088063..7d3365601249 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -62,6 +62,7 @@ select:
           - cirrus,ep7209-syscon3
           - cnxt,cx92755-uc
           - econet,en751221-chip-scu
+          - eswin,eic7700-syscfg
           - freecom,fsg-cs2-system-controller
           - fsl,imx93-aonmix-ns-syscfg
           - fsl,imx93-wakeupmix-syscfg
@@ -175,6 +176,7 @@ properties:
               - cirrus,ep7209-syscon3
               - cnxt,cx92755-uc
               - econet,en751221-chip-scu
+              - eswin,eic7700-syscfg
               - freecom,fsg-cs2-system-controller
               - fsl,imx93-aonmix-ns-syscfg
               - fsl,imx93-wakeupmix-syscfg
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
