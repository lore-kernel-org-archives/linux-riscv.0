Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38486C44539
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 10:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u6KdNwXG+f2mWHjckCLvmUC68uUtlwZa1VWJUYlEaHg=; b=grB0hM3dpvgWTA
	Onb/9HA2W2QppOTGYflCSkjkAkEsyo/0/C/S774ZK5CpVabl4Y+lG1ht7X4aL/dXANwpaLoqmu9kv
	4ToR/VM0KhvUlVSEWaGox0N4FdCViZzEx9dx1B3kM5uw7xXGMVHqmvAeTm7Ij+/Mem94eVZ++hiE4
	4P/W5gZg+eTnxt+pAs4YOUyf/RRHrX3UNepXoUdckCwqhqIdeBioHL9Y03KpxbFWe3s5/WUU31dC3
	ZiXC7lBtf0YX6cJO1NFsMnJrlDNn+I0WTaTy/tTp1wwcP3ioHp1xsEGcKSH7MnfdOLBLmsB308U9U
	7Sw2d3Pkgu2iv3LtLTyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUdI-0000000Bb4t-0C1K;
	Wed, 22 Jul 2026 10:57:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUdF-0000000Bb3m-2WE1
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 10:56:59 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xANI383793
	for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2026 10:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dn3Lp5g9fW+vOk8zds/Q5HKJwSHde/ykKUM3UgQO2/Q=; b=M5kizwTRKlP0HEaA
	vA5DdiU2TZqxaIj0ot5NdxHfHSItIYI2b3RPc10+STyr5HiUGHyaZB5qm5PWzTbG
	EMdBY7oiA8RtRJJAJ69nTGq5ftBWhd4j91Wp9ouKu9MeWoNtq2kWZqvBcvV6IsaF
	HzLCsov3iWnckNK6uN9y9P3+DO9m8hgrLicus93hakByASTlytmltxaBmSasgZ/O
	N4r+lbz4xa3tCBSRm3AK0Ha6zWjWxjTiDH53bjEdfkPrBzMfUM6+wt3Il2S15tpd
	fzzl26FhI6/OQfBvE87k3MlhAv1WyJX0UmU1hDmSUXp/wwR6NyRhl+wiOUvKreCI
	o5tG+w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjs928ww5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2026 10:56:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso155766495ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2026 03:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717816; x=1785322616; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dn3Lp5g9fW+vOk8zds/Q5HKJwSHde/ykKUM3UgQO2/Q=;
        b=h+ClpyKU1wct0W9nkwYb3qNGJzuu9gpQ6367SyeXI8vvvLigyoPT0ggeXjYuoOcA2A
         V+CFmVom5C64PV6nFdCBmHjhwLVagcLtmvS2VwuALGyHMr6gQSyIfKU9m/GvqSpJla9G
         MEMpPZq0HIziHxgPQofIWW56fR564TesS5b0SvPnEeTWBB5gwLxxj/yjxN/GrtB+YPS7
         yShV+p156N2sHOx55jq0J9+b7XemJntRtxkD0P4NnIU7yYnnfjegmo/HcrkwiMScUQ9A
         vnyYpwMzpj6zuPVMAX4uxUJTIBxfpDnfhJyOo5ewR7GdH6Edv3DC7y+2zS4+9F6r2NQ0
         4XeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717816; x=1785322616;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dn3Lp5g9fW+vOk8zds/Q5HKJwSHde/ykKUM3UgQO2/Q=;
        b=WrGJB8eZUxuvlNKe28kiTlj8sBw6hPfdNODwMCk1bl7MU/RzcZeF2612LwBqKYRXGn
         T21Qu2mkNaj8Tyi9gmC9Qjwsd/iatvhWYGNOSAxdvyb+8xI6L1NGozNFG2yX7e3LMMpx
         f92dO9Fs2208OnXxnESW+9BAVi30XvsOhORlXeBhfXyZLveN+lIz+B+UjXHtng15sEPC
         nieO8readR97HGUVlnXYTofGi5irkJLELquSoRLG8SQ0TPWKhgJaU7JUT4SW4HKKpGcH
         sOeTUK41jhwm4bz5/gbj/BOvq1MQ7VP1knpXNv3k66tidhALxoZLMchHHb9IA8VXSpbP
         upVg==
X-Forwarded-Encrypted: i=1; AHgh+RovZh23uJiqRFUtcGQfNiJpsrmbkjjYU7f5XtRbOhcMfWLV8gqAU6yERS93cs1lXAEQxzLCulgWezfmSg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzlWCqoPXHoKRaKWl964duyUP8SPpu/dYufkpsQUWiIQYxFvmCn
	ScVmm6jbllyUA6DhNcJeJnUkJ3/5C7BQTvzP9iD4+dvS6jYfmES/RpNshK58dMl+hE+8ZiBmtRa
	xn14GhWmNB6++Piz0fyenSAztuDlbIbaB5DYyLSi/7m5Z4Wra2W+BNAaIIybfS8xxXvL2h54=
