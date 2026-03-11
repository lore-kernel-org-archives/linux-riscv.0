Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B061125857
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 17:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RqgzmatPYOhUjeAIVVsuCx314zZXA7ECTIEfk768Wc4=; b=HZLdM3SCropVro
	AqK+RR+U1wun6Nwg8B2ePFX6xQ0zzSabpMDqL9TfNuhvzbe4XJqWnA3XwY1EMsHiPHWMRFocv00dl
	gnqIPriD9mxUvOQ2SEJ7iUL1jW7Xk8kdkhv3jBDuTd9oRvgjlqgAPBqBXDr/15LL43p7chIsYRFo4
	ZQMkzBnFJ2Cm6IVEQyRyUynmCBFZUX1sbOaV77/kxFNVeZ4dF/dIRgNBFzXsXEXR8xJ7hhrtICMRn
	XknbGh0tep0KJ2/xgOZA/BBAjqMGt/Tb+G04k5MllWOcMF8Ehuk6K9GCVEY/D/tbn9a//8ixBLLdl
	jGQTjcP942YF4cNpdJtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Mz7-0000000ByXk-0qGq;
	Wed, 11 Mar 2026 17:04:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Myn-0000000By8d-06Ec
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 17:04:19 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BFux3o914649
	for <linux-riscv@lists.infradead.org>; Wed, 11 Mar 2026 17:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DPN/i/l2ssLEfyh7UE2pbxQ0TrPdBXJ1R/NupA3ANWs=; b=HShLjO/4DPGGT+83
	AhEtKny8VCwP5xABeVCd8sKDDEVUo1Hi/e5iZ667HQSx1DQaPOHaCMWKy8l0c2fg
	gHNSR3tC/HJEnlGo7lEqwdwQJ1k7+pwoPHfFosISwP5/jgVw5cH0GCmIzKZdPXn0
	qSB4+3UtNghZnDYLOmtQkadomcQFcGMBwiMH/cMKBwo2GVTHsD97dlDth8+gnx/u
	/u9gC10OXihSZj30FI1FdAs/Fzaee4HbKF/HOixi/XHwHb4vyzCRgnKhEJXS+p8U
	p3bCYZ5KRfHVxyz5x+5ncU5t41rAweRXYp0z+IW5+UZ8yRGLqdCQJQAG75NllcR7
	L9mZBQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cubg208uu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 11 Mar 2026 17:04:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50900e9803aso6271151cf.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Mar 2026 10:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773248655; x=1773853455; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DPN/i/l2ssLEfyh7UE2pbxQ0TrPdBXJ1R/NupA3ANWs=;
        b=FB1YnDXRBDG7xl5RrsAnWkFaU2Vi0SIENYYZ4V2rR0HKsCI9m6AvN7gvcH4eN/gnWB
         cyG7EoCSW/WnEio7AjmEkHua5IdNKsuObrV/Qxfq53fj0sjcCPHd70zr9NDPBZToNePl
         UHC7+XkRsr+f4ENE5MdBnrdMDpVp6DWapD4zdJv1bkVAcAJxzeHXzOU00BxvX6aFFZkd
         lpsAC+9ZT43InbHgtqMFtmty+nogxxfssU8jY/ZAXDIHyN2d4dPDeHNysDvwWJC2JrYT
         786jko9czKSjeZaIdmUjxOr92XagSf04Ixv/FoaETwko1WOsB46Z7YzdrNoH/2Ta+fDk
         0/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773248655; x=1773853455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DPN/i/l2ssLEfyh7UE2pbxQ0TrPdBXJ1R/NupA3ANWs=;
        b=KOmyHGgmhukw+mwWG1rJFvpraI9mieoJ5VwtiIIHeVOLG2nvDPhvAIHS76hKJzmVEX
         NGy3UkjR8SRejeeKWDkZyVJMoPDfpBbusbYukMYzly/uNC3ICatsR6LRAzMRIPyRLkNd
         JVqUi/G/a6t1JT2JMWQy8LnSCIqKVnhWRCeRh62AYBLf9Av11hdTc1xCc1CO3Z/e1onG
         /7mdnoa1FLErBP9yP7bMz0N6jB90T6bUZ0DRSSaDRJPKzBqxwRUxxtGwgwfP2y+HzRTy
         UFGR45BHcHiLR4K4lFEc8oDgjOERj6GWC27DrCVj2EonNf98X/RdZoU6zrzVVuiCqnSG
         yHNg==
