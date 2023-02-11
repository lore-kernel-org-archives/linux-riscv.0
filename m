Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C65C61DA4
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Feb 2023 03:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pruu3QGTkcOM8hRNHZSxcdh4mfV8XEvhsOyfYXybrno=; b=w1zE0wDeoiWnbM
	1oapdk5q+nKmXs+CZOjr3f3uUd01WcmpO1UAGFows0URc7jL8RVebDF12/qQBNNUWP6R2kanaEJvj
	GySzilGaDtVZ+57WFGZyf9UngJZ3xUijkknMon3kKAP/p+CTbWhj0Brd/oo2ob6ryCJ4NfcKogKbN
	+u6mG12pL37hBZ1sHz4j6eXX739DBXWpd9S98vq+Zy8Q9WU5Ywo4EfEnMLMM6nAxH9J1yBgIyzKpA
	o3hHMTccCG0kJxefIsY69RHvuILVe1xUOaXUEbhF3aafeV+XsdzZO6jD7hJbtLktn/0m6K6z/z5G6
	nJP6UR3JCXYTgmPot0ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQgdS-008YBj-Vr; Sat, 11 Feb 2023 03:33:11 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQgPk-008Rw3-Eu; Sat, 11 Feb 2023 03:19:01 +0000
Received: from localhost (unknown [86.120.32.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D9D2A660211D;
	Sat, 11 Feb 2023 03:18:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676085539;
	bh=z6mSA1zFWKsbl8mcj+uQ0w8gbdjZfgd7q1ePD6gAlnc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G4XTBi0NB+o7cJELk405RK/2xN1ZA3BdMBGzuWdB8fNhFWbAhPBz6lx9nymo4UCno
	 zmZn6Nc/fVNvbUjO/VRw3DIBUUe7UTSHYC3mwL/9/uaXjit0eaq7EKYHOHvQZ8+U4Z
	 GMFUG5t8EaRyHxIbpkyh9cVlLy3NJKFqA7VuQcrIL3g73XrEtrl/cPjV/iXSbw2lFv
	 iJE5SgH3ZwNXlboapW/mjHpuuMIjAugm66FtaswR76r4mD/gB8e+wcxSFp51s/vVZf
	 5z3JiCsVqSz/VoWnyw8HF4uXdrbfdgexT30bmSrlxWz/qj/9fDhNuPx22gFfP0J7rG
	 L1MRolixZf+tw==
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
Subject: [PATCH 09/12] riscv: dts: starfive: Add dma-noncoherent for JH7100 SoC
Date: Sat, 11 Feb 2023 05:18:18 +0200
Message-Id: <20230211031821.976408-10-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_191900_677108_CBCCD2C3 
X-CRM114-Status: UNSURE (   8.38  )
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

The RISC-V architecture is by default coherent, as indicated by
CONFIG_OF_DMA_DEFAULT_COHERENT, but the StarFive JH7100 is not, hence
provide the dma-noncoherent property to the soc DT node.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/riscv/boot/dts/starfive/jh7100.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
index 000447482aca..7109e70fdab8 100644
--- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
@@ -114,6 +114,7 @@ soc {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
+		dma-noncoherent;
 
 		clint: clint@2000000 {
 			compatible = "starfive,jh7100-clint", "sifive,clint0";
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
