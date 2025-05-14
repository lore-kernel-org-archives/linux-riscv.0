Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6920DC3ABCB
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 06:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OgyMjH68vH+eiHnWfE37lJ5mAyYSWKSnezObKopl5vU=; b=abB2sWQbbZNcyc
	8HAMEvthDI8/UjpIJrKiZzHDWKGs70bDapgXjv4eXeyLHK1pGUj3rRwdSWcGmuGTAhJAhoiteYR48
	7rKgVLybQa/YfNi8eiyscSnjbJpOQgOiSNKhpc+hcsUpFRKuihqhihJDCgxwdy+xyPprvL6yG6zye
	UPSRvPi8qZKvKUDxFpvHDfFShpLvvNRmAi6oup3ypTOf3VFnx1UPTvft6vLB0aNq22HTQBG+0SYTa
	WzYshHjDJIVe/OASUtw8uI/XfCR0DDXihu9erD5HO1/W0rfy/4BCwajJ7H1s0vgKpcduEKgKIcryk
	nj+RcDJej+/MhXAe9PQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF5iR-0000000EBQh-2S6x;
	Wed, 14 May 2025 06:35:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF5gF-0000000EBBs-1XnI
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 06:33:29 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E2O5R9016770
	for <linux-riscv@lists.infradead.org>; Wed, 14 May 2025 06:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B5/9vS4FRS/VQGDmtMWL7u/M6hqf8gvfjYWZW3i0Gc8=; b=Qgum9RVdjs2zkR+i
	e+oEfIDzCrFRwrJwHknja+NnTYGUe0kfBGaxE/kcH1zG/HAgklYoRDOwP9WbKIer
	JsempM+UrVFDW0Ca2k6zuHTR3YlTCCeGehDU8P880C6sn9rTz1C17HS1IJkgknwl
	EMbX0ZmrTikpz8hny2XKCvYV2IUuFi4JSMIobRfrCD3HsIhMxv+A8kMvaRSj+3sm
	NVCUWEEkQnKoEsoLsdpf/TVzw03pnSRTjgfeQYWsb/Jxv+yi9STPWZqzAuqpBffr
	1ffX7foKv+FP8pLkITytCg+xFIiiSi+DWt90BfNQaIFiFVrYDKj7i2ZQI/HkSZ1O
	o/x1lg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmsneh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 14 May 2025 06:33:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7394772635dso4764288b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 May 2025 23:33:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747204405; x=1747809205;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B5/9vS4FRS/VQGDmtMWL7u/M6hqf8gvfjYWZW3i0Gc8=;
        b=mB5KEVeoTiDQbKNwWyKLvShEL1kfv8vBmmroLw52GsJ8A9zeF2FZY17Y96L7rmVjki
         Wh87AuOWGZhm2i3lGkPLWqJ2IU7iX2DA4wvyRUGyhA3pAGaeRRp9CmdD7gQk3oZ3Xk1Q
         vekMFHmeoJKT+6eG+2RmcXcIBv0l0BN1IZ22r6WCu6PVsPa30Zk4h4MztCHi8H9VhPMn
         fXrjJmlOulUXVHwL8SbkJsgT1sKF2BIWFsNy7WO7AESldURh6DFkHfXi0NBMJ6Ffk0lt
         Mxo0nUd7ibqPoyJwPrdHi4bAIQ6wbreFvdQ4TSSgF0r+ni1ARUMkY/vSFqvFwQ0K/OR0
         OM1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUMIA1u/FJPQfwl1loNMTjc0IJSKZkLcSVDjCBase9+FUEze5Vlm2Jitc5+hxvHDjEEHKBYeyiaAbPT7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzT+GNowKPZPOOkQYW+UHF70gi6lzypZ8SCnI2zi/oXmxCMvr+i
	kVx6YVxlQWAX/zDnpMCO1P/PPWVr/L6F/yDGCJjlt894EA8t4Ncw4jFwJISKmyZAKSj89Dr4cJJ
	NcWfmg/RfS7dWD+rZgQ+ZWxulAXYFTw82iTvtV+p+nWmPqum1k3c6omJSjS2Xl2jgMls=
X-Gm-Gg: ASbGncuj5k6bejVKA/PGWJsR0kB8Fvu+tnIhgw5LhkIyyUhjkPeUz30Ry/Wk6xcIfdy
	9AC5/EShCwUBYZ43D+8GSfTSUwAeRQ1+Vw1m1y+x4SLciMYFTGm+l1+dUWPL3svCmVc0Ur32wJt
	lM+dDxlsAl1tIhtWzFh3pYqTR3/SrMaGs/JaSbFjrh4hAIU4e3UbrXSweYKS42dxX3YGk8pqU7C
	mt1EB/suBUQNYzcs30jqcN/LVLrIRI0oBxCAfaqS2bpJMfoB5/HAYH8Ki5bCHB+SZ7hVWMOUBcj
	4VuVmhVMG5a0gl8JwAJlFdaQ7+XXyU5zIH3UExpe6Q==
X-Received: by 2002:a05:6a20:2d2c:b0:1f5:72eb:8b3f with SMTP id adf61e73a8af0-215ff11a590mr3261471637.24.1747204405601;
        Tue, 13 May 2025 23:33:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETSoI9iwfk9eb2Ld/QSv1BSUXn0GR0U4QVFH399Z38VQi+OSfnyJ8EGrjE5OEBrun47fcpcg==
