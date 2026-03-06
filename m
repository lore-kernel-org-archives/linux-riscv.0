Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E9DFCB618
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 15:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eAiKOV/4UikN3ZUsQlJx+8J5nL6lH7CnmT7LX5cG9bw=; b=bY/kSUbaLcrh3k
	qtabIha6htZd8EErezAbVkZeoxx0lFYFRWiXiqcC/FbCQrtQYRYP7ivzSA4+8SQdLZmUT6EGeZP66
	pK3CAlxCyGSfwqLTBjdpK4y1ho8VQ7AVGIRrUO9BjpaBUa/Zewl6Ubhc1+Qezlz8TCDVhSzWWFBgD
	j9y6WICwN1uKqTHhZVaYRYHAfohfA0jEEn8LMxsKmIual34QENj2hjBclvY9hgSxW6h8hBUvKw2gg
	59gM2B9nRR700RJM1JC6FDuNYYPAVzR0PxXQAno/W8Z9gJKzCwRBA8+Hu6lvOe1obppCK3EX8ckAf
	cOVwTAcsRISC++hNjtnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXOt-000000044Ob-0Ikh;
	Fri, 06 Mar 2026 15:47:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXOl-000000044E4-19ci
	for linux-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 15:47:37 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FT2nn3905106
	for <linux-riscv@lists.infradead.org>; Fri, 6 Mar 2026 15:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y/t0LAapdaxFDy802rA0EzwSzk/87/UWs/UoU9fhqHw=; b=hcDqzWERh1YwUlSX
	0mLHqLb0FBgNbAXJzPPEEEsVRDvMJRoeS3eKlpjKMjt0R9278gFh0jv84RrI+NwW
	SkGonXiI6BZTbT4a8NQffujPwc50phY+tos5pI1aDCv2bXiRpZ54+Q5MR8hNyl1P
	8bO4fo08icbC8OV4s1n0KdjTGfp3OhZrBCk89P66q9aehmev514RekhETO0QAgbg
	roqrTRRoJdDHbYO/zzXM3xFgftaHtm7kEE9DzQqQk3bdkKB0mNd2juPZzEoAQbuf
	bC+hErkC3/3+3fSP9nkMFwIIyrKpzKI9SZSbdXhc2X83/8dfNMSFZXULkUTAfX92
	47pzgw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9u95tw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 06 Mar 2026 15:47:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ef98116so6138354385a.1
        for <linux-riscv@lists.infradead.org>; Fri, 06 Mar 2026 07:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772812049; x=1773416849; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y/t0LAapdaxFDy802rA0EzwSzk/87/UWs/UoU9fhqHw=;
        b=I7fGnfOK+q4SIiL7WYaOjsqMaOboEBcGBWF+KkGzcnZJbPkiGNWSKkd5W2P7ZgR0eP
         S0iNZ4DlPR9pMOT732GXXlinuZZdwnpRa8ZTVpksBvIeFU9ZVPyS8gk/qeTN4GHxA7pw
         elqj3rclX0hBJQvfCMnzJwhdSzlDSjeZniKXOYqrQeEkMdXa45BLdQjuu0KfGgrXjIEN
         PJOGL1Tn4fDGyz6LxP77e+OCJGI9QEBhsQF4Ph5yt7fhFtFfRZXObOrl6IfGN6PPgIFY
         dCeOgxrqwzVRcycRII+hupvS/5W/KplhjYtsIxg4hs89X+sl1Zd1JH2VJcoIQIqj5ZB+
         52ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772812049; x=1773416849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y/t0LAapdaxFDy802rA0EzwSzk/87/UWs/UoU9fhqHw=;
        b=cb+4cLjsT/3cr1mPgMptT45TkvviKKzLjRBaEZqguFGrYkzW6aDg3d2q875yTf7QNM
         ezhlQ43bgvcB0beBtUVRH6hh5oao2n+fFup5P7ykt07MzumCtivyWTg9+epq0ag5h2K0
         ag8PG1dtMTxhDoyIMqVnlYw4Qk0LHOKf/OUcBjX1VUt5KxPTfvNrlbn/3fRqPPBjS16c
         MNAOwIoDUnq0OvBw5wxiAcPOTUcUvxap1ANQoTQoeZKf2TiAp6Zw/BtSA1JEAttXd3Ml
         XgkZ9g00EVpX9NBCc5rplDojRXBBEjDMKbHDEmC/nizhBhx6jMRBiit1eMaKdkWTmtlA
         UjTw==
