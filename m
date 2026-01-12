Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8646DD277CF
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 10:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Fneoh5X8tE983TjbqAYkK9XdCiqHmt2tIgMIhnCwvU=; b=qOI/mjM+4IJ2R+
	y1gyl0+Iyldw+a/brYcfNcH6su+TH7qfZMnphWJMEeiqqhIzlbnBOzKYbXqMWieLrLYbkKCWYWTng
	B7p6IgzmvEfo0dASrN+Og3U4ZPkS3Pw8C5Ek9d2ZRVrR917jsdZSaKqOIshRk8/Vb8g/xSPeohEoV
	JksKIIoJt86jMjR/smgdXEAeysFKE5eJ7scE7ha12rfCMwtXm2UTp+pt64bQ4xobz7R4rBlGt3+Xl
	WefXhpTsuyugXa1HE0G0o3glmNN++ilNxjeE17rhc9eFwN9BQ5DZATg/QkzQLwY3uoF4P61vl/MPj
	a69OzjxIoKA0Z0pVLpzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEyW-000000058bZ-2Uqg;
	Mon, 12 Jan 2026 10:16:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEyT-000000058W3-07nC
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 10:16:38 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C8sISV676410
	for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 10:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mODp1PyMkvfkftyQeHDkUUzUFlJxBLADJcEEezWUjCo=; b=J82g/RNVm849cx9V
	dFFyzABcKBNY+CiRsaA33Ps0scP/CMuZcqyfPxphl8zZh4KXw1EheKUhOLCLSELn
	fr73shiZALVUODPnid3Oxwt20bVRnDipcOwY3xUOqSkvUNu3g2BnarfxP3A3wi3v
	1USjRt/sjkTVynSi0LajUP0Pi7KgNpgUfpZPsiu8IVr8izPHvhL4yqL30yYC/FPb
	kPD1zWQEkIndjwmO7W76Q5fk1wRfeMnGHPSim1uq8gOZfDxkSlt1LJpFzSRiuLyx
	0wxtvVRJ1w7IiFKQ8hnC4kB1R1fWLCa44+kcs3unZN8H3p2vRbyYNeoxSltMV34Z
	3rUmBQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmwur892w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 10:16:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c277fe676eso1888156385a.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 02:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768212995; x=1768817795; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mODp1PyMkvfkftyQeHDkUUzUFlJxBLADJcEEezWUjCo=;
        b=IVC/GUPTS+MA/6/TFjkSbC8KDgPRfDz6kW21i0cm+xh2thWVnExiuQ28NlsKG6SjoJ
         DHIbFDBZ77JSFmdPikhV3PjNlzVqcfmkc1Ln623XjNYRQ5Dhy3v6274p4+c3tD8HCRuy
         twVWd95CycpST/56E4dJ2nQf1Qk0M/agN6HISJAi2RoEa4g1lt5XvNnVqxh7pP5f2U6W
         IcvmrI5BMHO/Qoxy0AVQYr9esJA+OenC/xGeZ9++kQ53c5/AUcV+GfUmsu+K5aqHKVJS
         L9TAVXzCxFbr4Fl6yK83eawuHtHudjrr9U7x4IlunhkkYTMyT8N/xh7xmTlxnqr+Db7j
         +Wbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768212995; x=1768817795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mODp1PyMkvfkftyQeHDkUUzUFlJxBLADJcEEezWUjCo=;
        b=qnad9NvH16ZE6iO3eNttReOwnOR+c74DKbAycbEPYdOQBZ2gkoK1DgPSJ7ty28Lput
         UXK50D3L4CWQoKDjEa6odi3GKnhfowjQbHNfLde7BwGnKydgT3dN+VkUPv75pS9iyLKG
         7LTiIF3b17Lg7uoAUvZNoKX7013LTce3jgBje1gNqn7t/DgMUbljlUmGhvVSd43Yb2Jf
         ZAqEkNXQae+zetqJe+5OMKmEEdiSGj+9vvW6u70nEA+MmOtp4ym1qbAP/qcwPxGdftpE
         j3LY3w1mlrH9tQyO07qkPoQbrmtWyiSEP8TxKG5jgi4g13LIV92GxoHFs6wzVZJIroiH
         eSew==
