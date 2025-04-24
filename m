Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900A0C369D7
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 05:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZJBArhaRQLPQd0eQyxSdEoh9MD055DDcEFovxYZPqL8=; b=faxYkao3Bx6IMn
	844z5GsvOsO/aFAPJAx5/KTRm0Ji+uLQQ86ltXP1Br8SgGbjXFyRh9oE45MudUiMYeRc/gsb00cNc
	8mNXvtI5MQMGMqHWJdaZYXqCYrqa59YhZAY+OPL5hC19xDcarTza+7WuQJaqZAlSPCO3TNVFdT/fG
	XJ74CvkomjokYAaDIlHzWG5i49x3RNR+eAlTLlzvsdVpgjdwP91tdTskN+W7hYjj4hrSRm5x7sGU/
	pSlBvtawWBOUcbJcKmUcD7xPzkxIWcvGubHXaRVN5nMRvmGlvK0POeDJdiEDGU/aYcBrnSwbcaPQu
	ZA9uQMzIr1B4Hzk26q3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7os7-0000000Cqyu-0fOG;
	Thu, 24 Apr 2025 05:11:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7os3-0000000CqyD-3XDV
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 05:11:37 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F8TI010153
	for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 05:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1g/H3A2mjEOxfLNFKxbSpvE+IXNCVSXHyxhD/lc8Qpo=; b=Hht326GNTGeNIhfc
	0bf6tRk7BA8fhuYrp8hqO63xWhHH3qGlL16PFWaRNiRkFlWnsuFgmMYT+DsPyKXf
	RNJ3+0GKm+plbaYw/hnAbuGA0DkDtcdWLS7PVXl2imeqlXKWz5rAl4Gh0PZeMPh8
	2AeSCzyI7O8XbOib+gLfE+NFRw02kARZEb4HGjTxj4sybrmZAo/F0iACblYP+YD1
	BacGfbstmaMabLkAJJ+uKx1NJz8PhDYyk0bSC6iAG7+nC4JG0cTJ9g7dMyv0rVBm
	p8fY3M2jWkrebL0+YqJ5+sw64ILJYq9qjF4OcwwDyOSqgYVnOmZMOShUAVNAisiS
	N5+UjA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0canw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 05:11:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff798e8c90so587501a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 23 Apr 2025 22:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745471493; x=1746076293;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1g/H3A2mjEOxfLNFKxbSpvE+IXNCVSXHyxhD/lc8Qpo=;
        b=ddKzOSGR4W7o2Hd6HJdiFPktsw3UM++j3qaaLs8VfumDWzNVKcJBzN5Ugf06T9WeC5
         /S6GzeNRhPGbCMQMAf7eT579t46JyskQ3gKc5e0OKjVzcDApv1aXIdRHXnVbeATxQnrX
         rCnVv2Vi6aWERZ3yUKpk+U4ziPN8yvKTPqwxx3OZbVvMsBsX6rBot4muJntfYhoV0UPk
         zdCysQFwrNCfR+R+25Cj9s4ToAHQLnxJF9zEIhwtyvCC9QQ4R5K+2tno7CxXDWND8nFl
         EXkbNn9YZTBMGwYlKxiYwtRB9zzZzKNhSi3uwK/3ZGJV2DIScoZ5ulz133/JOCeuuIH/
         iU4A==
X-Forwarded-Encrypted: i=1; AJvYcCVAdp+3QoAUrR1Qln9b/8dDlUkQGBNbBCuFr48ggB6/rHEqm2HXuWDvTwg4xuWZsNI0i0rYo0MepMVRJg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0jOlo+5b5gEeWHVsQdcMQn0exA0dYFEH1t5GgmL5F7iwL0kMz
	Krr1UlUxvRWpamdAsBrgmyPo8AKY6esHWNetyYKnFWZ2rYOzuqsp918Ibisgu2G6XTABmOcVBnt
	Ys1m2I6d0PXN9oAieSr1PqvV/B3BRsk15gCKv4vRmWGyV2V7C/QJWaAgyrAHykAWev/8=
