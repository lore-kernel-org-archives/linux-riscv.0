Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE961C3ABC5
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 06:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=41UFzz/RflNGaTWDrGoD1/4REXnITxiLUTeZeKWVFa8=; b=IHj3hc+hHUVTva
	C38qY9Hg0sUihMkAj5mbrsYrACN+uqu5Ah/NEttA98AFf+AsXq+HQBy+U/ObiYgkxEDyYjEUP+lo/
	a5Yszha8UwHoiI+wxMyCKM3xNZJq8athDPcBaTb2AWNr6qapKXvhh0ySMqlddVxLen6oxBtszJGzj
	E0qKMEtOZBrzwkZwlHn4H0nwFTSqmXt91oPuPDrfuvqieozqetsCrWLoec0RCAGLdLpkXgi0H4IkO
	/l/zgqH8B+lGqC+tF1rT1OMLYH+V1HF8M2h1Jah648BYxADTVmyamF6OIWMFvI9VyHt2zwNq+gMte
	s4mQ5PzYd6WXQjPBfEDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF5eC-0000000EAex-2XGi;
	Wed, 14 May 2025 06:31:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF5dG-0000000EAT7-44iq
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 06:30:24 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E0xK7S006188
	for <linux-riscv@lists.infradead.org>; Wed, 14 May 2025 06:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3OYdEv51QzKfvKyl8ZgwIQYfMr0WzoPUqWedNGx4V8o=; b=drMN6nqjFRSig3yV
	lDvbbLMYcz3VTLwBtALpmrmgjWr5A7C2sAmiLc0n9G9J3Cb9gZRrbvt2OA9MSndH
	8kEPalU6Wrlkl7vGymmxcj69V074a1+ztfi8sgZbIuVT6J52RKRzv7D9yprM6hxK
	i2NCka/ruOjlQH8AHhLBokDsg5dvMvZ71aB1sQ35yFnbdGx9tSFLLhRJno5g8/4i
	5uahPUKstKk8F+r1jupge0AQ1Xp6E785gcp39Y9lE7KE6+mSyIFMVN5J+xMcyZan
	aws38upccg/H3Eu5bdD3y4N4o4xsBLielPV3xSj6TOoOlAdoPaUzKxiWO2DXlWQ2
	oz5gFQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnsmbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 14 May 2025 06:30:21 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7410079c4a6so4423365b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 13 May 2025 23:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747204220; x=1747809020;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3OYdEv51QzKfvKyl8ZgwIQYfMr0WzoPUqWedNGx4V8o=;
        b=vogCEfIqK3kS4p2/2TIz5Jv8gBegAPNs68u1IzkaTWGQEXHEK4z2mBV6vU9GuN3Wv5
         rnHCMG7y8x5l/fij+WzWcfH0KLYmuZVhKT3QsVUQYk8auxaJLdo1nCj46ozWPmJhqngi
         mhVKE0nlGoGjQVqpdOgi5aG/9X48UT0rSuK6AeT+DHC/QojUnBV8HyE7yAWiZORxQZG9
         S4nfofOMHhzEVedlKmnYa3PdGotvQ9GllzeTC0ehhzboQ1Vz9BzwqYa0tb8s8F3GqaAM
         ukSGhSoQ6tvJJAkIv0ASLax+lmevyBYLo2VK+ReuMKbVRicZwjjsJXoBud/l+wC+lpvV
         ASew==
X-Forwarded-Encrypted: i=1; AJvYcCXXDPmK4AIFul1Q/ysYwO8gmeCVmD43nGVprKaHAR8oHyB8Xc9bHpiM+viF82jqZP6rCXNq2Lsi8lre3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyRFneygWTgmyU55gDEfqx3VXcuM1KDrBWgt7k/TrM7/9iAFbG9
	1x2MFoQfFcx45L8w1KlwamFNafNglQfFqUHkAiCzk/UB2SIxHGHA+KHTAGMi1/7IX1q5sLOasr3
	XlZ5SbqSPbb9vLCJNHATbcqAriMk9pvfyPj4uu9BCx2OnB0pDVliBOcH83rHUBW4WBBE=
X-Gm-Gg: ASbGncu/gzuJGvHkqTU8QrpBdJkv2yKvPtVJ+xnR1Uv3u2amUfkgQzGjGOBW8j+86yT
	+VhvnUspBGhEpadm5Tlr+AWoNLdiKsA43LQVP5HziUfSFhis+9TlVl9kh0hZ83MGqQcrL/CznlN
	+d+EyGPq2cAt0dKzqpGjtSP1XUp/xLW1fydbUzidQtKsuIvi7VPAvJoCgJghEaKVXCSbnQIbcVK
	yJrtrzGjMrYCKWNy9Slf4hg9SgvisZUOX5DRf9g4iPxhIIHPOjo7FALto0TKChQMjjKfqJmt/dP
	2gT1G3FnXZKNB6pIkVzs3X/hTogVeghrKrTMTUyORg==
