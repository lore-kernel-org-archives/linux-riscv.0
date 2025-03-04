Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817B5C282D3
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 07:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7of7h/ab/XuEG8LsWsO+McpRoqLwB0KRIyEBR2DJozM=; b=MvV4k3aD+mbLaB
	+61Dx36IchgOiLfy6a4uH4Hqb2vztsZAl6ngmp5QRjf3R8SkpjU1Iy4W1l38u3ycE8BoiUTkWoRPm
	uznNtFsG5lO0N5h0tAxLL/S+2PJ8jsK/gC0UpSbakr3M/SFhwuHuUOmDmKvLksWtwkz/ZczXlFngo
	+18/FUwQ6IM/wseVSTRWXFHPQC6mYW6oZv7SQCMCCY0E0utRBs4VfXxyKmc9ETo3J4NhMOrNA4beH
	UiEF0XjgrLrH5PNlSws7gha6saKIKE2BcPf+96OiOpn34V2+gV1QYCR+rBpL0gDCCkEvyKXXta3i2
	LdlTY6RslEtIlAeQTHdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpN1b-00000003Vja-3PTQ;
	Tue, 04 Mar 2025 07:49:11 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpMsT-00000003T3B-3J7C
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 07:39:47 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250304073942euoutp01464a9338fc020d09e661070ee4e3d7e7~piY-y4_fa1810718107euoutp01z
	for <linux-riscv@lists.infradead.org>; Tue,  4 Mar 2025 07:39:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250304073942euoutp01464a9338fc020d09e661070ee4e3d7e7~piY-y4_fa1810718107euoutp01z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1741073982;
	bh=GzMSkEVNv/dhBMxoGFis/biKw7gJZhHvQ1umQcESUMQ=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=dr5y9w9+82Nl7Hl74dx08/pElMvB532QfxZZLrj00qiy/QJS8BRGGGmR1hfdhh3x9
	 axWUrXWOb8kYqwtbLlt/0x6o3LYjliCnA7tgftsemGbuhLm0T0R+SRlZ+9DpXv+zIZ
	 lCR1E5ek1Oh2Vv9fB7QwymKhk77CgS7ZrqY50B7I=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20250304073941eucas1p1a0cc9b675ced23b32e9c54b705896540~piY-XZA9s2201122011eucas1p1Y;
	Tue,  4 Mar 2025 07:39:41 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 86.99.20397.D3EA6C76; Tue,  4
	Mar 2025 07:39:41 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250304073941eucas1p2e24f6e10f30d12dd1b12e9b8cff5af62~piY_43N8o0881608816eucas1p2z;
	Tue,  4 Mar 2025 07:39:41 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250304073941eusmtrp14add939fc3c09839217ed8b74f91543d~piY_38e312919029190eusmtrp1C;
	Tue,  4 Mar 2025 07:39:41 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-c7-67c6ae3db0b9
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 40.43.19654.D3EA6C76; Tue,  4
	Mar 2025 07:39:41 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250304073940eusmtip1b08d76bfb85500f4eed21209f94ac1f0~piY98_S7P2723627236eusmtip1S;
	Tue,  4 Mar 2025 07:39:40 +0000 (GMT)
