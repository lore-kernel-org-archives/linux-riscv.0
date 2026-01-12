Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E52FD232D7
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 10:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZZvSftrpRLsUPf3/d1j2Gxlt35fAwug8EmPPHPLOkVM=; b=XaxjVO/uqSXKpW
	/WznF0ZF3EUy+wy5s1Dm1E0I0GFda4u2vknTe6jUK86HuTs4aAR0IMSF6nPE2cQIKCT/LyWadkbj4
	xCdJcGY0OauNSbxTZ2ie822rTmjIBKaBiQiS5u+QXB92YPiZ3I2C5/3O6B343Lkb1kDVV5B9TYabT
	k61Rg1q8x9xly9lPN/ZH0BdZtxCqQST8IIMnZWSeCIlXD9oDNod+4993nGbGX7IiiLnLTUeOBWYUt
	wWJIFsFIf5mD3Hhwru4ysB8DVulG/A/ewHYvPgnU4Yz8/KyuZjdmtiGWyTLBEcsQseryEl1kHS7eZ
	1ecvkkoW/hbn5z72g6rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEyI-000000058Ld-2Fhn;
	Mon, 12 Jan 2026 10:16:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEyF-000000058Hb-0scv
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 10:16:24 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C846TP3038593
	for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 10:16:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CqsNLYO8zpeSavaSjzHCThlhRsY+iMn7mIEqpbTH6G8=; b=W5CqFnNQI+TOfsdv
	dR3venVEFFqlAk2Z1bEbyb8J/9E5oRgc0c+WiYHWeNJkR9NZ/Ex6GxcqcheFt1a6
	Q1kL/5tMiD7LdsUtsQnjF1TW0fOVVmYnyl5EPDVGAlYu1pCdv5KGgrALxZHVoWse
	Q4gf//A8XdXaj396ze+fINdJGHzD1e6D4qkbgldGlzGCnUvzJ5CFBgp83v1yz5Pi
	Fm2/xQKtKa1VdLpnMkh6A/BfbeNyuTKP0q7U1XEk3MYKgAtLcgJ5uiwz69q98lfM
	OBGhckrrldKYYhQSvqLgVRI74T3fsBG6lWR4uj1PGBBzE0rPWijaqMlUioNNXiVv
	T3HQzg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkntuky3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 10:16:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b22d590227so755623085a.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 02:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768212981; x=1768817781; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqsNLYO8zpeSavaSjzHCThlhRsY+iMn7mIEqpbTH6G8=;
        b=CYwF1PvQKKnDqt5wt8PSOGtrl55dPRxVDAV0Mi1m1ioPNzlPs8b82y+vrBxzeReFMs
         hFcrFmCHlSAcOmZW1pALUWXLnR4I3TPrbxWUptw8iZdri3bC+OOlI1hebFFk763ULz34
         M8iXjvoCiZFUkLAHEyNhewPzwOKSV/PkzLLWHsgmItWYPc5lTxcIZ1kj65CYNACHRzT0
         0Zreb8yIIts+mt9ajD+9NI+y2NzLAZifAVnvC4/vpaxZZDHWyM/XsI3BvPKrhNM5+kii
         OpiUw5DbmQdqvfqhS1vvMWwaB7FulD0jGrKnUnw8WyNsqOqaLMSxuO5IoRHjeYPKjeM4
         VbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768212981; x=1768817781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CqsNLYO8zpeSavaSjzHCThlhRsY+iMn7mIEqpbTH6G8=;
        b=ABuXLi1TH+b1+OUO09gWVDKZ8+4jEblx8uecWUu2jTr/cXGetJuff7GhLNYC6y+KVq
         A59xdG9HTsbOajgyrIx/8b6fZHsPPXDfHtvZvMCjANGGy3w4wrzFk8wlq1BLbwkp+MlU
         P5Kt2BNSvmDvUuyF/irzTv9BHhCmbDmBChXOPEiEGdkqiS8Y5SLWVl2moHe0VoMQWOAz
         5wEd92KfNDELniXtY5bSQs30lUH2OGDnj78ZfoWWh4dWvy+dBGb2RkSaQiENV84SMleV
         eYsmBCRztruzj7vm/H8c8hAKG54pCKCCg8hOfvv5VTIMwJv+owpiogQyp/2tZ3G36Ey5
         UxeA==
