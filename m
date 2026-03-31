Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F15AFF60F4
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 17:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yIyZSMY0x98x2ZRNj3oiMAujf0doGMHpai6osNMnl4o=; b=xQi60fNzTakD7u
	jtgMxQagTEREwKRZCDrJwNjYsvUnr97QEHbAXZG+rx/lswcvAEi5KiwO6tsN4F3sqkQUNQ5F2o2Dh
	qcz6lBkeMsiAiyg7aKsCY1q4VEVn5UDeUrMXB0s64xaUptWxZ5IjgTV1aLs7zJuwJ4LFQeS0Uv+IL
	hU2nTN1xOpkeqEXq91cQaiZN4U7b3OpLL5WHGAegzLTMSwRSiiov2GB4AVUSPjgh4+ryUb5RKbSLf
	AT4SeJGQ+KfcINsvWdvqp7pK3w4QrIwAm97uYGWhmbYemTqoD3N2/W0+dk038FDwDEzrHsVVcP5eT
	9UWmEWKPq+nXztJkzq6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7dCg-0000000DMl3-3Df3;
	Tue, 31 Mar 2026 17:48:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7dCe-0000000DMkW-1xCS
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 17:48:37 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdm5r3663951
	for <linux-riscv@lists.infradead.org>; Tue, 31 Mar 2026 17:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9tkluilWSFi/zwAvCgNgh5sc8znVExg6yAujw+zfcHE=; b=IgBJukjVHVlVxAeC
	uka8zQLMz3Hpa6J1fgfMtCBZI89mTZ68ZtodlMEERZAKZUcKVnWH2l//Tha7AD1f
	WJiujnb3gxO/PKyKDmp9G/vPf5MR5sA9PDr1GksgOsatL2SsqGph9AArDf6S8z8/
	3LhvgwRX/pBIY9Gef6MJTWA8nwyImw6Wy+Cl8dhw5lLukZhh0KKPCWQgYtFC53bv
	MESSzTiyrq/ozH2s9JhocgnIsND7Lsq38ZOvTw4BgrCOb+iHWVpOic3FVqhhpmSF
	sUnufd0QpedVrTnqkCXm7EzO8vDAMTO7aJOwphbYyvy+uqWOaAZ9MrSAlyztHnLn
	oVnf1g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89ga2xrm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 31 Mar 2026 17:48:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509070bda13so3759741cf.1
        for <linux-riscv@lists.infradead.org>; Tue, 31 Mar 2026 10:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774979315; x=1775584115; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tkluilWSFi/zwAvCgNgh5sc8znVExg6yAujw+zfcHE=;
        b=igsjMUslaalRrVKlhzJJTRY18zKvyX9BG8nGK4J9Ux6BgnQK31BMvfdO4gAThst34l
         4nOcBg0XWRXePN+tpr7G/5nPPbMFLXvUmPz7LwOq4U/Cd41IaX5QllO9iwA6ny3TFYxl
         3Qbh/b7flggFLtUWfEagO1l15VKKR61+iIkvz+TbENPctpNcaoOf4SHs00tm6l+Ckbzv
         sbwU8i1qs6TxFHGzsJWn3M50vs+z3wV1ZW+rB9EgcXiP1BC6AVOxIPQiqfhok02y7cfB
         clfBFwoYD3BI0nlW2UQOr/Eih9i6ueA1Kenstnz9AelRTZTdVp42N5a0O8eB1mKuZlnN
         C50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774979315; x=1775584115;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9tkluilWSFi/zwAvCgNgh5sc8znVExg6yAujw+zfcHE=;
        b=hEKRHqE5UMl3BZWnABuKxiJBl6Hq5zfM/3dpxRNAnJKVfCPEcz9JYSqUeZuHmnvLOS
         vtBGCVEM2S1F21lg2WyLrl1Z9xASPxRQ2r5s3heHIiPmVVjJN+zXhkNkUIFv3Od3ZuLZ
         IyG5b2eh6zgAkXF/p2An3pXV4VZYdrO6Ec/BUyA+5t2RXgmm4awJq99G7dq/zVL0m7pu
         gr9T4qwOJpoe9gvN9/XfLs/vHHdbkrXz275uduJU5Q/7Y6Bc1ccuV4/imYWF6HlqeL1r
         0kal4xTzOsW6MT9KMxP4c9Kt8KZOOMg9P3Q2OsADSGnOnru54kzWekcZ0/0eyNitPQ64
         mn1g==
