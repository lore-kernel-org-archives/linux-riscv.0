Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF299C021B8
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 08:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hCb4iPrz7NE1+85SOkFhwU9qQYDDQPhMi3DWGYaKeRA=; b=XOH6evWapfEKiN
	yFeVaKB21pvJ2unLHTRUkFR+DZBLmNgNWNJTJcNEpocNK2KA3PTJLnti3kERlkc71EJ40iWPx6EYb
	eW0OQYmkHJNKptu2t5gj0Gg5FpFTdzCPh4P8tGuN31jA+iakiHdgnoNER4aSXGjf5c56QagF+MBTL
	H/z/ZpCHdskcjm0wTHOPOnZYTCAymeDNuEpdWgccbi/2PZkEwjcp7oQqZVb4LJcYlwz6iAQ7tUwgE
	ejdC/jVou7u9+cyFCf8IHK+TTnM3z3SXc/sTR+duefNt52C2ypNHWsngaHF9wjJ3eMGaQt2HBWXZa
	/d7oR5ibHn/+gOm4beiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNKG-00000003ZTk-2pVd;
	Tue, 04 Mar 2025 08:08:28 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpN5A-00000003WeA-3Vdw
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 07:52:55 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250304075250euoutp01bb27c6acf418c63cd349a2ab578b6796~pikdfn9p-3171331713euoutp01-
	for <linux-riscv@lists.infradead.org>; Tue,  4 Mar 2025 07:52:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250304075250euoutp01bb27c6acf418c63cd349a2ab578b6796~pikdfn9p-3171331713euoutp01-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1741074770;
	bh=lea+ualRj8bz1DmBFIqvryrAEtTAwUiOAMc/0EqaREQ=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=adrHId7UICeA7/DFlY7GUV1AoEnJjFAoDq05EhUfKMMwLS20bS1fsiFByUDhQQri6
	 LYjDCmonE+4dvus6BOC1a/wq3k8RrYnEDEsvAGwOLJVQliFYXDN1dYgzekgLYkK3D2
	 yW+sKKLwOabTXRG3ZIRVS6pEzELHBObb7jy4E1Og=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250304075249eucas1p233c07fd6fccde4cb2074a8ea69813087~pikdEUWMq0502905029eucas1p2-;
	Tue,  4 Mar 2025 07:52:49 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id 59.A8.20821.151B6C76; Tue,  4
	Mar 2025 07:52:49 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250304075248eucas1p193463e8d646ef3fcda680ca785579934~pikcZBp7w0034500345eucas1p1g;
	Tue,  4 Mar 2025 07:52:48 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250304075248eusmtrp195ba42f7a1a1786cab2e20ffc929430a~pikcX6xRy0401204012eusmtrp1E;
	Tue,  4 Mar 2025 07:52:48 +0000 (GMT)
X-AuditID: cbfec7f2-b09c370000005155-7a-67c6b151ec14
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 33.DC.19920.051B6C76; Tue,  4
	Mar 2025 07:52:48 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250304075247eusmtip19a6fe9a7de8dd05807269c046561fe49~pikbfaLZv2935529355eusmtip1O;
	Tue,  4 Mar 2025 07:52:47 +0000 (GMT)
Message-ID: <08e5ffb9-2187-42b6-8090-9922b349fe2a@samsung.com>
Date: Tue, 4 Mar 2025 08:52:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] dt-bindings: firmware: thead,th1520: Add support
 for firmware node
