Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F29FE67480
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2024 20:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A68/UYz2SwmTswFTnsIyFwhRjSgAZdMpaZxMys/c//8=; b=et0T5h297Aj3QI
	5QT/3BqxzcCyqomYWrsh9WqgLO4TBNcTT52YDOzB7IyZMECDxbsYTYjdyarQFR4K7oA84+Ulk6I37
	woj/pgv3OZKU9dRsqdHYdhfZfAoc8tddLJrFFENuPdLcXtmOPDGebxJRElKAQb4Cg5Yi424/vfOrI
	qmDpIM8tvP7EFwVS/l+Ol0RWDSCCKE8B1uRTUS+d2Z4ucD5FeYElp3wOThHkSvLjcY9hLXq+f4ex3
	Usm95fOM7dF5iDSQdP/bPscN7AysC28w61Uf+Rgn2oscqcrt1bru5RnHHFyh+EiG/niqNQGa89Lav
	jJv/nRyszoalouWs/5Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6c52-00000004odJ-3nXR;
	Thu, 31 Oct 2024 20:47:44 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6c4y-00000004oaW-1w6X
	for linux-riscv@lists.infradead.org;
	Thu, 31 Oct 2024 20:47:42 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20241031204738euoutp0205de0c0c8c9339e3a6c2a0d4b85496c9~DpJjzX5FU2196521965euoutp02t
	for <linux-riscv@lists.infradead.org>; Thu, 31 Oct 2024 20:47:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20241031204738euoutp0205de0c0c8c9339e3a6c2a0d4b85496c9~DpJjzX5FU2196521965euoutp02t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1730407658;
	bh=vxNiS8XZmEMSZYQqnfyixq5+aqnBLp9jGcPWzOWdRC0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pPNLMeeIVisSQc/wiEnyU5IsPQoSJdo4/2MqulL6DREOjMBM64OC7JXt1cf2U5Oat
	 x23tnPw9KWUcOSyVw7WiIlv/meGN0jtTXhCBYeCmvSwMQ+mEB/q36Ub6vJAD+nCB58
	 cifC5eBezs+GSpGUJH31I+8SZq/qgSB+x52hNJ9Q=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20241031204737eucas1p15251ab7dfccfaa4906d9ac64859ef16c~DpJigZ9Mx2981929819eucas1p1P;
	Thu, 31 Oct 2024 20:47:37 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 0F.C6.20409.9ECE3276; Thu, 31
	Oct 2024 20:47:37 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20241031204736eucas1p119124263356d8e5924b03f07a5638b42~DpJheAmKM2174621746eucas1p1U;
	Thu, 31 Oct 2024 20:47:36 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241031204736eusmtrp2bd47663bb74eb2ad5ced19e5d4694f4a~DpJhdR-oD1392413924eusmtrp2v;
	Thu, 31 Oct 2024 20:47:36 +0000 (GMT)
X-AuditID: cbfec7f4-c39fa70000004fb9-1d-6723ece943d1
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 19.53.19920.8ECE3276; Thu, 31
	Oct 2024 20:47:36 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241031204735eusmtip106d535dfcd5976eb7d664912f7f31151~DpJgqUCFN1679316793eusmtip1K;
	Thu, 31 Oct 2024 20:47:35 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com,
	jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, m.szyprowski@samsung.com, samuel.holland@sifive.com,
	emil.renner.berthing@canonical.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v5 3/3] riscv: dts: thead: Add mailbox node
