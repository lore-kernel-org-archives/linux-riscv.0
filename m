Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C2FCD4F2F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 13:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QSPRv9vDCyVDVhwNVPzbJjMuaJo7cvZGtv7qYdMQzyU=; b=iS4jX1+LVnGgaK
	Zy41vm9M/RdfMo6o0kZpmWhmlyl5rsx7CKLtik/U1hadEDhqirbSO1X4T1oqbvqRJMaIfh+DLl3cO
	wJ70zkcYQoXX7PhOn8LOBJg3RAbb5EDI7RN6LZu5/NFEWb2JGXDLSmqbgud4exMoC7Liw3AQ9FN73
	4Dy9RAHkTsqD93qdQ816RY4nGSzvBRtqEbOA3msJIeTUV9U7IJpMjj4z2/tHLeEsRT9xCxDvPOurl
	1nBcIVNhyKU05kaWVO5opaltaPAOLmjlghckBGrnX3BoZYlqiwkabEyfrrFZZEnL3mi3X/O6S7Z6f
	C4biWc+U3cO6h3mJRdZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJXRk-0000000AXzn-378R;
	Thu, 13 Nov 2025 13:33:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJXRf-0000000AXxW-40zN
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 13:33:07 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADD96Kp3768341
	for <linux-riscv@lists.infradead.org>; Thu, 13 Nov 2025 13:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wNLEUtImMXvAmjKIRtueCGZIQNgFOT3pJRe5fakSwLQ=; b=dCTchLVV2jAjgWiY
	ICFZIXcCA1dJnIdIViz48q5cmif6mK4Tv0rs91XKwf+WAKqP0coiOozMAqCNtf54
	v6WWSIzwslz5D+1JkALoTwwk/ae6y6C0EuTKEYl1O4rTOgn9jwhIMXqcJKyIBLLY
	GH+s4I/2nY0dwLFEo34gHaWMjv5jNRb9nyCg3ZtM58/JWNfCxxyRH82pTPnFmMUq
	7osKcoZo/tExDV4AhVEQD/W6FWf5rXTVCv2+piy1J93B+Y6hkdoZc9qgOc+61TyO
	XCK3H+LqmC4PnvDoQJ9QUGE62ObKb9yqGEqPJM9kWCxuO1TDgaUYSBWnqQ0cRRAI
	BI+hQg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad9jn1bgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 13 Nov 2025 13:33:03 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8823e9c63c6so2692456d6.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Nov 2025 05:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763040782; x=1763645582; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wNLEUtImMXvAmjKIRtueCGZIQNgFOT3pJRe5fakSwLQ=;
        b=EIxSArDJiF9etw7B8AaT2CRWqPPPCWjMAUYi/lmqKkjtY//BsUS87F7uLgk/yqcOLb
         I/YP1vtK5eA/Zu8ww1f0kb7/YzQTJ60jzjwlX60GxxoV7Jbrm0dmMh5iNzk3OgA+DDaC
         rbzMn1XNWEjd9xrlsfWwK2xXJbrbZob1JNTfcSLjUViNk1acvnhiGOqs1m5HyRHzX1MA
         EhwpwYgclU9SKApVpQb+p8mEMrWNIcFh77n8NzdPaHgF8EsJBrZhFl+u69ABcr3T0oaM
         0FkLdBd90C9uin1Th+eFvlPhYVJxHE+8PDm5jkmspeMdDJkTZWVqkJ6Dahi0or3mbANv
         8cOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763040782; x=1763645582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wNLEUtImMXvAmjKIRtueCGZIQNgFOT3pJRe5fakSwLQ=;
        b=to4XNMtkrvAoi2WNpLCo03DpPGbQpogPQoTu2eUjOU+aGcJ69duQT+qYLg7OmFzSzE
         AwSIWJIfEF+nCBHpc+EnlWEfWn29q3Pp3Dpoq1XBq3sazorymIuY8Pypcs2qEkH3KBk6
         wU9kr7Im95Gu+kkb1e+0V4dbed78LtdXsD44kFQU94f9SLB2hifHNg1vch857MlC2evs
         wK6Tz7JHBbnWxwM3Th8wbWTKVb5btpOQXEzZkn5g2qXZeASL2Pwfn5xRlXjrPTMKZGau
         E3/ckwjs0JfxLLM56/Q/A2Ue6/QVaJOjmB6jM2YPszybqO5Kt17qXuWAH3cMZZJ6tEHF
         +0cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWdb2B1Af1DXbZWycQs5W7Wt0ejHsva205YNjlz+pa96sW+nfON0EyiJY6cnKTOdKxZfcWZTEkMfj/uQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+y+Ry3Zsu6D6bJW0d+XVogX2rngQBhy3+erO98MfDolRoIwbC
	8HHhyMiz3YykcbqwkPXOLvYLmnp5Q5mdVuqzgmAP6y5o7hytJGz4AJGOlV7VtHTKt9ESWPffgOc
	AyJHIpMsPxDPbPaOO0cHH6+pzM92io8Z5KBgRFVBMtn/fYzeRFx0/ggLcF8HQUSKoq50u3Vw=
