Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2511C3601E
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 16:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q9sKCG3x9xsjDs5tQHm/4wWgEYP+YwAx/L+wzAqHHP0=; b=OFyMAKpk92vOAG
	JeptbbSXpm8hCNrpWXhHRVzYo7hAivvb1VvoypobGZKBNQuvBp5ODrAr1lXiTmVZhQSQwdJaIpKJr
	dlNPmqdtfExptyLAiNZWR9cNIVW6GL/MaI9coM3Z81t78xGNOVAzejAETgglwaiJvtvLElTrgx/5X
	5xqBaRZ3dLC0cOQYSFPzlLtMbgDDPi8VxSLQZYSyBtrwOne/o6wNHy0DOocPRI3Ime4y9BL/RChcx
	BB0XybwhyO0YXFTz/BOFRYab//Mc2t0mbsdCvYxc7Hyf4uBxh5ErtszGNRDpPc7quNPlQ/Tn+Tpzh
	ev8iLRDRraI8mTvOgV4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ugl-0000000BA7s-0dzR;
	Thu, 10 Apr 2025 16:23:39 +0000
Received: from naesa05.arrow.com ([216.150.161.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tmR-0000000B0SE-1lvr
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 15:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=754; q=dns/txt;
  s=NAESA-Selector1; t=1744298728; x=1775834728;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4iz47uWhgDwAGELAP/lwoYiYUFXUkygFkriWw75uAk0=;
  b=K2aeIURqWGgEgCo+CKAQv7bLWOmyH0t6lWhgYEXzHczjY543xyocXaAa
   vpoocRnhs/eKuctyUys3VeMH6kHQdkx1ojvobNBTegC+Bf02VFgYOQgsN
   53FH8y6lGXwbM+aAHWPkW6L7BsC/E32EdlyfJEi05e8eZInLXhZzGsxFr
   eaQbyq8/K19LnECD8MZcqWHFVNtomRMAe+1dOGPGblWBiZNRBUuXhlb09
   w1Mik4kTpaeRxKGYoKZ+HWnzNeK0gWxjhekxhhfwr/KKt8G2y+K6YxDPS
   cR4G9lA+1AxGJUW55oOriqDO2vQw7qZBByOogVIYiShiRByAtRYCG3KyZ
   g==;
X-CSE-ConnectionGUID: u6l8qhczTg6tOG25w8u/tA==
X-CSE-MsgGUID: zo0yxxpHRgi9ZOOQ8t0nLg==
X-IronPort-AV: E=Sophos;i="6.15,202,1739862000"; 
   d="scan'208";a="22515075"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa05out.arrow.com with ESMTP; 10 Apr 2025 09:25:23 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Thu, 10 Apr 2025 20:55:19 +0530
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
Subject: [PATCH v3 02/10] riscv: Add Kconfig option for ESWIN platforms
Date: Thu, 10 Apr 2025 20:55:11 +0530
Message-Id: <20250410152519.1358964-3-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 10 Apr 2025 15:25:19.0631 (UTC) FILETIME=[C4E6E1F0:01DBAA2C]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_082527_523259_A76B9F57 
X-CRM114-Status: UNSURE (   7.93  )
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

Create a config option to build ESWIN SoC specific resources

Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig.socs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 8b503e54fa1b..e2a8022bdebd 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -1,5 +1,11 @@
 menu "SoC selection"
 
+config ARCH_ESWIN
+	bool "ESWIN SoCs"
+	help
+	  This enables support for ESWIN SoC platform hardware,
+	  including the ESWIN EIC7700 SoC.
+
 config ARCH_MICROCHIP_POLARFIRE
 	def_bool ARCH_MICROCHIP
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