X-Forwarded-Encrypted: i=1; AJvYcCWM7Sl7wMg4f6evLI7B6+H4mu24iALTASW26fH+9MtgIFcKy+8dZE2HcTRTBLaFcNKOX13xLL4DVgjJ0A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyahNm2mKNzmNGxloixDK2jJu6sbmqOCVnqoZ+xJ5VzmuvidKAG
	pRqEEiDa4vxTETGxu7yeHwhXXfwRhh6tvG+0oJrpHfDodusUx3nLtZAaUyQAd3nxh+0cLUaDZSG
	QqG5pmPD927XVyiY6Mev177xQIyukoQlMiQh54ldIJi0spBMchrvep/CPjzUmpfT1/Al/0+c=
X-Gm-Gg: ATEYQzy5Fy4xd8F/A5Zvv12DQXSBRqVbJ6+THmxgyVtzjdNOo9v8HRgwfMUI6BN3L6Z
	bG7Ld4QEY9lz2xqmZ9SqkaFHRPRs9wdGuRtqzrGTonAQQ7Jhqkfv26HBKPPeiUlDVradm8j0XG+
	REtO/CO1gf6mr4yIzAPfQJxeQm8/K+i25BqrNdjWMZoN3vS/xvr0OlYz1XusNkuxKpU9++OlAkd
	o3CKO2x7/464Acgx96z/x1eWuVqp0nlNqpENIYr3vL2gbyuMhNTCAFY1Jat++xI9lRkrDEn9QPr
	MfWdq13RObpk1Tv79c1WFtx6BMPmks+y1WqrbUbS61kEYRHpwzd3EBKbZrLq09+GvmPVeAlastj
	kVknjIh/Toxhs5MEQ0X9hk/cheOO9hXavOBvmz3+q+JS6lGrMyNSLQT5hs47j
X-Received: by 2002:a05:622a:a045:b0:509:144a:43bd with SMTP id d75a77b69052e-50d2c5b718bmr43353461cf.3.1774979314910;
        Tue, 31 Mar 2026 10:48:34 -0700 (PDT)
X-Received: by 2002:a05:622a:a045:b0:509:144a:43bd with SMTP id d75a77b69052e-50d2c5b718bmr43350401cf.3.1774979309635;
        Tue, 31 Mar 2026 10:48:29 -0700 (PDT)
