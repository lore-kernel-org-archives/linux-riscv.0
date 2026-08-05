Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80910C55174
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 09:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iXC3JrRN2JfFiMw9ue6opGB3RVAUw6CdbYz6WO7sMYc=; b=zG+1wnSwkCePFM
	/UhlqZIJRnv6MjpXNmeSdDJCLeOqmlRgf5mSQn4b9YwEl1zYpGtd00byct+FxynC0XRypDLSV/x+d
	L2FdSPd8kuplFvu7/FqP1UDt9Hw/nRdhKRWLPKm+ysPXP7VR3TNFJJPgfQQl95yc+a3EoLMtUSZXn
	AOE8/dsEFgOpphO3/9GWg4gUrs62/CyXubywAdQ4Yl+NHPvRgEGWaGkqsoQdySg2wGT+H8nTEETPB
	ZHzKdzjy4YE0BLYUN8l5N0swkDtS32WxRuWz8bb/yaqyQUUH5MB4kYpqXI69w1jrf997ckokebyK8
	ma9C6d27r+G+SUaLVOgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrXtW-00000003cJy-35Fi;
	Wed, 05 Aug 2026 09:26:38 +0000
Received: from mta1.migadu.com ([37.59.57.117] helo=out-189.mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrXtT-00000003cJG-3pjp
	for linux-riscv@lists.infradead.org;
	Wed, 05 Aug 2026 09:26:37 +0000
X-Mailbox-Line: From troy.mitchell@linux.dev  Wed Aug  5 02:03:29 2026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785921992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MLkmEy2Qv+au8QUwUsCORU0DDXMr6v1e63PHv69jpg4=;
	b=JLV2tluVrP6L0K5Jqph3/Gm/ExTCIV44fuCHhLO6HNBThduiWBloGup1CWZZLBRMR4Tg7M
	XW7X7+DyCyR4zqYr1++Sw5BfHZIqckZKMmoSpKuKiGYGyQjUkh79l4IEeKsTDQnhm7sdNA
	zldW6xzW+GK4+pK0nl6yc2yVLmL+UzA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Wed, 05 Aug 2026 02:00:56 -0700
Subject: [PATCH v3 6/6] riscv: dts: spacemit: Add CTF2301 on K3 CoM260
MIME-Version: 1.0
Message-Id: <20260805-ctl2301-v3-6-b86c75d1c552@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=qkSmO+AW5LxoIXLT9GpKbrSpSAJky3A3GfHMGrIZGak=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlFv0/xi1+72ZxzvK+hfKn9jQixffu/FCqt9bfYfWpb2
 Syn7cpMHaUsDGJcDLJiiizdD3i2FfhE2RYIFPrCzGFlAhnCwMUpABOp5mRkmKCxsWlS90G2GNMP
 e+W1Ps39ciVb1lz9/3PttjfGQVuPpDH895CwkJwi7+Zj3Jp5bG/Wf/v3z1auFtutkuLfluZm+nQ
 ZHwA=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
In-Reply-To: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
References: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_022636_116302_7A29A6B3 
X-CRM114-Status: UNSURE (   8.17  )
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

Enable I2C6 on the K3 CoM260 module and describe the Sensylink
CTF2301 temperature sensor and fan controller at address 0x4c.

Set the I2C6 pin power source in the board-level pinctrl node
because the IO rail voltage is board-specific.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index a38d7b738258..95a60fbb411f 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -26,6 +26,25 @@ reg_5v_sys: regulator-5v-sys {
 	};
 };
 
+&pinctrl {
+	i2c6-1-cfg {
+		i2c6-1-pins {
+			power-source = <3300>;
+		};
+	};
+};
+
+&i2c6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c6_1_cfg>;
+	status = "okay";
+
+	temperature-sensor@4c {
+		compatible = "sensylink,ctf2301";
+		reg = <0x4c>;
+	};
+};
+
 &i2c8 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c8_cfg>;

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
