Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCAE0D277D6
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 10:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dnGdYCh7+oQMe0itMFr9sQj1j0z80ZAzPKvu0pbTr8s=; b=Yo1OyLdKIPSSS3
	zDj3y5VyxuCbTvMU72Em6NL7E8SV24L+4icFGyksFRqueid54M9/6tWwRIYxCpepdMOVPdIZkyoXe
	sSqoUeSoPC1RdmKElG0gt9TCei1R7M6DDQTW0VoukadU8Abvmhvv6AA0Dru93ea71Oe4f3N2Yme7T
	vt6g0NDzUsXPFjdb+uzi6W+ntB7XSG3PBQLj6T5dkQ79buKSae5W8CVrqDffxJy6R68hqyTSQc/QW
	L4+F4X7zuHldBgaqdB1TIKrEcHbJmZKBUg5vftYrcjuGPIdGFmmI43PRWdAJjd4o1IYCO26850QLW
	P+EJ5GHeXZaXg0/qHUcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEyM-000000058PT-3zY0;
	Mon, 12 Jan 2026 10:16:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEyH-000000058Jx-2BWT
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 10:16:26 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C8BkM51238549
	for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 10:16:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u3CANCoZnA5JFEckMdXBmY1C/JzkS+TKyANzWnvW0ps=; b=kGZ+YJUIz+BF53tj
	DvtCbErSPxhCkQJ3S51//Fu5hVdEClGBAjycxAtQBf8JqCDNBvVXObaLS+L9BOGt
	D9v5c2zALBZ6oyBaJTLEMPZgpBHueOnWBMSVJ20KzhoAFbs70PCftqnfOf3OOpMR
	+g3e9wVNLQKkcDO0WbV6iW1ZH0Rj3iacgMDRE+UG6D2FF27xPbmlJGz9MpmO7IrO
	qIJaV8AW0VGJx0Rmxf+gkS+EB5yEsAGaa5s9j8kYxQ5gFFf/I9r+dGJY++BpdVin
	4S0cC+By/0CkSHaUnEaQ8zmrReBGWH4uYA/SCizCGK2krA/eC3wqXNS7uEVX6kLW
	+dT8AQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfxfvg9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 10:16:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c2a3a614b5so1430150685a.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 02:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768212984; x=1768817784; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u3CANCoZnA5JFEckMdXBmY1C/JzkS+TKyANzWnvW0ps=;
        b=UsbqVadmEAxpp0RtUwGTBykhi+yQwWjfBXCo7AmWijnGculBegyWN4Mq7ncnK3B0wk
         ePTrPrGZCjfoQ20bPeEc+7UU+t7MpCuxvCZhryzKlFOKV4VmoxirvBfaqWAWQuc1QKt3
         91vDp+3cA6FJdeQp6FLXbIZEnPpdsurdl8JiBSAI2VFJWAy7MrcAuEofe8njF/LT8sLf
         dHsRRElepR9HDjWWwJGlCdJ2/HdsH5hFh2+wAGLLFeudgBMlPKX33JHB3+d9nrwrAvzw
         fLbIQeFfm2+I9GXkvL3lKsVH/2nbLEn7lYvbxQM6hm1GfMr64jLekGLkya2iwcPmEDHT
         48oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768212984; x=1768817784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u3CANCoZnA5JFEckMdXBmY1C/JzkS+TKyANzWnvW0ps=;
        b=A4YNmfuaNZlq2M8EAyXcsQDdHUQ+il9pk04i3PTCwEBePhN3OsEpcDsT6lIg7Dp1hl
         Hs666FkDWvzZgyXNP+VtMwHrUX2dE3KxVUjxSyZ33lQ6uSq2+djvX9uImP+CRXNm6UX3
         vKXTn17MB8mOW88H6wCBYn+JDgUgHxMVoGQaxLsIFck9YjYLVd4+JyOBJqYmTXFMgz/c
         m8SvVU2Unsq9PzrYr43gkAjdrtzUQ2JAgpDCPkf7E2MlgvFQLRXaSkii00iqQfHUdWY2
         1UU48LNv5xpp8TMko3QHBv+kxkEvJp6nSL+Daud6zk/qfAnyke8QBv4rxyILvuegfIpZ
         EPjw==
