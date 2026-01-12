Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA27D232D7
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 10:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1XYVpTzzhJYHzYQd5EHDdLmbH1DEGsmyyW2ZNnuBC0Q=; b=QX261wq9GGJnkH
	MtvTeGVTl5DSYLl6oZVLErAm3gUjn8SW9KyUtIasOU/90hsktUhuBFS3FKwf4Ji2ZN3EFrIgcWJsw
	zgETljggPh5DbiswlNsBpk23gkvWjveM6UB189zirbDwtaLL/GhiyMG2YCroPXJWgE7xiODbDa6SL
	7sruJhjnw2dcee7KJ5yFiS1QVNQcgQdtcEoy/e/3Qc6w1RX28OFmVT0T4HndD7gGqxQOpcDusvqUN
	FwyB7548U7Bi3dvn6z0Gou6sQ1vcIZJc6cRTsFYwWjdJO/zFzYuUYKru1XKeJ0BUF1AdNWyAo9BmS
	cHCRMwd3gjpAoBbSJJBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEyU-000000058Yx-1JLq;
	Mon, 12 Jan 2026 10:16:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEyP-000000058SI-1u3H
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 10:16:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CAEWxW1315821
	for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 10:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FopvU/uHrAiCRaPlRxkzQ4E02U64mEyQRO/C/UoGdLU=; b=N0007oBLwnURoYhN
	eSYRJ4CCvFTU2mFtVbWaO7sNK4NRCixAN8QoncTc4fLdXiLjZZ3LtLgTWnvWrKD8
	2hLiwLXnneWDrCtEL56DCJ1Tf2y0cQ2pDGVUANH0bOxBMOWZWsNeOr44MImXIAft
	qlw7O6MAu2yiklecld2wALs0aVsMod/IUS+xt48koG5fJ00i9Rf1nKk1E5VODoYj
	TWk/wMOFgViuKE5s7dXvMP2D9Zc1KwTPcV68eKK/vOxoIug+q0/qWhvQPT2vPfkG
	RL3+Ww9oIoGBslUC8XtEo6Goh+Y8QdhgSXb+VG8yKTFp9gVkZd2BNj7WpGicdwzh
	zzDOIQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmy1hg07a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 10:16:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b24383b680so2497157385a.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 02:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768212992; x=1768817792; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FopvU/uHrAiCRaPlRxkzQ4E02U64mEyQRO/C/UoGdLU=;
        b=OH1HtFmCrQInvz05eeNd/ELTBBvrOj8gGdT14FNDx3z64XlgL2Ewx+rN0qpX9wtOzc
         Fi2o+0j5iV3jmgvnIdhRsOX8QkYnuO7EvZTJ9Olo5ZW864mZxMznA7lJKpatETDlXn8r
         3Ko89hgayIUuH9D2oRrfr1k6KWordvctyscS6gHXMr45iPs/shJA8FAiMEqgQS0EgPZD
         IaWIBLV8YIYXZf4iyb9bQVPqwfck8+ZKHxrYv0LV4ZtTH7gvhX2oN6WDqSmp/o62AqD6
         w5JR5nfG70zbAasQjcK8HB674X7tZvphOEQQzPgkFgNxkHVcw1PimtkBoSkqYr8/8fyR
         I6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768212992; x=1768817792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FopvU/uHrAiCRaPlRxkzQ4E02U64mEyQRO/C/UoGdLU=;
        b=atb+9xXi+3tHA7WDAiMnH5nCZ9TLhaCUqxWJVELS0YZridPFWzF4v45WqQOS6Oob6t
         NWzK2QL7jxh6OuEgs+3rhBEHX+ZzxQ1lNzbFHOqHfEblEpyG0DHzHOvlRZEfu6LZLamr
         ZMXUK/hiSNQfGqYrGLlidKWqg78YTgT9HuzjBSr44hwitHGnDtEUsR/tAeNZUGQEqI4X
         gBPTLnYcXxx6Tug2uY0WeUzfGswTmP+0C5CiZXqTasRThxpqYizPm9oyIYNe1z9hTjou
         elXw2pWM7DUT2i8UWCN/HxNVl+3U+XP/HmtEwRaA/5KsUwiUjenf4jULPZe0wxk1CQGh
         kE1A==