X-Gm-Gg: ASbGncuKCvnVcfMmQaTPH4j8MuHkzmP47GUCZTBDETgoLNYdUfqszR7Aavlua8A/J9V
	8fbo3LI9VE7P5p4KpGYiEDFU9C8lD+2WEw+YHtoEVI/zD3G8aEXfbNEuS416/3uqRD4A6atkHL1
	ypHNg8SArE1ouQKcnw/yG3Rwl2oMn+RwcVKtTALJKB7NAs0gPMAp24aNJD9sspkEtS5Y0x1/8Es
	P6ddckI6X3WD/m7E4WFtPQrE1Yd2KmqP0U7J++mS7BkZlzFOnQ5pn7puIZSQ1WBB6fUt1PGkU0H
	BfrXeSEDyaLQBEYz9tcpxGuDRETQR5No+JxV0aLL+A==
X-Received: by 2002:a17:90b:2741:b0:301:98fc:9b51 with SMTP id 98e67ed59e1d1-309ed24bd2cmr1791973a91.5.1745471493271;
        Wed, 23 Apr 2025 22:11:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5SApp51kUWo79y5fXsGYF6r+exe1bnqAhOk9GnTlMlKAb5gSFGBzPaTpNXkU2mQHZEv7Q9g==
X-Received: by 2002:a17:90b:2741:b0:301:98fc:9b51 with SMTP id 98e67ed59e1d1-309ed24bd2cmr1791931a91.5.1745471492726;
        Wed, 23 Apr 2025 22:11:32 -0700 (PDT)
Received: from [10.92.199.136] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef097d56sm320932a91.29.2025.04.23.22.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 22:11:32 -0700 (PDT)
Message-ID: <31f071d7-db56-f032-749e-92bc387238b8@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 10:41:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 5/5] PCI: qcom: Add support for resetting the slot due
 to link down event
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Oliver O'Halloran <oohall@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>,
        Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Marc Zyngier <maz@kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>, dingwei@marvell.com,
        cassel@kernel.org, Lukas Wunner <lukas@wunner.de>,
        linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
References: <20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org>
 <20250417-pcie-reset-slot-v3-5-59a10811c962@linaro.org>
 <f32b2ece-f7ed-45ab-2867-9d276b88cf62@oss.qualcomm.com>
 <hmyeha6ygi6mxzsdivo2z5ccpvl5l2xietr3axxpl4zwojiavo@wuli4qazg446>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <hmyeha6ygi6mxzsdivo2z5ccpvl5l2xietr3axxpl4zwojiavo@wuli4qazg446>
X-Proofpoint-GUID: wvwBuJAI_RwEjwgDsEXN_xdctayNJLTm
X-Proofpoint-ORIG-GUID: wvwBuJAI_RwEjwgDsEXN_xdctayNJLTm
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=6809c806 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=HZEN96OWHqwnsOiu:21 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=lE8Iksk3R2_BZhG9ioYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDAzMSBTYWx0ZWRfX1Gy3Dggvsa1o WPUR5e6K5KCzvEAH8MSeddOqCliuwMe/+P2XQzFKtmd+1ElRuiYAQPpcUtckTS+e4I1eiF5xuXi tQIlVZN8SKehbbtOOImH3GUi7p0aJynRbLXZb5OhqBtttrB5x5B7hWJvFtrjinacMWp9ZiIdX3Y
 RpiGCIHdVaCFb3o6lWhq5H5yc1VwAD+DDwp1rqHSm9j0SXni4jbOsmFuJyAaNCwlrhzgTU1byZ7 V7lrb0ldrErY/pEdxAm9d3bPaPeDuqQnyKu5XAf85RhZmXtk/0sW70zJ0N4rlAy50aoLPzrIc9T SN9e3M5uoYPVSOIfUICIp78nIS14Fos0imq0WdlHFIi903U3x1oiU2zQI79/hl1mZPES0hRYady
 iXzI+w7GjLyCs4+yElzMBP3RxPtwr5plOA0SvrNZBdbngyeXnMbUbTW26lxSEWZoSMIi7NfT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_01,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_221135_899922_02E13D6F 
X-CRM114-Status: GOOD (  31.34  )
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