X-Forwarded-Encrypted: i=1; AJvYcCXvy4sccFJ45vk90S9AVh3iRa9ekVojhk/+YrZkVW4JaDoyPsP6j8RILxFwdVWiR32kTYFZfUCyV0AAGA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQWHbojCcgwmUKFjSSES0BGIsmekPyBsy25/HZASlFqMslqqcA
	sjW/BfcupiQeWRC/Hf5QgfkdmVPvaZLoBmsrRacHL/GfCqa86//hTjyiBRkJ2BtwUqoLMd5waPa
	4LYaTMUhI6Ih9F37a1YK0jKgc584yLttiitY1XNyQrfOESConbnnV73KryUDM4zTZWpJ8SHE=
X-Gm-Gg: AY/fxX4x//C9LfjGIINwN1/qeZHvUTpdEgYteoUGT9k0/UL3xJsoALH4u/ArLg7YS+C
	j6uNQCcc6H1sVhC+gpPq4/LapPwIAnExHJr5mdUITchDh2PP/518YKHlwNDQf3kCt8eSpsmVipm
	h7bIs6F4T4roHzncAOPrh+6ZyAFSN8sSADVuOfv2qk57J/qHXlTYyP7YniA9EPmVUNeAwMKaeR3
	COen1XRISLiYHolleFqxGYNh0j9pEgGYL8qurM4U1hd1leGFEb51uCML7FlxDY0P5EI217D7BfH
	l6DomF6njAxkkf7hUugj2n8HN7He4wD4Rw2toj4/A2CG0tgv/bk2OwKY9+FWhnFmCD+Xor3xTip
	GigLX8VtmOGeOqIYhiInbNfjAusle40suKmdIDjM0
X-Received: by 2002:a05:620a:2a0d:b0:8b2:e51d:610d with SMTP id af79cd13be357-8c38936ee02mr2329023285a.32.1768212980916;
        Mon, 12 Jan 2026 02:16:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0QQmNXdsilPpgvJ925IlX+0uUH+O1QD7HzTXgyq6BFRar4RLxT+vUwJJvPuZfJjDv/YIROA==
X-Received: by 2002:a05:620a:2a0d:b0:8b2:e51d:610d with SMTP id af79cd13be357-8c38936ee02mr2329018285a.32.1768212980205;
        Mon, 12 Jan 2026 02:16:20 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:eb74:bf66:83a8:4e98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d865f0cf2sm126530355e9.3.2026.01.12.02.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:16:19 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:15:40 +0100
Subject: [PATCH RESEND net-next v6 1/7] dt-bindings: net: qcom: document
 the ethqos device for SCMI-based systems
