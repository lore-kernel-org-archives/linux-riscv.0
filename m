Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0389CC83F33
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 04:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KsQTuATXJ5s2jgTRKuGlGtAn5WtFuuzUtOH56WZ/DyQ=; b=hzJdmxuyej9Zn4
	qEwek6olIfH2y6LzyFAoGupjc4MchTW0XcFWqTS2vEbHLoyQ5soB0kWhbbwfHHAGuDjfCSYGR6Cej
	NHlkEp6WyliRxujjKUb4VW9WyjL4f+zCRz5TY3uuOLTtQ/g9CLiq0pw4ipnKXQki7Ap6uflvZd+WX
	1cmghcQJn9IYDNb9JThQ/EId6A6VOoe+mJA+mn9kxOl52nONK2ZDEMydRBoRcJw1qjwT3zaEjdOhu
	EMpJjIr+0gWjFNfqn4b4NQHPHUTRdGxc9dHrGSTkgV7a+hHKDw8CeqKkxKcdW+kuCUcQPMK5q4JOW
	sdc+81jmitHDX4J5a9wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qd1AM-003FRa-0b;
	Mon, 04 Sep 2023 04:26:22 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qd1AG-003FL3-2Q
	for linux-riscv@lists.infradead.org;
	Mon, 04 Sep 2023 04:26:21 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20230904042606epoutp0309968e41465b1d3fed56c50f90ac50a0~Bl4zfARji3009930099epoutp03d
	for <linux-riscv@lists.infradead.org>; Mon,  4 Sep 2023 04:26:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20230904042606epoutp0309968e41465b1d3fed56c50f90ac50a0~Bl4zfARji3009930099epoutp03d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1693801566;
	bh=F0Cw2/eIVKvUe9Ad3kDZbvYRFetszRqIT02C8jm0Ihc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vfjfoOzR59kOatlizBYeVUYzM/G7l1Kw/qXf2PZqmi2HiPI6GFkR9DCoB29HvSyTr
	 3yqBfe6U6Dm29hva0IpLVw1WBf6OhW5Mu7haxZ0BbL3QthqoITYpWok4bV7x5s/Bne
	 xTMU/D/dnijDqD7fBDAARwP4WGLGhbFWQWWY50HI=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTP id
	20230904042605epcas1p13e75eb52c8cef4bd57e8e556bdb6d119~Bl4yzpxWN3248132481epcas1p1g;
	Mon,  4 Sep 2023 04:26:05 +0000 (GMT)
