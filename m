Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C168FCA0ECD
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 02:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cjKNsyEv19XkC/nLyfvxNwCBkWyI8ELNdGG9qOCp1OQ=; b=RrS2GQUDspOOJF
	nNhzznDYPZ6gIV7iu/jy5mzfBNojMDJh0qzUtFvnvLlTHHoe95zSFXwkAi3HPLOTXYpd2URq2ntcp
	DfXdQD4tzLkwAF7JS4iMqg5vvY9u8SzlKaMmd8PVsslc71n1eQ6Qs4A4xvOyKA9rQr61mgiZm88BR
	B2eP3CAI7MLKJh4gU/vuwhxsmSeN8eCSG083uc3QxoyieUmQhPqbcbysAcaSwxyZbcvVfyOWDs0Xj
	bZe36O/1qnttbEvoX+YQLc5Gd6DroCCMKsW/RzMblD3lgQcnD4+9RPk9r0oK4NYMyeo/YbnQR6UyE
	zaq+L5FrioZQWqE20AHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qftT8-001zLr-2R;
	Tue, 12 Sep 2023 02:49:38 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qftSx-001zJ0-28
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 02:49:35 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20230912024919epoutp02a7defbf6fb873e96bb076e136cc03285~EBul710za2435524355epoutp02Q
	for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 02:49:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20230912024919epoutp02a7defbf6fb873e96bb076e136cc03285~EBul710za2435524355epoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1694486959;
	bh=rDbE1hdJHslcOuf3rH3LFVxmxlcQTu0MVLhIfXTOcsU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eRRCWT6m6sOwoPke5k0U4dhXnuzb1rsSGqIiBlZhoeSaHJfPxoSs97Mzv7Syt56kl
	 g4T/E0j8263XLRJpkAi4aynxjagBC0havVJ81JaJKcMQx6SbzsNuP/gD0QaOie6ycs
	 egxGEQfn2+iJMOX35sqqQGg3AV5XY6zhmPHgpZ4o=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTP id
	20230912024919epcas1p49ec0ef357fa7fea7576da4ca41f716c8~EBuldbjHd1698216982epcas1p4P;
	Tue, 12 Sep 2023 02:49:19 +0000 (GMT)
