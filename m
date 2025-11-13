Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64EACD6E74
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 14:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xnNCW0MxNADJxtrWCZSPM3bZSDQ7hdDfm6yQoderAwQ=; b=b+4QYRga8h4jKD
	G0Koif5r/YYGEk9ZxALUn/Aaxmh1dcNCUvCuQ4DuYJi2Kwy9y5oswo0x3WssXN4noomZbZql3weCY
	kO6FEo0QjLGBLvDZcBNoYQJ2xVSKCSwnQ6NhC8LhW2uZUaWOte9tbJKySx9RdjYiBEaAs9AADjaw6
	fwmFYc06UxNu4yAlMcf6iG19SLmSRnnuv04H9AWnV8IyiGA2JSd7w93I33R9JpkYeFjQBxm5HBgkD
	/B2B/suzb07lNdX0w12bR9BuFhQ+aebLDb+GhNf0Q7zUuBdWr8Sl2MMDC2vBAC8N55ogc+kkufAiB
	5Aot8/joGt5eqwf9Ot8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJYbd-0000000Adjs-3dLr;
	Thu, 13 Nov 2025 14:47:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJYbY-0000000AdhK-1lSx
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 14:47:22 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD8ZxCY2993508
	for <linux-riscv@lists.infradead.org>; Thu, 13 Nov 2025 14:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c/j8O4OMZ/iO6ANHgdWOttUeORFw+6paoVM6GB+aNhc=; b=b/JRKlQaoXhQbjBg
	7mm9S/5h3Fp/qe27uSlmDQXdKJyVelTPms9TAYlDvBXVpwrx7Y/JPF42qOoJETR1
	cZsoxMoudkiU5Xx0VLidAV4Vf4PHDod433Ykxn74s+LsoMkTrwjARIl3IDm/A+Rr
	grUZjvJu70AF5w6jwH7l4Aq5Be8BuM4nP6pt3KJhqDbJ+xtwdCLznzo3aNk/9SZu
	F6Qj+Ub89gKav1oigAckmv9WKdjgeoUN7Q2qgBe471l3GyeBKiIxCveVSXs/+XGB
	RXI/WhEDsA6qtDMbbTNJWwMSedDbYI2Id5NJthr9QY3IvsFmN+3HmL11WKKwX00L
	cTlHdQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad47jjkw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 13 Nov 2025 14:47:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8800460ca8dso4071266d6.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Nov 2025 06:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763045238; x=1763650038; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c/j8O4OMZ/iO6ANHgdWOttUeORFw+6paoVM6GB+aNhc=;
        b=hiPDbzk9Tpf0Lp3l2zyF6xAUuZj5iktnUzV6BsyZppgUCCPRzW1KHtDLZWMrv1NAWd
         gFjc56TvrpAidE18DHYDtVbSyJbrBAi6Ex4XAw+bxCU51YX7c3+9AJYBWjtFE5FoaAIb
         aX30W/8Dm7/nV4suMPTJYtqJu9kKtDie8in4Xzfb53MC5J1Nugsfhvd0byl2SpkwZGIu
         nOL6UIJbv9MfhZ4qnAHuapZhCqPJNrfGqthJjMt+eFgQPS4G2M4dUeyLaJrh76gauGp9
         ipJ9D7O25JUL0W1u+OAZLZ1eLqkXb4Nw9JBgM8Ucex+vQdEK+JY1aYmyq8O324zyDxhE
         efGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763045238; x=1763650038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/j8O4OMZ/iO6ANHgdWOttUeORFw+6paoVM6GB+aNhc=;
        b=b3L41C3GJPJyBYQiabNQ1kBXKk5JfZIA6VFGaTHwrWvOBjcEWawCoRygbcITJcv2np
         Fjc76LUAivYcT+nzK08G/b8M5jlLUkBZOi4FYeHwKhfsMS4Nn4K6ATXPXlk4d00bJ3iD
         MldN4zqPA3ENmTT1NZvJBoSKoUTVyLR5V1zUZpqd4jXhA69GekNvuIVCu+fMrRmsLnBL
         sEsqcs8TParMgYqzRRvy1LfipPerQdZSygc7Y9WwjvW8klRM6zKj0nbJbkeCI2W94AF/
         NViuFCpPpzV7JXG195TLsegoGsbc/i+lDLHHdmWYv8YCuMIFwFL4f1vk1JL1cwmbgWvJ
         Qwvw==
