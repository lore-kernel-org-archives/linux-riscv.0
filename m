Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639F1EDA697
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 09:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PypULA09M6JEcijN31Zw4hMrrKwEtkyMF+Cc1WMCB18=; b=wSNV1GvlTP6L1l
	2InboxY+kat0zLouiDvyg3c7o8YeSJ1QqbcaH8k+i1wlGprXR1pnbvp2ElQHFYjmSzgORKM6bJDh0
	8rbWaUR3ZrBGR+VL9NRVLIeUFnj9tGV2faZi239KiX+6i8tLypCZ2+04p2W01d8OXS39txVB5oPU1
	Mda922eriY5VS5KarXTbKuiOuVhK21+B7IzZgwFtgFydxGYxHT9ca82A63/jcL9LEAdAIKJdDyPts
	idVXr8r1jbPnyJZD6Nu2URdjupQJ3Ovii7JlFJhPRzBn58KvR/jV3qLZnyaz4M9REallEXeoSPEkH
	TYJ/bmcz/XIQLvzatLTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4nf-00000001LFN-3Saq;
	Thu, 05 Mar 2026 09:15:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4ne-00000001LDm-378X
	for linux-riscv@bombadil.infradead.org;
	Thu, 05 Mar 2026 09:15:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lB2MyXzqwL2fKx+Ie3b2ww9IDsTWQhJEMy9qeDpkHuo=; b=pazwcVF14Pn5lA/8zRYsBAMzjW
	ER4RZ/EIy2IjeCLQdsf5HidRNqb9P5B693LpXaLsKRFObw99par0zhtG89/+EIXQN7VMaBWcdH4ZQ
	J9N0qFLRJirm+gpm9TJrVvXPUm/GybQJWsbYpUOjxnBgYIYhHabXrVzKNWFpCPBl8gdIhvS+plS1K
	LMjZmLQDy8F8xVsOmCNi1ckM+sVZ5QUpVlQcIjk84L+kHKGWZGeuadBUF1VbenoA+bjSKOJq+jbmr
	Hs/AE3r0as4f5T7UayS5j+Nj/AdAhTZCV5WP9n1m2sUSLP1IqNekQnO6rQj7CKNfZzq0wyXJiKuNX
	S9ABX+ag==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4nb-00000006If8-2YNN
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 09:15:17 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6259AwAI3604168
	for <linux-riscv@lists.infradead.org>; Thu, 5 Mar 2026 09:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lB2MyXzqwL2fKx+Ie3b2ww9IDsTWQhJEMy9qeDpkHuo=; b=fQRkPmX+D74BHrMb
	asyUwF1awRSU41+Alv6Wnw7Gs81vmURRSipvQe26gecP5AjxUQs2FjH2evlpCBle
	EvlJTGeq7/hZa7TgbL/eiwIfLm9VDQ84HkWp0PDa9k8zC3mFxWdX2oUrXIvDSeUO
	MJlRb3hfiqoNxb4lqLQBC5yk39pNljrdNKN9SvZotseq/6rNLYILsr5slIzaGT2r
	CXRqeu0rHZQRIblzagGnKAQ//HjjGknA7AXeqY14HW8GLv/JQd3X9Okrf7xmxJF5
	2NdQ/R4sUdq3+kMqXrOnJ6N/9Kl6X1z8XshPF4tixarfRUFzzIjQtTlkBNy1zXbb
	lHd6eg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wakxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 09:15:13 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a086578c5so18447166d6.3
        for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 01:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772702112; x=1773306912; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lB2MyXzqwL2fKx+Ie3b2ww9IDsTWQhJEMy9qeDpkHuo=;
        b=K92E+J72d4YdgT8zwHgN04tiBU4GImQn5Mt65/nXbxPrEcy+zs4BlQ/QZyUyv0s2At
         pwNZxUi8TrLT1j4dkyLPqS7c1cn1yeiSrlyy5w8Xr9uTGJ2OXJdTVLEjuLqumeLwmJSQ
         TFoCHo+vQBL79HAXeTfs7e+jMV4MSHvZAQ3OLmRp2drI88xiz0R6Xz2BMPqrAxOyaDc1
         WTyYLdDahDPt+IAatRJ2Q2pgcgPMrAauFkqxNV/63Ge3ZytQHi69RzBUWBsMrJqDSs80
         b4jaRHH2WOSFHeTJ8p1o1R5ivLMgNKfX9Rc+5SEr53wfopHQ95fkD48jsbPiJibk1aaH
         h19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772702112; x=1773306912;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lB2MyXzqwL2fKx+Ie3b2ww9IDsTWQhJEMy9qeDpkHuo=;
        b=XtADpuKaHSDgCob51JkrNa5fxEU2FFS8QY89K2WFne0n0khJo03UQ8z22iWlzgO89v
         7nIZqBqECRB1ZD1S8DMx1Krj1oIQBNbCQjw0tNymQeFCmtKG9zNKS1PTogplZ/W5Ytps
         gZySbSQHTwmCS8SsCkC2NexMOnH0WO9UqLqFcMHrwVxpQ0kjgkvrP9l0t4U3B8zr9IyY
         8m4jVftLC4LKJPbg6Jl9Piip94VVCUokghByGMXd9dQwW6OeT9yAJjNZHFg+pNc5ZJ2k
         aahcclmRl2UTvbkbkB/nvwaJMJTDAlOzTI6TtQxWiWNVwuxVip4YGGIvB4tp4mmGCa3w
         U3uQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMjH1+4Ygzs1ZJ51DJjqQeOJjgCccb1rSSzNBHbHZK3hcCL4w9WkoM1FPgcI1kn1PxCHORu2gSNLquaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaKeas+2Y5upfZSyWyFju5F2vNUJ1hBMEqokb7+F+agizm0sZN
	uECHf7P/09lQudRl49gtd/fyxBNVWIeolMWm3m5qRVDu9mNs62T7WJRf7pznlhKAaWurrIGlXzR
	rzq2LNhEZvMd34WvwAYq4r0icmTvojUUIh9C/NpSKEvFkeFhW3c8/lcpU65vo3FdDBcLD5UY=
