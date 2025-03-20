Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F8BC36000
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 10:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RtbUAFvpFlcy7/xJnOAvNJIoQdWlFIpqtpQKAQKT5/4=; b=xslR2DK6FHm7oq
	9cp+17RDVN+K1WNiINtfSmk/+7QHsNE3VSrjhcSSD36lobHSPOOPLRFmSnRhTm0VcLtFHXapd0FMu
	qhP5ze5WuSGaHihE0zkD1qM3YkP701pMB6OARVsQuwOUY2q/RMeGolANQ68atPuVBzSFwYnFiGdxG
	15SG/A/2Y5911Jbk1GcJEf7DT8ETNydikRygNaKmn6k/LpT7QFi6wRxDmIR86iypzQ3IXOsKyZy4W
	N/vLlzSET1WDHbRRopQUZ+5FNxpzaH5+eGn/VG8ss6kQLCSNjs9iVynxNCtS8V1UZ2l3eJTAIciYX
	LlbIaL0bb75NLWkTls7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvDYB-0000000BryI-26zg;
	Thu, 20 Mar 2025 10:54:59 +0000
Received: from naesa03.arrow.com ([216.150.161.23])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvDY7-0000000Brvh-0O5P
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 10:54:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=754; q=dns/txt;
  s=NAESA-Selector1; t=1742468095; x=1774004095;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UqA7xvW45JJ2k7vIZdX/kp4Mb5++ZRHaADRZ/l5k7Zk=;
  b=qrWHhyzR9v1Hpfz11LskLFji6Tpvt87YwaKQfLH1aK3sBGHvnbVuwUg7
   OjBcTFMnMtJveV4fYhjHqgt3F9TNnwHgdsabjXcaaaUqc6wM5pId3jmlM
   8UE5CR5I/CkmNNfFQ8F0T3KfYriKp89UQCVPAW354qn3csbY/NSQpZyoI
   cNHYYw1gvv9i+UF1oz924Wpa3Hw6rw4ybfKxOmLnAbGAwRWOf5nOVAC6r
   5hfVK/8KWuC/8fz3FIj3tizEE/fIUfeJu6ggq0Mk0QNzCl02tz9ZDMYs9
   zt6ozBJbEJYgNt/Oho8eJuLTiZJ27N8g7W7vk6EYqf0Jbt1xnSxakXttz
   w==;
X-CSE-ConnectionGUID: TK4OG7BjT+y7bjzyMjSTuA==
X-CSE-MsgGUID: bN16bQlASxmwwdUoTjelLA==
X-IronPort-AV: E=Sophos;i="6.14,261,1736838000"; 
   d="scan'208";a="80317533"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa03out.arrow.com with ESMTP; 20 Mar 2025 04:54:53 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Thu, 20 Mar 2025 16:24:49 +0530
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
Subject: [PATCH v2 02/10] riscv: Add Kconfig option for ESWIN platforms
Date: Thu, 20 Mar 2025 16:24:41 +0530
Message-Id: <20250320105449.2094192-3-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250320105449.2094192-1-pinkesh.vaghela@einfochips.com>
References: <20250320105449.2094192-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 20 Mar 2025 10:54:49.0788 (UTC) FILETIME=[807C9FC0:01DB9986]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_035455_191350_3A33FAE5 
X-CRM114-Status: UNSURE (   7.94  )
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
