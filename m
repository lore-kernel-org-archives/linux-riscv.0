Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DC4CA0EDB
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 12:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qDg4wSMHRKdmX8GSt5jHYFqZGATSEp0JnYWrwa/T7/E=; b=YoVEJmAPrbgV+I
	F4xiNztmzhcoRK33IfzgsaMqR1X/q1mPnCQOw8R36y2s+2MfpotzXJNyU2qnyvX7L8otk5ru4CADR
	xdn4ssudGccly+PdibjjKAAiyqVc3WI+ZtAEN3pReUH7gZdJhx6YAKzzzv98rSYKiyj4NKheG/6Mh
	Z0tznzsA5HWskscD5peFxXlBjEA4uhhTTHdBeYK/x5+VzYo6KTZ4oBRVDFuzPrj/1SLEyeY/yCpNM
	h+zo8/rUbyRO51WfOrI9H9G2tASkSC4z4Ab7Oofh31LiulTZPHbfsc8jVJmDyA7gfn0Thk4NHCMj3
	JcJaK82XNfhmWTDiYEaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloIS-0000000Amiw-3scL;
	Tue, 12 Aug 2025 12:40:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ull5B-0000000ALM7-2Tc2
	for linux-riscv@bombadil.infradead.org;
	Tue, 12 Aug 2025 09:14:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TcdYyVsr8u2xyDR+M+UHLCKM6ilDd8iFcrZx6NwCMNw=; b=gH06rEvTqE6okH6N2nGD5bovHx
	C1shDqjkRPsdOn+KKzARm7GuKPxmBiOp8jNE/PvU47KNJZ2Dz2JT+tJoMDWb8Z/x3VKfPQsG3+Qr9
	MuD/BbbNM9uIndh/iDG7SMNg9PdMC+IuehxGceOURNNv77uz6WwudXnaaT50oHmnLHm3ufcvbUdTh
	MfZWVkXI81NARX9gR1BuAN/NrPDLnxVCxoPsf/efUqF2ZXeRL/2ZndNa1VhQ+DjglG2OeY4IhN3aj
	6da3n7mLkzS4UoSjIyQDNo71yJj0tJEd1iGRFMOtsPKIH7Tm7DnSJlulsmJC0QuHtOLz1Gx2Bucx6
	zQWLrk4Q==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ull57-0000000FlpW-1651
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 09:14:12 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C48Btv019065
	for <linux-riscv@lists.infradead.org>; Tue, 12 Aug 2025 09:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TcdYyVsr8u2xyDR+M+UHLCKM6ilDd8iFcrZx6NwCMNw=; b=IhtfSRQ2YMp3r9Qb
	QTBakXU39kXnh3NAEBJK+jxPUhNti+qh2TnSA3O6FuXxZMFWJ92mtfpgaYuzpKlM
	79O6emmm+ijVk/GZsDz+7Y0utYD8xhI/HE1GcmNUUDbYPwtTK/pqvfAvkX1MCHXt
	zLgnT0FMJcu8wg830X801jUiQpgV5Zh9XqCh+ADbELn2FnOS9gICrZzQd5ELXDqc
	JMuHjW+zNFuPoGB+sR9PNb5guLJaT/oSku8iZRr5nqLYWea9Y4dIfvAon+7aBHnw
	WWDckRpDvB5IABisZYJyWOoePRF2XmOtgsNh7HDAjsCYrKKntzAOspkZicbfU5RC
	7W6NDg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxduyhp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 12 Aug 2025 09:14:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7073674bc2aso19187186d6.3
        for <linux-riscv@lists.infradead.org>; Tue, 12 Aug 2025 02:14:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990044; x=1755594844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TcdYyVsr8u2xyDR+M+UHLCKM6ilDd8iFcrZx6NwCMNw=;
        b=Gem+jSbFsrFO5AVtWygrSRQiVdEO5KDvTXJQVA+y8QpKvuzhvvzEzgSGpxah44Oavn
         6cwX9m0mCTKTj9zrcsCglEA4DuV/aupWfkgtrSxQX7aOiYoJc0sCrFM/Daov7DdzBD3E
         6wF9MZwdQQ650xdPYxi+Ob9ULMJQUicPhA2nvZudIICSnCloNZtvhQ2nT09uy+/Nf4bN
         QCBu2RBta0Sg5UmKY1WYmEgf63d/eEmaOiC8NHwkH0DdjCbxQHOfZH3XhyUA+6mlde8e
         uth3CNMj43UU5vlGnvPh6hV3bN3nFoIMklvlHjQvytSNYEHSeD4B9oL9F808z4XHBd50
         EkTw==
