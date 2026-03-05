Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E5EEEF30B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 06:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LEP+1M2EvqBmAyQDzuOTQgrp6+Lhth9Dsbe+GNuhwvs=; b=Ngh48D8/cJXs5D
	WJAnE1l/AipRteje1J/90DqxixZe3fslUgDu2ZmZ7Q864QFQFnlz/SAd1xkPxkvenw9uwgT9zel2r
	ildqVtt0LzS3eOs9B7S2BZW4FtpZMLaBxFkK+IP3ZhogzeWZxBfTG/73oD8mDzgN7P/HC2Wi4X7F+
	5T/FepN9hn9eyTI2nxEByRdSGWEb8mHYfrzAyWsHbrbzImSSPBnybTaNNWRwHZCdj5iWdVs9n07x5
	O4Lk580GxrFvSTTODYjj/yvaQRx5gyWpPpL8RLlvAbif6DGixxrCOyJDEc+T/9gwR0LD3OgTXvZNW
	K35cyqNtDC0gXDRGf/Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2C5-000000010jO-3h1u;
	Thu, 05 Mar 2026 06:28:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2C3-000000010j5-2WTx
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 06:28:20 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251BWwW2665108
	for <linux-riscv@lists.infradead.org>; Thu, 5 Mar 2026 06:28:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NBiOAj6MCtfTD4TvDBxgPZ/PXk95ruUstogVhUh6ov4=; b=faIu8x4MUcCONgMb
	Jvjh6Q+Rw6Mtn3wzvPZ3eLncElgTzp/SB6Te5KyllIM53TqnO7bcWHklDABMBYvu
	94u6Uf9flRyvAFyfr5RziB5mc1SwLeITCKCVt0VzWv3FM5twyaOOD3kXeiNbUZ4g
	0nuL/IAu7fuCbwF0WqeKoIUabfQy0WE4mbYT3yGjw3zgj25irauXdRRfbEWHPe2/
	rqBXKdi8T+aIv0UUh8jXm43uxGnN5GOwulVEM/Eqp1cStS4vvhndtUnp/Ygddf+/
	kZLiFjrf+cn5QueQVCNloG8kL3uHjqaQwrCwgMu0pQB4uXD3hOE1B+DC1wQ29Sf2
	h76aRA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuhb1hbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 06:28:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae49120e74so41102715ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 22:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772692098; x=1773296898; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBiOAj6MCtfTD4TvDBxgPZ/PXk95ruUstogVhUh6ov4=;
        b=gEmILbg7KmDhLb13hIRcC0yzYbslEDhvATta/YAAVY8D+jUDTO/qtSjySEBMQtkjYx
         WShXfcltg7nVhgr5wDbmIfifkjEslulpEiB+iRFW8OTkNj4heOEVV2ay6jlCpv2Akloc
         wdbt+CgfurzcRE/C3Giv1y4ZcdqHEheG95OiCvPaFeyM0WIMsf9TPfDXmoJwQrsieyJb
         oh5UBK+QlOXoZJFJn2YszT0WOBSztwK/Kfl5hknonwPfu1nqga0GsazwK5UrOpH2KHQh
         yQBnII0X7171W0PwK+BGp6z44FmQKeAQhnG6jlHhGLgdpJcMKGf7SMKHj4C8oMjkwb04
         o+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772692098; x=1773296898;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NBiOAj6MCtfTD4TvDBxgPZ/PXk95ruUstogVhUh6ov4=;
        b=rmxRQ6PjVghNDNS7yppjvFrYGmw8LFYMeIqkmET+zsMp1H1+ad6Pcc2w4GeHWG9Tvj
         xpL4e9j+nMqdDAU1H6U1b+UY7ERyL3ZTSfVhvH4HtYNEowvErWelhl3VOAzJe2u7Q0zo
         FkFGunwJNTYaHNmS2RmwHsqIi23gI/Y0kK2pXE69E4pgYyXRU4RyLIzbSUVK6XjO+0il
         P72d/i8IYxQYzJHfU8mu3PTpJgzDB4k+0fDsdw7FepJTdhPPTqwKXqp+DQ9gXtPyjZQy
         aaHUgkONDJhHclawbjgpCxG+WUnIXduJIzImiVVUCBqtIXxPoaLm1Qqb+6CuG1oTqiuO
         EV3g==
X-Forwarded-Encrypted: i=1; AJvYcCUDO4KxMJugK3lEnn6jqfPrqKovv3a6gV32IqcaBUAafTd4wjngaJVJol6GtTHXne3YdkIu9fOTqrtzcw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvGgfJi+MY7OuC02c/Ej+Es37dZESSNbdzj5U10k/Js6tbmhOf
	XuQ4ogS8JHQ1pACfQ0D52PO6+Vu+cHGII+Og/kOyXMY/4tYhI7hARqz/Qv5dl257ivwF6+gol8R
	7BE+60fLGCsVrVbCf2HvwkxVRJoFGV9B8eAm0FNS9jGcngjJv5mfNiIUKL8N/DFZiT4iP0uD95a
	9HD0g=