On 4/24/2025 10:30 AM, Manivannan Sadhasivam wrote:
> On Fri, Apr 18, 2025 at 08:11:47AM +0530, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 4/17/2025 10:46 PM, Manivannan Sadhasivam via B4 Relay wrote:
>>> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>>
>>> The PCIe link can go down under circumstances such as the device firmware
>>> crash, link instability, etc... When that happens, the PCIe slot needs to
>>> be reset to make it operational again. Currently, the driver is not
>>> handling the link down event, due to which the users have to restart the
>>> machine to make PCIe link operational again. So fix it by detecting the
>>> link down event and resetting the slot.
>>>
>>> Since the Qcom PCIe controllers report the link down event through the
>>> 'global' IRQ, enable the link down event by setting PARF_INT_ALL_LINK_DOWN
>>> bit in PARF_INT_ALL_MASK register.
>>>
>>> Then in the case of the event, call pci_host_handle_link_down() API
>>> in the handler to let the PCI core handle the link down condition.
>>>
>>> The API will internally call, 'pci_host_bridge::reset_slot()' callback to
>>> reset the slot in a platform specific way. So implement the callback to
>>> reset the slot by first resetting the PCIe core, followed by reinitializing
>>> the resources and then finally starting the link again.
>>>
>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>> ---
>>>    drivers/pci/controller/dwc/Kconfig     |  1 +
>>>    drivers/pci/controller/dwc/pcie-qcom.c | 90 +++++++++++++++++++++++++++++++++-
>>>    2 files changed, 89 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
>>> index d9f0386396edf66ad0e514a0f545ed24d89fcb6c..ce04ee6fbd99cbcce5d2f3a75ebd72a17070b7b7 100644
>>> --- a/drivers/pci/controller/dwc/Kconfig
>>> +++ b/drivers/pci/controller/dwc/Kconfig
>>> @@ -296,6 +296,7 @@ config PCIE_QCOM
>>>    	select PCIE_DW_HOST
>>>    	select CRC8
>>>    	select PCIE_QCOM_COMMON
>>> +	select PCI_HOST_COMMON
>>>    	help
>>>    	  Say Y here to enable PCIe controller support on Qualcomm SoCs. The
>>>    	  PCIe controller uses the DesignWare core plus Qualcomm-specific
>>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>>> index dc98ae63362db0422384b1879a2b9a7dc564d091..6b18a2775e7fcde1d634b3f58327ecc7d028e4ec 100644
>>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>>> @@ -34,6 +34,7 @@
>>>    #include <linux/units.h>
>>>    #include "../../pci.h"
>>> +#include "../pci-host-common.h"
>>>    #include "pcie-designware.h"
>>>    #include "pcie-qcom-common.h"
>>> @@ -55,6 +56,7 @@
>>>    #define PARF_INT_ALL_STATUS			0x224
>>>    #define PARF_INT_ALL_CLEAR			0x228
>>>    #define PARF_INT_ALL_MASK			0x22c
>>> +#define PARF_STATUS				0x230
>>>    #define PARF_SID_OFFSET				0x234
>>>    #define PARF_BDF_TRANSLATE_CFG			0x24c
>>>    #define PARF_DBI_BASE_ADDR_V2			0x350
>>> @@ -130,8 +132,11 @@
>>>    /* PARF_LTSSM register fields */
>>>    #define LTSSM_EN				BIT(8)
>>> +#define SW_CLEAR_FLUSH_MODE			BIT(10)
>>> +#define FLUSH_MODE				BIT(11)
>>>    /* PARF_INT_ALL_{STATUS/CLEAR/MASK} register fields */
>>> +#define PARF_INT_ALL_LINK_DOWN			BIT(1)
>>>    #define PARF_INT_ALL_LINK_UP			BIT(13)
>>>    #define PARF_INT_MSI_DEV_0_7			GENMASK(30, 23)
>>> @@ -145,6 +150,9 @@
>>>    /* PARF_BDF_TO_SID_CFG fields */
>>>    #define BDF_TO_SID_BYPASS			BIT(0)
>>> +/* PARF_STATUS fields */
>>> +#define FLUSH_COMPLETED				BIT(8)
>>> +
>>>    /* ELBI_SYS_CTRL register fields */
>>>    #define ELBI_SYS_CTRL_LT_ENABLE			BIT(0)
>>> @@ -169,6 +177,7 @@
>>>    						PCIE_CAP_SLOT_POWER_LIMIT_SCALE)
>>>    #define PERST_DELAY_US				1000
>>> +#define FLUSH_TIMEOUT_US			100
>>>    #define QCOM_PCIE_CRC8_POLYNOMIAL		(BIT(2) | BIT(1) | BIT(0))
>>> @@ -274,11 +283,14 @@ struct qcom_pcie {
>>>    	struct icc_path *icc_cpu;
>>>    	const struct qcom_pcie_cfg *cfg;
>>>    	struct dentry *debugfs;
>>> +	int global_irq;
>>>    	bool suspended;
>>>    	bool use_pm_opp;
>>>    };
>>>    #define to_qcom_pcie(x)		dev_get_drvdata((x)->dev)
>>> +static int qcom_pcie_reset_slot(struct pci_host_bridge *bridge,
>>> +				  struct pci_dev *pdev);
>>>    static void qcom_ep_reset_assert(struct qcom_pcie *pcie)
>>>    {
>>> @@ -1263,6 +1275,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
>>>    			goto err_assert_reset;
>>>    	}
>>> +	pp->bridge->reset_slot = qcom_pcie_reset_slot;
>>> +
>>>    	return 0;
>>>    err_assert_reset:
>>> @@ -1300,6 +1314,73 @@ static const struct dw_pcie_host_ops qcom_pcie_dw_ops = {
>>>    	.post_init	= qcom_pcie_host_post_init,
>>>    };
>>> +static int qcom_pcie_reset_slot(struct pci_host_bridge *bridge,
>>> +				  struct pci_dev *pdev)
>>> +{
>>> +	struct pci_bus *bus = bridge->bus;
>>> +	struct dw_pcie_rp *pp = bus->sysdata;
>>> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>>> +	struct qcom_pcie *pcie = to_qcom_pcie(pci);
>>> +	struct device *dev = pcie->pci->dev;
>>> +	u32 val;
>>> +	int ret;
>>> +
>>> +	/* Wait for the pending transactions to be completed */
>>> +	ret = readl_relaxed_poll_timeout(pcie->parf + PARF_STATUS, val,
>>> +					 val & FLUSH_COMPLETED, 10,
>>> +					 FLUSH_TIMEOUT_US);
>>> +	if (ret) {
>>> +		dev_err(dev, "Flush completion failed: %d\n", ret);
>>> +		goto err_host_deinit;
>>> +	}
>>> +
>>> +	/* Clear the FLUSH_MODE to allow the core to be reset */
>>> +	val = readl(pcie->parf + PARF_LTSSM);
>>> +	val |= SW_CLEAR_FLUSH_MODE;
>>> +	writel(val, pcie->parf + PARF_LTSSM);
>>> +
>>> +	/* Wait for the FLUSH_MODE to clear */
>>> +	ret = readl_relaxed_poll_timeout(pcie->parf + PARF_LTSSM, val,
>>> +					 !(val & FLUSH_MODE), 10,
>>> +					 FLUSH_TIMEOUT_US);
>>> +	if (ret) {
>>> +		dev_err(dev, "Flush mode clear failed: %d\n", ret);
>>> +		goto err_host_deinit;
>>> +	}
>>> +
>>> +	qcom_pcie_host_deinit(pp);
>>> +
>>> +	ret = qcom_pcie_host_init(pp);
>>> +	if (ret) {
>>> +		dev_err(dev, "Host init failed\n");
>>> +		return ret;
>>> +	}
>>> +
>>> +	ret = dw_pcie_setup_rc(pp);
>>> +	if (ret)
>>> +		goto err_host_deinit;
>>> +
>>> +	/*
>>> +	 * Re-enable global IRQ events as the PARF_INT_ALL_MASK register is
>>> +	 * non-sticky.
>>> +	 */
>>> +	if (pcie->global_irq)
>>> +		writel_relaxed(PARF_INT_ALL_LINK_UP | PARF_INT_ALL_LINK_DOWN |
>>> +			       PARF_INT_MSI_DEV_0_7, pcie->parf + PARF_INT_ALL_MASK);
>> do we need to enable linkup again here, since all the devices are
>> enumerated previously, the linkup irq will do a rescan again which is
>> not needed.
> 
> Right. I was trying to keep the irq enablement on par with probe(), but LINK_UP
> is strictly not needed. I will drop it.
> 
>> Instead of linkup we update icc & opp bandwidths after
>> dw_pcie_wait_for_link() in the below.
>>
> 
> Why do we need to update ICC and OPP?
After link retrain, if the link data rate has reduced due to some
electrical issue or some other reason we may need to update the icc and
opp votings here.

- Krishna Chaitanya.
> 
> - Mani
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