X-Gm-Gg: ASbGncv3a9PwUDRRwpoAPekGYrrXTpZnzUpQ4MSpNSAu0OeIx8ohHoMRbYp4XRHcrqv
	Y+KJ74LNqn7/2+bq7qAiSMjJ4P3H1a1hpOv10Eag/L9JD6dhFf+IE8SbPGdl3+YOCKcITijHRXC
	Jfpib6KRFZVyiEmTngaZwzZnGavS073z1OpmFJSKzuEUBC3ToPlYhFKfIAnzlgW81Pc3Znt0ZKr
	G1/mhYK4eLSQj2uPWjnKyFLx375UiXk6Gpdc251g9GZC/i/3reML8UXiPxNc9k4Q7uoM3Jmf0gG
	54ncIt8Ir96kwlKYsFL/j9LaeIteFYSP7OvrQGlGZynLfTpzK+HsmCwnKJxSttRkcvBHSBbxd6h
	/WsGE5VXXWWDCA2e1hs/Me4mPgXF/+SkRBWX9SGH8JkRYLnsYT1xi0nUf
X-Received: by 2002:ac8:5d8e:0:b0:4ed:b9ee:3ce2 with SMTP id d75a77b69052e-4eddbdae8demr64144951cf.11.1763040782428;
        Thu, 13 Nov 2025 05:33:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrzhJHhVjwGaQu/IkcGeYInBcpQOo8PGlB0mVpgZ0Fcc+3wNub2niPYVso88lX2dAHMTacPQ==
X-Received: by 2002:ac8:5d8e:0:b0:4ed:b9ee:3ce2 with SMTP id d75a77b69052e-4eddbdae8demr64144061cf.11.1763040781802;
        Thu, 13 Nov 2025 05:33:01 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fd80a11sm162333266b.39.2025.11.13.05.32.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 05:33:01 -0800 (PST)
Message-ID: <cd7c0490-a2d6-4885-aa36-ee1492f107b8@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 14:32:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] net: stmmac: qcom-ethqos: use generic device
 properties
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
        Swathi K S <swathi.ks@samsung.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-2-01d3e3aaf388@linaro.org>
 <21a3d269-76e6-4da9-aa25-bfd1fb6dfb07@oss.qualcomm.com>
 <CAMRc=MexMn_GSC2EtMek5hDRLjGYA5HKM8ge9vrxw1pYDqPJgw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMRc=MexMn_GSC2EtMek5hDRLjGYA5HKM8ge9vrxw1pYDqPJgw@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=BvmQAIX5 c=1 sm=1 tr=0 ts=6915de0f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Pp6BL5jzwldociJZjw0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Uikt8aX5kofUTlmraocw3fVdddd_VImd