MIME-Version: 1.0
Message-Id: <20260112-qcom-sa8255p-emac-v6-1-86a3d4b2ad83@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=18077;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Cozb2dt06fIlVQ+DhTEtlms/tr9TrrSQczgvnf2xX/4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpZMnm6r3C+n1O7gCBakbi2bgbXgqlQerUV8fvk
 r4vHMEIIYeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaWTJ5gAKCRAFnS7L/zaE
 w2rGEAC2ghX98GRr5C7JyDpFdIT0m4HnQHjQvPzGlCBvGGIoVtYU3FsfOHii7vKYGNf4UQLWoz5
 TNaN6NnMaqNHM7IqJr+87fmfhx3/TLIx4ydxpxNiMi6roKaZj8btPCzCEaN60iSa7V0+diEAUqt
 EHg2SaqXEkLp/c8de/navpI0aFOSqxE8NJPqoMixylcH5nvGZNDi2FXzLrGcnCjzLTT9NKoA+FE
 wQMTWaoST12o7uvxBQMbYR2zGJp+AnJSjhyRQwHj686qPa42r463zGsD38BF17jwMa4YNyuzMix
 21HM2NYlNs3O5XckAgaE9blyfZS6+Y1FQlBo6xfgcjPoU3RUGpkbYwpHH1V7eZGFIMxSAs68nhw
 P5mtEQWqriwcWP7aUBMjeE02+cVVYLMbfzW7Z8UGAS7OXRa+WRvc50rS5qmMU3SNcFCbo1Trxwg
 +gL5PWebf9cDrQTGAmqFglwiQjISs+te8VXnF5NhZcRvQirPC77+M6vqmKHfdMjjYH+tS4nv6m5
 yong+mY0n7oADsRVHJhyDiDYdM6EyVrQpKDTvNROPKabBnTBE8AIv+VnPcGlBgBapIooAamdqNN
 kQX2rwmgCKAeLP+ikWJeruA3fbKiQcvR2NrioEtLqKR0t1mTko6o/k8m4wBSMBWwsaAZuOXxpWh
 HiC9thnbFkBlLmw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4MSBTYWx0ZWRfXy3yoJam+XCFL
 tG1Ctlav8LOt3g/RYZuXSSKPDfF2g7PHqZdvRSqQb3UE3PSm5n06CM9KJn+Moat5d48ykmzjHCQ
 /f8aUjXPYUAm0kairjWuIhQRkPxtvy6BKnNTOINFBA8Nb6Y4C5U33TIHzCrXyOT6BlMwABsk9+W
 KBfZRMlsRlYaJjoLn7mgTExHIUVdnu3MdP67CfuYKAPuVhtz7JKRoDC6SnD0PeEiOHEa6MVaE+k
 fHiWKqzvjhOGbBJ/bj4YfPLR0L5Gd9Y8BxCM+ALuuqWVRtznBR7AHeiZ8/rbdI76a81W/mRmOD7
 q5kaBbbk5JC+085v7DlOMDQYYDGidQZwnYJ6NjIDngFxObVML/PyLOtJPiLJSV3Iv7ktos8jamr
 ujb5p6SlRzQxpQd15cMR8RQhtiK4ZQ764354h7XcxluHqS2BSfA9KDmjB5p8aQ9ZpjoVVbvt6OC
 CSqMxcv+FqlR/TMQ5XQ==
X-Authority-Analysis: v=2.4 cv=R6AO2NRX c=1 sm=1 tr=0 ts=6964c9f6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=P-IC7800AAAA:8
 a=mK_AVkanAAAA:8 a=EUspDBNiAAAA:8 a=aDaa4yMnCzVJehp5dXUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=3gWm3jAn84ENXaBijsEo:22
X-Proofpoint-ORIG-GUID: WYa1IIgj0mu86ZYA7d92xEcy3fbLAJh7
X-Proofpoint-GUID: WYa1IIgj0mu86ZYA7d92xEcy3fbLAJh7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_021623_279114_A0FACB2D 
X-CRM114-Status: GOOD (  13.83  )
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