X-Gm-Gg: AR+sD127kJPGAuZzkKx+9SHIlX8/YUYh1PzhDi4S03UArZfWs5t013Vhfecgldrlm7R
	iNySudiSk1nOQoaWDJmmVfPE0VQrVY0q9+KwrJwVqRVvxSsvNwMg11XjukgZem0iWJ6tnVipgNG
	GeRMYH3Z5Oy3itZt588HJavx/ekGEJVtp+23QAez+VoDobOPipmXw+UNa+I6AVs3Z6gobb94+H0
	qDGhUs00hF+HCFmLmNXxv1MUr06DLfZIK5PbbIwqa/c/VoBbuV3I8ktf1fzq5q8iy6OnWMferut
	+dQGxBaCzRIMgygfSpeeQt2jsj1Qt/XMHBwgb8QrjkjSCoFUkaeeIxxnGDmyIqUKqVjlTPinzLp
	YDw34Ik+xIDNHnOe0UN2wo7yji2UB9hwrhTr4ctB7YIpGpBn8HnK5mDV/VlfteGq7cQ==
X-Received: by 2002:a17:902:f705:b0:2ca:304:f93e with SMTP id d9443c01a7336-2cf3495db8cmr244223075ad.22.1784717816409;
        Wed, 22 Jul 2026 03:56:56 -0700 (PDT)
X-Received: by 2002:a17:902:f705:b0:2ca:304:f93e with SMTP id d9443c01a7336-2cf3495db8cmr244222705ad.22.1784717815982;
        Wed, 22 Jul 2026 03:56:55 -0700 (PDT)
Received: from [10.133.33.177] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f2e65e6sm12700925ad.38.2026.07.22.03.56.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 03:56:55 -0700 (PDT)
Message-ID: <f958ce71-c8bf-4062-a814-aae3df80bcf8@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 18:56:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: coresight-ctcu: document CTCU
 device for shikra
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
References: <20260722-add-coresight-nodes-for-shikra-v3-0-1400a3454e9f@oss.qualcomm.com>
 <20260722-add-coresight-nodes-for-shikra-v3-1-1400a3454e9f@oss.qualcomm.com>
 <20260722-astonishing-loud-labradoodle-bb59ce@quoll>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260722-astonishing-loud-labradoodle-bb59ce@quoll>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNiBTYWx0ZWRfX6fttFDZaUEKe
 iBX0jvYIZa9KrlXc1n1yS2YXGFrReheDDvueEmrNaJDpCc7rOASDm337ExmX2IcYklWI1ey/Lyc
 5cMkBOjacbzNUPkcXv4syTBpGLxZyfo=
X-Proofpoint-ORIG-GUID: nCHfFCVQj6CUDy8EIBg1SbJeur4TQCrs
X-Proofpoint-GUID: nCHfFCVQj6CUDy8EIBg1SbJeur4TQCrs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNiBTYWx0ZWRfX75RHJKiuYbxH
 o6VaOYz6oAbtVq3yABocqcbMYl8upUSGTHu+nFbPT4/AvO7JFXZ+BSdpWz+ul8FRjKObFCZ7WAd
 0bo/mvRfcjV2Hq+FduuEFD6ND2Iz3ezqgx6lYYvzs1RnosJWcWq4/9k1Xb8zVvF/OcUnwGnE1d5
 xCSmkD30RkwgQNROWDzISj0TJ3dwKobsI6oGTFXayNwnDjxG+rVT0ZogTe3mt7R1TG9za6J67r4
 XoOjx+dMnaopqpRpGCz5dcGHDjRoyLLd1trLO4yAmDGxvG2PEVDFpjhD6y9wJHn5/c9QSqqx1Tb
 XIU6wA3cso2zR2bLnNekAFlbc3at3t3weXhQPTKI04FCmDV5Of+gijw0gdcJfwkyFirf4cg6rEz
 I82nohuAZoPFJ4d34lf7V/UP9hOhY9rlsPD4uT85uqXXC0PC23zefJ4+2XciOC2uNTLhKNai1hi
 0pXhr9E5gCPLRoT0rcA==
X-Authority-Analysis: v=2.4 cv=QahWeMbv c=1 sm=1 tr=0 ts=6a60a1f9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=PwRE6yEF67RGCJE-Z6kA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_035657_646555_2C6CFFBD 
X-CRM114-Status: GOOD (  18.60  )
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



On 7/22/2026 4:15 PM, Krzysztof Kozlowski wrote:
> On Wed, Jul 22, 2026 at 09:13:47AM +0800, Jie Gan wrote:
>> The CTCU device for shikra shares the same configurations as SA8775p.
>> Add a fallback to enable the CTCU for shikra to utilize the compatible
>> of the SA8775p.
>>
> 
> This is not arm,coresight-ctcu. This is qcom,coresight-ctcu, so the
> subject is:
> dt-bindings: arm: qcom,coresight-ctcu: add Shikra
> 
> I already pointed out this problem at v2. Nothing in your subject is
> telling this is Qualcomm! Not even mentioning such trivial mistakes as
> lowercase shikra everywhere.
> 
> I also do not understand why you add so much redundant information to
> subject. Subject space is precious.
> 
> No, at this point you should not make such mistakes.
> 
> Please take this feedback to your entire team, so I will not have to
> repeat the same exactly next time.

Thanks for comments. Will take care of it in future.

Jie

> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