X-Forwarded-Encrypted: i=1; AJvYcCWShVAlLZWbFUSKnVFfIfyMZ+lhvnH2SZ+C4vIxRMilpxFWqBdSEn1SDoCRrrgz4IAuPxQOPWEUlLmOsA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi6+x1HgETpr3NmqHAoZPE9aFO8sI1Fgl7Niokph1QAfv5Qy+3
	+H0TCskNHHVJxlmFk8nNpGbzMEwJwt2/WU2kafw81UseYkTzQOzbxkc0wdyraH7H3fM0RmgQTYB
	93hPJbVC6LJ5xyNGQAo13BnDkQk75N28EYOOYh1ffucytYgYr7yykk2L3nHsztuO5tqkj4ZY=
X-Gm-Gg: AY/fxX5X50QR7aIm8X6yNfZAbztWU3J1t1lxn09T/xCnCJZZSh4FB+WcvI2IoHLiQE7
	AxhOyN03vLmILTwAli4Ppm1VvTQHTPuLIqr0uTJwN6vWHEx8f1AlT/Fv5LH56ohVkWXOd1Yp9sq
	oyC+9OCkdZNNq36L9HijQEKs43+BOkucTc+175+4uLUbpzaP5jUW0qmRJSkdYJcUW10TrGIe+v4
	7Bg8zQdnjhVgO7SdkfqkFn4b7DLJko0OOh+xnmb/UDj78NRr5+y8qJ9nqCqQ1FCb8KRgW/FlPxY
	rQuEZS9TdV0k61bzyBJJxOBnsR6aHnJbX/TU7DIzrbdpX60aC1HBo7OBmetvtM6jApOnRXURjGq
	7c8RLpu1Ggnkp31xlYDpfnuqtxeaM8uy1BSp81Dyn
X-Received: by 2002:a05:620a:172b:b0:8b2:eefb:c8ab with SMTP id af79cd13be357-8c37f4e8521mr2840667785a.19.1768212984030;
        Mon, 12 Jan 2026 02:16:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGm1+BMB3wcHY+CfBZCzxk3TfmnwQG4rssPyIYg62GrFRai7K9ghgpyZ0S5lhQa3cL4tO8HBw==
X-Received: by 2002:a05:620a:172b:b0:8b2:eefb:c8ab with SMTP id af79cd13be357-8c37f4e8521mr2840664685a.19.1768212983551;
        Mon, 12 Jan 2026 02:16:23 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:eb74:bf66:83a8:4e98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d865f0cf2sm126530355e9.3.2026.01.12.02.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:16:23 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:15:41 +0100
Subject: [PATCH RESEND net-next v6 2/7] net: stmmac: qcom-ethqos: use
 generic device properties
