Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0488D767EF
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 11:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7VAJHlPOMtLmSK52gXOmIGZ0qz4oUuSgVVR1x99nE2E=; b=e/UJn7Jyhf5NJy
	WsF2o7NT3WKrmBqiOnhdXgmSTRsZ0d51SaXsBuewi8/H5Q5lAMpsNpFd5J7LVbxy+Y49B0ZhrtT40
	+309z+Jvq0+VHC4N3feR9sNGjw27bdo41IntOjWS2CamiWbcIfTq8i7EMVBcmWQGVjA0L6o4GtXBp
	Eqxbmwmgsd1CXgxWMT3oNhuU3ynghpoS9uR3IlTeMG15NZpA2KmasvcQsXWL9B/weFU52X2IsR1v2
	HuQwo0V+CLnPzabXCT996F2AAsu33GZpBYqC/jsVsndrxrvRThCd9xt0ZiF4dLHxvL98BGIweDkCu
	9JGwMOP3TJfgUzpuZ35w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWYsz-0000000ADDw-0Zin;
	Fri, 19 Dec 2025 11:43:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWYst-0000000AD59-3vLy
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 11:43:02 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBPxvZ4153970
	for <linux-riscv@lists.infradead.org>; Fri, 19 Dec 2025 11:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XSJ//+NrkI0SdaqeV9+95w1HyXUOn1q2m6yzB0mee20=; b=VuJumpKkI4NwoN4p
	wnOroxs7JscAlDoKqImfgvamlVxmzAtyeKT1N3HOwyEacPIsg7fZgP6StgDRrsVO
	lDJK/Bc1W/j9tL+hrvbHJbRdg4qXqDp2m3LmI9IKc78z7DrsTTY6/E/bo6kM5j3q
	tzDzSTf6PS8W4ejpeENabHQBL3KorJnmvgz3Pr2wOI7K74rHukkGoEdT49O3X6kW
	p1QfSyvQx8dqUeXB2uPZlfGfN2RSmtx962pNYFbJS+ObI5pPtzfyWi8kXUXK+XJ7
	OdlYA/KcCRIO3JdH3wfivIz3PYxWrfyiI45hu7RSOUysDHqLiiQZzrkxl/JFRLf7
	JqEVWw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2cthun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 19 Dec 2025 11:42:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f4ab58098eso21530901cf.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Dec 2025 03:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766144578; x=1766749378; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XSJ//+NrkI0SdaqeV9+95w1HyXUOn1q2m6yzB0mee20=;
        b=LUyD8JshmByZ6AE4I2ZitZqLt0qjEMUovHTuCCcqkfY2+cVxFsULvkP/gLH8sL/rEV
         sFBPR0Wwckx5nvjdw0181pSgipbVJt9tQ97afyDkUO146bu/skv/x9WMzHYsXedF0EyG
         8nfuiEKoCqNYclRFV9MRZW8CVDKB21E7ss41FFGC1/iGXxX42jaLLOEEKgQQvNSRS2kj
         a4I22Jg/q5KrJzHs4LS9ntmVaD2FOqfm65d9VcLSKvX5FryadwZT6mEwDyNnd6AA6yxE
         DQOUzl652dRN5/KlwBSIcZ+GgfuiZOrSlPWOjaAg5NnBU3qJM/m6Pzqo7h7ovXcErJyF
         eKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144578; x=1766749378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XSJ//+NrkI0SdaqeV9+95w1HyXUOn1q2m6yzB0mee20=;
        b=qEynM/CHjBusKynTSwv1WnIbGSgHfnZ+F+omWUt5UvXoxEF89FNRQYeYzQqAybT6QV
         YzMi1qY6l+LfufpQmHB/1vdVPNuMkO1MTZvNmLK3kwf4HbPxcJOHdOOWfMoa+4MVNCHE
         IpS3zSbWK5h/OHwXwL/C9mozmOwnfnE6T52jB5utZIUF5SOwDhSwiYEmiMzhb1afsCwT
         wfrFK6pRqTBqpsGT4dwunymnjJ2YonrCgsbc4IXuIfoCJ9FkZgn+Hoe8Bpuxj0ui2s84
         Q1EnpWe3R2TnhxebKOR7V6IOroLtLhQJCTkjSbc/WYz7lSixCTKzbXD6WuUL1mZdvOuW
         WlMw==
X-Forwarded-Encrypted: i=1; AJvYcCXNHQIytTfBOW2a92ySoemyq24mKySS2eu8s3KEt01f/iNFgZjBG1vGEkO7d2+/xW3ZGi/hYXemLxVGiw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxH31D+qAdD1A1orT8alAZuxhGy/iS4X9NCbfPW/H3YWzxaWuiT
	T4yNFeyyr58AyfnayWJpMtPdNY6WnfsfClj8iwMQj/TXDkTYoQCN1HQpvv4I+5m7jTWtym2TIpB
	jKrImlwkN1XXVsXJ8N+vgTBm3mVZsrz1gZJJsEYojbbODTEgb1z+1XJ9dUsBVTlDhBlZTlcw=
