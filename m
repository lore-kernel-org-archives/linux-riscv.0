Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C249EEF33A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 09:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5OMFQj3duP85IlgPMnsgMyEadahPN0Amp9MUQUy3+FQ=; b=fgydpeEF4Uv2x5
	RLExvBblVzaIHs7IrtfksU5S8TqaI9t4mDutko+WrLiWYi7sIPULW09zwx++j/zHnaFXjNj0tZ8Xb
	NvuhyrPL1MRkYTPTjPiYEtFDmS2KfztwSmNSm++A3tixE3kvqAF6eWnD7LAXkecaH9KUBGluu+hYl
	hUY2mBsK6hbD5WNQb3t4lZKPkgbMCSxAUNe/cEjBu3GFc7BvLUlo1jAZ8w1HOjSIIF5DlwKsST2xF
	VJRxpAC7eiEV7BKbSN8yFhJgaGqt2dg1oT58AvKuCJeQRf+o/iKMV7pkhl8TT40L6b5oPA0dyX1jV
	FnWK+Xlq6ZQ1ClsePYaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4kD-00000001KQx-3qes;
	Thu, 05 Mar 2026 09:11:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4kB-00000001KP9-3WH7
	for linux-riscv@bombadil.infradead.org;
	Thu, 05 Mar 2026 09:11:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TypToE/9U/eP/4BcrjqQk96qrNbThgAgULngx0dU9VY=; b=DapEUU3YNZayvRpHCS1erm6yL+
	Xk4ORLF7XFkwdcfAcDJjkyzz5gCRLtcFyASRyZeKx0PD3kKNNf31gMEnpipvdkL8/g+LSDblG7mWf
	zgRw4P9t1ZzDYxBp/LCvJL1QWE6bnxe/JlMEM9tMYgukeWq0gXtq5oIdwWEOF4PklcR9o9kcR3MMx
	kqiR7f1HAE0ZLMQTOlRDSyX8TH4BYV4hcz67l04TU1qLeKD0N8fFr94QU/12sC+T8Mo6mXlubpKkh
	1c6kWV9we6FFEgwtf/Mx3a889qlUP1dY+l5pJ6P+Hu+F3ZCj16aISJceXme22jwMz6LdhLxiMc9cJ
	2tsN6n3g==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4k8-00000006IEI-2DSp
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 09:11:42 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62592aWo628796
	for <linux-riscv@lists.infradead.org>; Thu, 5 Mar 2026 09:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TypToE/9U/eP/4BcrjqQk96qrNbThgAgULngx0dU9VY=; b=W0Hi5Pu+/Kx9rub3
	1LuwoztTEiyin65jy0AFa9w9CeQosyQeKJh8uCqng/kW+AvyBzw620uEIw8ElxxS
	p7DgJXpyHxlQCgU7ZnXWh1fDC2kEZgsF+bNRtHfjWvvQQP20fzVlblnrbJN5YtJj
	cuXRnfwIw9A1WDVd75f5iR90V/hmIMXMAApDkJvz92wPoO8C6Cah4UDdFm28qxbm
	JkVKYxCSPSIeuDpcvHiSq5co1WnUKQ63+OjUFG3+cpPsRMO9kCFdRbA5AXYlIq+/
	D3NF4cr175vifDznzJXmfwFBgZlGYxgAmz/Vae9OYLQmqMJp28j53fTOD1MekVJb
	WfF0KQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0m2nbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 09:11:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb38346fdbso590836585a.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 01:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772701897; x=1773306697; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TypToE/9U/eP/4BcrjqQk96qrNbThgAgULngx0dU9VY=;
        b=FS0L6vTWVK3Ioka6gEGdZ/arYLbPOBxUv8+iKhznduPRuPq9O/QeJXMipB2KrvgwG6
         7pmCrWKVOVXgI40+VKZnWJozkdBNh8FLt6SlZB7DhbAJkadTdpNc/9OT9ZZzMHKpd1l/
         VYxng6JGsnPC2bd/CBLnYJTkieGo+T2emg4wW9GX0MOVxoxU8soI2BKn8VwvIb6bkysz
         A4ize1disV2bIV94Ajn2/xck3uB2BemIGotCym4KVOFRZJyzlgrAtIr8EoYQeJMydkmj
         l3GXOEYTKArS9xexhrlkhXd/nRk+it0/416Rc4tlmv/ZlzuLheEgv3sZs0syQ/VJ03JJ
         nqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701897; x=1773306697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TypToE/9U/eP/4BcrjqQk96qrNbThgAgULngx0dU9VY=;
        b=QgyVMIHCRSc203HQPLbeW70JyhoUfgWMm9p6VgJw63N1FKm26vrT0M8fOwx5hDWLdd
         qecN0IoduTmSN3YCA01jP+KABOTaMVzHGwETrY+fKo0rfSBwOhrQRbA7traEKth4CU+v
         ugoiEH5P8gInIe63y9kbvT/Eslm0+ryzZk9Lk0XMG/Q7QB+suXozTJPn94lvs4NCop1Y
         NUr9VlrTlOOlYLWVqDq3b4dwlAiw/PXJiOtB7GV2fSQLX0AksTvZZRkwTtEdG/Y3nPcY
         0TjEj4Qo62frTFJ7CLeSYHg1wv17uUdCX/0qwhK2weoiqvt4QgJu5SkRaxLjUlAl8Xk/
         C1XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgnHh5tYmQRNcNKPv11oCSdvGmBok/Ze79+E75ZED/XNAVqGVvbP/QgVSIGh7WuzkF4VGbohW+9ciaJw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVdGCCuS7p19qOQK1v8twnTO9oT7DDjxyqSiHgw/NlLMaSkQFJ
	E1empXZavb4gfXRUfgEAfgxaAUgSJrhbAFeknjFim48CxG+88tCtoNhdIjWD/9lRYhmPntt4K94
	wDbmDgKQc4mDEKXoBqCO/1IZrWf0OqUP4oxfZXZtjRIJnMHYC/yFcFCQ02UHYFcUMtgyEWgA=
