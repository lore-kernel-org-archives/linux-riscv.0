Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE284C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Jul 2022 14:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0ZU6zLVVeaS9ykQl1DAAQXIDlBYCFi6CfL/LBB4U8vw=; b=qb4RrdLZmu6RwN
	TzXtPBJNd4tpNi/yw7xhm2lu1f/n2f3yYxt7/oySPogicIki5jqy8ab6qXr7JD1sd6OiIMBLpdTwo
	F98GRWoZESJaugmtQo+TD9OusQTGvfj10L4Um/ZAV2IxdY0TfbmnvNO8nd1jHaoY67TUWOcHRi/OD
	ICidhnpYaQzgy18EJz6kPyij1sFoytSaJHkdEl4e3wz8HCHYX+NcHona5t3xHY0mmbJhucKAWV2Hw
	Jl2F9weFyBDR1mJ0j3HaIRLveVA+9fNMK9U4wLvSZsoiC696NHpa1A2/NtVaOeC5swwpNNH6TkBuY
	AxvMJbwQF203SrfPpgzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBGle-00BfZr-2V; Tue, 12 Jul 2022 14:21:38 +0000
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBGla-00BfX0-PX
	for linux-riscv@lists.infradead.org; Tue, 12 Jul 2022 14:21:36 +0000
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id 7242241207;
	Tue, 12 Jul 2022 14:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	content-type:content-type:content-transfer-encoding:mime-version
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received:received:received; s=mta-01; t=1657635687; x=
	1659450088; bh=AaOui02YEi9Ip9b2cycfHTnE1G+dZu4PYyIF31Vbb5A=; b=R
	KFSZXqXSZEsbdWU2b8VjtMUNQWoisI4jpNNIdVUKssbvgYuSs80ZJHrYpE7UxvME
	lV0hbge3sDEa48iO/ZbFVRsu9qivQpSwN9ZWsn488lwiYQNYvyRvHe+sOoSwxlH3
	XPWJGLyNkI9tvFaK/g9bdZ+b9s+//NrZqFG5v2hZAQ=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hjv7YybZuw8Q; Tue, 12 Jul 2022 17:21:27 +0300 (MSK)
Received: from T-EXCH-01.corp.yadro.com (t-exch-01.corp.yadro.com [172.17.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id 6317941209;
	Tue, 12 Jul 2022 17:21:24 +0300 (MSK)
Received: from T-EXCH-06.corp.yadro.com (172.17.10.110) by
 T-EXCH-01.corp.yadro.com (172.17.10.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Tue, 12 Jul 2022 17:21:24 +0300
Received: from v.yadro.com (10.178.114.10) by T-EXCH-06.corp.yadro.com
 (172.17.10.110) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Tue, 12 Jul
 2022 17:21:23 +0300
From: Viacheslav Mitrofanov <v.v.mitrofanov@yadro.com>
To: 
CC: <linux@yadro.com>, Viacheslav Mitrofanov <v.v.mitrofanov@yadro.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert@linux-m68k.org>, "Stephen
 Boyd" <sboyd@kernel.org>, Zong Li <zong.li@sifive.com>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] riscv: dts: fu740: Add PDMA node
Date: Tue, 12 Jul 2022 17:20:38 +0300
Message-ID: <20220712142040.12021-1-v.v.mitrofanov@yadro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.178.114.10]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-06.corp.yadro.com (172.17.10.110)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_072135_030555_5BE83FC4 
X-CRM114-Status: UNSURE (   9.34  )
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

Signed-off-by: Viacheslav Mitrofanov <v.v.mitrofanov@yadro.com>
---
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
index 7b77c13496d8..4bd670d8632f 100644
--- a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
@@ -161,6 +161,14 @@ prci: clock-controller@10000000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 		};
+		dma: dma-controller@3000000 {
+			compatible = "sifive,pdma0";
+			reg = <0x0 0x3000000 0x0 0x8000>;
+			interrupt-parent = <&plic0>;
+			interrupts = <11 12 13 14 15 16 17 18>;
+			dma-channels = <4>;
+			#dma-cells = <1>;
+		};
 		uart0: serial@10010000 {
 			compatible = "sifive,fu740-c000-uart", "sifive,uart0";
 			reg = <0x0 0x10010000 0x0 0x1000>;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