X-Forwarded-Encrypted: i=1; AJvYcCW3sWfHPmjCAmGicixrv0p9LdzBrjFOHzoAX0d4Guo+uQDOSvOjekNLeK+9bVOu7/sSZMPrwX5dTL9g9w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZlURVW+p/pnECenRE6k39jRtFI4YKNJMKk0fbzJrzbVMDsQM2
	j9ubYLOk/7wKggg29jtaBlvxGY5EXZMsDbWBIcKqgqv11gnKLIbJ52YSaKohRjEwGohYkWWCjGG
	PoaPW0OSHEXfuHHmaCdOJjTD3VWA2rWKYk99fwco3OQkRqUAjopXHe7ErivVquvzhbWPZQZc=
X-Gm-Gg: ASbGncuBZ7zrqGF1zv44ygLWF35sSxJYgm/oXX6tYM3j2L8ox1m11NLmFpibDdoXFiq
	hfg/KDn7qo7o/i68K2FDTPBdJla77TCwFcKYsPGR8Y/DzFF2RGDuUc2ML+4UQIqFuxayOfV+ZO4
	u9ZJEXOOn+vqFTWV8zFF4WYXTi7dlwKLC8QlwOF6IFk3PWphkw4vwDoSuewh+B66E/KbP9Ic5aM
	5rtuJdj7LRPpxDfgzTJ6ZheU5UqYzgFi7I/DNWp1Lx5ZXePLd+digZwfheQOUNuDJaLmgUnrhzN
	uNiDQVRGBl5l7cxnQ/l2bFZn0/xmSpibVX8noprzz+JvL8B32wLeTZdbTIz/4xcwKXYIogoHuuL
	HCyJPUECagW83pyDVGw==
X-Received: by 2002:a05:620a:462b:b0:7e6:3c48:408e with SMTP id af79cd13be357-7e860096e15mr26714285a.0.1754990044231;
        Tue, 12 Aug 2025 02:14:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIPCXaPbFG7yAsR8pzw0t16fLvywO1iDk8kuIeOO1bInlVQuLKav0rw2YYkObsTH0QGuYx8w==
X-Received: by 2002:a05:620a:462b:b0:7e6:3c48:408e with SMTP id af79cd13be357-7e860096e15mr26705885a.0.1754990043559;
        Tue, 12 Aug 2025 02:14:03 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a1251sm2177380166b.30.2025.08.12.02.13.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 02:14:02 -0700 (PDT)
Message-ID: <90f4eaaf-2513-4479-8647-b855a72e0e65@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 11:13:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 090/114] clk: qcom: alpha-pll: convert from round_rate()
 to determine_rate()
To: bmasney@redhat.com, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Paul Cercueil <paul@crapouillou.net>,
        Keguang Zhang
 <keguang.zhang@gmail.com>,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Takao Orito <orito.takao@socionext.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>,
        Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Yixun Lan <dlan@gentoo.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang
 <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Michal Simek <michal.simek@amd.com>,
        Maxime Ripard <mripard@kernel.org>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>,
        Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Neal Gompa <neal@gompa.dev>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>,
        Andrea della Porta
 <andrea.porta@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>, Qin Jian <qinjian@cqplus1.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Alex Helms <alexander.helms.jy@renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sophgo@lists.linux.dev, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-riscv@lists.infradead.org,
        spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
        asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        soc@lists.linux.dev
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-90-b3bf97b038dc@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-90-b3bf97b038dc@redhat.com>
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689b05dd cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=42SW9st40EnfI9Ma3XoA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: AwcQLSrAKZIyXHxMAPbLdmIYrY4U_ocM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfXwHlO/TqHKGlH
 C0yjLq6MOkEAsw+JxrIeF61c7xoR/rztCrfeSD2d7BkQB9CTM4oWbUk3R5iEbRvp05VChBKw7iH
 RWHPDEKJNoTIT5h7xmV72Ux07ZmQUee7Y/Hg4IZoIgDUdc95RwdTqyKBp2RrV3KVibSeKlYKSEK
 4V6ThP4lu243e7+qXi/OTGx4SE05qS2iRD4dAy4iLkv0X7q9Tv5piMmXIltylrZHQlsa7isoE7U
 W85PqoEpIgqaZ3+c2s7UDugKDKzS1JC2nFdV8KqTAUSGtNtfbcYm+qW2Ufte/e7orH3eyvbpfml
 baVpgjzORDb3xbSxa3KBfxF4ZrleZl/6p6HsoNZ9khzqqoP1Kd0PQayfD+B6h4qQQqI783KckHO
 qPfXw7jz
X-Proofpoint-GUID: AwcQLSrAKZIyXHxMAPbLdmIYrY4U_ocM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1011 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_101409_729695_D0299CD9 
X-CRM114-Status: GOOD (  15.13  )
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

On 8/11/25 5:19 PM, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
> 
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Note that prior to running the Coccinelle,
> clk_alpha_pll_postdiv_round_ro_rate() was renamed to
> clk_alpha_pll_postdiv_ro_round_rate().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

[...]

> +	req->rate = DIV_ROUND_UP_ULL((u64) req->best_parent_rate, div);

space after typecast is 'eeeh'

but the rest looks good

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
