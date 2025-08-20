Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2963CA0EDC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 07:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y9f1dnKg4l4m9JLXIoehldEdXhtF2hYfMO8XfPdlpF0=; b=f1tdzlFN8mlKlG
	gJt5MvmlzxUB1FtLWibtUHJqsFDEYjk49gNGVviV4Kl1jJq/6hKr/ZygVF8xmsMJZvT5meAAk821W
	RXcBzZt6mkpKyz2r31Po4waKym2Xq7FM1E5Elfnv+rTQHsthjJMWX07gCTCHGrcmO0bsig4DPTg77
	ptgSXzdHnsZAFpejste3+quCsrgSaETF0zT0sSRq7w2rxOWlKuv28uQeqeJgkKPC9+xOSpfwPAQfE
	ulpZKp74bu7/uqVSw1n0HsVqrisHkAOHrZGyYpuHopiYmWUCrFUJGRegvzq00ilIFkCNb2xyVX0a9
	e+Q31nv1nxFFL8V5YlAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodWF-0000000CdNq-1imP;
	Wed, 20 Aug 2025 07:46:03 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodUR-0000000CdBJ-0MxE
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 07:44:12 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D475925D1A;
	Wed, 20 Aug 2025 09:44:09 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eg5zdjj6xz1G; Wed, 20 Aug 2025 09:44:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1755675849; bh=tGfL13W8ti4YSK/nAW99ULHcrHSz0Etv9XyPU1NgCnw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ra8vI+iF6/xFxBmwuQMo1Tp25pzmLZs19io6wRgsYmtwhHkMoQI50B/4MA3p8jjxl
	 Jk5bJsI6WU1J1Wxx6Z34I9uPrqvvnF0RXPMrIq5prPv1WHl2dKUph/Ua5q3Dd+1ys/
	 3VjVEMUd3NSnkYal7EA62k34RHAi8M7BIcaSXeR+XWjrDEjLtqNgLrAOcnvvL1d/uj
	 /bEhFxCY41MnhNQbL/Chs0rQO60nNtJA8Qr9bTCFLyFTQL4LicDpiP/glGFQ8K1Hk6
	 UcR16pT2xtMeG3qV1PwWtJ8rRTnGMCqJKdmasT9jlKgUFsxY0I8OQjGsjh8YubUTWC
	 o7VO49zI0d8Jg==
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v2 3/3] riscv: dts: thead: Scope the reset controller to VO for TH1520
Date: Wed, 20 Aug 2025 07:42:45 +0000
Message-ID: <20250820074245.16613-4-ziyao@disroot.org>
In-Reply-To: <20250820074245.16613-1-ziyao@disroot.org>
References: <20250820074245.16613-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_004411_258213_6E79945F 
X-CRM114-Status: UNSURE (   9.73  )
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
Cc: devicetree@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, Yao Zi <ziyao@disroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The only reset-controller described in TH1520's SoC devicetree takes
control of reset signals in VO subsystem, while using a generic
"thead,th1520-reset" compatible that may imply control over the whole
SoC.

To avoid such confusion, let's replace the compatible with the new
introduced "thead,th1520-reset-vo" that explicitly describes the
controller's scope. The controller's label is updated as well.

Fixes: 1b136de08b5f ("riscv: dts: thead: Introduce reset controller node")
Reported-by: Icenowy Zheng <uwu@icenowy.me>
Co-developed-by: Michal Wilczynski <m.wilczynski@samsung.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 03f1d7319049..025402f6aa21 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -235,7 +235,7 @@ aon: aon {
 		compatible = "thead,th1520-aon";
 		mboxes = <&mbox_910t 1>;
 		mbox-names = "aon";
-		resets = <&rst TH1520_RESET_ID_GPU_CLKGEN>;
+		resets = <&rst_vo TH1520_RESET_ID_GPU_CLKGEN>;
 		reset-names = "gpu-clkgen";
 		#power-domain-cells = <1>;
 	};
@@ -502,8 +502,8 @@ clk: clock-controller@ffef010000 {
 			#clock-cells = <1>;
 		};
 
-		rst: reset-controller@ffef528000 {
-			compatible = "thead,th1520-reset";
+		rst_vo: reset-controller@ffef528000 {
+			compatible = "thead,th1520-reset-vo";
 			reg = <0xff 0xef528000 0x0 0x4f>;
 			#reset-cells = <1>;
 		};
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
