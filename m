Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA19BF4610D
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 13:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Zy0xfFYONrGtwit2ldjuV59lTv4yUHvsmnn0ELOTmE=; b=3eipNK0jzGeAzi
	ai0w+glKM+a6XGTGbqK07I1aTMvMXen2MOWf3/B1XdNFBF5iTplh3nzBdywP3X9mlLdZpVU74fxi6
	4PnXnpV5nGxf/86mdcnd2H4DK0s2rcc+vy6uhjBOtbdmbNetsnGMZniBxg4aS3/AFuS8oNVHAZuvd
	je/HN9DCNXSE3gf9A2YkgC+tqbPWuowjiT/4412TaCC3apoEpLZDgAMzJSZ0Ut0UWeHpr0tqORZoX
	qvSQyR6QEF4BU6clyFVe6fFa9omB330w4tE+EK7j4rW+Lzzqw6WfYWT7mLvXWrZmLh/IrD2yWvm7I
	Y/Xz9mzoadLf1bovq0Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fE4-0000000Gn6G-2Edl;
	Mon, 23 Mar 2026 13:21:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fDr-0000000Gmoq-0SYs
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 13:21:37 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N83i5I1364066
	for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 13:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7uFBMrySSyg762knrQZ8WDLYNBJTFUwiXUIQ+8VU9Pg=; b=RiIZdJBx0zNOW65x
	ejEVRTugcPZjZkn7wavZeSWx1bgJ4HO5O13SdCGuT/1h4UgYcpyKx4Be4j0rQ9sd
	eb+aUVikEp/81INv6F4RqByBtm0eyVFj6TergholBecydJTKEiWDRg6e8Q8Dsfbz
	3g5PNMFNWX7j2tP6DjJFDX1XZT1dsYsu+EMM9WKX78EyzHTPZXJdHRtMhIbPHIYX
	W7W+2P9Wb26c1byE70y4RREdYvJwahTJOUbaNOa1a4tjjOXey6YdVWniEGOFh+sQ
	6Pn8+iE7R+2C0YV7WSy5oatRlJeuZ06nwuhJW5U+WivfW2JJL2evw3kJmNnbvKLc
	kgqEhg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31p793eu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 13:21:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b31cff27fso1493691cf.3
        for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 06:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774272093; x=1774876893; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7uFBMrySSyg762knrQZ8WDLYNBJTFUwiXUIQ+8VU9Pg=;
        b=IQhF12QYA4LPEHJ8kmGTO/KRwXtU532VSdjMpGEQvW8YTQ6hSFEE/gOsFmqwhCqew5
         TpRsvA+mgusLewtHNY/cgLP7rEBasrq4iF+/G5AJ9nRovvkZ25/tibvGxERkccGWLmEB
         sn/cM3Al0uv/Z1hEdWHNY3dm4HVjICdiC7+E/hSKtuBdBhY9IIYolv1FKPlNBHznwgsu
         erce+oPApl/0L0S1zwkgkWiMLE7raUITvzfNloYoxmsyUkIx+j50s5yMDLYb9BMA9OEL
         0xgyorCR4e/6fKZZGGEHivDG0pdTwX2zkVcR0yQgm124gYCh0iSdY+u1CVXouIshpF9T
         eAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272093; x=1774876893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7uFBMrySSyg762knrQZ8WDLYNBJTFUwiXUIQ+8VU9Pg=;
        b=sWUjpmqcH/F/jIpDsWuWJqkQbJ1s2eklUgnWyOuTGoU1SMsvDPYsHfQ1+crd7pbKHg
         nq7/jDqlXtp7mqF6SpFsakYpnkpuuJRTKcsHu9MDxQtWGz2UdSCaC2cv9qBoBwG7rBYe
         N7hF34e6alIj8CFkpOtK4ZQe9ha15S2FqRgbagvfTq6NhwYFFvARby07Phe4qhDfeltP
         WHF7p5+xT+IwZqN4ikMg4lYN2MIKMWxThngrnD7QxvUTMwNO7pebKm9ikZQXABG2HevG
         /iO3ENsTHNlIn2+crRS/2iRuAGqDq2pD9Pyp2zmXTasrQP5o1EVSrrfsgVSPJjAAmROQ
         tmBg==
X-Forwarded-Encrypted: i=1; AJvYcCXUKz48VIVZKKMJemgRFfHLbmcwpCP5BGkJp0IoaYFMbO5uQW+sXM4vsnF3Mq6I6oe5MD4aRic3916acQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ4H8Cneoki2vEX8+L8oTtDShTpwbxsgtcj0vqRmrYAC9MRcKw
	HYaCuI4K2p1MKOctY4ssPxOTsRDSo0kQSM2EcSq2A2FsKx5MF4sgl/SUz7qNGn919KYDzLkUXKx
	ov1CKlnWKvuNd2zM9AVqAabNo/V+OXNsu8MRPAGpW+tLH/ucMJdSL4k/X9mxU1L3xVnlfEzU=
