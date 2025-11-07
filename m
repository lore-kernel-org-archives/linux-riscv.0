Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EEDCCFA05
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 11:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gBITvBU7cNcNrMAa9tKSPmAFGM8NKoS191i1Jf4DR8M=; b=4Eg3OGYmd5qcsR
	5S95Ijcc05uIYgq9aJ/+OpVDQVhOrsOeLfmUZGRQ4Cv9ngp9VgUGYMLEWHT4GCt9sy4Vrg7OhTLH5
	mE/QHmoOSesoZoOQp1im4N7f+naVdEBaQE2HomAQvD9BZclcBGo5K0eZGYAGVb1x+8dGlyQAAIV67
	jccZmBklIAeRf/WRVA8e5UHG7jyYduac3Ap05K2hTDgdb2ZFOBL+UcQkD8UUuxHcKlE5inkAeYZJ1
	73vMo6xvcK379HDX9l/pwE2RSfFNKQVlbEWZWkF9a8SyZjRn/BfywX97CqZRM/rwgis5AfN73flbN
	XKUA9LI++F9K9ETf4tDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKMH-0000000HAbD-49q1;
	Fri, 07 Nov 2025 11:10:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKME-0000000HAaS-1kSC
	for linux-riscv@bombadil.infradead.org;
	Fri, 07 Nov 2025 11:10:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vP5CsM5g0HeHOTSJ0OMxMqeLtmj8J5VZdu7ouInriPk=; b=TXBPsZTHFjHBWL6oH6UBm+qQ8H
	IjLlhOqewLumqLQG9aZ1bHf+VaKMgyv823FUsMaUZIBpOMpigzPwNNJ7BrEWl/A7HQ6EcUXFVYxij
	iCfr47F+CBsZDv6B2Uw048/klmwAwfRBXWHbwiBx3hNVGx+GV+FPERzg173k0uGTe8DKO+1WBy0PL
	DLk15wIGkwGdqjh3zc+/S8kmZyX/m2TA7BrQcNIqKKIW/s7JulELXymKTwJjg79rw+s1CRvfubkpM
	Is2e05ElHlLkE9MPqfqOp77wplBvmDNbxgQfl8pNSIG6KtkuAIGXZoly2Qd/OuVTAawbGE7JA2IO/
	3ix/YARA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJUU-00000006GMp-15RT
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 10:14:48 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A7B5HxV3175127
	for <linux-riscv@lists.infradead.org>; Fri, 7 Nov 2025 11:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vP5CsM5g0HeHOTSJ0OMxMqeLtmj8J5VZdu7ouInriPk=; b=kTVL2uNAU7+oNJ0t
	NR/5a4pLbFGYY5wf72iiXu3Aa4fetjFKQ9zdlH8oYDu1NewO8kjuYZOdjhXjdvUv
	bf9H5CrpXtD3FxEPcZGGEe/I7iM/0aRRpxXoXCHoPjp7StVXZ72j9UVDYvOKO9PK
	dM6P/R36KX94fYH/c+vCqaqes2PvZ/LrkNM01vU7XAbdqPBV6FVSt3SDB1O09pk8
	SELlf5XSIHWr6/eEojdjY43BaCIsGJtdJhRfz412+r7RW1eoyiS4nL6TQwJhxIf7
	B3ni+nzSCZoHdKpoDZxL3P9Eh96zOXP7YNsyWVkUNd24P1KuGRuBYPvKnw4TQFFq
	CgY3uQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9fk800dk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 07 Nov 2025 11:10:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8934ae68aso1780731cf.2
        for <linux-riscv@lists.infradead.org>; Fri, 07 Nov 2025 03:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762513812; x=1763118612; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vP5CsM5g0HeHOTSJ0OMxMqeLtmj8J5VZdu7ouInriPk=;
        b=QHOYyFOFNnlNCPnlRLkUrJBY7+yyz51GyPSk/7NcJ2oszxXPwGkMq9ZqagnPH1tU7z
         dEbQk+0/JNexl+XuEbYXmUAhgiLSFq6K27pQuq4s1fj/gK0DCA5zEA9QDz7OS/mVfxn8
         4bMpiW7VswWKna9f1QHq43dM42PDjlgVSLewMdVUsamlczGswpMF8gWWT23ruD+UfUks
         NNlczLFNqOdOFTjGy8jB9ZKEVnY1Fyx/IsoMEoPlpkXm7SZrGmK+szserqjYWpoE0Slr
         34yfvYkorPmZDQWR59r4/ruUkEphSeNTiE5lzRIL90gflSM+39D07uzEmXSyBj4mu6aL
         BSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762513812; x=1763118612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vP5CsM5g0HeHOTSJ0OMxMqeLtmj8J5VZdu7ouInriPk=;
        b=mfsy5gJsCRTdImJzHq9IELzw70Aw18PeAOj/ccm5n4SOJlsjacpDegerzKByli2P7D
         rcu1UZxxasHsQdO0noTO9YcVoHU1ISyisBqUgcx3s4N1EpidtEToUiVtvvhlTWY33ApH
         UMPZq7lRfN1dGaaBYQoqE8yT1Pp9CZe+B8jyeLIzermZb55NPALgJlaifzpn5vxJpwlg
         FUyZ2Fslgv/InjYTAnKRrFphtj0ZrSNLYNRF9we2bBrUGaQ1g2jGL23LgY+bXtQhHtij
         4RKWnUP+6tFWwU79Ym+l2zstYuRAKbo37/JHmJ1zrv4bf8LqqyY8cLHpZu65wu5LccVz
         xN8A==
