Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B48C9830E
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 15:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lsTuMcMeJMrobrwDSM5+iSJJb4s6HHUmgr6DgXiXdwQ=; b=FWlN21lfvOYngV
	JObt7ftesVExS6h1Px1lnMLcvmYbBfTDIjmFu44ADAeksOzwqSx1MBSkM1uuIA7JMXePqVlOXwvfz
	BysLWOss16X/cfANt61IVl8AVttzTsQr9Erm+mu6saOrt/c79npIOxBoKH168IkBq/mpuE1kJst6g
	YkST++fbt8A+ebaxV14A4wTGRrtDF2bUqsGAt6onknzacOs+ke59U5LqP0+kGpB33WCDzMkent5Nl
	VhYIQ8iUOaU/6g98mSxl04a1nNqaljWv5KxEC4H3p58HpFo6qatDGCbPZ50R/pLHgFOOcMCzEOXe+
	8AbVAdumTq2Iu58tRJsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ogg-00000008eJm-144e;
	Wed, 23 Sep 2026 15:15:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ogb-00000008eHS-3NHL
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 15:15:08 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBba0X3295729
	for <linux-riscv@lists.infradead.org>; Wed, 23 Sep 2026 15:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=; b=g/xKcA8i+/NobfHf
	BWhEYPeXdGSHGYYpPDDeFyNv9rVep+nPuQ4CckyrbRT/aTG0JaXqJY78C1J67l7Z
	sruuwjsIeJityex8fyb/0uLQjjn1rk/EyVF2EUQwMHXnxbV9aK3wSHKQfaMn7PlP
	l6lGZC973H7vyl/V17/Tkj3HSS81jkf4dwak9FvtV/s3raXj9cIvVCmZs3DfNIYA
	2LuWTNltF2erkMJ6Y4c2T13iQwnd+m5Xwkb43l0l+/tz5kb8NPYXBho0wEu9+GA6
	dxtSfMD2ZhbMz4KATPI8PrVPNqCLi2n2Vut1lv99OldheOvVeIsiTkpqQWXDU3wt
	8B1pqQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwm9gxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 23 Sep 2026 15:15:05 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c82c2e9761so478601e0c.0
        for <linux-riscv@lists.infradead.org>; Wed, 23 Sep 2026 08:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790176504; x=1790781304; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
        b=kLroHPxqXP2PJGIgZnIAE/M2Isvoxemr54QpzrN0RwL9qJfc+i9gy/WKqg/DS5LrET
         skF9p1G5XcWZzLunPaBZiCSrOr/wN5GhuAaN9Sy1alP/vO9n6GmGdRYSu5kwXHBL6X+m
         BnQJuBTN+cxF9kIdWKl/ioMows5qRg7rbJcr3SXUB0uQkTk3Z5WxAggmW31f3vrG2oek
         buw4+0Eoq2ds1Re5NJiGTaMLncQF72aDlXzf5FHFZgQAF6tYTGDEtDtHWaP+U8TJ2sT+
         yfVNuKLg4o37Rojegu7SMl8MGrhsqLpyEGJXrugw2ta3xGzqQAiX4CEuH5S00BlKBQmI
         S7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176504; x=1790781304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
        b=Sb0AAlUbcknaXYf2U8Dg7dYhpF4lpCgzniNpwrnl7/3ow0b0Sr4BIOWUSHjiv2v2uA
         lduuVW4BLlh6kZRZeHJBbeJOyIZMoALErNaogFLFNofUFSgnod48mRBDnvWoP0dyokH2
         M3Kc0R2vYR49N36szUcmWSdmIiMu4I5Pjfz9q/QyQm+CnlxBsqqWXoUOJ9CE7H09ghU6
         dMFxgqjeAVptXUXstxVqxvIBEtpp0e8nNHUfCEEgdRtQ3LQY1sJvjDJOrmTHGeBVGOco
         2zTLZU8eFD+0sUBysDmTQomg+5H8fIoXJmLjwXtZ0pKJZ/888IJHA2bYnEqK8YAZlGgt
         bIMw==
X-Forwarded-Encrypted: i=1; AKwUvBxOffCWsPpyWn4Vu5klgOb4yAYPKcpke7rp/fo3VZ3pOqjoD7t9ns9Abq0T22kPhti368VRUGUXOzlgrg==@lists.infradead.org
X-Gm-Message-State: AFuF++lYGAlUTavw+icEvg+CIKHC3lB8WfrrdEgTA3oKtrxCpXfGxtde
	GUMjAZtWxNyTMHPkElMJxzfzkcvq6V9skvr3YjyItnqA7mtnCf7+26H+skbWF5zVBJ5UxlRQjRE
	705YWU3aCZBXH4drGqm3AQVYKPLfldD1nuXv/JNb5eTGbZjWEQ+LK+rWAvc4qLLpA2ErVb7w=
X-Gm-Gg: AYBFou00GGP30Cn6y6eLv9Wa+fie6jsszovnI9/rpEEajyCYp8CubSLTGBCSf55ylWq
	JlsQ+EVqnGMzYhQIBeNEHr8DT8ma6KFaP3jkfPuxIhftC41dCgHK7tNsh9XCW0c0i/eHYaRhXt4
	tLz4UOLCAmsQDLmRHBo9kH6XzGwxumiCdWZtYFEwP1hbdWhAuCQbi/9MCcxLWgr/YbXA6xNTupZ
	b74CfU98LSe/+N6qqUERl4+dIR9WaJhhSaS//1I0ytnKjCvWMVfjEVq7x/5CEFpwlUuOCqNGc9k
	xHpE8qflZgg504x5bZV846wgOBrl7RBQLQ72pF1JwZxQi+9Csc4EmbJ16UB6fbawXRc4LefdrNm
	9oU5TCPZfDn9L/nMWFUfOv5NaFAPO
