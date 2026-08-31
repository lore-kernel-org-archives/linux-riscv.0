Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0695C624C6
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 13:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=13VjKUAoLD3Q44JPXGR/CcbSknviIKzk7/Dtmg9KMnU=; b=2jEm/d/JRiSmhd
	+FSjw5FfXkT33wyh3oRbUfCnGDFWWhO0gqO/lKlR2CfBhiR0/CCChffSnvYF6YUtBrZ/nOGF3xQmJ
	W5I4tUxx4qa4fhApFg0HiSd26DVxH1a5f4CVdTaZuem/APK0aZkeHfBLoFVKnw71q3b5soLPwaaqR
	XkYJ+tgEna+86FxZqekdPcJ4xygHN91m+c0fZ+2Z7ATbSj8EAJl791CVTzHN799Twj9JHmHV4+RI6
	UYSz2QkvgVzN/hjd6tXH2WLnGCoLUBv8h2KYbD/aCBiIoNLlRoABhVwJh2Ye1DHUvhv0CvL3tfols
	xtw6ab/CUwgjvQ0nmWPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12LY-00000009W4M-1Kv5;
	Mon, 31 Aug 2026 13:46:48 +0000
Received: from out-92.mta1.migadu.com ([2001:41d0:203:375::5c] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12LV-00000009W0A-2lNa
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 13:46:47 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=aJYTFNqOScKS85O+yLyZiMcEgXXBbLJv3BwXF//J3gg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788184003; v=1; x=1788788803;
 b=wkw1Xlg/XtPK6VPF4HGjbH9EXB2dlRdMfpK+tdrrbPxeYVhRLnqI3K4oUBKfv3gRp1T7RMpG
 YXX4jwSE7Eh8ux5SBw35SQcRTMyisrmPMYE03PlCnXs1G1Y6c9y88RxlQ5gFJt9406YJaMvbT6g
 jDv3s0RzSQVPYYMYd679YQa4=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta12.migadu.com with ESMTPS id d27796f85925d44a;
	Mon, 31 Aug 2026 13:46:43 +0000
X-Mizu-Trace-ID: d27796f85925d44a
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Mon, 31 Aug 2026 21:45:40 +0800
Subject: [PATCH v4 6/6] riscv: dts: spacemit: Add CTF2301 on K3 CoM260
MIME-Version: 1.0
Message-Id: <20260831-ctl2301-v4-6-b335d52a0570@linux.dev>
References: <20260831-ctl2301-v4-0-b335d52a0570@linux.dev>
In-Reply-To: <20260831-ctl2301-v4-0-b335d52a0570@linux.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1042;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=aJYTFNqOScKS85O+yLyZiMcEgXXBbLJv3BwXF//J3gg=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlTW+cHvn14YJr6/o8nOM9mRPr3F0xu/VT9b8Wls12TX
 +2bOFnEo6OUhUGMi0FWTJGl+wHPtgKfKNsCgUJfmDmsTCBDGLg4BWAiS80Z/qf6nZt0KO3/lMKS
 S3Nf/7Kra2+e0bRpsf+D0skfL8m+WFTC8D88YqFc9b0UC8cQM9N3Bg9/XFdWVQs9u/nJiZV2ghI
 OF1kB
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_064645_852588_2E5895FA 
X-CRM114-Status: UNSURE (   7.61  )
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

Override the I2C6 pin power source at board level because the IO rail
voltage is board-specific.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index 37627963a649..92dea8639779 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -58,6 +58,23 @@ serial-number {
 	};
 };
 
+&i2c6_1_cfg {
+	i2c6-1-pins {
+		power-source = <3300>;
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
