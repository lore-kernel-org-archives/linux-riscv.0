Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B06F99378
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Apr 2026 11:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7jt3rng6xcUgyzZ9hOKJSNyRSQ9A1tR8FOpUDrl3F2k=; b=jSiJApeXc7z2VfWG3fKTqeka/M
	UxL1MzbFd843K2RRoKwjvXTAbLPel6x3NKDw65blueUu1f5qK733jWZhcJYbdDtLRyNsvr4C6wp0l
	AOj5wpNdeUqvcDkcs4YFKQvWDgMO3I7sX7Tx9OPZ//kmByRVuPmKHFzxjEKsnAbzMLNjQkNnBvSQ2
	CLWBbh8U3QdjLAp7CpzJK4Bn2JdpwqnQoszv55pYFvSYl2b8HdeOUCDs6X7PnIKo89epZ8YeNrhlx
	u6QZQ1/cCIsJ0TjFFABNsHQwL7r1cIHL088wd3epY+/ggxv1y/JvT1gEKNSMX0XpYCAYVjAzFb84A
	4xcXJ73g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFsDq-0000000BXEk-3iSa;
	Thu, 23 Apr 2026 11:27:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFsDo-0000000BXEP-1T5I
	for linux-riscv@lists.infradead.org;
	Thu, 23 Apr 2026 11:27:53 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N94fRH2319281
	for <linux-riscv@lists.infradead.org>; Thu, 23 Apr 2026 11:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	97LBoeTlSSpR1cD+GmwGTnk8fuaoiwUW19iK7puwAWU=; b=OUvT6d3d0uZmeeCx
	gGFhtwB95RxMMWqGeE0TbnekCbnJoKeQSaYNn2YJqvcNAuyCaV4mZLec7snm0hOl
	A1mPGZ8DozFrhGzZVwVITxkrjb56H4708VoZrK+wNvomClRM6+hD7AM79SCkI+6M
	Zod2F2HOcpJ5AD8Hzj+HwnvRrxgHT31N8dMNmwiFSbwteoukE6wFqTmoFlB/rzCL
	zo4shYkxqJcBv/WclGjv3bmBvt+ntO98gSTI7zJaU1HcOgpVqAlDL28NWEgfCIWG
	YCx8Ofo5nCDMXnK5+zODyPKKNVnTlPwRkxxdv2IvjORcNkpR0zGKJV1RPnx1j+Ig
	Hw9z3Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqgfsrh0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 23 Apr 2026 11:27:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50faf575af4so88387231cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Apr 2026 04:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776943670; x=1777548470; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=97LBoeTlSSpR1cD+GmwGTnk8fuaoiwUW19iK7puwAWU=;
        b=M0V/gxkxBw1bJCosI2pCeS8jk6SwNzyAwcvvooZgKVDLuKqq9zAF295uxuigGl905n
         2UDos8zd5QB2DWrpvbUiyqfBuOIglLOy0ZcOZXF1YPaW/tgGqgy3fGCW8dsEiZP9Jabf
         pW0y+wFo7IT1YjuE9ymVCrSjiywQbWRZHe6K5cO6msoJX/o1K+GXcLSU7I8sjhg9nuqi
         zQflEMKQ7OMj2in2KeHGMyYRAxO8lOd8xtOJH9xs7kGxcTHyMiZ5R4o9uMZHbPFwkWRf
         LxRgri8JxPJ5BDHLsIxjSA6de3OwH8YUlLcsDT9IAjnNbqPiO+8GS1PuFE5FVdWwdAFR
         p53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776943670; x=1777548470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97LBoeTlSSpR1cD+GmwGTnk8fuaoiwUW19iK7puwAWU=;
        b=eWqiK/oXbaJGgdU2kLDIkMh1493X6N35nJ0Gd+2AgVKd25gJrL5m22w5QaMcnqaSjM
         EIBX+Q0ZUgLWW3w/uNfMqe7QaKgLv4PV0eDdb2Q4iW/LYdxT5Ae8lrvN9zxzaxeqmtHe
         E1iPGJklccloBBgetFBlkfgIc9Vt/EJyB86xBtAfZ1KMaQZmNiR++lcPuPMp2j1n9TRz
         ngnv/1wg/r3yeZjExYt9gNLJ1fKB9Xw5ogRHai7XW+kQZD+WG3erdskiRTI7HYfTAYt0
         qcGCK1rr3PbF5nzgvBQ5yT0K7BSeMy8ybxQrO+SSCe93H/Kghr/3NVFT5JW+9PNt9nhF
         jncQ==
X-Forwarded-Encrypted: i=1; AFNElJ8LjHAAQWx7l8Dvkql1MqehQdbQoNKKBJL8WkLn2Nz9hu6nbXdhbGxtm8Of6ZmZbk4EnyxvyZcmK5MyUw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjevquL2brR3O1E6ActPkMExvlaOPJEQI6Utwe3GXlZ2SL2uNw
	xQQ4ve3LlQp4NLqci0LD7hozW1YQUb8PFJaMgYaBnLyd8qvf6n3Rgbfq7NwuQZDa7WD4B3xAhQn
	1u3J6rfPmRZC/vXanPWD2jmJrpRUmIMKb2NgXMwh5r4Aky5fCOnGHhhGUgmS/MoAnNXKk0pE=