Describe the firmware-managed variant of the QCom DesignWare MAC. As the
properties here differ a lot from the HLOS-managed variant, lets put it
in a separate file. Since we need to update the maximum number of power
domains, let's update existing bindings referencing the top-level
snps,dwmac.yaml and limit their maxItems for power-domains to 1.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Romain Gantois <romain.gantois@bootlin.com> # For RZ/N1
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../bindings/net/allwinner,sun7i-a20-gmac.yaml     |  3 +
 .../bindings/net/altr,socfpga-stmmac.yaml          |  3 +
 .../bindings/net/amlogic,meson-dwmac.yaml          |  3 +
 .../devicetree/bindings/net/eswin,eic7700-eth.yaml |  3 +
 .../devicetree/bindings/net/intel,dwmac-plat.yaml  |  3 +
 .../bindings/net/loongson,ls1b-gmac.yaml           |  3 +
 .../bindings/net/loongson,ls1c-emac.yaml           |  3 +
 .../devicetree/bindings/net/nxp,dwmac-imx.yaml     |  3 +
 .../devicetree/bindings/net/nxp,lpc1850-dwmac.yaml |  3 +
 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     |  3 +
 .../devicetree/bindings/net/qcom,ethqos.yaml       |  3 +
 .../bindings/net/qcom,sa8255p-ethqos.yaml          | 98 ++++++++++++++++++++++
 .../devicetree/bindings/net/renesas,rzn1-gmac.yaml |  3 +
 .../bindings/net/renesas,rzv2h-gbeth.yaml          |  3 +
 .../devicetree/bindings/net/rockchip-dwmac.yaml    |  3 +
 .../devicetree/bindings/net/snps,dwmac.yaml        |  5 +-
 .../bindings/net/sophgo,cv1800b-dwmac.yaml         |  3 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml          |  3 +
 .../bindings/net/starfive,jh7110-dwmac.yaml        |  3 +
 .../devicetree/bindings/net/stm32-dwmac.yaml       |  3 +
 .../devicetree/bindings/net/tesla,fsd-ethqos.yaml  |  3 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml |  3 +
 .../bindings/net/toshiba,visconti-dwmac.yaml       |  3 +
 MAINTAINERS                                        |  1 +
 24 files changed, 166 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml
index 23e92be33ac8609a16db530782989caed22a5730..b12632545673b2ad0148a677f45a7447309a43cd 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml
@@ -40,6 +40,9 @@ properties:
     description:
       PHY regulator
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
index fc445ad5a1f1ac490e921696d6f7ca83d15de459..448e617cddc4cda8dbc77e83324495ffd5dfb9be 100644
--- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
+++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
@@ -140,6 +140,9 @@ properties:
           - description: offset of the control register
           - description: shift within the control register
 
+  power-domains:
+    maxItems: 1
+
 patternProperties:
   "^mdio[0-9]$":
     type: object
diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 5c91716d1f21e617543b03c5a90b993f8aee053c..9c9cc3ef384da0270489c21b3426572ea46d9499 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -158,6 +158,9 @@ properties:
   interrupt-names:
     const: macirq
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
index 91e8cd1db67b8e14961497a7254e6b01dc4e582a..c1b67cfa76d070d5e8349d5e92ce6bc4bf2ab67c 100644
--- a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
+++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
@@ -83,6 +83,9 @@ properties:
                          register
           - description: Offset of register controlling TX/RX clock delay
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml b/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml
index 62c1da36a2b5a29290e5e01be87c48158c4adf89..e41851931b947559c89b0cd6f4756f71046f9594 100644
--- a/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml
+++ b/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml
@@ -47,6 +47,9 @@ properties:
   interrupt-names:
     const: macirq
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/net/loongson,ls1b-gmac.yaml b/Documentation/devicetree/bindings/net/loongson,ls1b-gmac.yaml
index c4f3224bad387b87a5b4a3049dabd75f2c4bd42f..c9a131b8d8304c41559a416b324df749c0a87d14 100644
--- a/Documentation/devicetree/bindings/net/loongson,ls1b-gmac.yaml
+++ b/Documentation/devicetree/bindings/net/loongson,ls1b-gmac.yaml
@@ -66,6 +66,9 @@ properties:
       - mii
       - rgmii-id
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/loongson,ls1c-emac.yaml b/Documentation/devicetree/bindings/net/loongson,ls1c-emac.yaml
index 99001b940b8361f69bb917617f857ee99f4b3fa5..49db18423dd807683b9bb297978f5da8ea6cee3d 100644
--- a/Documentation/devicetree/bindings/net/loongson,ls1c-emac.yaml
+++ b/Documentation/devicetree/bindings/net/loongson,ls1c-emac.yaml
@@ -65,6 +65,9 @@ properties:
       - mii
       - rmii
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
index e5db346beca9649be4f97727b78fda8973095912..b240c76e7dd5254d0c3752610c4aa848a3c3d65b 100644
--- a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
+++ b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
@@ -83,6 +83,9 @@ properties:
     description:
       To select RMII reference clock from external.
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/net/nxp,lpc1850-dwmac.yaml b/Documentation/devicetree/bindings/net/nxp,lpc1850-dwmac.yaml
index 05acd9bc7616356e68090ebdd4df20e42f70dd7e..f61188ab0dbe3c0cec5b10f7a65dfaff4dc3898f 100644
--- a/Documentation/devicetree/bindings/net/nxp,lpc1850-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/nxp,lpc1850-dwmac.yaml
@@ -51,6 +51,9 @@ properties:
     items:
       - const: stmmaceth
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
index 2b8b74c5feec8378750358e1b9335cc2c2762bb6..716407a750796ff27e8fbcdb75267f3922ef64f5 100644
--- a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
@@ -52,6 +52,9 @@ properties:
       - const: rx
       - const: ptp_ref
 