X-Forwarded-Encrypted: i=1; AJvYcCXgmqJLBbSUtTa9wS/Wifd7OBxngkhPcfaYlkT0nKMRPEDRdEswa0JxynUUi6sw0TadR3gKIQNIXfeDeQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxkd4VmKqgg4Kr4xPfP2PZTqBuHRRKR37Lg5fsT2UDX/EpInooO
	fOXctWCEQvmONzQZhLThK2zlNJPKV6Alo3Pjv79JwlTffeO9W0LlRf2Ois0Koo1X71LMDD7oqnY
	bUCUQqz48vWJvoLhUQyMBMSvDbaGOUcEZTQw6TF3WtuqWCbgnNur/EQAWim0T/qWarysMpxk=
X-Gm-Gg: ATEYQzyDWIqnNwaYn9W5CmE1mW41ckVjOTfQhoybK7FegEZvrIfpbUDBCUj4HRiuhZq
	UedpDlofQV0+6xI2XfUr+gzrOx6WoF3QzrwnJC4Mo7dpR2WK6PWV1xyG8rSng8aVFam6XoCuoY4
	PF5NA6Kdv01a5oLX8D5s1oTrtztTH/CAv2gyCsI/cwXGU+zpo1Rv2tA1VPDpWon1iNd2VKmoiEU
	2Jyut+qSYcxGbdB/K0VcJK23BGVlhcwX0CRlyXG68Qsx16pQCFEI9EGHg5AXJ0+5wdS/QCpe6BO
	2aOhKXepAbNp/w/LnLWksQNWzh2Hoo/0pqwofPmEDdqLK5beN7+lCE53aAP/H6oCVMwgQGPmFuk
	nE0ylEVBYdBrppAMoojO467dYmvnPdooj7wd+1Y1WjVUcUT8KQUGi
X-Received: by 2002:a05:620a:4589:b0:8cb:4ad6:6aa0 with SMTP id af79cd13be357-8cd6d514b2dmr337843585a.68.1772812049329;
        Fri, 06 Mar 2026 07:47:29 -0800 (PST)
X-Received: by 2002:a05:620a:4589:b0:8cb:4ad6:6aa0 with SMTP id af79cd13be357-8cd6d514b2dmr337832385a.68.1772812048763;
        Fri, 06 Mar 2026 07:47:28 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6d2b:ebde:c946:11eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae35cf7sm5122767f8f.26.2026.03.06.07.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 07:47:28 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 16:46:44 +0100
Subject: [PATCH net-next v7 6/7] net: stmmac: qcom-ethqos: define a
 callback for setting the serdes speed