X-Received: by 2002:a05:6a00:849:b0:740:6f69:dce9 with SMTP id d2e1a72fcca58-7428915208cmr2991300b3a.0.1747204220392;
        Tue, 13 May 2025 23:30:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEo6KctwAue9F+Vx18ACg2bqMflRXZkaB6cash8mo/C9AGwxsZu65dw2flirVj1uPaGevYVIQ==
X-Received: by 2002:a05:6a00:849:b0:740:6f69:dce9 with SMTP id d2e1a72fcca58-7428915208cmr2991254b3a.0.1747204219961;
        Tue, 13 May 2025 23:30:19 -0700 (PDT)
Received: from [10.92.214.105] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237704ba3sm8811721b3a.31.2025.05.13.23.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 23:30:19 -0700 (PDT)
Message-ID: <8006a0ae-b45d-d22f-65a9-20a65f3224b0@oss.qualcomm.com>
Date: Wed, 14 May 2025 12:00:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 4/5] PCI: host-common: Add link down handling for host
 bridges
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Oliver O'Halloran <oohall@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>,
        Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Marc Zyngier <maz@kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>
Cc: dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>,
        linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
 <20250508-pcie-reset-slot-v4-4-7050093e2b50@linaro.org>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250508-pcie-reset-slot-v4-4-7050093e2b50@linaro.org>
X-Proofpoint-GUID: TJYCBbJYe2RDCbBjxiV6upTuQRslqVgm
X-Proofpoint-ORIG-GUID: TJYCBbJYe2RDCbBjxiV6upTuQRslqVgm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA1NSBTYWx0ZWRfXw0gn0a4evkuk
 fEqdEy/rWEvBLeAvEKZtQVgqYJDodJdyh/wypYiAl+7gGQUBI43S6NYGulrEKMjecFnZgiOmZde
 IO0cm/odnAsJYtUSKfbx9tCmD/AukZvmJRpJC6VZHRbsW7A8O+tpWerXhHqVQKCP5DMCTQ99UBr
 0RQhF91Lwrmc9ETgDDA/9R0I74NAw7feza3sDnmnzQYtAmd0wP57/4IBOcOU70IuuYUjWPdILu0
 iPtWlLlQ0S9du0SLp1W5nUWHvf+u80ObZ5L3t//9JcIBO4O2ZqodRqGgKhqG3Vp/QxClmTislhq
 TJ6wUU+sh4ry7enxkVwYTSKd9IQ345sTjneCtL4OLpCp9+i9AjKGQ/q7Cl67l0k2suJ4nlvE+lA
 xq9DMyHsISGcGDAxM33U+MkRDk/OFhuqkmX2OVg9PmM9FGBfe6nxY3u/ofl0klBMwdt6pyfk
X-Authority-Analysis: v=2.4 cv=Gp9C+l1C c=1 sm=1 tr=0 ts=6824387d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=WP6hIalcOMfy4p2eL3AA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_233023_162700_BCC7804D 
X-CRM114-Status: GOOD (  30.70  )
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