X-Forwarded-Encrypted: i=1; AJvYcCW4euPAaajEzL25gNLLhnn9KuXGN3mwUC0eMFUBh86g6YdpIY5ZADnT/ENM8aPKcLpyKK8s5iWgFk72TQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0SwPt9tCiuTtrF7hHP5r8M6uZ5WIsGkUT3paaGgu0+BL1UFDz
	jS3Paf+dgCBk1NZEFpRwnsXM1hieGUMZyhg49kddcX6y8+tsB3JJ+eZafMZX9fit55pKXExFTt9
	C7ySOZkkrNBwaGvV1LZH8upSwNCqCK38tNnJgj6oDQAJ4ZrinVi2ItN+xXLzgPiyrhXlWXfs=
X-Gm-Gg: ASbGncvgDVpTS+W7Cyxwm9o1ozOqodr774A6bzRc4LOMJR+KcQn+0ZCTliraGn6E2+a
	HAr5j9/nFQpSdDSydMCz5HhB9KOqeFhmI/ay2UaAVcYisAjCMe633y0nzpVD+PI7saJJnK3YEAN
	FxCNQC0Xq3bEXyrKfs8KgtNKKaGh+JDbEjZDJapL0ZMsFzox1LExBQeV3cNeBMHmfwAIa57fh0o
	DM+bX61KcXwdhxbvJC+ngN1pWN7mGTXpgmbsbLrkTo+oKrENnic/wUDEfgWFZY508HWO/3uDTil
	2Ryv454/lHnB1mxpRGpG3ybNlpo9lWZOKsgysWO9DG+3zyfIsVN9eI7s158Dtzf6J3B41TW1srs
	aqcaNfQWKB35EB/0CXc65BSNXpLKZBYsn3YsuBU+KezK+bpH9H8AWuNm7
X-Received: by 2002:ac8:5f10:0:b0:4ed:7ca:5f33 with SMTP id d75a77b69052e-4eddbc9256dmr60354601cf.5.1763045238262;
        Thu, 13 Nov 2025 06:47:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFM7YamsAo7x44iby6/PzuNKLIab4wveVf6S4JQ4cd4mg9yAzxbvu88BKH+RnT7m5FWyF+0JA==
X-Received: by 2002:ac8:5f10:0:b0:4ed:7ca:5f33 with SMTP id d75a77b69052e-4eddbc9256dmr60354251cf.5.1763045237576;
        Thu, 13 Nov 2025 06:47:17 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fdaf6dasm176196266b.63.2025.11.13.06.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 06:47:17 -0800 (PST)
Message-ID: <45915f40-caa1-417b-95bb-deb7363a2ffc@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 15:47:09 +0100
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
 <cd7c0490-a2d6-4885-aa36-ee1492f107b8@oss.qualcomm.com>
 <CAMRc=MeuByh=N_-F2+zPiqnh+Qp9u97kiMheLJ-xxcSZSy+_tw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMRc=MeuByh=N_-F2+zPiqnh+Qp9u97kiMheLJ-xxcSZSy+_tw@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDExNCBTYWx0ZWRfX4Wo1CzNNRHZK
 47niX8d6b2Wi+h2MDqaUddj/+oGr11RbJ6xWpTvMPosn5I0rcoLpfbVYut9md3G3zqR+EwDGuof
 t3BTGyns1rGLjECh1m+PK+oR5BHCFjL/WW1GbqH1WepMxkr9P77YDpLnNqGKSpLzFBk3NSnGaiv
 20jUhGDv44PI7j0LTmtPR6y8vcLYkWsJQwY0gizhC7pYItP72BiP8BjL6wM7ECH8Q/9Ivj8/aSI
 gLF5naJ+2US9WweS5QnAF0btyaTra98btBb0AaZJ2hY1fh0RKIVY8X0UK3xXZ89syMfFzp4spyd
 ZyyAWbUFbSesSi7iFluWIzsE/RK/EI96os5FYaeWlm4diCID6cPgdsJh6cAPWeotuVXae0vQoDE
 sfOYWj4IQETBWPyhO4cUhWkNc8Vw7g==
X-Proofpoint-GUID: kvtKWB1LXsPpR09c7VTXYsKGbJktjhcv
X-Authority-Analysis: v=2.4 cv=A5Fh/qWG c=1 sm=1 tr=0 ts=6915ef77 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=IegXRtMujPCPvfbY5ZIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: kvtKWB1LXsPpR09c7VTXYsKGbJktjhcv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_064720_606374_9A834DBA 
X-CRM114-Status: GOOD (  18.38  )
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

