Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4087DC43638
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 11:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eezU4NRBEjIcFk4qJ+OoicKmBoWv4WVeU5Nh9tFVOuE=; b=xyvFnnm0QXBJUW
	uuEHnUpc3sT+twYVK5FbiHwYI87ht55Ssf5gdOfDjeiAOsktpIzWivyNdBQs0AsNJ1tKw0SxspAQ8
	HgvGNmnlHej1DvJCywJegqiQwoCGBZkxKl09f3mnqUg5GdlCQM77hrykT/oJiMIZo3vF060DgNa3p
	r0z9E/oOmh3pldZlMaiY8pLhLd4YKfmet+oRnUQ+hQ3sGi2tnBFidJzkGPr4gGbsUrW3KecmVMnox
	X5xrRep/gsoWRMnwvnCmhthJgNDSrwKF2c2GT1VUApW3/B4gaJu4m83ufwfmpLlSu8g9WGE+ranZ/
	fneNer1mrlupcZymPxDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weABH-0000000ERmc-1IsN;
	Mon, 29 Jun 2026 11:29:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weAB5-0000000ERSq-3Ldw
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 11:29:29 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT7ma2627945
	for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 11:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=; b=B7fmsNYRL8aorCjh
	GkGtC15NuXFLrM4H5JOnAeJZRw4ftYA3jmzaIPdv5tLcXoW3w9ni09DVmLePuMCj
	MCsX+7wJP89eJIOZvk6wKaeLxVpixcWzjkwuqLkmksY3Bh7DytOgz88ZtRwu2OLU
	qmIxW/7IU5P+U0dKfbmMJH3PVd/jQIXXWHdtGc+Gn2lWkHWcVW0Tlq6TJE8Hqx2b
	Y8Hb39FxYdMAGHxxiApziNKhbRsn10Xx/Vmp7Xvj+cYfYYbRQxE6O5JxSVHLCW82
	HoDuLdqBAUCeagHW/5UyHXnxKK8Cfbsk+6x7lYFVNnq0bPOh4r2urwD1lWpAQ31P
	KcN7Fw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgrmnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 11:29:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915d3261c5cso668909085a.3
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 04:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782732566; x=1783337366; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
        b=j3lmA2yyXJKHrDvcoqzmREmZaNWeqjSy1h6RjOm05/PndhVVlSpsrXWT4MOuHyWEsa
         jcyqcqn/fHYYUA2RJ4ATlMPFG84elej+S03xKLBX7FZz6WBT5ngNxgfN+WKh9eJNjZ/i
         9HpLXEP9G5xs6mF2gk4FU8CBJejs+i2l+r89NKsB6bEMLsy3TDYnjJsaXI5+MYB3rJtW
         TItSWIelQIEN3B+C6tyzVITZzthK1f2bLtU1NSM6UOVLSEMCAPuy2fHA2LDqu3T7UgF6
         E1KhsQGFvAPkb8dC6TNkwZU8uc1I2S31Mg+tCP5KjiFbLNyFFEzi9HvVEV8iJOgeQJtZ
         zlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732566; x=1783337366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
        b=KLHFSTFzHp58xnXdFghq2EZ51QJ+HL7lLI+esByYeYPG43sMxH3BtD1jKaY0PIVtyF
         T3T7ImrAbbAN5h/k7NgI4jk/W1VYokrHQZgp58Q3cHWVxSF6xe28DAo2bF3XlV1DpDL9
         i52ETRUHc9uTcQ0jqkDu8ASlWXlwakmUIvNhKQfBnJ2mPzkhy1DDdi0JAgiYe5YSXZI0
         IS35tZkU5+t1aw6PwiTwIsYqcTirbh7e3VMoCSaT9oB2UdShrRNKUtXfwBEZ/wijuG3v
         zXTbZsoPaN0+YIYKdmAdUqyWkolK7s1Bk8YE9ipk4UVEcq1MTxf/mEUgC1AqQswqlSY8
         7vnA==
X-Forwarded-Encrypted: i=1; AFNElJ/HocDXN5t7UX4g/hOAYH3KNTvA/uhF6Pf0QqGEsyg9UeZfuGOh1qthVO3784vywpyPtkxsMHcyIAaSjA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFBz25vwWzzyAXEfGRekJsZILvESKxKYv8cLDXtDq3Y2MpMwsf
	NCRD9HKwmH7Ax0ZQxXDMvpLGtpcVrp6iC+0GM5XyA3Nt/OCCaTX0aTiLFjt6Gm5MXTkUS0dntio
	otr4DOXrECHk9SoM9h+CWJdq6FDrwV1OdidCVF53/VCmU7v3tv1NIT2pamYjmqjj5o2tyfTA=
