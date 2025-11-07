Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33D3CCFA05
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 11:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WfeuQKyFj5w/VI9RFn7KZnhtQeOGg0OFzYKuUG6I6gc=; b=tqiU8fm0Bp0Dfl
	idJ3xDgOn38ar/2bSoAkpGFlf4+cYILb8lQ6EfXMKOT6xt++LqeSD0pRxDv595XxpcexhsFzR9SUt
	Zsgqvl/HQ7iB5pBHHCuTqlD69V4Us6DuzDS0308QM81MpZGGjpAeeIMYCYDr1eG2F6nLohQonAuAT
	U0yHAtCMIeqp8VIRtUY1pHmm7eQ+sonQ1lTnbOAyLnSGLzyGP7ddZTtI2BEgngATxmRvwfoPHVfgW
	28z9hGMVik9azLnrC+waapbDz2OEpLd7rZQRe5r2S412SEoE+Y0iNO1Fotk++YGUP5jJr8hq8+1lZ
	Gf8qy4b5YnYvVULJ5SQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKCj-0000000H9iP-0uq6;
	Fri, 07 Nov 2025 11:00:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKCf-0000000H9h5-3bJd
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 11:00:28 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A74kf9Z584022
	for <linux-riscv@lists.infradead.org>; Fri, 7 Nov 2025 11:00:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Yxrppr7/emo5nMkfpN1y9e7bjiQLYqkReu/RHenH+8=; b=meYRNVo/ytmsLIw3
	9yLlW7GI4+rmzu1SkLLhvRhvP8rWpFv8etdCh6oOI0eghmA6tDSc4+hVriUcpmbT
	bvUyQrcf9TgGLMtQn9G+DabVKcab8kJVoyw9dkotpbWXALEFwxkESHu9/xGv20VL
	nacxkzyq6bconr1T4lWp2oNzE6cnmBNsSKhavXJQtBCa7T+USx4Ja6Uje777/aBI
	6S25I9Inyk4w65tWzgHYtI+hnsskEBJILnxbA1HqfHj1VXyZUvwbpaTp6JPz2umy
	TUX/veb7bU/ued1EGhEUm+QNtaAtvgdwI55azNJSswoyx0dkp6JjaiBc//hM8H2d
	w5LLEA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8yktjtjg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 07 Nov 2025 11:00:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b1be0fdfe1so22173285a.2
        for <linux-riscv@lists.infradead.org>; Fri, 07 Nov 2025 03:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762513224; x=1763118024; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Yxrppr7/emo5nMkfpN1y9e7bjiQLYqkReu/RHenH+8=;
        b=hQehlBwumPbhV2KNKMRe/JvdeYnmaV5PJAeHrkHd4n3hUr5E9T0DLTg0D4IsOyMoBo
         GFIxpaNuaXSgFljg53ePXkcXQTYg9C/6GSsZZlE5shh/+nR9S0K+DEdATrl34NpjrI0f
         c1N0aZtXCOeLdfNC53r86s8Z/vi3VJxzvc8ipBEt7U+5O6ur8wvwP5TpDy88PITuDZXP
         0dse0WBRd945vQXvnMbZeKmJfkB3Ti2/XMFuOtNU9iJAp8uMCVXZsK0A7oSmm88+mB+r
         Z5TD4zU4d73MQcWNSmrLemX+8MdFh7LaC+uWH3sx0kxdFDK46yu1KAYeGChRBe5nZrge
         o8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762513224; x=1763118024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Yxrppr7/emo5nMkfpN1y9e7bjiQLYqkReu/RHenH+8=;
        b=RGAJMebOrP5z36PsfJuf57FCkqf0j2UKYiXG04SISzVkkUvvrkl3/QxGSE+jHY4kR7
         iJaS6MPpcNPI76wTytwFqORNtKgEQpKe+/dAasCUc5OQihUxU+xlxGC4gPyMZ67MaN3/
         aUt3aKasvZ/LySjiHoiFrzw7BcyLiUq4Lgd//w8Wjsz/p4ST5ukjeTFEwk5SKnFpDB/o
         ck1qqBCW+xRkdYKv7Q/R7a/1V6w6sOiWl75dRXxx4jjRy9MWDjq3/AhICEebJxFs1e0X
         gddBLMhkhYf+Vh22iJFf2DLrnmaHR6mg47od2Vgvp7/A/Zn89fqzr94PS9BEGAD7GjaF
         8gDA==
X-Forwarded-Encrypted: i=1; AJvYcCXlin/Qo6YE7FC8XbQuvV47qth9B4L7d/BFBpBn2ft13yVBfLJ1ZO572Q5nx3frcbRRnGgtIkJuPfidQw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyad9+8xSR5We43KnZaUkjnqznQnxXASYJlDedQCrB1CnXtNSsU
	YA4gctzXmGJsYl9ig3/pQ9hDAvjkxWSwsTaHCi1GJjQ4p24shuiShLk5JGwtoMWWrW/KjSsnn8S
	SFpsGhrR173nTRnkVOlyAUYmLBUpNRTCbECzUOCXAA2FtQvhbzcnfM4SgVMPa+DlBuJn8bXo=
