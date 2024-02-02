Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B884C47258
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 04:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mRGv2jZy44N8HbkCz3OmQeu0RIkVNABXuTQli+hqXLQ=; b=kI3JZDnPhpLefV
	z8mwSfM/sImdEWf+OyMrQxJ6TqzC92dksqNEBAbNwDdcXBk5FeLXbmO9NkDBOUkRwNomocXEYUjnC
	yxDxIMpFMY/76QTQvjE9+Tf03qqbp9nLMDSbFgvy93+XxmN0+0C59xU7OXDCf8yWINqvfWN+eSjpj
	66KcwIZRp0hyEnAI9JRGzSY7mTknwFv+j/NWCYjft/Os9qDW7ozdZuawHmdya5aR1G7jMSySZ1nz/
	CT/P4ZNEwHzYySGfh3zka4lGBxhc7iprUvTESbjfofmbVBD78Nop6er8+WGUDTy6FweD6XiyAbHqB
	bvml3gB+nemz69dzkRlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVlD1-0000000A9Pu-3YmB;
	Fri, 02 Feb 2024 04:31:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVlCy-0000000A9OT-3l3j
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 04:31:22 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4124SFLW030429;
	Fri, 2 Feb 2024 04:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=E5Ngqz/WRMMBBG6e8j2A7
	UyxUwTajWJF3P086kGxK0s=; b=R7cTLFr9GbUWJpMaqT+M6lyfmG0QDt4CHtRCp
	QtVxkzB4XD6oDGoqHAJAKokox4v7ARG8tzmQgFMttLpVTR79Ku+vpSerewbWniFf
	SCIWau1Pf69tgyTEXnDxGNp5bDKrpPK9Ki8vtyDdp9VB0JMSknRu6aODje0J2f1X
	R8j6T7M2IyzA94mf4/suTiNWM8ABfp0CyGTTF+NAaRB8rg5LIuuWJBpBVnkFTQao
	FbBNYpebs3qxvifqmwJY/qnJ5O8bojdk+SmRLZjfOUG/KkN/pMXoEf646ugu7JAS
	ck6WWtk+YyLPSn6PrEpq4IMlG4ipyMm0UgpemtzJdvYBhnlDg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w0pu009rb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Feb 2024 04:31:12 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4124VBgQ001830
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 Feb 2024 04:31:11 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 1 Feb 2024 20:31:11 -0800
Date: Thu, 1 Feb 2024 20:31:10 -0800
From: Elliot Berman <quic_eberman@quicinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt
	<palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang
	<jszhang@kernel.org>,
        Evan Green <evan@rivosinc.com>,
        =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] riscv: Disable misaligned access probe when
 CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
Message-ID: <gtwet3x2fokbne5642vleyp5u7pqjl2lbtbngjjfavmgvvytzg@z2gx6xoa3hvl>
Mail-Followup-To: Charlie Jenkins <charlie@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>, 
	Evan Green <evan@rivosinc.com>, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240201-disable_misaligned_probe_config-v2-0-77c368bed7b2@rivosinc.com>
 <20240201-disable_misaligned_probe_config-v2-2-77c368bed7b2@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240201-disable_misaligned_probe_config-v2-2-77c368bed7b2@rivosinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: v2zNNbLEzggt0GdOtik2j8HK7sQEwjcC
X-Proofpoint-ORIG-GUID: v2zNNbLEzggt0GdOtik2j8HK7sQEwjcC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-01_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 mlxlogscore=631 suspectscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 clxscore=1011 adultscore=0 spamscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402020030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_203121_086697_F63A2A9E 
X-CRM114-Status: GOOD (  15.19  )
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

Hi Charlie,

On Thu, Feb 01, 2024 at 03:30:46PM -0800, Charlie Jenkins wrote:
> When CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is selected, the cpus can be
> set to have fast misaligned access without needing to probe.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/Kconfig                               |   1 +
>  arch/riscv/include/asm/cpufeature.h              |   7 +
>  arch/riscv/include/asm/misaligned_access_speed.h |  29 +++
>  arch/riscv/kernel/Makefile                       |   3 +
>  arch/riscv/kernel/cpufeature.c                   | 255 ----------------------
>  arch/riscv/kernel/misaligned_access_speed.c      | 265 +++++++++++++++++++++++
>  arch/riscv/kernel/sys_hwprobe.c                  |   4 +
>  7 files changed, 309 insertions(+), 255 deletions(-)
> 
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index f71910718053..8be7f17da9ab 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -62,6 +62,9 @@ obj-y	+= tests/
>  obj-$(CONFIG_MMU) += vdso.o vdso/
>  
>  obj-$(CONFIG_RISCV_MISALIGNED)	+= traps_misaligned.o
> +ifneq ($(RISCV_EFFICIENT_UNALIGNED_ACCESS), y)

Should this be CONFIG_RISCV_EFFICIENT_UNALIGNED_ACCESS ?

> +obj-y	+= misaligned_access_speed.o
> +endif
>  obj-$(CONFIG_FPU)		+= fpu.o
>  obj-$(CONFIG_RISCV_ISA_V)	+= vector.o
>  obj-$(CONFIG_RISCV_ISA_V)	+= kernel_mode_vector.o

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