X-Gm-Gg: ATEYQzw4guhP/dRg8B4ogh/SKnf4KOJ4+GGsoTRMQ7xfjQsvLYn2SGiX5n4fHNkJlo2
	vakhgj73R9vMI+78cRyI7zGPO3pZssjh3PSbQDh/ESMW5NsFmseOwOy8jmScqawbRZS8kcTY9yz
	NnBTEHuFdbkkJ+FFKvIKXrFzAu4KYmediUY1Zg04pRPI7n6q1tWUvoa86a96DIPGa+irOkmfHLD
	8pJP32MTL62r05mkwkgyGcXlFSD7A9ODkqCzBUaHgcjIqw0EVWOMBoAtBCdptwY8R1Wose70UOO
	K53G2pjKQGJBFLf+ZMkDFNtqO95EaKhsb+F+kItmjmr1Hxfzggko2fJrQau/P4cSxIMXg574UT+
	iwg/FWA7ebV1lpdwp1UVXBNmS9iUd4KphYRP02f/ur3nnnn4NQDQzCuHH00AVxejpkzfCKGO4HN
	E5qrA=
X-Received: by 2002:a05:6214:4842:b0:89a:1720:4c5f with SMTP id 6a1803df08f44-89a19aefda8mr48644606d6.3.1772702112234;
        Thu, 05 Mar 2026 01:15:12 -0800 (PST)
X-Received: by 2002:a05:6214:4842:b0:89a:1720:4c5f with SMTP id 6a1803df08f44-89a19aefda8mr48644286d6.3.1772702111839;
        Thu, 05 Mar 2026 01:15:11 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae666eesm878784966b.35.2026.03.05.01.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 01:15:10 -0800 (PST)
Message-ID: <19c70059-ee24-4b16-8df2-d5c9274ac6c4@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 10:15:07 +0100
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
 <ebee2fcf-9069-4a9f-ae72-86f4471cd4f3@oss.qualcomm.com>
 <20260305091336.ls3k24ieehntxf4f@skbuf>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305091336.ls3k24ieehntxf4f@skbuf>
