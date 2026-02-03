Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96FCE8784C
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 17:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tF0hFrduZaYS2i9xvIelIQbKJI1ZZkjkpp/dMBWe110=; b=OWjtzXKZHoskQN
	/nOcpWTq5y0ckC9H9N0TtzQmtV5kK5FKzCsFb5crqCfdxKSvzVMerX6YtFPztSSYL9uw05aOZ030/
	OjZdGZIYzid+u+vDxZtiFBbnDbTVtk/w+05GbYKOvsbLmlXNkdlDDK7zN7cPx1T9Rzjl7Rg2hQBGP
	cft3pWAd7RPx99MNl5tbFNdUvSKjBDqNbtZMxoNQet8x52Fuj/q/7B4U+F+5CrtRNHo43rxqRkqvv
	HKnA/wwFrpMvobsWpkfdsuftm0N+7ZMBCJ6uMEI1ErCqG7yPG/PvyZWbk1cUxBdvelO/r9r8ll7Pa
	bxM4gNavovpvXXbQZNMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnK6E-000000072aq-3LqU;
	Tue, 03 Feb 2026 17:22:02 +0000
Received: from out203-205-221-221.mail.qq.com ([203.205.221.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnK69-000000072Yh-2wcG
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 17:22:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1770139315; bh=+7o+0vyglI6SKIn20vq/JuFe7AAgC6WPGuSWeg1wEjw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kGyI6ZgSq/IUUJENv5cuRssuvQUGt5dYMT1t1JA9ly4FozceSF6RRx7CLE/yK9B5P
	 WBiGkmkUC2DfgPn3etbaFzjEoNTYF7c74yvMzt1rXAzisLZCzNEnABmU9j8D9ZTUhe
	 IaBWf7CG+ndwEgLKwod/qq7bzslAZlgefwgChp0c=
Received: from cyy-pc.lan ([240e:379:2263:bd00:7e4b:55e4:8771:53fb])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 571062C7; Wed, 04 Feb 2026 01:21:49 +0800
X-QQ-mid: xmsmtpt1770139309tz6l3w68c
Message-ID: <tencent_720A4669773B1EE15EC720869C35C2F0490A@qq.com>
X-QQ-XMAILINFO: N9lasXYeZMXWq8mgpS9v9z2OCE4jLagYmjfDafYb6w1cbnEz/To+DObDJGFuCw
	 jHoRzlacZGegfRK8DPENVMFgk9g+EauA3kndjtTxmMvuCQa/aKhriujcsTTKyPtdjv+fl8c3f143
	 MuXc8uODYA7yISkfM5rBvX9dLLj4TQIvLYc6eqHch56U7tEFhiG081NwNycFLY26R92nCEzadUwq
	 VC1khsrdqzFuSikouiFfdexzxDsoxQ3Bm0Ahu2lgrz6M89KfozukUJq3NOj+YGK0mhL3cxOEbMDx
	 5GL4LPJFvoGuKU5YMhJOejkvsIUHvMD2V9HgsdizTqvUFnTSu17QGhWUvU8SxoUc08SdXMykU+9k
	 TRiyTPzBOYkVZvP5WhCH2P5HAWc1AuvPh+FFmhCCNZ//Yf36bwqCo/Mv+JqsjUgOs9EFBgAq2Ebl
	 tKtnBDFAkNmLHHVpLq6NcZ8EV3MOv4n6eSZbx10WWQG7NAvCWqi3lVSvxNfzlPFB72CQh1zRLiLq
	 SgNwf7mQwwwbX6dMuD4Rgx4HN3LF5EPJOAr8tHOGZOzJnw0isFDWkyglapr2jCr9UrG5rY3acFqW
	 hOjEQjB1UEabIvy7/zC8+ahVptE/Cmer9lGtdgX5gUTU4/GNtlPDszv59bnUY4wpKopTuly//pE3
	 MTe/YQzYGWBkFv0a7nuMFWy8472up+IVlWshTD/ECDEC5dRcoSS1+8YzhIVV4gLGjcfO+yGMiLBR
	 It/6Ldze/V/+7MBpTXeKbbX78XaFdYzoTb3WQ5UfBOpHxUmhYXf1jQ8x141n8e0kDfLFCmA4pwo5
	 AJiogfUmgV0fpVIxcbQJiPNNCVh9591Q9yIbkts4KF1EHBXUNEjsnZ9DCFgqDGvhmaXXMF8EdhFO
	 +fGlprvTaSEFuO8X+6oTgoQrc2bHlxVTHMU63l664R6F8y34rLCWsQ2nusPkQHfBggIS+qTEI2WI
	 XSgXEjH1bufRRtsq6qjK1Bi3Y91slsys99ohTfZVz7uQXyFK6U6sC90yS1Wlzc/rsKFVQ3wd0rvM
	 mulMTDXb2afR/nJTFEUvSaVvlpHnNUnpToU1yL/djfJcsVSHwmIRcOknUrpSy1QUaRFqcQJWjTD2
	 q3Wt5c
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Anup Patel <anup.patel@oss.qualcomm.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Charles Mirabile <cmirabil@redhat.com>,
	Lucas Zampieri <lzampier@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Mason Huo <mason.huo@starfivetech.com>,
	Zhang Xincheng <zhangxincheng@ultrarisc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Marc Zyngier <maz@kernel.org>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	Jia Wang <wangjia@ultrarisc.com>,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v3 2/2] dt-binding: riscv: Clarify the riscv,ndev meaning in PLIC
Date: Wed,  4 Feb 2026 01:21:48 +0800
X-OQ-MSGID: <20260203172148.1595129-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <tencent_AEBB719FAF49D05B5BDF7118D729463F6405@qq.com>
References: <tencent_AEBB719FAF49D05B5BDF7118D729463F6405@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_092158_046419_E843D1A9 
X-CRM114-Status: UNSURE (   9.71  )
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

In PLIC, interrupt source 0 is reserved and should not be used.
Therefore, the valid interrupt sources are from 1 to riscv,ndev
inclusive. This commit updates the documentation to clarify this point.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 388fc2c620c0..df9578bcac89 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -109,6 +109,8 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
       Specifies how many external interrupts are supported by this controller.
+      Note that source 0 is reserved in PLIC, so the valid interrupt sources
+      are 1 to riscv,ndev inclusive.
 
   clocks: true
 
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