X-Forwarded-Encrypted: i=1; AJvYcCXwZTjeCkXkHXX3jcUV4HrUp9IR6rPngIyPsL3tJ9vvidNuC4qYMLiXqJqiF48AuBL87VTg0Y82ilGZUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0xGhrP57NmFIsKs/vTYtaYmkdaA3ikwmEgryDt3AlnPKLxpoP
	2BnwQijtlI/R1EhTyr9Egm/mB8kU3kuAL4pzWw4VPmJKjulvGCGGpSRROIgKQw8Smvur+YLoOHu
	h+OZZ70aaB6NZc0F6MyyihVyWcJtxsubxfJfJZLEEpWskM+iZ2265NmEqtIhfyAHPs2KGabk=
X-Gm-Gg: ATEYQzyWguZHbiKRBvaY0hI+BwwBw+nMg4prLecFCa8QdLpBzrpjbhk4Ixk1xdfTNuo
	2t2MTCOvMT3eOxdp7Kr1HlhYNCJ74r8N5sRez/UCofZZo8qiKmEif7AUH0mmenauKuOD+MivWiH
	BSyIgF7QZUIEwRmFP4cZ/u8B/xm7Zd07gpWYYSl0+h7RSeH1Y3K9t7pTFBtCD7vHHMPdTAg/7uk
	UMKJCHV0Fkurd+pLIUsj6rzhQg/iQup0qlZYK2R/meuDe7TR0j0cG5oRw3Giw1ns0I/N+4TbT4G
	PFXCahMgcPNn17UL4FDThs6FXTTwfexCk+GKoQCttSfezKm36gidI0ZImmIOI/UP9NYpfYd57ei
	UMB8AUXivodYjKUtQR9gidVKybhRYgfQRqWmoBobUm6xHERHFRjjo
X-Received: by 2002:ac8:5d91:0:b0:509:1579:7c3b with SMTP id d75a77b69052e-5093a1ce54bmr37535421cf.51.1773248654966;
        Wed, 11 Mar 2026 10:04:14 -0700 (PDT)
X-Received: by 2002:ac8:5d91:0:b0:509:1579:7c3b with SMTP id d75a77b69052e-5093a1ce54bmr37534621cf.51.1773248654258;
        Wed, 11 Mar 2026 10:04:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3a92:6740:d71b:5056])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ad1e4esm167993075e9.8.2026.03.11.10.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 10:04:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 18:03:40 +0100
Subject: [PATCH net-next v8 5/6] net: stmmac: qcom-ethqos: split power
 management context into a separate struct
MIME-Version: 1.0
Message-Id: <20260311-qcom-sa8255p-emac-v8-5-58227bcf1018@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4863;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fxsbaPI9iOaLzA8Nxl0AqrCTE2PtpwOgDoj1b5dzN78=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsaB34b5S/F8GTVL3hALT65A8dpesAVcFpLmve
 Eu6M/Ib2jaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabGgdwAKCRAFnS7L/zaE
 w6B4D/wJOw6/U3iZswLeegYbU9W2+3pVejpInhXJRODaIgahpve2jOPj+VKygqE3E4VOJ+Rtwsw
 QsSTezm0FPTw8Dl67/TsIBlfTYp2k603PBrtQtvneCURCJjzVhJIHhE1UILZO3bzh9nKF/qHUXY
 h7eYpsfBs1ID4ha+L+nW0RZagztA3MlXmTnbRt6dbi9qdgYjsEnk6x1rHb4K8meqp4cZ57gxOyY
 ZBzT2NcGV+NnfHz54zRsu8c8bjoJBcvNjanfgVaRscTPyz4z7Sbclxe6VmAFqi2R+FR6TMrC7Iq
 VgTarwiatqz0jhjmGD5sOvE91kF2MKWe80SF7CJIY1NfAi8zauidyNAncObdZqAiCNk2YoR35oP
 kd4DRqzlREVTu7yOF3WKS0r3kbH0sKRU5MUuOBEFnGIN5rQik4T7yPbGHNGDz0PySmunJCLU/Pf
 Q7KVhD9yaZKQSZ+lAARWGv2FBeat6NLpOxTvwSrnkpsp8e16XwZpxH5UziSYbhyiL49zTezayx7
 JB/If/rKwhrgTaS+iRubV03hv4+jvCIdQ4dLOYDi5SO89BcRkcXRx80X37uhJLSp7Xxq2kQv6yf
 yrWt+zHWu5eN+ixxZnfuWjMAlWlBEXPm03cdHC/EHHq3r9gTo/hba7ieSOj6c/lUwqwNVIQ4wlk
 MseQZHuzHn39sfQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Htl72kTS c=1 sm=1 tr=0 ts=69b1a08f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=TTAMOEIJuQy2Ho-tp7YA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE0NCBTYWx0ZWRfX5FKvffW4pAep
 0OaCB9ag06d2vxb16BbNZyUjT2WcGCnevQyKWMymxbi9i/Uj1Zuempxu0U2KbJoe5htMKfTXsOm
 zKUseir0jiVYJI/0UqqPi59IUtCkEvc6MZBkfgLQCmYc3g9jo76mbgWpaJuL1ysZK377o4mnHQY
 P8VlkzSozQkZU1ZTWRrp7hn5GZ1VjrnbhL4bH5JdBIWFUMDvWID3/aAHeX/0xgkN0fikHHsfhwz
 p0/tT390fByaOivMa/k8rJBkaBWgw2yha75mwRMIqF4g0sNIt6QO4372XuxZhqFJACefVuBrHmg
 xy+m1B+qM9q+/NXjePadw/mJ0DsGzVZ+QQZ9/NaXdKA8CFkat+Bi+OQReQ+GUpVkiCaieG5hqgG
 ODkn8B0cd0DrqqLQ2vQ5Ig+H7CcbeWLL0AZTWx/QndYo9hOhzB/criTggAcaSGFz/isK81p41Yi
 s60J6czG+Twh0dNO5GQ==