X-Received: by 2002:a05:6a20:2d2c:b0:1f5:72eb:8b3f with SMTP id adf61e73a8af0-215ff11a590mr3261433637.24.1747204405177;
        Tue, 13 May 2025 23:33:25 -0700 (PDT)
Received: from [10.92.214.105] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234941baacsm8298049a12.14.2025.05.13.23.33.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 23:33:24 -0700 (PDT)
Message-ID: <8899a562-2efd-9a63-5fc2-2972f47a9296@oss.qualcomm.com>
Date: Wed, 14 May 2025 12:03:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 2/5] PCI/ERR: Add support for resetting the slots in a
 platform specific way
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
 <20250508-pcie-reset-slot-v4-2-7050093e2b50@linaro.org>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250508-pcie-reset-slot-v4-2-7050093e2b50@linaro.org>
X-Proofpoint-ORIG-GUID: zqhWiqd9jXar1ukM3VVfULdfAu1FyYGx
X-Authority-Analysis: v=2.4 cv=HZ4UTjE8 c=1 sm=1 tr=0 ts=68243936 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=ljfrh_M9o-RCrfJy5NoA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zqhWiqd9jXar1ukM3VVfULdfAu1FyYGx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA1NiBTYWx0ZWRfX0pnMkoztztiM
 IC11TWblGs+I8XHvaeAlaCZX1sS8xIZVMEXU0L13oelso3b2tEqGtW5RUN9L7Y1r2Xqb8QDYtBz
 SD/P+rzvozb1nei14Gk0wBwFrw5112MeHcr/2mADTtiaAGuIj1CMPfJbX6kdQLP2y+sCSCOJ3b0
 UP9ocqlgtWh1jqUgkHAS2uHCATYXnwISyzeIz/REcE1MMg89nRPUsPBsg8Or+lUYEu17Tr9XmJQ
 e+m6RCjMLx97O8XfBwy9ixxGtAKmf8t9OkKX1+HMD0h37GEJNI1rKusUmhmOde+vVDetqHXRkqA
 +JHjk3p3pnAZWDyCLoBgMtuJABnzR0FzqHSaCQl5n0ZEXqntKWWfb1GI7qTiJPQ4W55c6KYsMlq
 50mXtANefYUwFJooAEt8YXAazjA5EF/kkD/ujtNiu5AhAOfPgP9FtHyTnKD+yjkn+H5GdJFC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_233327_422788_DEA588B7 
X-CRM114-Status: GOOD (  21.70  )
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
> Some host bridge devices require resetting the slots in a platform specific
> way to recover them from error conditions such as Fatal AER errors, Link
> Down etc... So introduce pci_host_bridge::reset_slot callback and call it
> from pcibios_reset_secondary_bus() if available.
> 
> The 'reset_slot' callback is responsible for resetting the given slot
> referenced by the 'pci_dev' pointer in a platform specific way and bring it
> back to the working state if possible. If any error occurs during the slot
> reset operation, relevant errno should be returned.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

- Krishna Chaitanya.
> ---
>   drivers/pci/pci.c      | 12 ++++++++++++
>   drivers/pci/pcie/err.c |  5 -----
>   include/linux/pci.h    |  1 +
>   3 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 4d7c9f64ea24ec754a135a2585c99489cfa641a9..13709bb898a967968540826a2b7ee8ade6b7e082 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -4982,7 +4982,19 @@ void pci_reset_secondary_bus(struct pci_dev *dev)
>   
>   void __weak pcibios_reset_secondary_bus(struct pci_dev *dev)
>   {
> +	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
> +	int ret;
> +
> +	if (host->reset_slot) {
> +		ret = host->reset_slot(host, dev);
> +		if (ret)
> +			pci_err(dev, "failed to reset slot: %d\n", ret);
> +
> +		return;
> +	}
> +
>   	pci_reset_secondary_bus(dev);
> +
>   }
>   
>   /**
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index de6381c690f5c21f00021cdc7bde8d93a5c7db52..b834fc0d705938540d3d7d3d8739770c09fe7cf1 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -234,11 +234,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>   	}
>   
>   	if (status == PCI_ERS_RESULT_NEED_RESET) {
> -		/*
> -		 * TODO: Should call platform-specific
> -		 * functions to reset slot before calling
> -		 * drivers' slot_reset callbacks?
> -		 */
>   		status = PCI_ERS_RESULT_RECOVERED;
>   		pci_dbg(bridge, "broadcast slot_reset message\n");
>   		pci_walk_bridge(bridge, report_slot_reset, &status);
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 0e8e3fd77e96713054388bdc82f439e51023c1bf..8d7d2a49b76cf64b4218b179cec495e0d69ddf6f 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -599,6 +599,7 @@ struct pci_host_bridge {
>   	void (*release_fn)(struct pci_host_bridge *);
>   	int (*enable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
>   	void (*disable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
> +	int (*reset_slot)(struct pci_host_bridge *bridge, struct pci_dev *dev);
>   	void		*release_data;
>   	unsigned int	ignore_reset_delay:1;	/* For entire hierarchy */
>   	unsigned int	no_ext_tags:1;		/* No Extended Tags */
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
