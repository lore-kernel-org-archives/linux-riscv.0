Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84442C44532
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 01:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WCMk5ou3Fh3kP6L5XI+3zh2U9pO4isj0s5vitxp1wKA=; b=j/ov38la2Js4bs
	nLXVp2AFe+u9fwGTBQ1Wzrm1JNFf+w4Acwxe97+xPCFV0eSzYbf1uSlx3sFiQJsT6bjfAJWRY+XJP
	H8XnZGFcFVBCb8ipZpxRBkzQ5h430aw1XXup8/FFkIqsEGWKlaprQeGsYAgD6ydUEfmesvWHuOvSX
	G3fhqZKvQTlZXAyN6pvn/Or5Z8iq7kkXdI1r17BmISdMaWWR8gWKKYWn24gMY7Kt3DsRz/b1P2yai
	WW+BC/j+x48lvcukDtq9EaeoulrV0VD4YvtwGFM2M7q1TdMYAQrIjmkbtoYaKv6L/SHcKe2Wo6wyV
	1AK65bqLOfIrzM3gvXEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmLLx-0000000AgLx-3eJ3;
	Wed, 22 Jul 2026 01:02:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmLLv-0000000AgLC-0WXK
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 01:02:28 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZRs62910895
	for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2026 01:02:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ojiTB81xoey0jNfFxlpZMmHDF7PMrb5D/K/H1sD3MDs=; b=A4cQdBcOfzSJ+xxs
	Wf9YkPWkl0vVI0PXxqY2IwQSKv/6Rw3/yPwo+xat7cf5zHYobvNq7EfHyy7BTem3
	BhsTYDmn4UPLoGNNn8yy0+GlJVVQ5soCHQnuSzg7oiRRKUM/YPAHsV0T9XTr7ATn
	Ce+aWg0vGWW7XcE8tJL8hFcdJueR+bn7XkAwr4tAe3QsEzuROnRxYHvjnfU98mYe
	xEMN6AeVQscx8l+0BzTFqp91S9TmpMkFKuFXPm/cOgM59LRoxPBYzC0POR7wua8l
	0K5lOHRmEaC/NhhEeTXJgvtRH6RFNSWnoNRDAofV2nR5VC/jWaiVHfCVj9XaK1Za
	AWGciA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9c42sqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2026 01:02:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8486ffba174so19594557b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 Jul 2026 18:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784682145; x=1785286945; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ojiTB81xoey0jNfFxlpZMmHDF7PMrb5D/K/H1sD3MDs=;
        b=QzbwPXhnK3d809lEOo7eMWCVZIy0Va6ODQ8zf0x7lP5YlY6QW8lI3vnVIXQJ9J536T
         MfYbVVZqJN5QARJadRfTNLzIQ8mj9oL7lPdDx4BWmdulEj3HZBsln/7qAkQv5sxWIh/w
         4CNW0aGMWsbVdJrHqm3c71OzfyZHaAFX6FKyxyhQJkTO5Q49vfCikbIWJZjfDckwosfS
         eXn/UVIa3lw+manJwEOkUCxRZuV9Kqm0HDRrstgeJsDzj81jBkGQLHE3biwQKx6ASEnj
         kBBT9h4N9pIF16tmseZiBg5Qt2KBPSwhKwbpCvdWJzru6968rTDt7Uzur8Jqsi7AAqri
         hXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784682145; x=1785286945;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ojiTB81xoey0jNfFxlpZMmHDF7PMrb5D/K/H1sD3MDs=;
        b=C9Oy4M3dSIFNxJena6zoVOPG0zu6aBqlTdPqp2nsPJz64T21bSGmAnyKnfbtv2iS6m
         UzL6l7e8GKU+VSIH21zRJqzXf+ABAxoRuNFLEVR+/2J1KAa3QvRF3Y4bHgTxnyis3JmN
         oQvapbw5JQqv6ARphpaB3x8lBUQ360lvD6/tYVuKSvLX2uUHjqsVk+AoUiModGIvgc90
         Ed3NzXgGIupTPLKqpx68ZUw6+d680pQ2vhZXwzm7McKNF9Nfo8yaohybtMMaTwYXal31
         16RGfqN1p0+bzdUjd6Z0lay/yb1X8MJGmR7dZwFdfszoVQeeglN6P+HEJCY76JOkxlmc
         IOvA==
X-Forwarded-Encrypted: i=1; AHgh+RqyiykPHNzsfLudhe2gI8XsUXb0CGQ9ypd3NUcnyhG5mupjcodmbS8pDatXTKKtdtEMIboAPyUz8r8D/A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOyrqU06rptTvgYybyVvIDb8qBKEC1qa7ygDQUlLs9F2WBQjB8
	rb4AF/XRE362sy4yrhQHTO0qW3pm71HVuHrOs1SHcA/YS0OzkR44Fltmc2iA1iA4Tu8gZH8dtnU
	G6EUX+bo8KnAkv09oo6/ZyOo86VAC/N0l+iQZBmLzi/1tG7em+wzy2dQnAg4jQyUf0poEaAo=
