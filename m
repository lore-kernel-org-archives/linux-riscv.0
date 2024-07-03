Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F478C30653
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 09:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4q1Dm0K8GaO2dp3h92Wcg299TiCYwJyTMTEaU4tIj9w=; b=fi2klyJkC4fH85
	KQxtkFdMmcL32+x+lAd6mGugxg10F4FDCgJBOLP6MzuJX73bY91aaMCVsUXqgmYySwbDcDSgKIWmx
	brTwaig3lrEe6mvCfdX0dqStYg1/j/qiqgD6S9yALFd915r4AywpCdK78y2J6oTJrEeyVdXyJf07n
	1z8ODItoWofyDTuzwa7HOqtXZbsJ/HS9s/3BGgQPHzqc35DlnTJZ7FSDilqDtn3iOKawmPfEhJ5PS
	ZvtB7+m/mGdrfL8HX2sZ9WhY92I2wTE2JRjB4N+l7+QRNvbzRrpha28hGZKonzx4vzpiQAzcWEjVD
	isgZkpkuydK9aiHQxL3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOwEf-00000009YfH-2rO0;
	Wed, 03 Jul 2024 09:25:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOwEc-00000009YdB-0pVZ;
	Wed, 03 Jul 2024 09:25:08 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4635J5OC023311;
	Wed, 3 Jul 2024 09:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NhWuFqAPuEIZttAM2h+ngzLqj84AMotQeV7cBgLDekI=; b=Oe2cRC9oUcmZXNcW
	hM3w/0u5nLB0Cx5k+dKOSTo08Bic13lHg4TYTCcdLxKFEKRi/0rsrn94Fv9iOUEt
	QfGED7rITsH1a5n9umtbWCS2jiC/JnQQvm5LbiK0tAmrOx/oAMoX6xYDOINMy0yg
	axaSv6uQvKmFIprMlyD0JQq5RC5kaFDxGiI4W/f12i6EakqOh1K6N392FGzTuTwH
	IIdppbm37Qm6/0eUlRTEsjn8ZqW2SHKz7E6D7/IeAecYk7jfzVUcSonLFvi7IImV
	MJNvKIzVl3hvD9D674f9Be5xEGzMh1Uqp10dnBgethkZ9qm5oh7h6AygfaPmgXWE
	+9RWTg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4050cy8k8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jul 2024 09:23:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4639NV8c020645
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Jul 2024 09:23:31 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 3 Jul 2024
 02:23:10 -0700
Message-ID: <bc135b67-a2e4-4b17-96c0-767bcb94d876@quicinc.com>
Date: Wed, 3 Jul 2024 17:23:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/47] arm64: dts: qcom: qcs9100: Introduce QCS9100 SoC
 dtsi
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
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
        <krzysztof.kozlowski@linaro.org>, <u.kleine-koenig@pengutronix.de>,
        <dmitry.baryshkov@linaro.org>, <quic_cang@quicinc.com>,
        <danila@jiaxyga.com>, <quic_nitirawa@quicinc.com>,
        <mantas@8devices.com>, <athierry@redhat.com>,
        <quic_kbajaj@quicinc.com>, <quic_bjorande@quicinc.com>,
        <quic_msarkar@quicinc.com>, <quic_devipriy@quicinc.com>,
        <quic_tsoni@quicinc.com>, <quic_rgottimu@quicinc.com>,
        <quic_shashim@quicinc.com>, <quic_kaushalk@quicinc.com>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
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
 <20240703025850.2172008-3-quic_tengfan@quicinc.com>
 <8593db2e-8a69-418f-b00e-8fafe434dd30@kernel.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <8593db2e-8a69-418f-b00e-8fafe434dd30@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jA8I-qqzAQ-FOzamwuZ3_GO9PajOhc6b
