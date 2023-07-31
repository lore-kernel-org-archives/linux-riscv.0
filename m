Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6014BEB64DD
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 02:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FYhtiTeFi8r3VeuhAF29oYvwp3VDGeKA0DQfvrvJmjA=; b=g2kZsiFwSk1srm
	/QUmEpC+pbP04wUPX88mAqsKi3bQacWLTPhlih+VGkbdeloul0k63967tasOkO8fyTuBOnc2UzBo+
	s3X/eWbb6V6uadX/qU0bwmoJlRVtNUswMMGK22EgjigMS09+vshrIWWJKV/INvpwEZxFKNijkeXZL
	ZceqUHS0EjNw4MKuJc6amk14cPxyiSts7/6kE/iz4NraB34F2FdEvLlnXYevbxn414m6C0F0iiH7M
	gXNNfw7ubybgmfAv8LxAwIAGfZoD5MnhO3lkCtr4OhmZPjqTXcnbxx2YGytaaACFfBtsgpjgaDzLL
	m6/Sy29Ac0Dmw5AkIcVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQImv-00DXAg-31;
	Mon, 31 Jul 2023 02:37:37 +0000
Received: from out-85.mta1.migadu.com ([2001:41d0:203:375::55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQImt-00DX93-0X
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 02:37:36 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1690771046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YGR95yRmO0NXcTKJauK/6i2H1oijVAsHSX5nYFdazBc=;
	b=y7HgKG+7rXDVvsXLOtTK3gUkLL9pojDYe2EIkTioUg9aJ++0jNY+cqS8szvjRCFr6nHIW/
	vbqgd9yWjb3/Cpf+XbKHMIoBeYm5nFbGDsswyNFtYj+3qm4gl+iW1+cWcZdkDvV+dnS4l4
	w07+fv3tQn2y/bfWm7P58PLUYNJ9OnC8Wr5k4++4ytaf6Er/gNVXiqJaWYh4TAwVVcVa6q
	yXH7KehaoRVpsOYt3X3ZbszDzQFVusO8jjCKTQNIobenGbTUHqIpSXPUnnTMKs5gZ/rci3
	UV51aD7vttu3otTGMjHmhqWN2AYeTPkzK7g1AE8NhXpkdy4MRj+dIRjgTx6VnA==
From: John Watts <contact@jookia.org>
To: linux-sunxi@lists.linux.dev
Subject: [PATCH] riscv: dts: allwinner: d1: Specify default CAN pins
Date: Mon, 31 Jul 2023 12:36:59 +1000
Message-ID: <20230731023701.2581713-1-contact@jookia.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230730_193735_348357_989762E8 
X-CRM114-Status: UNSURE (   7.78  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, John Watts <contact@jookia.org>, Palmer Dabbelt <palmer@dabbelt.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Maksim Kiselev <bigunclemax@gmail.com>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

There are only one set of CAN pins available on these chips.
Specify these as the default to avoid redundancy in board device trees.

Signed-off-by: John Watts <contact@jookia.org>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 4086c0cc0f9d..b27c3fc13b0d 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -898,6 +898,8 @@ can0: can@2504000 {
 			interrupts = <SOC_PERIPHERAL_IRQ(21) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_CAN0>;
 			resets = <&ccu RST_BUS_CAN0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&can0_pins>;
 			status = "disabled";
 		};
 
@@ -907,6 +909,8 @@ can1: can@2504400 {
 			interrupts = <SOC_PERIPHERAL_IRQ(22) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_CAN1>;
 			resets = <&ccu RST_BUS_CAN1>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&can1_pins>;
 			status = "disabled";
 		};
 	};
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
