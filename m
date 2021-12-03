Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F18C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 09:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mrrzu66n21Z0Wy5CHF+qYlSZk1IN0rjaCSEatQ3J4Hc=; b=fyVCX35d/DuzxL
	eM1SyWmlSWRA6tW1tEtzxliMx+6cBZJYGFAf39P29XPz7/9OBJ/z+I/NbZuP4aPhDXwS0cw7DF3BW
	o1h0guxxQllUGFvLby1Xri5lbuHY5joo+17FVBHOZnnDwEq450JBPm3y614e5rDlmZvZ6Hu4VGJym
	HftMnLW2idiNmGPc07JGo4+QGFhDUyrnvE3xZxAc07UwtpxQuPV6I0lhk0Y/d08zByme/O1d6gz4d
	25iEKU1t0ugiWTTFtMoC+TGunzzwy08XSV0p4zoUfTjxt8zAHAATX6wLAEFHygd3/hbyTNe/kjr62
	xUOI5DHeb7vagLnf/pgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt5M1-00F3s4-Dm; Fri, 03 Dec 2021 09:59:45 +0000
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt5Ly-00F3rG-Hf
 for linux-riscv@lists.infradead.org; Fri, 03 Dec 2021 09:59:43 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 2C7264381A;
 Fri,  3 Dec 2021 09:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received:received; s=
 mta-01; t=1638525580; x=1640339981; bh=daoEMQCmqx7bfazzx6XBjay6u
 zaErTeaplpZTWUHk3w=; b=gS9TsyFqI0qOGaHC4BFNfMDFsKs7J5jKJ1GfFUJdn
 s8Pm34GFcxdKpzR1F7f5O2gS0lmWt/BKIgz6HFMyHT38grwosJaOR1P37e651uAn
 YR3dhBkWaUKCrVvDzMQOcV9TjhLXqQ9piMvHWfGsLhQqibzSB6ckySoJHQpYXC8l
 Qc=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JBHw_kdhP4RA; Fri,  3 Dec 2021 12:59:40 +0300 (MSK)
Received: from T-EXCH-01.corp.yadro.com (t-exch-01.corp.yadro.com
 [172.17.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 24AC64381B;
 Fri,  3 Dec 2021 12:59:40 +0300 (MSK)
Received: from T-Exch-05.corp.yadro.com (172.17.10.109) by
 T-EXCH-01.corp.yadro.com (172.17.10.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Fri, 3 Dec 2021 12:59:39 +0300
Received: from rdma-x86-2.dev.yadro.com (172.17.27.112) by
 T-Exch-05.corp.yadro.com (172.17.10.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 3 Dec 2021 12:59:38 +0300
From: v.v.mitrofanov <v.v.mitrofanov@yadro.com>
To: Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>, Yash Shah
 <yash.shah@sifive.com>, Atish Patra <atish.patra@wdc.com>, v.v.mitrofanov
 <v.v.mitrofanov@yadro.com>, Greentime Hu <greentime.hu@sifive.com>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/1] riscv: dts: fu740: Add PDMA node
Date: Fri, 3 Dec 2021 09:57:38 +0000
Message-ID: <20211203095744.1717706-2-v.v.mitrofanov@yadro.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211203095744.1717706-1-v.v.mitrofanov@yadro.com>
References: <20211203095744.1717706-1-v.v.mitrofanov@yadro.com>
MIME-Version: 1.0
X-Originating-IP: [172.17.27.112]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-Exch-05.corp.yadro.com (172.17.10.109)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_015942_784343_68369EAF 
X-CRM114-Status: UNSURE (   9.28  )
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

HiFive unmatched supports PDMA but is not implemented in DT.

Add the PDMA node in SiFive FU740 soc-specific DT file.

Signed-off-by: v.v.mitrofanov <v.v.mitrofanov@yadro.com>
---
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
index 64ff2e758336..833fb4f4376b 100644
--- a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
@@ -164,6 +164,13 @@ prci: clock-controller@10000000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 		};
+		dma: dma@3000000 {
+			compatible = "sifive,fu540-c000-pdma";
+			reg = <0x0 0x3000000 0x0 0x8000>;
+			interrupt-parent = <&plic0>;
+			interrupts = <11 12 13 14 15 16 17 18>;
+			#dma-cells = <1>;
+		};
 		uart0: serial@10010000 {
 			compatible = "sifive,fu740-c000-uart", "sifive,uart0";
 			reg = <0x0 0x10010000 0x0 0x1000>;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