+  power-domains:
+    maxItems: 1
+
 required:
   - clocks
   - clock-names
diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 423959cb928d945aa3e758a3c803d12bd61ec42b..ef520f8105773e22c0536ff419dad55fe316e1bd 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -86,6 +86,9 @@ properties:
   phy-names:
     const: serdes
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..72bb764c0ca046e0df4bbffe6c323850f5231787
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/qcom,sa8255p-ethqos.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Ethernet ETHQOS device (firmware managed)
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Konrad Dybcio <konradybcio@kernel.org>
+  - Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+description:
+  dwmmac based Qualcomm ethernet devices which support Gigabit
+  ethernet (version v2.3.0 and onwards) with clocks, interconnects, etc.
+  managed by firmware
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    const: qcom,sa8255p-ethqos
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: stmmaceth
+      - const: rgmii
+
+  interrupts:
+    items:
+      - description: Combined signal for various interrupt events
+      - description: The interrupt that occurs when HW safety error triggered
+
+  interrupt-names:
+    items:
+      - const: macirq
+      - const: sfty
+
+  power-domains:
+    minItems: 3
+    maxItems: 3
+
+  power-domain-names:
+    items:
+      - const: core
+      - const: mdio
+      - const: serdes
+
+  iommus:
+    maxItems: 1
+
+  dma-coherent: true
+
+required:
+  - compatible
+  - reg-names
+  - power-domains
+  - power-domain-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    ethernet: ethernet@7a80000 {
+        compatible = "qcom,sa8255p-ethqos";
+        reg = <0x23040000 0x10000>,
+              <0x23056000 0x100>;
+        reg-names = "stmmaceth", "rgmii";
+
+        iommus = <&apps_smmu 0x120 0x7>;
+
+        interrupts = <GIC_SPI 946 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq", "sfty";
+
+        dma-coherent;
+
+        snps,tso;
+        snps,pbl = <32>;
+        rx-fifo-depth = <16384>;
+        tx-fifo-depth = <16384>;
+
+        phy-handle = <&ethernet_phy>;
+        phy-mode = "2500base-x";
+
+        snps,mtl-rx-config = <&mtl_rx_setup1>;
+        snps,mtl-tx-config = <&mtl_tx_setup1>;
+
+        power-domains = <&scmi8_pd 0>, <&scmi8_pd 1>, <&scmi8_dvfs 0>;
+        power-domain-names = "core", "mdio", "serdes";
+    };
diff --git a/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml b/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
index 16dd7a2631abf6fb7dc8e0c90755ab1e81915b38..ed0d10a19ca4c47c05f6873c64b0537b90acd15a 100644
--- a/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
@@ -44,6 +44,9 @@ properties:
       phandle pointing to a PCS sub-node compatible with
       renesas,rzn1-miic.yaml#
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
 