Message-ID: <1cd2f07d-14a1-4a25-8a81-b815f405018e@samsung.com>
Date: Tue, 4 Mar 2025 08:39:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] dt-bindings: clock: thead: Add TH1520 VO clock
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	drew@pdp7.com, guoren@kernel.org, wefu@redhat.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	jszhang@kernel.org, p.zabel@pengutronix.de, m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <ac4f8b31-2a9b-4860-a72e-379806ee9f77@kernel.org>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNKsWRmVeSWpSXmKPExsWy7djP87q2646lG0xo0rV4ducrq8XW37PY
	LdbsPcdkMf/IOVaLe5e2MFm82NvIYtF8bD2bxctZ99gszp/fwG7xseceq8XlXXPYLLZ9bmGz
	WHvkLrvFxVOuFnfvnWCxeHm5h9mibRa/xf89O9gt/l3byGLRsn8Ki4OIx/sbreweb16+ZPE4
	3PGF3ePeiWmsHptWdbJ5bF5S79Gy9hiTR/9fA4/3+66yefRtWcXocan5OrvH501yATxRXDYp
	qTmZZalF+nYJXBnN59QL2vgrlj9Ib2BczNPFyMkhIWAisXv6GaYuRi4OIYEVjBJ/p81ngXC+
	MEq8vP6dGcL5zChx8+oF1i5GDrCWrq16EPHljBL97aegit4ySpw5epMNZC6vgJ3Et5PbmEBs
	FgEVianNc5gh4oISJ2c+YQGxRQXkJe7fmsEOYgsLhEucfbEC7A4RgcdMEm8PfwdrYBaokthx
	/wY7hC0ucevJfLChbAJGEg+Wz2cFsTmBlv19OY0RokZeYvvbOWAXSQi84pQ48OgcM8SnLhL7
	2leyQ9jCEq+Ob4GyZSROT+5hgbDzJR5s/QRVXyOxs+c4lG0tcefcLzaQ95kFNCXW79KHCDtK
	7D09iQkSKnwSN94KQpzAJzFp23RmiDCvREebEES1msTUnl64pedWbGOawKg0CylUZiF5chaS
	Z2Yh7F3AyLKKUTy1tDg3PbXYOC+1XK84Mbe4NC9dLzk/dxMjMH2e/nf86w7GFa8+6h1iZOJg
	PMQowcGsJMJ7q/1ouhBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHeRftb04UE0hNLUrNTUwtSi2Cy
	TBycUg1Mm9s0tgpVbpvyyvrCiukFHxK1F9wPSZV/wRgS/i38Mt/D6cY2B7Un3/sZEvjz0COW
	1+8+Sb9cNK3o0c+Vh683K8w0PC+23PdQDMup8hdvp7Jzb9hf/2nLRq1D3adDuw0usxVO/nt1
	duqrJWdnceW0Jat5Hq1hm/5VYuKZ1+8+umTP/f3xWQP3xO8TjkuvCTnXsdUyduJ8kazyh6vz
	fM/JTFp2iIFVLGOO1dza/lJD/V61a05vz8285f11Vv4jLb/1TMWJKkZn4g/3BpyYsiClsDBN
	9wFD3/EcBcHU5xuCv6lpr0lJLhDd5xBv8nfXhP5j1z0qIiumLfruE3hM+ZWO3VGP4Mo5hzc2
	Ga71nXQpd5kSS3FGoqEWc1FxIgDuYVMcDgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplleLIzCtJLcpLzFFi42I5/e/4XV3bdcfSDeZe5bF4ducrq8XW37PY
	LdbsPcdkMf/IOVaLe5e2MFm82NvIYtF8bD2bxctZ99gszp/fwG7xseceq8XlXXPYLLZ9bmGz
	WHvkLrvFxVOuFnfvnWCxeHm5h9mibRa/xf89O9gt/l3byGLRsn8Ki4OIx/sbreweb16+ZPE4
	3PGF3ePeiWmsHptWdbJ5bF5S79Gy9hiTR/9fA4/3+66yefRtWcXocan5OrvH501yATxRejZF
	+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehnN59QL2vgr
	lj9Ib2BczNPFyMEhIWAi0bVVr4uRi0NIYCmjxL8N+1m6GDmB4jIS17pfQtnCEn+udbFBFL1m
	lHi56yQ7SIJXwE7i28ltTCA2i4CKxNTmOcwQcUGJkzOfgDWLCshL3L81A6xeWCBc4uyLFUwg
	g0QEHjNJtBy/wAiSYBaokji/9worxIb1TBJ7p7azQSTEJW49mQ+2gU3ASOLB8vmsIDYn0Oa/
	L6cxgrzALKAusX6eEES5vMT2t3OYJzAKzUJyxywkk2YhdMxC0rGAkWUVo0hqaXFuem6xkV5x
	Ym5xaV66XnJ+7iZGYLrYduznlh2MK1991DvEyMTBeIhRgoNZSYT3VvvRdCHelMTKqtSi/Pii
	0pzU4kOMpsCwmMgsJZqcD0xYeSXxhmYGpoYmZpYGppZmxkrivGxXzqcJCaQnlqRmp6YWpBbB
	9DFxcEo1MHFFS5x5we8tW+R6kq1f0eFsvWIyg7jCfPX1k/hmGrh83r/3Zlpfz9yPohf//dn1
	WCE0pdPd6b/m1ZwJjSzLTz0Vy/ZaXuOnNVlaR+3Wbd66nw8OrjDJjlEP3a/1cHVLeq6svo3T
	p+2tU5+JH/2TmZSYp3CmaO5tsYysib/jX95k+3+6xfnQyq1d3PF/FY9qW///WPjr3cG7UUVL
	pIPyBe1eeJq/WmKoHn5KLvaPoGlFqJuo6aalLg8kz/aX+XE8EUx78/Zu98eO7zznPt/L+Lbm
	8IepWut2dDSKTnHX6Rb6x3/il/K8B6ff6oRMur2mudFrf5xFb1tjMuvsmQeCvG9/1HZ7IfzJ
	52LN74lOAkosxRmJhlrMRcWJANktjvegAwAA
