Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E55C44501
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 13:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eezU4NRBEjIcFk4qJ+OoicKmBoWv4WVeU5Nh9tFVOuE=; b=VwOaxst/Dtkk+R
	XwpDRtCpSDW0ykblnbKMZKNes2p6w2mdSbWmot2iLfOWxK6EKQ2lyaHn0dbIlS6DtQw0+RLQUNxw/
	qs4AOWnYFGu3YHjKJr5LYGqSKwlAXoTo/6t0B/qZDqyAVU5IFqRb3UAfTNXLC6ms96uL5W9rOomnY
	Nppc9RfOfiHrWsHJsh3Z5F25eRigbIuG+rW3smKDSaUoFJDv1gh0y8O3q3Ly6+jIcN/z2Gsoo+eM4
	cCB2XF2mr4Ked58nE4BqfqBlHxeLUr47fhnzpzxsDEvZhWfz82JxhXLypWfhEFDt/Cm0g0Bgq+o6E
	QHCmYZGOTbND7j/Q04Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjFq-0000000CYv3-3EX8;
	Mon, 06 Jul 2026 13:20:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjFk-0000000CYiT-0tes
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 13:20:54 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxCVZ238119
	for <linux-riscv@lists.infradead.org>; Mon, 6 Jul 2026 13:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=; b=fOxq+7SIXv5TAgp+
	3LhNERn5LTVoVpsJSWbou+OhJo7ZPhM68du15CUsbeYhDP1hDtmE5fsEssdy7A4A
	LQdOp9g7rc1wqNg6bAwqx6XeV1bISNfWRVcPN+cn0G7KI4hh+iln1RcWr74AOYBX
	vpTWpBfMRXMYiG/OmstFA4Iiu5+3JA8SF32Mzad2tcatFqPmB+ySf+Lvc06tWzUh
	9Eu/+yeFDSBSpQDc/c4MyGQVcoRu+aFF9mAZiSeT4LSd8AjA9VdnJ0BR8RZQcKyp
	+a842pp2cuRnyHbSrT+RfzGrotV/cUhyXVsRgnTVIlzDHeZTUsqTi8CKa+Wh9NxP
	ZTiSrg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t894xn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 06 Jul 2026 13:20:51 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bd7905b135so648342e0c.1
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jul 2026 06:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344051; x=1783948851; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
        b=WG4/E7+g37PLuE5n6RAk8kI8q17GQZwPj8JuXc6tVLzTGdKNMvqVlEnRCjECftYZ5C
         zn2numVjPppPcLLOUHMX4vMJbrUj7bect1O46Qqu+97uH9XDOLWP6L2XNkoPkkGuPB8p
         xoNoG709HEZxZFUgfxq3BH3M4Ynjbtwr+V2HmuPydHKRSwyIyqg3OoCbf/N/zgIWihnh
         mwJ2CZwz05UjW9YdfIBuTquytUZSIy3f+sfzYT6PRmRL+rImkUUwPU+D9JEliGlSpAk2
         KcN61qF5mdleHS3cJ3w0efQpHuAGlzL+2C5KpIctjPBcMKSntUoi1FA+ByI+JDezxjTQ
         qc0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344051; x=1783948851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
        b=KRd3so/EIvF3xN3J7C3Z1jAiIwRFNOBlB5ihelbCASz69Doi728fHcLQvq1jpTuy3b
         ZR5DujcESv0xPpfvJ0ywp8tjR+okHB7x76q3qxvKyFlVXQ5zhlYtixOr0WwpdKdXqn1g
         KMCnkXFEKIZpwpAK4tyjKM+Zh17wiXlQmcDmvy+JfBBzZJQKV5r7on5oqybUcLYoyFS+
         zpyyNfNkX0EnOTBXfiSNvb09vsThs15FyoTz1mo2QluoJWRY8yykgSilboEna10ALWsG
         JI+XocyAduMWks7bzdEdqy/fInKK3W6kqddJDZHB1LPkjuloSpBkrMABnbGFcsArX3fx
         iRew==
X-Forwarded-Encrypted: i=1; AHgh+RpLP98gy4GFoavqpziLF/UI4PHh7qpyhslkuWxjT+tozCxSeBcWLBevNHxh1000KrGeKi0At+qQNMGXfw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSWBFFcu5ms8qBx33AdXDFbcPM4/BKQBf7m5SjLhY/rHsQ65Yl
	7Kwq3mZlh0i7cCD777PwsasXQxzauiEwuaBWdCppGFZ97NE4t0qSgPDNn/Gk3GGHcN8bUBQWJ/G
	HpHLkXibC5uRYrk+w8wvIiC3a6H9pMvUTnVC2XBtWupynlguTH32N0fxsbRfBS5QWD72nSYs=
X-Gm-Gg: AfdE7cldzDYSqz76Rnea/ug7/rCxgv+gEktAYHffmSLRSH0NfoqdRXjBl1fe/pWbqyv
	Et50U6QKtytyliuxZyycgfYTgtZdYUx1reoCAO219hj/ba98+FWzJXifcnIUVUAzHxTYihQZJ/M
	QOU1+PCDrb7XtWyj2n9Jo8fs9tmbXMNqwUCNQxj/WxY5OYwTWVdwjbS9O5K2adsQfhaCVjkqRzd
	DIQXuQxSY4o2blXf08Z7GkunHLEdJcPJeAzYjaMe9vG7zsUsY9K0J4PV8c2FVqsvd9+RfhHgI2g
	ZoqSrTs9Zpe0dKGcQ1dygqI3m0GoUfWycsoj1/mPeh4+OufWQ7ok3qjScBOVTA/khgLmlDbhoJd
	cKAV4+LdZBanZDiXbhmeDov4Oa00RK5hAIsI+I1fm
