Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0EFC54E49
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 10:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ebS8JzkoXizx3+dlqoFlWuX/EqNNTnEfvP7MBMkZeeY=; b=e05ockdmM6H6/0
	gxgKbRM9Amm8f6xIeP8Hf3hwciYfebzX8jfj97tKy//lK8P11pkbeNfcuY4zjdmyKzXr9RZ5ydzwO
	3q8NfpAQIraaSkxuoYJsBQ5eCqL1uEJUvZWeNy8F72lHzDqA42fOK1ldOv0s8rhG0OVl37mg/BX+r
	IedSEcIOPlGKSIIjMmbZZpEUCltPj3OAAuTJ8W+/+tzUsZ3Vh7RLsJ6k/3V2ApmPpRFSpTzpH9YXa
	SvzVdCoj90LcdljfWibuGElKtkjc4TN4SvKlc/fRJe0j1H8KS9IC3zXFi+EcudPslVYMylPlpKCrA
	WM2fOJDfIEeOGUKzOWBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdTEX-000000092Y0-0Yh5;
	Fri, 23 Feb 2024 10:56:49 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdTEO-000000092Po-3leR
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 10:56:47 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20240223105635euoutp0240ba7a93315105a8aa3fe9ea5e5e6848~2eK2T3c7o0770507705euoutp02S
	for <linux-riscv@lists.infradead.org>; Fri, 23 Feb 2024 10:56:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20240223105635euoutp0240ba7a93315105a8aa3fe9ea5e5e6848~2eK2T3c7o0770507705euoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1708685795;
	bh=e/E24afCa/A/bTv0FUCy2gEINIvOguyVi4saBrHg1no=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=aglc47184CnJvjyCekauqZpB0LXg7kySasr7XA9HPreNWW8OrX/QTsgE69UfmSoey
	 AZquGo1+ArQ0qfYFOrKK7OHRecpkYLlHlEQEefIinfDzqYTIeg1mvCyRrNyhpUARNO
	 AV7yxGaDbbxC3zTVcVrOr29GDZLTYGB4xOWTymFE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20240223105635eucas1p291b6b5c3a622a07e438cf6ea19eeae59~2eK1_cl0s1016610166eucas1p2A;
	Fri, 23 Feb 2024 10:56:35 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 39.C3.09814.2E978D56; Fri, 23
	Feb 2024 10:56:35 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20240223105634eucas1p297a1036cce35099035a1a2921ff09af1~2eK1gpKTH2099020990eucas1p2i;
	Fri, 23 Feb 2024 10:56:34 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240223105634eusmtrp1d8e11f7f87825478fda985fcc8ee988d~2eK1edPSu2334423344eusmtrp17;
	Fri, 23 Feb 2024 10:56:34 +0000 (GMT)
X-AuditID: cbfec7f4-711ff70000002656-15-65d879e29e87
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id DF.2B.09146.2E978D56; Fri, 23
	Feb 2024 10:56:34 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240223105633eusmtip15ed6546f383d516052775f55783e5248~2eK0O5Etl2847128471eusmtip1z;
	Fri, 23 Feb 2024 10:56:33 +0000 (GMT)