Received: from epsmgec1p1-new.samsung.com (unknown [182.195.36.136]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4Rl7Mf18bmz4x9Q8; Tue, 12 Sep
	2023 02:49:18 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
	epsmgec1p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	3D.CF.18968.EA1DFF46; Tue, 12 Sep 2023 11:49:18 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20230912024917epcas1p2076a3a0674ae94e8c8641cc9eb617eac~EBukHCJN11134811348epcas1p2q;
	Tue, 12 Sep 2023 02:49:17 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20230912024917epsmtrp1761977434212b2f9f896c514d5f5d506~EBukGOSov2900629006epsmtrp1g;
	Tue, 12 Sep 2023 02:49:17 +0000 (GMT)
X-AuditID: b6c32a4c-d19fe70000004a18-7f-64ffd1ad2eae
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	84.A7.08649.DA1DFF46; Tue, 12 Sep 2023 11:49:17 +0900 (KST)
Received: from mediaserver.. (unknown [10.113.111.131]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20230912024917epsmtip19dfafad968eb71f42bf2f6b588ddfb2c~EBujz5orr3056130561epsmtip1K;
	Tue, 12 Sep 2023 02:49:17 +0000 (GMT)
From: k.son@samsung.com
To: p.zabel@pengutronix.de, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jszhang@kernel.org,
	guoren@kernel.org, wefu@redhat.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, inki.dae@samsung.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Kwanghoon Son <k.son@samsung.com>
Subject: [PATCH 3/3] riscv: dts: Add th1520 reset device tree
Date: Tue, 12 Sep 2023 02:49:14 +0000
Message-Id: <20230912024914.3769440-4-k.son@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912024914.3769440-1-k.son@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLJsWRmVeSWpSXmKPExsWy7bCmru66i/9TDN4eYLbY+nsWu8WaveeY
	LOYfOcdq8WJvI4vFpPsTWCyaj61ns+hdc5XJou/FQ2aLy7vmsFls+9zCZnH33gkWi5eXe5gt
	2mbxW7TuPcJu0bJ/CosDv8ebly9ZPA53fGH32LSqk83jzrU9bB6bl9R79P818Hi/7yqbR9+W
	VYwel5qvs3t83iQXwBWVbZORmpiSWqSQmpecn5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtq
	q+TiE6DrlpkD9ISSQlliTilQKCCxuFhJ386mKL+0JFUhI7+4xFYptSAlp8C0QK84Mbe4NC9d
	Ly+1xMrQwMDIFKgwITuj5aVZwUr2islzn7I3MP5h7WLk5JAQMJE4//cEO4gtJLCHUWLPZqMu
	Ri4g+xOjRMut6cwQzjdGiY/tD5lhOi7f+gmV2MsoseX2LCYI5w2jxP4V2xlBqtgExCU6r61k
	BEmICPxnlHjzpxWsilmgiVFidtsMti5GDg5hAVuJg8sSQRpYBFQlVp3rADuEV8BCYsuUnYwQ
	6+Ql9h88C7aaU8BSYu6UbkaIGkGJkzOfsIDYzEA1zVtng50kIXCCQ+J023eoW10kZs9uZoOw
	hSVeHd/CDmFLSbzsb4OysyWOftwLVVMicX3WImjIGEvsXzqZCeROZgFNifW79CHCihI7f89l
	hNjLJ/Huaw8rSImEAK9ER5sQhCkvcauzHKJaVOLM049Qwz0k3p58zQIJqx5Gie59G9kmMCrM
	QvLNLCTfzEJYvICReRWjVGpBcW56arJhgaFuXmo5PJKT83M3MYLTtZbPDsbv6//qHWJk4mA8
	xCjBwawkwlty6G+KEG9KYmVValF+fFFpTmrxIUZTYHhPZJYSTc4HZoy8knhDE0sDEzMjYxML
	QzNDJXHemE/tKUIC6YklqdmpqQWpRTB9TBycUg1MvoaK9y9NXfjcYXXyjkbPzS+5/5QUnT3M
	XiT+QM/8jRhnTLBKiZrlDQ5ff7/Quyca1hzQF9wp4BrLGnTdP/nd34bzAczTLtj6Xkv1SKt5
	ZHi5KFTQiyHk4NyZi69IddV4cJ3wCpj8yu8eW+Jp/amhFr/j90yodTpm3T9tSgQX1+HseOHt
	78J3r9v5/+CU+q55d4QvaV9ps5q5UDe15dHvrrLm5s13WN4WXX/I0f0n4ol02FWddIE9/+TE
	J+yfId2eEqp7axfHlxmLmUKePVYxtmh//qq/uPVLUvqDnZe7r3muVvxvV1S7w6/v2Nk14aGv
	+O9NvKMi6KxVU13QXr1qyd373FtZHn9vOS7hqbJZiaU4I9FQi7moOBEAkjsJZ2AEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphkeLIzCtJLcpLzFFi42LZdlhJTnftxf8pBi9mqlps/T2L3WLN3nNM
	FvOPnGO1eLG3kcVi0v0JLBbNx9azWfSuucpk0ffiIbPF5V1z2Cy2fW5hs7h77wSLxcvLPcwW
	bbP4LVr3HmG3aNk/hcWB3+PNy5csHoc7vrB7bFrVyeZx59oeNo/NS+o9+v8aeLzfd5XNo2/L
	KkaPS83X2T0+b5IL4IrisklJzcksSy3St0vgymh5aVawkr1i8tyn7A2Mf1i7GDk5JARMJC7f
	+sncxcjFISSwm1Hiwc/fzBAJUYmOy42MXYwcQLawxOHDxRA1rxglrs7uYQepYRMQl+i8tpIR
	JCEi0Msk8eHjEiYQh1mgjVHixIetzCDdwgK2EgeXJYI0sAioSqw61wHWzCtgIbFlyk5GiGXy
	EvsPngVbzClgKTF3SjdYXAio5v6Hz4wQ9YISJ2c+YQGxmYHqm7fOZp7AKDALSWoWktQCRqZV
	jJKpBcW56bnJhgWGeanlesWJucWleel6yfm5mxjBEaWlsYPx3vx/eocYmTgYDzFKcDArifCW
	HPqbIsSbklhZlVqUH19UmpNafIhRmoNFSZzXcMbsFCGB9MSS1OzU1ILUIpgsEwenVAOT82Te
	1lWaGyOf7Dq77ZD5I578A8sUvJuy7ywvmLZLY+LH+dcOX2Ga9OOnkE/ytK2ndTpXX2+IX7jH
	yrM+c9vaydPSLPb9/s8pdPnPLZtlLcoXXR8kv9vNvCrudme9uPSbyIk/yv7GvXKx0b1fW828
	yGm9GsO9O3rryh5G7tHin57SOPcZ28EVZuwr5ziFqy79sGGnHndm2vQFv+KOvwxou3K6/WbQ
	ZsuyLRzLuRjNmAT9ch7KWknxre3yMAyMalB7zbU2uLIioLFPS/Fa/XvJ/ccD+I/KXdx0P4J5
	ZoJwlFfrt52e7+vvGj3dfXjCzwklSbNv6NeaxqurceWKL5sennorMFJO4FrkWpfZnnr7lViK
	MxINtZiLihMBOE6D0hcDAAA=
X-CMS-MailID: 20230912024917epcas1p2076a3a0674ae94e8c8641cc9eb617eac
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230912024917epcas1p2076a3a0674ae94e8c8641cc9eb617eac
References: <20230912024914.3769440-1-k.son@samsung.com>
	<CGME20230912024917epcas1p2076a3a0674ae94e8c8641cc9eb617eac@epcas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_194928_260934_0F8DD879 
X-CRM114-Status: GOOD (  15.18  )
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

From: Kwanghoon Son <k.son@samsung.com>

Add reset device tree for th1520 SoC

Signed-off-by: Kwanghoon Son <k.son@samsung.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index ce708183b6f6..7e592449b5e4 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/reset/th1520-reset.h>
 
 / {
 	compatible = "thead,th1520";
@@ -418,5 +419,12 @@ portf: gpio-controller@0 {
 				interrupts = <55 IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
+
+		rst: reset-controller@ffef014000 {
+			compatible = "thead,th1520-reset", "syscon";
+			reg = <0xff 0xef014000 0x0 0x1000>;
+			#reset-cells = <1>;
+			status = "okay";
+		};
 	};
 };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
