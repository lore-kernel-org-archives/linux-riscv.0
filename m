Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C7A1125857
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 17:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zWXW0dMuGiAOUdQHI9y8Fr9gr4ad4BJNe+Gftqgc470=; b=t2e46L+ykpKmYE
	Jjbrb2PG+yZwhTT8LN4C9JJdUfcIQoTpdokJ3Yph10vfl/QW8fLsBZJ/uEbEVq60gTkv5A5RFNbMR
	2i1U7vbTYMG4Jz9Xxo+R/GMlxwegaktQQcWojx+OwwEZyWwNSoaQvQRIRNbS/KTvgGrsxUbU6+MPQ
	cLBrE4PLVnMpS4b/MhBVgmiauBgqg/P6bKdXmVt16Kiib4DKiDUopo4SE3pS7S2s94/+WWzb9Db4N
	a0C3z4bdNGHYuFXIFf/a3K3sogWUZHQw5xqQFEigbxRlXQGMfuS4lgaMoaop9VSs5czmXP5/+46TX
	zCPp7ogQFa7PjZKqCq2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Myg-0000000BxyE-0Lpv;
	Wed, 11 Mar 2026 17:04:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Myc-0000000Bxu5-2o1N
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 17:04:07 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BAvEON2622228
	for <linux-riscv@lists.infradead.org>; Wed, 11 Mar 2026 17:04:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gdxx6+E9Nzo1SIEzhKmedbjW3ho5UzPgZIwDTMk23Hk=; b=bv83wDQy2b/EsaRU
	eJyfDUe27dHZSKDxXetxfX6xMwAnt4QbesB4mvz+7iHrdwV1rvKptFYh6B1krTjR
	ICyvXoN67ke/klwfb1MvrYNu6wLFzqLBF4Cc74CqjSdJf8TNVUwc4A76ywj0JFj6
	fD1eXV9P42pNfMu9GoKWgcnjfkMXw61dpW8ggeyyMJ5FSJF5mXTRQmXS6iggjwiI
	DwS1jKyz2hHSGa/xLJqyW3/WQxBXvW7hgdGZxpl1qvXByMxQOO+/wew+3VtWM+C3
	t5dvguiGQLTrmYnth6uLCo1Vs/ynkR6dpc36U4b36pMRUl11mwog7Ee1chminHMz
	KFriPA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu73h1cj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 11 Mar 2026 17:04:06 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-948357563a1so52769241.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Mar 2026 10:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773248645; x=1773853445; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gdxx6+E9Nzo1SIEzhKmedbjW3ho5UzPgZIwDTMk23Hk=;
        b=LBI5HOcL0vpUCZVVS4HYpulTRGAOyrwGBxBcv3FKtxCieOcJWngiASfEXJ5QFxA3cX
         v2hxcKPx75mDvgTAA6If5e7prbYadElvtEQtL9avRj5VCBgkbAPTPSZ9L0UuymhRqlQm
         djun+s3Tzrm1jN68rLYSiJVmDSrqot32UU+ntxTie44J7Uus66e2CzIbf7+3P87l7cND
         WOb1K/Fk/6q7vGeFkKR/x7iqvEVi1QBBn/DPsF7IvuWdGu7XzIvxDUn4xiY80KVwlxbV
         XH93Vmfaui8TTCpE6t5I4dui/Irb+8b7i+tD6ySm73XpjCnyH9WMh4jXNx56eR3npTv9
         nvdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773248645; x=1773853445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gdxx6+E9Nzo1SIEzhKmedbjW3ho5UzPgZIwDTMk23Hk=;
        b=Txpnigj0zx/MPvQzW4wu+J2XS0HD/b9g7sKqn66BZpSO1FbGVW+QUbDCCxe1NWk7Zv
         azkt6dItP7UF5qmrPTRaBCI7IEoIvHmDZjTk4j1LwgCLOfgV09UO19Dhtyrjws+LJaWt
         Z/jo1CoOeaxjofFD/Q60rjBzvtpY3MEvHoN3qEz701nmj99RARNsOwjxTd7uMpq9Wi1w
         Oj8CaURk55hpqrPvdOjL9Rmc2kttK0me5IDvF+BpICW/PrROMyX71lHS42XOszSrRKAW
         0U8K3dreSJ7+U3WfMer/95TtsdnJOZtfSPZRHf78OPJS+6kjf8GI1h/04jq0inEROG2x
         o6Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXynz6hAq3aB6rAw72dm5kP1BtRjY1PgYY/qx1Z7JoFb5hxkLHE1NkbJKX1E/CvhibaBIN8Aqyev5tIpA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxmXwIH3cEv1eQmX2ReOuG8xMDIrKEZKaGdt7YjabN6iyJ33w/r
	dI4Fm4XrliWdleqw3269GrflGiF9/62wvz/sv6OR24dQI30UtAZbjnAoZ9n9baY00CKqwGI9ug5
	KGICDk0uS0aTueCzYStqhvH4FOODFVgeWlSugtUPYsXWYmB1KORIh0qWge/3g0GGCxHcSKZs=
