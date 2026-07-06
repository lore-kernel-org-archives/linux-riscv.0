Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DF2C43602
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 13:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HKM+cqSIEU7Z9M0dNxnZVOG4sugA6AbYKgPRXVAjub4=; b=xtyNosiFMcyvzN
	aVOdBdK6VXjNW4GLVbF1Rd0jGuCbeN6BWwbf+NQkfOfeXoMv3ZoLab+mZA5E7jgHqk4oqys2x02wE
	Ze8FgVQXzsEMxRhdSFqk8uYUEVYuOeHhoNR2A/NnGxKzXo/5Gw4p0dpPYLcJpi/1kDH7KakTkG6Gm
	yFqk11vdhEnCmQF1ifwJt7T4dfCb1JIzmako8KIka5JOB8MrbSdOc+P6JOyZp/2faa6A4Kxj8KimQ
	aHGy+/uMhnJyqPGHQxVhIZtex64/xiEyKVUWOw59Uw4x47daPCLb5KMCLfHvloqwFGYJggdgjtMzH
	Gjo3pJrh3+8j2RpJ36+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjFz-0000000CZCl-1yVM;
	Mon, 06 Jul 2026 13:21:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjFq-0000000CYsR-0gfb
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 13:21:05 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxEWW401617
	for <linux-riscv@lists.infradead.org>; Mon, 6 Jul 2026 13:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cyAtb4Z5AA87tJM4aAbz48OZuPpDfL6rZEVyCzADtro=; b=DKOnK/pElsldeHy8
	xf7bnbvV6CW8Ru+3ADXgRRZ+r8m3JK2M/rguFQH/cIT6LfIpONjYgUWDcfZoP5ep
	B55O9SWLdP/00JALwAaA6neWEilJBquw8jxYgv7CC7/SrX8TRvXj+oeJlZHgQz3a
	H8W7KX3wa2nOAN1p3NsOiVjbqft8jrukYK0Ss0mpc0UMqHroH+EbedOTwqvsa0DL
	6T6CsakHkogc2vuhB+AaEYHudxhP+wcmlTiyt7zZap54J2k7bC/Jp5w0A114MUGy
	8eon6ZYoiTIkLDp0c10S7tvWRu6m8cU0Y+uO2b2oZK8HyVCORWflKLrw5j73X5UQ
	H19swA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3grs9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 06 Jul 2026 13:20:57 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-59d595bfd94so1055036e0c.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jul 2026 06:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344056; x=1783948856; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cyAtb4Z5AA87tJM4aAbz48OZuPpDfL6rZEVyCzADtro=;
        b=K+yA244s4svjfyxHAdDIogDx4Qy+Cza78ECv+EPTeabot0cz4eFT7fSkIi2YX96i9y
         CfNLhgUF+k2DkNXinZFV7RzFLFYTSmRg7gFt1Y10DSZ+vl54QVyAXAzF+GomaQLTKvaH
         XO0HU96t9vDiQkwSYQK9JONJ3wabbjUwbZdtLLRZLs9evrN+Ix5rwSEmP8V4cQJyeLEj
         1xe/DalNCoqyxEov4DM6JDQ0OKlJLiv0RuWYyEEc3nh5eUwyH5XcUFqKOBkdMoR5zTpk
         U3m8ReYImoAfnfGjnTvS8pD30zRPAP+CrCputxzMAKvjCOKS6dJ34y4+LC7aIYg40d7U
         pc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344056; x=1783948856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cyAtb4Z5AA87tJM4aAbz48OZuPpDfL6rZEVyCzADtro=;
        b=IyZYD/l0UqO2gleDup2xej6RXXZDF7TdSyB+8uRd9S4mpmXJHAqITNqq24vhy5rd8/
         EcMHmuDF1nrSfUAPR+HHbM4nioicylTuu4y+zKB54eIfGceDdmVQkr/P8CPKTCZIOzX/
         PqN8AD4PQT3yFpeE7jOrM5/eKWzA5Uv3k4+bttISAm2W3k5XnJ0KvOwLbxexjTslQjUk
         lUPQ8r9+f3fJf7wTETjT/NNeYY+CQvMwOeKXHr8VSFuKlI/kKkCTk+d/JX+TuwotOCo2
         5UMQ5MOQrhz34SFWwXjZPbK8FAHIOScUkfOeYKePNOdtAcTwhbvyUXW0jC1qm8hMu6ss
         EYVA==
