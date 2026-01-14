Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CDED3901A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 20:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0nznzq1skblW+3Eley5wwOM3gxSVo+2njISSulvYqMk=; b=N31Y1gADyCXxL9
	33rWyXL29HKGd0rMMdb5ui6bRgoEDTM/H/wcjSMLxTQtxV8bcH1SN/PXU+Es83YqIpzuef5G5faiJ
	Cc6pPNdulEwmTHObiErD35ZfdUn5987XodL2d63jMZ5CHlqYWhDR3iomg7TbiEZp2JiX0tj0pgCAF
	svrTWO7+6LC7VMJhsFLbU5tz0vFHQKK/a9fzReiGP2Tsa4oOF0d79/or5ixdJGWE8twsFP+O2Ghk9
	gb4TGcyKFZtrrcstkjbPIHt1bi8+8ousT1NJillGIksVq9GwB+6gpBQzTDGQ9i6gs61Zx83jJnSwF
	DsIWplaNzIAUD2CWVNSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg7cr-0000000Aef1-3pU7;
	Wed, 14 Jan 2026 20:37:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg7cp-0000000AeeA-31Ma
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 20:37:56 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EDUwd03550553
	for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 20:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3pQ6gPl8aCDqFfTg18W2RcJTuakekfy8nn8ain90wQ=; b=CENarPmW+LDu7sLU
	SlMog1LkZ+o93A2F6nGh/TPKxoGKY5YSb2/Y2CIuPQFD+IE6A5xTWltYHLq5VtlH
	po6KZ3rGDbCuODu+VkeOmQiQyhmZHq9E5TdOFMU8W9CSS2PLQE2SVO+E4xZm/cKG
	B2tUlKOrCkcq95Ss/Z5a4QuYAfaDHYrZlL4RncAfnv2DjnZbDpmhGpQkFFVyBXKu
	tTJJc8nZJhJ0Cq53Zfe+05qiJYAeCRwy+iKoQmRHbqhuTEvOLQ8EkkyHkwT/wRmT
	9H6dGLD8gZuyLFTOeowbb2uMT0Rx0nElt4V43dpAbGmgyyI3zws7m0MmOuI+wdti
	1KFj5Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpc3jser5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 20:37:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b1766192e6so391134eec.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 12:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768423074; x=1769027874; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t3pQ6gPl8aCDqFfTg18W2RcJTuakekfy8nn8ain90wQ=;
        b=MEVLYnvYo9hAErTp9ikvkHmQzsM5KiTtTLtWDNFozRZzoNe5lr8NrvIeMgwif2KPUi
         EpyAXtQCBV2D4KXsvSpqkzhKeyLwgHikOO0B4KNrYw8IgKZf7ZFDdaGQi5FBoyXtXd5x
         FJI6cqn7VwTPyvIxI+pXtVUPgGPBebst2UurP0UyjUiMzRAOHIGWookQCxSpLX5gcME+
         kAwfR/EU1eVSJJsDrJZWXmPb+2rFCiTWMbsveNZgGG1bJ2/bY3gz025EaVFPBcLwri2B
         R16AXNLtDrQADS6KMTHVuzpvJ2x+XGKOk+DF5Mxbs5s+W62P791alr+XwfNBPeDIshY1
         ls5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768423074; x=1769027874;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t3pQ6gPl8aCDqFfTg18W2RcJTuakekfy8nn8ain90wQ=;
        b=j6yEy7VdQ7Jd7FrAP9j1SeJ6gZLwQGrHHhOuR8ico+yJooogo00KLV+P7Rw7SOxMTv
         EAmWoDmb9zqP/KXS3gHiaax+yR9hu1V36pnojKbhrXH+J0420PmRnyqHdGmCHya06Oxu
         942N+2ozor2jA36mAtpnxKqaIXVTeIsw1oIineHbS36092ZQQ3TaQ6yIQKUFwmRxJGNk
         hYkx2h+wSQ3pM/bJQEkpPwIZkQqxbgBHMBIdYxHRcsYktSAq9lXfVeEzObrOgeHtnMh6
         M7+3KHpPCWWBcbcIamYmncqHlM7T04a93jEqAlJavN4zyJjZ6rrQoZ9CzEF9VQWp2lWE
         oTJA==
X-Forwarded-Encrypted: i=1; AJvYcCVOWgyikAmcwEfkNhYg3VK7R1OSg98iYeMyYhlJ2bs4ooWqaVcz1BaQuVzhPs3Kmfum19FQ/H7izx+K7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtOKoBk5eIxpoTi7Q+F5/uYKzSi5p7ljm7qUh5xHNXP6wW/nPQ
	hr/WXBdomlCS02JyjxJJIGWmRprxDxomazL49fY0/SypC0zNHKBvY2p0R/Kg5TaOHndv39eSWP0
	ZNgpm0UoINxguwMgVOej/B5K8zKqrcnSsp/HCHxuU50hCjoxCdnRmERc8HL6LhWwz6EzNAWg=