X-Received: by 2002:a05:6122:21a5:b0:5c9:a617:5814 with SMTP id 71dfb90a1353d-5c9f1676503mr3187467e0c.17.1790176504278;
        Wed, 23 Sep 2026 08:15:04 -0700 (PDT)
X-Received: by 2002:a05:6122:21a5:b0:5c9:a617:5814 with SMTP id 71dfb90a1353d-5c9f1676503mr3187414e0c.17.1790176503766;
        Wed, 23 Sep 2026 08:15:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:34c6:dbd6:5b58:a3fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c4054fsm55126325e9.3.2026.09.23.08.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:15:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 17:14:36 +0200
Subject: [PATCH net-next v15 2/9] dt-bindings: phy: document the serdes PHY
 on sa8255p
MIME-Version: 1.0
Message-Id: <20260923-qcom-sa8255p-emac-v15-2-e82f33720737@oss.qualcomm.com>
References: <20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com>
In-Reply-To: <20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqs+zk0lgESfJu4hyoxLhEt1pboqFY9LRHQZuEw
 q0ROLyv5jiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarPs5AAKCRAFnS7L/zaE
 wz4FD/4ml974ygSP/1dV7u+o15KeVGW38T1ko1qMY6cajeU7hdx6Qr106v7TNItQOExCcFYuhLI
 MMmwMRi3EjGvQgzSOiVgdoqzyt3LLFe5dVcneqhHMGt4o7RcuIwfLnvDqWtyZrZ4zHh3MS6Z95G
 RCuYcBIg9YUrkT92SYOHFyJlK/CBwKrmWWztnZ1KGv5wpDpa1iBxAj1m9B4phfGRCuBBmeEsC1U
 9fpj5D5lAiB+7uWInhm7xVA3QB+t/Pv9kt5mySVyLL/PgiPdZgMqoi/EvoKawbQORzi8lNS70AZ
 NqCrUEZiOrl5e/yRzUIEb17PYM8HJTvOksc0MyI4FOnXMSumjGdif3sY3lTs9JG2Dn7DfHJgtMS
 qLjs/KP4L6YwLyOVo8LY7DdyR7Q6lv8gx43JDteeKzQZ0z7uc2dUYWbMaRP73kP/kpIn6hu7Iup
 qWWrqOIitb29xK3xBPllY5waUZZqX1dlmv9+2DxfiGgfNDVgJuMH/c4nhBqHOplXDorkvfoUwjH
 vy9EvQ5KlHe2hO3Bz9gUxk4Nok5S4BBIpUE3XRU+sGlu6QUjpYqRRWur8AYhy1QaEWAtTTPWzhg
 FpPvfMJgXKlz6E35SUOkJYzI1aEdzFCWAL6cVs2kgdlgg8YPrK2AvV87CZYRP3M1eodmkx9Sl0/
 HTv1Ck05DDVfirw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MCBTYWx0ZWRfX/r/fYyQvy61P
 TgtzuIJ2bBhujjB97NACLdlwjDRQ+jOSTQzqFKMXK794Bb/R9FAANjR6Q/vKzB8KXXeQ/yFNYJT
 ZOl4zJeWmafTBGyqxMg5FBpQ2S6C/Cc=
X-Authority-Analysis: v=2.4 cv=R/6WitRX c=1 sm=1 tr=0 ts=6ab3ecf9 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=wENndLYK2PIMvs9AUu4A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: XJ2p9Sy-Nl-G29a928xyDN28NYtW0Ylv
X-Proofpoint-ORIG-GUID: XJ2p9Sy-Nl-G29a928xyDN28NYtW0Ylv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MCBTYWx0ZWRfXwYJc5jR55s/6
 Cg6tvLiCC4sASI3IMj8lIe3xLDbr8J8DwSKDdZJFISIl8F6buVqk+cwBppNeOsvjgRCLK2BbPxy
 2yTRBV+7bAx5ytb1dgUMohX1ZA5w0XY7iSBm1UT31Z0rg2Y63K8B4l+q19ZJidkYww6OKoZaZ0K
 cfFLZMMqChbxdUeX/0zqIxAaHXzFUJmo5zIFFiUXkDQUbPf7v7Gd0ZqyN3GO+ivpjM5oss6aVLe
 VvvKs3ubM7nyPEWzDJ3IDlOIBhAvlfePuzqaYRKqkevDsMKqZ/CjMQFYU93v/S5YNCisKZzc2QH
 fACbdyEU/vDUdpVtnoD1nPvueGRsiyvZwJRltBxo5ltERKo8qyBk20LwEzoeyX6MSypL1hvjjMM
 LzTTXtVRFSaN1RqHUAr8mxGf8vALWQnmdy4TjSO/QvEv2xt0QF62eo+dEIR56oe2b4V+bcQOel4
 cKZ8q4P0cnWU9qnqxeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_081506_657467_87A9812E 
X-CRM114-Status: GOOD (  13.96  )
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