X-Gm-Gg: ATEYQzy8n+d5LgxOYy6eB0SzrN9Bje8yhPwUPFWZBvlaT/lHSB2tIUXVr2pKsr78c9U
	owHwBvbK2Hedu3QWIFhE/Dsfs9R06PltCnD1kYMAPWcVFzOuPqVHUZmtyIrLKQQuTe6EuFUmSLt
	GnOutlI7ikImRkkpZwSZDQ/uwN6iuTeuXflb0x/tjIaHMx3WvrPnQ3Sk1xCDKhA2vJAqCC30wbb
	2WD+HHwOH8/T1uXWqHVFoLmjip5C4VwD8TSUzCok1BUXO3+24XSyFTHOD7d5RxYJdYHCM3dxUuS
	Wk8bA4Tsf7w1bGEwclR9b+G9f0bkoBgWanEAacmoJ0rvnmMFUTnqqprmDkiYFksMb80HX3wSUez
	tGLDRmJ7lWoq8zMaXmlowbzKw3lC0IJoj2RUDTyGtsTjYBv9FRuD1
X-Received: by 2002:a05:6102:cc6:b0:5ff:cb2c:a013 with SMTP id ada2fe7eead31-601def2ae84mr1132896137.29.1773248645239;
        Wed, 11 Mar 2026 10:04:05 -0700 (PDT)
X-Received: by 2002:a05:6102:cc6:b0:5ff:cb2c:a013 with SMTP id ada2fe7eead31-601def2ae84mr1132877137.29.1773248644707;
        Wed, 11 Mar 2026 10:04:04 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3a92:6740:d71b:5056])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ad1e4esm167993075e9.8.2026.03.11.10.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 10:04:03 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 18:03:37 +0100
Subject: [PATCH net-next v8 2/6] net: stmmac: qcom-ethqos: use generic
 device properties
