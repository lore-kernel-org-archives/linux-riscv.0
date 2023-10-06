Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5546AE81DE9
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 12:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=olpDrEzesreKHX2DPwaOMUSeqQ5NJ9NmOLijgMONK60=; b=hHARJXpjnGQb02
	IOQ9FEH7A/GhmjmKfMhwgFXKhKHmWCq1H97yxJPyFa4LEAeuObsWYIFBgBar7R5n+Y5gHm/CEwuPW
	xHU3MHNsRbRa0AQgW59cWUzwMtjHhV39T2gDRrpp7NamilKUgWQcZQ6w4+to+0QXUvu4t/Av4AmPn
	vItI6KnFggMRmQqYS+CNkFKM4whWR9kSlMy4T97IIS5Mhivk9J7lJ3cJC9UDd9rbfoJdsgdgbTwsh
	NAZYuNO1A6achyOVJYZTyroxpvkr/Otyhw4uZnPNbCtbBWimSxLEFNBD/Iy9h1+FOd/FBIRaSNZHe
	QpuLiB2j2lQiA0olrtAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qojvp-005mH3-0d;
	Fri, 06 Oct 2023 12:27:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qojvm-005mFq-1X
	for linux-riscv@lists.infradead.org;
	Fri, 06 Oct 2023 12:27:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9B33F61D3F;
	Fri,  6 Oct 2023 12:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3643BC43397;
	Fri,  6 Oct 2023 12:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696595224;
	bh=aIfy+YMFnPIuOo+znZOJ9L0lx1fBT20WZxlMNK06oX8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IMgFKe86ZFLLLFU0LQEjPKfDWW4nirs7rURYXhO8AHquYNbENHIa15tooFlH3TxTA
	 FI9pk2mToKN150eFZmLtherHr1GheN87w/PjoVm7Hrj+kMmzhHEjd7suFCor797gkW
	 7nkEt8hHR/lhVSlDHsTAnKLi0KnH1EMf7L8No3uFssv8/8IwxEYK7tYreYHzs/8seC
	 EPAzmkAxd1vQNvhdOohN+EgT2cQVGTl3s5igxLxrNuA2VeCKiIqbHuGC/7Xzx1Ixoa
	 dwdLDytVPS760OTw3fgA+8Xg9AZwvzimjJfiNm87g8S1T3Mhz7FogbDUKLhJ/CdwT6
	 I+qEBZl/Vm4Pg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Inochi Amaoto <inochiama@outlook.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 2/5] dt-bindings: timer: Add SOPHGO CV1800B clint
Date: Fri,  6 Oct 2023 20:14:46 +0800
Message-Id: <20231006121449.721-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231006121449.721-1-jszhang@kernel.org>
References: <20231006121449.721-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_052746_551243_6C785275 
X-CRM114-Status: UNSURE (   7.64  )
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index a0185e15a42f..e8be6c470364 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -37,6 +37,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-clint
+              - sophgo,cv1800b-clint
               - thead,th1520-clint
           - const: thead,c900-clint
       - items:
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
