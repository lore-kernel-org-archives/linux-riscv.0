Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEE1C43458
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 08:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b4CZH2jaVpcnd2MdiT3VI6OWY67qYu5hjfjzwevSV+I=; b=mhJ21lqIBI66zA
	Uoi9wMkCxfNIu6KfaxsNCsW3nUl06W8AzyXIqcKC8vJOk9iQ3nxU2tqRjfK93sqdwJS1q7tlBcPkJ
	VdT9frhxS6BJ6faCdSfvQEOp3pdFlwv2r6qR9oh1/jG1UzNhqIE+3XWZroRXfU689HhNFfiwohQmN
	FdbxAzw8HWRbfVxBjRAm7r7o1HQ8Dz80nH8JYdLgggeIZ6OyOFzOGgiqPqTtvaT4naLMNc1zckFc8
	KVT7gNghM++A1P16xUKjN8GTQ06sTC5Doynx8EnmU02Dc0D+IxLgyw21v3nArsocy16we2XVXjYCv
	kKXDTnWXum5BT19r/oIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgePy-0000000BmkH-3ylG;
	Mon, 06 Jul 2026 08:11:06 +0000
Received: from naesa04.arrow.com ([216.150.161.24])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgePw-0000000Bmi0-1Cot
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 08:11:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=908; q=dns/txt;
  s=NAESA-Selector1; t=1783325464; x=1814861464;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5/2A2ZLlbiY9nslJ7nQB+Yn+IkxiipPp1ULDmEpmnRE=;
  b=mi0dVfvh8pxSaUwD3jn/fwXLeVsEcMNwUIjXXEQ/sPMaYOWbic58CUoW
   cxJ15vWLWLqP9CR20Jx5WwsSJ/5GPHF6EVr7125L1B0/ytwPcsm1vybCD
   mOlHbV2AhzO63hNHL3tDAMOuUXgtjN98reJ1AgP979j/0j79GgumzO6E2
   W4mHkYfq1uwuEpY+dkBSyF7mhUK4sy/Vcu3wL4HO6/nhswlKQqtqPG2TJ
   K54+tNKfuDYMUpI7q37pfDniHy9AcqntNhnjI5xqwHaSsAsq9jBmkgjxu
   EKNm9fuK2N6uS9fuUjJvBRE5sOU6KTrbz0e3L0A8w4udAnBgieLVcAcXW
   A==;
X-CSE-ConnectionGUID: 6Sm6QVssSSeWqe60tDOTvA==
X-CSE-MsgGUID: f7zPlaLKSwarz1Nj5zfnvg==
X-IronPort-AV: E=Sophos;i="6.25,149,1779170400"; 
   d="scan'208";a="116963499"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa04out.arrow.com with ESMTP; 06 Jul 2026 02:10:57 -0600
Received: from AHMCPU1888.localdomain ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.20348.1);
	 Mon, 6 Jul 2026 13:40:55 +0530
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
Subject: [PATCH v2 1/8] riscv: dts: eswin: add reset generator for EIC7700 SoC
Date: Mon,  6 Jul 2026 13:40:48 +0530
Message-Id: <20260706081055.1126275-2-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260706081055.1126275-1-pinkesh.vaghela@einfochips.com>
References: <20260706081055.1126275-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 06 Jul 2026 08:10:55.0875 (UTC) FILETIME=[F8685530:01DD0D1E]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_011104_381164_ABD0BFBB 
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
