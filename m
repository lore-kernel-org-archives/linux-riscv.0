Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97562C88E64
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 08:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cHBPTQeMrRYkTB8SHZa+//E9rLnajSlPldQhDSsNvrI=; b=qfJEjhR9u+mL0t
	muCuHqU0QEFvTWsX3cYFoozK/OlSjRmzx+g7jpF1hABk/gJ7woFwozkwh0FLaMp92G4gCpc0xZONa
	sOWOQxehU2kATx4VS1vYBfwZi39rV8hOJsM1nqc70LttrI8Yj5mizxT2XsC0xLqpWr7UoQYBcsjZN
	FcuXpY40G/EZU5vqtJ4HBwIIeblMObz7C9mAUu4+MttoTuz2lM2w/s+h15OV+NDe4IzHqO7nHJdHQ
	yw5k9zHORiV5d/g5KwmRy0RYpSiQ5sVfMkWuHaGmrdmGJx25y2w6WqzjfDh2NM99Tf+wZST5oW/Cg
	X/7HATiagGYAQkoNxLkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61vR-00000002hvY-0Fzh;
	Mon, 14 Sep 2026 08:20:29 +0000
Received: from out-60.mta0.migadu.com ([2001:41d0:1004:224b::3c] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61vP-00000002hto-1h7L
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 08:20:28 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=wbhdzKlsp4pZfdTsaPhOE+ExlEjRAWQ0pqm1PO0FsNY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789374025; v=1; x=1789978825;
 b=IOyihOMNbGezo8tyMOZVabxllQ74/KT9bgYqCXBxYP8sWhcJsXBhUuXcSLOFKjrjHV2xS+CF
 9wV9lwfZQmrxylkIPHs/YtQ+BDSUCcQ72rsoLLKktaX1o2ZDKDHx/tZ017taqdrp2+VYdsiHQMc
 d8IBhBA2WVCzb1u2KMEh+Wr0=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta12.migadu.com with ESMTPS id 3b889d0fb2e47b6f;
	Mon, 14 Sep 2026 08:20:24 +0000
X-Mizu-Trace-ID: 3b889d0fb2e47b6f
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Mon, 14 Sep 2026 16:18:05 +0800
Subject: [PATCH v5 5/6] riscv: dts: spacemit: Add K3 I2C6 pinctrl state
MIME-Version: 1.0
Message-Id: <20260914-ctl2301-v5-5-522def70acb4@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
In-Reply-To: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
X-Developer-Signature: v=1; a=openpgp-sha256; l=996;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=wbhdzKlsp4pZfdTsaPhOE+ExlEjRAWQ0pqm1PO0FsNY=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnL1x6xyjLs6ZDxiXZY9JDtyTshfbmVdxgZ39826q5/t
 u+Q9NzpHaUsDGJcDLJiiizdD3i2FfhE2RYIFPrCzGFlAhnCwMUpABNRyWFkuLEqNN5oQme+dKdT
 Cd+LJZMKVO29r8tGbPp4gNUorlqhjuF/ve29tAWnZr/49l+b0dpdyS3rNM9Ro+/es0sPRThx9vf
 xAwA=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_012027_593476_8C03B8BF 
X-CRM114-Status: UNSURE (   7.77  )
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

Add the K3 I2C6 pinctrl state used by boards that route I2C6 to pads 7
and 8. Use a 25 mA drive strength, which is supported for both K3 IO
voltage domains, and leave board-specific IO voltage selection to board
files.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 6482d24be1394..cb4f4f4e33aff 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -101,6 +101,17 @@ i2c2-1-pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	i2c6_1_cfg: i2c6-1-cfg {
+		i2c6-1-pins {
+			pinmux = <K3_PADCONF(7, 6)>,	/* i2c6 scl */
+				 <K3_PADCONF(8, 6)>;	/* i2c6 sda */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
 	/omit-if-no-ref/
 	i2c8_cfg: i2c8-cfg {
 		i2c8-pins {

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