X-Gm-Gg: AR+sD11ZW3A2YC3+cOrIGKOQ2kpEW8sBT3ZGIienjYc1+GPxmwkI0vZrF7QtNR08Agv
	ze6akJIpjNvnPmqCKMH0iI5AH5SMqjL6ajwIHAfxPI1FstcLtMvvwR06/fclM7y8nzxh7ZdfeWj
	OtRi+31ffe/z9VKsf9RWoTRXi5221PZOolDqNlovbsuVFR75pxCRbw/V8Gnm3EMMuVBD7qSutrT
	xFa51NV27Xyz3i5FtzVq6WCcixHEICxKApsvnnSj7LGKflSmpJRTXLVd5Hry4ctcuHGeo+Ad4Y8
	x5uscEUny1b0dEWZXwrqkOVucT3GSPvlUkvSERGG+0TKrTLvrSCJcwU07a6S+lkGzy5S25ZC4J7
	q3H99/T7jjKYpDgJ80ekU
X-Received: by 2002:a05:6a00:4091:b0:84e:538:476c with SMTP id d2e1a72fcca58-84e05384b33mr5558306b3a.67.1784682145225;
        Tue, 21 Jul 2026 18:02:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:4091:b0:84e:538:476c with SMTP id d2e1a72fcca58-84e05384b33mr5558254b3a.67.1784682144785;
        Tue, 21 Jul 2026 18:02:24 -0700 (PDT)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17237761sm475347b3a.4.2026.07.21.18.02.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 18:02:24 -0700 (PDT)
Message-ID: <2a532aa6-925a-4c97-97d5-22f4ec6e51ba@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:02:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: add CTCU device for shikra
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com>
 <20260715-add-coresight-nodes-for-shikra-v2-1-ebd485e39a51@oss.qualcomm.com>
 <20260721-stylish-dexterous-sunfish-1653eb@quoll>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260721-stylish-dexterous-sunfish-1653eb@quoll>
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a6016a2 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Dx5vPtEcpawhRY5uvL4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: TUd_Ldh4GfXbi1KMU3nLRAzNev0VXEm0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAwNyBTYWx0ZWRfX3H2CF6MK7n0t
 RIgxy/9aHo/PrdCEJe+4LRCpTVarm3bWKGfnmo5b4U2xdCLemyV/4OTwBNavCrkrNMwwXKB8fUS
 09sEzqJm/2N3M1VelbDAwuSBNURmscj/ceyyp6QQ8gitgvQES1srFJaMGmQu9RZUUz8L/rjsw9R
 nZly728fNZzKp/tUb8OOOFslBxtTxiUODRFnrUT7MczynoyKBziw0WUhO92fQBIWyclFzelcaVx
 CiOcKlLmXx+3Y76Vo5H5F/BcVKNKbd4+e6YZuG9p+HSxzOTJuioJnJhkI4tKFJ9UoXvYKrPqj3v
 1wnfoxk/eIt/DMpthFKdo1iwS7lUx8lralDImjUxQly6LoLhtdEHB0sL85K9dMWAl4MYbAH1szh
 D7BdQemkWhe0pbbX7TSTa07proR50NTlwa/sMdI3pCt3yt0E30L4slqsB+7izBJOkk5r2E/Ty2z
 DSb7E3jcSuK3x644KoA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAwNyBTYWx0ZWRfX90YL/qLfOoDS
 KNXAQeSaXHCs8tE/SlpBXfByk+CgYGZT4Cm5REVEwn4Aa10sgIwLbH2F+evXc4AuvcUkQOeAYyj
 2XKZ9bE0i6EqK0f30G0kCmB2I5gfR8Q=
X-Proofpoint-GUID: TUd_Ldh4GfXbi1KMU3nLRAzNev0VXEm0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_180227_163731_42BD26CD 
X-CRM114-Status: GOOD (  16.97  )
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



On 7/21/2026 4:17 PM, Krzysztof Kozlowski wrote:
> On Wed, Jul 15, 2026 at 09:16:14AM +0800, Jie Gan wrote:
>> The CTCU device for shikra shares the same configurations as SA8775p.
>> Add a fallback to enable the CTCU for shikra to utilize the compatible
>> of the SA8775p.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
>>   1 file changed, 1 insertion(+)
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
> And it should include useful final prefix.

Thanks for pointing out. will add coresight prefix in subject.

Jie

> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
