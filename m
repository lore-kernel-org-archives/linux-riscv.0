Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624D7C25B0E
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Aug 2022 16:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mrL+QqrPGArVbpq45H+LMbQUIp99jL6T1Kzx+llL5LY=; b=Y9Ix82UqtqIau9
	JRg+HHoFMn2/GE2xoLAW8AWnurZeLKlATOKVcoAwf/rwdSJz+R97mrrXEcoGkssbAnlSG43cpH2Xu
	ZdR3GmilHzYOAlAXs2nO5a4UwgnUVKVGLfzWLVBb/rSBNzUXRvG/QC7O2S5bJ4XfU9O0Jhp+2AYUo
	QA+KRgj0CKypqzdIlkJyFiPSs0ylj6elv+Ju76xpfm6QGTASQFaS25XSMeJOuNIts6ZgDEdcYcrcW
	qOAyFsDXDxVik49pg7EASGqhu5oBWWplo+cOyc9pM/rItyHvSvRk05znRQWiyX9TOPsqwooLbVWBV
	D9CTDvP7+NMvRItkeDzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNGPS-007rni-TL; Sun, 14 Aug 2022 16:24:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNGPG-007rdf-3s
	for linux-riscv@lists.infradead.org; Sun, 14 Aug 2022 16:24:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8BF7660F76;
	Sun, 14 Aug 2022 16:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8E9C433D6;
	Sun, 14 Aug 2022 16:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660494244;
	bh=mpgV44W9oPgeOIfAwZf+8Ykl1kdhKi1YF35CAqj3NRQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r2KK1stoS1v1GMxa6yTqVpV5QsHOkBLETM4IYNPPMalNpIYdRd3wjYFSyGqZRa9aN
	 fNbbzop4SuDV8n8RIzJdcTzuY2UeVm+WaSjU8rjNvKRn+iY8Kwt1Ubdj9qv9hln27B
	 L6yhneq2YZOteoFMFCzogsPkO22oYfqE2v/6/OBwQJt0AamjrA5090ZMXtREGk8XsM
	 18wpJsTKoXQNTzuMIXA8D4NOMinKTQAQAFA19BQkdd4HBdTSD5DPS2K5pSfnhssVO3
	 ymI+j6QzDTJtzsAiKfcEO1LHE+4X8QsaD4zeqn6gaC5b1Rt+i7JvhqD0fmQcW9Zktd
	 CWpdhAyfBkgaw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Brice Goglin <Brice.Goglin@inria.fr>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	geert@linux-m68k.org,
	zong.li@sifive.com,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.18 11/39] riscv: dts: sifive: Add fu540 topology information
Date: Sun, 14 Aug 2022 12:23:00 -0400
Message-Id: <20220814162332.2396012-11-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814162332.2396012-1-sashal@kernel.org>
References: <20220814162332.2396012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_092411_924635_886AF458 
X-CRM114-Status: UNSURE (   8.48  )
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

[ Upstream commit af8f260abc608c06e4466a282b53f1e2dc09f042 ]

The fu540 has no cpu-map node, so tools like hwloc cannot correctly
parse the topology. Add the node using the existing node labels.

Reported-by: Brice Goglin <Brice.Goglin@inria.fr>
Link: https://github.com/open-mpi/hwloc/issues/536
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Link: https://lore.kernel.org/r/20220705190435.1790466-3-mail@conchuod.ie
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index 5c638fd5b35c..48423cd8f544 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -133,6 +133,30 @@ cpu4_intc: interrupt-controller {
 				interrupt-controller;
 			};
 		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+
+				core2 {
+					cpu = <&cpu2>;
+				};
+
+				core3 {
+					cpu = <&cpu3>;
+				};
+
+				core4 {
+					cpu = <&cpu4>;
+				};
+			};
+		};
 	};
 	soc {
 		#address-cells = <2>;
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