X-Proofpoint-ORIG-GUID: jA8I-qqzAQ-FOzamwuZ3_GO9PajOhc6b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_05,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxlogscore=901 priorityscore=1501 adultscore=0 mlxscore=0 impostorscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407030069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_022506_396328_D511BD2C 
X-CRM114-Status: GOOD (  16.30  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 7/3/2024 12:40 PM, Krzysztof Kozlowski wrote:
> On 03/07/2024 04:58, Tengfei Fan wrote:
>> Introduce QCS9100 SoC dtsi, QCS9100 is mainly used in IoT products.
>> QCS9100 is drived from SA8775p.
>> The current QCS9100 SoC dtsi is directly renamed from the SA8775p SoC
>> dtsi.
>> The QCS9100 platform is currently in the early design stage. Currently,
>> Both the QCS9100 platform and SA8775p platform use non-SCMI resources,
>> In the future, the SA8775p platform will transition to using SCMI
>> resources and it will have new sa8775p-related device tree.
>> This QCS9100 SoC dtsi remains consistent with the current SA8775p SoC
>> dtsi, except for updating the following sa8775p-related compatible names
>> to the qcs9100-related compatible name:
>>    - qcom,sa8775p-clk-virt
>>    - qcom,sa8775p-mc-virt
>>    - qcom,sa8775p-adsp-pas
>>    - qcom,sa8775p-cdsp-pas
>>    - qcom,sa8775p-cdsp1-pas
>>    - qcom,sa8775p-gpdsp0-pas
>>    - qcom,sa8775p-gpdsp1-pas
>>    - qcom,sa8775p-gcc
>>    - qcom,sa8775p-ipcc
>>    - qcom,sa8775p-config-noc
>>    - qcom,sa8775p-system-noc
>>    - qcom,sa8775p-aggre1-noc
>>    - qcom,sa8775p-aggre2-noc
>>    - qcom,sa8775p-pcie-anoc
>>    - qcom,sa8775p-gpdsp-anoc
>>    - qcom,sa8775p-mmss-noc
>>    - qcom,sa8775p-trng
>>    - qcom,sa8775p-ufshc
>>    - qcom,sa8775p-qmp-ufs-phy
>>    - qcom,sa8775p-qce
>>    - qcom,sa8775p-lpass-ag-noc
>>    - qcom,sa8775p-usb-hs-phy
>>    - qcom,sa8775p-dc-noc
>>    - qcom,sa8775p-gem-noc
>>    - qcom,sa8775p-dwc3
>>    - qcom,sa8775p-qmp-usb3-uni-phy
>>    - qcom,sa8775p-gpucc
>>    - qcom,sa8775p-smmu-500
>>    - qcom,sa8775p-dwmac-sgmii-phy
>>    - qcom,sa8775p-llcc-bwmon
>>    - qcom,sa8775p-cpu-bwmon
>>    - qcom,sa8775p-llcc
>>    - qcom,sa8775p-videocc
>>    - qcom,sa8775p-camcc
>>    - qcom,sa8775p-dispcc0
>>    - qcom,sa8775p-pdc
>>    - qcom,sa8775p-aoss-qmp
>>    - qcom,sa8775p-tlmm
>>    - qcom,sa8775p-imem
>>    - qcom,sa8775p-smmu-500
>>    - qcom,sa8775p-rpmh-clk
>>    - qcom,sa8775p-rpmhpd
>>    - qcom,sa8775p-cpufreq-epss
>>    - qcom,sa8775p-dispcc1
>>    - qcom,sa8775p-ethqos
>>    - qcom,sa8775p-nspa-noc
>>    - qcom,sa8775p-nspb-noc
>>    - qcom,sa8775p-qmp-gen4x2-pcie-phy
>>    - qcom,sa8775p-qmp-gen4x4-pcie-phy
>>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>> ---
>>   .../dts/qcom/{sa8775p.dtsi => qcs9100.dtsi}   | 112 +++++++++---------
>>   1 file changed, 56 insertions(+), 56 deletions(-)
>>   rename arch/arm64/boot/dts/qcom/{sa8775p.dtsi => qcs9100.dtsi} (97%)
>>
> 
> How do any things compile at this point? Please squash the patches. Your
> patchset must be bisectable at build level (dtschema validation does not
> have to).
> 
> Best regards,
> Krzysztof
> 

The compilation issue indeed arises when applying only this single 
patch. In the new version patch series, I plan to consolidate the three 
patches that rename sa8775p.dtsi to qcs9100.dtsi, sa8775p-pmics.dtsi to 
qcs9100-pmics.dtsi, and sa87750-ride.dts to qcs9100-ride.dts into a 
single patch.

-- 
Thx and BRs,
Tengfei Fan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
