Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18B7C47DAF
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 12:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rexf6v6sjgn1U6GdhmYvmuXZdPxgnTgDLH7/tIL8AxY=; b=alCli0EXac//I1
	lrWoLWylyLh9xDrocuTWxWN9nlQMUda8r3PCKA3uR62+fw+MXONBUWxby8+xydVc+zfi+BcHP/Tud
	6FHAkz6kBfRNId6ANomBrnsp9KbuaIqgpTB6k1XjMJVLYkI1eNxxtuVPbYSmRSFjajdc4Ue415dAQ
	AfPnVY2d3dzF+phhDJunygYThdup6D3N6w3CbWK1vrkWEBp7py7/MNsF7yqHlbyVYrVh8sJtbgLGZ
	+fFXmZ/HOIQ+mfPQxEAzpOlUZJA6Ipf+acLlYWcxZq1x7lORH7FIQMVh8mLuh6+TrxaaU/v8lzczQ
	5sfSSVSQEakKWczVizqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRtII-00C4Ky-2K;
	Mon, 22 Jan 2024 12:20:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRtIF-00C4In-19
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 12:20:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D4B616135C;
	Mon, 22 Jan 2024 12:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D987C433B1;
	Mon, 22 Jan 2024 12:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705926016;
	bh=/RSqN2Fgji+rQoBP/tsnnvR3WmLqh9ZWY4ZdpJUw+rY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h22W9lTpevCfg1+UfZzG9Tp6NKthPNsbYG0QHkEggtN0KuoPIeboxQ1n7Zf0Ac1cf
	 nVFQLp10M41JwIE7rR4jiNo/yG0wgt9bZmVcDDEg40BQMRjgqYTPbhYuUPy/Cx17a/
	 LI25VH7k6ZDDlMDSubkPyvaC6y4OH/fYEZ9TduoeIixWpZI0cxPLfMic7UPVa0n4BY
	 G/44g8n3QXF/4cmKBnt9lyDged6/n5QCfjanDMsH9RINQVQJpkxhyFb0DQWCkJeeei
	 2p3qsOISKvRQXCZkhgwpuiiZoI4Gs/EDEpVjam+z7/lxKBVMMBSAz6QwdLpOaZBq2I
	 L/OEofo7yQVmA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Wolfgang Grandegger <wg@grandegger.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/7] dt-bindings: clock: mpfs: add more MSSPLL output definitions
Date: Mon, 22 Jan 2024 12:19:49 +0000
Message-ID: <20240122-envoy-chosen-7ae961b3b07e@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122-catty-roast-d3625dbb02fe@spud>
References: <20240122-catty-roast-d3625dbb02fe@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=944; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=28AMgJEH+kbgvVu06aM3gqKT3dUxuCabMm2ZpjhF9GI=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnrYlPmLJT0Kn5llKNl++tn4PHwJTLlOU3r4h9yynFfO zGhrk2xo5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABMxSmb4Z+C2z3dvWZXJbYWJ ckqH4j6pfZduK8xPfVT3Z86GIiY/U0aGd4aP8g6uOMUo/7Qn1c1qZlV/T7PIsZBg9Q3bgrb+cuj iBwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_042047_441634_41C5553C 
X-CRM114-Status: UNSURE (   8.26  )
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

From: Conor Dooley <conor.dooley@microchip.com>

There are 3 undocumented outputs of the MSSPLL that are used for the CAN
bus, "user crypto" module and eMMC. Add their clock IDs so that they can
be hooked up in DT.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 include/dt-bindings/clock/microchip,mpfs-clock.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/clock/microchip,mpfs-clock.h b/include/dt-bindings/clock/microchip,mpfs-clock.h
index 79775a5134ca..b52f19a2b480 100644
--- a/include/dt-bindings/clock/microchip,mpfs-clock.h
+++ b/include/dt-bindings/clock/microchip,mpfs-clock.h
@@ -44,6 +44,11 @@
 
 #define CLK_RTCREF	33
 #define CLK_MSSPLL	34
+#define CLK_MSSPLL0	34
+#define CLK_MSSPLL1	35
+#define CLK_MSSPLL2	36
+#define CLK_MSSPLL3	37
+/* 38 is reserved for MSS PLL internals */
 
 /* Clock Conditioning Circuitry Clock IDs */
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
