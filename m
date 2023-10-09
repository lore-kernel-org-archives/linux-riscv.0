Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29165E95A8E
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 09:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OVs2aJeQDGXvOAT0YE1wTSTMLPzh7obNnOq+T0y81F4=; b=lJtR4lVVw8g8r0
	E36qsMFQbHN2EPveX8fS7u5dKaPaIqQnWwzMJZKt2WUy3mK61jEEKscYoVbqHSVx82E8AtZo81bL2
	Kt/lwD7GVsQ+jtP2B4jYBLwThtWwDwE7zmjyzj2JNn0dVeK3oHNQs1ZbVSxDp1zkTxtLnB3ob9qiu
	0oGSf90zAJGIDnK88Ax6gCVcIEOMOFa4z6L1As7LkAIc5ts4ROKUnkc37nfUQyVXVjqk3WF44fSwi
	xq5idXCudMAUJkN2f3AzaLGn0S3zJW8Qx/zXy+1mSDR+Lp5Wyq0PJAAhFxG+Z8A3Xw3jGinrjezVU
	kKXu2QPPMTljjJ+ApvGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpmoa-00A7pR-2c;
	Mon, 09 Oct 2023 09:44:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpmoX-00A7o6-1z
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 09:44:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1696844677; x=1728380677;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wwhojQUbiO2yCKXGlIk6MkgUnx1T4dUx6yrnvlKxZgQ=;
  b=OZkR+5oLWFD/FMTnY52PicXzkU5dygMo9+RNUAVb18Ye56DH0ncHb7TV
   zWaq3MgsMQxrOkBAbY89NA6F1OvQ1VGYgx4ANO0PgQvIo41kGcvrlr4Pp
   f/PM3MuwJW5qhG/Gie7AvHEeafwo/5+UBSnxxhbjmSlrRBT9x8BcwOU7F
   SLY5AiacIDy44eNXRf8XiWt3DKUME3D2cZ63iURZIiJAaXp8d9Of/cBEY
   Y5+cXBHcNJxLHxVSvyEe/SfSYo+5NKkGPGRCJjPCiiWsDHb+crkbhmBtl
   xz2gTRIThC34bcSH/lAP2DU7iQ/M6UOtr9svNtPf0GrT3npqZjKM7shot
   Q==;
X-CSE-ConnectionGUID: 6C+wEfReSDOSi5pQtrvDyg==
X-CSE-MsgGUID: oHjvTt4pTpOLnmqcgFgL9g==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="239927172"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2023 02:40:07 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 9 Oct 2023 02:40:01 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 9 Oct 2023 02:39:57 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.indradead.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Paul Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai
	<wens@csie.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, Samuel Holland
	<samuel@sholland.org>, Daire McNamara <daire.mcnamara@microchip.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	"Emil Renner Berthing" <kernel@esmil.dk>, Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Chen Wang
	<unicorn_wang@outlook.com>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v3 4/6] riscv: dts: renesas: convert isa detection to new properties
Date: Mon, 9 Oct 2023 10:37:48 +0100
Message-ID: <20231009-smog-gag-3ba67e68126b@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231009-approve-verbalize-ce9324858e76@wendy>
References: <20231009-approve-verbalize-ce9324858e76@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=919; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=wwhojQUbiO2yCKXGlIk6MkgUnx1T4dUx6yrnvlKxZgQ=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnKJ1/d3VReW7lwhcfHSidR9XfnNy0SuDvpwu4erxfGlf6c G15rdZSyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAie+8yMhxZVZxof7RbRiKZd9GiG/ fmzffZMnf2a1ndu21XWGqu8a1h+Kd58vfCslefNX8Ulzb1386Z0Jg2l5l7lsN1y7KsuSqvkrgA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_024437_657711_409F0959 
X-CRM114-Status: UNSURE (   8.57  )
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

Convert the RZ/Five devicetrees to use the new properties
"riscv,isa-base" & "riscv,isa-extensions".
For compatibility with other projects, "riscv,isa" remains.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
index b0796015e36b..eb301d8eb2b0 100644
--- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
+++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
@@ -24,6 +24,9 @@ cpu0: cpu@0 {
 			reg = <0x0>;
 			status = "okay";
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			mmu-type = "riscv,sv39";
 			i-cache-size = <0x8000>;
 			i-cache-line-size = <0x40>;
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
