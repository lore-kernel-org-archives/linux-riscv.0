Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11578C636CC
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Feb 2023 03:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mFseIoYtfGicjqMCek4KFZbhrneCzfo788d/h8diRbs=; b=BNIjINwpRNEGL4
	UJmNAVLW7B5H5HJzMRepIXy2s2ALQXKLrD4eXoHnIOII8xAxpnBpA7QTzUDtYr8l84+8BTohlp5pj
	V+zKNdv2XxWvxLZwcavEl7M7UHG6hEAShIE2eyBb8ZD5Xy1K69wgUGXMDtvk/o6bbwWZAjIROGGHn
	In9NCD+IMC7l62K9j4j+NsunHG81BA3xuuvzMSB6lSmgX2cNF+mwW0N2L5pIjoAkgFwBcYGwkgS2l
	mWWyL5Suz+imxn/Sl7cmXFMsoOOM+/OFAwViXb2QMNwBw1pH/fvHmbnR2ZvY44BF2r9GyI98uFdEg
	uclavfwhVNsCeTOInOTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQgf9-008Z0C-CO; Sat, 11 Feb 2023 03:34:55 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQgPm-008RxU-Up; Sat, 11 Feb 2023 03:19:04 +0000
Received: from localhost (unknown [86.120.32.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 80E466602127;
	Sat, 11 Feb 2023 03:19:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676085541;
	bh=XW8rElFUTfgsJr1jtp6+bs1URQt5kqLzyalOrXtwnI0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QRSffU9SmuyvwYAm+UPE3h0oUhI+XYMgdzYG7GG38kA0e0174udJj1lzuUqTkTAW5
	 jJqKpWZ512dZgilIhNYQiB72no9UdbhJKRDCSU+ckWSBhW0NyvxAjkvC/8C0qyxK8e
	 LFdZngHPm/fTyHwN8rONF8yB2RvwxPnTtwxTtIX0QoVsGCCr0dbtGF72hVIEcMJBlg
	 83PRBJ822Q2NEowQn1EwN4+L4YRQG/ZPxscIT5XhGFC3xtO28HnnVxnIF++/evL3/Q
	 lh9cxBQYChoB2YQUfa+g1a6o/IwTo8CgvVaThXXaQszH7k4cp8oHKUD7aRoofocVQi
	 egZmlE6B9+bnw==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 10/12] riscv: dts: starfive: jh7100: Add ccache DT node
Date: Sat, 11 Feb 2023 05:18:19 +0200
Message-Id: <20230211031821.976408-11-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_191903_171926_CA1D484D 
X-CRM114-Status: UNSURE (   8.66  )
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

Provide a DT node for the Sifive Composable Cache controller found on
the StarFive JH7100 SoC.

Note this is also used to support non-coherent DMA.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/riscv/boot/dts/starfive/jh7100.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
index 7109e70fdab8..88f91bc5753b 100644
--- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
@@ -32,6 +32,7 @@ U74_0: cpu@0 {
 			i-tlb-sets = <1>;
 			i-tlb-size = <32>;
 			mmu-type = "riscv,sv39";
+			next-level-cache = <&ccache>;
 			riscv,isa = "rv64imafdc";
 			tlb-split;
 
@@ -57,6 +58,7 @@ U74_1: cpu@1 {
 			i-tlb-sets = <1>;
 			i-tlb-size = <32>;
 			mmu-type = "riscv,sv39";
+			next-level-cache = <&ccache>;
 			riscv,isa = "rv64imafdc";
 			tlb-split;
 
@@ -116,6 +118,20 @@ soc {
 		ranges;
 		dma-noncoherent;
 
+		ccache: cache-controller@2010000 {
+			compatible = "starfive,jh7100-ccache", "cache";
+			reg = <0x0 0x2010000 0x0 0x1000>,
+			      <0x0 0x8000000 0x0 0x2000000>;
+			reg-names = "control", "sideband";
+			interrupts = <128>, <130>, <131>, <129>;
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-sets = <2048>;
+			cache-size = <2097152>;
+			cache-unified;
+			uncached-offset = <0xf 0x80000000>;
+		};
+
 		clint: clint@2000000 {
 			compatible = "starfive,jh7100-clint", "sifive,clint0";
 			reg = <0x0 0x2000000 0x0 0x10000>;
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