X-Gm-Gg: AY/fxX5jmhNovFgr/pwuTqU+MTrWqbiJqYdTcdgDMaaK+FKGmK8bG7eas3cnLxxs3Yn
	+h94uQuVOboJJ/QwsPkzJks+S7jW+AFBjk/Pz51m4p4DGaAaxkp8aLzXAG/nWJQehVCSLDRzlmY
	7UN+PF0elUeNOuWK8URq4ExRjfMuqT5cz/SYBh8pusxECPdyTPEqjH2DPa0A48A3ktwajN0j4yL
	w6FI7XAQWJJRmTL0xVQK1TXfcjpVmyPInO/yDqj7gzwB2WknEmnfYmLRktJLwl4DYkfRNEhPFb7
	KqzNMathprUPCKimbWg7EvYDyGn2Nbu+Ohy2kKkViU/1eZXMiMtPcGk2mjOArHVM/Y7mxvOlWar
	oEm1tUi0JES0lCzuV4NnbG3M6LWz0JEHATeTge5Y=
X-Received: by 2002:a05:622a:28f:b0:4ec:f628:ea6c with SMTP id d75a77b69052e-4f4abd75109mr33949471cf.48.1766144578265;
        Fri, 19 Dec 2025 03:42:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkYl2XGltcHjYC8tRGyTbaeWGWMtwoowZSuzKiKk+5/KXZ8WDaSdTO9aa/2ztIzpWznMMqHQ==
X-Received: by 2002:a05:622a:28f:b0:4ec:f628:ea6c with SMTP id d75a77b69052e-4f4abd75109mr33948441cf.48.1766144577552;
        Fri, 19 Dec 2025 03:42:57 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d857:5c4e:6d25:707c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm41134425e9.12.2025.12.19.03.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:42:57 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:42:20 +0100
Subject: [PATCH v6 5/7] net: stmmac: qcom-ethqos: split power management
 context into a separate struct
MIME-Version: 1.0
Message-Id: <20251219-qcom-sa8255p-emac-v6-5-487f1082461e@oss.qualcomm.com>
References: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com>
In-Reply-To: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com>
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
        Swathi K S <swathi.ks@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4962;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=I8K92peOoDD77pCU6c+tuagjGSYyBEcAaYy0D5g0uvQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRTotCIBx80eAFIUU4m+H9bba7jDpWKCHWvpk+
 4aqdQAMN7SJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUU6LQAKCRAFnS7L/zaE
 wzUqEACYYoLWp5hBHIlKehkRAYMjxbwSkPQhg0tuCr5HfUG2pPPoUUeYc1/CPeQ9d0zXdz02Xg2
 X+1ZgLtD7CCSd4YwqODDjqb/g2gJPBEkd6WNzPYgYY+oM18gj6aYljaFrBa3VAm+mS65QfwyaO9
 HJNXHcVVJA8Sri9eAtmaiU62Ch2ZP7MmU/5FCqSO+MEpoaHkVcCRKbv+2TAOM5IOgOhANJihNDj
 cNG9f+ScxG72f98nf7B6SVUu5dryebnuiNthgwsvN22zEJMJ3ZAyrSyhv/LtK+N8X9jot7U5XPd
 LukaHDTCEHAZe0W/YDTy8EKYxK1JJztRLrDwH1sHcL+EOQVGBK0GCYp7dhTotxTAHbSk4ax2aWw
 OqTlYWdg8ehGrOm2rcXGYWJcu6K3XY/2Ftari6YEGu32Hhukzr5id1dKqU1nXos1iPt0NmfXPHU
 s+6pMaJCBWMpfcGGubFcX3WX2pp4hrjhcxVjR2/IjiAW8Pb4n5mdS7I6jT0uXIkeLJKmI/rs6MC
 j5K/8mCAnYyLlv/rNZrEuonkgUqgj+hVYWtx3wIJq3nJ2ObFLjVxiwkxtygcIM44QWk+EphfXY2
 diN1a1HsYtuZjOfLR+HMw/MM3+MlQe3Vwv0Rgf7LKwxx0dCC/MsbYth9wAL10sbf92wQFp+jWLW
 tlYOO1cXpyFqwZQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: NDgdtRCJHmr5qtV_QYkhahjlRwuSxzwV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5NiBTYWx0ZWRfX/bcy6OqPZDyu
 y8xQRrrIEv8Xq/gMe6AcAw9Ylg4o6W2/91nlBvjdkYwXtUrSbFvhNnTwKYFfFVdvLFVLH5ScmHH
 SU5pgRKSeC3akVaP0xhkAkYEZqtFdTfstE1iY+JOETw4g/VXT2QCS16uqCIVO/YyjxCJCDsDAef
 tFdSXHZsqCYsI34gik1LTAAc6/VjV8Q7g7bB996OIOxmcxUcf42aeCuzKvcYpQGYHGT9i+kvhUG
 tfLWdzFvQoO3d6jrhXubU0luaiB2sK1ehlJPE4A4MiP47tdd1TUb2equkZbq4Klz6eyeuqPmqpt
 1QI9rUdvjyXY5sAW2xi7pRwq1BlKA5EDhd/oylhYHfemtM1KNoJ/vfkOnv348ttdzX2RL8CM0vu
 gL0gUTw1c5cf34DihaQijdCE/Gc6EaVin2klrLh6dZxNZkG2yZxcnojcOR/631Mn/fKSduN/NoM
 hUP2SQbMJDSN0dV631w==
