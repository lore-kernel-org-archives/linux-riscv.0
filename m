Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDCFC369AE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 16:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IBJNAsWYcd+KeJbBwAjM6s+BTZAfMoIJO8wBycMqFmY=; b=So0QtJdim+K980
	aBjLAB3bkGnorc16hcgHRfx62V1yMVqOCXip1G8Ct/YPqSY6tekN6+TfCNn7aY7W56AaY01gU4K3H
	eHAEZCMoxFf4tVbFPEN4nR5zRPUh9q2OiiWFfpyOmsm94m3l5mth1RH8eaqOkkGNzpwroFI/OTKHj
	dRIG3kbaK/1NetCiijEMdEBxhe4bpAQluMI8xvor6BuRU3UJR6SsBHOUmvpGVAeXN135A7NurF+8y
	tbuR4VrKVYUd/ZARLnGf1H+WFxTpSAsP5VT8RAPWiNz9sfmmPBZxaFNlZ6COGps9/Q8X7ebbybIf6
	npuEwjJs+5SIqRbp4F8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ugp-0000000BABR-1LfT;
	Thu, 10 Apr 2025 16:23:43 +0000
Received: from naesa05.arrow.com ([216.150.161.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tmV-0000000B0Rd-06eM
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 15:25:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=1119; q=dns/txt;
  s=NAESA-Selector1; t=1744298731; x=1775834731;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0ALTharMqIir38+9/Eaz/083RGv8Pd04I92YF3XKwHA=;
  b=AyVujCFxrefZoS1hMhQQEVhuxoImHxDAxCVyoXPhWpimupprESDMwg+b
   NYbRmf5SXCsMnEib4ROMR2uqL0yjD37+eoaVKGsiH5VSWtBvfI74fd2IR
   weoGuoB/vlGh617gjf/YwwThBXeieUbiaLV/aaTc2nux1OLCH5V1QTb4y
   ehMvMsCaOmJkCmud0kpk4LMSg768pVCU3EoadKbsJYFku0AYu7whMUUi/
   hqse4x3MzLxR+drkb36JGH0YwHuthwXYzTOR/bwZYvWAzLtVAqpumwd7E
   7x9KCuFRllD6di4QjgXSJcDJYFgO2azKZ9IYk/xnbZ8PYJ/ZgGpINMSft
   g==;
X-CSE-ConnectionGUID: Zg2yWIv4TA+O4q4GuWobTQ==
X-CSE-MsgGUID: /xrgsOCzRd614IqeuqU/7A==
X-IronPort-AV: E=Sophos;i="6.15,202,1739862000"; 
   d="scan'208";a="22515093"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa05out.arrow.com with ESMTP; 10 Apr 2025 09:25:29 -0600
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
Subject: [PATCH v3 07/10] dt-bindings: interrupt-controller: Add ESWIN EIC7700 PLIC
Date: Thu, 10 Apr 2025 20:55:16 +0530
Message-Id: <20250410152519.1358964-8-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 10 Apr 2025 15:25:20.0048 (UTC) FILETIME=[C5268300:01DBAA2C]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_082531_129275_26E52C1B 
X-CRM114-Status: UNSURE (   6.79  )
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
index 3dfe425909d1..ea7093fde060 100644
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
