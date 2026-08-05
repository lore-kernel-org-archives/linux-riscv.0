Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A134C55174
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 09:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=at8XaVRruT408yBeaG4/4TnLb7eyW9H2VmQzj3N2Or0=; b=4aIQ+FtlHN1mMs
	VFIOCAPF/OMOO4q9KQR3lGIN/6C7f0szOFGPrQ6w/ZWzdroDhVtOZqRQD+smmT0VpTF7cR+y5uLi1
	+Yqk4Wk+NQkJyT0mRtk4/oM67vvjHSE5+L6XfrTr0eHU3M8Ev0OjdhXSPDtecKBZgrPjkDdP2ztTV
	iHKDaE0cobHnguIitqECPJoXob10N2MeWWwVf7gta6HX2kg6iI633LWsgNeZlB8j9WhFAOh6wDTRh
	mLDpdz0Gf74tt+T9gPvzKGqxpO0EghqLi+Y3efW1cdibuoTJmJwCAOiG3YuefRSsEfOn2t9tbOVMf
	k6/YZZq2nHoipTIW6kHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrXtH-00000003cHT-2LbQ;
	Wed, 05 Aug 2026 09:26:23 +0000
Received: from out-185.mta0.migadu.com ([2001:41d0:1004:224b::b9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrXtE-00000003cH1-1Rwp
	for linux-riscv@lists.infradead.org;
	Wed, 05 Aug 2026 09:26:21 +0000
X-Mailbox-Line: From troy.mitchell@linux.dev  Wed Aug  5 02:03:29 2026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785921977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3rrXLP9Gl/9+kZEGTyeSXg9dLTosBnnAR6frYAqGISA=;
	b=mmg7s7OUrs8f++wIQHtt4bS88b+gf2Fb5ZOGsALIL/+YjBk9Q0HDdkbGDBgwRHFoTC4BBE
	Q4wDPhHufV2nJ+03ZfdVuq+RKy0kQKmpHAIK4X77TBbjXx2obMOZERzEQTXmt8msVNketb
	6M7Kh7GC2+tJDy7HLgD2a8McH/2/EQM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Wed, 05 Aug 2026 02:00:55 -0700
Subject: [PATCH v3 5/6] riscv: dts: spacemit: Add K3 I2C6 pinctrl state
MIME-Version: 1.0
Message-Id: <20260805-ctl2301-v3-5-b86c75d1c552@linux.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=997;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=5PcQb4tYPqg14LJCgWYmntExBwf8V8dZAlN+M5P1nEg=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlFv0/OuPKbp8ltCf9Pr8pPZ+yOhGxRVOe89e2qXGXU6
 3V8H65odJSyMIhxMciKKbJ0P+DZVuATZVsgUOgLM4eVCWQIAxenAEzEwpDhn16eQy/n2j0yHLvF
 Xq1XXTG5JeBufIOCj1WacGPNFMNd7Qx/uMU5ervlfkxmudd/9ucMi1+3dl90j2fZtPS5o8hFp72
 r2QA=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
In-Reply-To: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
References: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_022620_526183_3C407FBD 
X-CRM114-Status: UNSURE (   8.38  )
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
index 3ee1471f3798..e50f3e4b5536 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -78,6 +78,17 @@ gmac1-phy-0-pins {
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