Received: from epsmgec1p1-new.samsung.com (unknown [182.195.38.232]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4RfFv02xxqz4x9Q1; Mon,  4 Sep
	2023 04:26:04 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
	epsmgec1p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	0C.8B.18968.C5C55F46; Mon,  4 Sep 2023 13:26:04 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
	20230904042603epcas1p47c4e858d65f2618d747bdc214d350cf7~Bl4xbOmDK0894808948epcas1p46;
	Mon,  4 Sep 2023 04:26:03 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20230904042603epsmtrp18accbbeb8bdfa7bc1a73b0833efad0e2~Bl4xaYGUI0102601026epsmtrp14;
	Mon,  4 Sep 2023 04:26:03 +0000 (GMT)
X-AuditID: b6c32a4c-34c49a8000004a18-e3-64f55c5cf3a8
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	28.1A.08742.B5C55F46; Mon,  4 Sep 2023 13:26:03 +0900 (KST)
Received: from mediaserver.. (unknown [10.113.111.131]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20230904042603epsmtip10f0955ba6b9506551bf7511184e42159~Bl4xNs_XB1398813988epsmtip1i;
	Mon,  4 Sep 2023 04:26:03 +0000 (GMT)
From: Kwanghoon Son <k.son@samsung.com>
To: p.zabel@pengutronix.de, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jszhang@kernel.org,
	guoren@kernel.org, wefu@redhat.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, inki.dae@samsung.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH 3/3] riscv: dts: Add th1520 reset device tree
Date: Mon,  4 Sep 2023 04:25:59 +0000
Message-Id: <20230904042559.2322997-4-k.son@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230904042559.2322997-1-k.son@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJJsWRmVeSWpSXmKPExsWy7bCmvm5MzNcUg1t/RSy2/p7FbrFm7zkm
	i/lHzrFavNjbyGIx6f4EFovmY+vZLPpePGS2uLxrDpvFts8tbBZ3751gsXh5uYfZom0Wv0Xr
	3iPsFi37p7A48Hm8efmSxeNwxxd2j02rOtk87lzbw+axeUm9R/9fA4/3+66yefRtWcXocan5
	OrvH501yAVxR2TYZqYkpqUUKqXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6
	bpk5QPcrKZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yVUgtScgpMC/SKE3OLS/PS9fJSS6wM
	DQyMTIEKE7IzXv/fxFjwmKvi2ck9LA2M3zm6GDk5JARMJG42v2ftYuTiEBLYwyix594UJgjn
	E6PEyssHGSGcb4wSHd9+MMK09M59zQ6R2MsoMfv4V6j+N4wS257/YAapYhNQl1jSthasSkTg
	P6PEmz+tTCAJZoF4iRPXzoEVCQs4Sqx4/YIVxGYRUJVoXLINqIaDg1fAQuLoJWOIbfIS+w+e
	BSvnFLCU+PDwINgVvAKCEidnPmGBGCkv0bx1NjPILgmBPRwSu78dZoNodpFoafjKCmELS7w6
	voUdwpaSeNnfBmVnSxz9uBeqvkTi+qxFUPXGEvuXTga7h1lAU2L9Ln2IsKLEzt9zGSH28km8
	+9rDClIiIcAr0dEmBGHKS9zqLIeoFpU48/Qj1HAPiU+T26Hh1sMosfblVKYJjAqzkHwzC8k3
	sxAWL2BkXsUolVpQnJuemmxYYKibl1oOj+Xk/NxNjOA0reWzg/H7+r96hxiZOBgPMUpwMCuJ
	8Mppf0oR4k1JrKxKLcqPLyrNSS0+xGgKDO6JzFKiyfnATJFXEm9oYmlgYmZkbGJhaGaoJM4b
	86k9RUggPbEkNTs1tSC1CKaPiYNTqoFp2mcxzuOHTfLLd//fyuZbrXp9fht7bJ7G9QcXJ/4y
	C7+dZnm6cCdP7t+l2j92TlB6XaIt4zMh8HFlPX+QCKf+pA+3hC8E8Mef3menUhx+wnu269Gs
	hpS6A+1c02pOyjtdEdp0K8ji2YuDcUcPrfEorJ5xQ7EpjOHLzwdVLoePb47f2bvw5v2bzrOq
	bLfxBjhHq/IkBius3z77Z7L7gWOHrTUmqfGkzi1d0F10l4knRFXt3MW7cW0erLMi9/8MUgjq
	0F79yGd6CePs94IR6asKfu679+XEyVCjh0sNHr0NVp97PsF5+g1O5q/SPUyR6/r/s/048uPZ
	LLlvb9qUTJSMuH5MXXzev3AeR8mxkmkJSizFGYmGWsxFxYkAvZLQQFwEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLLMWRmVeSWpSXmKPExsWy7bCSnG50zNcUg7YDZhZbf89it1iz9xyT
	xfwj51gtXuxtZLGYdH8Ci0XzsfVsFn0vHjJbXN41h81i2+cWNou7906wWLy83MNs0TaL36J1
	7xF2i5b9U1gc+DzevHzJ4nG44wu7x6ZVnWwed67tYfPYvKTeo/+vgcf7fVfZPPq2rGL0uNR8
	nd3j8ya5AK4oLpuU1JzMstQifbsErozX/zcxFjzmqnh2cg9LA+N3ji5GTg4JAROJ3rmv2UFs
	IYHdjBKzz1ZCxEUlOi43MnYxcgDZwhKHDxdDlLxilFi4LQHEZhNQl1jSthaolYtDRKCXSeLD
	xyVMIAlmgUSJLV9fM4PYwgKOEitev2AFsVkEVCUal2xjApnJK2AhcfSSMcQqeYn9B8+ClXMK
	WEp8eHiQEWKXhcSGX69YQGxeAUGJkzOfsECMl5do3jqbeQKjwCwkqVlIUgsYmVYxSqYWFOem
	5xYbFhjmpZbrFSfmFpfmpesl5+duYgTHkJbmDsbtqz7oHWJk4mA8xCjBwawkwiun/SlFiDcl
	sbIqtSg/vqg0J7X4EKM0B4uSOK/4i94UIYH0xJLU7NTUgtQimCwTB6dUA5PPG6Ooc7G2L0Vq
	WW23+Mw0LbvS1NVY6HuD1+nZvwWiZ6erTZHMDDKUs7qbIBddlL9Bm/d8oIbO1JJVaRkMX9+s
	u+SsUn5QfmXKPFnuKS0vd/eqlf3Mn3bTLMQxp1nGtdcvWtWcR4ntbFWi2JU39Wsr8+fPluI6
	4r+t23e3gsEtJ79//xsO2344vTRV+Cv7Hrs9R9V+GtrqCMqdzt6nrL9toe2CmPK8E2Ki/PMf
	RuxMVDG4nL+14HPh72iezefKDuwtV1ASWuUtXFKnMi2qbD7z1q7W3PqDLvprvtz/cGbC6SmH
	5131/PH+kqvayX33g8K2H9E7lBUsbyK47LrH/dBjXovD1q3a/ptddJGMhxJLcUaioRZzUXEi
	ACRhl6sQAwAA
X-CMS-MailID: 20230904042603epcas1p47c4e858d65f2618d747bdc214d350cf7
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230904042603epcas1p47c4e858d65f2618d747bdc214d350cf7
References: <20230904042559.2322997-1-k.son@samsung.com>
	<CGME20230904042603epcas1p47c4e858d65f2618d747bdc214d350cf7@epcas1p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230903_212618_304661_7EBC5F37 
X-CRM114-Status: GOOD (  14.94  )
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
 arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi | 4 ++++
 arch/riscv/boot/dts/thead/th1520.dtsi                  | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index a802ab110429..b689cc049ad8 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -36,3 +36,7 @@ &uart_sclk {
 &dmac0 {
 	status = "okay";
 };
+
+&rst {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index ce708183b6f6..1cacfa386d19 100644
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
+			status = "disabled";
+		};
 	};
 };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
