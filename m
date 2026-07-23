Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBACFC531C7
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2026 08:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T3xOWcivwOclLEMTUA2K0Uvr0PP5HEbEogcyER0zWWE=; b=WzI4wQPlM+ZywC
	oQj9S5hJBBf/aFmoOAGuX0g5oeLlxUvUgnqCUAGiCRm5ZmgrDYYIIEaP9wnHvWmq2TRdadcFnKX5h
	d86hGP2qpnX+8kEEDYaeVYrN+r8cx3JIQVTapnWU6SPu7/8vZ7yXSDCCCJ5u+AG6lnFir1vwbNygH
	RnLrVaMaIGbcBYNdDHJ6OR8P7OhBhLpV6IHt56EmtCw98fCp8UtIx3+c3Ng8yKnA7aKOrACf2SndT
	SEhvIzK5NpMEF3FpJaxXJcGmaq0lN8qtpnVpQNWwyEv0Dye8KLZDyRCMHP2H+jdAb1Fpxrsgkn7sA
	iSpYicb0qrGDnKJxeVaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmobz-0000000DiI5-35Fb;
	Thu, 23 Jul 2026 08:16:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmobw-0000000DiHE-2olh
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jul 2026 08:16:58 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N7BgVC3416186
	for <linux-riscv@lists.infradead.org>; Thu, 23 Jul 2026 08:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aHvkfX2WgxM6m3Qd7M06X06q6uad+Fjvt8D1GSnRUQE=; b=ntSapto5HtuOo1tx
	+4Wyu1GfIka9eD9b3tS9e0LIb25cjH3/7S91iitGNy7DLR4Fx9d9AJZDs8hNXIOg
	EtfpPBI2RM1JebCar91HEqL/a9Ur8/t1iGqxLHTOyepqlyg1uRvvSndniBdV7KCV
	/jweb56WfARKrsHjqD5JVMJFiGsjKSoKVWpDBorAP31jEZnlovTzqChQwhfV4mIP
	d3PFRt5Ey2bmrNp4TxjcJ5ijkN4a8BlUiVxhLnK3UDXpqqAqhxBV96NVHJzN+tFN
	hZYO5XF43oGcsTKApztW7F/sfHa1btPj6rqW3/DlLKITozTEt8jVERledLw17x5F
	3yU4Eg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7hyvt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 23 Jul 2026 08:16:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca124bf0189so182044a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jul 2026 01:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784794615; x=1785399415; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aHvkfX2WgxM6m3Qd7M06X06q6uad+Fjvt8D1GSnRUQE=;
        b=WzjY9CS3elqAWWnF7UL4gwDwqHlLG3LD25bUwRJDOMisxiJ2bs+m6D142Za7HSDM+b
         c601lwyScEqJ46+V97aNFzNFP6d6z3Q+QjZ1pM1oW/sRdpwtnF3qhcrvSyjyLjG4E1Un
         nAcMR5i7Fip6VZ3NINwhSCJMrQhYVvfg4pWbPZ1edi+sAHrxeyiFreISTmfAHgSRmF7n
         cu9N3V9gB6lAKXh9Too5EIYmYI42qDRMOxeoXLFgkAGDBqbm3qIMa/+pOfRfMMbiunqX
         NTvLG6Nk5HZD37D4QGNyAiLSh9b+cL6SatKKx3479SSekIsDiSS4g9Xd2mQtFtntJMdI
         /bYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784794615; x=1785399415;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aHvkfX2WgxM6m3Qd7M06X06q6uad+Fjvt8D1GSnRUQE=;
        b=lR3SQdpjL88jm6jDkpryXc1reZWqg45f8gsdYpB1bj072pFV3bEKcC+nNgN1dr2jvQ
         YNjHRbC83FtmVdIy59FOE4AN37JJri/i5czqi9iSOH+ZngiKxWwY2bb4wXGa8BuhjMx0
         +qccTLE/EpnKvxYWKAODWpbGFSRupQtt/D3htl9N7HpZKyUVHu6q/FMqgJKbdlc1csKV
         qsN1iYqem8Yqlt93G6/ZZtbR0TQ9hiiSzPtnydQziQ7nasnI7UhRJCLv4fyf9lM5c7i7
         A90urlkbwa9oNWsD7t+0EOaP3ygSHht56Mfz9rM2Vk6D7qM5PLldzcL1jzxdiXzuozE6
         jxHA==