X-Gm-Gg: AeBDietiY7NUNCC4UMFs5npS2cUAcD5HLF+TjbcU8uTiCFCSNsNNbh+8+jUsu2BDrgm
	dGMsRWtQMbBycY4R4YtcaKHL03sIiWS0ftuMidr80Fo7W91bk03wGSiEwgGOESfr2bzpVNsCfnF
	AF9AdlwRS6vX6BGOaoqK0NxLEGPtcHhZqhpKMDk/xsbtuwWV4sy1V2HrlJkg/Hx8yGnjWvmo3GK
	JKS/zYrcMOfip/4Uksqan4x/aNccvyGm7ZCKX6Tv80H1vMkoaj8rzAHTc3Q2i0N3kN7ESBYiGSu
	81XFfFBThsesCaXwU0BvtHU4bk0OeERVqZhr+I5dFXSuRW+BQ6pfHNyfLIi1RCdXi145o2GmFY6
	2R6S5+fKU8jyjIh6fGkT9XTqBhoMXnWxgZG3Vy1+OABoMGvHIPpYZrKsZ7ZXwFvCzdTZy3/V0up
	MoK3sXfFSH/omk5CepXag=
X-Received: by 2002:a05:622a:4a18:b0:50f:783f:31a6 with SMTP id d75a77b69052e-50f783f364fmr209899371cf.38.1776943670407;
        Thu, 23 Apr 2026 04:27:50 -0700 (PDT)
X-Received: by 2002:a05:622a:4a18:b0:50f:783f:31a6 with SMTP id d75a77b69052e-50f783f364fmr209898881cf.38.1776943669948;
        Thu, 23 Apr 2026 04:27:49 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a52583fe7sm221213495e9.13.2026.04.23.04.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 04:27:48 -0700 (PDT)
Message-ID: <b036d5ce-c6fb-4e8d-8baf-b580c8c952c7@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 13:27:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] dt-bindings: timer: Add StarFive JHB100 clint
To: Conor Dooley <conor@kernel.org>,
        Changhuang Liang <changhuang.liang@starfivetech.com>
References: <20260402084019.440708-1-changhuang.liang@starfivetech.com>
 <20260402084019.440708-3-changhuang.liang@starfivetech.com>
 <20260407-unedited-overlying-f6df47c67bb8@spud>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260407-unedited-overlying-f6df47c67bb8@spud>
X-Proofpoint-ORIG-GUID: rAucwMsnyY6c8RgXGeaLoFVH3NNzK0sx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExMyBTYWx0ZWRfX+KrgqFw7ZZ4P
 VnteCKeDAkrGSSbraGPLEMCIB3RbB0tXdrhHOtYVE0472Nt2z/JW6FM1H3DW9Vz3UfSWnL84vig
 wEkuA1fEKF5ifX10xZm/uEPzelhe+snDZupG/bSChYU4onGeBX4ovrlfz2L9NI4kCxxcUkD0W4H
 xloupJGcyp6CK1KLbjUWHM5dNtHF4XfgYW3eIR5e4EBgAAsvvVelyF0dsdiQShr9nwZ3uAahXCo
 0rLu6yJStyEKNOYk8NV9/LetpVJMskbaJSAh4JJCscPYNrZ61+4TYaHUGNfFgZic2H7gfT1KfYG
 9o1hH4amvU+CHAn48RjkJg1iynYUoAHsbJ0Aab5LiCbBoym5T13x0zWYTYx7JtrDIW64+dp9QHs
 B1p3+T3b3FM2Ofq5hS9z8jg0pjETt1W0ipqmH2knF9vN8Rm2Mm5gTMbJS6R7F7Xl4ZDLBIOYSFU
 m5m6ziqUegBXILT2BUg==
X-Authority-Analysis: v=2.4 cv=AvbeGu9P c=1 sm=1 tr=0 ts=69ea0237 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=XYAwZIGsAAAA:8
 a=5mgP7XhCOcSXvvpaiZsA:9 a=QEXdDO2ut3YA:10 a=2twJjXCMuRUA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: rAucwMsnyY6c8RgXGeaLoFVH3NNzK0sx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_042752_401790_558C669F 
X-CRM114-Status: UNSURE (   6.18  )
X-CRM114-Notice: Please train this message.
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, Joel Stanley <jms@oss.tenstorrent.com>, Drew Fustini <dfustini@oss.tenstorrent.com>, Darshan Prajapati <darshan.prajapati@einfochips.com>, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Hal Feng <hal.feng@starfivetech.com>, Guodong Xu <guodong@riscstar.com>, Yixun Lan <dlan@kernel.org>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, E Shattow <e@freeshell.de>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, Junhui Liu <junhui.liu@pigmoral.tech>, Daniel Lezcano <daniel.lezcano@kernel.org>, Michal Simek <michal.simek@amd.com>, Paul Walmsley <pjw@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Michael Zhu <michael.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Ji Sheng Teoh <jisheng.teoh@starfivetech.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/7/26 17:56, Conor Dooley wrote:
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable

Applied, thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
