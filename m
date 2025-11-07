Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EF5CCF9F8
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 10:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bXL9CiudG+wvZF+3hrgVV4LeFsfxcKpOEEjt88LEPWk=; b=ysOoaSGM2SHfb8
	JKQkzWwEhxE8PeLkrHyoMnGaDc3kGAENjXNDaNj+E+FYibZKkntNIBv3wcvymPdWi/RQg1nSZa7Ls
	TOs6MUHGkLfsD2EpOEaKFsszfPPhBI6UdmOGLBoG0AeojPDGOLdhj0NJlV7Hr9aIwcRVrBfT5U06U
	BHS39ClmQaQN5WZ9THZbUtgDjYdbXAtGjVRafdO7IufBSBK1NHfFoqYe/KdMEGSJv+yhn890eEeuD
	6BLufmCv0C6cy8chBQz9xDQfC5tCNbmRJzKZGSu1iL6G6GHvC5fRdFVeP/WWjCEPy28baI9RUG+/L
	wGChlzmEL6zj6N1oRLKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHK3H-0000000H8vC-2aIf;
	Fri, 07 Nov 2025 10:50:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHK3E-0000000H8tH-0CPR
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 10:50:41 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A78f7c84131369
	for <linux-riscv@lists.infradead.org>; Fri, 7 Nov 2025 10:50:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K+LRkelT4LAUbuxVybXtmeX0JCfHUQudQjQlnzvpOmA=; b=B1EYSsnG47lGPxvn
	zAiOxrAmz/Wz/9UGbFmZFaJUsrfmtRJdHGCRNLO8nK188PAywHZCZ/Czv8tlM8ve
	CGTbIUMThDuTRN2SNFnJdG0FxRGnW+6oQLaE1SUNcHDxkH1p3qM+XKbF6+ZvwhuC
	2xSpWB1caS7pSkxWxhHPfYew/g/o0fF2xf0FwgXZJ9fl/vku5K0YWUR2Bzn1GvAJ
	SLreBdufu7mVgG3gE+Go0RhRFhZFyzFhMp9WBxMVB5AfBt5uh9btC4+Yx9NldHxh
	YgAVAW7chm0tTXTd4tmqkRL7pByvT7vcNlH8wK7Ctms8y6dh9igwU/62YLoua5H6
	vkifZg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8u3x3rus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 07 Nov 2025 10:50:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b1f633955cso20161985a.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Nov 2025 02:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762512638; x=1763117438; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K+LRkelT4LAUbuxVybXtmeX0JCfHUQudQjQlnzvpOmA=;
        b=LTR4QW50NxYd3N4Z3ZCkecHncDm/Dc9Ag4maK3nj2Vk414j80WzKqgoHI4QE1YX8om
         JbbpgFo6hQcg+NU4jm7omnIPxdJDPOVRIIbG+cAv58TloQZ068SI6GBK5JKlz+aY4CbO
         GW65f8RurGPVtE5TKjN3YuDl6X0VMW8rcwjQ9IVBeuHZqgDpI886wBdbDX7kK+01skKk
         lbBDzGwxAUQ/QwbdO/bRYuaAMkgHpJ3/1lHLOHWkYPy/+L17vIAGKle4VQ8xZFZ9JvzY
         VyEK/hkQPqVRQ4NlODMzrDJDN4ndqF+tB3crUYeLOKqDK/aJS01wH963pSJcZEW+PaLz
         rI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762512638; x=1763117438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+LRkelT4LAUbuxVybXtmeX0JCfHUQudQjQlnzvpOmA=;
        b=u3TBX/zsPVl5iVxZOkSkzsbkv8VK141/a4hoGJdzgH5E3GtOKjng10Y0I7uAe2ej7k
         itvInfchVOVvOd0qOy2+lFLZJWz4y5TK3AFW/B1D4omuCyPh0A8HxNfpP29/MWxuKdZa
         xm74vdBleleabeSJksmOcxlMSc3ok1v/fa/PxpDBuvOuIIkZQSHGjIUEPIcEphTV76n4
         P6q48ATjdEp9nluZsCyoPUzSxShSG9hrYOKJm5/k3B7qSJT0gBiIAoZlotGieDi4OVLU
         cLwanFsCRVoBLp9Rz0aB9Tvfeiv2IpXhWJGqgzcQVYMHBVYZ3KxYS9XGFEIbQlNocRjf
         fczw==
X-Forwarded-Encrypted: i=1; AJvYcCUZq81NW8ue25RDyVw5bN4Q3y4UhUGVnvwdPL3ug8u4bz7nVXe/thjS5U9a8MgOpzVo91YW7VJq3y6bBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHXCPOuQnCvIzNzUC4TsaauMXrY3gogQIUrassv55TLPcnAkuu
	7Fhz/2Y+x2SmMvAlXkUJibZnM3yNpfLugTwQYsSsH4j+mK7//mGuK9xvVWzC8tqZxjLrzSwkzJU
	lHXvptomXmDKlzW41TdrYRogCm14rIwZdteCywW2vA9QkAlMNNB8gLOJMfzgMISL9Nc5ceyc=
