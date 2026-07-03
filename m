Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669A6C43602
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 10:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N8ROFPG5BSjxYeknv8+qOtrQfBqUpUhQ3aY9p7/hWEo=; b=jzRe0++GISlOZE
	Q3BkS+PfvcmxCVyQWfX5KzrFFboYc8/9utT0iudSMKK2mCiUmJh7AzmdKk+ysa6hdIVTnsFOnzRkI
	R5rkZTH/F92f4vF4eiqD/LSOeBa1WbxTupnWY2b3KE529sQtKLLs3uYqi1eUhlrn1Wf1v8+PoepZu
	GwSEGR03fBFpYJBfzL85+nWWi30E7xJQMeQ1pSUR+W4PU7O+Tl7q2Ma0dpGZS3PqRpJhLZoPfYamw
	zGmDih+tPRIkaKMY5YK+bdvQXILR4rwPQ7oDqUlpp8tg7hbXx131vSNz4SNNzMpAceUE3KQsDqQgS
	F93hKtcUik/KFmZQ8nZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfati-00000006ZFS-0WU6;
	Fri, 03 Jul 2026 10:13:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfate-00000006ZDh-3snR
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 10:13:24 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rfb12994867
	for <linux-riscv@lists.infradead.org>; Fri, 3 Jul 2026 10:13:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6csOGuNQZW/8zcTpE9Z1FJS10bTlappWn1DYBCQO9LM=; b=dqgTkWJ6AwlZAOOG
	TZJpLI93qT8q5TY9jfKapyiPNDC9hTYfBrkRhQfXHKwLBwG2xzEy/g1PYCJBcaUU
	CTJYs9XdM10N1GTv0P4KQnQNQoOdn5DVhLhrTSUVE03KWI9HQEgv4/Jv6jOVsiyY
	4c1b2PrtQ9oMKYL/tAlxRh6TcM94/lIi+GmwRMAsIiH5dwgA/CK3fkX5PbnZTw0b
	OBpxzzyj5fCK8w7NNtHeRjrO/9tTtK1oC9IZdWvprYULOQOdVLu0aXf5uHpMdJuv
	9iTAKxyFVHLl0aDagEWjv/nIz/7L+TqQPjLRV8ArqCu6K537da52zC9trXoYOpYy
	To389A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n1ubt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 03 Jul 2026 10:13:21 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f21e4e8b66so1109716d6.3
        for <linux-riscv@lists.infradead.org>; Fri, 03 Jul 2026 03:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783073601; x=1783678401; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6csOGuNQZW/8zcTpE9Z1FJS10bTlappWn1DYBCQO9LM=;
        b=QLpuevymarT06CwPwr5arE0CfsLk9QgzC2glZKViXTrw5FdWsk8fnbnfUN9vCfvR6p
         ORYMsI8SzaSmT52IvuFlwdb6nNmgjpSMhJF67kCvlhN2nifrgZHW5EyBDmhqdx07VyAu
         p+EsknJyagSxGflcB8vrORZIfJIpt7Y/TKygnlWBWgUbbC4jQ+cYke4C7CuLP5nBBQ7h
         2KlEUZZluAQcnWOawoPf/iEcKKMhLU22j8IibQkIoDayBuWMpF9NrzU18zErMDnpMBbb
         JNBPwh//wOBZsJkX/5qxr0QKpsGm94t6ezA7TqxiMKY9qVHmlyOl/gN9Ov9reT4mdK0+
         kcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783073601; x=1783678401;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6csOGuNQZW/8zcTpE9Z1FJS10bTlappWn1DYBCQO9LM=;
        b=mDSj9XaYgfFnB9XpQ4alrrqX443oT7Ki8zYU9PtqFNzBaPC8xh8nEguCDULvEJxKMA
         iB929udz1QisWscUjgzsipRQEdDYUdZ9GdGjZ5y3m1OTMl+nuTMhAgNHln7Ce0gNAo5R
         wNmBmd84cev1luglMXHdtwOxQBPJI+LyvpiLbRnw2ajcgyflVkYbbOxfIkKkZB0HnyKs
         iu7tNfI9HQVceSfi6kbH9RzI7WzJVc2/U9G3OdrfjOJmuYCocgoUhN73Yz8R8jgPLa9d
         kl9IqjDLtX5S8lOcAV9ML0VayOn14yXsAqaWVrstEDe/6WJkviBOcINNmvA7Gw9AXifr
         Zk9A==
X-Forwarded-Encrypted: i=1; AHgh+RrMHmjxLjLaF8JIzRKcetQd8DxMP6RjL2ZVwn+UeLtZdXBnHpY1SrfWjc9ItnBGNBZ2O8eT/YOGgtBB9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyaIuMm7D6onvpCCRL2ep608nRjQuttOeuj5SWFo4+aXjHhrBUI
	EB/Gb81pN0ivwiO58A71qYUDHFVLYH3x5P6WDD1Qz50laFgtVSlG8ohHtB1NxGvbIyFm1VtWm+B
	9TEVJK8OlsFmECf+6cu1n/KsT/PaotoAi4Jm/ca7bFWyy8HsJhIKcOwwJDZHqmq9VpvFEmMw=
