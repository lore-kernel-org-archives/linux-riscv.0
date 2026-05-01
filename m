Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CA4CD3424
	for <linux-riscv@archiver.kernel.org>; Fri,  1 May 2026 09:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jQM2wLOZh2W+c7dIjEswM47suVJWyaxUTDaoMlmDtms=; b=UhrPWbUEHch3qe
	vw3H+ZCSnpNJ65ZrpUXTNzz1UC8dkaQEnle6ImntgSAr1UtSDSJVWzIoKHyTbtjWIUlTVu/lAED4q
	n9UVxfhxeSRO2e8IamYX1VfjWorsVcPhXh9ZHymi8gttyF/IE+H0oooDKV6xTc+MZr0TO6/Gmp907
	0D2tcrzXpHJk0L++Z/BwOpTg3U/pGZmp/054REPAIXxiczpij7uM4ox8SycjkIhRt2xDrIPL8dYyb
	4iQ7X9909jtEjg2q3aiC6IKQNiE6omKKrCa6vWRcBHGd/DWcHdv4/ssKPDij165khAjh5JkBKvYFI
	hsYjr5akY3wa0amb2SbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIkAo-00000006XzH-0C3V;
	Fri, 01 May 2026 09:28:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIkAk-00000006XyY-37Zr
	for linux-riscv@lists.infradead.org;
	Fri, 01 May 2026 09:28:36 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64102kkW1820434
	for <linux-riscv@lists.infradead.org>; Fri, 1 May 2026 09:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D56RpDqAroV4uaRrm4q0sPtgoZMAfljRMYmDNGVWHa4=; b=YNyQQy80WpnZEOwh
	J4pv8y3yOMoMdkUOb4sg43Ro/01/glsQAukKnPjz/wFlXEynGgAWUgiLBhzlrigh
	PAPtnTn5xNwb83u7sebH/1fa4T363Opq/miOyrYjZc1Vkg/G63RtXqEmY5X1U59j
	NLi/hauoMnHRutBeck+Igu/4zSXIE0fyy+cPH+ziBqAQCTpbhpQEAIMRECYYBxgH
	A05QM83377oq078FX0HzK+R6w3GuEcP+3je+a7ndc++JOWHwMh6ueIch7Z5S+bAV
	fxjHJrMxKwTlI2qwURxSutbWSi86sFSBLSvEPL7XhY2ieV2iu4iXUXCMtyi02jvL
	6rNafg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv6gev4x6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 01 May 2026 09:28:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e575a50bcso23347501cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 01 May 2026 02:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777627713; x=1778232513; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D56RpDqAroV4uaRrm4q0sPtgoZMAfljRMYmDNGVWHa4=;
        b=dahwftoLabgCBMn3FGx8LU2gZQQxmJQYw0/Nh5aHmkDStrWgnGbNchtB9cI0WUfaIo
         n38dtMkLlXtp9nDvtqyOHk6Y2KfjbzmyrQ3Vd+mLkWOJ77W+hkNGYvrLUPX8waZfVHtp
         AyK+iC5lliHAKBWJZgz5CXl5/YruSGPuu3o3nB6bV4q/bADjDyn8UVfjUNV4P9JCanYw
         9frZ7TozrlZofehkZmV69q333oJeFQgZyPUMk8+el3o9NT0EV7FqA/Wm8Kbgn8Hjl7wo
         2iNZ8fd/U9QeAVVdvmvscY7USH1dpDe9QmdEtoX2JJrdaTcRF+L1CTLhe41ND3YxpL6V
         FW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777627713; x=1778232513;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D56RpDqAroV4uaRrm4q0sPtgoZMAfljRMYmDNGVWHa4=;
        b=Act1p7zD5dRwMhrvE8ltyCHSA9/9EhPRCTa6G+xejCgI92xSaMiMZzz3lET0E2uPvQ
         QwARpK4mZjkF9qSxEXIVybwEJjplWMeE/6/wypdiIX0fhzGNrXzb60wkn4TkUCZ3Vj9u
         n5D+C3lF/vkNkPxeCrCqe2aGKWC+/Pky1goUddy2fxnwcIO3Hty3qCprSwm7KtuVNWhU
         IVElAB8wBRKWNnPMGBDhLBeXs7c2GV5P1gqooRh5H7BfAzQsidE/lR2iEYNE4j6Gm0tq
         yiJ1OSv081CiWsqYHynkO8MyJWw+zsHlV/UNoRTr/9UnmTClaJAJlyCsmwnKv1M9rzFQ
         zmcA==