MIME-Version: 1.0
Message-Id: <20260306-qcom-sa8255p-emac-v7-6-d6a3013094b7@oss.qualcomm.com>
References: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
In-Reply-To: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1989;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Bz6/Hr6N/rEPerZKq1+bTvk1x+ewErg9P0amGNZT72Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqvbwFVICzo2tr1z/2IvJF2RamjaFEbJ3iPkje
 6PT7sJJVXOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaar28AAKCRAFnS7L/zaE
 w+txD/9F2WX4OEqjZx/mkaQtwCJT4URVHThB5tZh3U96w9/QhL0ahuE54CXTnRio9xqzuW3TOz/
 DB5lVS7sPFVkaZyTgnT4UcCQMbeD2iDkSF/03/ldFyWCMSbZW++hxfJTsuF+sl5S1eSfz3rdfjR
 7PLeDU599Hf7K05uypwdjdMknTkGJIxKcYFyIJBH612vq8bD369ugOwR4c7Jv5ZtFbyBohzNAlK
 3oVTiJL1X85OykK67R5QreXZ2PgAm1UFP7lO29HttbssnGmHeOCIo2oESCahiQf1juZaHaz56fr
 xVz7Nz2a2lDElolZZR94K3sPRtNhN/8fPbpaVqZbSkgncrxQkl1Jtkmx93k1kAsyVeYFIGTrvZU
 7hdo1O7lYOlziI1POq6TsG4Na7irnbcnQSS9E3nK/dwPAlPkJIj87UIkkINTZou48tczQHIlulM
 KkgMje1xw06xe3zzl81sRKeKTmYQcrRgf9CPA6vUS7yliVZ84k6xaOrCMoTljmo3uw5wQn9SxA4
 ZZSHoV84qrni0piZgFEPrnBfQyiGf89U+7Xue/83jlkVgiU2jBrfb+aKtrhXql2V1JdK6mtztb6
 Zx9NpawD0TXPpx1ym3Vsre2lCLAZ+oI+78jFhKtA8J45ESShZbFG0RCvrrJ/6I9dYYCszuMYNNm
 Tn7kOYWiciMO1PA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NiBTYWx0ZWRfX3B+4vVitRfx8
 p1hUsi0WT3R7poILRuW/mKfkaISOUfyNnDQVs+CgbLXmeojqkLni5c7Kvlg6TgfSnKHKfdyz8ZU
 jfS4HdQvriBBhAwqqpycQtk3LKaCGWekOeVHSqPd5VTVatRz6NVe1YD9cjLLMoH2RCH2Eof4Udy
 QiNjsJLf280W89ToZDs/aLs60fIMS+lqxpjZmgQave7A8g1QfY03talZOL1qWarMlzNB56aEsDC
 yH0vwxHGJtFS+PwTiV2HNC/1fHfHQ2pstmGYJdc8Opg7Q21KBDxtEoWfg4tZ7Uze3JMh9cBhc9n
 MRW3PFW2juINFZp6RqduSxBFsHlVjrqiVPyX65IKxqcnOTMUUOw7nkiou3BLRR1Z5gSUkvaEO/3
 m9yI/XER/VzaZbsBMLgWjUbo9+MuSLXJGj1wXxmbn4nRw3Kh/KPNoicQlQdFVpwezU0UqyTNeqa
 /RTYPcE9jIFURxVlxOA==
X-Proofpoint-ORIG-GUID: LwloyD3MuscbpJfTMFqnQdjir3TI_ysc
X-Proofpoint-GUID: LwloyD3MuscbpJfTMFqnQdjir3TI_ysc
X-Authority-Analysis: v=2.4 cv=eJoeTXp1 c=1 sm=1 tr=0 ts=69aaf712 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=0aI5G4bYpHrJQa0XwroA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_074731_536929_921CD1DB 
X-CRM114-Status: GOOD (  14.92  )
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

Ahead of adding support for firmware driven power management, let's
allow different ways of setting the PHY speed. To that end create a
callback with a single implementation for now, that will be extended
later.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index b88de56d372c370aaf4929d05138f3744c54b1f1..038ca4da3cff4eaac1d1255573f32e0c87701e78 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -119,6 +119,7 @@ struct qcom_ethqos {
 	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
 	int serdes_speed;
+	int (*set_serdes_speed)(struct qcom_ethqos *ethqos);
 
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
@@ -616,11 +617,16 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 	return 0;
 }
 
+static int ethqos_set_serdes_speed_phy(struct qcom_ethqos *ethqos)
+{
+	return phy_set_speed(ethqos->pm.serdes_phy, ethqos->serdes_speed);
+}
+
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 {
 	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->pm.serdes_phy, speed);
 		ethqos->serdes_speed = speed;
+		ethqos->set_serdes_speed(ethqos);
 	}
 }
 
@@ -843,6 +849,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
+	ethqos->set_serdes_speed = ethqos_set_serdes_speed_phy;
 	ethqos->serdes_speed = SPEED_1000;
 	ethqos_update_link_clk(ethqos, SPEED_1000);
 	ethqos_set_func_clk_en(ethqos);

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
