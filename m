Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E73CCFA13
	for <linux-riscv@archiver.kernel.org>; Fri,  1 May 2026 16:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0GjpWf70v8SB8oqIchLny9LUQSKO9ee7MO2iN0sP+y4=; b=cdEjt/26hphFSC
	9gU0FoY2hf4mp5tv9XpjI8lRp2E+XGhh1opWdvXxC16BqmreOIsORjFgTuqN5aX9sDcryhklfDxn7
	A6f2qArFJgFVYfp0k2SXUfcFztRJEioDqmMse1GnUheFa2jOGxuQSaJ7tiu+pIhPABmETsD2iAjOa
	Bij2OgNKuTEcPveDgoJUxxbTSrAyFW9fKqlVRPzYQVc0UQueOyeO63MAZjnwqhUK+PPsLfrQ7mMBu
	2Xtqc8Fyeu9PCbbbFfdo2b7MJpnvHVp58zf9J+JWRjk9586wxjGODC8ow3WwwSnUM2tYENZfaRB2K
	u8kjL6cO6E6rdZhp9dZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr3w-00000007Swh-06v1;
	Fri, 01 May 2026 16:50:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr3q-00000007Sr2-1RTf
	for linux-riscv@lists.infradead.org;
	Fri, 01 May 2026 16:49:59 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLfMe2661234
	for <linux-riscv@lists.infradead.org>; Fri, 1 May 2026 16:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	feFL0BYgyPheoYTLYTI9tk0q8RVVFngbLeFU5p1oZJE=; b=E4Lm8/SKwdvLwwUO
	R14AGeyRZT3l4cApH32rC5V17GsWufgh8yroUBXezusJNnmOg1FQ41yUCPvTgXM9
	NsKEFQ/kIfgPHK1eEjAEkKQzPhIqs6QFmLM7kfiA1cg2Dua1VdfUKfsftft53Z3e
	pgIAiBoljAiTJOpike+ssSj7akRC+lDgSLg8/Urv5J1T2wrDRPo57JpvUxT+o/j7
	7phFoVywUDNIo6wY9n8L2WdmK/AOUbmBQUX+1qWU24b0CSv3sm+knXBZdGp3+ni6
	kHj0JzQsAyA3aBnJ9PKH2r813YKZ2JVYlB0yWadj/zIOd++SAiWFHqqVup+OybTO
	jfDq+Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvhbtj780-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 01 May 2026 16:49:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35e56ed5d5bso3502249a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 01 May 2026 09:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777654192; x=1778258992; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feFL0BYgyPheoYTLYTI9tk0q8RVVFngbLeFU5p1oZJE=;
        b=QFddiYfaoh+9YO8sjC+hOC4TxzyLEGPtKT5fyMIfoNwnsW/VkMaAj/sbVc/znAZrH9
         L7z6RhyTV8rGkB5zyNjc0ZM6/54yYOliMbnbBNooV8GMdFXc/p1b+bjQOisD9CElK5dC
         U8bzo6fSTvbkAz775sstO5IFD5yjsrz7owNYAvrNhLIk6N6+aL1y9MM2pSqNNQr58PJm
         xeHvdLjjXSTp5u7rxWrAmEAQiHH04r0BZHnEv7UX8WswpJ0bJTMyDKHIDyKehKPfiLNW
         7KXINWSQhmvhGXRWfXMgTD6sGgmOvhmcTBnspfigRZv5WeOblt/3IskbVWhLYzxxGsWo
         /C3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777654192; x=1778258992;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=feFL0BYgyPheoYTLYTI9tk0q8RVVFngbLeFU5p1oZJE=;
        b=rDMnquWBUfHldAXpvM2hrhEFMBweua0yVoxQ3B0u4Amm9KuTE74oSy9fOtLGkegi1s
         5pXCaMFL5H1rrrEq3oFdJIODdsTJaUTzvVdGlOD3z7GV/g5Qg3aCSqUVdmw5a98vcVo8
         Aza3K15yIyyCWhNrpRfYaE7OUrly3BfZJ3me0hwSm7tpRVCCs/6WJ5tODgvM8CQzj4MV
         mrSm4WbzCmwt+q2ySOAopjgl18uoz6kojBRgZOpwV7OdkieKpes7Qi+jo1SYvic+tUE2
         lABEenHhz0aEy5pCUXGz44DUPNC0bwPrMtBuEotcvAYLwaawXDdtnNnIKYfwed2eMQCG
         /yWA==
X-Forwarded-Encrypted: i=1; AFNElJ8cQZEWKBiSwTaxedoMX0HqFsprmgRC4VzCI6KNB2Wu7LBp2CucJeZGbCKDl+vda684MeXLHllWuhyNpw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyB3/bLFWFN8MSP8WplV9ZKpMIZKMrVOaYpuhy4OVtjfVYGkf1Y
	NljiHNK3PMY2QjUBIgppxsDNv0HLRjiIEDWDNO4Wub+IlYZh113uKOiso5uCkLZF3b2H77oQA39
	OXRgOu2ERxSOEEa3Z6Uj94uxL+9QYhAUAVQ4/nwmLTvC8p9b+Ei4pVSkGPj4krfIgh2+4oYo=
