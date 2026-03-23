Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95D1F4610E
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 13:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2eOG3T3pT6TMfD6c4Hs5CFksMYZbyQBH0GpYiXnFZ80=; b=XdqRw7efj+h8y8
	FDrmgYiHFWT5WaRoJxlzCarSGuSImWSVI1xpFLq6oSTiLl55N19JU+7l+yZ469CbUqEZGQDD/bFea
	ULc6R+s0JaCDvMpM4PGRRlrt45VusF7AN7bG7B68GwfCfa1IuAnP8Nj9PL+CTxtdwify3KnvpQ65y
	PIg48MpgyU9Mn/Rc8KIAsLm6FiMeytDdcIfLCiRf70o0tCk1N/EkXVohmaAXL30j41SZcJQF5Iv3d
	NgUVCOPgnk/HhOO9r+lK6B4xFuZy26xXdBT7WzifpzOvq81mJPpwBQII7XtI4n9LRcyibVtxFr5bR
	hfQl5Sj+60bLl61qIoPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fE7-0000000Gn9l-024M;
	Mon, 23 Mar 2026 13:21:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fDt-0000000Gms3-2nJo
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 13:21:39 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NCejZN2476075
	for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 13:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JRiiX4zWYpuwYrXgVU9TJdiqt0ihuqsNqrMiVyK6xfI=; b=N7T6It8nbsDjVway
	9BaZbbouLTiam7yJxUITofAZlsTOVZ9Uonfn7oqHXjXD70WrIyNaCPW1Rtph2gir
	o96a5zTDERM23kBtl0XofxJBEr/VQ54r6TS+MzShIQmAfX/OeJj7GXjqMEK3Sh0M
	nkiHvPDXvFyPyysqKWmIGbDpPfRRC/VeyUvxf86mcKZ1aziJSXdOmlazQNQZdmLD
	IHkSHwRwB25W6q/iLKlgpEUsuaMSW6fQELS1dZ0iB8f9Ni2BdEIgZY+iVdq9BDBi
	5a5lDTrA3wOQfaFe/e59Hnptt9CqeoNVspDsgl++i1ZDj+R95UkgxCpu5FLjZSjB
	SM/ZcA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r2046t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 13:21:36 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5fff2d5756fso2457052137.2
        for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 06:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774272096; x=1774876896; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JRiiX4zWYpuwYrXgVU9TJdiqt0ihuqsNqrMiVyK6xfI=;
        b=CaxV6a5gURQdSLpcqy5xtCzt3E+sTnWjyo5BHWTUdxMR28ksLmq05hgW/W8hqHk8j2
         ATP+0PLmCZwDgFs1C+DlkO8sQc0r7kiEQo5asS13Zw9wmQ839iGdu1CFP23lygEc1vkS
         COK06H5oOni+Uk8I8JPp4KKZj2sruq8z8ZIxIsdoRUsHL1q2FYqqypOSxfGqHYwsKsfd
         BhqSDIgCBbQH6IeKnM/wPOgmHjO5QSB4d6BmWWmyM4si2Gh3WMkUc/XTgQtqaU6NACsK
         +B/eXsMu3zy6szD+UhbjgHlVpLEJABecdYHDnEIycMw5E2xgS4+0bLp5D4KF/jcT0sHu
         BsdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272096; x=1774876896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JRiiX4zWYpuwYrXgVU9TJdiqt0ihuqsNqrMiVyK6xfI=;
        b=AkzqeaFy/V9ctGGAZRtyWkNDm56q46frshFjCixaB27f30q7HdmRexphJQmE4urZ6u
         qckCuVdIi1UEVQbphFg5nObP2sg2NVNtqJKUyIY4PJgB6movmYKRoiXUKgkkgUbx0bap
         2H97rS+jXsmfWShjQVh6czJqX5A0AA/Gh3HQeGZwrXmLH0Z8c4Fb+1M4ZIs5d4/tYxxt
         W97VCR3ka1Zki2hFkAKCJ7mOsibJPaXFHnGeerZCtFMxcUdCagrQyEXoVe7wAyZ4SZDz
         dlB/f/RNnR32dYTeh0SUZSW0/3qBU2VPZhTmITeouDf49CTNDTa+y3pAcxBDfnuXiy7x
         VEww==
X-Forwarded-Encrypted: i=1; AJvYcCVcjoyPu+9z5iQxbHUM4q9y09n5k44GiYapEPpyDe5kgVpsPt95TRAu03YV2SnZTgv13jPYTBRqPizQcA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLuYR5Jibf1HvSK1ET3GZ5iCNNDQCrv19asV2hU+QkBsNPEKTs
	mn/m37TeyAx4UdR5e7Wd98SDhmh9Cl8hT3k90ISKf/EKXRyr5hCoHkKI551UdubLATZVlT51WoN
	wb689AK18fjB6Z64VEclBcpLq6ZofRzPZL4v1cAJfR7Uo8OuDyTVKHcZH/qRZPFxB8LzcR3M=