To: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
	wefu@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, jszhang@kernel.org,
	ulf.hansson@linaro.org, m.szyprowski@samsung.com
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Krzysztof
	Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <377951ad-341f-4e19-a582-a534567dc466@kernel.org>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrIKsWRmVeSWpSXmKPExsWy7djP87qBG4+lG6x/KWfx7M5XVoutv2ex
	W6zZe47JYv6Rc6wW9y5tYbJ4sbeRxaL52Ho2i5ez7rFZnD+/gd1i7+ut7BaXd81hs/jce4TR
	YtvnFjaLtUfuslu8vNzDbNE2i9/i/54d7BbH14ZbtOyfwuIg7PHm5UsWj8MdX9g97p2Yxuqx
	aVUnm8eda3vYPDYvqfdoWXuMyeP9vqtsHn1bVjF6XGq+zu7xeZNcAHcUl01Kak5mWWqRvl0C
	V8aTiWYFM7gqPrzzbmBcytHFyMkhIWAi8arrPUsXIxeHkMAKRonFhy6zQzhfGCVmzj7DDFIl
	JPCZUeL33xyYjhtzXzBDFC1nlJjW8RKq/S2jxJ7ui2xdjBwcvAJ2EvPuqoI0sAioSMx48oAN
	xOYVEJQ4OfMJC4gtKiAvcf/WDHYQW1ggQeL2+SawoSICO5gkrrzZA+YwC2xklFh39DVYB7OA
	uMStJ/OZQGw2ASOJB8vns4LYnEDLLh/9xQZRIy+x/e0csGYJgVecEtObH4JdJCHgInFxswXE
	C8ISr45vYYewZSROT+5hgbDzJR5s/cQMYddI7Ow5DmVbS9w59wtsDLOApsT6XfoQYUeJCa/b
	mCCm80nceCsIcQGfxKRt05khwrwSHW1CENVqElN7euGWnluxjWkCo9IspFCZheTHWUh+mYWw
	dwEjyypG8dTS4tz01GLDvNRyveLE3OLSvHS95PzcTYzAVHn63/FPOxjnvvqod4iRiYPxEKME
	B7OSCO+t9qPpQrwpiZVVqUX58UWlOanFhxilOViUxHkX7W9NFxJITyxJzU5NLUgtgskycXBK
	NTDFGf6VjeLucM/6Vcn0d3GywORVvWonz/dzbvkat0Okb9vxyf165pbO+QEBDcab+c6uefr/
	osFhezmpQ0sny6n6xkhOXPX77hdjac5Sfq65//p14/ss6tKE7p1vmiS24xmrTTzf04qNpkav
	Jm2SSJmceiNy5fad+lt651kLLOaZP+H35++KFXe/7l52XnEyz03h67NehvotLdhbuO65yjzm
	LrNT/7YZBx66KNaxL3+nKtcCvcVRdyInFv3rOfRY3/20W+bd6wLT2gStRK1rt3Vv5DI8qv+y
	qcbg5pVzv7n2aWZlNt/Zo3HZQeLsCxXFhdN73ksK5C3wuCQzUVWoZwsPn8JELU7zai5mx72y
	stVKLMUZiYZazEXFiQAm+R8GBAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmplleLIzCtJLcpLzFFi42I5/e/4Xd2AjcfSDT7MNLR4ducrq8XW37PY
	LdbsPcdkMf/IOVaLe5e2MFm82NvIYtF8bD2bxctZ99gszp/fwG6x9/VWdovLu+awWXzuPcJo
	se1zC5vF2iN32S1eXu5htmibxW/xf88Odovja8MtWvZPYXEQ9njz8iWLx+GOL+we905MY/XY
	tKqTzePOtT1sHpuX1Hu0rD3G5PF+31U2j74tqxg9LjVfZ/f4vEkugDtKz6Yov7QkVSEjv7jE
	Vina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSezLLVI3y5BL+PJRLOCGVwVH955NzAu5ehi
	5OSQEDCRuDH3BXMXIxeHkMBSRomZi5YwQyRkJK51v2SBsIUl/lzrYoMoes0o8XvdZtYuRg4O
	XgE7iXl3VUFqWARUJGY8ecAGYvMKCEqcnPkErFdUQF7i/q0Z7CC2sECCxO3zTWDLRAR2MEkc
	7dsBNpRZYCOjxMLvu9ghNsxgljhxbg1YO7OAuMStJ/OZQGw2ASOJB8vns4LYnECbLx/9xQZy
	BbOAusT6eUIQ5fIS29/OYZ7AKDQLySGzkEyahdAxC0nHAkaWVYwiqaXFuem5xYZ6xYm5xaV5
	6XrJ+bmbGIHpYduxn5t3MM579VHvECMTB+MhRgkOZiUR3lvtR9OFeFMSK6tSi/Lji0pzUosP
	MZoCA2Mis5Rocj4wQeWVxBuaGZgamphZGphamhkrifO6XT6fJiSQnliSmp2aWpBaBNPHxMEp
	1cDEXyi9bJfB3SubL27/eXgeX+ONvfUub1bFWNSvuxG+97F5aWDXUrWZJxZkZxi/+9nt8Xju
	3J/GTIEmDBNXc7au3r6jfXpXZ8PRuRv9Vk8xeOTTf/Km5PI9V7Lzr5i3da5fdPVqsabX27AT
	u3vf2hst28lz693U+uTYVVYrgp54xnWG8MRc2iEQzZDx9cd9aQ7fg5PyWo/GiJ40Wx3/Znav
	cmP7knstR46FvA9WOpdsvObne5WrPjuFtzG+4nu2TzZA/eK5a+4uRtNd3npzvbrwOvT4xynJ
	NldEmouaXNaHe6xIOhG2tTL9x8mVs7csv2qsyHBAq9d+boTamk8LxGKijCWnvdSUuPf+rJj9
	zOnL5yixFGckGmoxFxUnAgBoKA+fmAMAAA==
