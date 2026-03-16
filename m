Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A880FF46456
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 12:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Zy0xfFYONrGtwit2ldjuV59lTv4yUHvsmnn0ELOTmE=; b=VZVsjCRfb0uFsN
	/TOHyUJVCbFETW+F1aNFTxJ184GJz9inuxKYzTTjeWwHuPDnUqZKqW3ANIQfQGKdcWCycmjHaPymP
	Gb92wEDaPzfgKTioYiYwMNYmgvg1nqGtRJqp2sf9+fk9qBcllYbKbHdNXszV1rYZe3HTNxTbyVE0R
	QeOZFZhFYjhxCoCFRyT52GVlXFWsCJTeSwxsfTn4Fi4He346uUyFdzdpL72jBkB41mJn0cmRvjVbM
	++1mGdcEvDljXt7dZwJzQIMGE8Rco0JLqJbY1L8SexLkLZkzrUbwv6pwDWheuTbGT39AN1xXpZ5at
	ilKyhZKHB6mSwKsSJjqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26hn-00000003srt-0A4N;
	Mon, 16 Mar 2026 12:05:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26hg-00000003shy-0vfy
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 12:05:49 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBQbq7538857
	for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 12:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7uFBMrySSyg762knrQZ8WDLYNBJTFUwiXUIQ+8VU9Pg=; b=pWohj5OkCVNuv7KM
	pcX5zRTmSz08iVsJofRQs6bshQLQOoRtpVo4lt8OkgAS5ytGeomQdtnbgsPIiIjE
	ebJrpv4eUbRhpGq0/3EUn8YCcQ91EVjqhf7ZTrl90Qalv8kApiAh4odcD3x57ZHJ
	Mjq31SyWQ8X1hOGqhwS4sO/S6myNJlE+8H+s7cmrd6r90P9WAQDG1+e9UJsJtWVI
	ktUPr8OwQB25pm0mwGJWu/tWEvISYqHcd4OCSLRPbJd455OKBtz/7JzyJQ69+iSo
	qKmqtxT7zahYK/zpcr4qYMp4NuYoYpLDeUGACcMr5TDyf/wFuXDao1hUUuj10fCy
	rD5kJw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyy5nkqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 12:05:47 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89c56300e64so47123446d6.3
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 05:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773662747; x=1774267547; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7uFBMrySSyg762knrQZ8WDLYNBJTFUwiXUIQ+8VU9Pg=;
        b=ZWvvJ6SWxM+kRaozBKplboWOH6lrxjhENli41r+U1dbP1879majV3VZZ8MBWQSsgoK
         stsWeo8Kw0Gg7H5mMVSG4A14hhOrQaXOJRyh+1ezzbVq9tGpjh5BTfm9HsvNcdv8pM9v
         hfUF6AatMnSFvxVcxWvo1ewJGzi0+cN3p86CUA4QepcHFToHPU906/jScHdZgK1iHxdQ
         DCf28PyUuiCo96imxmfzxGl+LCONOHV+vSAkB0O+jWgBTnWkTJki/RdMJuCbl+fGrImU
         2e6bxmE6PMYB08QLDeoqJ30QGZdWqQtM1hP8pNTUwxlbipvXnDpEAcTVTxRG/hVbpiHf
         USlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773662747; x=1774267547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7uFBMrySSyg762knrQZ8WDLYNBJTFUwiXUIQ+8VU9Pg=;
        b=XrSFCTUOsK6vzXZoM8eHNmWaPpS7SdUCbwmwjcOApWMvUO00vZaAC0F7L8aSYCjsU/
         NuixW/hmLQ64xAwb3V2TV9zMDpxDpz1vVC0KVoOR0F+v/imbhMn5j+tsgcSURCbdFRsG
         zlMD7zZs9wlv4z5xDwT7okGER7fPpf6JhlwROAkqdI8RF53+S1WbAxmgIrJmANPAz8rB
         VfFKyC7QKpG+u0/jElhTYGoGIaVzWRJ/MgdtR4Pvkk+313frJsaNKjIv7zM0FhLCYrhz
         Ppc6uHfcEKRlzrzAZqXY07gl3+zrKoiLG+4fBcPzn/tmz4uWs0Ph5KP7qXs0fboPtTdx
         v5Xw==
