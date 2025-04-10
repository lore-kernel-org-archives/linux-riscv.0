Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522AFC369AD
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 16:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vUDLZlvoAJRXSfpJmCw+RxL/4vflieO+WRqFq8syvYg=; b=BZ03oK6g2iPqnH
	RR7DCGnzB3thxuhEX6jvm8z2tU5JYRti/vS/9RX4v2IZmhKuAbp+/QO8IDu+S69e8bEN8HH8g4j//
	fDllKjxXspJMea9X1ztPdg75Bow/bto93CFFY29DlLdbFNAhR6pVuWQATK3q+zEWeFYXjkCPW658R
	C3TFs7YhDTKB0/f1OaaLrS29i5iAl2wDcVayK0x3uIzkZ0xBvpnvk5drNfYp3+viGhwuKklDwgU0F
	MlcnCrQpdyPj1cZlHCC5KOHBL+T+aKG5MwEG+0jVODPDt2a/3EZ74ta2RBHQ3tBv+ylkdepeeVegr
	1AMf+qFa9z2xzZsAyRlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ugo-0000000BAAg-2LPI;
	Thu, 10 Apr 2025 16:23:42 +0000
Received: from naesa05.arrow.com ([216.150.161.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tmV-0000000B0RB-1SeP
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 15:25:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=1142; q=dns/txt;
  s=NAESA-Selector1; t=1744298731; x=1775834731;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vh3m/Tm8AbCSo/BAWGCeDF2Cu7RkHyCL06L+YfzGHK0=;
  b=r1/fd1kErFwczoFSAjDWlA/zGD4mwkyznlw2Gh8FXFed6OCfZgQZ1xIo
   RJ3yMU3aHNB12oUulCLUSOcHduCWgMzRtxA/tgV/vZMIMj82yZ45Fcj9t
   /DC1jHhKxYiUmqan9KZROPx00We+JjQYjhheNgsEnmQym/32DOl90mB3S
   D/+IrGRjmCX/ICstZFMtv0vqfQERGwJD9Qwicmj163AsxWDHUJo2zEfFy
   HLkkIEfgaUg/gur7SWew+rU0BdfA4+IjDIEtODRxVdq27fJSP/E+Z116+
   r+H6c5qqmlNma55VnN8IWVGHhHpe6OBZiswI4uyPRTKq69i8rkelt11+q
   Q==;
X-CSE-ConnectionGUID: T42YvYaPSR6mmQEFyiBFDg==
X-CSE-MsgGUID: DuVtG0VrSiuiJZeRLfPwyg==
X-IronPort-AV: E=Sophos;i="6.15,202,1739862000"; 
   d="scan'208";a="22515096"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa05out.arrow.com with ESMTP; 10 Apr 2025 09:25:30 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Thu, 10 Apr 2025 20:55:20 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl,
	Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/10] dt-bindings: timer: Add ESWIN EIC7700 CLINT
Date: Thu, 10 Apr 2025 20:55:17 +0530
Message-Id: <20250410152519.1358964-9-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 10 Apr 2025 15:25:20.0132 (UTC) FILETIME=[C5335440:01DBAA2C]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_082531_450581_E45EBA34 
X-CRM114-Status: UNSURE (   6.78  )
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

From: Darshan Prajapati <darshan.prajapati@einfochips.com>

Add compatible string for ESWIN EIC7700 CLINT.

Signed-off-by: Darshan Prajapati <darshan.prajapati@einfochips.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 653e2e0ca878..d85a1a088b35 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -30,6 +30,7 @@ properties:
       - items:
           - enum:
               - canaan,k210-clint       # Canaan Kendryte K210
+              - eswin,eic7700-clint     # ESWIN EIC7700
               - sifive,fu540-c000-clint # SiFive FU540
               - spacemit,k1-clint       # SpacemiT K1
               - starfive,jh7100-clint   # StarFive JH7100
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
