Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA728C624CE
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 13:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gwe30CflJOexgngwGspWn5QTtXv9Dd4w36dN38okltk=; b=eyevkPTcYmt3Sz
	RaKqzbrbVAiWO+knWWxn+UPZRylkZZorwwT9MrgQnZtqRzMMCVtNEFhWIfROi3N2zt6JPiettYcrH
	WlfITBs/bz9dblbPqTEUTI0F07RgP7/n0jWrrVZxDFyVR5REBhfDB741wkrtk3NADjy1g7x5u5gp7
	fvcOjcW/Meifqts/VPPqK+Ia9g2EZcTrkmIxtFgHsINUIjkfRV3Vg+zpj7cMHykW3ibog5U8qdpOC
	3Aj6dXw9oKpYzKjCtF+XcfV/QiN2eL2KR9VhNVfj+/3uiEdhxAm9TpsWv8Jh5B+0ybaf3aHJPpN0m
	04uvwH3saefi0ATl+JUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12LU-00000009W0G-0C3l;
	Mon, 31 Aug 2026 13:46:44 +0000
Received: from out-83.mta1.migadu.com ([2001:41d0:203:375::53] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12LR-00000009Vuc-0G1z
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 13:46:42 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=oPyPhpeTyLPcNCtmwSXuGQluq3E1noUV5NUuvWuVnOg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788183999; v=1; x=1788788799;
 b=etGHANe7dwCumJGjrXQ11nusN6sCNZK2kn441T9zx/K/zoXTy9Kt27ZoK9PJ3fYON5K02bI7
 tqAqomxfIz0nizmt/zSzvZR0MEhDXrC/LGTVQpybzr0537wZvUikJJ2tsK8FWXE8Jwmuj0sa9cI
 uQPSU/0Q/v6sE17xQg2ZjO2k=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta12.migadu.com with ESMTPS id 78d01d025d72b5ab;
	Mon, 31 Aug 2026 13:46:38 +0000
X-Mizu-Trace-ID: 78d01d025d72b5ab
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Mon, 31 Aug 2026 21:45:39 +0800
Subject: [PATCH v4 5/6] riscv: dts: spacemit: Add K3 I2C6 pinctrl state
MIME-Version: 1.0
Message-Id: <20260831-ctl2301-v4-5-b335d52a0570@linux.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=994;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=oPyPhpeTyLPcNCtmwSXuGQluq3E1noUV5NUuvWuVnOg=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlTW+e9tQ3Oef/55bOeGYtnC1hm1Lw06r5/06Ug+QeL6
 7O+lUFBHaUsDGJcDLJiiizdD3i2FfhE2RYIFPrCzGFlAhnCwMUpABMx2sPI0G7wYPdJl7poh42X
 lnBFvcs8rPchyFruW8lz02tbF/zWFWL4H9ab9n7v8YYMzs/+Yc57///uC/BbPqfI+c7rglk3Nxs
 HsAEA
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_064641_293785_A3119374 
X-CRM114-Status: UNSURE (   8.62  )
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
index 6482d24be139..cb4f4f4e33af 100644
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