X-Forwarded-Encrypted: i=1; AHgh+RrctFPj3BRp9UQ4ucPUdz+b3f+hFyFXcEEv+MhYqCIrASySb4hO8OpkdHdZ3GjUEMBUisq6q2qLOFyzbA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmElINMifXqY/4GUJ/YZ7hqSzru59NMwrHHizpLEhc/RAN23e9
	ZjrXWxeqcfmQFgVS4v0FffJ22T7cCgUyJg73WTPStOXKKkmqSVLxGIYQEseOyJkfSosAqC9MU2A
	MBsgWoVIn+/7wY0aaRiBM7tgrKAFqJNGPSwI+IfVZloJyF1nTCghDt1PPM5iwEchD18ioQVU=
X-Gm-Gg: AfdE7ckzCHdHoEUV7NJzvLzlS1mkgsLqHzWvzcOQMXh1o7NuRf/2tK4yoYdEr9jTTsb
	+Z9UXChuB0go1B2FesjFgR2kOtiaLioFwAj1JhRb4Wmx7CvRsOhIhRt1RThvFZDM53fEAA9rghw
	n4+HiaDzOggBNi6kEQyewytKGetpl4A5j0uBI9ffJoak+Di8A3vyzWYFN+H3MuHfdNHKd4PlUlW
	mayBivBGHscjZI9jJY4y/IFtgS2LxdaIyH9g2SJzFS9n9CuuAf1YM7w9Nilae9I1d0yNWTUunAQ
	Q6oRh9uN9oowMODHkt4Kyk+yi6Ew4OTRdmLADr1gKxmE5q3yKWlDTXPeV6gneQ3OdHCEtfPHCRg
	dYZ0r6sQ8P3W+Lgb/37YV0e96QOGo5oFq/kl4H+j9
X-Received: by 2002:a05:6122:511:b0:5bd:89bd:3543 with SMTP id 71dfb90a1353d-5be908b8787mr239523e0c.12.1783344056475;
        Mon, 06 Jul 2026 06:20:56 -0700 (PDT)
X-Received: by 2002:a05:6122:511:b0:5bd:89bd:3543 with SMTP id 71dfb90a1353d-5be908b8787mr239501e0c.12.1783344056002;
        Mon, 06 Jul 2026 06:20:56 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm25910584f8f.37.2026.07.06.06.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:20:55 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 15:20:21 +0200
Subject: [PATCH net-next v12 6/7] net: stmmac: qcom-ethqos: factor out
 linux-level setup into a separate function
MIME-Version: 1.0
Message-Id: <20260706-qcom-sa8255p-emac-v12-6-e3ab1ecf2901@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7477;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=o5XoyX1coHzwS5MK4Nao0YTpRLZfe0Qwh6ArwM+K5eE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6ugRe+a+GryDL1J76nq4biCeYd856FUv7Nyv
 Nf2nUO9iSWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakuroAAKCRAFnS7L/zaE
 w6xiD/4+J5LNVCG5Z86VszoIsYGwT0dJEsVEiPC6rDFJKf65P1O47rUHECIq/QgsTO4TeJV0Pkd
 ab3Q6+oIERLPQfojD0eMzzMAca9aRETeb/CvucQmf5KfAuC3k7qrHiy5aPp1kKyjr0HB7hRIHE3
 v9G3axp9WJBLUayEl/JRdqs1SbESZLn/HmbpEov7ZYb44LdGVUsv/YPPuWSROOtDCKeC1/vJ7Rb
 aJoXwVp8Gq9Au1mDdmEmoqxLlHuQke0ZOInkLmcFri9JGlRNTRn3qHyt8VrT7UdX7ZJIr1k1/rJ
 6yVpByKuinB6zO5kl83DP2prFLk9ftB3E1NH//h/jYtWiinMEg50PwG+28BiK4ZTirU1T/C9Gpo
 jhB4fZa28P2VBSZojIEnPHYbWdtREAmHj2b7un/qpFpoufMzt2ESaqqjnWTrZZd+tzB6En3i0Sa
 z5ji97KT/lIXgOoY2/phJ/mL78UhCQglleBH/+hp4tyW6JzI/7auxlhIe+GFQlHfMMsfkHpEG5r
 ar37vEBYOhU3unaysR3FjsqboJbIbSw8tsvCkJXQT4RvBj4WFDgFUz8xCFpL1UmI04zstLuaQAA
 bPKVNM1lzHbsMMgqIsnTq5U07z8kSEFKvSNHMe7JrLwHBv2QI9Hx1mjLUVcnpdnnIx5hWYjqDfP
 pGRhfiMiJlo7QGg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: CcH-rOiCdalWY_QAQobkzpnkPg37atrA