X-Gm-Gg: AfdE7cnevEB0MbQlb6OwUG8TBDhoPCxZonKM3I18fQrALCA4ca4o5WbIopgVgDpTAsI
	T0Eja+DB/Zn9fMkGjj2CXUtWc5fuYuC3bpwHLyAxBm/sc2f7NxmsRBIiNx9BS6d7fjDQbE/u/Ng
	7jjR1v6PG1Q9hw6qnuCkPLHOb8j2Ho/ijLjh4VcLCYq/kGFS41nbehz5ujEUEPNWrA1Fb67U9EP
	w2j1fz0hqTjuV4qhg+7jOTByH1s5ZtwYBmFD9H7eksgbzNHD1vPf8lUi6qR+1OoAql78c0X2Uks
	KxyXj3XvAbOtuvHQkL1evgDyVVQXjoCqusJ5NlXWUxbmZOEUZGRiLRreye2arPnrSrDsV0D7waF
	fT+Brf+jga1tcTG2sw6uPnZU/fGZdQtuB5sXZcf4y
X-Received: by 2002:a05:620a:46a1:b0:92e:472a:2a75 with SMTP id af79cd13be357-92e472a2e26mr761064685a.61.1782732566237;
        Mon, 29 Jun 2026 04:29:26 -0700 (PDT)
X-Received: by 2002:a05:620a:46a1:b0:92e:472a:2a75 with SMTP id af79cd13be357-92e472a2e26mr761057385a.61.1782732565749;
        Mon, 29 Jun 2026 04:29:25 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46d86960983sm41936351f8f.4.2026.06.29.04.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:29:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:28:50 +0200
Subject: [PATCH net-next v11 4/7] net: stmmac: qcom-ethqos: set serdes mode
 before powerup
MIME-Version: 1.0
Message-Id: <20260629-qcom-sa8255p-emac-v11-4-1b7fb95b51f9@oss.qualcomm.com>
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQlcAXYEHjo3nW5lXrEftFSP5te1iX5MUJv9q/
 rn9qnJOMKiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJXAAAKCRAFnS7L/zaE
 wxjzEACZof4MzE5R3AkLo4cdj47nM5c1BmYSvHzKkCHEBen5ThUyVXeDwIwWWblDb9RzJ3y+MLf
 o6oOtrRCBgzHhzIqbHMC8RY56b7Obnpy1liOpYkCXnAoXb6GQIsJOrt2U1uSD0oKANwf7nPzoqL
 OhsmiZfiThdMb8fyV5Uru6/3xaEgp17hCR/aNEhzHtDia7fcIC3r+wIGY1DBbu/Wp/jAu6pkOP+
 CzmnB9+VgEd3M2bqJXsVBck09gVcta+NALXRXu9s9uQcUcHxZ+GXz8kcfv/BkCvefJqXmNlZnrx
 hZHHGxhX2fc2XIobJ6+i56BbO4zGF4ju/pDPL3p/seCOySbXKLximZFUh9EfCKuSW72NgtcoSrC
 sP1C4LfvmWtH6SEwVZS9IwmGHjZ7L7474PXH+4zAq9UV72yW4CTIBxIfy8rYJrT6MjNXYYc5lut
 a//itO77gs5NIRlfmPXEjerOAOcgjX2NdtQLxXIkzK4JLftEBKC2Tq/QxziC3FOoqyL3e3c1IAA
 TBAiTx19G/dHyvRs2d5Ivud6gTiPAzPYmfSqhzheia1ryr4Xh7tfnNT4fDp+JaPeGmm3UwUkTPB
 Jrg8+FwsGLQYmxAKa70+0+gtmRNxyZh3idSJWOb8k8TJdI4CzOQx33u7dp4J/K+nGHNeNNaZhjk
 XzHNQpKFk6JR90w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: NE49PWy55syFuXxm3tQrfLnusdO9qYTt
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a425716 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=lIIuVyqIMTwqdMfQNTsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5NCBTYWx0ZWRfX4dS1GincHEDp
 oqfdLawZMA1a1aimdb6yJg2JQvQcuwPzWvEwDsI8DGUiYXQZ/aDL/cBeAdbMA/zEYrOt28wvBYE
 krO8/+z7t3K1dtjjcj4GlUXI8qLD3dk=
X-Proofpoint-GUID: NE49PWy55syFuXxm3tQrfLnusdO9qYTt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5NCBTYWx0ZWRfX207cXAa7vxxH
 XohYi8lIGBY6NOD5pcEj+Iu7WhM7w11e4G2E07DEHMM1iDB/Gk1YmxwTh6ndLhruCtToYB6drbU
 oq/YrPCWQyaLOxmGrmUf8nsf2mtDcihRILOcun0139PTsngb62Dscg1TlIuLvEJ3U3ozRI5jU/c
 wuoAivgObMYHmkdh4Cch0a+R5CAISIknJjhui+gbnA7v8UrmgZjGcQenaFlwiputEsY2CeJ0BXY
 cfUhyRXOJi0ZQf6OJBt68qf3P6EXBmLhVPfwqeFDvQK2YUhbmT0FlVXVxbIUfYXlYrQrYxiYUh8
 SZsU19V7qcyD5RTaLd4AhHsxFpUQISl/uCCwU0Qbp2QbQcKKneDIpgKC3T3OB+pXDAm7eWoNKnf
 ypykC+27qge4I107TxBQZxnkvQYs5Lvum/RDtNydbfvCfRQzVKn4PNN8KTWco+RZm6V/kC/1Orh
 K3ntfTspjZ10UHFjVOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_042927_965393_6E51DF59 
X-CRM114-Status: GOOD (  16.22  )
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
