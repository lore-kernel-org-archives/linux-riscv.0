Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85DFCD37B0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 04:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W4YL1bzm95OvgOnT/FWLkXno+ew8XQ+BqzcnZLj6En4=; b=ePUdwUrClSL20n
	QROtZkJxLBCX9bE3IzJxPVj34Tal3/AenCa78vfHIr4SGz7pe9rH2Cs2E4Iq40+GtO42m+nhhRT/9
	GbyWFW7JAb7hUet96VD7C/Z/ZsF/VajGWhM/RLx2RRxu3RsjrNJBkvMmKahORTs6y1d1qwpdNfEuz
	3RWKpa5Xaqsf5n1v+9owE3ziGjxTZC8KeybsDzly5DRztL3MfPoVyAqOOkhMN60gHFhL7Cy4XxQ3b
	Xweq9gzQjgLd9g3nSVdjv4aQcd6fEvlsIJ1xo7to7U95O8qZbwlWEwA0EW+feHFik6853it8Gd4lV
	t86GTeTszHlwp6hBpXbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi6Eb-00EPAR-0s;
	Mon, 18 Sep 2023 04:51:45 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi6EY-00EP9J-0J
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 04:51:43 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20230918045136epoutp040c05eca4b703b2618036a1007f7721c9~F5REdy5VH1226712267epoutp04R
	for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 04:51:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20230918045136epoutp040c05eca4b703b2618036a1007f7721c9~F5REdy5VH1226712267epoutp04R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1695012696;
	bh=/m086ylcvUs8tqHsQS1HIUYanaph0yHgdpARIuUHjoo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CWr3eZWYIls96bRTa3zvLaIiuUCW5IZIh/bBk25WAgD8xsq3xUHmsGmiISgX7tuPg
	 oXYdx5ZZC7l7hTuwKBQuEboajxKP8FqhfV2b+qH42PAw1tDxw3j7MI5DJEEz916avT
	 2kiLo1Cm7GQ0egj9/FvMfPBTmlnk/f/b+M4dMkzA=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTP id
	20230918045135epcas1p17ddb745a0bf02b783cb3b86e16694307~F5RD91edg0101201012epcas1p1V;
	Mon, 18 Sep 2023 04:51:35 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.36.134]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4Rpsny6Dkjz4x9QF; Mon, 18 Sep
	2023 04:51:34 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
	epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	DA.E3.09646.657D7056; Mon, 18 Sep 2023 13:51:34 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
	20230918045134epcas1p3263e6d4124a0d37faadb3cb97bf7cd0b~F5RCpY53A0495704957epcas1p3v;
	Mon, 18 Sep 2023 04:51:34 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20230918045134epsmtrp12b51a8155bf7a3f266118d900b6e3417~F5RCok4bO1930419304epsmtrp1X;
	Mon, 18 Sep 2023 04:51:34 +0000 (GMT)
X-AuditID: b6c32a37-b23ff700000025ae-c0-6507d756dc3c
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	F5.65.18916.657D7056; Mon, 18 Sep 2023 13:51:34 +0900 (KST)
Received: from mediaserver.. (unknown [10.113.111.131]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20230918045134epsmtip14278f579639705e41854fbb2cb3b367d~F5RCTA6TB1476614766epsmtip1g;
	Mon, 18 Sep 2023 04:51:34 +0000 (GMT)
From: Kwanghoon Son <k.son@samsung.com>
To: p.zabel@pengutronix.de, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jszhang@kernel.org,
	guoren@kernel.org, wefu@redhat.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, inki.dae@samsung.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 3/3] riscv: dts: Add th1520 reset device tree