MIME-Version: 1.0
Message-Id: <20260311-qcom-sa8255p-emac-v8-2-58227bcf1018@oss.qualcomm.com>
References: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com>
In-Reply-To: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com>
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
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Radu Rendec <rrendec@redhat.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3058;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=N+dHjWXfvXJHTEYUAiwtkC+XoS225MOcRMNA92C/Jpw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsaB0v3Sl4/sp56iDGfrn63MUk6MjZIiJTzfXf
 w26BYwssyCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabGgdAAKCRAFnS7L/zaE
 w7sdEACZsFXM7p//CfitX5UqpB/btkY4zsW5EXkhS9yfGCgabSgfoTX9DsKhv6sX1pJTctxW2Jj
 WdJ4s1IX9/7vW+acevWWapCmtarWxZ+FS9/DUks7wrNii8FysLTpAIkKe0yb5Vqb4aazorFJepZ
 QMklj/TPR9rnPTjYCcYpO3JXPhxHVcWSGGj1T008VYY+H1g7HC3FLiYH6OztIN8m28UXC2wXXjm
 jjH4O2G4j9lQU6G0SgnnRbMSc5bzei51WxJdkBgnWXq6cFPr/qoGF+qKHbhvXfX8uR1zt6xjh7E
 rK3dnLYpwERUGOXR3HeSSv94sEOlLLtSb4ASnlh5jiCiXX/7RsM6KJkqmVNBo9jNfKUBNTFEc2E
 Rk5QW+Q6QSiC8UUdHRgwzNOArdNWh7pg26eWfgQ/vMR8QPG57IiUS6TCQS79ajOAwN2OR3aEsAy
 4xwbeUPCe6I7NV3ncRMyuLsaW9Jx02+kDJTSurrKERfV9cqSnWxe8/3veaJ6cZIoqd/BwOgrRyp
 bPAoDz1Bk3cC3oqL5IKaxnXwFO/vosOgfVJsMn49Mio14B/mDN3if30VdgPxYKQzrF26XeCHPTe
 StSJ5KHRTqpETm5niQmB6XFjjOYPG1MCZFbE57IaXGvRChr4mErCe6uLSs6x3CR+iLYfB2jRfnB
 5p7afV75hsIVjkA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: xKQj8RHyWH7FBxX6YvqyFge5HoZ3tz5j
X-Authority-Analysis: v=2.4 cv=T7uBjvKQ c=1 sm=1 tr=0 ts=69b1a086 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=AGkLNbZTeN-MX8W9OO4A:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: xKQj8RHyWH7FBxX6YvqyFge5HoZ3tz5j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE0NCBTYWx0ZWRfX+Yv2aOBFfaAm
 E1XdOtv++3oo7aKpE4EedW3IWbhW9ahbyQozter8Pqrai/toB4JcfRLqy1IxT/pCijHDjYG9xf9
 /a5qiI/bMs3rrOvXF5K7N1fEJvJOzQh4j4DTGSN/OK8en7NRIEnvzuX6ShPNqtMUqhoacJMNeKI
 X5tqldccwTfQxMVR6qcvJqnyNVZq0njVZ2Qu3ahxZVLufMKSp2IUj4zU25cJCRoljqR0GGsISHK
 jMwuog1O92HSLkLmX9BaWgkKWBS6M94YfgMlR+u9PV0rPmOl2Pc0x3e7v/K7pCuQFzk5uu4B2fv
 LzAjiPSQ1MFMgNfxjL7BsJAGK3hGn1ojV5Lq2g3k9+AJPH2Qkn+igH1DIWwJ8r+uapls/m8isZX
 ogJ/boumgWopf73AE0KqimYFSj+7beOqyiethxDGY0o0q9+POvF2WVoSzAo2xqmQ7b7alqZsbCM
 z33eUjzUYdsWpJnB+FA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_100406_774042_3D2D2A51 
X-CRM114-Status: GOOD (  16.58  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to drop the dependency on CONFIG_OF, convert all device property
getters from OF-specific to generic device properties and stop pulling
in any linux/of.h symbols.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig             | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 07088d03dbab5bd1abf66e9460613b839c1d565e..e2af4fdd654340d618477ed87d3889dbb9aab456 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -135,7 +135,7 @@ config DWMAC_MESON
 config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
-	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  Support for the Qualcomm ETHQOS core.
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index cb1c074c205307bca556192584fb0a4a10eecd47..fb4ffd0d5360d091bf0192740b8a4a8d2c66e09e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2018-19, Linaro Limited
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
 #include <linux/phy.h>
@@ -728,7 +728,6 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	const struct ethqos_emac_driver_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
@@ -778,7 +777,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
 				     "Failed to map rgmii resource\n");
 
-	data = of_device_get_match_data(dev);
+	data = device_get_match_data(dev);
 	ethqos->rgmii_por = data->rgmii_por;
 	ethqos->num_rgmii_por = data->num_rgmii_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
@@ -818,9 +817,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = 1;
-	if (of_property_read_bool(np, "snps,tso"))
+	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
-	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
+	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
 	if (data->dma_addr_width)
 		plat_dat->host_dma_width = data->dma_addr_width;

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