X-Proofpoint-ORIG-GUID: iv0Bd9qJvRXH2joC-culPXSC98ar34vq
X-Proofpoint-GUID: iv0Bd9qJvRXH2joC-culPXSC98ar34vq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_100417_295145_456AB485 
X-CRM114-Status: GOOD (  17.96  )
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

With match data split into general and power-management sections, let's
now do the same with runtime device data.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 40 ++++++++++++----------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 2166084aac999a38367af4294129f925391179de..7e3dc1df093a20eb766ebcb29738d9f4261145eb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -105,14 +105,18 @@ struct ethqos_emac_match_data {
 	const struct ethqos_emac_pm_data *pm_data;
 };
 
+struct ethqos_emac_pm_ctx {
+	struct clk *link_clk;
+	struct phy *serdes_phy;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
 	void (*configure_func)(struct qcom_ethqos *ethqos,
 			       phy_interface_t interface, int speed);
 
-	struct clk *link_clk;
-	struct phy *serdes_phy;
+	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
 
 	const struct ethqos_emac_por *rgmii_por;
@@ -194,7 +198,7 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 	if (rate < 0)
 		return rate;
 
-	return clk_set_rate(ethqos->link_clk, rate * 2);
+	return clk_set_rate(ethqos->pm.link_clk, rate * 2);
 }
 
 static void
@@ -670,13 +674,13 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	struct qcom_ethqos *ethqos = priv;
 	int ret;
 
-	ret = phy_init(ethqos->serdes_phy);
+	ret = phy_init(ethqos->pm.serdes_phy);
 	if (ret)
 		return ret;
 
-	ret = phy_power_on(ethqos->serdes_phy);
+	ret = phy_power_on(ethqos->pm.serdes_phy);
 	if (ret)
-		phy_exit(ethqos->serdes_phy);
+		phy_exit(ethqos->pm.serdes_phy);
 
 	return ret;
 }
@@ -685,8 +689,8 @@ static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
 {
 	struct qcom_ethqos *ethqos = priv;
 
-	phy_power_off(ethqos->serdes_phy);
-	phy_exit(ethqos->serdes_phy);
+	phy_power_off(ethqos->pm.serdes_phy);
+	phy_exit(ethqos->pm.serdes_phy);
 }
 
 static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
@@ -700,7 +704,7 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
 
 	if (interface == PHY_INTERFACE_MODE_SGMII ||
 	    interface == PHY_INTERFACE_MODE_2500BASEX)
-		ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
+		ret = phy_set_mode_ext(ethqos->pm.serdes_phy, PHY_MODE_ETHERNET,
 				       interface);
 
 	return ret;
@@ -712,7 +716,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 	int ret = 0;
 
 	if (enabled) {
-		ret = clk_prepare_enable(ethqos->link_clk);
+		ret = clk_prepare_enable(ethqos->pm.link_clk);
 		if (ret) {
 			dev_err(&ethqos->pdev->dev, "link_clk enable failed\n");
 			return ret;
@@ -726,7 +730,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		qcom_ethqos_set_sgmii_loopback(ethqos, true);
 		ethqos_set_func_clk_en(ethqos);
 	} else {
-		clk_disable_unprepare(ethqos->link_clk);
+		clk_disable_unprepare(ethqos->pm.link_clk);
 	}
 
 	return ret;
@@ -819,9 +823,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
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
@@ -832,9 +836,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
-	if (IS_ERR(ethqos->serdes_phy))
-		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
+	ethqos->pm.serdes_phy = devm_phy_optional_get(dev, "serdes");
+	if (IS_ERR(ethqos->pm.serdes_phy))
+		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
 	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
@@ -859,7 +863,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
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