X-Gm-Gg: ATEYQzxQY1B9ICiQ6zdXizyaRnOKN8p0KgHxTo/tro53lvyp7jVJD2fO+D2Bt44VKI9
	bj5gC9dFHGp4mDuc7Tjs87Uhw7C9kCHttK5YjkU4ADf9NYmXzjFyPUIjc6NukCbSuiv3wK7vl5w
	poxTzh4hAgn/d+N4F3n8tFKntVEfJO7Pkfw+7UJ9Wm3n3dpzwDsWQ1Vk961f4kfIludMz9NTAC9
	a63MeuT/a5Izrw5zl5KSUf79/PrQw4Ek8dOT9i0UdWxJUMq9taVeWEVz/9aeiOfV321t6+6lbkE
	TZns7BvjD2+UMUlcfqvAtLCAzENf171YPwz7vfzBwmhiNpLfP2gTrt11hIV3gpOicqhjjAVwIVo
	IUdOH2/kMA0RUtMpZKcfuMwr2KbLvUmizNVvqhY5smkHN2a1P2c2X
X-Received: by 2002:a05:6102:54a0:b0:602:8894:b779 with SMTP id ada2fe7eead31-602aeb097e7mr4875649137.14.1774272096022;
        Mon, 23 Mar 2026 06:21:36 -0700 (PDT)
X-Received: by 2002:a05:6102:54a0:b0:602:8894:b779 with SMTP id ada2fe7eead31-602aeb097e7mr4875596137.14.1774272095387;
        Mon, 23 Mar 2026 06:21:35 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f44034sm503102066b.4.2026.03.23.06.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:21:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:20:57 +0100
Subject: [PATCH net-next v10 5/6] net: stmmac: qcom-ethqos: split power
 management context into a separate struct
MIME-Version: 1.0
Message-Id: <20260323-qcom-sa8255p-emac-v10-5-79302b238a16@oss.qualcomm.com>
References: <20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com>
In-Reply-To: <20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4863;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=FNVr79Fi6sLZ+qldLv+chKiF5qjCh0lSqoNC0bsdcWI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwT5Kco3rCH1VoOXFDR6Bta8LK7OVpeQox5VMf
 wZ4Jyd66j6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacE+SgAKCRAFnS7L/zaE
 w6WiD/43aaKifrVrtm996QHxWlyMyw5s93jMLKJudGiTSczX3O/TIKMXj794jsC0Pc4OBGPTqss
 Z0mROAxzMuBD37BojXp/vcgcGqNZg0C3TnWxCKWAD0K2SDDd9447LEJHMLcaGzGwfGnKplt0qbm
 rCu3cocM6WNQgCmHWphIBCmzdOCMkZ5pct7oC6hZab0GVwMyhgyhsySKKWvWYFbygWpbGAMZSDQ
 ThxdhrIA7NdGkT7ThmW42HafLfeF6UXMDVRtggBL0D1cvBx1ClnCmo1lxH1ADl+Xp0Fk+7SAnj8
 lwjEkCvhzKK7jkAqCH0KgccSCsJqZahhtsC0eF0iKElRDXmmKGwo6tur0en5yINcOaY4I3kv+Uk
 fjtiuJIeE6m0P/6OvTXroZK8880eODd8OGjhaHBGSIm/yyS4jzb8OyP0xNsOU+htF0R7OZlgDM1
 4b7y6O6RTgnyj078Siyr9DcyI5f34Lx7/MRkdKMbkGtMOr6JYo2fshp2DloitMISvkm/nQDfqSe
 auEeVmwORvOUbUdefPJR2mDibC+whHC9nxZT6cTrz/1eqhdFP5xKjPFBO9wKGaPbNOZmUXWIxno
 Re35XT5k6K2sPqmE1pKF4aO0C4casqDsVItnRxIp+UMKfESDbaj4Orb16Zc6J1TATb0CUihwqAG
 AWkCcpWGVud+Wcg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c13e60 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=TTAMOEIJuQy2Ho-tp7YA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: MmKa-6blLldj1GR047QVai0NHJ6JR-gB
X-Proofpoint-ORIG-GUID: MmKa-6blLldj1GR047QVai0NHJ6JR-gB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMyBTYWx0ZWRfX/yV/mTbwqZyp
 etN/PFjBaBgdY4x3T7pprVD5Db46x4Wuu3G3qTQBXSxB7tqHjenoRwiqkFI90U4LTGj5894lp9a
 FyOQqs0IzeFbP0AUaR8YhU/3B/4GIK9bd1tkAFOQ29AXMnryjG9XdPO92mW9N2YSg1pzffZcwiK
 mf0TK7I3VALP5dVIruvjdpJRMMH1eyj7A4dWZGDnhVPXjqKxk6IGxrFUX/GaiBgEue0qlvyoDME
 fBorWcQzpkh+UvYtiB5zIFwuQMJnfDfL4cnkGSqx997AgqhCgWO/5/aSEgA+0TYjUHO7D5AhOgK
 N4Abd3scACafVfdxqKGMkBv58iK968qXs2Qwx29ijUnQHCCtP3f0rhBLsCv6H6/Zq9PFDQE55mX
 x8d5+94M51ceigYD7QnpGG5/DtpHVUzyp/tgQ1PdpQbP7KL/PcZCZW0WuNDA1hvm89Nlc9wHKTf
 B7LO86PvKvARL/Mnlcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_062137_831152_284C37F0 
X-CRM114-Status: GOOD (  18.57  )
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
index cbfae18773c1193cd640f07824f5a66d68f9634b..f32ff0d9ce513d8270c8db9c549a79778549df59 100644
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
