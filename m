Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F0EAC3271E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jul 2024 07:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yMUiLWtThEe3VEZZU1iOci45BfxyeYqQ6fxEYSHPy2w=; b=o/z72QZexI4n9L
	aR2opHuNFDMxockezrVixp4CdGax9CqPqN24yrMTnKNZXTCtHgN46VOLsGCCOvmmz0gzPX+Xa3slj
	fD95xyLdq2380+cs9ScLtii/5zsMKMQPQd1V+0eUClcq9Tumzz5Q/2S/UfpSS6QCXBo5fnOVU/Nda
	aAoWpzkFZfgxt6+JndShhQXPcHWd8xfq/O5arHbtMq4fxVMeKHlIGIOA27PDwI3UXDolO+ZpZq7c6
	0JZ8GRelrhMJpX7SEKtoF/39bIPtL+fhF5MT7HdXeL9QpZq6rLX6WqNpFtHIBrHY7TkQHFlYUuN+V
	TRID1JZXzP9l2V6c0Lhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQiZs-00000002zt3-0cXc;
	Mon, 08 Jul 2024 07:14:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQiZo-00000002zs2-3ryO;
	Mon, 08 Jul 2024 07:14:22 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4680R1T3031488;
	Mon, 8 Jul 2024 07:13:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oVQgIh72nNA4GfK+pn5YNj9SZPpD84n0grZ2Sjd1hiM=; b=k4k0gjOTh+Vxo9s/
	h9S8/RA7yKThjmbvcW/tFXO+sXXLk07A8ojbHYxPlHvFElRS9CX2tSmoPlG0WvoA
	BD3e0KVxPgnJK5C7Q8ARMoE5DvnYQmSnBTz8b/EusqvvIUmk+krrOnkSUZLTcUko
	yPM5CWKPOhDhwHhIninv839irig80p5xHdCayzX+4VCwSAyLd2RjWvHwkb+yrAxA
	I3JL/ihKAuVbLfn6472ACWvJdbgeUUMZcaWc4u+iE9EbBg7NrSKPSxvdd0FcVLUv
	1//BmZOHCzJnmVQqJkSlzIdbXEXACBKgaJ8/R3Nel/axg3KwBECd7MtoM431QbS4
	zpDsQQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wgwjvnj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jul 2024 07:13:46 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4687DiCn028522
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Jul 2024 07:13:44 GMT
Received: from [10.239.132.150] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 8 Jul 2024
 00:13:23 -0700
Message-ID: <c9822569-896c-4d5f-b917-2826bf414e67@quicinc.com>
Date: Mon, 8 Jul 2024 15:13:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/47] dt-bindings: arm: qcom: Document QCS9100 SoC and
 RIDE board
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Tengfei Fan <quic_tengfan@quicinc.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <djakov@kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <jassisinghbrar@gmail.com>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <manivannan.sadhasivam@linaro.org>, <will@kernel.org>,
        <joro@8bytes.org>, <conor@kernel.org>, <tglx@linutronix.de>,
        <amitk@kernel.org>, <thara.gopinath@gmail.com>,
        <linus.walleij@linaro.org>, <wim@linux-watchdog.org>,
        <linux@roeck-us.net>, <rafael@kernel.org>, <viresh.kumar@linaro.org>,
        <vkoul@kernel.org>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <mcoquelin.stm32@gmail.com>