X-CMS-MailID: 20250304073941eucas1p2e24f6e10f30d12dd1b12e9b8cff5af62
X-Msg-Generator: CA
X-RootMTR: 20250303143635eucas1p1dbcd26d4906b962e07cbde7f5ef704bf
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250303143635eucas1p1dbcd26d4906b962e07cbde7f5ef704bf
References: <20250303143629.400583-1-m.wilczynski@samsung.com>
	<CGME20250303143635eucas1p1dbcd26d4906b962e07cbde7f5ef704bf@eucas1p1.samsung.com>
	<20250303143629.400583-2-m.wilczynski@samsung.com>
	<cf6aa8bf-d424-49f4-b6a6-b6b10fd8092f@kernel.org>
	<ac4f8b31-2a9b-4860-a72e-379806ee9f77@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_233946_094531_87902F53 
X-CRM114-Status: GOOD (  15.27  )
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



On 3/3/25 18:46, Krzysztof Kozlowski wrote:
> On 03/03/2025 18:41, Krzysztof Kozlowski wrote:
>> On 03/03/2025 15:36, Michal Wilczynski wrote:
>>> Add device tree bindings for the TH1520 Video Output (VO) subsystem
>>> clock controller. The VO sub-system manages clock gates for multimedia
>>> components including HDMI, MIPI, and GPU.
>>>
>>> Document the VIDEO_PLL requirements for the VO clock controller, which
>>> receives its input from the AP clock controller. The VIDEO_PLL is a
>>> Silicon Creations Sigma-Delta (integer) PLL typically running at 792 MHz
>>> with maximum FOUTVCO of 2376 MHz.
>>>
>>> Add a mandatory reset property for the TH1520 VO clock controller that
>>> handles the GPU clocks. This reset line controls the GPU CLKGEN reset,
>>> which is required for proper GPU clock operation.
>>>
>>> The reset property is only required for the "thead,th1520-clk-vo"
>>> compatible, as it specifically handles the GPU-related clocks.
>>>
>>> This binding complements the existing AP sub-system clock controller
>>> which manages CPU, DPU, GMAC and TEE PLLs.
>>>
>>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>>> ---
>>>  .../bindings/clock/thead,th1520-clk-ap.yaml   | 33 ++++++++++++++++--
>>>  .../dt-bindings/clock/thead,th1520-clk-ap.h   | 34 +++++++++++++++++++
>>>  2 files changed, 64 insertions(+), 3 deletions(-)
>>
>>
>> Where is the changelog? Why is this v1? There was extensive discussion
>> for many versions, so does it mean all of it was ignored?
> 
> 
> Plus this was reviewed so it is even more confusing. Where is the review
> tag? If tag was dropped, you must explain this - see submitting patches,
> which asks for that.

There was a tag, but later in v5 I've added another part to this
dt-binding - reset, which I wasn't sure whether you would approve of, so
I've removed the Reviewed-by.

> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
