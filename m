Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4847D58E4D
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 07:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=La7YtWgtM/s1rS8tTHuCFZfzE00WGiNA14ql+XiAiNU=; b=OTqmFllFbDpase
	Y9tOA2rZjc+y6C500dp9LHRkZqR2FAwlc3TokHF54ghHBeHw2YUNbiH87zJqCX7fB8zGNvjFQMesO
	uhAQKI5SAhEAGABQGCXvr9q17knwPw3erw9JV2R7pPvTBxjRxGKW1s8mO3wQnqklcsHImciLKFW3/
	aWSJIr9SmtDvZHWF9DuPANCsgGn2WiSXyrPfQD/OUXmmLBg4NjlU8lOG8xVLra239N2wUMYUnd+Ob
	6s7BtPPJqTDcSE6ROw2i76/1btc/jlX7qi6gkViNiNsZnMJNTZW7uqcR/KWL9AuOVFUBZq5rgBZlS
	WIdOfaFjrJ6NTbxuvYxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgnO-0000000GcO2-28bC;
	Wed, 04 Mar 2026 07:37:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgnN-0000000GcNQ-3zPH
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 07:37:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E46161335;
	Wed,  4 Mar 2026 07:37:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF584C19425;
	Wed,  4 Mar 2026 07:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772609845;
	bh=M6/tIaGpQbsqPQjD7hrOf0XWL0qa3IzSrofgUGfNqTQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L+7S9+JHPelZNg5orKTyfdnixD5qI7mHAqzuq1JBsW40uw5XnUm/cHwMpQRF9w/Z1
	 9J6YUkxpgFosj0+jCgLZNgNRqq6UWfB9W4AOFZqotvp0KyuOD0QmimJ4gnHhwvQ533
	 4j1lKRVbFBf9qmvQOnMRsFqEp3TRR2yvukcyI8xE235XrZrPh4A5E0HZfrWRiYAlrX
	 fY40/8gW7Hh+wGt5CZx8pSBOa2jS+T1Choad5lNsm+7dSwcRHfOqcvGvB0wTmaP2i6
	 vIY/zp5iwFGXCsy+oS5Bt3wPJ5kA4MVurEsEgaAGe2bjJrbHKLJGdTOGc5WRVKc/vd
	 W/NZ5frLDoY9Q==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 04 Mar 2026 07:36:44 +0000
Subject: [PATCH 3/4] riscv: dts: spacemit: k3: add GPIO support
MIME-Version: 1.0
Message-Id: <20260304-01-dts-uart-full-v1-3-50a0aa53a245@kernel.org>
References: <20260304-01-dts-uart-full-v1-0-50a0aa53a245@kernel.org>
In-Reply-To: <20260304-01-dts-uart-full-v1-0-50a0aa53a245@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1227; i=dlan@kernel.org;
 h=from:subject:message-id; bh=M6/tIaGpQbsqPQjD7hrOf0XWL0qa3IzSrofgUGfNqTQ=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpp+EhYX8LiWaQjchd79X49uqR73nGt7b08kutr
 UHEBXjIyxeJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaafhIRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2PAA/+OeiS1kDDFTlS8+1p8iXp7xNY28e8+Et0pJoeXHfGszyuy0eVjlW6x
 I/HIZNBiyapBuGOxU8HmtKgewnAYQiCAvhGTGAhKbtVxBSmE+65PctZ44zR2lNTGD7St3a3izQJ
 G+j/3YIG3zh7PLh1Q/HChWR9r2BWe78BiTrh3LZQwbBXUEXYypkkFqlUveajOtAwTvUwRq6eU/c
 g96+Z7PlI4X9Tiacqi1Tk1KUXrUKBwie2sw97MS01Y8ONU4XC8GuFyRi40dl5TnyvxVPZtN32ag
 YaCcQypKL7R0ORRJSVphSdnZvDDDo843TOCmuPFVCoppI0UP0RVN2yQbsiUi9jsjddq5aluMij0
 BmX8sEvlN/G6JjnuEF8WZAJ48VQlXXUE3tgNCbujDHNEmg1qhJtzec6wHpblcJOPvJFTWG1OJBS
 JWFnR0skuQP3ZCa2xihpz5nbyD+IsdJmQEOulraAcOw4nbmKXGxh4S7JfR6sbHMH8pQz+YYcjO5
 ezEhyPZpXfOP9OROQ/Sb9yNTspCi6i/JyNTX6hIXITnFKbE59gRX0iq/VCW7Y9Dohck7p/Dstgq
 Q9SO+uN1h7U7Aoh0NG0IG3frCuuWPxSrjCX3QgDS5XsxUB5d3jSLve/cuNY73sbK4ThU7Ob6G2A
 0y6KPrcPdbhbc/Yn6sCeRYzAskLSeg=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
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

Add GPIO node in the Device Tree, so devices are able to request GPIO
resource properly.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 6449ab056293..3683a1a65362 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -536,6 +536,24 @@ uart9: serial@d4017800 {
 			status = "disabled";
 		};
 
+		gpio: gpio@d4019000 {
+			compatible = "spacemit,k3-gpio";
+			reg = <0x0 0xd4019000 0x0 0x100>;
+			clocks = <&syscon_apbc CLK_APBC_GPIO>,
+				 <&syscon_apbc CLK_APBC_GPIO_BUS>;
+			clock-names = "core", "bus";
+			gpio-controller;
+			#gpio-cells = <3>;
+			interrupts = <58 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&saplic>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			gpio-ranges = <&pinctrl 0 0 0 32>,
+				      <&pinctrl 1 0 32 32>,
+				      <&pinctrl 2 0 64 32>,
+				      <&pinctrl 3 0 96 32>;
+		};
+
 		pinctrl: pinctrl@d401e000 {
 			compatible = "spacemit,k3-pinctrl";
 			reg = <0x0 0xd401e000 0x0 0x1000>;

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
