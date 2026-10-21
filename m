Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531D6606A329
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 09:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wSJjDRRJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=TpCL72Gw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ahXk7078;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dxRdnJWi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4q/x122wUTXMLFXevzmumHKt2epImqAKaxV4NjQMXa8=; b=wSJjDRRJVszMtL
	ETyL6Kf747RFllW9aYiqBubYRYRuyViCw8LcMuLhZbJgpnKOrRElrLjDpDPxUQ0u2V4vtTnMQA6ib
	b8qms8pSWDs9aozvKh6OWJk+uKLPFG4PSPVyEEHxXU7ljnSj8uxZ0mfwMw9hpDW6/LXa1/906/dXS
	OiOqMK1l9o51v+WaFHzf3UMYmBq3W4Q5xLmKF+LLBayVi8uMUk11vm1aIrRWLTCWUFA6UyBx8c4AE
	UIPQbUilWbSNLriIjwyQ7udvr55cvONdkp/HCuZoDddv7R9+fZruNUAhZe7fAyk3w7udb/GKdDeTQ
	atcplX+9LJZAMwmyaBPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSsM-0000000BWDU-49pm;
	Wed, 21 Oct 2026 09:44:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSsL-0000000BWCk-2aDv
	for linux-riscv@bombadil.infradead.org;
	Wed, 21 Oct 2026 09:44:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZICGnoDUzzWlAQIxspOsX/uJiYZvuNvYB+Jhm0X2C4U=; b=TpCL72GwEdgJeK0xewzEyDTiI0
	09J4epfNLFZDTg1ubn3yPd/6y75viM6+qjqqTHF0KJURn04s3+KUGJjj+NvyGY97GueXFqe4Wf6DB
	2/Ls8E4/s2BqxUW8RMhlAa17kz6N1FT2nBMSKkwUDuG4Zp2cBswCJ8/izvdSUNXvT3pnju+3Xldsu
	HyiA2mwZYAiUjtIbsJRI5lZ90tIjcKkzC7jE50D9HE2yLBUaid2MK094bhrqOJRh2p+6lu7DS2mUj
	C7yCT4VOjPdfsUEe/jsndmJOvivLlGCtP77DJX8CdYUZWY7EkovSXlsla4kaXruQRt++gHYk8nVD0
	NtdHLRzA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJSsH-00000005fKV-3dbK
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 09:44:48 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j6vh793336
	for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 09:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZICGnoDUzzWlAQIxspOsX/uJiYZvuNvYB+Jhm0X2C4U=; b=ahXk7078Eg6/b5Ya
	BEW6RV60mcxyAc3S+r/XwNQA8a5FhN9ioUdntl5Hh2qEPJaAB6KJuZlvz+rwprEr
	g9xvPfooth56P+Qs5KIVFP2xPsqNgZwEUq5snCTWrGa5e0dF2G6yPPYDAGQItnKg
	81trmTb8mz34C1Dmny8QhvNV3lb85iZ+kxmKXeA2I2S6OZ3yk9DIxFvB+qojIotU
	Z48gmHMqxhI7tsRmT7aDo5PSGmiAvuftosIIImUw7c6r+js6IcXjgqXE20fKdRBV
	4WH7b66ZvGpz36jOQ+09QSNZX1NusCJY5yu+W3FdP3QLkRHhpjiCi4AfJHXpISgh
	DhIygQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedabkatp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 09:44:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso8107485a.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 02:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792575881; x=1793180681; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZICGnoDUzzWlAQIxspOsX/uJiYZvuNvYB+Jhm0X2C4U=;
        b=dxRdnJWiyGm1hqsSXEZHxYZOeZ5vQLCKz4jGRQCmVpeAr2lzDZTz17ChhE1BBjZiRU
         zFdcKxptzW3pCOtOa7BBpAHNnWDrO98NbGc2lovLpkNPjRcpuVVZCbPimlFoGxeeGIeb
         6/7kLo6oEnI3RT973mpo7OCGA05WS7raLcKuFRWA9qnmuMpmCiQGY/G0F+xD7qfrFpY3
         BLaGp7tsDf5nngQyEKRl6TzeW8JlnxlLL+HafniCXW1qe1a9m9186w2xzcirsmBZEauw
         jtbL2kRp6uMSRMk7LogeLwhseJMei4+oVRtbRgH0zqMMgS8hcLQXbfspNrZUy+eQ7wM5
         vBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575881; x=1793180681;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZICGnoDUzzWlAQIxspOsX/uJiYZvuNvYB+Jhm0X2C4U=;
        b=IphNRXEwF2Ixlq2JOxtftsMmT6CTxeVBv5nLsp5+qK9zyVjNVwN29xbWK0lJwiRocE
         uefFzG4yf/1stRT1aoQ7Bs21Hvl0hoC8vpu/VBce+sNcvZLSXE6PYyXlwcuW5nEIPBoI
         u1OIeON2G15jct+pBcYCzwXkrrTUXgW3CQKCEjCnXfK1M9URHBPRviPdBWiag3g5l5Vo
         UMU+UG83yLbsFe9JXVs70vUM7/Ae2frnUrSh78Tg1hg2vNUd4VA/nVkfdEOD4wugbKpk
         Xx5ZvyTiDVThNEATeCnX9ZaMsX4koWu5tWNY8f8npTWJstOywtrp5EX20jhHrkCAcLA4
         WMkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpk9bIGuDSB9lKsq6t2Q1RRhIy8QPjgmCWWX5hcVIfBctHn8wdKlZhrMQNld/taiptUh4czNy7HPSRLA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLew3MpkUgIDa+NkXEiWGTeMNDFUTQeXUZXQh6qZ/nuPOwDUhzv
	uq+QhIP1I4BBIao0bGJd2b6mtWb3A9vg1TNgK+867Xe5mCb0ol26iIzqclI7Y+rphWD/n8UuNZo
	R5YeZGRqSVLTfXdcSsHLFcTdySGKAZ2aINwTJWSPc4L0l3SF6gFyf36mte2tHlAmzk8LlU30=