X-Forwarded-Encrypted: i=1; AJvYcCX/LsPXfzGBqKYmae4uiWupA0qMhgBX6NIQDyDtHi9znqGkQrU3LzEBsjskR6/KyFiG4nstl3sQEGgHEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzU8JBaesvm9k1tGnqSTdF8q3V6jOkyLXRiYtmwJvzrB9hgmP0p
	eEWN5IgYG51W+znMnBwQ758cTjpwWAS7PdarANqmlUdhTS1r3kgkteiqTfHoKHjbcfxNKiMN7ZP
	v8FA5vFl5AwepEB+yvoLiiqeIxCgWfonwbXp2bk0V9hT6HSU4L1h3GHjs1/iKYpSH/joFFrs=
X-Gm-Gg: ATEYQzzSvjICHJebTSR48LrW5Y6BkgfT75+i/F+05cpFe4k8fRxgQOE+wAdo/kUNs7C
	02cvoef6EO/EiTJKDYTJttGPIaS/sY+VsnprH20hxJ89OrokrlU2JN3Mz60MTwTVdxIaH8yy4lw
	Gos7t05/WSY42Mx/SRfhkehDY4nXAMRsAUgVhY3mhLOZG/GnQqh1HnW+USehJMryRa6ouUm+EVx
	GjU2iE1vf1vbAI3hiCBrRNZeEiXN7LDtrdPfrlpamf9pyrKFwSLOLMPf0gLNU5nP4LT9pjE+Tep
	DqjeheuXzT48iF2DzPWQCxEw8uEKZqiWNQwXHro3JK2Iof8A5XqLzJRyt+P+oYs7aBvBApFnVGN
	8MdZsDLnPFgwZiP23Jgqrf72vONg/Od1L1whL1J9ch9rg75Y2mq0=
X-Received: by 2002:a05:620a:40ca:b0:8c6:abc5:f169 with SMTP id af79cd13be357-8cdb5ba0d89mr1602663985a.73.1773662746745;
        Mon, 16 Mar 2026 05:05:46 -0700 (PDT)
X-Received: by 2002:a05:620a:40ca:b0:8c6:abc5:f169 with SMTP id af79cd13be357-8cdb5ba0d89mr1602654885a.73.1773662746194;
        Mon, 16 Mar 2026 05:05:46 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:45fe:3ba6:f90:d951])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2273d9sm46468513f8f.34.2026.03.16.05.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 05:05:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 13:05:09 +0100
Subject: [PATCH net-next v9 4/6] net: stmmac: qcom-ethqos: split power
 management fields into a separate structure
MIME-Version: 1.0
Message-Id: <20260316-qcom-sa8255p-emac-v9-4-c58934e76ff2@oss.qualcomm.com>
References: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com>
In-Reply-To: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3509;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hJGGsrAtahyuAplrTDgGRPmhh8bkkO/cgS9bRedR9Qk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt/IH7+UzksxcBqpQnoVfm94yesTehZL6KZa/o
 zJAXvOazA6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfyBwAKCRAFnS7L/zaE
 w0DvD/4kVc12bfMNOItY55yvgMugKA5cgssCjAAELIhilzqsOtLF+QTcauo3L1I4XkAxCeu8HnT
 YLVxoD5YyVO1KrDNdPN/7uMPGxXLeHm4YFHm56SH134R5E35bQmIJQphjvYQ4rPyafNHeIocA+M
 gTNt5zmtV9Lgg+dKckIxkmpgzdM5u7IeAONHtRFKLUK96ZdEJeqqx4qUq0x0RNMayO5tg4B/tyb
 qPozJZ0U0fzmcKSUV+vaNUgjWVw87V+bRr1UmREmSNLBjUxehepEZr8meRGeGbL2lZPcyovttRK
 YPgjYDgYAs1nqUbvw3SEW4h9pYidZpJR5x+rNeLZLJ4hkd5ranw/yW4/aHyJKNfYzS+NnXkR2nj
 AMUO0C/1KBeZ5/9Ij0f7zR5jVSCA0142W2M6reVXXATjqjnmfwYrplfZHqkhQ31cGReOb+/+rhH
 2SO/4iApf3mkTtyd9q/vNkisn3oyvw7aonZ0zIrVOYSeo+EiCPPC3cFe6biaAl6QQwWSVOR1Q4h
 fTlX8TjeiplK96fSAqsISmDmbgtxtfjj+4ZG2Fa5cloAnl6uW3rT/AXDzEvU9rxosWdvI/R7QWz
 O1Y5TdzAK9dlH/v3NPiseZjs31VVohvZU4FQdkq8oPp5+SUaFvTBjgLGoCfbdY3eNpCl0O4aayy
 Y7sbsvP+AHLWnMA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: Ooc7kef31rb-6lLByXZThR0TfHQfKV7Z
