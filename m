Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D5AC4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Oct 2023 04:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RxjJKVObyIl+SB9V5cl2WXRKXVwTtXD9Wowv3myhY+4=; b=EADnjdr+iA05gg
	02wkK3bHg9Uvz1FkCJGXHWZUjCVeMf6MHd8SvROt2Bck5v4yyHwRBQ6P0WW2AULWYhIlmwN8377NQ
	qpqm50DWAglL+ekGn1lsNovDONkT0atyqyEEfdoUGoRNied6XZMkmA5HaN2CYU2Zhraban9dghuM9
	O5rjzMFGB/5ZukbEafhMcMK+AypcxjJZvST+feUNHiN5Vb27S8ijvIniIi76sPsdEyT6Ip/Li9vqh
	5vz+ro+/hTk/XQRJSf7m8j3ZjZ//lkxEVTMBUkNjpGAnytox92pMS++/LwBO2IRFLHLeyYBBWWSsV
	P9bQ6/Xteb26yrm7vOxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwxPL-0019SP-2r;
	Sun, 29 Oct 2023 04:28:15 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwxOk-0018zM-07;
	Sun, 29 Oct 2023 04:27:39 +0000
Received: from localhost (unknown [188.24.143.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B04776607388;
	Sun, 29 Oct 2023 04:27:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698553656;
	bh=ws/tHftC6ooYXFFPrRkdjo583U1IPv/5VDVbOl/IleQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hO7JKhCfgez4T2EdD7WdvDzdPCr/74lUNLBlZiIJrZFAB1wawXL4bQeTCrsiL5oK2
	 Ef/Y6mxqH+0jfzTktFf4NAqixF5R8VcduHXBNa8HanlJ9Ee+qTcgwm0K7AhyHFFk50
	 xq2HZox5esJDX1w7WAVPy5G4wHEaeqO7RREU38MBxdSct1YdbILqymZ3Ckdg9ybW8e
	 samRlBIopNGtUSJVE9F3pKDQ8BtRBwWKUUxN6dCOH45PlHOcB2wNbSBmoIRuixe4PD
	 IKf2ch/qYB7zxV+dxuUfMYSyzOHObaGDiiCibF5A5UcNEVC7Gsr38czGoBvd9lfTRl
	 QBaTfTewEIMOA==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Samin Guo <samin.guo@starfivetech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 06/12] riscv: dts: starfive: jh7100: Add dma-noncoherent property
Date: Sun, 29 Oct 2023 06:27:06 +0200
Message-ID: <20231029042712.520010-7-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231028_212738_203700_D3D38B4D 
X-CRM114-Status: UNSURE (   7.99  )
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

The RISC-V architecture is by default coherent, since it selects
ARCH_DMA_DEFAULT_COHERENT, but the StarFive JH7100 is not, hence provide
the dma-noncoherent property to the soc DT node.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/riscv/boot/dts/starfive/jh7100.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
index e68cafe7545f..06bb157ce111 100644
--- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
@@ -144,6 +144,7 @@ soc {
 		interrupt-parent = <&plic>;
 		#address-cells = <2>;
 		#size-cells = <2>;
+		dma-noncoherent;
 		ranges;
 
 		clint: clint@2000000 {
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