Date: Thu, 31 Oct 2024 21:47:23 +0100
Message-Id: <20241031204723.1149912-4-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031204723.1149912-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPKsWRmVeSWpSXmKPExsWy7djP87ov3yinG/x9z26x9fcsdos1e88x
	Wcw/co7V4t6lLUwWlzpXMFq82NvIYnFtxVx2i5ez7rFZXN41h81i2+cWNou1R+6yW6z/Op/J
	4uXlHmaLtln8Fv/37GC3WH3uCotFy/4pLA6CHrMaetk83rx8yeJxuOMLu8fOWXfZPTat6mTz
	2Lyk3qNl7TEmj/f7rrJ59G1Zxehxqfk6u8fnTXIB3FFcNimpOZllqUX6dglcGS+/trAVHOGq
	OHnnLGMD436OLkZODgkBE4ntW1eydzFycQgJrGCUWP5wGSuE84VRYsLEmcwgVUICnxklZj2S
	hOn4++4fI0TRckaJZfefMkE4bxglTq66ywJSxSZgJPFg+XywUSIC65kknu1eBraEWaCXUWLq
	3plMIFXCAtYSS+e8A7I5OFgEVCXe3kgCCfMK2Eus/PuNBWKdvMT+g2fBzuAUcJCYvauVHaJG
	UOLkzCdgNcxANc1bZzODzJcQWM8pcfDWHHaIZheJ9dfmMkHYwhKvjm+BistI/N85HyqeL/Fg
	6ydmCLtGYmfPcSjbWuLOuV9sILcxC2hKrN+lDxF2lOhZeJ0VJCwhwCdx460gxAl8EpO2TWeG
	CPNKdLQJQVSrSUzt6YVbem7FNqilHhLzT9xjmsCoOAvJM7OQPDMLYe8CRuZVjOKppcW56anF
	Rnmp5XrFibnFpXnpesn5uZsYgWnw9L/jX3YwLn/1Ue8QIxMH4yFGCQ5mJRHeDwXK6UK8KYmV
	ValF+fFFpTmpxYcYpTlYlMR5VVPkU4UE0hNLUrNTUwtSi2CyTBycUg1MjJ9OO6QGCPxdOePd
	heysQC8Gxb36E9WmMb9//C3ttYt95C7WmRcUXvaKrHtmynrw5/Una/e84+JXuvT+VvwCy8qX
	1w9sXfbwxGPVcFFzg0/d8YWPvrzd/Oa3ouH0KX8tIt2i7Jk+fvPf/D/Katucf7Jrb2zRLDO6
	pbjhjft5M+Fojpgg1S0yXbsiC2rEWBicfppXT00uLzJlmNfM3/LqDPOFtH8c+ue/TP00a+s0
	6fSIm0tPT/VqUb+T5tg4o7tNfplZb+7cqdx/1Y16DGxXGgYnVRVFLJiodvQdSwnP5bV+si/1
	l8+Y8fdxh2/XtBJWXg0fzXU2eetfFhirVjomLfSwYryRlVM8XXnfDolkJZbijERDLeai4kQA
	kGrjlfIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRmVeSWpSXmKPExsVy+t/xu7ov3iinG3xayGKx9fcsdos1e88x
	Wcw/co7V4t6lLUwWlzpXMFq82NvIYnFtxVx2i5ez7rFZXN41h81i2+cWNou1R+6yW6z/Op/J
	4uXlHmaLtln8Fv/37GC3WH3uCotFy/4pLA6CHrMaetk83rx8yeJxuOMLu8fOWXfZPTat6mTz
	2Lyk3qNl7TEmj/f7rrJ59G1Zxehxqfk6u8fnTXIB3FF6NkX5pSWpChn5xSW2StGGFkZ6hpYW
	ekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GS+/trAVHOGqOHnnLGMD436OLkZODgkBE4m/
	7/4xdjFycQgJLGWU2L7sKRNEQkbiWvdLFghbWOLPtS42iKJXjBLfr99hA0mwCRhJPFg+nxXE
	FhHYzyTx+mwRSBGzwERGiZtz7zOCJIQFrCWWznkHNJWDg0VAVeLtjSSQMK+AvcTKv9+gFshL
	7D94lhnE5hRwkJi9q5UdxBYCqjnauocdol5Q4uTMJ2D1zED1zVtnM09gFJiFJDULSWoBI9Mq
	RpHU0uLc9NxiQ73ixNzi0rx0veT83E2MwIjdduzn5h2M81591DvEyMTBeIhRgoNZSYT3Q4Fy
	uhBvSmJlVWpRfnxRaU5q8SFGU6CzJzJLiSbnA1NGXkm8oZmBqaGJmaWBqaWZsZI4r9vl82lC
	AumJJanZqakFqUUwfUwcnFINTOX1f1rPtgldebKyJ2g+d9jfxqMZ1ietQucKXmVoYak+YLto
	enKSgl/ZtCMa2xfUMDIYqPa95f6fvdDavGyq4p33Hcp3P/a3d3x94iLBsG2Zs8bJ+FlhQYs3
	qOXarHJ08TvNfrGEaZKqQ+9THcU8vo5+jxrXsviT3foe3HFGPw0aPX4dy5ZWUFieqfhJknd5
	hWrHwjpmbmfbA8niTyXzVnxhtbxzX8f2vdizVTfEXbqcl/v75iYeyGl6/UJKdfPWbR8maRgv
	qci68nnV4te3GBqPc/LzcCXHSiw/J3hzmTjXf7uAnOzF0ipvPTP/ZonMNOn5nlja4+T7yLTt
	rrrO7jmeQslqm9vP9fbbmCqxFGckGmoxFxUnAgBI2BACYQMAAA==
X-CMS-MailID: 20241031204736eucas1p119124263356d8e5924b03f07a5638b42
X-Msg-Generator: CA
X-RootMTR: 20241031204736eucas1p119124263356d8e5924b03f07a5638b42
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241031204736eucas1p119124263356d8e5924b03f07a5638b42
References: <20241031204723.1149912-1-m.wilczynski@samsung.com>
	<CGME20241031204736eucas1p119124263356d8e5924b03f07a5638b42@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_134741_120276_93588CC5 
X-CRM114-Status: UNSURE (   9.29  )
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

Add mailbox device tree node. This work is based on the vendor kernel [1].

Link: https://github.com/revyos/thead-kernel.git [1]

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 6992060e6a54..89de5634d3d3 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -520,6 +520,22 @@ timer7: timer@ffffc3303c {
 			status = "disabled";
 		};
 
+		mbox_910t: mailbox@ffffc38000 {
+			compatible = "thead,th1520-mbox";
+			reg = <0xff 0xffc38000 0x0 0x6000>,
+			      <0xff 0xffc40000 0x0 0x6000>,
+			      <0xff 0xffc4c000 0x0 0x2000>,
+			      <0xff 0xffc54000 0x0 0x2000>;
+			reg-names = "local", "remote-icu0", "remote-icu1", "remote-icu2";
+			clocks = <&clk CLK_MBOX0>, <&clk CLK_MBOX1>, <&clk CLK_MBOX2>,
+				 <&clk CLK_MBOX3>;
+			clock-names = "clk-local", "clk-remote-icu0", "clk-remote-icu1",
+				      "clk-remote-icu2";
+			interrupt-parent = <&plic>;
+			interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <1>;
+		};
+
 		ao_gpio0: gpio@fffff41000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xfff41000 0x0 0x1000>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