X-Forwarded-Encrypted: i=1; AHgh+Rq01tpzohgp9aCgtVz5A7qS+Mfom/DM0ONuTIAnHJO3chfZq1BeqOfGYmAVyYnPFRqVDdn7gP3E0GvpnA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQY40222YHVPqqdDzV4A5gQhlZ2PGBVaX9C0BZZfvSpZUZqvsC
	SMrCI9/JQzMGoOosqJ3A/3JXdlCL5Uzu19r4y5Ji+GtJRKLngGvULJmh/lUN0583IkY5nNoOa3N
	s4m0lE3+Fabe6XdVmZPfWjoYqe7azEWVGnNA983jmZKfmpqWehPA1M1quFjY3l9ZU9tzLxho=
X-Gm-Gg: AR+sD10P4JDGj+hB+pRMZHCD1khU/qK06Al4iAZqaWowvy7iKKwMVjG32wiRXXWCi5s
	NUO+TCS8jCpp+OLplTxy71NX+KQ8w64R0ZM7vzN3iDT5kp5ChUTpfV6lXqcQjxOoYSx7LNxovD7
	JjB4sNKqBQBosnTdfTjdfPnQG+3dcf9mTPnXQtg6kiSKAgytrUD/vT9aPZxq+rT3bAwzEIq5Qeg
	7dRN0wuqnYtFtMSa7iKGdEuiBITgK/pRN899uSs/XeJn4rRACjICLDv2Bt/Hf/a5S41h2Habwn4
	QDNl0lR29zva+Nqx/q75lpVmY5z+RqTOiCr58MCKFVNaoF9n5pYomDnspNjKuW8Ks49HFbp1o+f
	4bgh16/bfBPmGpHFQvOuob6f/kCg7Fxo8nJj27dXJnSAS5Y2ZyxcNgjBGW1fMSFyDqQ==
X-Received: by 2002:a05:6a21:1392:b0:3c3:46ec:1c4 with SMTP id adf61e73a8af0-3c44ca1d9cemr1882203637.22.1784794615508;
        Thu, 23 Jul 2026 01:16:55 -0700 (PDT)
X-Received: by 2002:a05:6a21:1392:b0:3c3:46ec:1c4 with SMTP id adf61e73a8af0-3c44ca1d9cemr1882171637.22.1784794615041;
        Thu, 23 Jul 2026 01:16:55 -0700 (PDT)
Received: from [10.133.33.177] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f0f58dfsm2314697a12.13.2026.07.23.01.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 01:16:54 -0700 (PDT)
Message-ID: <214c704d-4979-4dc6-ac91-db672e792c22@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 16:16:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add CoreSight nodes for Qualcomm Shikra SoC
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260723-add-coresight-nodes-for-shikra-v1-0-992615f9ea15@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260723-add-coresight-nodes-for-shikra-v1-0-992615f9ea15@oss.qualcomm.com>
X-Proofpoint-GUID: COMSperPsH6m-xOBey7-Q6H2qONQ4zsc
X-Proofpoint-ORIG-GUID: COMSperPsH6m-xOBey7-Q6H2qONQ4zsc
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a61cdf8 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=KKAkSRfTAAAA:8
 a=_O3DOGVWAAAA:8 a=JfrnYn6hAAAA:8 a=nMW6oa_Obw0FX87ioUUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22
 a=2TKV-7w1aU1AVAwN0oqT:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA4MiBTYWx0ZWRfX1z6WDkQO7J1Z
 PN6Oqu2yeALBbMoYpJOwurIxb3tVBXHoX6/IJfJSWnlAXI9QiY3qHziBeZtOaPZmblu1/3MC23V
 ecpkKFU1M8NmGZFnFpi7xDzqDnr9LWM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA4MiBTYWx0ZWRfX+EmSJQugbo4G
 G4L2keyc5XbcsAGlJi+ti0lnH47w0N38yNr8l1TvaWFQdRf/kv3wZFf3RrdOobziBj8Ec/wfi6J
 TWgDPo+I9UotvUsH0yuK2BhJ/Beu/wuFslD62+W+pHC6EwqW/ZZZeDFgZF2FdKxA1yogko0uUke
 oL7yB8ip2Ey52tRIaA2oK9TiB+XQALRS6itgPxQ7riqc6llsrS7qWT/X6MMrowDcZykYaRXFCxV
 k7yLpoEFRVpO/H+Fy+AoqwNbhd5GIswxv5m1ZC18kufFK4VzWd12UOP8IGH5oSJKRkbgpj2e2o4
 /JxYA096eAZVYy8dC1KP6FJG2/xnDEEOkCDlpm9SJIgZL6MJS6NrbVxARAh09q40h5xbm+EOsvD
 85QPiKfoXJZSx844CFvrlCJpajEzm/6qooxzCscp/Ti18aXYPfbUKhPmd89Av90jdI3nHrxxg+Z
 FMdg+HdutvJqKp8uvqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_011656_741217_3B90C28A 
