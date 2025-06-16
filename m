Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C41C71155
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jun 2025 12:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uwxml3nTYLvczo++z50RmCxSkT/VcGen6csI0ZK71FI=; b=wfnjJPMJR2nF/v
	yKbzaPO/0oO/x7JoQdbRkfqItmWq9/t3tqZm83y3NPxsksbTjxsW0B5aVXb2s8AhnUpFkgznz3csf
	q3kTjP++8RzRqqbAWe9Z2ULcu0K2RHt4Zi1eR/7ktH0q6YAqfJ3/s5l7x7bOJ8UH91uo+rZoGj3S1
	IAIP1mHC/JQ+PbRUbKFWJElY5fH6g9Z6Dmoe8fWxPK14v/jYqIOHPwTw8XWT7se4rFkckYcvthITG
	AXHEQ4MwyTbhm1JBpUHIvdXxReCJWXYC8k036bz8n6H/8NzoEbkPeC9LsHxPvSB8aPn6iCji29Bbi
	GKu2qsnctL87bIcg4Z2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8nZ-00000004L5U-0RY5;
	Mon, 16 Jun 2025 12:18:49 +0000
Received: from naesa05.arrow.com ([216.150.161.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR7vy-00000004BbQ-1lTZ
	for linux-riscv@lists.infradead.org;
	Mon, 16 Jun 2025 11:23:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=754; q=dns/txt;
  s=NAESA-Selector1; t=1750073007; x=1781609007;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i5P0tKBpmZ6mD0d91tJFPrQutrJ8bbOu8k+h7YJYWME=;
  b=sgLIy/1jUsTCjB/e1h4QXpOrYZbwzbDNwJdzRbxOUSZUzehiODOnbqh0
   HVmfiJQ3soQtDtNK2JImN7VKWDIwqQngW1gfb9RF9hshIe76CJFJyQ5Vz
   5sn3DSAAZg8rJpjdd0YiBXs1R23RHanT4wqHsl1Bl1wwpVE2y/mpqJX/c
   m0ns23uZHJXYUFGYPJkg2pDkw5j4WUXJ+UyPor7WoGNumTNMVVmcZrtXl
   3TyjZcXnBqFCwUaIZ8HR8oSWoFMdjDUvMh48GgQ7qqECtDyP1Y6KscAt2
   iJVM7emFUVS1fouYxomJIgYcc+9MEG8o+MYzR4OgPPN7vOVnX3JLhlS44
   A==;
X-CSE-ConnectionGUID: wvjxoQH1TlWxvJvbzsG3bg==
X-CSE-MsgGUID: AqhCloNkQuiGRCjFU3ZN1A==
X-IronPort-AV: E=Sophos;i="6.16,241,1744092000"; 
   d="scan'208";a="26863656"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa05out.arrow.com with ESMTP; 16 Jun 2025 05:23:20 -0600
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
Subject: [PATCH v4 2/7] riscv: Add Kconfig option for ESWIN platforms
Date: Mon, 16 Jun 2025 16:53:11 +0530
Message-Id: <20250616112316.3833343-3-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250616112316.3833343-1-pinkesh.vaghela@einfochips.com>
References: <20250616112316.3833343-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 16 Jun 2025 11:23:16.0452 (UTC) FILETIME=[0E16E240:01DBDEB1]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_042326_515262_E6026C2D 
X-CRM114-Status: UNSURE (   8.40  )
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
index a9c3d2f6debc..3cd0999fe84f 100644
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
