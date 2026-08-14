Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD53C5CFC1
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 07:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B3GK0/q8vcZZCbry1FL3zh9PgCRmVNcC+FWgIL7iu2c=; b=yi8lYGAabpkIgf
	kSSdx48dG3nfOd4b2zoBsruMnbTK6eKwifvKyn8Yt6CRuA2PMbqd7g9nfH7jjBZ5EQDigDKl4iwZw
	v1YXzFRd7cRsjVdubXy0Cn7pGoF7jgRuM41msTAwo5SZOG9Ye1wqThCAvIfBFQZ35VoMvSOAputqJ
	lnod0mxD8z06QqGtnmUt7Xlgc/yslilRsNTNdxG/Ihj1LJbT21zz1MZem30oFOm8l2UIOXzzEQ2ce
	hh8nzQH7/evywKHYeccwTQ0VosHlXOLhaF3CwdNfJNRNnQ9K1SyWPn/2vonwJt2ZvUljZQjPigVI2
	OqJKPupWBI6Z+988BBcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wultt-000000024JH-3kLq;
	Fri, 14 Aug 2026 07:00:21 +0000
Received: from naesa05.arrow.com ([216.150.161.26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wultr-000000024Gj-0hCT
	for linux-riscv@lists.infradead.org;
	Fri, 14 Aug 2026 07:00:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=1135; q=dns/txt;
  s=NAESA-Selector1; t=1786690819; x=1818226819;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fhMulqfAdieip+w70VJod08BqyqQUojtyVidc3DwEBk=;
  b=QMi7jJtOOZTaWrqOThrz5Lx9W4zDR2ddV/hRznTqmGSVsrY01WqCEsUq
   Ekoshrvd83SJgNHl94B+aTaoCr863kOfg/9sIY/Yk+0JONNWArUAO3ow2
   VB/NpfPsiDQfkHgXlto2INJ26X2wNmjUVLiOj+VjvxpAkeNh655eRnjWV
   br/lmjbqF0MVDxfBKLMq/44gYTS1DryMWJpkO6IisNib0xWqiUiDGIFA7
   aPIh449q1ZEeC4XGhGxpV0JDdkpLC7mwpI1FlupOoJXI8OITtSjyczJ6T
   7qCxO0M9QOfJX8neD94dqExR2BCsEl0bTB0ZkhSSUXDSjv/kpHABjsFvK
   A==;
X-CSE-ConnectionGUID: D2MRIlshS5eTkSOnVv6Zlg==
X-CSE-MsgGUID: xw53bJ8pSPCLJEfjZsM+ZA==
X-IronPort-AV: E=Sophos;i="6.25,222,1779170400"; 
   d="scan'208";a="60479738"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa05out.arrow.com with ESMTP; 14 Aug 2026 01:00:13 -0600
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
Subject: [PATCH v4 4/7] riscv: dts: eswin: add hsp bus node
Date: Fri, 14 Aug 2026 12:30:04 +0530
Message-Id: <20260814070007.1662455-5-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260814070007.1662455-1-pinkesh.vaghela@einfochips.com>
References: <20260814070007.1662455-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 14 Aug 2026 07:00:07.0708 (UTC) FILETIME=[8A69BDC0:01DD2BBA]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_000019_359426_02F5D1E8 
X-CRM114-Status: UNSURE (   7.51  )
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

Add an HSP bus node to manage the HSP CFG clock used by HSP
peripherals. This clock is required for accessing both the HSP CSR
registers and the register spaces of HSP peripheral devices.

Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
---
 arch/riscv/boot/dts/eswin/eic7700.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts/eswin/eic7700.dtsi
index b16e3e28632c..771a88645d83 100644
--- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
+++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
@@ -252,6 +252,19 @@ plic: interrupt-controller@c000000 {
 			#interrupt-cells = <1>;
 		};
 
+		hsp: bus@50400000 {
+			compatible = "simple-pm-bus";
+			ranges = <0x0 0x50400000 0x0 0x50400000 0x0 0xa0000>;
+			clocks = <&clk EIC7700_CLK_GATE_HSP_CFG_CLK>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			syscon: syscon@50440000 {
+				compatible = "eswin,eic7700-syscfg", "syscon";
+				reg = <0x0 0x50440000 0x0 0x2000>;
+			};
+		};
+
 		uart0: serial@50900000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x50900000 0x0 0x10000>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