X-CRM114-Status: GOOD (  22.55  )
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



On 7/23/2026 9:46 AM, Jie Gan wrote:
> This series adds the CoreSight debug and trace subsystem for the
> Qualcomm Shikra SoC.
> 
> The first patch adds a fallback compatible for the Shikra CTCU (CoreSight
> Trace Control Unit). The CTCU on Shikra shares the same configuration as
> the one on SA8775p, so "qcom,shikra-ctcu" falls back to the existing
> "qcom,sa8775p-ctcu" compatible.
> 
> The second patch adds the DT nodes describing the CoreSight topology on
> Shikra, including the funnels, replicators, TMC sinks (ETR/ETF), STM,
> per-core ETMs, CTIs, and the TPDM/TPDA trace collection blocks, along
> with the CTCU and the dummy source/sink endpoints that model external
> trace sources and the EUD sink.

I just found the version number is wrong for the series, it should be V4.

I have checked my b4 branch, confirmed the version number has been 
cleared by mistake. Will take care of it in the future.

Thanks,
Jie

> 
> ---
> Changes in V4:
> - fix the wrong subject for the dt-binding patch
> - Link to v3: https://lore.kernel.org/all/20260722-add-coresight-nodes-for-shikra-v3-0-1400a3454e9f@oss.qualcomm.com/
> 
> Changes in v3:
> - add correct subsystem prefix in dt-binding subject.
> - Link to v2: https://lore.kernel.org/r/20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com
> 
> Changes in v2:
> - remove MMIO for the ETM devices.
> - Link to v1: https://lore.kernel.org/r/20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com
> 
> To: Suzuki K Poulose <suzuki.poulose@arm.com>
> To: Mike Leach <mike.leach@arm.com>
> To: James Clark <james.clark@linaro.org>
> To: Leo Yan <leo.yan@arm.com>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
> To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> To: Mao Jinlong <jinlong.mao@oss.qualcomm.com>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> To: Paul Walmsley <pjw@kernel.org>
> To: Palmer Dabbelt <palmer@dabbelt.com>
> To: Albert Ou <aou@eecs.berkeley.edu>
> To: Alexandre Ghiti <alex@ghiti.fr>
> Cc: coresight@lists.linaro.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> 
> ---
> Jie Gan (2):
>        dt-bindings: arm: qcom,coresight-ctcu: Add Shikra
>        arm64: dts: qcom: shikra: Add coresight nodes
> 
>   .../bindings/arm/qcom,coresight-ctcu.yaml          |    1 +
>   arch/arm64/boot/dts/qcom/shikra.dtsi               | 1295 ++++++++++++++++++++
>   2 files changed, 1296 insertions(+)
> ---
> base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
> change-id: 20260722-add-coresight-nodes-for-shikra-5fb8a4b503d1
> 
> Best regards,


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