Message-ID: <870534fc-eaa6-4da6-9180-a051443fbaa6@samsung.com>
Date: Fri, 23 Feb 2024 11:56:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 02/25] genirq/irqdomain: Remove the param count
 restriction from select()
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>, Anup Patel
	<apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
	Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <TYCPR01MB112692BF27640D12CEF5987BE86552@TYCPR01MB11269.jpnprd01.prod.outlook.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf0xTVxj1vvf6+mMWny3aG8YgqalDE2Cdk93NAZIY9pYtcSRLNjeNNvIG
	HVBIK2O6P2xG1bZxjCgN8KxCJpmurltaLD9HttUORmC1QFah4tDRAe1anBZxjqCjfWzjv3PO
	d07Od79cAS45QaYI1JojjFajKpeTIqKj/5E3c/roOPPczAyGAmeeRYY/53mIHR0AyOgtRBe6
	FjHkumsj0Fd9Xgy1eLw81Bx5QqK6uTs4ck77eWisx0qijpiBRN3WQR4KjZ3G0Ul2AzrR5+Ej
	s3uZRI22ORy1Oy347mTab3QQ9Jdz5/i0ZWmYoCOhEEF3s7f4dKuzmnbaTCQ96f+WpOe9Xj7d
	3nacHq29waeXH7kIOuZMe1P8ruiVYqZc/SGjzc47JCp9MGIgq6LURxdj3YQePBSbgVAAqReg
	af48ZgYigYS6DKBnamiVLAA43hfmcSQGYL8lbuMi9+0eghtcAvCajcU5cg/ApuHahEtM5cHf
	Wly8OCYoBWw+f53H6RvhYHOQiONNVDqcCjTx41hKHYb2WUcC45QMBoItiT2SqQUMmqzhRANO
	OQjY39CHx10kpYTmqJmMYyF1EJr+MJFcOh12Rq2JAKQWhfDU7QnALb4HLl/7ZBVLYXjgKp/D
	qXDo7GmCC5wCsHVpCuNIPYD62cBqYhec9P69UiFYqdgGv+nJ5uQC2Hv5Cj8uQyoJjkc3cksk
	wTMdjTgni6HxpIRzb4XswNf/1f7gG8XrgZxdcxh2zQHYNc9h/+9tBYQNyJhqXUUJo3tew9Rk
	6VQVumpNSdbhygonWPmpQ48HFrrApfC9LDfABMANoACXJ4tHy8YZibhYdfQYo608qK0uZ3Ru
	8LSAkMvEiuJ0RkKVqI4wZQxTxWj/nWICYYoesyh/Mkoufrrbifs2sQYXecWoaBwpiDQI32ob
	ln2mXp963zehudFe9F3Xe67G2VuxBwdaFGMv5xveWcK+Z0o3r6uptcSwvSm2t6N3m2reX8oh
	mGz1pOWhbeeLi1syuuzHQ+ab9etUYjKj8ufOHPVLVXu2k6835cvg7aLCDxxWvSa68MzgemWK
	w/7xzpId8oyR1ENfKOs2eEVtVxt8miTPa7+kdfovbA7WBfRlmb/mFr7xl/us+c7nT67XbZsn
	zZM/9ubmBfOrsmMdHmnvjnCeu6hS2kNVpD21HJG6hTmK37funZk+JsmN7cv0J71avmUiWLAv
	QPqmI/vnkp3MzVJ7SE7oSlXK7bhWp/oHXvpkJhgEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOKsWRmVeSWpSXmKPExsVy+t/xu7qPKm+kGjSvUrK4NUndouXDO1aL
	WZeOM1p0nHOzmLfjG5PF1verWCzW7D3HZDH/yDlWi5lv/rNZ9L14yGyx6fE1VovLu+awWWz7
	3MJmsXPOSVaLl5d7mC3aZvFbtO49wm7Rdegvm8X0VS+YLTZvmsrsIOJxrWMji8fKF7PZPab+
	PsPi8eblSxaPnbPusnss2FTqsWlVJ5vHnWt72DzenTvH7rF5Sb3Hpebr7B5/f25l8fi8SS6A
	N0rPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEv4+vF
	FraCtwIViz/vZGlg/M7bxcjJISFgIvFp7RGWLkYuDiGBpYwSS071sEAkZCROTmtghbCFJf5c
	62KDKHrPKNG0ZjZYglfATuLR/K1gNouAqsTMueeh4oISJ2c+ARskKiAvcf/WDHYQW1ggWWLt
	841gNrOAuMStJ/OZQIaKCHxhkpjy7AkjiMMssJlF4v35RawQ684zSazeO4MZpIVNwFCi6y3I
	HZwcnALxEp2vO9kgRplJdG3tYoSw5SW2v53DPIFRaBaSS2Yh2TgLScssJC0LGFlWMYqklhbn
	pucWG+oVJ+YWl+al6yXn525iBKaQbcd+bt7BOO/VR71DjEwcjIcYJTiYlUR4L2XfSBXiTUms
	rEotyo8vKs1JLT7EaAoMjonMUqLJ+cAkllcSb2hmYGpoYmZpYGppZqwkzutZ0JEoJJCeWJKa
	nZpakFoE08fEwSnVwGSlMPnJARd1y+yqhpxryceOt1d4nflyIMdIPee9qkPPhJBj8Z/bsysy
	W3/Obj064QDDJuecnudG3KblAs6rHvcd9FeTz9/cX8/no6q1LNGhfvIvt081RjKrvE9NnbZw
	xsMYlV9ffPkO2tX/mV7wXslnitzLe6cEp2ukfp6+402Jl8maSa+6HG9+CZ7Z9z0i6/pL+3XM
	XLo1y3WWrXvHtfTrHL59DJ0lS3R6Ns2LeX1fXFQs/lSQW+/KdoH95af5Ii2WTVtR5PDoxAHp
	7NCLc9x36T3b8zDa9fXjsw9S2jedZZtW6/A8VConSP+9zC3HBQdjQgUV17dJPChVPf8xrPRd
	9X2WiH3Ffx62qXbKmyqxFGckGmoxFxUnAgD6KUeIqgMAAA==