X-CMS-MailID: 20250304075248eucas1p193463e8d646ef3fcda680ca785579934
X-Msg-Generator: CA
X-RootMTR: 20250303145918eucas1p10f64b2ce75e395ce208439307daa8a8f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250303145918eucas1p10f64b2ce75e395ce208439307daa8a8f
References: <20250303145901.446791-1-m.wilczynski@samsung.com>
	<CGME20250303145918eucas1p10f64b2ce75e395ce208439307daa8a8f@eucas1p1.samsung.com>
	<20250303145901.446791-2-m.wilczynski@samsung.com>
	<edb3dd6e-8b56-42b3-8bb2-8ed7ad186b75@kernel.org>
	<8dcdd2ec-e4b6-4fc0-be50-12fe187cd5e0@kernel.org>
	<99fcf36f-7fed-43e8-a94f-47563ab00fc6@samsung.com>
	<377951ad-341f-4e19-a582-a534567dc466@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_235254_265345_096DE2F6 
X-CRM114-Status: GOOD (  13.94  )
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



On 3/4/25 08:45, Krzysztof Kozlowski wrote:
> On 04/03/2025 08:43, Michal Wilczynski wrote:
>>
>>
>> On 3/3/25 18:46, Krzysztof Kozlowski wrote:
>>> On 03/03/2025 18:42, Krzysztof Kozlowski wrote:
>>>> On 03/03/2025 15:58, Michal Wilczynski wrote:
>>>>> The kernel communicates with the E902 core through the mailbox
>>>>> transport using AON firmware protocol. Add dt-bindings to document it
>>>>> the dt node.
>>>>>
>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>
>>>>
>>>> How is this possible? That's v1 and I never review outside of mailing list.
>>>>
>>> OK, I found v5:
>>> https://lore.kernel.org/all/20250219140239.1378758-4-m.wilczynski@samsung.com/
>>>
>>> so is this the same?
>>
>> Yeah, I thought by splitting the patchset and creating new sub-series I
>> should start versioning from v1 again, and leave that bigger patchset as
> 
> What was unclear in my "keep versioning and keep changelog"? How this
> can lead to "start new versioning"?

OK, my bad misunderstood you. I don't want to spam too much so maybe I
should wait if there will be any comments before re-sending with the proper
changelog and version.

> 
>> a reference, I've linked it in each cover letter for each sub-series.
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
