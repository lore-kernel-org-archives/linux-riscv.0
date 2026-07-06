Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB60BC43458
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 08:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kcb7WJWZOXrk18270Qf/TTwwzBi4uBptoydtF56A7Zw=; b=h0ragFvH09EzE9
	poWulPQAVDxsHcTuHmAXaC5Rk7o0QH0AYvBc5sbNACE/+2aBDu1VCSPFv1m+Mycozt9OoQHIqr8Hy
	Vqe046QrOFO+Jo+frLI+2iIwKcWTMVun4a5zWuu5D1U1ifjKR4ztSm6ERKs4yAmMUfAUl+PoZdzUH
	Kop5W49j/DrPOAZZhSb4q/Qu2Cgg2FquaxwIsVXy3ibKzi3qrnqlTLBL/BMrbts64zz14KvzIVolP
	4sr3logg1HAxt9yxETGbrCsQ5FJartU1f/xRkdfYhytVvUHmH6xIfUvZMlxFv2EJi1MlDLUhIhcEZ
	5dpVhr5fGlvKGO+7JIbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgeQ0-0000000Bmlm-17Tm;
	Mon, 06 Jul 2026 08:11:08 +0000
Received: from naesa04.arrow.com ([216.150.161.24])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgePx-0000000Bmi0-2Nux
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 08:11:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=1026; q=dns/txt;
  s=NAESA-Selector1; t=1783325465; x=1814861465;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NZrSLv+fD0qvW7IF5sK5E0CXoCtasghvxf6Evd3A7pI=;
  b=VB2dU+Ze524BP0Glni1JG4PTWmikXyqkav4LxOr//yjd/VXMeLIQRHQb
   OK0C9ERx0U/vel1zUo6ve0HIryqDRBNMILjveJ+nIH7bsTUc9H4PU0B7v
   mER9+wlIzCjK7D1J3PXGFZUFxTI1pe31poy3JfICan7KppcpsJ8L2cJbi
   3QIv9TV5dI43ZeFCOSv9s/JdgRN7wgNkSQPCCK3pC3liuUli166xcKI4b
   1mm4dEJ4d4Xib7RpVg7YXinpAHT/ess9lON7f3teBMr90CzfB8/YoQ2b5
   WuF37p3x/R8IWrPR571tSXvPxo3pWNbdwjKXWpC1BJ3aGmVkxsLe+eixp
   A==;
X-CSE-ConnectionGUID: LuIlBorcQ7GGDNRQCXwq+g==
X-CSE-MsgGUID: rybvLLsCSB2o/AYWinDLkQ==
X-IronPort-AV: E=Sophos;i="6.25,149,1779170400"; 
   d="scan'208";a="116963509"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa04out.arrow.com with ESMTP; 06 Jul 2026 02:11:01 -0600
Received: from AHMCPU1888.localdomain ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.20348.1);
	 Mon, 6 Jul 2026 13:40:56 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
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
Subject: [PATCH v2 4/8] dt-bindings: mfd: syscon: add ESWIN EIC7700 compatible
Date: Mon,  6 Jul 2026 13:40:51 +0530
Message-Id: <20260706081055.1126275-5-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260706081055.1126275-1-pinkesh.vaghela@einfochips.com>
References: <20260706081055.1126275-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 06 Jul 2026 08:10:56.0050 (UTC) FILETIME=[F8830920:01DD0D1E]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_011105_661550_A474A7F9 
X-CRM114-Status: UNSURE (   6.49  )
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
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