X-Forwarded-Encrypted: i=1; AJvYcCURjx62MCqwCsKgZDzbIqmbh4T8cxCIQ1DQqZFPCxhZyG2Jx7ELFvhEvRG60Cvrgmmsm2L7vpsyKfcp3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwnyDCa1khgUDSCKOWb7tiMnLsgxTALvz1iywoaP9IP5Yf5rgsw
	YFttIE2G5hZLhK/U01zbO6/tC5qk7Wi71ZvPzi1EtfUy/vGb4JIZGQuDUoOaATR9M1RCbvKRitE
	yBE5nTtOAeSbw2Z24y9Q+OHoxTalVS7DCxKq9WMYyNE78w0m2g49obEZ89EqO/4yfIh2S4vg=
X-Gm-Gg: AY/fxX4WYQUH65HApN+V3fzDvvnlQQiKpEbKU2EglpgYPnIYzSAbigy/zG2Lg9S0+GI
	BpxLU+UdjnFLwyoFMwzFz9RBkleimjrRSl8Mi9q38u/UzZ6p+2OjdiMspwpmmayLFao45L0x5E/
	GPYm8O2/AotmdLWI8dJVcpYN2JFVV2tS96KzKKkC8NKS8Apcb4l5Dqm2XHlIs5hxp1eRWgwKRLb
	4ZU9LVUPpso9c79K61WOnuY1aFASUnBW6glZ96uIFYkHNLhyUNDHCWeaOuxLhe5IJVT2JnhMntG
	oaRnPrnLB4UwvrF/YO0Q3wNYCXspUgb5sdlFea8EePVV0f+PhlXoUYChxomt+kWKzW7sWbMCKQG
	2LRiX4L1mCy1lFxbEp2XE5rNUw+gd/1dqgf6SD1X9
X-Received: by 2002:a05:620a:44ca:b0:8b2:6251:64f9 with SMTP id af79cd13be357-8c3893f51a8mr2447164285a.58.1768212991776;
        Mon, 12 Jan 2026 02:16:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2C3RkdMQFFZ2lWORPuAazNVGVOCtBnDoC9lVD9dpEON9f/Z0WBVt2UJ654FrVQqL6BPNyrw==
X-Received: by 2002:a05:620a:44ca:b0:8b2:6251:64f9 with SMTP id af79cd13be357-8c3893f51a8mr2447160985a.58.1768212991276;
        Mon, 12 Jan 2026 02:16:31 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:eb74:bf66:83a8:4e98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d865f0cf2sm126530355e9.3.2026.01.12.02.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:16:30 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:15:43 +0100
Subject: [PATCH RESEND net-next v6 4/7] net: stmmac: qcom-ethqos: split
 power management fields into a separate structure