X-CMS-MailID: 20240223105634eucas1p297a1036cce35099035a1a2921ff09af1
X-Msg-Generator: CA
X-RootMTR: 20240223102258eucas1p119f38e40f769c883c0a502e9e26be888
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240223102258eucas1p119f38e40f769c883c0a502e9e26be888
References: <20240127161753.114685-1-apatel@ventanamicro.com>
	<20240127161753.114685-3-apatel@ventanamicro.com>
	<CGME20240223102258eucas1p119f38e40f769c883c0a502e9e26be888@eucas1p1.samsung.com>
	<481aa3b9-55c2-4ccb-bb4a-58b924d77ad7@samsung.com>
	<TYCPR01MB112692BF27640D12CEF5987BE86552@TYCPR01MB11269.jpnprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_025641_226845_AD65F73B 
X-CRM114-Status: GOOD (  16.33  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 23.02.2024 11:45, Biju Das wrote:
>> On 27.01.2024 17:17, Anup Patel wrote:
>>> From: Thomas Gleixner <tglx@linutronix.de>
>>>
>>> Now that the GIC-v3 callback can handle invocation with a fwspec
>>> parameter count of 0 lift the restriction in the core code and invoke
>>> select() unconditionally when the domain provides it.
>>>
>>> Preparatory change for per device MSI domains.
>>>
>>> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>>
>> This patch landed recently in linux-next (next-20240221) as commit
>> de1ff306dcf4 ("genirq/irqdomain: Remove the param count restriction from
>> select()"). I've noticed that it breaks booting of Qualcomm's Robotics
>> RB5 ARM64 board (arch/arm64/boot/dts/qcom/qrb5165-rb5.dts). Booting
>> freezes after "clk: Disabling unused clocks", but this is probably a
>> consequence of some earlier failure. Reverting $subject on top of
>> next-20240221 fixes this problem. Let me know how can I help debugging
>> this issue.
>>
>>
>>> ---
>>>    kernel/irq/irqdomain.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c index
>>> 0bdef4fe925b..8fee37918195 100644
>>> --- a/kernel/irq/irqdomain.c
>>> +++ b/kernel/irq/irqdomain.c
>>> @@ -448,7 +448,7 @@ struct irq_domain *irq_find_matching_fwspec(struct
>> irq_fwspec *fwspec,
>>>    	 */
>>>    	mutex_lock(&irq_domain_mutex);
>>>    	list_for_each_entry(h, &irq_domain_list, link) {
>>> -		if (h->ops->select && fwspec->param_count)
>>> +		if (h->ops->select)
>>>    			rc = h->ops->select(h, fwspec, bus_token);
>>>    		else if (h->ops->match)
>>>    			rc = h->ops->match(h, to_of_node(fwnode), bus_token);
> This patch looks reverted on todays's next. But there was a fix for fixing the issue you mentioned [1]
>
> [1] https://lore.kernel.org/all/170844679345.398.17551290253758129895.tip-bot2@tip-bot2/

Thanks! Today's next seems to be broken on ARM64 (doesn't compile here), 
so I've missed it.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