X-Gm-Gg: AeBDiesyo6Vqnz6EjSWKGbbkoqoHzFW6cKtfypLB0uYCLp7jrs6ahLzPDAav0OBQyCp
	PaD2EY9vOjl1rxKNongdXO/LupM7rcvLmmoavkwGWuNKSjdubD+hg5KEXcY6+y3ULrRniRaigao
	TAMwI1pyk9L0x6/CqjSYeKXmk0UDC/AlsQzOTB21VJ0hSZU1TMYnRh+Nkxn+GX7JaoaJu8TPdWg
	KSC1PpoBPSMNyNi9mUOsFSWf9pVo0efpG1SOWr4mJxjFSNAgjuQ/KdFLXvHoTxxWD6n0k8IoKwb
	Tdl61yZ3a5p0eLSjLcm0ALoVGxKd7NaZmEQrqLTNqMjqn9IogMe+oImP0XP7+prmC8xitLicxkt
	MEnd40SGte0iQeACO+iUDuZZBJFsgyGk=
X-Received: by 2002:a17:90b:3a83:b0:35a:10b6:1208 with SMTP id 98e67ed59e1d1-364c49df0c5mr7425647a91.14.1777654191475;
        Fri, 01 May 2026 09:49:51 -0700 (PDT)
X-Received: by 2002:a17:90b:3a83:b0:35a:10b6:1208 with SMTP id 98e67ed59e1d1-364c49df0c5mr7425620a91.14.1777654190849;
        Fri, 01 May 2026 09:49:50 -0700 (PDT)
Received: from [192.168.1.102] ([120.60.59.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364dbeb2db0sm4926163a91.10.2026.05.01.09.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 09:49:49 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Zixian Zeng <sycamoremoon376@gmail.com>, Han Gao <gaohan@iscas.ac.cn>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, Han Gao <rabenda.cn@gmail.com>
In-Reply-To: <20260331171248.973014-1-gaohan@iscas.ac.cn>
References: <20260331171248.973014-1-gaohan@iscas.ac.cn>
Subject: Re: (subset) [PATCH 0/2] riscv: sophgo: sg2042: Enable PCIe DMA
 coherence
Message-Id: <177765418359.12199.18149733582970959715.b4-ty@b4>
Date: Fri, 01 May 2026 22:19:43 +0530
MIME-Version: 1.0
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=cP7QdFeN c=1 sm=1 tr=0 ts=69f4d9b0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=VvXziC1WMG9Np/cC0Lm1wA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=J_SPmUf-aNex6p-r11IA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 8hKfhJvuXXpEj6uEs8defmOhtAcVelID
X-Proofpoint-GUID: 8hKfhJvuXXpEj6uEs8defmOhtAcVelID
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE2NCBTYWx0ZWRfXx9x1Ihg0nrOO
 oBzGMWtDnLqEKusJ6I5IPjx2kuCmGliZZHGg73yNv08CSwJ9C1cEHctz5rJpiHhn01fUKNSZU5Q
 T8uYx0k852yUmQ4NH49hFDMgWtvSbZIhEX3weRiIkw+sfXUqmvxx8d8PbMcOUuFQWWpk6CW63SO
 Rk5y1W+E6T6BhSnKEIioZNd3VqnluzzrgjyZAT8rz+BM0cCgWWCYiVMARu8UdjTM8M1iD67yUv5
 w+s58cR/PxFqCWnG4visTCoDZKBklJhysFJGU806CrekN5c+Vlqj1w6PKo0YnoTJ8d+NiajnzVU
 Dmt+89rqWDEVndQ9NJb5D+PjTJjbBHeeuDgSaV68unQ2swUiJXGqYzo4IeR+L77tA1RgG31Snf0
 TJk+bwE/MSbi+ZtgWov7F5jP3uZxymDSsMlGsL6v1+YHu09cmxuxLoCnRx5OXW3Dgp7yVbQ4HUu
 5ULVEGlHJ7ZH/CDDUjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1011 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_094954_532740_2AF2F6A8 
X-CRM114-Status: UNSURE (   8.58  )
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


On Wed, 01 Apr 2026 01:12:46 +0800, Han Gao wrote:
> The SG2042 hardware design supports cache-coherent PCIe.
> 
> With recent firmware updates [1], it allows to use DMA coherent.
> 
> [1] https://github.com/sophgo/edk2-non-osi/commit/017a5aea26a066fd2bf501b7893937183165af36
> 
> Han Gao (2):
>   dt-bindings: pci: sophgo: Add dma-coherent property for SG2042
>   riscv: dts: sophgo: Add dma-coherent to SG2042 PCIe controllers
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: pci: sophgo: Add dma-coherent property for SG2042
      commit: 50c94a2351458ee6cb6e52c5678f099534366830

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