X-Forwarded-Encrypted: i=1; AFNElJ+QY9Oae5br58Tk7iHUIMD6NwkcReshYhszrh0VAbef3xz72ncP7YOLwsSd2WMrIsy9OlrrQHueyuWI2g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXIg6uIQ+aV3enSFjTnlAKquyOyRfoDarMIqATgoISkV9NVLCC
	Oa+1QCWrTp2nJqD01m4RjG3Az738PLDEAm8yNU9H/H32Pelb5cR91/GnIStIHWg6Y21sqLWnYmr
	bnxG+ruPpR7/bN88WraXhvqCBwBYKJPR4Mybz/Q9NG2kIK7yr7YxMchyCstMnH0JwEBVVf4U=
X-Gm-Gg: AeBDiesufQ3YaZEifAMVX/S/FwHZnpGxncYTe7ACFzLbcxaKcySsTjqmbJjGaZmnMT8
	GbsfvxsUNKZY6Bdm+npeFjp7i2p8UFJV+YSkiFuE4jT7HqVoZ0ftarpi8K/C4c19v9VPY+MvTAe
	Pea/wPtcakkxOCNm0uoU98I+FKOtGgKoGPOMAtnPtuaI3btMBVDyqyfA3f4rkGaokutbZTEkZQp
	SgTAW97hgSyfTMvThPDZ5Cq6H1jhpJ9RpXJ2s5xM3qVtuC3Q+SpnS6wW6jZ6pKmleLvx1JlK/XU
	7fUIDg39PM4I56ZgwWz505hg5iAVKaZFEIk6kLqoesKS7vuEC8wqRv2Z5SLQ/+gbuhaZnHKycbu
	BfZ60Gi3mxJr3UgbB+xWGK3VWdCs7WnGGmibRpyavvj5fITvd3GZBFgEEMvM=
X-Received: by 2002:a05:622a:a15:b0:50f:b821:9c3f with SMTP id d75a77b69052e-5102ae7f6a3mr97062011cf.60.1777627712733;
        Fri, 01 May 2026 02:28:32 -0700 (PDT)
X-Received: by 2002:a05:622a:a15:b0:50f:b821:9c3f with SMTP id d75a77b69052e-5102ae7f6a3mr97061801cf.60.1777627712316;
        Fri, 01 May 2026 02:28:32 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6b89sm119482415e9.1.2026.05.01.02.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 02:28:31 -0700 (PDT)
Message-ID: <35a1764d-7328-45d2-8240-6f83eae1f1a9@oss.qualcomm.com>
Date: Fri, 1 May 2026 11:28:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: spacemit: k3: Add PCIe DBI clock
To: Yixun Lan <dlan@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260430-06-pci-clk-fix-v1-0-32fdc77c02ab@kernel.org>
 <20260430-06-pci-clk-fix-v1-2-32fdc77c02ab@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260430-06-pci-clk-fix-v1-2-32fdc77c02ab@kernel.org>
X-Authority-Analysis: v=2.4 cv=f6V4wuyM c=1 sm=1 tr=0 ts=69f47241 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=iAxtvuIsaXa42ajRdEgA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Y9StGRfef8pvzrRVIVlaf5RiQ77AMrDy
X-Proofpoint-ORIG-GUID: Y9StGRfef8pvzrRVIVlaf5RiQ77AMrDy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDA4OSBTYWx0ZWRfX+VRo9iDz9zyv
 FjaA1qUj0K4Dcp+3fyxNVhE3I+/S1eBEJgmUKWEzBoALfMwPt4+sb0DIZJKvV9ytd9iY2GVYVSH
 Emf3w9BBoROpbIHqV+EtAGD7y5D759ZumV+B+APVsfyJAJCybWDB4CC+GMbTz7iPrC1kNAiLrtF
 Qd/w3S2CnXjnibVbWGskiC2mYFQoctMoaPp/G9lRr7OOQ4KpBqgTYLIe39unmXI1bU1v0SSjk3+
 swu6jIcp0Ep96ntqvQ+jX7LQDLdigGlbUlle0x3gihWc9wEeSmNyLhXZqDM7kkKT5YIlQFh/jVR
 lpdk1gO+I9MB74XAcru1mXBal9pJ4dwA2ZzzYFStk70QhPCvsNEUIOJl1I2iO2slqei048h3tgX
 itK7WyM0yPdi9Ygpn5ma8ax2LoCZW3HAZNAvMYkhC82F6oPZGnWqkMHGsWQ42xB3tSjo+X/KbbJ
 WQqOUp2SDqTA7U/Pt0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605010089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_022834_853659_EEC9ED4F 
X-CRM114-Status: UNSURE (   7.28  )
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

On 30/04/2026 12:30, Yixun Lan wrote:
> Add PCIe DBI (Data Bus Interface) clock which was missing.
> 
> Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")

Describe what the bug is in your commit msg.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