X-Forwarded-Encrypted: i=1; AJvYcCUeGQfCZA4NW6wwpiLYp42ikNRn/Tbx6NY0pg9RFrFak9JEzkUJ5hokGGLUesMqX1lpz7FJGQ/dqNZkLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHprsJU1+b3BKOl14GiVUp+so4FJ9q/WsGFIeNOaRM7aoZ4+7F
	qrF8SjmaV5+ZM3YnSCFAd5xzqJ8TRoJ6yP65ncy1rQ3+5ZWDUE7JlQ8iGXXXZoh3E2LsIIGqPYl
	A1Df+brqZLFu9oQIQPntGGHiiErbvPOJkP98hqVb5CT6RSIz3CtEoZG9hL5rtiYZBUeQjUas=
X-Gm-Gg: AY/fxX7SEAiwOr+mdWoeRzk8n8SOlqrhtjEoHaV4q4BYIAQ4bufxxlpUKFFcBCcSc74
	SVUb4RvlEMsfvGnGlMAClOVMxpW8CVBDjyEms48QGeRPgHO7zQa0dIiCk4I/DRF3+AtKKj4Xovg
	E9no/sulsVcfmAw4/FropmdcUIElXjD6y6n81aDt5X4hzAgxPo23gs9GHzQoD/WONr0gFBSYlfx
	Pd09flpr/L1zdQGKDHZpN71GWgZo8Nq+aNw8TcqO8APwEogHC56hZZXm938c/gCD67flcngqqeu
	hKHarSN2R9ztDnn38RFFgAYkOMJZDV0925TiWVsGKZ2unhgRD0+2u1rlUl5sfx86vyp1x4uVpax
	8BNXodRD8qwLlGWv/Uu6trSlJffKqTquAptQIa7Tq
X-Received: by 2002:a05:620a:191b:b0:8b5:5a03:36b4 with SMTP id af79cd13be357-8c38942611amr2171261885a.71.1768212995563;
        Mon, 12 Jan 2026 02:16:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYulo3AW2dpzYmOgTmnb00p8XDyYkP6yaVRp/tr3YHxen6aKzZ4A66moQru8K3ffeDVCDlWg==
X-Received: by 2002:a05:620a:191b:b0:8b5:5a03:36b4 with SMTP id af79cd13be357-8c38942611amr2171257585a.71.1768212994897;
        Mon, 12 Jan 2026 02:16:34 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:eb74:bf66:83a8:4e98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d865f0cf2sm126530355e9.3.2026.01.12.02.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:16:34 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:15:44 +0100
Subject: [PATCH RESEND net-next v6 5/7] net: stmmac: qcom-ethqos: split
 power management context into a separate struct
