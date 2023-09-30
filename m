Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3BEE77371
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Sep 2023 12:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YGEtxcrHWgdDUbPRZQs6KRkH+DBSmZI6cO/Y8y4FI6g=; b=xcPSaw0M3AvbZa
	yJWflGd/G2o+aiqUvoEOnL31Z/sUs+LH7ptON8eO5FZu3XAlsDHh5K5RUgbn1OwHGdeJ3sfhOTtAm
	3Duk4noLCscARHGK4ZEfMOY2iD+BoS5bVePcwTnM1BxNMV1WVp840ZYfQjXLxrSbYMF7jXXDWQEYH
	Tl+bycWDffZC30OWVKkbPV+l/R3UC1zt2f/8AJ5Aq0tqqhgOwL5vOg3kvT+yOd05DZx/DHyqDBBPr
	y6NYmsXh/mSXP3fj1tQP874z/MhYDb7sCAC9Rg6kfifC3H98t+DeALpKCOHwEub4IEE1I8oJUCDxp
	SBibLK/fo9bXQbEQ+DWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmZS9-009XPJ-21;
	Sat, 30 Sep 2023 12:52:13 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmZS7-009XM2-0p
	for linux-riscv@lists.infradead.org;
	Sat, 30 Sep 2023 12:52:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 294ECB801C0;
	Sat, 30 Sep 2023 12:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25FA9C433CB;
	Sat, 30 Sep 2023 12:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696078320;
	bh=fQTDtT9gnWgXUs+I9buDYmY6imSxTfJ5hIWH/nKngUA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cgjrlymuo0WltimOMkmuXz4oV1+bt9qfmo/hhNyXcikzu7EaGa4n/wgk3XwktQTCN
	 SknjOXRlAENSX/2931edHNrX93SFp8kSZSAgBS2Dfq84VmxdmnkC7iRdLNHn4QGjGr
	 OnYippK2hUgXFApgGby73dVAgX1a+T23DLZqgVtaXipteIfRBzCKt3J14h9489ZnoU
	 hY/wC7LmF8I4YrvI+8jU4R8I/pZNKq1Da7by1qheFDABExAZ5YRBgwehNtZZMBWYIM
	 e4Ds4ctkJIgdnzipElalZr0Dd+g8izrTw3U4STXCsLch6LaF2TbCL0tu50+Yr3dHQE
	 +2qkDcwE9i8tg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Inochi Amaoto <inochiama@outlook.com>,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com
Subject: [PATCH 2/5] dt-bindings: timer: Add SOPHGO CV1800B clint
Date: Sat, 30 Sep 2023 20:39:34 +0800
Message-Id: <20230930123937.1551-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230930123937.1551-1-jszhang@kernel.org>
References: <20230930123937.1551-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230930_055211_428629_9FEE53C2 
X-CRM114-Status: UNSURE (   7.70  )
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

Add compatible string for the SOPHGO CV1800B clint.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index a0185e15a42f..98c76d5893ac 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -37,6 +37,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-clint
+              - sophgo,cv1800-clint
               - thead,th1520-clint
           - const: thead,c900-clint
       - items:
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
