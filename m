Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6B1106F2F3
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 08:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0b2rf5OFhhdPV4vXXP+hxeT8SgoECUV5ULiPvs7EGyk=; b=ItWI9jiJnw7IVp
	KQXZxL0m8CeYXQ9oVejTkPmdoGzQvNdIrGnorXqMkky3NkUzFbKyIvhZIJs9PnYGMPR7UlojDE0F+
	1P3NWfylhQi7b9AbABnNbU/3d+Pf2c7MumqaKqCxI2csb0wK7i2SMZvXY3g+QfaxnOWaaplGLojVN
	HnR8xAOLkJuDZNZ4pXGSgt9lF3wwKZReZCDmV0zhnXWIsAQsFplvyX7c8RRXsRAF6G5Jo/kxk6790
	HQsrpoKs42VjLxAnv74bbEVxs6+uGMsT225mEytwyLkLAuRGb5mrbMYacqpAx4g2gdw8G6G+FPU80
	BxYGf5+i524qo0q7gLQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5fvu-0000000511U-1taE;
	Thu, 26 Mar 2026 08:19:14 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5fvr-000000050oI-0mH5
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 08:19:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774513112;
	bh=X24IhPieDgBLiSP7Jey6c5qmaVJh9ukNDBwY2l74LNs=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=qwNLRID2fc0egpXFft83BjirTHAuHGFE05gVtrugTHd46SAKhYDlLL4N5I06sgrGF
	 UPuSfO7nKWQ6wzwpukMMYJaMG4IkKnoMs011Eut3TAwLZt2q0cFcxnZECYScjb2S2P
	 o2tZoiIUcu5fB1ZKFZwN0mpI5ysfE2r8GccOq200=
X-QQ-mid: esmtpgz16t1774513110t2f9ee44e
X-QQ-Originating-IP: 3Fqy/k1KQqWRHqrcdX1d3p6XWIRDCKU/1f8HFVA9VCY=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 26 Mar 2026 16:18:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8687179103118838065
EX-QQ-RecipientCnt: 20
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 26 Mar 2026 16:17:22 +0800
Subject: [PATCH v2 7/7] riscv: dts: spacemit: Add PDMA controller node for
 K3 SoC
MIME-Version: 1.0
Message-Id: <20260326-k3-pdma-v2-7-ca94ca7bb595@linux.spacemit.com>
References: <20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com>
In-Reply-To: <20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Guodong Xu <guodong@riscstar.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-clk@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774513072; l=1666;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=jTzW/BlP/85Q+ebUua4Muo2x9pnkZwv/64rxq15Xclc=;
 b=3hDlNh1Dew8xF43uT+rE6/WcbKSSrb5z8mSOX+K1w3Dpf+T8T4eRNTDd0Pytzl7fXe/S6kqVV
 wurgTM+kij/C7xADjHYnMoqVJIcsrkYdnT4IF2+ooR1GQ3q4nNclWEh
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OKX6byuwCvg7TA9sWPj9M7slTa/EiaWh0Wir5nsC29eRWMkXMBP9mTJT
	rtIPe0fBX7F2s807zJNTwN7LvSqRMRLX5XffWCGaSUpN+eGT2LZyFagVHtHNJd9U+WHvKJ7
	6jaMcP1CskR4xWqqIBTosJgSnqyeO2C+HiPbIFTFyOcIPUzEaNArLUsdW23ZAzI2qgB5RPA
	B266BqVBRgtA1AZ2VzV4DuZblb7AbFzze/PK1PIrlaW1gaC4wQ6uw88uvXJvh8lppCNRH+Z
	7ik7A99cu9EapMtdaOlyGLQr+f04vIVa7oEicplPWx3WkCzjUIOuLU5CEh+aTvzxa1uRs+T
	Qh5K+hdKnxyKZnciEBhjIjCv6qscveOgCc6Gkx6rH06WKpGFf0Rt5VLGX1zRaqWs+6a+egd
	sUv6hULKczGZtV9eI8jLEUsdoTcxFGxc460n4MRIPQx4+4N9fk7wXI/Cd9g0+YniJZVhANI
	2k00lYD5fidfsEqVOyzTn/IVPTstjftEa6ksI4czTui51IS1Qn14YFuJN7Wdg77q8H+QSCl
	rb107IPS5RAmM3CMcJdFU91nsu4/j8hMymNB4udaEyYFlLLbrVoOutohLYD79OtoL+Kuumi
	GQEL1feSDhH//gX+LL9GTxnnVcuqi/c3BuaYV9Y7PraF7iqIgbPCZDVcryEhkzniE5DzYuU
	Z0AjSJUOJAVP/t3PvMds6vFWeqk1M7yy3fBZYRHOQZWp/nREqrekjkTr6ufaRehFKrVmfgT
	QFcJY9Zoy91yIZmn51NHJXlxdHiFM2g1aNwMeodmESN9vmefVsULmdyfCs43uJvHQ8axWS6
	hCyyMYJWXBGWrvohDw/9XX7R5RMqPli59V7NDLk0z4nbvvjrKO91jcvqiAcSIJm/fpn97LU
	EM6vvFENWxQktOCIrFXeb4huistr5y5zLCEzT6i3EM0X4ECQMoo+ZCkF07r+hVDkHuxNkWu
	yDrrwHwki1ZsLUAeD6nIckFyZ8Qb85RIb4PZswjfzQJPPpytWulpQPAWAl4kfYYxijwyZ6n
	VXomLjmjI9O67mvQhfTCeo95nR9VH1Q7IOZNrmRM2UyFDBZGqPcMnuhPZbVT3YGdlM5Mdnf
	5RuzFw3/ztaKva+Qeqtp+tVwwYJfW2hbtEgodKQAa3ixCel8xsd3+k971O/xWf3gOIa225M
	LUwfFkDE9BAuLeik2phu7toTvTxMS7zRDzK2
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_011912_025813_A498F97D 
X-CRM114-Status: UNSURE (   8.72  )
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

Add the Peripheral DMA (PDMA) controller node for the SpacemiT K3 SoC.
The PDMA controller provides general-purpose DMA capabilities for various
peripheral devices across the system to offload CPU data transfers.

Unlike the previous K1 SoC, where some DMA masters had memory addressing
limitations (e.g. restricted to the 0-4GB space) requiring a dedicated dma-bus
with dma-ranges to restrict memory allocations, the K3 DMA masters have
full memory addressing capabilities. Therefore, the PDMA node is now
instantiated directly under the main soc bus.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changes in v2:
- update commit message
- using k3 compatible string
- Link to v1: https://lore.kernel.org/all/20260317-k3-pdma-v1-1-f39d3e97b53a@linux.spacemit.com/
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index a3a8ceddabec..cd321975fc18 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -438,6 +438,17 @@ soc: soc {
 		dma-noncoherent;
 		ranges;
 
+		pdma: dma-controller@d4000000 {
+			compatible = "spacemit,k3-pdma";
+			reg = <0x0 0xd4000000 0x0 0x4000>;
+			clocks = <&syscon_apmu CLK_APMU_DMA>;
+			resets = <&syscon_apmu RESET_APMU_DMA>;
+			interrupts = <72 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <16>;
+			#dma-cells = <1>;
+			status = "disabled";
+		};
+
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k3-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
