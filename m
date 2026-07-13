Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A02C44507
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 13:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lsTuMcMeJMrobrwDSM5+iSJJb4s6HHUmgr6DgXiXdwQ=; b=Y+zfkAUIZ2wsIM
	wAm+IMs3ewPbw/4ecB9GuaBBi3QOSF9ZtPZFHc7y1RMzBwceCSIc2/8/7ZMgfNNZwl9l/sqyWeFMP
	T7F7f11ep6aqjOMJ7iJzQ2FnYUq9JN/txZl3kApPFhLLBS35TFndmDIH3ILnIRZohPkvs6kGaeSve
	fOKVUx4+5FNQ2Uwg9ylZCXDVScujHkyJz3F7W4dZq6yXPO0qLgh+sMub/VIy/XCnl1aQ6o8yHzL3E
	47aFN6cbkKTSeu7xjhakgGHlq2DTVEEkYVlw7a0M+eqWrrKcz/duTll7f686AMg3zqJnq39wUhhU3
	Ky5/MpSk9oLmqTDW4djQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGb0-00000009MNv-1c7P;
	Mon, 13 Jul 2026 13:21:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGav-00000009MHB-2Yrp
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 13:21:15 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDWqS1299286
	for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2026 13:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=; b=EsujTW/5s6ffD24l
	1eoxY/es2Q4PYXqBPREh5gFAIQIh+AyKnTTwi0B03NRumuzZ8IsCdWOplAmbd1WB
	n0rWQg4U069GZ20+4HgUCReJ/2eZIaGLTtyuI4vc9xb3ul7axklIfkgrCqhCYjwL
	mX/tC7VfT/Q3ezydS4BNBpBFzArKK6isUkbVOaCI8xHN+DfenK5EOemjuFMhQCe1
	p2Ve+Z6JVU82plo0OIOn8s7pgrs0LDPv7knwBanBLyJFaG/X/MvM41tzBn1e070H
	RKxJXUd1KCTTxaJP9hxvH3IimYpL/8JKo0nZG1zbjt70aRU5sD6ay0xYNCDQb+i9
	q0gc0A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3gsts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2026 13:21:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f0f45415cfso51687836d6.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2026 06:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783948872; x=1784553672; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
        b=j7kSkZ4v1XKunb8E4kGnVxCRSrtz5+xwMniKmxpR0ZwcApI+qkwBAT9uWDlLWg4Leq
         tLYLEUABgJ7gXmmP4Af6FoC/mDLk3tsT3CVt/xMWW1tRNlK2EO5mXqpothKLt2mWAzIi
         Nvk4Ta/BAaQ/8twCYHXXDWJDv0T7fHea8byMgZQLUcaXR6OHD2UQ0QhIwQkkcFnhlNPT
         J0kPVsf8VoRWkdvnx40otLV5Gk+ul/3YDWFiRTP1xQNp7pbVYgc5THvx4hzQg0OlwdXU
         zIT5oAy0ei0bYqMqCE9CEzL0H3Tff8k7vHHLOhd1phYIZf8MWBco8JBhycOQOeXJwMB/
         2Vmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948872; x=1784553672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
        b=OJ4SAHJZoKKIsWrkj7mlJgPZjSm6UDkZykERNfawZt2qohp7+jEzAGFtAs1NKrVVc/
         35pdVhbqnzUymXv21O8uOJOqMVKMd2/igJo/4zaeHYntx94I7T7w7in8oIxd4l/PEjF1
         xHWy+/ZGhBcR3yvx3rHuYTjMB2riJEAK+/d0wRxKbRg6m74QrINeHkyCk7tMDk0Hah8p
         O4L51qKuX+5LovbkgkvmgmS35qThZigWbrYiac9rozvSdnjnhqoB1AYYrZUYStJ5B6Dv
         5E+dgSTvPSmD4x8tEWFpj1+AjOSAh6febJ+MABmkIpj4Jv/pMh5WKK+p0NEdwDiYbBBp
         Z4ZA==
X-Forwarded-Encrypted: i=1; AHgh+Rrrn2I9IQKMO4VP42GlOJGozLbFg4Jtv2be+/9lqYEtkrMDY1djO7/zKwi1WzGnl9LEbDL67FOGTrD6KA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/UtR2vNHUp4jesJk1GH2XF5CrH5MvFj6BwZjfnk7i6bqalBjl
	WPUeTW8924WoNFKhnolqwua43M36DDHD0DWMMWDtuBCS4JbR2LGxCftrCVE3hEub1rNiyIDi20E
	xsEzmLRfmioaUsvq6Yr73P7Pfh7osK38JG0IZytsK203bpp2cUNjgRe6FYCBKqDaxRA4x+/8=
X-Gm-Gg: AfdE7cl+80/q/2gG9mT2bR2xrY38xbFYRifQ+5tgWBxHi9PrkNUNZ4Qtn7B7AW9wUM8
	51QyObeXz6xDk+8Wg2Vusjy/J3J0OoiMK5goy6kr3qdtK27jYtIJxW8tbhmpqw6n0vXJKWahnnx
	QCHEjkXXTR/6x9kEuBajJ+8yI1l3AKLya709zDqw13mp9QaZ+S5R/EMhl5zT+kAfdjyVqodfCfW
	bAgXRygPVRCF1YagcMARSAYsG1j+hzoc1/yJOUA1NaiGgqyYl35vwAAuxVquBgBHNEHBH4oEwLT
	/FElvdjJJ1M78yJLOYzuu8Og8j56CKGKXxCL/dwqcbX02n+PgzvuZkZAGFIyZygOg9JrgZSsZV9
	OvH2eaG1UivWE2ZcOf+0jMx9zcYi34MBZrxMqRGmn