T24gMTEvMTMvMjUgMjo0MSBQTSwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPiBPbiBUaHUs
IE5vdiAxMywgMjAyNSBhdCAyOjMz4oCvUE0gS29ucmFkIER5YmNpbwo+IDxrb25yYWQuZHliY2lv
QG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Pgo+PiBPbiAxMS8xMy8yNSAyOjE4IFBNLCBCYXJ0
b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+Pj4gT24gRnJpLCBOb3YgNywgMjAyNSBhdCAxMTo0OeKA
r0FNIEtvbnJhZCBEeWJjaW8KPj4+IDxrb25yYWQuZHliY2lvQG9zcy5xdWFsY29tbS5jb20+IHdy
b3RlOgo+Pj4+Cj4+Pj4gT24gMTEvNy8yNSAxMToyOSBBTSwgQmFydG9zeiBHb2xhc3pld3NraSB3
cm90ZToKPj4+Pj4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3Nr
aUBsaW5hcm8ub3JnPgo+Pj4+Pgo+Pj4+PiBJbiBvcmRlciB0byBkcm9wIHRoZSBkZXBlbmRlbmN5
IG9uIENPTkZJR19PRiwgY29udmVydCBhbGwgZGV2aWNlIHByb3BlcnR5Cj4+Pj4+IGdldHRlcnMg
ZnJvbSBPRi1zcGVjaWZpYyB0byBnZW5lcmljIGRldmljZSBwcm9wZXJ0aWVzIGFuZCBzdG9wIHB1
bGxpbmcKPj4+Pj4gaW4gYW55IGxpbnV4L29mLmggc3ltYm9scy4KPj4+Pj4KPj4+Pj4gU2lnbmVk
LW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8u
b3JnPgo+Pj4+PiAtLS0KPj4+Pgo+Pj4+IFsuLi5dCj4+Pj4KPj4+Pj4gLSAgICAgaWYgKG9mX3By
b3BlcnR5X3JlYWRfYm9vbChucCwgInNucHMsdHNvIikpCj4+Pj4+ICsgICAgIGlmIChkZXZpY2Vf
cHJvcGVydHlfcHJlc2VudChkZXYsICJzbnBzLHRzbyIpKQo+Pj4+Cj4+Pj4gVGhpcyBpcyBhIGNo
YW5nZSBpbiBiZWhhdmlvciAtICJzbnBzLHRzbyA9IDwwPiIgd291bGQgaGF2ZSBwcmV2aW91c2x5
Cj4+Pj4gcmV0dXJuZWQgZmFsc2UsIGl0IG5vdyByZXR1cm5zIHRydWUKPj4+Pgo+Pj4KPj4+IFRo
aXMgcHJvcGVydHkgaXMgYSBib29sZWFuIGZsYWcsIGl0IGNhbm5vdCBoYXZlIGEgdmFsdWUuCj4+
Cj4+IEV2ZXJ5IERUIHByb3BlcnR5IG1heSBoYXZlIGEgdmFsdWUsIHNvIHRoaXMgaXMgbm90IGFz
IG9idmlvdXMgYXMgd2UnZAo+PiBsaWtlIGl0IHRvIGJlIChJSVVDIC0gdW5sZXNzIHRoYXQgY2hh
bmdlZCByZWNlbnRseSkKPj4KPiAKPiBUaGF0J3MgbmV3IHRvIG1lLiBJIHRob3VnaHQgdGhhdCBp
ZiBhIHByb3BlcnR5IGlzIGEKPiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9mbGFn
IHRoZW4gb25seSBpdHMgYm9vbGVhbiBmb3JtIGlzCj4gYWxsb3dlZC4gVGhlIGZhY3QgdGhhdCB0
aGUgZHRjIGNhbiBjb21waWxlIGl0IHdpdGggYSB2YWx1ZSBkb2Vzbid0Cj4gbWF0dGVyIGFzIHRo
ZSBiaW5kaW5ncyBhcmUgdGhlIGhpZ2hlciBhdXRob3JpdHkgZm9yIERUIHNvdXJjZXM/CgpZb3Un
cmUgcmlnaHQsIEkgbWlzcmVwcmVzZW50ZWQgdGhlIGlzc3VlLiByZWFkX2Jvb2woKSB3YXMgaGlz
dG9yaWNhbGx5CnVzZWQgZm9yIG1ha2luZyBzdXJlIGEgcHJvcGVydHkgaXMgcHJlc2VudCBhbmQg
dGhpcyB3YXMgYSBwcm9ibGVtCndoZW4gdGhlIHR5cGUgd2FzICE9IGZsYWcuCgpQbGVhc2UgZGlz
Y2FyZCBteSBjb21tZW50CgpLb25yYWQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