X-Proofpoint-ORIG-GUID: CcH-rOiCdalWY_QAQobkzpnkPg37atrA
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4babb9 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=dj4JEN0qHmgdNMwDfcEA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfXz2l0ecrIVf02
 OW4kDMg456Kn7lnJ0PlRB1MW4Ylx+jcNbcwKgTEAZ+NW7ckyz7+i6dkEFso/OyTfc0T0i6Rqt72
 4hjEN+2NQUxDoXup1GWEPH04MSniO/LQlgIukH2JUKQrCrPu8fLisTyoaZq/BwAVwTEuDXlykQv
 XT1ADbfCMMSmgRdoHalKWrKoc1A/ynHyOuoI9k47x0BYdVHjQaHi4gR5kCUAFWgx/ANtHWieOM0
 TWsjKzMp8h6ABB8rAJ+Wn9K6I2/4ZTOpQjFjdqegWlA3MiXRbOcm3QLzAh3lBj4s6v3hYHfOUDu
 VLep/f0TxUSDnaSw47uMUmM8Qjlxwh84h1n+GevScvppX8t/+ZiDh8B4uQmY9hIxOMjy15HvP9F
 nExyuCz9KvH9zYm48dX1yPleYvyEQel7kRsTdjsUv1j0aadJAzRGJutQkuhi2DtbZWWjHsWO/WE
 +nFucNrsn6Bx7G7tBVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX8UMEAZpGUsiL
 MKRHlHZNne0ftgPFNOIjYUaOYwhfSmCq2SCBwygJbgqVEp/7Bat/iNH5hF/KQ0GIaHQU9z9uiq3
 5t4Tem/Oqn5kf4+6lfPtUEUws/kng8o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_062058_251512_917BA26C 
X-CRM114-Status: GOOD (  21.26  )
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

Ahead of adding support for firmware-controlled EMAC variants, extend
the ethqos_emac_driver_data structure with a setup() callback, implement
it for the existing models and move all operations not required in SCMI
mode into it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 99 +++++++++++++++-------
 1 file changed, 68 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index fa3447b90315672d706d5ce7d710bdec6214e4e6..f379570f80680e96f027873cda6a6bca398e22dc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -5,6 +5,7 @@
 #include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/phy.h>
 #include <linux/phy/phy.h>
 
@@ -81,6 +82,8 @@
 
 #define SGMII_10M_RX_CLK_DVDR			0x31
 
+struct qcom_ethqos;
+
 struct ethqos_emac_por {
 	unsigned int offset;
 	unsigned int value;
@@ -95,6 +98,8 @@ struct ethqos_emac_driver_data {
 	const char *link_clk_name;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
+	int (*setup)(struct qcom_ethqos *ethqos,
+		     struct plat_stmmacenet_data *plat_dat);
 };
 
 struct qcom_ethqos {
@@ -199,6 +204,9 @@ static void ethqos_set_func_clk_en(struct qcom_ethqos *ethqos)
 	rgmii_setmask(ethqos, RGMII_CONFIG_FUNC_CLK_EN, RGMII_IO_MACRO_CONFIG);
 }
 
+static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat);
+
 static const struct ethqos_emac_por emac_v2_3_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x00C01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
@@ -213,6 +221,7 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.num_rgmii_por = ARRAY_SIZE(emac_v2_3_0_por),
 	.rgmii_config_loopback_en = true,
 	.has_emac_ge_3 = false,
+	.setup = ethqos_hlos_setup,
 };
 
 static const struct ethqos_emac_por emac_v2_1_0_por[] = {
@@ -229,6 +238,7 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.num_rgmii_por = ARRAY_SIZE(emac_v2_1_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = false,
+	.setup = ethqos_hlos_setup,
 };
 
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
@@ -261,6 +271,7 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
 		.mtl_low_cred = 0x00008024,
 		.mtl_low_cred_offset = 0x1000,
 	},
