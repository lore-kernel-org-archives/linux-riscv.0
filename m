Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8949CCFA05
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 10:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/rsh8ZRrd0JoA7WrPfoOza8TggTK5GyBpy2iQzXQHjs=; b=zCCL9NR1rLuRJR
	4TWWEPd8YvsGH348ya830PlCaW5yYZ0UmPVKEfavZNxKfLL1lO//SgTLBOfnWQNDOoD8c5ah82tLp
	Brx3SoZguuqZOKIk7k7xm25m/RlcFrxakrkO+Br4G1TAdMDMJssKWmsH7C7y1K57mSEkeMBV3AX+d
	HwfKM7NxACK7ZaHXdcIWadleDysiRtymxAdDOGnVVDZFN8fYrFzJAMdpXkmI3eB6Dz/rN4JNjrWDs
	viHlXgYRUZiNq+bwNeDw5BpUDI5jnxJLyEEUbA4lEfWEz+cRTKyifISP5WNeGCjwSEPQpbzDWMvXf
	NNAPhPVqor4jSoYePgcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHK7D-0000000H9KD-0PSW;
	Fri, 07 Nov 2025 10:54:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHK7A-0000000H9JC-1RIr
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 10:54:45 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A744lJJ2085451
	for <linux-riscv@lists.infradead.org>; Fri, 7 Nov 2025 10:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3IKVzBz5JQK8wTUX7NukAcRSdlW+wFpDRAPikZl4+E=; b=D3ciq7sL0T/1mqDA
	KQOUvXh3Mhxuk859eyTuTtyDlTSts27cCw5jo0Qy/Kqfi0+9EEgGjO78tdJgcjiI
	/ZYPn7i8YLL/cNB3YOhXlcFlNRonkS1KARKEuwJrURUm79wZUJENvHCzLGPw3vJc
	sS2fL7+89HTzvn+w8+6DMz910/EXVZ1KhlcmAk6+G8RfEVGfOiJfWEu9s2rqXdfY
	npR/UpgRmaHsmNeiItvcsNJ4uFfteDzCHsTZdCMFaDW+0I45vW7sXMrAK0mQkULJ
	PcBbv6BEOI8XYuVJ4nEOxTArWjAXQf/S/5TbwBToT9e+cq273Msh3ToXZlizm4UK
	z0AxXw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a99e795cv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 07 Nov 2025 10:54:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b23452ec2bso14591385a.1
        for <linux-riscv@lists.infradead.org>; Fri, 07 Nov 2025 02:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762512883; x=1763117683; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t3IKVzBz5JQK8wTUX7NukAcRSdlW+wFpDRAPikZl4+E=;
        b=EOI9CQuQA36EoFBZmZ8f/IjuaQoK29BYHMSInNr0BbBGzJTDR2/d8E+Ko/g3iDD1pY
         RLTHbqs89h4c4r5ieKrpUCgCuiACC1bDqn0B/DVDDPtCSYn9B7CdKzWnd/Aon6GrjrFf
         HR+NRsHm0uQ/90+MoazRgv5p1CD3nYEqDIXMjDgHbVpEvaXq0XI62P/cYMp5W5TfWndr
         gstu+yJixu6VROqR2brBWy0tUHQ2lSnoXNnhihqen+a128eef0g6UeCen3QDutMKi1I4
         bsUufKemEYbv3/TbgjuJ3gIaJWe7uzD3hT1cdahWnaWwKXxbq9bSVBUy6OY6eRNThksa
         hdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762512883; x=1763117683;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3IKVzBz5JQK8wTUX7NukAcRSdlW+wFpDRAPikZl4+E=;
        b=o8+m6T2T0cgeVkWhru9ouj7u+79dEXooJVkO+9Om0Z62UXI/ilQakEVPp91ZSISxSi
         OB4o2pn0ourGzE83akpNIm3pmomQQWEpYFW4i531n65kDcgTN+ekfX+9knUal3D5LMxG
         rII3G9yOy2buU3HiXEYdP4/lM5zvg/he6lbjXKOHiS4wg955rYFPT1owp3LLCprryrNL
         nmF3AGSd8r7xseKxQmNrTWZ3u0M9an4lSMkOT+2wvCAn6eJqhLUs3AVICQJAS8Jfwy0V
         OPy9Z/Jo27u1dC7NFzB1dRp/lEDAOg2hUTNBUQ/1wezE8EW9g+gvqeq3iosCvwccIe7C
         n7wA==
X-Forwarded-Encrypted: i=1; AJvYcCUQbJrO6Em8cicyUtqCqnmOUlLoD8qvxz8fEbVkDwDo8HEh/U6h57kXSF5BT0pbU1ZBzcjzZPa69oXk/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1f4QijQEwcj+HXj1G9WgdqI7p2TsrxTStt/1vCI4n9eMEcimC
	f5hLuZ72KHRLFzIE72QDpovvLEkueuYiOFaELVQCq1/apz1h4V8TMQaz9geQ2SPv+G9aB/r3Xpl
	Pe4qiewItanmGyoHIKqhFFhqbgMI4/aicZHJIypln2Ttebz0DHb1vyr5iFTZLzYF20ED5rKo=