Date: Mon, 18 Sep 2023 04:51:25 +0000
Message-Id: <20230918045125.4000083-4-k.son@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918045125.4000083-1-k.son@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKJsWRmVeSWpSXmKPExsWy7bCmgW7YdfZUg8W/DC22/p7FbrFm7zkm
	i/lHzrFavNjbyGIx6f4EFovmY+vZLPpePGS2uLxrDpvFts8tbBZ3751gsXh5uYfZom0Wv0Xr
	3iPsFi37p7A48Hm8efmSxeNwxxd2j02rOtk87lzbw+axeUm9R/9fA4/3+66yefRtWcXocan5
	OrvH501yAVxR2TYZqYkpqUUKqXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6
	bpk5QPcrKZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yVUgtScgpMC/SKE3OLS/PS9fJSS6wM
	DQyMTIEKE7IzTq3cwFbwlq1i4sz9bA2M51i7GDk5JARMJA7++MkMYgsJ7GCU+P04pYuRC8j+
	xCixbP0fdjhnzap1LDAdG+YfhkrsZJS48fMvlPOGUeLcrh/sIFVsAuoSS9rWgiVEBP4zSrz5
	08oEkmAWiJc4ce0c2EJhAQeJvbsmgo1lEVCVWDl3Blgzr4CFxP4HJxgh1slL7D94FqyeU8BS
	4vytnYwQNYISJ2c+YYGYKS/RvHU2M8gyCYEdHBK/10EskxBwkTh67A+ULSzx6vgWdghbSuJl
	fxuUnS1x9ONeNgi7ROL6rEXQkDGW2L90MlAvB9ACTYn1u/QhwooSO3/PZYTYyyfx7msPK0iJ
	hACvREebEIQpL3GrsxyiWlTizNOPUMM9JB69/AINqx5GiVefFzJPYFSYheSbWUi+mYWweAEj
	8ypGsdSC4tz01GLDAmN4DCfn525iBKdnLfMdjNPeftA7xMjEwXiIUYKDWUmEd6YhW6oQb0pi
	ZVVqUX58UWlOavEhRlNgWE9klhJNzgdmiLySeEMTSwMTMyNjEwtDM0Mlcd5bz3pThATSE0tS
	s1NTC1KLYPqYODilGphqVps02AX+686K1E5mWMsW9Mg9zLtQj6mEb+ItIQb7RwH91V+kVerY
	Gqvi4ld5X5233HjPjP6gWU6Gj05ualU6MvONi45U8Iuj+R4nFytG3T9688MepV8XdSxqGBZZ
	mpz/FyxnvmpNS9/0Vqmp2xZluznPlS3JsC24u8eNS7xHQYYh2730ndHa2/fun8sW+30tdv23
	R+u6F0Qd+dTs/2OnQWC8GVdCkZvLIi+nuUrVax/sFHzHsHrmJMdTbO8+f9hTOn3HGZFbWWv9
	E/5ON5028+umo+zK6jHRJ1eekll4+eHnX1+/PTRNvlwQ+E5J2IdPZcE/6TPPTYLMPmu2uWXM
	WsR97+CqqO/xH7fUHvFUYinOSDTUYi4qTgQAcGokuFgEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDLMWRmVeSWpSXmKPExsWy7bCSnG7YdfZUg3s7RS22/p7FbrFm7zkm
	i/lHzrFavNjbyGIx6f4EFovmY+vZLPpePGS2uLxrDpvFts8tbBZ3751gsXh5uYfZom0Wv0Xr
	3iPsFi37p7A48Hm8efmSxeNwxxd2j02rOtk87lzbw+axeUm9R/9fA4/3+66yefRtWcXocan5
	OrvH501yAVxRXDYpqTmZZalF+nYJXBmnVm5gK3jLVjFx5n62BsZzrF2MnBwSAiYSG+YfZu9i
	5OIQEtjOKHFn20QWiISoRMflRsYuRg4gW1ji8OFiiJpXjBL7zjWyg9SwCahLLGlbC9YsItDL
	JPHh4xImkASzQKLElq+vmUFsYQEHib27IIayCKhKrJw7A6yZV8BCYv+DE4wQy+Ql9h88C1bP
	KWApcf7WTrC4EFBN74dXjBD1ghInZz5hgZgvL9G8dTbzBEaBWUhSs5CkFjAyrWIUTS0ozk3P
	TS4w1CtOzC0uzUvXS87P3cQIjiCtoB2My9b/1TvEyMTBeIhRgoNZSYR3piFbqhBvSmJlVWpR
	fnxRaU5q8SFGaQ4WJXFe5ZzOFCGB9MSS1OzU1ILUIpgsEwenVAMTg+ymWT0Pev3W/VCba1Tf
	kXtRNPPkHp98K4alvyYJZNvwbJyxOcRA2XHbtYtqFpsFBEU2VAq6eM+zmG4u6t0sc2VVbdZG
	9z0M76uO/IituFrp82ORR0z327dR1w+kds/a9shyvooCQ5Htvktcwot/TosQeDxZWdfS1d/u
	/2W3wuf8SsGtu3nzlnCfu5WVzD/ZplQxc/PvT32izYqn81bXz3izXsYr67Dk4m7Vwxmb56V9
	8FzL6+d6uDh6zcGZF2dtav17ZcL37eeZGBJ71ncdVd5bzK0p+P9o0bP2rAABrT+NKx4vNTyT
	fGhn7+vK3ICfLrkzsm47T8k36mtsM74g373cUFzaWPxFsNcaxhNKLMUZiYZazEXFiQDB2bDl
	DwMAAA==
X-CMS-MailID: 20230918045134epcas1p3263e6d4124a0d37faadb3cb97bf7cd0b
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230918045134epcas1p3263e6d4124a0d37faadb3cb97bf7cd0b
References: <20230918045125.4000083-1-k.son@samsung.com>
	<CGME20230918045134epcas1p3263e6d4124a0d37faadb3cb97bf7cd0b@epcas1p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_215142_615213_4D1C58D7 
X-CRM114-Status: GOOD (  15.31  )
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

Add reset device tree for th1520 SoC

Signed-off-by: Kwanghoon Son <k.son@samsung.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index ce708183b6f6..210f234839c3 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/reset/thead,th1520-reset.h>
 
 / {
 	compatible = "thead,th1520";
@@ -418,5 +419,11 @@ portf: gpio-controller@0 {
 				interrupts = <55 IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
+
+		rst: reset-controller@ffef014000 {
+			compatible = "thead,th1520-reset", "syscon";
+			reg = <0xff 0xef014000 0x0 0x1000>;
+			#reset-cells = <1>;
+		};
 	};
 };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