X-Gm-Gg: AfdE7ck+fbGzEAhrPdq7v2fIX5TT81hwx907EghQYFjgYGeUykR9XOmgY0+A28EFcSo
	klhrjPJaOIXpUrftmfhtzDkOHh/dCtdzj2njtgaaoWilV4xEvtILSsZB1QIfpaK3P0R7KzrslI3
	6lgCdctiLrGkUosTRH2ncL5/wGG2hENgHg3BuLNvZ/LO5h/3srawVuKb5z6TAzWy0kixswpboZh
	9PtWHctBg98Mctw3glEKJcDA0+jOtDD1fSHPxGG/48X6Jd1pPj5QGVrXgTtlCtpvPYXb8NMHhrf
	x9eCXCiBBhA8/TKjraESGQqc+46PnohdCEbhvjI1mOZDBcfiA8WdSdURBjtVLf6vS35ULpLB0FV
	auIuADRlNDk60EN0ZgIVHnIxKltUyEoDwQf0=
X-Received: by 2002:a05:6214:cc8:b0:8ed:a980:6b27 with SMTP id 6a1803df08f44-8f3c854777cmr86121406d6.8.1783073601133;
        Fri, 03 Jul 2026 03:13:21 -0700 (PDT)
X-Received: by 2002:a05:6214:cc8:b0:8ed:a980:6b27 with SMTP id 6a1803df08f44-8f3c854777cmr86120726d6.8.1783073600643;
        Fri, 03 Jul 2026 03:13:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ad119406sm2158642a12.21.2026.07.03.03.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 03:13:19 -0700 (PDT)
Message-ID: <827c4b64-1881-4630-bb08-f9e2d97cd32e@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 12:13:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Radu Rendec <rrendec@redhat.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
 <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
 <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
 <akOZFIowVvprnAMf@vaman>
 <CAMRc=MfBcOhbj=ETxy2Xz9o_nyzykrEhKAc3jYi6V5_jMZEE3Q@mail.gmail.com>
 <CAMuHMdXNG=C=XcioQUEN1M7cQgKhO0AxUyg5X+TWb2rQ3-H3fw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMuHMdXNG=C=XcioQUEN1M7cQgKhO0AxUyg5X+TWb2rQ3-H3fw@mail.gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5OCBTYWx0ZWRfXzYa+oiYktuBc
 tl4YVG1BlvlavfbiNaPVtZ1TpKMUH3Oi9XH+3dcCavc68OnVlczo+ss+rho+1NAAE9HoeF+wpoY
 EEZDhct1p9Om8j4aJwvbxuwHs5B0MI4=
X-Proofpoint-ORIG-GUID: EMsvIEqOyoTtyYsOibrxe7A0DrLBbpPa
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a478b41 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=lwt6xitBv4dyHUtHhEkA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: EMsvIEqOyoTtyYsOibrxe7A0DrLBbpPa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5OCBTYWx0ZWRfX/8CEIwtSde2e
 Ani1TDBhKZjt9NfdDR9ajNgKx7Fp6KmJt3Sg0Neh4wVStmC68OtiE6zXqwBfEh4BJ41qIv2wEeX
 xbTuoD/Ey8xHFR4hK4mzKssPzV90AtZGWjCXrl3jAFnbxEds3MJdk5DV3MGMTtrgn3PDQZhsCdm
 /ZccPctu8wxgGtqIMkLeDWXpHogQ51lFBIKDjtOrR42HtNyp+czKB+/UAX960VdzVJKnKWjkCEd
 9YnBKXaQvpV/JpWS5Is1cmpIgCdKYc65S/VXaDkrMaQkgNm3R6LNaiGA5c39TSSwrTxAk/1YG/8
 2T0BD0LlrdwtkRNppCAcwh95SN6YhdjUo02wOlyBOFlf7knYlX2T8FeNK/N628vyc5TwvXPX5Gy
 fOrHjNmhHV8jElJAWRdQcKnM+RIo6rE4ZYgp5L2Tr5j2EmN9/YpzQQx/PKshZAzyKLeJnnc4DRU
 atgMFEnlHrHMFoue1UQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1011 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_031323_076378_943EF6EB 
X-CRM114-Status: GOOD (  17.78  )
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

On 7/2/26 11:16 AM, Geert Uytterhoeven wrote:
> Hi Bartosz,
> 
> On Thu, 2 Jul 2026 at 11:12, Bartosz Golaszewski <brgl@kernel.org> wrote:
>> On Tue, 30 Jun 2026 12:23:16 +0200, Vinod Koul <vkoul@kernel.org> said:
>>> On 29-06-26, 16:51, Geert Uytterhoeven wrote:
>>>>> Russell King asked me to put the PHY logic for SCMI pm domains into the PHY
>>>>> driver instead of the MAC driver where it was previously. Instead of cramming
>>>>> both HLOS and firmware handling into the same driver, I figured it makes more
>>>>> sense to have a dedicated, cleaner driver as the two share very little code (if
>>>>> any).
>>>>
>>>> I think you are mixing up DT bindings and driver implementation?
>>>
>>> Should the bindings change if we have different driver and firmware
>>> implementations? Isn't binding supposed to be agnostic of
>>> implementations..?
>>
>> I've thought about it some more and I believe this question is philosophical in
>> nature.
>>
>> sa8775p and sa8255p are *the same* hardware. I can flash different firmware on
>> the same Lemans Ride board and it becomes one or the other. Yet they are not
>> described by the same DTS and the bindings differ as well. I don't see why we
>> wouldn't allow the same approach for the this PHY.
>>
>> We treat it as different HW variant when it's managed by firmware - just like
>> we do with the rest of the SoC.
> 
> DT describes hardware, not software policy.

DT describes hardware, to the extent that it's accessible by the OS

In this case, lemans-bare-metal and lemans-auto are essentially 2
separate platforms because the way we can interface with the hardware
is so vastly different

Konrad

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