MIME-Version: 1.0
Message-Id: <20260112-qcom-sa8255p-emac-v6-2-86a3d4b2ad83@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2971;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5JRKlaK1PvzHkhM84UuOQHNNYPMck5ucBln5/d8C5Fk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpZMnnyYKxObLe0zkriAGSkbmbpZaPApgDozlsZ
 /q4OAMJQFyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaWTJ5wAKCRAFnS7L/zaE
 w/uoEACZYn8RkTNsWZELfKwfkZp2Zq87dICjgpuLqzd9iuW4pgU0Uco9G/gXWcMiMEAcOB93IfP
 6V6Z5rJ0chtzBov4JYuo8JJf7JFIuASYaXj5HN0bKm1ncR7tuEtrvuFjXEGgfGtU4VxHtczlaVg
 Yd9wtvKN7QtkeHeYfHwrSYaX2RASMRODw0XRPw5jqr4t4NwmF8LjPGZqYAOpR2iE7A9JdR+oUBQ
 XeeqXJudbQYzEw0Rc0ZA4T/4Z5MtaNhkycar+yuNFZ8nfP76eSal+tElLfjkxWthTnc43t2wLb3
 YbXXmYCIx8cprn++YEi/rkFhSd7i2ajfjZ7xqxKpX0ILeXTP8b4AxBTq0X9mcDVGR8ri599HLgx
 4Faj2vxNxK0xNVqrXxxSYPpmwPxSsYxGzX319xD3sxiGYkEug1OxLwXD62Dv/qGRDJ/9oxjz2VR
 snYj02FtZsOxxvPU6Pt+mZ6hEaeuGwEKWJR0M1YbDmzISLNJFlOp4jg44YK4BDomeZSTIvqLfmz
 gnDcmQKsZT2ffA754kGnRcuWxGLuIYu5VJyNLAh1a/FnCXD0CEi/GSR1G59c6Sh2LN/RoHNaQpQ
 xG1SuFuOtUkbYoJbQN5t/ciZeY6UYYguue3YrDyDthkeWzMdGh417zeMDAHcNLgmE+blaUeUfcS
 NfyrI/chIE1Z1ag==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: ITMKAo3yOl3nWM2MxNe56ofqZhFdIvrr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4MSBTYWx0ZWRfX8OcCWth8jpLt
 TvFl8PmNoMWb+2SkdAg4KRfkOiSSye3mgv6y+wvl3ZOfnaAOxwycsK+7oMuBSOVI2Zk0qoIW1iB
 /Yl0Pj0+DTIoEJl+oygVamkhF5uAdYNeHW6Nr9kqwTE41pVR3aW50Z48U7IHeBT5lSiH1iPhLjY
 w1jtTEP/LIiqRK3KnONgp2HxIltK0oWBYute3RTDBf2OXqQqUBgVrYzyP+cpR/osl0KfFPFYOth
 a+qw5oepapnFPdu9nzYzAFlfE8jXXKFkSJ/mw3Ua967Um7inhXFrpCBLf1bNxJCQ969h+mupRzB
 r4+fyeavSbDJE1ZerkLy956rq391GyFpVANX1iA1KgGdO3+wXHSWxxTbzwlN94ElwYvOabW4Z5P
 MYwZalZmsPHEcpAt8hJusXB2ysqFebDeVufNRWtfQ3YzExlqTem8k1HKbgw++B0QA8+VFydTv8S
 2MLpLxaptEemk0vKEGg==
X-Authority-Analysis: v=2.4 cv=c7WmgB9l c=1 sm=1 tr=0 ts=6964c9f9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=aGGWjMbO5e2og8PNdkwA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ITMKAo3yOl3nWM2MxNe56ofqZhFdIvrr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_021625_578030_B8B63146 
X-CRM114-Status: GOOD (  17.55  )
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

In order to drop the dependency on CONFIG_OF, convert all device property
getters from OF-specific to generic device properties and stop pulling
in any linux/of.h symbols.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig             | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 907fe2e927f015542b6a7228eae9a6c6945be3ac..1310312e3e099841da89d2f19b138b4459ecb504 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -135,7 +135,7 @@ config DWMAC_MESON
 config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
-	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  Support for the Qualcomm ETHQOS core.
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 0826a7bd32ff55bef62f8fda4e3eaef64facdb5d..457748e5781231680b64382fa73e195cf7473924 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2018-19, Linaro Limited
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
 #include <linux/phy.h>
@@ -723,7 +723,6 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	const struct ethqos_emac_driver_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
@@ -774,7 +773,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	ethqos->mac_base = stmmac_res.addr;
 
-	data = of_device_get_match_data(dev);
+	data = device_get_match_data(dev);
 	ethqos->por = data->por;
 	ethqos->num_por = data->num_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
@@ -811,9 +810,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = 1;
-	if (of_property_read_bool(np, "snps,tso"))
+	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
-	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
+	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
 	if (data->dma_addr_width)
 		plat_dat->host_dma_width = data->dma_addr_width;

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