X-Received: by 2002:a05:6122:46aa:b0:5bd:b0de:a736 with SMTP id 71dfb90a1353d-5be907a7dd5mr258024e0c.8.1783344050563;
        Mon, 06 Jul 2026 06:20:50 -0700 (PDT)
X-Received: by 2002:a05:6122:46aa:b0:5bd:b0de:a736 with SMTP id 71dfb90a1353d-5be907a7dd5mr257980e0c.8.1783344050114;
        Mon, 06 Jul 2026 06:20:50 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm25910584f8f.37.2026.07.06.06.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:20:47 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 15:20:19 +0200
Subject: [PATCH net-next v12 4/7] net: stmmac: qcom-ethqos: set serdes mode
 before powerup
MIME-Version: 1.0
Message-Id: <20260706-qcom-sa8255p-emac-v12-4-e3ab1ecf2901@oss.qualcomm.com>
References: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
In-Reply-To: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Rq+TDPdqhF6BqR973VgYSIdLvxRoWPIkY3OnfX0xzLQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6uetN8tQ35/MLf6WrNwnnyMDIulOdtwR7ChU
 fVGHHk3r0yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakurngAKCRAFnS7L/zaE
 w8OHEACRZI6ADieQbUC6leO3XRgj+gxRGg9lhMPexr8/DmUnblo/bE9rhFIw9azo7F31pSedXgU
 S2ZoMQph7d2IdVgsEFK68vmpeM7kbfHOmOspoTr9OTFAFVAYFLbvrdnvg31npbXMuipX44t9wMC
 z0+KpQSH7EuJRWn/0SdKx0hpl2F0NLAZBBYm/mOkxDC6oQ98L9KSVeAiZMTA2QN2e7RN3b8i5Y8
 +Tb/X2ZVbZ8KzjhAlymhR0hTk9QVAqHuFn+v0A4lMylebluozCzeMmS0lnaJoUAtkKBVoSGEZWp
 f7eVuChzu8R/i7CFuQ1d1uEjd4nCrXvk9N59kEJBCfVqIMUpcEzqt5Ud3i+1EvxEdD/9I6kTWIP
 Y1lgCr4T+O1AWH+b73x4EX8ls/BOq9lu0fO7MKzfbtfBIooYGgt9QUdToMMAQo4UTIIi/ceTYVu
 v72RM+zndt/2RWOsztsZXIsL3al5/9bCuw6E5b/HCWspMa0wbY00BI4wjanae9j4xJOKn5rLcx6
 kIEAGq+V0wVSxA//bEl3l+PDVS4jmieG559Qag5yL91dx6yD2+rHPj2gZCqzne+G1SYGWadfHDF
 676mCUJMBbrWaoAvNa6yFRi/PFlYGtxv+3Y/FSRc92uis4NqvNkI1J7u6XwuXAnF0UEbshJlPNV
 Cr51n3bq9Qj1y7g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX1GPovS0qhi3n
 E/28V+yXhoXyG0yV32kZS2OV5NwSzMmXo2ifxJg6aCcYBAk7ez7Bel+r/MAFP0T0UKEQGlQdYUp
 LDOv4ly1o96j5StSpraeVBYrtSImsFo=
X-Proofpoint-GUID: WYwwIoviBiP8xlM5El9rrAZ5J3voJs4R
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4babb3 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=lIIuVyqIMTwqdMfQNTsA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: WYwwIoviBiP8xlM5El9rrAZ5J3voJs4R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX6ml4Dwntvq8v
 +5kukULt2sdYISnjB1JtT/sIUjLCnoCYqu6olMlxHuVHn3OBuc+jTojHe41MlXmC4Dfo3h0ykOI
 SKAMvR72OOfyDfZfGWh8ezwkuupuJveXWqH2/JAcDDonaeXMYcIBFJBHvqy5QgG4JiRKyEBzAmI
 70yC9IYpEDVCYkpHJCcHteRbf+hIE+3A3NYQvuqRAcvr+amQkX2BkZfWdk3zQ8lD01WX7bwQmgV
 l8HE15Vpu4LTvfvS3U9fw2+x1grPDSCxTwbuREYMqiEmKSZd6Kjq/UkoPO+FxaF+OQk/hw5hprv
 NsUh//wPlhSF56FgQieaq4vrCKFQn4aF2SF3mNzPICf66gXz7thwUfK309AhajJbJHiTUODXlh1
 /YcssKng4rzj1FMFLhOPtviwRncSIxrz86tl6Q/8B1F7m5V/WxBRhfTLKUxWgxGPiA/6EIAkm6z
 Fg2dgCFAnX10iPy2aKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_062053_449362_8EF8A813 
X-CRM114-Status: GOOD (  16.04  )
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

Call phy_set_mode_ext() before phy_power_on() in
qcom_ethqos_serdes_powerup(). This is harmless for existing users but on
SCMI systems this is required for the PHY driver to select the right
performance level - which translates to the link speed. This is done
ahead of adding support for the firmware-managed EMAC on Qualcomm sa8255p.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ac7d6d3e205a1ab5b391def879d6f1033a0961b6..47b70b5e706f221c01f1c0ae3b1acafae6641165 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -601,10 +601,19 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	if (ret)
 		return ret;
 
+	ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
+			       ethqos->phy_mode);
+	if (ret)
+		goto err_out;
+
 	ret = phy_power_on(ethqos->serdes_phy);
 	if (ret)
-		phy_exit(ethqos->serdes_phy);
+		goto err_out;
 
+	return 0;
+
+err_out:
+	phy_exit(ethqos->serdes_phy);
 	return ret;
 }
 

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
