Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672F6C28B2E
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 07:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WVu53AAjpyekOopxWlfGBppBBbagb1oaPOvKFuXS6rI=; b=juminB6IiRrOfX
	4gBGzcNkZZg6VT2YEE0JEcfvpSqWE/qW5xk00ZCrtOxwHzlgbefs3jAJtnoI2nnag5cyK3mM40VBP
	3LyfgD+uEBzbxpST4nfFUU7Yu9AKXOwMOGimBKz8aheT+QYPAAPPBGzSUBCJZylGss2+eqaCiV3e1
	ryikROoTROy0PndZVDyvnfaFxX7RxfZ1V9n4yCJhkw7Rcw9SA6JXlEsqf0Qd6gGmBwGWAy/wASrjK
	+F7qWohbspCkikT0Zvs7niB8JtrifJUM3W+p5HAryBPdLKjWAHk0W8qzvF3ky43RkRuAqdkGiXONr
	m95cyz38e3MxICRdKbUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tru9c-00000004qzP-3XnR;
	Tue, 11 Mar 2025 07:35:56 +0000
Received: from naesa03.arrow.com ([216.150.161.23])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tru8N-00000004qe0-2T7j
	for linux-riscv@lists.infradead.org;
	Tue, 11 Mar 2025 07:34:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=701; q=dns/txt;
  s=NAESA-Selector1; t=1741678479; x=1773214479;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rFFOc4JetP/QPixsfrXS6gb/c2VRdP/QXiDKL5gzO/c=;
  b=E8DNC4IZWEv3o1lAa0A/8iH13gm6Qmy3YzkyCWcqA2vSneWfgVkeRuJa
   p43HcSnpUIYiQ92gRvYu+Xl/7tN3dm/xUa1iYhg2W1rXqTn9AMCWuyvvH
   x+NdAsgGLoUfeKRF45GZM4lkv0D7zQOkJEKCrgRrSXXnXQPc1VKPlT1dU
   2tIyQHUVvwXZCIIVXsoag8wrudd0gSlovH4ctNsCJw4ZX4ezhyPbzDK4F
   wh0fjx4HWtbQxm8U/PahPoAaAD5siaz3w92mZfIUmLbeRihJFvOQk03lf
   c43G2IXE9alG/QusMBWFrAjLj4Cl0O194ewP4T2BCzsXLQBG7ZgThnI6o
   A==;
X-CSE-ConnectionGUID: yDlfVTvBTBmHRQoqG9TNmw==
X-CSE-MsgGUID: cXcqB/SlQpajPCiGlG4QiA==
X-IronPort-AV: E=Sophos;i="6.14,238,1736838000"; 
   d="scan'208";a="79624710"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa03out.arrow.com with ESMTP; 11 Mar 2025 01:34:36 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Tue, 11 Mar 2025 13:04:32 +0530
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
Subject: [PATCH 02/10] riscv: Add Kconfig option for ESWIN platforms
Date: Tue, 11 Mar 2025 13:04:24 +0530
Message-Id: <20250311073432.4068512-3-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250311073432.4068512-1-pinkesh.vaghela@einfochips.com>
References: <20250311073432.4068512-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 11 Mar 2025 07:34:32.0782 (UTC) FILETIME=[081346E0:01DB9258]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_003439_690330_3F31C20D 
X-CRM114-Status: UNSURE (   8.10  )
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
---
 arch/riscv/Kconfig.socs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 1916cf7ba450..35594e365ca6 100644
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