X-Gm-Gg: ATEYQzxJCP9OW4gQvy1cd1Q2GNFHen06ePQT92zB3oLRgcmuNfIb8NdTvpaG0nW/MiR
	SiHn5pVXYl+LQwjL5qgKueRKe9SLaXkvFsm13+eI4WsF8iDU3XAYWfxjZnik9kyszumonBi2fUU
	3dRbcMKNXiqm6mSTV4nmLZzvszla3XW/R6T0C1SMqMkaMRHUbxJW8a4j+hvHvJt9rKKqY8Ug0Ig
	pIMJo4IjOc4nzE3gI/yo8kEMTNBfPDByMBdSMyomrHW+jMU/kYlwj+FqnsZTUkUVPzqnk/csXkF
	ZSUzQQedOf04KGsqmwcqOT5aWcQIvg1nTPHFPYP6KVPukOVo8BA2dosQBMw8rIGCwqrODn4Nzs7
	sEPjrAoqWXsiuG+4hWOE8sOit9RP9ER8gKZhzeUgUgiPEmpwZAoWpL/W3+LsbtmXYTzuETpffpO
	KJKmM=
X-Received: by 2002:a05:620a:4156:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cd5afb0224mr487945485a.7.1772701897100;
        Thu, 05 Mar 2026 01:11:37 -0800 (PST)
X-Received: by 2002:a05:620a:4156:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cd5afb0224mr487942685a.7.1772701896576;
        Thu, 05 Mar 2026 01:11:36 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-660bf4d8249sm2589351a12.17.2026.03.05.01.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 01:11:35 -0800 (PST)
Message-ID: <ebee2fcf-9069-4a9f-ae72-86f4471cd4f3@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 10:11:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305085148.7cwo3yflp7vcfldf@skbuf>
X-Authority-Analysis: v=2.4 cv=e6wLiKp/ c=1 sm=1 tr=0 ts=69a948ca cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=UIR2zDuwlqQ-mzEo0xkA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: WmVU5sQkqe8spSfbKCmA2vMJwtZVoizJ
X-Proofpoint-GUID: WmVU5sQkqe8spSfbKCmA2vMJwtZVoizJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3MyBTYWx0ZWRfXz43/o/kPUs2P
 rA7ciNK4H0HOZ6BWZBrNpeZ4DHc7oLEJIu4tQHHckrb7rfUleHuG3oEa2EZjRU0BrMyrbB5oJjn
 95yg5EoEmQcevcMbk4A5d94dB//285HJfHSRNn9QgHw+wMZJ6bCDpQfMj3ONYVnnqKUuTpcxY31
 sT4avY/i0n2zCz9hdPKG+b67lMUr76WXaRTyW19fXAmLJPfCsyzrD2kwjbAyRtQqrW4RVkOUwXw
 ckOr8P/PyRD4ljry6RFc18ghnZwVjkqrYb2j+LtP99yroKK3LMkMkycf51K4fLgsSo68yLuaHH6
 NeOvkMzGt84OKwxfIzDCDEvT1aij7lMSUztmm7BHKxw0wtoIphL1korrUxC/012pisTLVacgZA2
 n7a/IphptKL3LpEOawkdXF1jf7wQ5OXegJ8rCcFMu4UqX5GflFa3yA4CfUBVmiSnC+BJbBXgqxe
 E5tPXk/hTp1vnDi0WYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_091140_977067_7AD479A8 
X-CRM114-Status: GOOD (  13.00  )
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

On 3/5/26 9:51 AM, Vladimir Oltean wrote:
> Hello Konrad,
> 
> On Thu, Mar 05, 2026 at 09:39:35AM +0100, Konrad Dybcio wrote:
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 55af015174a5..bdfa47d9c774 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -10713,6 +10713,7 @@ F:    Documentation/devicetree/bindings/phy/
>>>  F:   drivers/phy/
>>>  F:   include/dt-bindings/phy/
>>>  F:   include/linux/phy/
>>> +K:   \b(devm_)?(of_)?phy_(create|destroy|init|exit|reset|power_(on|off)|configure|validate|calibrate|(get|set)_(mode|media|speed|bus_width|drvdata)|get_max_link_rate|pm_runtime_(get|put)|notify_(connect|disconnect|state)|get|put|optional_get|provider_(un)?register|simple_xlate|(create|remove)_lookup)\b|(struct\s+)?phy(_ops|_attrs|_lookup|_provider)?\b|linux/phy/phy\.h|phy-props\.h|phy-provider\.h
>>
>> Would looking for the devm/of_phy_ prefix followed by an open parentheses
>> not suffice for the 'has function call' case, instead of listing all
>> currently present exported functions?
> 
> This would maybe work when you run ./scripts/get_maintainer.pl on a file.
> But I would like it to have good coverage on individual patches too. And
> since the devm/of_phy prefix only matches when you "get" the PHY, not
> "use" it, my fear is we would still be missing out on the most important
> part of the patches.

But that's just '(devm_)?(of_)?phy_[a-z]+\(|includes.h'?

Konrad

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