+	.setup = ethqos_hlos_setup,
 };
 
 static const struct ethqos_emac_por emac_v4_0_0_por[] = {
@@ -296,6 +307,7 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 		.mtl_low_cred = 0x00008024,
 		.mtl_low_cred_offset = 0x1000,
 	},
+	.setup = ethqos_hlos_setup,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -685,6 +697,58 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 	netdev_dbg(priv->dev, "PTP rate %lu\n", plat_dat->clk_ptp_rate);
 }
 
+static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat)
+{
+	struct platform_device *pdev = ethqos->pdev;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
+	if (IS_ERR(ethqos->rgmii_base))
+		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
+				     "Failed to map rgmii resource\n");
+
+	ethqos->link_clk = devm_clk_get(dev, ethqos->data->link_clk_name ?: "rgmii");
+	if (IS_ERR(ethqos->link_clk))
+		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
+				     "Failed to get link_clk\n");
+
+	plat_dat->clks_config = ethqos_clks_config;
+
+	ret = ethqos_clks_config(ethqos, true);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, ethqos_clks_disable, ethqos);
+	if (ret)
+		return ret;
+
+	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface, SPEED_1000);
+	qcom_ethqos_set_sgmii_loopback(ethqos, true);
+	ethqos_set_func_clk_en(ethqos);
+
+	switch (ethqos->phy_mode) {
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_rgmii;
+		break;
+	case PHY_INTERFACE_MODE_2500BASEX:
+	case PHY_INTERFACE_MODE_SGMII:
+		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_sgmii;
+		break;
+	default:
+		break;
+	}
+
+	plat_dat->set_clk_tx_rate = ethqos_set_clk_tx_rate;
+	plat_dat->dump_debug_regs = rgmii_dump;
+
+	return 0;
+}
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -706,23 +770,20 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "dt configuration failed\n");
 	}
 
-	plat_dat->clks_config = ethqos_clks_config;
-
 	ethqos = devm_kzalloc(dev, sizeof(*ethqos), GFP_KERNEL);
 	if (!ethqos)
 		return -ENOMEM;
 
 	ethqos->phy_mode = plat_dat->phy_interface;
+
 	switch (ethqos->phy_mode) {
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
-		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_rgmii;
 		break;
 	case PHY_INTERFACE_MODE_2500BASEX:
 	case PHY_INTERFACE_MODE_SGMII:
-		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_sgmii;
 		plat_dat->mac_finish = ethqos_mac_finish_serdes;
 		break;
 	default:
@@ -732,24 +793,13 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	}
 
 	ethqos->pdev = pdev;
-	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
-	if (IS_ERR(ethqos->rgmii_base))
-		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
-				     "Failed to map rgmii resource\n");
-
 	data = of_device_get_match_data(dev);
 	ethqos->data = data;
 
-	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
-	if (IS_ERR(ethqos->link_clk))
-		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
-				     "Failed to get link_clk\n");
-
-	ret = ethqos_clks_config(ethqos, true);
-	if (ret)
-		return ret;
+	if (WARN_ON(!data->setup))
+		return -EINVAL;
 
-	ret = devm_add_action_or_reset(dev, ethqos_clks_disable, ethqos);
+	ret = data->setup(ethqos, plat_dat);
 	if (ret)
 		return ret;
 
@@ -758,21 +808,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
 				     "Failed to get serdes phy\n");
 
-	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
-			       SPEED_1000);
-
-	qcom_ethqos_set_sgmii_loopback(ethqos, true);
-	ethqos_set_func_clk_en(ethqos);
-
-	/* The clocks are controlled by firmware, so we don't know for certain
-	 * what clock rate is being used. Hardware documentation mentions that
-	 * the AHB slave clock will be in the range of 50 to 100MHz, which
-	 * equates to a MDC between 1.19 and 2.38MHz.
-	 */
 	plat_dat->clk_csr = STMMAC_CSR_60_100M;
 	plat_dat->bsp_priv = ethqos;
-	plat_dat->set_clk_tx_rate = ethqos_set_clk_tx_rate;
-	plat_dat->dump_debug_regs = rgmii_dump;
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
 	if (data->has_emac_ge_3)

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