MIME-Version: 1.0
Message-Id: <20260112-qcom-sa8255p-emac-v6-5-86a3d4b2ad83@oss.qualcomm.com>
References: <20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com>
In-Reply-To: <20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Matthew Gerlach <matthew.gerlach@altera.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Minda Chen <minda.chen@starfivetech.com>,
        Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
        Fu Wei <wefu@redhat.com>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Shuang Liang <liangshuang@eswincomputing.com>,
        Zhi Li <lizhi2@eswincomputing.com>,
        Shangjuan Wei <weishangjuan@eswincomputing.com>,
        "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
        Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
        Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>,
        Samin Guo <samin.guo@starfivetech.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Swathi K S <swathi.ks@samsung.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5018;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ai4l3jd1/eF4m0deghb1F0cSTBLoK0XWRQHcHMJ+W4w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpZMnq1poFeCZEhGAbmOEx862guge+htaF08CAU
 WRid/G2CfyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaWTJ6gAKCRAFnS7L/zaE
 wxWZD/sEntiOzbImdwRltcgIShIGvZC8ukrcaFjCojiYxd1Oqi2LNK2fbi6NwZ+LBIG2uTaHk+2
 QOuSh+pM9mO0GJdCbAR7vqrseDjB0+3EGZS9euka4b2fv3kXZKn5o5BIz5sZ/WbRN7HIHNh3qOE
 PVeScp8uwCfAECOHVWZElnAW3RjMQ1uK+FRRIZ2afYqUI52Iv50UV5tIiaK6sY9MWFVbin0HTZZ
 hqiD5ZNwZ02jnplOZIKlMbFAFQ54bBjNwYZphy7CJZAkzLMYSnPHLAKVS3VpPFLDo5XxE2qbSUc
 ZjDZnPK1pT/Sv33lf5NOSCHOxnV+GUYj2LGWrcshhqNAjW+K0K8Ygfx2tQjWSK2EbfSg8sUrZXG
 qAAH8nyRkDVFQXrOjnJTW9Ecw8BlKjqsEQeMd+7C8u0cc9jszvdkNCNevRfCBJejdjFdEftST01
 jqUBVr04XNwxNNZkI8Cty2A42/DA8aDLr20cKzUo+aWrnCOY+WFZoKDOfy6T1WkzMqNrPUBEzpZ
 PJ4HJHtWgOVVmHf1/K7B6skUMKINuR6aDPl1t5cOI9Eai8MF2SnrmZ8iUmhuXKP7dE1A+dVy6fM
 y3EtIhGtRmd3ecY/vKJ7eHH69ZrXeiV4qiOdAYbaLuMRGglazNI7nuxNC7nuUa9bhF4JAVyC6Pz
 xBXljylIoPiCmPw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4MSBTYWx0ZWRfX0kaXqGsh1FTl
 kP0BIHV5WMqj3mqKVaNGzFJ2O7/TEwLhlfgvIDyGTuz+u5hBfqlOwBHwimmIhoB9Oh1Bjc+K7xY
 Q4eVzWPkvP58JzHKOtVMCyIJdaIHmqOTSMxdG6NZb5zoGwHoLtIF5gn2AGEx4HTelFQyeHO++du
 HzGZcxSb5EnBEQmJ2E+wf5di5E+U2w5TdZ11z3OEVm2rHbarn4+cvjQm9Ng0gGSW8XEATw6K5mD
 BAvCqodB9CbRsP4KW2ChM0xrmpe9c4N+4RlVhzkf2BNJ3b1SpWfdIC+3twItAE/REh6WWrbNLJM
 d4IJXZb0HRDM5wU51HoaoM/4wT0AGYRXpRM7i6TMXsw1YfcoFkYPdi5Hz45jfoKEV1Unjeynqua
 sheVak3SpeD/LgDhPpHa73UNTTMUc5zOsA0N0xUKWSeq2AQysw9og7OxeqCYwQC1d+Adp7Y4u9s
 4/yKnYq7JqfUKaQNbrw==
X-Authority-Analysis: v=2.4 cv=HrJ72kTS c=1 sm=1 tr=0 ts=6964ca04 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=X-TyB6MtGS_gwYDveGAA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: _A3uSzdAwesLApehxZy-_8kB9i-WlOLR
X-Proofpoint-ORIG-GUID: _A3uSzdAwesLApehxZy-_8kB9i-WlOLR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_021637_138120_92049EE0 
X-CRM114-Status: GOOD (  18.28  )
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

From: Bartosz Golaszewski <brgl@kernel.org>

With match data split into general and power-management sections, let's
now do the same with runtime device data.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 46 ++++++++++++----------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 54458ff5c9108a6255b38677f4de973511b5176d..856fa2c7c896ea3068ac38d9ee71b4173edce80b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -105,17 +105,21 @@ struct ethqos_emac_match_data {
 	const struct ethqos_emac_pm_data *pm_data;
 };
 