X-Received: by 2002:ac8:5787:0:b0:51c:2cd3:ae7e with SMTP id d75a77b69052e-51cbf31702fmr95588971cf.45.1783948872062;
        Mon, 13 Jul 2026 06:21:12 -0700 (PDT)
X-Received: by 2002:ac8:5787:0:b0:51c:2cd3:ae7e with SMTP id d75a77b69052e-51cbf31702fmr95588121cf.45.1783948871582;
        Mon, 13 Jul 2026 06:21:11 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm354561715e9.3.2026.07.13.06.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:21:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:20:31 +0200
Subject: [PATCH net-next v13 02/10] dt-bindings: phy: document the serdes
 PHY on sa8255p
MIME-Version: 1.0
Message-Id: <20260713-qcom-sa8255p-emac-v13-2-119f8699ef8e@oss.qualcomm.com>
References: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1956;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BfrbL1Fwh6l+Z6nIdrB6wR8juwiurOHR3kGeK2lY/yQ=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGpU5jSgupfQ73V66CmjTRYphxtOflEwg11wtoOBUjQcLl7/W
 4kCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJqVOY0AAoJEAWdLsv/NoTDpj0P/2pX
 O7c/RStPXEP6H+bYPdkp+JKPZsBfBDQechWWEdF9PaW8TIv9MlI3HIhWDhE8JzJiC7X3mUt6VaK
 dim6yfe4fNXqBfv1lZPKniq6DJG6AMmY0Ca5XkfbIHIUlxXFnhuIKyhUb2TYYYidXugrvV9QDeL
 wGkZG5kUj5SnYp42cVr2U08enrxUE3a4ej3c5nkc+IKY70iFoZaWSDY17iRsEFNOrCIMo5mMdsc
 XxQHM7+vHu02zCIHTKnX2We+LgxwhprMy+pvP9LADv1T4qNiGragMfDK20QhG4YORuygBn3PWYq
 ZFX2jUhtOY4/QsYxIujXT/8mM7KTenYEd+9HXqP3W8NZTL/unLcwz1ll3ocRw1j56tg9cFK05ku
 +V087fNBNe2xi07hTBeqjzfo94+CuGbSLYWGgIW1P39NJuv4VvwevNFW9jWlqjQPkVyI5xbk5vB
 3++GRxPJiKuLCKlFBCjsJk0Udyv0Cp7+9zVsC2ypoyMKpMvr6kVM7hhOp86eSrvQcTujRIANIeW
 3AIaIYWr+XIs17ovVnBqPd49JrvJrrQPXaTV2urBfkyBtBvgOeJ7wxmEFZlBbJQ6mAZN44FcZRU
 cPNwJKPwxL7ROUWKUvaFoJrqIEFe2gIiLW29czOE8cObK3yTkyxBar+2T5tx8q8CK23GPTqmC/a
 kdRil
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: rWC3n9qI6pZCcM1Mm0esx_L-yM-_VcDr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX85VbBzVlnhaa
 WrrtqGmNrs+uRzPHuiyN41Hxn3wBiamacwSZP8qMsZYB4iVpIfkGxoJbuk3NxsMKHORnWq5wDyP
 lfFEGmRSHTprK5aJbPmgxk2RFE50Aiw=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a54e649 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=wENndLYK2PIMvs9AUu4A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX/tTjSfPHLz+S
 TzVu3jXH30CZ6v24de7fJ6bt96mfX9QKcLqYoZjRVH1ABI1mtqDHKPVCf2wFik8RBJcPIDoOvsK
 jpewkFPMHRRV7YNpk0WkLao8pztoPmDkHUb+aUUZr94Lh2yOOxQVlhsN1L5O0W3U8e5lMfePYZG
 hg52GtH+5tlvmmBs+40rgQKwVyr0TK7dMS+nWzC4kKBXRVV4o1n3y81qvqAzwZdIQyj0FRJh0p0
 omxYX8tQIIZ04JgRerj8z1bhtCYyNL0BdLOtRH/5+ed2P4dsdFiVS4j8ibIMQRgDy/n2bncx033
 CI5fRY1RmLpyDjAhYsEo+FOV2dX1HSBFp8Wt/P9K/7TBS5xxXHouBDBuTsWSMYOl9oGkTvKxrlW
 I+L/Ey9Rtq1gInaBV3ad4/soOtPiPGfZvxUCEeDe60iXyuwOFV/Fq0StmRSdjN4YX6Cje4XbM/O
 vahIJMw9s3xKEhKl/nw==
X-Proofpoint-GUID: rWC3n9qI6pZCcM1Mm0esx_L-yM-_VcDr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_062113_662175_EDF0A5F0 
X-CRM114-Status: GOOD (  14.60  )
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

Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
This is essentially the same hardware as sa8775p rev3 but the PHY is
managed by firmware over SCMI.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..9e846e381555514bb32177f884abf0cf2c942948
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SerDes/SGMII ethernet PHY controller (firmware managed)
+
+maintainers:
+  - Bartosz Golaszewski <brgl@kernel.org>
+
+description:
+  The SerDes PHY sits between the MAC and the external PHY and provides
+  separate Rx Tx lines.
+
+properties:
+  compatible:
+    const: qcom,sa8255p-dwmac-sgmii-phy
+
+  reg:
+    items:
+      - description: serdes
+
+  power-domains:
+    maxItems: 1
+
+  power-domain-names:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@8901000 {
+        compatible = "qcom,sa8255p-dwmac-sgmii-phy";
+        reg = <0x08901000 0xe10>;
+        #phy-cells = <0>;
+        power-domains = <&scmi7_dvfs 0>;
+        power-domain-names = "serdes";
+    };

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