X-Proofpoint-GUID: Uikt8aX5kofUTlmraocw3fVdddd_VImd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDEwMyBTYWx0ZWRfXx/H5Z2hpEYoB
 GDnGQ7AwtCDrs22I6rV3Lkw0sdE3wiI/LhqGk4FpDUi49oakIWVvfAgs3lHdgibhPMldqSS6Bjo
 XBcPqVrGYYYiZAT8ArLnhm4yFJrwTvSPpFxyMgKARfMhF7isC8WclB9w0xTEpdecJjA9MTaPZWz
 qSsD/bp6qZw1uSrMTBILV8pCGykK4q/MSMXln31BgjDbLyxmMAadTzOmVdcIe/mw9+sZmsZyDsP
 1pc/hOkHtK0tLJ3tF8+AnrT3QfwXqnEYZ9VE8/Ay+E2/lxctftPWNRUwdLdKRWaruIeOCNhS0dU
 JPClaSVtH1xGSZnESPMoe6JFM9TReVqmTmKd5WRG82a3t0CGvCiHQB8Sn4jzXOSxrC3KR6cyDWC
 ///yON07LTw07EimD6lMqhON9B/67Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_053305_019273_5DE7D08D 
X-CRM114-Status: GOOD (  14.37  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTEvMTMvMjUgMjoxOCBQTSwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPiBPbiBGcmks
IE5vdiA3LCAyMDI1IGF0IDExOjQ54oCvQU0gS29ucmFkIER5YmNpbwo+IDxrb25yYWQuZHliY2lv
QG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Pgo+PiBPbiAxMS83LzI1IDExOjI5IEFNLCBCYXJ0
b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+Pj4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFy
dG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+Pj4KPj4+IEluIG9yZGVyIHRvIGRyb3AgdGhl
IGRlcGVuZGVuY3kgb24gQ09ORklHX09GLCBjb252ZXJ0IGFsbCBkZXZpY2UgcHJvcGVydHkKPj4+
IGdldHRlcnMgZnJvbSBPRi1zcGVjaWZpYyB0byBnZW5lcmljIGRldmljZSBwcm9wZXJ0aWVzIGFu
ZCBzdG9wIHB1bGxpbmcKPj4+IGluIGFueSBsaW51eC9vZi5oIHN5bWJvbHMuCj4+Pgo+Pj4gU2ln
bmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5h
cm8ub3JnPgo+Pj4gLS0tCj4+Cj4+IFsuLi5dCj4+Cj4+PiAtICAgICBpZiAob2ZfcHJvcGVydHlf
cmVhZF9ib29sKG5wLCAic25wcyx0c28iKSkKPj4+ICsgICAgIGlmIChkZXZpY2VfcHJvcGVydHlf
cHJlc2VudChkZXYsICJzbnBzLHRzbyIpKQo+Pgo+PiBUaGlzIGlzIGEgY2hhbmdlIGluIGJlaGF2
aW9yIC0gInNucHMsdHNvID0gPDA+IiB3b3VsZCBoYXZlIHByZXZpb3VzbHkKPj4gcmV0dXJuZWQg
ZmFsc2UsIGl0IG5vdyByZXR1cm5zIHRydWUKPj4KPiAKPiBUaGlzIHByb3BlcnR5IGlzIGEgYm9v
bGVhbiBmbGFnLCBpdCBjYW5ub3QgaGF2ZSBhIHZhbHVlLgoKRXZlcnkgRFQgcHJvcGVydHkgbWF5
IGhhdmUgYSB2YWx1ZSwgc28gdGhpcyBpcyBub3QgYXMgb2J2aW91cyBhcyB3ZSdkCmxpa2UgaXQg
dG8gYmUgKElJVUMgLSB1bmxlc3MgdGhhdCBjaGFuZ2VkIHJlY2VudGx5KQoKS29ucmFkCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