X-Gm-Gg: ATEYQzwwlwFbm7b9nWk4hBFGrUEHqHSpG/hb88HrRRkHAsjhAVIIzjYQKcyanyrm8N4
	Lr7srAhLgt6aB9u+JaW+O0p5WbSp0v7LANDiUk/F9wUkx1uwEgAC1buAcYtCzju4eOEJzf3FnQG
	+hnBGnShcNlsWCamT2Pok7RGe6X7/szJoQ2cxTEP3I6T9ONrT/APwqHyPxqfhZwat3jzY8rpXfi
	hcJAiQ73zRVnWVyjKHR20V/6JkwEzT4PhYMujwM4X2/+tvh8xzIKljkGOnFuSXh+4hMApDfZu2l
	atiWrSgzy+82vqWhWu70lsD10pf5yItHlSy+I0q4IrEPEX0P2BZTuEX5tJ8cEBMKV9TPJUkCYkH
	nC0tAo41EgUuy6EikT4u6OFL8v3Khjt9RjrUbEDMUinUT3SA3QWxe
X-Received: by 2002:a05:622a:1c15:b0:50b:4435:5dfd with SMTP id d75a77b69052e-50b4435710bmr163897741cf.1.1774272093204;
        Mon, 23 Mar 2026 06:21:33 -0700 (PDT)
X-Received: by 2002:a05:622a:1c15:b0:50b:4435:5dfd with SMTP id d75a77b69052e-50b4435710bmr163896651cf.1.1774272092510;
        Mon, 23 Mar 2026 06:21:32 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f44034sm503102066b.4.2026.03.23.06.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:21:31 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:20:56 +0100
Subject: [PATCH net-next v10 4/6] net: stmmac: qcom-ethqos: split power
 management fields into a separate structure
MIME-Version: 1.0
Message-Id: <20260323-qcom-sa8255p-emac-v10-4-79302b238a16@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3509;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hJGGsrAtahyuAplrTDgGRPmhh8bkkO/cgS9bRedR9Qk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwT5JDL4jjZYhLTE71eK774W6IHVRe41TGruCg
 0vfvbkpEM6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacE+SQAKCRAFnS7L/zaE
 wyLTD/0UpOnzKn1Gecnm8VFBmZ2swR9Ssw5MP0G8PYCTVfO8kjLy1csYm7RO4vytNIo7oM8qO5d
 6VoBYjjJkWEAyasocz5DMrG2vzcX2Novp5c6crEUytqg6DMJxkczKlStaI3yrLD+2Em58/aSiyH
 ++z/X3cGkMmKuzrOnAFcpNFNf0VBfKCugMPJX6yzzDRoSGvz3te1p6KN+ydlpdbt4xreWaEdjS1
 e4W1FGLBE2vS/WNLgzyJ40iy2o7uylNx/A5Dlg/TU+DiIj2TV6s7WeTTzsAdkAnuhyn1XjwVA3a
 /BnjOiasTbtH41mXdnzHxq48giidbbU/VLfCb4h4kwAf4pPLIkcXsChidQONJzOPpKYimqqR7TT
 IZfYtpFtg9MyioYyCVYULzUy3RzeU53Fedhy35Jkcq0RnPvLWA7WankUwL3weBHA1pbjqpB8+Sx
 MISWwp1ugyrC2Z1QjPhvn7z/PzCuh+WUQ+/7dDclXr8c/kMNISn8BX8YGkclxAt8HYxh0xKigxo
 toffB6LtQ9rM3LFay2BEeO4MZOmYVwFqKG5bdE2ISipRn5c62s64ZPDHd+XOWn3FLEK3LOCP4VC
 x9gzzbiXpBXB+TUP9CgQJ8r0S7zFQETvZ0QjptxL01AChqsAPptuNNOjo/p7CH5PLsWHvc2UWyA
 +CboqIj/Y3NjnlA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=69c13e5e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=KCp3k1edx3YIq9yPN_4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: _CJ0WbWmLxOcV5DmFhEvefsXvn6S6odO
X-Proofpoint-GUID: _CJ0WbWmLxOcV5DmFhEvefsXvn6S6odO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMyBTYWx0ZWRfX2qy5Ur/Y7HhD
 FCeUr6u1GQMCE9Un/8/d3Dqcx91iW3xF1JjUFvZdGebYTavmgQWu6RAmtxRdMqk3NuSmCp2RtuC
 DAELfJRgGlXccUfvX0tTAd940druklY18l/4dE1DeQTFySNVdUEwa80vuoIywo+Pq4SGoGeyGSG
 RlOttJa1BkqMDBV67JbtYFKfEadpPv1pJONkzWIsTDhSzLZIUOx5kR8UbedkleP9wQSFVoI5MLk
 tBGlT/XOCQ5aZI/XzH4r0zuzJ1uyQ/CP2wZcp9bnIwi+FphtWtzci9mOPWXhtK8KxK7LBhLdq+6
 PMPVnOt1Y+RytD1Y7g1JgCwcJvBrsdQ/Sqw8nyy6dyQptSB8hVIpdPLXLsE23Dc/0f/otg8R4KN
 MUroJMEqhjKRW6i/jejq71buWX45EMI6PdoRvTcypdH0eRFBnHf1Lg7byiK40NgCVUwyDVC6V1l
 L6bVydioBDLIMKX8pSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_062135_293582_3E37DB19 
X-CRM114-Status: GOOD (  17.76  )
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
