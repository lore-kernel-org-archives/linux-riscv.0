Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2788C88E64
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 08:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7NxZ83meShhTCUpuVdTpSOBt4LVmT+i5SAYvCfCS3YE=; b=v0DgYuom8zKTCc
	4gNMI/y4IddBl34q78x8DdAcWO6L8lzETWmx+50KU/xMV4b4IkLConom6BmrfzTb1ZWo3/BheU1oa
	UgCp1vqjG/t7OSqQoN8z2UplYaU2d6fodGPz2ucx8+7eye6iXj73hyTRJzLh9dKMySSOX6Agk1LGh
	QKnwtrmXacNYnpb4k8Ufc8kKaCUE0RBav+XQXcFQXl65Rdv9OJmkUHMGYGdckBN6sgwvbxa2MWNcs
	pqFxUA668/yR5l0seHWH/ugGKn/RKO8kn0vEocSXlMDwKvURWlUDG5gcjYk5UwJ4YqrRY2WrLnAFS
	AD2h7oDceHC3L8KNB4UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61vY-00000002hyn-0fx6;
	Mon, 14 Sep 2026 08:20:36 +0000
Received: from out-78.mta0.migadu.com ([2001:41d0:1004:224b::4e] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61vW-00000002hxC-0cs5
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 08:20:35 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=+88ROtLrCstIdLndNiAde/JzZl0qUsawtPJuqfY6oGs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789374032; v=1; x=1789978832;
 b=cyHlnfdMRNSlRtZvnv7GekeN1F7Ww265QlaZ1Rbm7H/cM64WGaTrF52ivdUjX7w3jM5NfCs8
 6ffayg7JqFoc4UMKpbyTdpZGYgrUmCth9Tf09CZblMVJKVzwvFfT2WVIm5Nw+MbFLT4vxkj0a0A
 cmVMOsCt3oEwxvtthYykf6Kc=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta12.migadu.com with ESMTPS id efc6a5f5c4e9eadc;
	Mon, 14 Sep 2026 08:20:31 +0000
X-Mizu-Trace-ID: efc6a5f5c4e9eadc
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Mon, 14 Sep 2026 16:18:06 +0800
Subject: [PATCH v5 6/6] riscv: dts: spacemit: Add CTF2301 on K3 CoM260
MIME-Version: 1.0
Message-Id: <20260914-ctl2301-v5-6-522def70acb4@linux.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1044;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=+88ROtLrCstIdLndNiAde/JzZl0qUsawtPJuqfY6oGs=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnL1x77WOvBI3yosrjbVvL49Q1N3uEV8cuvJmz80XtvQ
 fTnvJcNHaUsDGJcDLJiiizdD3i2FfhE2RYIFPrCzGFlAhnCwMUpABPZ9Y/hn3GrUaRJ5VfZdfM6
 W9jDEo+E94n/C9T3iD1f9uYKJ6vxVYb/TsXd7haJBzv06mc+3Na87Mb/hVNuusYbPivJ7au4qPG
 ZHQA=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_012034_339386_B1CA3C59 
X-CRM114-Status: UNSURE (   6.85  )
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
index 37627963a6492..92dea86397798 100644
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
