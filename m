Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD25C76196
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Apr 2023 06:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bl2+R8iH3CZsl/jD5RxYtV+Q8Fz6YwuorliZeO9eUeg=; b=0sqHLOMrVIabDl
	8GQt0y351GbXFPu+kqIlNxkydKHfPxYkjMM2Zu/hqELwFSdP77xlwWGzWQvGo0/DZ3zhkNzjVNoWm
	k8Z8Q4e+BEYF/I811qA5iT2WLRDLmj9EjGIVBTH/Say687zVm6gMBKoQ13o0/CRDT7ThKbUqf4/8q
	n5vjVPJQNP3951RZT5zy3z3CjNlrLAqkNKHgIYcGwOO/vKb7zRzjcJtFWkicCzS1UNcSCodazyc9E
	jVlaF04NnaHVfwX2bH92Lv2V8oqLa903D6FWOY1PlUSk9MWsFfP8lPZSNgKHjHGTyMhnzuecH6BOF
	AyipUT3TE2ByNJDL086Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm7nr-00GcZb-0B;
	Tue, 11 Apr 2023 06:48:31 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm7nn-00GcQU-0c
	for linux-riscv@lists.infradead.org;
	Tue, 11 Apr 2023 06:48:29 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 2915624E2C7;
	Tue, 11 Apr 2023 14:47:50 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 11 Apr
 2023 14:47:50 +0800
Received: from ubuntu.localdomain (113.72.145.176) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 11 Apr
 2023 14:47:49 +0800
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: Walker Chen <walker.chen@starfivetech.com>, Changhuang Liang
	<changhuang.liang@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v1 7/7] riscv: dts: starfive: Add dphy rx pmu node
Date: Mon, 10 Apr 2023 23:47:43 -0700
Message-ID: <20230411064743.273388-8-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230411064743.273388-1-changhuang.liang@starfivetech.com>
References: <20230411064743.273388-1-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.145.176]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_234827_404868_31E6AA8C 
X-CRM114-Status: UNSURE (   8.05  )
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

Add dphy rx pmu node to configure dphy power.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Walker Chen <walker.chen@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index f271c3184d3a..a82374afcc91 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -499,6 +499,11 @@ aoncrg: clock-controller@17000000 {
 		aon_syscon: syscon@17010000 {
 			compatible = "starfive,jh7110-aon-syscon", "syscon", "simple-mfd";
 			reg = <0x0 0x17010000 0x0 0x1000>;
+
+			pwrc_dphy: power-controller {
+				compatible = "starfive,jh7110-pmu-dphy";
+				#power-domain-cells = <1>;
+			};
 		};
 
 		aongpio: pinctrl@17020000 {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