CC: <robimarko@gmail.com>, <bartosz.golaszewski@linaro.org>,
        <kishon@kernel.org>, <quic_wcheng@quicinc.com>,
        <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <agross@kernel.org>, <gregkh@linuxfoundation.org>,
        <quic_tdas@quicinc.com>, <robin.murphy@arm.com>,
        <daniel.lezcano@linaro.org>, <rui.zhang@intel.com>,
        <lukasz.luba@arm.com>, <quic_rjendra@quicinc.com>,
        <ulf.hansson@linaro.org>, <quic_sibis@quicinc.com>,
        <otto.pflueger@abscue.de>, <luca@z3ntu.xyz>,
        <neil.armstrong@linaro.org>, <abel.vesa@linaro.org>,
        <bhupesh.sharma@linaro.org>, <alexandre.torgue@foss.st.com>,
        <peppe.cavallaro@st.com>, <joabreu@synopsys.com>,
        <netdev@vger.kernel.org>, <lpieralisi@kernel.org>, <kw@linux.com>,
        <bhelgaas@google.com>, <ahalaney@redhat.com>,
        <u.kleine-koenig@pengutronix.de>, <dmitry.baryshkov@linaro.org>,
        <quic_cang@quicinc.com>, <danila@jiaxyga.com>,
        <quic_nitirawa@quicinc.com>, <mantas@8devices.com>,
        <athierry@redhat.com>, <quic_kbajaj@quicinc.com>,
        <quic_bjorande@quicinc.com>, <quic_msarkar@quicinc.com>,
        <quic_devipriy@quicinc.com>, <quic_tsoni@quicinc.com>,
        <quic_rgottimu@quicinc.com>, <quic_shashim@quicinc.com>,
        <quic_kaushalk@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-pm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
        <linux-riscv@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>, <kernel@quicinc.com>
References: <20240703025850.2172008-1-quic_tengfan@quicinc.com>
 <20240703025850.2172008-2-quic_tengfan@quicinc.com>
 <665f6c8c-4f43-4d20-90e9-9e037a942066@kernel.org>
 <fbeb5969-0b3a-455e-88eb-b83734bf2c50@quicinc.com>
 <97c9484b-e257-4163-a104-3457d59bc69b@kernel.org>
 <63eb3f58-d4a4-4a27-b78c-f4cb83e62c63@quicinc.com>
 <f8f3c4d4-bf24-4195-a7b0-eec95cd64b57@linaro.org>
From: "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>
Content-Language: en-US
In-Reply-To: <f8f3c4d4-bf24-4195-a7b0-eec95cd64b57@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Xv0uyNlFtYweTJimUd2_Zu7YnPGml5J3
X-Proofpoint-ORIG-GUID: Xv0uyNlFtYweTJimUd2_Zu7YnPGml5J3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_02,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=966 mlxscore=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407080054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_001421_199376_79113F73 
X-CRM114-Status: GOOD (  11.37  )
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



On 7/8/2024 2:07 PM, Krzysztof Kozlowski wrote:
> On 08/07/2024 06:45, Aiqun Yu (Maria) wrote:
>>
>>
>> On 7/3/2024 5:33 PM, Krzysztof Kozlowski wrote:
>>> On 03/07/2024 11:21, Tengfei Fan wrote:
>>>>>>         - items:
>>>>>>             - enum:
>>>>>> +              - qcom,qcs9100-ride
>>>>>>                 - qcom,sa8775p-ride
>>>>>> +          - const: qcom,qcs9100
>>>>>
>>>>> This changes existing compatible for sa8775p without any explanation in
>>>>> commit msg.
>>>>>
>>>>> Best regards,
>>>>> Krzysztof
>>>>>
>>>>
>>>> In the next verion patch series, I will provide relevant explanatory 
>>>> information in this patch commit message.
>>>
>>> TBH, I cannot think of any reasonable explanation for this, especially
>>> considering rest of the patchset which does not fix resulting dtbs_check
>>> warning.
>>
>> The existing compatible "sa8775p" warning can only be addressed When
>> @Nikunj's "sa8775p" changes merged.
>>
>> Let me know if you have other suggestions for this.
> 
> I don't have, because I don't understand why do you want/need to change
> existing board compatible.

We can left the current existing sa8775p board compatible as it is. And
have a brand new qcs9100 and qcs9100-board item for current non-scmi
resources compatible.

Will that be more reasonable from your end?

> 
> Best regards,
> Krzysztof
> 

-- 
Thx and BRs,
Aiqun(Maria) Yu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