X-Gm-Gg: AYBFou1DAThgyDfKz6frs1KXOe4JW6fm9aBPcWwaqjbj7+R3BRZUxVUAlnIEHA2UPyA
	qgYlUFvwbzjxJJeRjPKfl9KgklTRWxOtrVdMvGzKHQXh/+C02it5FlfF5dofFkr1MdDPgoe4KQ8
	wbfDUF8WwIpI7KQDq2vtxpQ4VzTMnvL0uQzlk7Z9ETyYNzsIrSCpVaAWTO5GZSzbmTmltUkcdqp
	K6m39WtW7ji+16zp3Ag7D1QJ3MWjgm+ZTqg4I3L2ojuT3PjnTK+H7Zr9ZhKOnmKsYw/VslRsfTk
	Rbap5RQcjRJ97h4AIa80iHNLm1ENl8QGZ2FzYMI1vW0VxCqYFIIUgJH5bo9/1MdwmWRd8UhmZEW
	P1zn5FJMPKEMWNmzXdY1cIA==
X-Received: by 2002:a05:620a:4511:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f57f3bf10mr367394385a.3.1792575880917;
        Wed, 21 Oct 2026 02:44:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f57f3bf10mr367390585a.3.1792575880494;
        Wed, 21 Oct 2026 02:44:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f7cc2csm59794166b.24.2026.10.21.02.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:44:39 -0700 (PDT)
Message-ID: <8ceba969-91d2-4b43-81d0-b26e7139664b@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:44:31 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port
 numbering
To: Chen-Yu Tsai <wenst@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai
 <billy_tsai@aspeedtech.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Peter Griffin
 <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Troy Mitchell <troy.mitchell@linux.spacemit.com>,
        Minda Chen <minda.chen@starfivetech.com>,
        Shyam Pandey <radhey.shyam.pandey@amd.com>,
        Wei Yang <yangwei1@eswincomputing.com>,
        Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
        Hang Cao <caohang@eswincomputing.com>, Li Jun <jun.li@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Roy Luo <royluo@google.com>,
        Yang Xiwen <forbidden405@foxmail.com>,
        Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
        Robert Marko <robert.marko@sartura.hr>, Xu Yang <xu.yang_2@nxp.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stanley Chang <stanley_chang@realtek.com>,
        Ze Huang <huang.ze@linux.dev>, Aswath Govindraju <a-govindraju@ti.com>,
        Roger Quadros <rogerq@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
        imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
        Mathias Nyman <mathias.nyman@intel.com>
