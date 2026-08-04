Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF8DC561E6
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2026 10:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b4CZH2jaVpcnd2MdiT3VI6OWY67qYu5hjfjzwevSV+I=; b=2uuYB+5nWf3Fp3
	4Q0ZstFqca5XyNajE0TFnHYd2+84BHjsML4VrswUfVn2u5nenZPjl1EOnurdkrS1QHq3qicc0Pakp
	yQHomd1kJ61ecRYzvXpdop0SwYdjG9TD1Ai3eVOhOS3J5R+FGzqJPO4/NOkBGguSSrk+9gblbc9VP
	/fcaF4Zrk5SENSHPGUYNI8W+2DGORQwJU11PyQBwb9BNjNfD7xW+Jw/BzyfYdDLiAuf4ffmOxnpHX
	BhYKCadkdhL/BcsrWToqi919GFN71P23sUiCyfNro9enlTdTHwuJQ/MGYV4A0/8+bU/LDe21RLOAL
	sPs8+QqKP8B1gXeVbItQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCdU-00000001a4V-0IB5;
	Tue, 04 Aug 2026 10:44:40 +0000
Received: from naesa03.arrow.com ([216.150.161.23])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCdR-00000001a36-3RH3
	for linux-riscv@lists.infradead.org;
	Tue, 04 Aug 2026 10:44:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=908; q=dns/txt;
  s=NAESA-Selector1; t=1785840277; x=1817376277;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5/2A2ZLlbiY9nslJ7nQB+Yn+IkxiipPp1ULDmEpmnRE=;
  b=FSt1lViL4WqXQaKNFheL+tImBiPIJK0BeiOEBoEGkTLIOzEBtRdeelgj
   5of5Qfc/tV9mW9qGj1NdKBXyJ2V9CG0yjRfauJyTiYghyp85lHCUCrkzX
   h8MGtzgaNM0XLpRbZSn6LnFGOxgLFzb98B6aTA16YUI0l2Af4Vk6Ir7w1
   RCcAXWnJpMKRH/cn4Sqc+UKt4BIYnuMPGtBsRH0XHz5o25B73vSJDCcI3
   J9R+uNlXLe1JCCVQLfuFmF12p/PElMyGjfhVRoKd0WKFgQYkuPy4OE1P0
   OK2CoR1wLupQLtYWDlfnEFW0kIrhwXaQ6AiYtFOF2XiUB6Gh2EoPf3y7l
   w==;
X-CSE-ConnectionGUID: 3Fm09qGkR8a7lht/y6pzoQ==
X-CSE-MsgGUID: y6WoFeIoTdWT6WUT8LoXjg==
X-IronPort-AV: E=Sophos;i="6.25,204,1779170400"; 
   d="scan'208";a="119081803"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa03out.arrow.com with ESMTP; 04 Aug 2026 04:44:33 -0600
Received: from AHMCPU1888.localdomain ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.20348.1);
	 Tue, 4 Aug 2026 16:14:31 +0530
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
Subject: [PATCH v3 1/8] riscv: dts: eswin: add reset generator for EIC7700 SoC
Date: Tue,  4 Aug 2026 16:14:24 +0530
Message-Id: <20260804104431.1391839-2-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260804104431.1391839-1-pinkesh.vaghela@einfochips.com>
References: <20260804104431.1391839-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 04 Aug 2026 10:44:31.0587 (UTC) FILETIME=[3B612330:01DD23FE]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_034437_910993_432206CF 
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

From: Pritesh Patel <pritesh.patel@einfochips.com>

Add reset generator node for EIC7700 SoC

Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
---
 arch/riscv/boot/dts/eswin/eic7700.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts/eswin/eic7700.dtsi
index c3ed93008bca..430a210f01e6 100644
--- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
+++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
@@ -4,6 +4,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/reset/eswin,eic7700-reset.h>
 
 / {
 	#address-cells = <2>;
@@ -341,5 +342,11 @@ gpioD: gpio-port@3 {
 				#gpio-cells = <2>;
 			};
 		};
+
+		reset: reset-controller@51828300 {
+			compatible = "eswin,eic7700-reset";
+			reg = <0x0 0x51828300 0x0 0x200>;
+			#reset-cells = <1>;
+		};
 	};
 };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
