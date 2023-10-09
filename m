Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CC4E95A91
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 09:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z6hH0A4JrqUwrmgfF1KiG1gd+AUPcQifWIngwXRM/9A=; b=HA1hAPs3IDgE0J
	ORir/1lY2PtPNJeDsE/fVDzYXFh22KUULHMqu2VGoY4eeJr2yJxDj8DK+QIy39HoIZ/hpenfS4T6S
	yVuBoSYnySMilcxG+vyHm5DmMi9vmo0Frb9+YcdmI3mrjgp8ePPiIGY2XDHU5MFc1Vrd0cM82ikdK
	P8zIp+h/mR5FWXxm07xwKLAxg1aKFhrET1kZ6TD//70Mqaqcm+hMuzEvckpik1fhYc2R5mQxMDNyi
	HWIltzI5BP/3709aTslU+Ug3y8ocIYrRcZ7Tl//VJF4cP9doFzdBijuxumW6+DKn2G5CMcgswFpk4
	cdzVrpIjR/8w9yepwIVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpmjv-00A73k-2X;
	Mon, 09 Oct 2023 09:39:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpmjs-00A73C-1G
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 09:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1696844388; x=1728380388;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZRuE2tSMRuMJGGwfwdNw7XZT5KskCOTB/yFjYNEOofk=;
  b=LasiPrZUSHPOG0HvNYdcad9ygvRRdD3hz5tVQtXQxl7mP5PXEVSf8Eqa
   ODK0hEEZeKfj3mq4NPGOh+brI/F+IM2djOhhtNSclbDSjoILtKLPdx9hM
   RNGFohs3umT6+kDQ/r4p0O3Z9VZNbcUcjs1d9nK+T1Y4PRi+keff9Zlbf
   E7UDt9Thdu290mGusqgoZw3QAJK06JBDDZPzDVGTnPofbVIHtgrlAV3Qx
   1B3fd0Gj6oBtF1PTU7Eut5WZbQtqAlA5QodoGajTESL6gWPe8aJbl/FDE
   sr696slFxKJkdbZ2GS+Xis8J/hKjEB2roCvC25IgtLtmuVVU0llI6BI/i
   A==;
X-CSE-ConnectionGUID: K9WVynclRKmZ6/s6ZtJcJQ==
X-CSE-MsgGUID: XkssOkC9QNO6ufR14eLWEg==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="9639644"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2023 02:39:43 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 9 Oct 2023 02:39:43 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 9 Oct 2023 02:39:38 -0700
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
Subject: [PATCH v3 0/6] riscv,isa-extensions additions
Date: Mon, 9 Oct 2023 10:37:44 +0100
Message-ID: <20231009-approve-verbalize-ce9324858e76@wendy>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2459; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=ZRuE2tSMRuMJGGwfwdNw7XZT5KskCOTB/yFjYNEOofk=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnKJ1+YKRm3TZbcu+zn6U3vXaa0zL/3fPKtO/kZT/7M1L2u /Pjp245SFgYxDgZZMUWWxNt9LVLr/7jscO55CzOHlQlkCAMXpwBMZG4Cw1+5ROlyZoWrsxIPLw9g7k 8IWbBImnFj0vbZnLwVMnXvrdQY/mmsfVrxujRg2duifs4tPX9PnTogdpr/0ief7d9NJPI0MpgA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_023948_458808_552CC61E 
X-CRM114-Status: GOOD (  11.18  )
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

Now with the RFC tag dropped. There are no changes here from "RFC v2",
other than the addition of tags that were provided along the way. I have
not added "Zfh" to the T-Head based stuff, as I can't actually read the
documentation that would show that they're encoding-for-encoding
compatible with the standard extension, since it is apparently only in
Chinese.

The canaan stuff is absent here, mostly because I don't actually know
what to do with it. They don't actually implement the same versions of
the F stuff as everyone else (Stefan O'Rear pointed that out to me
somewhere recently).

Cheers,
Conor.

CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Albert Ou <aou@eecs.berkeley.edu>
CC: Chen-Yu Tsai <wens@csie.org>
CC: Jernej Skrabec <jernej.skrabec@gmail.com>
CC: Samuel Holland <samuel@sholland.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Magnus Damm <magnus.damm@gmail.com>
CC: Emil Renner Berthing <kernel@esmil.dk>
CC: Jisheng Zhang <jszhang@kernel.org>
CC: Guo Ren <guoren@kernel.org>
CC: Fu Wei <wefu@redhat.com>
CC: Chen Wang <unicorn_wang@outlook.com>
CC: devicetree@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: linux-sunxi@lists.linux.dev
CC: linux-renesas-soc@vger.kernel.org

Conor Dooley (6):
  riscv: dts: microchip: convert isa detection to new properties
  riscv: dts: sifive: convert isa detection to new properties
  riscv: dts: starfive: convert isa detection to new properties
  riscv: dts: renesas: convert isa detection to new properties
  riscv: dts: allwinner: convert isa detection to new properties
  riscv: dts: thead: convert isa detection to new properties

 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi |  3 +++
 arch/riscv/boot/dts/microchip/mpfs.dtsi       | 15 +++++++++++++++
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi   |  3 +++
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi    | 15 +++++++++++++++
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi    | 15 +++++++++++++++
 arch/riscv/boot/dts/starfive/jh7100.dtsi      |  6 ++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 15 +++++++++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi         | 12 ++++++++++++
 8 files changed, 84 insertions(+)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