X-Gm-Gg: ASbGncsSKLqHxRuZLbdkLMmOVKtpPWBJ2w+RhnR+KPMdek3EacXipA68GhDoIst4uH6
	J1UmI0mKKc5yMfvTrryacIduq1y2YVpjzNK6ddA/EvBOQYgCvruD5kyR1z1q88sOTodGGSK4q2n
	jYOa2mrT+rm4pp2Zkgz9DqmU/S85BCt5yPZbFvSWDSBEKG8QCDKNuYG+7lPRz2UXVjecuhPWlyO
	4ftyR18Fa2mq9tM67s1EhjOJ9+FLVYzW/k0MlMPqldfBUtEQg3AGKNlvpKpb7YTbrDvdnwcRijr
	ndOv7pdzlUeNdQU2/kXIuUhYbwVG0nYDGkvFXB32RoQISdyp9nvSLCcpkVxXJFPlv6EzQWF5VDF
	knjAlxkK72KMOZ57PhuD79o8s5VJjMm+RMrEE5nj3ckQWq+7TaT/uTHC/
X-Received: by 2002:a05:622a:411:b0:4ec:ed46:9268 with SMTP id d75a77b69052e-4ed94a41994mr19484361cf.13.1762512637948;
        Fri, 07 Nov 2025 02:50:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECQ+rghHeVgkMsgvUMsj4lxwZEJlBOwE/naarHWq7nH8xBHgoJZQqQzG8SkQO4ghE/Xbce/w==
X-Received: by 2002:a05:622a:411:b0:4ec:ed46:9268 with SMTP id d75a77b69052e-4ed94a41994mr19484181cf.13.1762512637527;
        Fri, 07 Nov 2025 02:50:37 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bdbcaeaasm219104466b.1.2025.11.07.02.50.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 02:50:36 -0800 (PST)
Message-ID: <9805b902-95bb-4b18-b65f-f6efdfb6807a@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 11:50:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/8] net: stmmac: qcom-ethqos: improve typing in devres
 callback
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
 <20251107-qcom-sa8255p-emac-v5-3-01d3e3aaf388@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251107-qcom-sa8255p-emac-v5-3-01d3e3aaf388@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4NyBTYWx0ZWRfX6PHYGtY9Lfjz
 1B5AqWMd3sjOQdoGwCSvkByrzMQDI678358MQlQuJb5gdYaR5VzCdYVuzfi+nbFysmwJamq5cdk
 HDu8PIJ+87JRNWyOrNYCBv+aKTDjhNmTHe2QwnbSQSw4W7IaM/fQSESv7tmXGyRbKlIq/FSBZsW
 WScLzecLUPrPZMSuE6hD78WB2+tDQ29lGHqi57oOHQ0e/sPEVFqPLfnEryY3uviMlZoXZX4nPAO
 kyOxkoXxh+hkAZ5Bb+EaK3q4cZc0naQTTBoG3tdExmCZ7n9xPxxntEs/OK2ocJ4P3F3SkuyOx99
 r7dJMA+wt/A4iNLEYhuJ5ZOiuSct8MQ/dITek5k69heW/lJe20zu+VUWuReROzTfVz+8iq8cMs8
 93v/C+xDblCdwaf04LeDw+INVg15KA==
X-Proofpoint-ORIG-GUID: SaUasasnYC9WPs0uRHBQ53ZbmOBPEA9Q
X-Proofpoint-GUID: SaUasasnYC9WPs0uRHBQ53ZbmOBPEA9Q
X-Authority-Analysis: v=2.4 cv=BrKQAIX5 c=1 sm=1 tr=0 ts=690dceff cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=Xr3OHDAqYAD4YnyFvXYA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_025040_133938_0D684CA0 
X-CRM114-Status: GOOD (  17.01  )
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
> It's bad practice to just directly pass void pointers to functions which
> expect concrete types. Make it more clear what type ethqos_clks_config()
> expects.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 8578a2df8cf0d1d8808bcf7e7b57c93eb14c87db..8493131ca32f5c6ca7e1654da0bbf4ffa1eefa4e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -726,7 +726,9 @@ static int ethqos_clks_config(void *priv, bool enabled)
>  
>  static void ethqos_clks_disable(void *data)
>  {
> -	ethqos_clks_config(data, false);
> +	struct qcom_ethqos *ethqos = data;
> +
> +	ethqos_clks_config(ethqos, false);

ethqos_clks_config() takes a voidptr too

Konrad

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