+struct ethqos_emac_pm_ctx {
+	struct clk *link_clk;
+	unsigned int link_clk_rate;
+	struct phy *serdes_phy;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
 	void __iomem *mac_base;
 	int (*configure_func)(struct qcom_ethqos *ethqos, int speed);
 
-	unsigned int link_clk_rate;
-	struct clk *link_clk;
-	struct phy *serdes_phy;
-	int serdes_speed;
+	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
+	int serdes_speed;
 
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
@@ -193,9 +197,9 @@ ethqos_update_link_clk(struct qcom_ethqos *ethqos, int speed)
 
 	rate = rgmii_clock(speed);
 	if (rate > 0)
-		ethqos->link_clk_rate = rate * 2;
+		ethqos->pm.link_clk_rate = rate * 2;
 
-	clk_set_rate(ethqos->link_clk, ethqos->link_clk_rate);
+	clk_set_rate(ethqos->pm.link_clk, ethqos->pm.link_clk_rate);
 }
 
 static void
@@ -616,7 +620,7 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 {
 	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->serdes_phy, speed);
+		phy_set_speed(ethqos->pm.serdes_phy, speed);
 		ethqos->serdes_speed = speed;
 	}
 }
@@ -683,23 +687,23 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	struct qcom_ethqos *ethqos = priv;
 	int ret;
 
-	ret = phy_init(ethqos->serdes_phy);
+	ret = phy_init(ethqos->pm.serdes_phy);
 	if (ret)
 		return ret;
 
-	ret = phy_power_on(ethqos->serdes_phy);
+	ret = phy_power_on(ethqos->pm.serdes_phy);
 	if (ret)
 		return ret;
 
-	return phy_set_speed(ethqos->serdes_phy, ethqos->serdes_speed);
+	return phy_set_speed(ethqos->pm.serdes_phy, ethqos->serdes_speed);
 }
 
 static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
 {
 	struct qcom_ethqos *ethqos = priv;
 
-	phy_power_off(ethqos->serdes_phy);
-	phy_exit(ethqos->serdes_phy);
+	phy_power_off(ethqos->pm.serdes_phy);
+	phy_exit(ethqos->pm.serdes_phy);
 }
 
 static int ethqos_clks_config(void *priv, bool enabled)
@@ -708,7 +712,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 	int ret = 0;
 
 	if (enabled) {
-		ret = clk_prepare_enable(ethqos->link_clk);
+		ret = clk_prepare_enable(ethqos->pm.link_clk);
 		if (ret) {
 			dev_err(&ethqos->pdev->dev, "link_clk enable failed\n");
 			return ret;
@@ -721,7 +725,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		 */
 		ethqos_set_func_clk_en(ethqos);
 	} else {
-		clk_disable_unprepare(ethqos->link_clk);
+		clk_disable_unprepare(ethqos->pm.link_clk);
 	}
 
 	return ret;
@@ -816,9 +820,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, clk_name);
-	if (IS_ERR(ethqos->link_clk))
-		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
+	ethqos->pm.link_clk = devm_clk_get(dev, clk_name);
+	if (IS_ERR(ethqos->pm.link_clk))
+		return dev_err_probe(dev, PTR_ERR(ethqos->pm.link_clk),
 				     "Failed to get link_clk\n");
 
 	ret = ethqos_clks_config(ethqos, true);
@@ -829,9 +833,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
-	if (IS_ERR(ethqos->serdes_phy))
-		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
+	ethqos->pm.serdes_phy = devm_phy_optional_get(dev, "serdes");
+	if (IS_ERR(ethqos->pm.serdes_phy))
+		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
 	ethqos->serdes_speed = SPEED_1000;
@@ -853,7 +857,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (drv_data->dma_addr_width)
 		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
-	if (ethqos->serdes_phy) {
+	if (ethqos->pm.serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
 		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
 	}

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
