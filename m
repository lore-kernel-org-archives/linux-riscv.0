Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C338AC71136
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jun 2025 12:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lHDxr55eD5vyopzxF0t8IMPROheONT8ZxbTe2wL51aQ=; b=pCQ3xj6Oagm1On
	itS5hK4YvJH84yXxks2V0QUkvW+Mpng0AlC6xNUrUa3i7R+/7ZZrXdqDyGnFC7fzFjNiPI2gZzJhS
	a621Zjuu+2WNhJsQpm6aRodmxiG3fWChBswjtWpygc1T7XsRPzmjXxW31Yvvg+uOB5Q3DexVsmIzJ
	mA5vL78kXfcyLckePNUDr2QUcz8C7oreF6zIfJyXZam6p2DCnIg8DpnErpG2x9efjlhALIaOJylZM
	OlaLQXlZTxjaG/WsLL8jgFCOdva2ekqIDfWneg+L+79sCgaTk22x3hu5Gq7uAwUKQh5OuNs2QTCb7
	DfIeE0OZ+Ti8ovzUEZhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8nb-00000004L6o-0KyG;
	Mon, 16 Jun 2025 12:18:51 +0000
Received: from naesa05.arrow.com ([216.150.161.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR7vz-00000004BbQ-3GQ0
	for linux-riscv@lists.infradead.org;
	Mon, 16 Jun 2025 11:23:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=1119; q=dns/txt;
  s=NAESA-Selector1; t=1750073008; x=1781609008;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JrJ+umgrNMzWySXESlaKAGuivVKus8Rx3Q4aaoBen2A=;
  b=Zf2UVNzhp0LakHOzQDvz4sDP4taLa6olc3WdCeCEyJxR1eH2WjDDpiYP
   P21eErpDNSAhF3e8G6z06P7HMg6WLv29hdQVij25aEZngg7js1lQo/POn
   OPSnYv3/a8UlQFYoIG38JYptnejK4SKltkZNZe+YK+7jyu9urSM0iZ31X
   kinDCeOaDk7wPP2OHYSo/Q6FhxFNTT9gikKEB1/0PvQgQ4RTruv1d9/ST
   HHNAouqZP5GmVQ12yZsRXYoYX1jZYtWvliJP8e79fsq2qJxLEkG49tdIf
   7QSNf7kOYBa0vwaWlXo0bmP3OiIfLqNwlnkFafWJedh5s3qs9S+NKM4Xv
   g==;
X-CSE-ConnectionGUID: uc0yRbINRSKDmEPJ7RyCWw==
X-CSE-MsgGUID: r8takAGSQ5qZauFTim1zfQ==
X-IronPort-AV: E=Sophos;i="6.16,241,1744092000"; 
   d="scan'208";a="26863673"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa05out.arrow.com with ESMTP; 16 Jun 2025 05:23:23 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Mon, 16 Jun 2025 16:53:16 +0530
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
Subject: [PATCH v4 5/7] dt-bindings: interrupt-controller: Add ESWIN EIC7700 PLIC
Date: Mon, 16 Jun 2025 16:53:14 +0530
Message-Id: <20250616112316.3833343-6-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250616112316.3833343-1-pinkesh.vaghela@einfochips.com>
References: <20250616112316.3833343-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 16 Jun 2025 11:23:16.0724 (UTC) FILETIME=[0E406340:01DBDEB1]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_042327_910728_50DCDC59 
X-CRM114-Status: UNSURE (   7.44  )
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

Add compatible string for ESWIN EIC7700 PLIC.

Signed-off-by: Darshan Prajapati <darshan.prajapati@einfochips.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index ffc4768bad06..9d7daaca125c 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -58,6 +58,7 @@ properties:
       - items:
           - enum:
               - canaan,k210-plic
+              - eswin,eic7700-plic
               - sifive,fu540-c000-plic
               - spacemit,k1-plic
               - starfive,jh7100-plic
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