X-Authority-Analysis: v=2.4 cv=QOxlhwLL c=1 sm=1 tr=0 ts=69b7f21b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=KCp3k1edx3YIq9yPN_4A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Ooc7kef31rb-6lLByXZThR0TfHQfKV7Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA5MiBTYWx0ZWRfXw6QRED7POilg
 HVILmOSX00AAjbmZPCcmj1GP/dy7V12QfQPU5/yGp68vlYi0dFV3yo1BcORQSej4UwhdkCbwk0c
 z/HFY/PUV1d2f0s9aCdPZyAhZ9Cm5vevaC6GJFCWs4WG40S6cAyP4zzw37LeMcfv4daQyTWhmB/
 HGLd0i5YJExVJqDu55AeoWutOZ+v667GUekb+093MTpHIzfZ+wWTurOzH8rKIs1Kyi6Wty5ZVDL
 HiMCw9RlLKdfxyNm4FdlkqJv38wo0lScVRxIXJ6jbr7s86nnOGE1p11zp2rpGbKarqC0NyHuSS7
 +uGGPr79lIdHkJqVLICZqcl4pB32zMF19GgqQ8d9SxhKe22cU8+UQEVlkj8dqyobhYaIlQ8Bbjl
 i8shaikcc7waIWwzvp30hTB2W0qquCsafV5hz199yETleKF9ICGjsEXCivckd3Qf9FO+JySEtGq
 8sAP3WrbY8Wuvs7GouA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_050548_331129_D523BCAA 
X-CRM114-Status: GOOD (  16.81  )
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

Now that we have a separate wrapper for device match data, let's extend
this structure with a pointer to the structure containing fields related
to power-management only. This is done because a device may have the
same device settings but different power management mode (e.g.: firmware
vs manual).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 8fda6c128117d7f5b1dece68c919f2a09a511210..cbfae18773c1193cd640f07824f5a66d68f9634b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -92,13 +92,17 @@ struct ethqos_emac_driver_data {
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
 	u8 dma_addr_width;
-	const char *link_clk_name;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_pm_data {
+	const char *link_clk_name;
+};
+
 struct ethqos_emac_match_data {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 };
 
 struct qcom_ethqos {
@@ -301,7 +305,6 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.num_rgmii_por = ARRAY_SIZE(emac_v4_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.link_clk_name = "phyaux",
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
 	.dwmac4_addrs = {
@@ -322,8 +325,13 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_pm_data emac_sa8775p_pm_data = {
+	.link_clk_name = "phyaux",
+};
+
 static const struct ethqos_emac_match_data emac_sa8775p_data = {
 	.drv_data = &emac_v4_0_0_data,
+	.pm_data = &emac_sa8775p_pm_data,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -749,11 +757,13 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
 	struct qcom_ethqos *ethqos;
+	const char *clk_name;
 	int ret, i;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -800,13 +810,16 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	data = device_get_match_data(dev);
 	drv_data = data->drv_data;
+	pm_data = data->pm_data;
+	clk_name = pm_data && pm_data->link_clk_name ? pm_data->link_clk_name : "rgmii";
+
 	ethqos->rgmii_por = drv_data->rgmii_por;
 	ethqos->num_rgmii_por = drv_data->num_rgmii_por;
 	ethqos->rgmii_config_loopback_en = drv_data->rgmii_config_loopback_en;
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
+	ethqos->link_clk = devm_clk_get(dev, clk_name);
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