On 5/8/2025 12:40 PM, Manivannan Sadhasivam wrote:
> The PCI link, when down, needs to be recovered to bring it back. But that
> cannot be done in a generic way as link recovery procedure is specific to
> host bridges. So add a new API pci_host_handle_link_down() that could be
> called by the host bridge drivers when the link goes down.
> 
> The API will iterate through all the slots and calls the pcie_do_recovery()
> function with 'pci_channel_io_frozen' as the state. This will result in the
> execution of the AER Fatal error handling code. Since the link down
> recovery is pretty much the same as AER Fatal error handling,
> pcie_do_recovery() helper is reused here. First the AER error_detected
> callback will be triggered for the bridge and the downstream devices. Then,
> pci_host_reset_slot() will be called for the slot, which will reset the
> slot using 'reset_slot' callback to recover the link. Once that's done,
> resume message will be broadcasted to the bridge and the downstream devices
> indicating successful link recovery.
> 
> In case if the AER support is not enabled in the kernel, only
> pci_bus_error_reset() will be called for each slots as there is no way we
> could inform the drivers about link recovery.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>   drivers/pci/controller/pci-host-common.c | 58 ++++++++++++++++++++++++++++++++
>   drivers/pci/controller/pci-host-common.h |  1 +
>   drivers/pci/pci.c                        |  1 +
>   drivers/pci/pcie/err.c                   |  1 +
>   4 files changed, 61 insertions(+)
> 
> diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
> index f93bc7034e697250711833a5151f7ef177cd62a0..f916f0a874a61ddfbfd99f96975c00fb66dd224c 100644
> --- a/drivers/pci/controller/pci-host-common.c
> +++ b/drivers/pci/controller/pci-host-common.c
> @@ -12,9 +12,11 @@
>   #include <linux/of.h>
>   #include <linux/of_address.h>
>   #include <linux/of_pci.h>
> +#include <linux/pci.h>
>   #include <linux/pci-ecam.h>
>   #include <linux/platform_device.h>
>   
> +#include "../pci.h"
>   #include "pci-host-common.h"
>   
>   static void gen_pci_unmap_cfg(void *ptr)
> @@ -96,5 +98,61 @@ void pci_host_common_remove(struct platform_device *pdev)
>   }
>   EXPORT_SYMBOL_GPL(pci_host_common_remove);
>   
> +#if IS_ENABLED(CONFIG_PCIEAER)
> +static pci_ers_result_t pci_host_reset_slot(struct pci_dev *dev)
> +{
> +	int ret;
> +
> +	ret = pci_bus_error_reset(dev);
> +	if (ret) {
> +		pci_err(dev, "Failed to reset slot: %d\n", ret);
> +		return PCI_ERS_RESULT_DISCONNECT;
> +	}
> +
> +	pci_info(dev, "Slot has been reset\n");
> +
> +	return PCI_ERS_RESULT_RECOVERED;
> +}
> +
> +static void pci_host_recover_slots(struct pci_host_bridge *host)
> +{
> +	struct pci_bus *bus = host->bus;
> +	struct pci_dev *dev;
> +
> +	for_each_pci_bridge(dev, bus) {
> +		if (!pci_is_root_bus(bus))
bus here is always constant here, we may need to have check
for dev here like if (!pci_is_root_bus(dev->bus))
> +			continue;
> +
> +		pcie_do_recovery(dev, pci_channel_io_frozen,
> +				 pci_host_reset_slot);
> +	}
> +}
> +#else
> +static void pci_host_recover_slots(struct pci_host_bridge *host)
> +{
> +	struct pci_bus *bus = host->bus;
> +	struct pci_dev *dev;
> +	int ret;
> +
> +	for_each_pci_bridge(dev, bus) {
> +		if (!pci_is_root_bus(bus))Same comment as above.

- Krishna Chaitanya.
> +			continue;
> +
> +		ret = pci_bus_error_reset(dev);
> +		if (ret)
> +			pci_err(dev, "Failed to reset slot: %d\n", ret);
> +		else
> +			pci_info(dev, "Slot has been reset\n");
> +	}
> +}
> +#endif
> +
> +void pci_host_handle_link_down(struct pci_host_bridge *bridge)
> +{
> +	dev_info(&bridge->dev, "Recovering slots due to Link Down\n");
> +	pci_host_recover_slots(bridge);
> +}
> +EXPORT_SYMBOL_GPL(pci_host_handle_link_down);
> +
>   MODULE_DESCRIPTION("Common library for PCI host controller drivers");
>   MODULE_LICENSE("GPL v2");
> diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/controller/pci-host-common.h
> index d8be024ca68d43afb147fd9104d632b907277144..904698c1a2695888a0fc9c2fac360e456116eb1d 100644
> --- a/drivers/pci/controller/pci-host-common.h
> +++ b/drivers/pci/controller/pci-host-common.h
> @@ -12,5 +12,6 @@
>   
>   int pci_host_common_probe(struct platform_device *pdev);
>   void pci_host_common_remove(struct platform_device *pdev);
> +void pci_host_handle_link_down(struct pci_host_bridge *bridge);
>   
>   #endif
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 13709bb898a967968540826a2b7ee8ade6b7e082..4d396bbab4a8f33cae0ffe8982da120a9f1d92c9 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -5781,6 +5781,7 @@ int pci_bus_error_reset(struct pci_dev *bridge)
>   	mutex_unlock(&pci_slot_mutex);
>   	return pci_bus_reset(bridge->subordinate, PCI_RESET_DO_RESET);
>   }
> +EXPORT_SYMBOL_GPL(pci_bus_error_reset);
>   
>   /**
>    * pci_probe_reset_bus - probe whether a PCI bus can be reset
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index b834fc0d705938540d3d7d3d8739770c09fe7cf1..3e3084bb7cb7fa06b526e6fab60e77927aba0ad0 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -270,3 +270,4 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>   
>   	return status;
>   }
> +EXPORT_SYMBOL_GPL(pcie_do_recovery);
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