X-Gm-Gg: ATEYQzzMFxwQOjh2WVkQuh8r3qPtCuDQrTshIKXror3LK1yqErhyDwDyWEzCbZZewS4
	OLF79frMfvxGENOnfBWc7SlIYkODRbRk6gOnXV4hAghXpqYf1aoG61Q491p13IFz+Wba0iWhdmN
	FUWExGdu41BmshWuPi/MMW3z+lPLv7YAFa2O8ZT9f+Y/obeVcHS4WtNtT08RAhJNJ0MQRTJQCSP
	5xS5xTRSTYTnV7bm7JOFQ/WVmakMUd/ny/W2tGn8bf64IypMZ/UNZwoQD9z06yXHSdoDcw8WikB
	Dz6W66KuEH3xsqepZrcggIHr2JB4vUbAYb+/77ENiRkSrzg7ihuy947bDUA15+h125VknNjjfw3
	L0G2T9d2PGS4ylkBq9zGPT/c=
X-Received: by 2002:a17:902:e952:b0:2ae:6887:5c2c with SMTP id d9443c01a7336-2ae6ab9d5ecmr48268995ad.50.1772692097752;
        Wed, 04 Mar 2026 22:28:17 -0800 (PST)
X-Received: by 2002:a17:902:e952:b0:2ae:6887:5c2c with SMTP id d9443c01a7336-2ae6ab9d5ecmr48268675ad.50.1772692097226;
        Wed, 04 Mar 2026 22:28:17 -0800 (PST)
Received: from [192.168.1.2] ([2401:4900:88da:227d:1b86:2ae4:5dce:122e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4bbdec99sm153479575ad.64.2026.03.04.22.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 22:28:16 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: linux-kernel@vger.kernel.org, Randolph <randolph@andestech.com>
Cc: linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, jingoohan1@gmail.com,
        lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org,
        bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
        alex@ghiti.fr, aou@eecs.berkeley.edu, palmer@dabbelt.com,
        paul.walmsley@sifive.com, ben717@andestech.com, inochiama@gmail.com,
        thippeswamy.havalige@amd.com, namcao@linutronix.de,
        shradha.t@samsung.com, pjw@kernel.org, christian.bruel@foss.st.com,
        Ghennadi.Procopciuc@nxp.com, quic_wenbyao@quicinc.com,
        qiang.yu@oss.qualcomm.com, vincent.guittot@linaro.org,
        vidyas@nvidia.com, elder@riscstar.com, s-vadapalli@ti.com,
        ciprianmarian.costea@nxp.com, randolph.sklin@gmail.com,
        tim609@andestech.com
In-Reply-To: <20260225085504.3757601-1-randolph@andestech.com>
References: <20260225085504.3757601-1-randolph@andestech.com>
Subject: Re: (subset) [PATCH v11 0/4] Add support for Andes Qilai SoC PCIe
 controller
Message-Id: <177269208749.19225.17035061961654742152.b4-ty@kernel.org>
Date: Thu, 05 Mar 2026 11:58:07 +0530
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA0OCBTYWx0ZWRfX75vu3RNMICF6
 dSmrtLcABhXgCSmlFJGLQodGF2ZT96R9e+CGPexgazCUdAFAgN/JiU7BjQJLZ4SspTTLRyIyUUG
 VYfrMS7UBWirzLRDVSyTi7zOR7zC3/ZOgKHo2G42s0BAIqi/yanW6q1KSRq+rcDaSBjoqqiiyll
 x6LO/v5Dedvy74IEQx5dkrX27I4IVk5Q4+9RU6G8jzM4Qv3UXpIEXgMF8wX9uDbpE8Hcb5pa5ZD
 np2qNoQXwgZQG6rV2As3K6svKpeIpCfBQepHNStEXRCRXGrwzkbvA4CM/XjpwNcBTSrofBP2Jc4
 9Qza8fJAml6u+MIU3XvgQwtgL7l/DZIgtXFLYVYPkYE0x0IvgCfYcNNYrcEvpv//L4np8xnEE1r
 YIdgDfA0VPf0M7sfEkfNEClhW9Kz2AXp/sVSIJWIimuWIE/2XYssCzT0TLJZ20LGhJeT4cCmaPj
 MU9rrD70+rJ1vFz7quQ==
X-Proofpoint-GUID: 087fsOpcalMLxXlAPIbb9o3TUk5YyFs6
X-Authority-Analysis: v=2.4 cv=SqydKfO0 c=1 sm=1 tr=0 ts=69a92282 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=ZT-azI6cAAAA:8
 a=VwQbUJbxAAAA:8 a=GRD_o9NNUOsNfMSRe4IA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=MMnepr4wVL9Sz6vaZzge:22
X-Proofpoint-ORIG-GUID: 087fsOpcalMLxXlAPIbb9o3TUk5YyFs6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_222819_652951_C43E70E3 
X-CRM114-Status: UNSURE (   9.84  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Wed, 25 Feb 2026 16:55:00 +0800, Randolph wrote:
> From: Randolph Lin <randolph@andestech.com>
> 
> Add support for Andes Qilai SoC PCIe controller
> 
> These patches introduce driver support for the PCIe controller on the
> Andes Qilai SoC.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: PCI: Add Andes QiLai PCIe support
      commit: 6bf2305ea846868dc1ff9004eb3f61a6590d8431
[3/4] PCI: qilai: Add Andes QiLai SoC PCIe host driver support
      commit: df5d8fb6fe55754bc2956e501a9e6acaca5af7d9
[4/4] MAINTAINERS: Add maintainers for Andes QiLai PCIe driver
      (no commit info)

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