References: <20261014082037.1774672-1-wenst@chromium.org>
 <20261014082037.1774672-3-wenst@chromium.org>
 <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org>
 <CAGXv+5G1kgyumbj7wGf6rPFbg3spSO0zYmEkn-hZT4qUdJbytA@mail.gmail.com>
 <03375a31-0ac6-47a4-b0dc-6327080e1622@linaro.org>
 <b4c0761b-34f2-42ad-97e7-ab34ae776281@oss.qualcomm.com>
 <8d4d3ec2-3c97-4a46-97f8-048fdf81b853@linaro.org>
 <CAGXv+5G_ig=k-eH8Cp0ES70WxTHcBS2TVj9VmHaG9caROiAuQQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAGXv+5G_ig=k-eH8Cp0ES70WxTHcBS2TVj9VmHaG9caROiAuQQ@mail.gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzOCBTYWx0ZWRfX9L7LUbVd+U2b
 ageqDRPemPE/Fpb9eTPZzbWl5cR+u2DWhhY5wH2oYxc5E7at/IA0kTTyliEUsVNImrx5QobQHZ6
 AJutMTu1381XX4rsZeOizs2lJEItlR4=
X-Proofpoint-ORIG-GUID: ocHIY4J0WSyfFxzrnA7C4wdgz3d3hpuG
X-Proofpoint-GUID: ocHIY4J0WSyfFxzrnA7C4wdgz3d3hpuG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzOCBTYWx0ZWRfX7YGHsveCUHIE
 RvYaJbHzDUqDk1cjKgqcWVe/g+9+sQiFBpYk+aS+cWA7BZ85FpVhQ3SC8NO4SM1mVVYpvj9KHT2
 SZWr0m3ww+9Y1eScw54GTYhnP/lArsuflgFzWggoSkBzX2HYWJpq3rTXB9okZj9gyJy2UuIcGMu
 MbZqOFLgW/QPB3EppUVmS4S4qZowvOyZuJZbg+FjNkODG146klYTwM+ggqkCN5hdAOcZ1LPqhT5
 P/odH9HD5cbUy2Ou4ewTvgZO/EtPeAOszJV2valSM2RW8hAV89srROcF2Qm/o6BkQ1Z+W28RdJf
 rUXqFQB9V2VTVp6AxHZ9gYqUWwHEGorL1sIGZYhpk/cWxyqEM5SImvK4ohBw8H9rQYMp6woPQoV
 s7fDTA9cM9621MyPM5/5zT6mfDZL/o7xlZoP//7BDZVL+aggKwHhk8gDhgEC+khS56+xJbxilQ2
 4GqgJwAVAFdM93ttHOw==
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ad88989 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=iuaGvn3fa_lUOTDqeYoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_104446_508282_4EEAF4FB 
X-CRM114-Status: GOOD (  21.74  )
X-Spam-Score: -0.9 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTAvMTUvMjYgMTE6MDAgQU0sIENoZW4tWXUgVHNhaSB3cm90ZToKPiAoQ2MtZWQgTWF0aGlh
cywgdGhlIHhIQ0kgZHJpdmVyIG1haW50YWluZXIgaW4gY2FzZSBJIG1pc3VuZGVyc3Rvb2QgeEhD
SS4pCj4gCj4gT24gVGh1LCBPY3QgMTUsIDIwMjYgYXQgNDo0NOKAr1BNIE5laWwgQXJtc3Ryb25n
Cj4gPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+IHdyb3RlOgo+Pgo+PiBPbiAxMC8xNC8yNiAx
ODozNiwgS29ucmFkIER5YmNpbyB3cm90ZToKPj4+IE9uIDEwLzE0LzI2IDExOjQ0IEFNLCBOZWls
IEFybXN0cm9uZyB3cm90ZToKPj4+PiBPbiAxMC8xNC8yNiAxMToyOSwgQ2hlbi1ZdSBUc2FpIHdy
b3RlOgo+Pj4+PiBPbiBXZWQsIE9jdCAxNCwgMjAyNiBhdCA1OjI44oCvUE0gTmVpbCBBcm1zdHJv
bmcKPj4+Pj4gPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+IHdyb3RlOgoKWy4uLl0KCgo+PiBI
b3cgYWJvdXQgdGhlIFVTQjQsIGRvZXMgaXQgdXNlIHRoZSBVU0IzLjAgcG9ydCA/Cj4gCj4gSSdt
IG5vdCBmYW1pbGlhciB3aXRoIFVTQjQuIEEgcXVpY2sgc2VhcmNoIHNheXMgdGhhdCBpdCBjYW4g
dHVubmVsCj4gVVNCIDMueCwgRFAsIGFuZCBQQ0llLCBhbmQgaXQgZG9lc24ndCBoYXZlIGl0cyBv
d24gVVNCIEhDSSBkZWZpbmVkLgo+IAo+IFNvIEknbSB0aGlua2luZyB0aGUgVVNCNCBjb250cm9s
bGVyIHdvdWxkIGJlIG1vcmUgbGlrZSBhIG5leHVzIG5vZGUKPiBvciBtdWx0aXBsZXhpbmcgbm9k
ZSwgb3IgcGVyaGFwcyBsaWtlIGEgVVNCIEMgY29ubmVjdG9yLiBJdCBoYXMgaW5wdXQKPiBwb3J0
cyBmb3IgYWxsIHRoZSBwcm90b2NvbHMgaXQgY2FuIHR1bm5lbCwgY29ubmVjdGVkIHRvIHRoZWly
IHJlc3BlY3RpdmUKPiBjb250cm9sbGVycyAoWEhDSSwgRFAsIFBDSWUpLiBUaGUgYmluZGluZyBw
cm9iYWJseSB3b3VsZCBiZSB2ZXJ5IG1lc3N5Cj4gaWYgb25lIGNvbnRyb2xsZXIgc3VwcG9ydGVk
IG11bHRpcGxlIG91dGdvaW5nIHBvcnRzLCBhcyBlYWNoIGRvd25zdHJlYW0KPiBwb3J0IGhhcyBh
IDMtdG8tMSByZWxhdGlvbnNoaXAgd2l0aCBpdHMgcmVzcGVjdGl2ZSB1cHN0cmVhbSBwcm90b2Nv
bAo+IGludGVyZmFjZXMuCgpZZWFoIHRoYXQgaXMgbW9yZSBvciBsZXNzIGl0LgoKVGhlcmUgbmVl
ZHMgdG8gYmUgYSBjb25uZWN0aW9uIGJldHdlZW4gdGhlIFVTQjQgcm91dGVyIGFuZCB0aGUgbmF0
aXZlCihVU0IzICpwb3J0Kiwgbm90IGh1YiB8IFBDSWUgKnBvcnQqLCBub3QgUkMgfCBEUFRYKSBw
cm90b2NvbCBhZGFwdGVyCndoZXJlIHRoZSB0dW5uZWxlZCBwYWNrZXRzIGVuZCB1cCBhdCB0byBj
cmVhdGUgYSBQTSBkZXZsaW5rIGJldHdlZW4gaXQKYW5kIHRoZSBVU0I0IHJvdXRlci4KCkFDUEkg
ZG9lcyB0aGF0IGJ5IGFkZGluZyBhIGB1c2I0LWhvc3QtaW50ZXJmYWNlID0gJnJlZmVyZW5jZV90
b19yb3V0ZXJgCnByb3BlcnR5LCBmb3IgRFQgdGhhdCdzIHN0aWxsIHVuZGVjaWRlZDoKCmh0dHBz
Oi8vZ2l0aHViLmNvbS9kZXZpY2V0cmVlLW9yZy9kdC1zY2hlbWEvcHVsbC8xOTYKCkFzIGZhciBh
cyB0aGUgUXVhbGNvbW0gaW1wbGVtZW50YXRpb24gZ29lcywgSSB3YXMgaG9waW5nIHdlIGNvdWxk
CmdvIGZvcndhcmQgd2l0aCBiYXNlMSBudW1iZXJpbmcgYXMgdGhlIERXQzMgaXMgYW4gWEhDSSBj
b250cm9sbGVyOgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtdXNiLzIwMjYwOTI5LXRv
cGljLWR3YzNfdHVubmVsaW5nX3N0YXRlLXY0LTAtNjNlMjk2MzQ2ZDU3QG9zcy5xdWFsY29tbS5j
b20vCgpLb25yYWQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