Received: from localhost (ip-86-49-249-15.bb.vodafone.cz. [86.49.249.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c091331e0sm50383566b.8.2026.03.31.10.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 10:48:28 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 31 Mar 2026 19:48:27 +0200
Message-Id: <DHH5NGQGQYBE.31X8OI8AKTYRU@oss.qualcomm.com>
Subject: Re: [PATCH RFC v2 08/17] RISC-V: QoS: add resctrl interface for
 CBQRI controllers
Cc: "Paul Walmsley" <paul.walmsley@sifive.com>, <linux-acpi@vger.kernel.org>,
        <acpica-devel@lists.linux.dev>, <devicetree@vger.kernel.org>,
        "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Drew Fustini" <fustini@kernel.org>, "Paul Walmsley" <pjw@kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
        "Samuel Holland"
 <samuel.holland@sifive.com>,
        "Adrien Ricciardi" <aricciardi@baylibre.com>,
        "Nicolas Pitre" <npitre@baylibre.com>,
        =?utf-8?q?Kornel_Dul=C4=99ba?=
 <mindal@semihalf.com>,
        "Atish Patra" <atish.patra@linux.dev>,
        "Atish Kumar
 Patra" <atishp@rivosinc.com>,
        "Vasudevan Srinivasan" <vasu@rivosinc.com>,
        "Ved Shanbhogue" <ved@rivosinc.com>,
        "yunhui cui"
 <cuiyunhui@bytedance.com>,
        "Chen Pei" <cp0613@linux.alibaba.com>,
        "Liu
 Zhiwei" <zhiwei_liu@linux.alibaba.com>,
        "Weiwei Li" <liwei1518@gmail.com>, <guo.wenjia23@zte.com.cn>,
        <liu.qingtao2@zte.com.cn>,
        "Reinette Chatre"
 <reinette.chatre@intel.com>,
        "Tony Luck" <tony.luck@intel.com>, "Babu
 Moger" <babu.moger@amd.com>,
        "Peter Newman" <peternewman@google.com>,
        "Fenghua Yu" <fenghua.yu@intel.com>,
        "James Morse" <james.morse@arm.com>, "Ben Horgan" <ben.horgan@arm.com>,
        "Dave Martin" <Dave.Martin@arm.com>, <linux-kernel@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <x86@kernel.org>,
        "Rob Herring" <robh@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        "Len Brown" <lenb@kernel.org>,
        "Robert Moore"
 <robert.moore@intel.com>,
        "Sunil V L" <sunilvl@ventanamicro.com>,
        "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
        "Conor Dooley"
 <conor+dt@kernel.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
 <20260128-ssqosid-cbqri-v2-8-dca586b091b9@kernel.org>
In-Reply-To: <20260128-ssqosid-cbqri-v2-8-dca586b091b9@kernel.org>
X-Authority-Analysis: v=2.4 cv=KJpXzVFo c=1 sm=1 tr=0 ts=69cc08f4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=fuErIE+P63Icv3tqjtEZBw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=IpJZQVW2AAAA:8 a=1RoDV13bKi5nvpdD3ZQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: wK4trmFdJ0jL54x36WFCWMxaQcyGStMn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE2OSBTYWx0ZWRfX9YWEil1sDP7i
 WD7GBzlrNu61yyYNTkDjK9PmKAmTaZBlR/7Kz76N200Xt2nlKPNG2a+oS1I4RFS/GdBAuYMGasF
 OgYixkqQjXf6zA20A4uAIVZvnummGfY4NlLrix9/2rIxRs8x4fz+ii/0kGjkPGRUHXG4HUdpEkY
 apJQ1t4p0XLdsVP444R5R9Mo+bhTAv52zXX2ZWcoaJ5d9bhI40INqVaQPvOKEAlC8u7i119r0Mp
 O9ots+PJFbSeeDo/S62UZl2F7RcYGlWNgMTnt3McT7YB1ti/G2QoIahb7Uh16YZB0Gk52IQZ9B/
 tBO/qQInOtVcwp4FwslFdk0ReFojQbDNnWVrgfnvj42xmW7hqG6tJIgnzTCVu1Z2spgXeH+LKDH
 sBL6R/QipGOnRQFQjFw54JAu2uqe8L/fXmSHSXFO9DUR1EqLsaH3mzJkvoG/9eN42aCH427ZUgW
 nI3WJtkD+IwNDBZCuWw==
X-Proofpoint-ORIG-GUID: wK4trmFdJ0jL54x36WFCWMxaQcyGStMn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_104836_507889_6709F7D4 
X-CRM114-Status: GOOD (  13.58  )
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

2026-01-28T12:27:29-08:00, Drew Fustini <fustini@kernel.org>:
> Add interface for CBQRI controller drivers to make use of the resctrl
> filesystem.
>
> Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> ---

Hi Drew, I have just a few minor comments as I noticed that you plan to
send a new version soon, so I'll try for a review then...

> diff --git a/arch/riscv/kernel/qos/qos_resctrl.c b/arch/riscv/kernel/qos/qos_resctrl.c
> +static int cbqri_probe_controller(struct cbqri_controller_info *ctrl_info,
> +				  struct cbqri_controller *ctrl)
> +{
> +	int err = 0, status;
> +	u64 reg;
[...]
> +	ctrl->base = ioremap(ctrl_info->addr, ctrl_info->size);
> +	if (!ctrl->base) {
> +		pr_warn("%s(): goto err_release_mem_region", __func__);

Missing "err = -E...".

> +		goto err_release_mem_region;
> +	}
[...]
> +		ctrl->ver_minor = reg & CBQRI_CC_CAPABILITIES_VER_MINOR_MASK;
> +		ctrl->ver_major = reg & CBQRI_CC_CAPABILITIES_VER_MAJOR_MASK;

Major version is shifted.

> +
> +		ctrl->cc.supports_alloc_op_flush_rcid = (reg >> CBQRI_CC_CAPABILITIES_FRCID_SHIFT)
> +			& CBQRI_CC_CAPABILITIES_FRCID_MASK;

FIELD_GET() could be used to make the mask+shift pattern nicer when
defined by GENMASK().

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