X-Gm-Gg: ASbGncviPrwO0cfJk8K355X77xs8GxuULxtPcPbE+xkq0yUgZlUPiLfn5G+mN3UEvr7
	isD4KutoBgvqcK4liuOSBy1Fbc/Fvp5x4hNgC2IIsD8FVhvopyHtzLQc2c4d8xvLQA3SDl1CoA9
	znNR5lhcGUlsdELuyedAMFT/dHr4fad6dNt/yyXrfQjqZRi2qxENesYN2gpAwfSte2jp/f0ffz0
	y6CZbxA3b9f7mBtf+Z4XM6Cx86w0+4Y0iCvhfeFGvRRVZygB8TLjMSvmCA2UpcR6mHJWCjkOGGL
	WWOXD8OmW5nU1XaPYKZmHv7rJyEkNb+oR9e0Y/4I7Z/pke/IouEk2/+JMFNVV9TrR/oirCSMEZl
	yk5/WUIedE4MSkDmqbsWLdRv8kDwVXx1k7wqhvP2fYh6td2FQybWMzSj6
X-Received: by 2002:a05:620a:4049:b0:85f:89:e114 with SMTP id af79cd13be357-8b245280933mr239714885a.1.1762513223983;
        Fri, 07 Nov 2025 03:00:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH34Ma6AlYFANasFLA7REiIDlipeT0LBwxV1S1iyIGEImmErkoaBKdKchVkLndS6HBNKbTjKQ==
X-Received: by 2002:a05:620a:4049:b0:85f:89:e114 with SMTP id af79cd13be357-8b245280933mr239705785a.1.1762513223227;
        Fri, 07 Nov 2025 03:00:23 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf9bc874sm216910666b.54.2025.11.07.03.00.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 03:00:21 -0800 (PST)
Message-ID: <14f95efb-0eb0-48ee-9132-df35abddfcc7@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 12:00:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/8] net: stmmac: qcom-ethqos: split power management
 context into a separate struct
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
 <20251107-qcom-sa8255p-emac-v5-6-01d3e3aaf388@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251107-qcom-sa8255p-emac-v5-6-01d3e3aaf388@linaro.org>
X-Authority-Analysis: v=2.4 cv=bOgb4f+Z c=1 sm=1 tr=0 ts=690dd149 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=iTm1nGh4yTgqJnnOKdQA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 5ili9hjVkk6IBUIwt6aqj14vhggA1jsy
X-Proofpoint-GUID: 5ili9hjVkk6IBUIwt6aqj14vhggA1jsy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4OCBTYWx0ZWRfX5WgbVBab9Zz8
 M13jjT/CnvdUk4tBfcXgpOAr65nwHbQ2ICQRp7eWSK4l1+A+29yJfFdZW2bq18sNkQPqCooiQaL
 4uMFurf1aNjzsGHWYYxVEevZWG27gx/L5DMlFkWuaF5UINdOnEVthFK3TSoD5aJ3ZI3tqXcbCNn
 QvwNvTCi3lFxwiGpDQKnTUrFU0kNWhc10vt3zsknL9WZLc1xRQo5HAY72BwtwuQXr6r0DVdywNK
 Qx9tNKNdb1PdHEbFuB5ZSFzR/Z8xzTWAsT32Gn442L9Fjc6iy2Fx05+tPOF4SC7TCQAxYWnsXBP
 JzNFC3N2zQea1gHj37gr6Aovi3F0DCKO855jE9M3AbD6ROw5+Wm/ou/9RpHwVOhWGXqN4lHN7v6
 t+ylVi6lppicuT6G/S5+u1ypylZYUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_030025_939878_8AAC3BCE 
X-CRM114-Status: GOOD (  15.51  )
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
> With match data split into general and power-management sections, let's
> now do the same with runtime device data.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 46 ++++++++++++----------
>  1 file changed, 25 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 1f00556bbad997e2ec76b521cffe2eb14fabb79e..09f122062dec87aa11804af2769ddff4964e6596 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -105,17 +105,21 @@ struct ethqos_emac_match_data {
>  	const struct ethqos_emac_pm_data *pm_data;
>  };
>  
> +struct ethqos_emac_pm_ctx {
> +	struct clk *link_clk;
> +	unsigned int link_clk_rate;
> +	struct phy *serdes_phy;

What is the benefit of doing this? PHY APIs happily consume a nullptr
and NOP out, and the PHY is already retrieved with _optional(),
similarly with clk

Konrad

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