diff --git a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
index bd53ab300f5003ea1f951d3957cefc702301217a..bc5054b05f6d7f1bcd5cd8640deb89293d9f69a6 100644
--- a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
@@ -123,6 +123,9 @@ properties:
       Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml#
       (Refer RZ/T2H portion in the DT-binding file)
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index d17112527dab0a5104ffaf2627fdcb73603d5db7..ef82ff2a2884d994c5ae6c98e0b3483b56dda653 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -121,6 +121,9 @@ properties:
   phy-supply:
     description: PHY regulator
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index dd3c72e8363e70d101ed2702e2ea3235ee38e2a0..312d1bbc2ad1051520355039f5587381cbd1e01c 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -71,6 +71,7 @@ properties:
         - loongson,ls7a-dwmac
         - nxp,s32g2-dwmac
         - qcom,qcs404-ethqos
+        - qcom,sa8255p-ethqos
         - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
         - qcom,sm8150-ethqos
@@ -180,7 +181,8 @@ properties:
           - const: ahb
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
   mac-mode:
     $ref: ethernet-controller.yaml#/properties/phy-connection-type
@@ -643,6 +645,7 @@ allOf:
                 - ingenic,x1830-mac
                 - ingenic,x2000-mac
                 - qcom,qcs404-ethqos
+                - qcom,sa8255p-ethqos
                 - qcom,sa8775p-ethqos
                 - qcom,sc8280xp-ethqos
                 - qcom,sm8150-ethqos
diff --git a/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
index b89456f0ef830991135bd17626da98661429596c..e78cbf594c695204040a53ab1e367daa9e12246b 100644
--- a/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
@@ -49,6 +49,9 @@ properties:
   reset-names:
     const: stmmaceth
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
index e8d3814db0e94fdcd0f3ab2a9fa8bab972a97ab5..845e2c67d20037496bb1eec6eb73c99cde74e944 100644
--- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
@@ -52,6 +52,9 @@ properties:
   interrupt-names:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
   resets:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
index 313a15331661208a1fa64386739d87a4f11b7e20..8a68c6d7b5c6d6629a780d002299d767088def77 100644
--- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
@@ -71,6 +71,9 @@ properties:
       The argument one is the offset of phy mode selection, the
       argument two is the shift of phy mode selection.
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
index 987254900d0da7aab81237f20b1540ad8a17bd21..29b878079ff0c1a0ef95fc63f2035f478ee039b2 100644
--- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
@@ -121,6 +121,9 @@ properties:
     minItems: 1
     maxItems: 2
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml b/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml
index dd7481bb16e59982c26c1a54ae82b8cff85fdfe0..ad635529d676ed6b752ab3bde5152d5cbddcb519 100644
--- a/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml
@@ -67,6 +67,9 @@ properties:
       - rgmii-rxid
       - rgmii-txid
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
index b3492a9aa4effa73fadf92a63a76ba8bb65a8769..c859f8bb5d582af8b8782f2f89ab5e6ee3d7a46c 100644
--- a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
+++ b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
@@ -78,6 +78,9 @@ properties:
     items:
       - const: macirq
 
+  power-domains:
+    maxItems: 1
+
 required:
   - clocks
   - clock-names
diff --git a/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml b/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml
index f0f32e18fc8550e6f63b87b60a095972453836c9..efa39eab0256a1102b01872bd848749788c9b4e8 100644
--- a/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml
@@ -48,6 +48,9 @@ properties:
   interrupt-names:
     const: macirq
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/MAINTAINERS b/MAINTAINERS
index ecae8a5e33cce6f2cb883c1b14b7908e71dbfb5d..6c3bd060f68df8813e9f64d6e6f9f1f98d4131af 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21523,6 +21523,7 @@ L:	netdev@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+F:	Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
 
 QUALCOMM FASTRPC DRIVER

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