X-Gm-Gg: AY/fxX7d8bNHKNqX8qIuhAGQttWx6RXz785Tg0qEdqKSxwOdNAnuPLSIYDLz8arTwaP
	dokEzWEAnHZp4+TqyhvEP/9l3hTIrEsRG1IndnrjsD22fHiRHYhOK3OeSqUZZdfoGrYhdfPUj5r
	f93iGppNuVS331YdHOtl0+GFamuBa4G1Gaxw0/W4883EnP39GKauCZCflPN1VSGNBijT4DI4exV
	jEGTMMOpHYAAcFyao7uBQc1BljGU7UQBTogX4AOC6m479n5vo+Pyv/qHVUghtKuoxLhdDnMS5c8
	MSNkVe3AalyFiqN2tVrizEopDpX18DOispV1Es4NQJwBdx7G8urxLcQjOZZFnfAFOxpphWpz4Et
	7q4tpTWP5AVY6NR3XTV8=
X-Received: by 2002:a05:7022:f8e:b0:11b:9386:826a with SMTP id a92af1059eb24-12336ad6fc6mr4063599c88.47.1768423074348;
        Wed, 14 Jan 2026 12:37:54 -0800 (PST)
X-Received: by 2002:a05:7022:f8e:b0:11b:9386:826a with SMTP id a92af1059eb24-12336ad6fc6mr4063577c88.47.1768423073673;
        Wed, 14 Jan 2026 12:37:53 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f2434abesm31939310c88.4.2026.01.14.12.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 12:37:53 -0800 (PST)
Date: Wed, 14 Jan 2026 14:37:51 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr,
        aou@eecs.berkeley.edu, bagasdotme@gmail.com, catalin.marinas@arm.com,
        conor+dt@kernel.org, corbet@lwn.net, dan.j.williams@intel.com,
        davidmcerdeira@osyx.tech, devicetree@vger.kernel.org, dev@kael-k.io,
        gregkh@linuxfoundation.org, haren@linux.ibm.com, heiko@sntech.de,
        jose@osyx.tech, kever.yang@rock-chips.com, krzk+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
        nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
        pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        robh@kernel.org, will@kernel.org
Subject: Re: [PATCH 2/6] virt: bao: Add Bao IPC shared memory driver
Message-ID: <lpocmy3nmdcudoewe6uxal4srnd2acvb4fi73fthbruyb3wpo6@ky5cpwirm2vm>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-3-joaopeixoto@osyx.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260107162829.416885-3-joaopeixoto@osyx.tech>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE2OSBTYWx0ZWRfX6fukzTDq+3KU
 caStjatN0MKlC56xYbfFDPHy+PvhNvUFzCkEgSXaThzE0/9yekrS7P82LgAr2FhhzXmi7/PMmec
 ZXonncpW3ib6VM6R7/tRQI6VJlUfi+9+wQ+tMCUTJpaSZA6MM/MUsv3BuKoQUTb4pY0so7RB9Op
 EkrXARymWNCU//uHQ1g/N8VKtW6yX9/h/1vATb9JmwdboWCTtNF4Vgo8hhi2gXDWJxdmU1HS3LE
 FDDdqosG/7L5ym7BVuEmFx6955MS/ZXKPE/EHhc2Rqj3Ick8swJ5X6G6OX/h1pWht8cERKOJsom
 ehZTFbHhudq0cjyoho4j1hoDSn26XPRBQBIBxlUVJLz4XnKqs27F1v8ulUCdV1AFYw2GLN1lyM8
 6E3vKnRXSPbNcUlTT5eZ3RomQGAZxbWEkcSlUT88sozzMUuYZ1plaD5U9WC+Lf34tIuqMZIyo6i
 Z8hwIzfNX1BueKrGzcg==
X-Authority-Analysis: v=2.4 cv=RLO+3oi+ c=1 sm=1 tr=0 ts=6967fea3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=8nJEP1OIZ-IA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=U1-EPvYjQXF-sRXeHicA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: Z0U7QL6n9qmL9duj53eFmJS3_NovXcE0
X-Proofpoint-ORIG-GUID: Z0U7QL6n9qmL9duj53eFmJS3_NovXcE0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1011 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_123755_784250_387970E3 
X-CRM114-Status: GOOD (  15.64  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jan 07, 2026 at 04:28:25PM +0000, joaopeixoto@osyx.tech wrote:
...
> diff --git a/arch/riscv/include/asm/bao.h b/arch/riscv/include/asm/bao.h
> new file mode 100644
> index 000000000000..35658f37e1bd
> --- /dev/null
> +++ b/arch/riscv/include/asm/bao.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Bao Hypervisor Hypercall Interface
> + *
> + * Copyright (c) Bao Project and Contributors. All rights reserved.
> + *
> + * Authors:
> + *	Jo=E3o Peixoto <joaopeixoto@osyx.tech>
> + *	Jos=E9 Martins <jose@osyx.tech>
> + *	David Cerdeira <davidmcerdeira@osyx.tech>
> + */
> +
> +#ifndef __ASM_RISCV_BAO_H
> +#define __ASM_RISCV_BAO_H
> +
> +#include <asm/sbi.h>
> +
> +#define BAO_SBI_EXT_ID 0x08000ba0
> +
> +static inline unsigned long bao_ipcshmem_hypercall(unsigned long hyperca=
ll_id,
> +						   unsigned long ipcshmem_id)
> +{
> +	struct sbiret ret;
> +
> +	ret =3D sbi_ecall(BAO_SBI_EXT_ID, hypercall_id, ipcshmem_id, 0, 0, 0, 0,
> +			0);

Just let lines like these stick out. We have up to 100 chars and these
types of few-char wraps are the most annoying.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
