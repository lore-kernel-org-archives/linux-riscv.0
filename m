Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CEEC41535
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 01:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OoAG5I2L2waC+VX0bLMSgNazTUl5xdobdaApMvPhqlE=; b=Z/EvOn2woJADB+
	20QD9+U0dzyFT4kC7r6tJMMb0t789rr7jzgu28zurzAUXo2bjVkFVQ26CRbpHgpMVU21QJt07GBBD
	KJLFnStfgo4WMRLlM3PrqTlHIWigTyHgMhABcQ9IN0mZJUbdSwgzs/Qw322zrJFkm0BSqBJM5JxzO
	AcAV2rmj52zkAf1VGAGC2Dj8OQJMrQagakWS7/3c+Q7mmPmAn2dDo039uIXY5d+Cccja9hkMSPLzF
	OC2TtYP3AC7vluEAbq4oag/4orZOS5te4S0JD6yG6sliwzgOXX0qsAAcWd9uYHC+PTEOrs/GxG8GU
	FRgc0kQQ9dMjPETbf4nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2LQY-00Cxp3-2N;
	Mon, 13 Nov 2023 01:07:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2LQV-00Cxmt-2C
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 01:07:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 3046FB80B41;
	Mon, 13 Nov 2023 01:07:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41267C433CB;
	Mon, 13 Nov 2023 01:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699837661;
	bh=FU5cMxpykFA89J/z1Xx5vbxIOEU9bDayGjmJTED/4UY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uQezJXBfixXFEnDr2uPowPMWRFtaZ5r1q34O5kMOfhXgqt6xRQJok/YdVKhr753Sc
	 U3brf0s5laXn8qH+WlE5rwINpOTqG7YY5Gf+KvG7ZuE5RAyC4QMGnW7qPhkbtsI73i
	 LOgFM2tUGynRSL8KRffQbgT3N+4ali7B0V4blEFMYQcYw6R2gfBJbjiQcU+4vHywGL
	 rSuLw91jQFndlfabvrHICBhGjhAOdvNpgyWQC1JDvxgIBBNYQI/6GODycyIxNxpJWx
	 hRWvuIIn2U2/HUSuhFuaw5nsb+TkehY43Oq1390yw7oCoKg0AiXMDqcPh15OhD3Sg/
	 6E0laeQm1YkTw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 3/4] riscv: dts: sophgo: add reset dt node for cv1800b
Date: Mon, 13 Nov 2023 08:55:02 +0800
Message-Id: <20231113005503.2423-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231113005503.2423-1-jszhang@kernel.org>
References: <20231113005503.2423-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_170743_852412_5FE489D5 
X-CRM114-Status: UNSURE (   8.71  )
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

Add the reset device tree node to cv1800b SoC.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index df40e87ee063..4032419486be 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -54,6 +54,12 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		rst: reset-controller@3003000 {
+			compatible = "sophgo,cv1800b-reset";
+			reg = <0x03003000 0x1000>;
+			#reset-cells = <1>;
+		};
+
 		uart0: serial@4140000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x04140000 0x100>;
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