X-Gm-Gg: ASbGncuU5SwNIaMhOUwCoP9RdGh9dqrFaoCYtz65+/cORu8gFPyF98+vc4Oai1c6zHl
	BEm7i6F7Mia1ruExjn7D8+vNxrpMb4Vqk3rFcc1vu7usLocUIpDV4c4ZntJNcXg9wlj8xQreNQC
	1hCOxvinssvz4oohZC8EyfUh47RcqpfEhk16heTtHBdFj4uegLlkdF/U2lqwZ1Datv8TZG9pct4
	y900vzgVxYFu/VhI0WkUlU334kV6/iH9S51qpbmZF2TGO0QZX1ZKJg7Cl6jK/cCIqM7f/inq+de
	uIGhQdPqYR0vKP6qMYjSxvpnRrkPmW1Z6qYJFe2y71MJ4OCxkP3VBG995avLwo6NZ4AcUcOxpjK
	ei4uiCiqffnW8gc0VFcVmaLAv6g+aBAfEbMy8UBdiHdMl+/6XjL+Dpjr2
X-Received: by 2002:a05:620a:2a08:b0:8a2:a5b2:e3bf with SMTP id af79cd13be357-8b245297214mr216402785a.6.1762512882642;
        Fri, 07 Nov 2025 02:54:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFi7mPq0na085cioUOvqXq74YCfsRc6NxnJgSblNj9scHFLGnEvxVACu852vb4CayQn6idLew==
X-Received: by 2002:a05:620a:2a08:b0:8a2:a5b2:e3bf with SMTP id af79cd13be357-8b245297214mr216399685a.6.1762512882057;
        Fri, 07 Nov 2025 02:54:42 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa11367sm205508166b.68.2025.11.07.02.54.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 02:54:41 -0800 (PST)
Message-ID: <86df9697-af58-4486-93de-b01df5ba13a6@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 11:54:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/8] net: stmmac: qcom-ethqos: wrap emac driver data in
 additional structure
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
 <20251107-qcom-sa8255p-emac-v5-4-01d3e3aaf388@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251107-qcom-sa8255p-emac-v5-4-01d3e3aaf388@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4OCBTYWx0ZWRfX1qM9DiPLhfy/
 bUxWO6nMcUwxEFzeDrMa5QQ1Wdl8MdpaBUik5xbYNIclDEwTceh3IBmglbabgd3APBFgcH6FnLy
 8/9atQiO/2r6gETvAYccz3R1a6f4P7mdGPbOULgqaIqT4jd1TDMnKtHpnVCn8HA532Wzacg73IF
 ydJXOUKnjdYwowdLYqYrdiuE2abCBrgFx21zkZYjDS8jKePHzvcGK91L0dSISwyIMjb/ZemNf4O
 HH+KZQpZkW7lr7fl0aYdtDDUbQUB8ht+QLZYFZ7ByeWOMDTF03CCiw/+nQuDXvctwDIEeOZ0QFT
 EuKaIrNh+w2LGgQ7SaD1eC0bOkow2wmRvou2fu3A3z5rf7xiTcb+ASR8r0e55BNM3W7exExbWwh
 a59BHUbZeuNYSaCVbswwqTDh1GfpHQ==
X-Proofpoint-ORIG-GUID: 89X2Iehywy5DGWbFr_6_b3sgXBCZqQec
X-Authority-Analysis: v=2.4 cv=A+hh/qWG c=1 sm=1 tr=0 ts=690dcff3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=4r4FsD-561SDv7fJwu0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 89X2Iehywy5DGWbFr_6_b3sgXBCZqQec
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_025444_502073_8DCDE945 
X-CRM114-Status: GOOD (  17.02  )
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
> As the first step in enabling power domain support in the driver, we'll
> split the device match data and runtime data structures into their
> general and power-management-specific parts. To allow that: first wrap
> the emac driver data in another layer which will later be expanded.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

[...]

>  static int qcom_ethqos_probe(struct platform_device *pdev)
>  {
> -	const struct ethqos_emac_driver_data *data;
> +	const struct ethqos_emac_driver_data *drv_data;
> +	const struct ethqos_emac_match_data *data;>  	struct plat_stmmacenet_data *plat_dat;
>  	struct stmmac_resources stmmac_res;
>  	struct device *dev = &pdev->dev;
> @@ -801,13 +822,15 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  	ethqos->mac_base = stmmac_res.addr;
>  
>  	data = device_get_match_data(dev);

This change could be made much smaller if you kept a drv_data
pointer named 'data' and called the new one match_data

but I don't really care either way

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