MIME-Version: 1.0
Message-Id: <20260112-qcom-sa8255p-emac-v6-4-86a3d4b2ad83@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3515;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SvgO86hvregXRCCIKpnZ8DXQ/gsX+xRnz4fK2MFB8zw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpZMnpS68E6MPAKTYOCCDfAdG6YpdqTFBzJlHYT
 m1XfvKT9n2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaWTJ6QAKCRAFnS7L/zaE
 wxcPD/9Jdw6lE3yxZNe/WKwcXn7j9F43Ct75jwfkHmaXABy+zG9+bJzVfvPYMURVPg+Xt06I12Z
 3ru0MCKYVex90w9rmlDU6EwpPjbjV0KUKl70wPpkXb4yEbeULkgr9QhJKA5fT2ev/bHe2CeqVUU
 U0m+626PDZEKBjBGurJ9c4ykqpLzgywBNeqdXThfbVmR/UWy5bX2Tf4szDreYhsevntHLQFIB7f
 w/EM68rQlxr++CEPaXzTW9MBGdrPtMt7YNadWPmSExAl7ZIZIAg+WmVl/R4zy8CcRP/wyGyytKh
 xyKinAXyw5PpALc80Vb3/h6fn5GY16S2DN2gwMQoeg5SOGTm1BnLjLSBeyEc4cZbm6gTNyrLHO8
 MBYXFAe5icfHNnlYNFCrHs5vnxuliTVTviavacY4xlDxWaaAg1gJcD/jPrgn8FqSpwDkaastAf0
 cQEwBoyqdkTN4gJRvhH6H+thiZWhicampXmqGtQCbv+Pb/V32siDJmNpulXNdnzuDS48k9/CA3t
 zlkmsgaGkezlzg6RtOK1e7JbxarQq955bGhZtcBubwa5w46j3M8pR7OH6w9YINHvqI1bvv/OkDQ
 XS9gbNRTdOJBCAVwmjKS3hzcv6uv3zZFRDc5pLE/CCIgb8LHOhNGNVnpgF1M9jzQETcqf8NAE95
 283LuhKXD0RE/tw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: UdCLYaqjmF2_5Bgf27UmohY84Fk_fc-5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4MCBTYWx0ZWRfX9QcyZwhTSpui
 80g3rMqZaGYN7uHTFytTYQJNTItI9szvNjvBJ+vDa5Pdtflvv/icERuwCcim62/o95caND+vmVL
 SfisrFqLMVOfub2EN0huK4hgrsKQZgS9GN2bHU/hIGXuD9uus8436jd+irz+nFw/CQpoxnO5DP5
 jrjteops2PcvvI53ihMtxayqVXjdzqjmXXyobc6jBErXNtZvQ7If3wee3pDglU5qjxoDhVTczNn
 siv0fWkgdHpqdeZSIFqt/u8NPnnXDrOjM48/TQkUNeRFqDyoLvNHDY0MVANL746OPhgOp9fYCw3
 rL3GCht+uEQ7tFlyS5PdxK+30CSJiV97Q2uMnx6kbMhIk/RjCNZw/YtnF8gNBzkE73cXT6aD+2y
 a0O7OXK2U/pRcSTBdBkH7KMrO4lg9CzNIq0HXXASLbDY77z/HZXG6dloZN3N1rfLyMFslK2/l2+
 w6fOY0oS2PiyEYBkBhA==
X-Proofpoint-ORIG-GUID: UdCLYaqjmF2_5Bgf27UmohY84Fk_fc-5
X-Authority-Analysis: v=2.4 cv=EovfbCcA c=1 sm=1 tr=0 ts=6964ca01 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=91Jjr3N24NtUYBPB5vwA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_021633_507215_B97F0970 
X-CRM114-Status: GOOD (  18.43  )
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
index e0f0eca943420e24dad4e506e12bbb1eb731b8f5..54458ff5c9108a6255b38677f4de973511b5176d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -91,14 +91,18 @@ struct ethqos_emac_driver_data {
 	unsigned int num_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
-	const char *link_clk_name;
 	u32 dma_addr_width;
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
@@ -303,7 +307,6 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.num_por = ARRAY_SIZE(emac_v4_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.link_clk_name = "phyaux",
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
 	.dwmac4_addrs = {
@@ -324,8 +327,13 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
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
@@ -744,11 +752,13 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
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
@@ -796,6 +806,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	data = device_get_match_data(dev);
 	drv_data = data->drv_data;
+	pm_data = data->pm_data;
+	clk_name = pm_data && pm_data->link_clk_name ?
+				pm_data->link_clk_name : "rgmii";
 
 	ethqos->por = drv_data->por;
 	ethqos->num_por = drv_data->num_por;
@@ -803,7 +816,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
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