X-Proofpoint-ORIG-GUID: NDgdtRCJHmr5qtV_QYkhahjlRwuSxzwV
X-Authority-Analysis: v=2.4 cv=Lp2fC3dc c=1 sm=1 tr=0 ts=69453a43 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=X-TyB6MtGS_gwYDveGAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_034300_758527_4FBF7D9C 
X-CRM114-Status: GOOD (  18.30  )
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
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 46 ++++++++++++----------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 54458ff5c910..856fa2c7c896 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -105,17 +105,21 @@ struct ethqos_emac_match_data {
 	const struct ethqos_emac_pm_data *pm_data;
 };
 
+struct ethqos_emac_pm_ctx {
+	struct clk *link_clk;
+	unsigned int link_clk_rate;
+	struct phy *serdes_phy;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
 	void __iomem *mac_base;
 	int (*configure_func)(struct qcom_ethqos *ethqos, int speed);
 
-	unsigned int link_clk_rate;
-	struct clk *link_clk;
-	struct phy *serdes_phy;
-	int serdes_speed;
+	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
+	int serdes_speed;
 
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
@@ -193,9 +197,9 @@ ethqos_update_link_clk(struct qcom_ethqos *ethqos, int speed)
 
 	rate = rgmii_clock(speed);
 	if (rate > 0)
-		ethqos->link_clk_rate = rate * 2;
+		ethqos->pm.link_clk_rate = rate * 2;
 
-	clk_set_rate(ethqos->link_clk, ethqos->link_clk_rate);
+	clk_set_rate(ethqos->pm.link_clk, ethqos->pm.link_clk_rate);
 }
 
 static void
@@ -616,7 +620,7 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 {
 	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->serdes_phy, speed);
+		phy_set_speed(ethqos->pm.serdes_phy, speed);
 		ethqos->serdes_speed = speed;
 	}
 }
@@ -683,23 +687,23 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	struct qcom_ethqos *ethqos = priv;
 	int ret;
 
-	ret = phy_init(ethqos->serdes_phy);
+	ret = phy_init(ethqos->pm.serdes_phy);
 	if (ret)
 		return ret;
 
-	ret = phy_power_on(ethqos->serdes_phy);
+	ret = phy_power_on(ethqos->pm.serdes_phy);
 	if (ret)
 		return ret;
 
-	return phy_set_speed(ethqos->serdes_phy, ethqos->serdes_speed);
+	return phy_set_speed(ethqos->pm.serdes_phy, ethqos->serdes_speed);
 }
 
 static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
 {
 	struct qcom_ethqos *ethqos = priv;
 
-	phy_power_off(ethqos->serdes_phy);
-	phy_exit(ethqos->serdes_phy);
+	phy_power_off(ethqos->pm.serdes_phy);
+	phy_exit(ethqos->pm.serdes_phy);
 }
 
 static int ethqos_clks_config(void *priv, bool enabled)
@@ -708,7 +712,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 	int ret = 0;
 
 	if (enabled) {
-		ret = clk_prepare_enable(ethqos->link_clk);
+		ret = clk_prepare_enable(ethqos->pm.link_clk);
 		if (ret) {
 			dev_err(&ethqos->pdev->dev, "link_clk enable failed\n");
 			return ret;
@@ -721,7 +725,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		 */
 		ethqos_set_func_clk_en(ethqos);
 	} else {
-		clk_disable_unprepare(ethqos->link_clk);
+		clk_disable_unprepare(ethqos->pm.link_clk);
 	}
 
 	return ret;
@@ -816,9 +820,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
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
@@ -829,9 +833,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
-	if (IS_ERR(ethqos->serdes_phy))
-		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
+	ethqos->pm.serdes_phy = devm_phy_optional_get(dev, "serdes");
+	if (IS_ERR(ethqos->pm.serdes_phy))
+		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
 	ethqos->serdes_speed = SPEED_1000;
@@ -853,7 +857,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
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