X-Proofpoint-GUID: luEYZ6cFoIxrLO_rfPurjUELIgBJNqra
X-Authority-Analysis: v=2.4 cv=BNK+bVQG c=1 sm=1 tr=0 ts=69a949a1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=6df94im0sWgtjZpQi0gA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3MyBTYWx0ZWRfX+xLzRPgxL7Ze
 0Cu2EnB+tYbwCKoScI/ft6ypV4Zj+b5tpPzwPriKNPeJXXxxTp6zfjmx60ZDrR0W33Bpm5nZ+TH
 Mugej00obCRkn9zDc78kvAikTWrFnRroKNvZ5jKhSLec4Aa/vpbMSKsOnXKCbdCJ70tVrsXBjxc
 ikrR7kzZAmuUsoXB3TVWypScrM5vd1i4pdiSqui71zTxAshxYwY5uNQVjfImcj4ArwXQQvJoaIg
 m/GuXc0x5tHmFh7FnhdjGKG7f96fRb+G5/u/SOJCz/xOEG/HOEYHeB31zo5k0NE2bmS8oWfPzmK
 BegyGOFOhwqpcdwh4gEbIGk4mWMNlJL3MO9EO1NZgh+BdPrFeD3O+8Od7GsHhKxlD+IBI0FnKqR
 OtqhIAd8iKw8qWQjSzUt5atpjNrOn/cHZ3wgi9a5vwRScEyUFhPg3Ht6UifOnrVCVFR41o2Olvw
 qu5rymH33sRz7dFOrAQ==
X-Proofpoint-ORIG-GUID: luEYZ6cFoIxrLO_rfPurjUELIgBJNqra
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_091516_196965_B271B493 
X-CRM114-Status: GOOD (  12.24  )
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

On 3/5/26 10:13 AM, Vladimir Oltean wrote:
> On Thu, Mar 05, 2026 at 10:11:32AM +0100, Konrad Dybcio wrote:
>> On 3/5/26 9:51 AM, Vladimir Oltean wrote:
>>> Hello Konrad,
>>>
>>> On Thu, Mar 05, 2026 at 09:39:35AM +0100, Konrad Dybcio wrote:
>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>> index 55af015174a5..bdfa47d9c774 100644
>>>>> --- a/MAINTAINERS
>>>>> +++ b/MAINTAINERS
>>>>> @@ -10713,6 +10713,7 @@ F:    Documentation/devicetree/bindings/phy/
>>>>>  F:   drivers/phy/
>>>>>  F:   include/dt-bindings/phy/
>>>>>  F:   include/linux/phy/
>>>>> +K:   \b(devm_)?(of_)?phy_(create|destroy|init|exit|reset|power_(on|off)|configure|validate|calibrate|(get|set)_(mode|media|speed|bus_width|drvdata)|get_max_link_rate|pm_runtime_(get|put)|notify_(connect|disconnect|state)|get|put|optional_get|provider_(un)?register|simple_xlate|(create|remove)_lookup)\b|(struct\s+)?phy(_ops|_attrs|_lookup|_provider)?\b|linux/phy/phy\.h|phy-props\.h|phy-provider\.h
>>>>
>>>> Would looking for the devm/of_phy_ prefix followed by an open parentheses
>>>> not suffice for the 'has function call' case, instead of listing all
>>>> currently present exported functions?
>>>
>>> This would maybe work when you run ./scripts/get_maintainer.pl on a file.
>>> But I would like it to have good coverage on individual patches too. And
>>> since the devm/of_phy prefix only matches when you "get" the PHY, not
>>> "use" it, my fear is we would still be missing out on the most important
>>> part of the patches.
>>
>> But that's just '(devm_)?(of_)?phy_[a-z]+\(|includes.h'?
> 
> Yeah, but what about the networking PHY API, phy_start(), phy_connect(),
> phy_inband_caps() etc?

OK I wasn't aware of that poor namespacing..

Konrad

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
