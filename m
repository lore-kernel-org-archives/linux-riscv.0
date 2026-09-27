Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB67C9830E
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 11:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NvWc5Xv0txQSRkmNsoD9y/Ag3mKLprdn2k2H9fBC0Ps=; b=wwbSQn8DIbwk25
	IEHDGXfiUt395m56td/gwXuWUZVOge/SAKWlnE0jyYExsnCc+h/Yjq8yJ+pPlO3Wu/q0ioxLdN1Bs
	Jvyy1++DQ5OwEDsWnUeq6eSU3+FEYZ/7bjT1kah2OKdSlWIDQhFzWovS48hgxw56T9MDcHkifI60f
	bRjVge/51HEcJYSw2J5lrCWQIFCh9FYgKNM5HCoXiuBxBmfgrhZP7ovl/Lg8ego16Sjo/jZQcK2Of
	dZBBImxeLuwhdFipLyj6yX2SHwCCDuoTW38T3lXZB2pDG7yyi2g2H3cHNdSObkfWd6H5s7pR/Wpab
	BLLwZpmoNU1SHkJThnvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAnFI-0000000GFL3-2F3P;
	Sun, 27 Sep 2026 11:40:40 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAnFG-0000000GFJd-0bVc
	for linux-riscv@lists.infradead.org;
	Sun, 27 Sep 2026 11:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790509211;
	bh=i9Oh/tY+3y6sXcDtc6QheXphUdLhAVLmmHAD/q2PU8w=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=YZYW3JqAA6M3xyr2zEu5AQ0UN5ApLW3o/rO3qOlmBOl0uhzdiVM/TCERJzD/ssVXs
	 /OWus5VVqLtirEEEx8vE7Xz0+gY/PxhH+m7NjKFf8gXq28YNzpQiWxMRlBTxkot8Ku
	 hQSyruFvebLZxq3uIHVfuf2kPZJrDJFm2gCMEGaM=
X-QQ-mid: esmtpgz12t1790509210t4140bd1f
X-QQ-Originating-IP: i6rmMHVV1ysThSCC4TvzT1YuXuJKrq7qJ9T40uOQRrc=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 27 Sep 2026 19:40:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18111601405295195048
EX-QQ-RecipientCnt: 21
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Sun, 27 Sep 2026 19:40:03 +0800
Subject: [PATCH v3 1/8] dt-bindings: usb: ci-hdrc-usb2: add
 spacemit,k1-usb2 compatible
MIME-Version: 1.0
Message-Id: <20260927-b4-spacemit-k1-usb2-v3-1-ce7095896039@linux.spacemit.com>
References: <20260927-b4-spacemit-k1-usb2-v3-0-ce7095896039@linux.spacemit.com>
In-Reply-To: <20260927-b4-spacemit-k1-usb2-v3-0-ce7095896039@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Ze Huang <huang.ze@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790509204; l=1574;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=UwBmvadiJPTAs36aoQ0p5Sg7nI3p9KQ0XUmMXE5Ud5Y=;
 b=t2gpc2ycNwk8LT7xjisdrKJayaR7cd4IPI4hlHUVRlRQ7kg4w9noHLBlbaMgr99bGtotFsCvr
 xq5RGeVQ4soCZ9UibMChXiHPlAbPCtMEcTaHbHx/Md0DArrgTYjoQxV
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: MxX5kg4KifQ24uSMoT8m3ER75DUCMW/vi5AfPuGmF5GMEKtL6sov/x9o
	ng2agNvB30QIziSAS4izNlnd+hHsvmG4i9ZU+bUxk9ZtmcwNN9INL63QhHDVp/N0Oxg2dVP
	lFBfmEYK15retOFURRMdaQuPii62Dh2VVI7eF8b9GO7bzYoMYfhvj6Y24iDUjT7HSFks+jV
	G2Tjwf9TFqxEN8HhV/RADes8wsE4pLA4qM7kiISDs4VNnd/d+f0DmxtYnZJY2NsceV7OqV/
	rbnhdoYZZ68K3Sfhv54aDsiJAXUGGkQ2hzwmjq1T+qEMxmf22FXEH244cpwekZrMul99Db3
	vohpBsZyAFDNTskJHS8GPVlJnHfdxuoVaLEq0b9MhqoR+CIBGMlAPsjTcriHxGtcftQNSJB
	IceLjn3Ewq+f+kDYw+L18pok3NRlBNnUP51eGPLSd/MGASKlDoUu1L5MEkMNVjtMrTAXhhz
	lyYDlBDTUCdo3W5HafwlMKJUrt1rpk+JyJq1LjgJHBEg1TI/RDNhmFHaQAf9rZ7N4jDdm2m
	yQNjkeZoVF4g49UIE73yntFmFpwJVu1f+vh7i8UOp0nqPSFuBdyWx0GVSGVF+Hn7s0CeKTl
	KjnpWemJdqww4sJY+8YKGpK0IuHvLx5S+8af3txaNFCvy56XYIcQCOYXGvjVx10yKZPno/J
	fRKlG33VkuLak70jARKIxgqnFz2/DKvGsGwi/doLO6x8oRwmlXneZGV/aSy2uWFP6GizgpI
	UtqP//zh6cmMXIZddah53nneUeS4LBf348fOzFeCgGCVo1AGCikel5g0ej1zpS//iefAUIT
	/XKcPxbkyXNB3Hwa29gI01R8hiVbQHsBdqlA99i7LU/IHvgUgjXWdh50OFho22EiEgsgk3e
	+YoNHwexIM8WQ1U9avMeCaDXk23aDjfzuZfKBawqp8OY7fLpNHHBrbN9/ZZKEuU0sVjOFLK
	XwvQ3u2lDSvISDZCBdxZKXbsAgK6PvmVTvTMt0nJ/K+qYAfp6TJOUgyHdlcsFU5TNj+iMip
	OrC4cjveWP7C9ykgRP2bQaQW2T9rgEHEVCx9Nty2OJAIqEJ/n/+x5XAGk1XcOLRRM3EyJX4
	hkuDc5siq74uRPiX8irEccIKIIN5JSgD0aPPepN0VlwmMl/RF3g1OQcwqU/eD9ED+dZtHai
	f+2kBqe91Ldny5o=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_044038_798353_83DA52E5 
X-CRM114-Status: UNSURE (   7.90  )
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

The USB2.0 controller on the SpacemiT K1 SoC is dual-role capable but
has no internal OTG registers, this requires flags which disable
related features set in platform data. Add a compatible string to match
the platform data.

Chipidea USB2 Controller on SpacemiT K1 requires 1 clock and 1 reset to
work, add constraints for it.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Tested-by: Ze Huang <huang.ze@linux.dev>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 620b564914d4..5c2b7eb1a6ff 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -25,6 +25,7 @@ properties:
           - nvidia,tegra124-udc
           - nxp,s32g2-usb
           - qcom,ci-hdrc
+          - spacemit,k1-usb2
       - items:
           - enum:
               - nvidia,tegra114-ehci
@@ -113,6 +114,20 @@ allOf:
           maxItems: 2
         clock-names:
           maxItems: 2
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: spacemit,k1-usb2
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        resets:
+          minItems: 1
+      required:
+        - clocks
+        - resets
 
 unevaluatedProperties: false
 

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