X-Forwarded-Encrypted: i=1; AJvYcCWm9MNoSi4bLVX5XSfCQrJ0CYvU4zjfNMbNcNGS+SxTXTsQ68DYxcDiRHs09WoDMU0cTXhsxE5qgZmoHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4htkuYiwZjs7Ca6B0yjplJ3vVlWY+8IWkOky0c7NUqEB4edr5
	lJLBo8g9C4+BGtZFAkkt1dNyA2Ri9gk53cihVvNHKyiWPf/29Pni8XvsyHwvx7pqJMkdbMNJRcT
	sp3+8v0qdXG4HVTJ/OeDmKa2cGSEg7y0jk0HDGdD6oTu6EbtAr0e1zRgrdYLBuBd3KzWnd5w=
X-Gm-Gg: ASbGnctZlF62ivxNDhIpALGMJDLt6cOXtpa5p+L4evvaRAsQF444nuBuACr2+xpb1aZ
	Aca0ve+guN3DnDoRL6qngbQn8IEssMZfvuxhg8j4ZSkptOoHJ4z0qz/MMfVwcuEfUk06u/vpLzT
	MFYfO98E3RaPJZZ8aMI2TgIaXMb6SbNADoV47mhTv0fuAj/R26/0rC8LEpBJpIxQsT7742knEVW
	CaofOsC6ylhWB7TALewsiAobPikXEs/ZV7Df/giBPWyhqPPzt1Io3T3aBudmx2PiQOewnPu2CSb
	wFM1qp2Si29cmnqnqxZyeHxNyeji2Zt0cyLnGgFLcdXic/E5BtjBxSFO+pWgpA5pFh2AMQa2jaj
	O8O2Hlzf2YJRgDeuccMGHcHoPL9otBtnfO5zeEOizV8DkW9UDXgGZH4Jp
X-Received: by 2002:ac8:108f:0:b0:4ed:94e7:97bc with SMTP id d75a77b69052e-4ed94e79806mr13951871cf.3.1762513811886;
        Fri, 07 Nov 2025 03:10:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+oSsE67XF0MhznsqL3RMh0VmCG7Jg2iUSdY+a5r8YCwj9SfReJWThGgi5T1OFd6OFN1sfjw==
X-Received: by 2002:ac8:108f:0:b0:4ed:94e7:97bc with SMTP id d75a77b69052e-4ed94e79806mr13951281cf.3.1762513811430;
        Fri, 07 Nov 2025 03:10:11 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf31286esm217650966b.21.2025.11.07.03.10.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 03:10:10 -0800 (PST)
Message-ID: <5fea976c-a047-43a4-a062-fee1d40447b4@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 12:10:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/8] net: stmmac: qcom-ethqos: add support for sa8255p
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
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
        Swathi K S <swathi.ks@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-8-01d3e3aaf388@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251107-qcom-sa8255p-emac-v5-8-01d3e3aaf388@linaro.org>
X-Proofpoint-ORIG-GUID: cAyS1b1Sjckei9QBtA7umPo38RxU53M0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4OSBTYWx0ZWRfXzl521Tsdm0vo
 SNbfr7DYa37tzuRhj9g68Dvk0hWQODRAzqchP+AGV+eTPPnLGDKAK0BcU48kQIpOS99UVmhVRop
 xzfNb3i+R1leXNCn9NZdeTP47VY+znxF9ietatscEi2i5l3nnSLFxHhcAufm4Cb++3qMyaUuNWI
 lYin5tqSVi0XlC2it5jVydWkiwBuKp9zcIKSalGFQ7JmjMeBWfRdXh1zFlxHzKJ14+8Kcvf7j5B
 sD/2UY6Dp40mgxQEqWUvaosnbLpdfyHeYvTwJ/qWfaSqhBXb5s5CffYA6GqR24LObO3wKCFbXIg
 MF0UhlMQ2aGlSR7erWOhqMy+B6s8uBeiHJZFCb9ccIgIj4WpvCVN4u0FSuxhdt8lz100Ln8GEZY
 upSBvuyrlAf3RQFoaAyeDmzFH0kCdA==
X-Proofpoint-GUID: cAyS1b1Sjckei9QBtA7umPo38RxU53M0
X-Authority-Analysis: v=2.4 cv=CPAnnBrD c=1 sm=1 tr=0 ts=690dd394 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=hDgXwu4zDwT_Ch0b-w8A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511070089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_101446_820509_2E8520D8 
X-CRM114-Status: GOOD (  13.64  )
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

On 11/7/25 11:29 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Extend the driver to support a new model - sa8255p. Unlike the
> previously supported variants, this one's power management is done in
> the firmware using SCMI. This is modeled in linux using power domains so
> add support for them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

[...]
> +static void qcom_ethqos_pd_serdes_powerdown(struct net_device *ndev, void *priv)
> +{
> +	struct qcom_ethqos *ethqos = priv;
> +
> +	/* TODO set level */
> +	qcom_ethqos_domain_off(ethqos, ETHQOS_PD_SERDES);

dev_pm_opp_set_level(dev, 0);?

perhaps with _index?

Konrad

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
