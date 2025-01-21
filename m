Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3543C02182
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 21:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HMZpGrXdv9Ff/hVN4A6v5VIMyKyKJ5GCLADSanA0LeQ=; b=NkHip3j0aCEObA
	7C3g4rnaU1Px5dTojLTjijE9u8wNRvq3LSOYhx/9zPeDnxJUUaC7XPL0qEH1ldgnLxY80QO+DfWcV
	sLdAtBZBRwr/x2kN8bz8F8GhUzgr0T1W0Hjl55VpFupW4OgkUskMOAeDsfLE1iax8tkVIiPI8OEi/
	CVcjVXN3Wr85PRvoUavVwvwNy1NMpO963vU2IG7DNBjsRNOEsBCiNcBPKFaZoyAjKb9stkQS0vWSz
	bHO8TEBFtFci9rkHH64xPp9lEE61USfMRTGCXKqaX613CqQgY5q8SIHJ7AeoJ5yeIm8/uNEh4kEp4
	Bk9cNJCixYz7tqaboN7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taLoh-00000008otb-0pJ8;
	Tue, 21 Jan 2025 21:29:47 +0000
Received: from [210.118.77.11] (helo=mailout1.w1.samsung.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taLoc-00000008oq3-0Tmv
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jan 2025 21:29:45 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250121212937euoutp018d9679db1441ff3a37152871f8393d61~c0nnzD6xw0554505545euoutp01_
	for <linux-riscv@lists.infradead.org>; Tue, 21 Jan 2025 21:29:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250121212937euoutp018d9679db1441ff3a37152871f8393d61~c0nnzD6xw0554505545euoutp01_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1737494977;
	bh=7DAQtGe5ehhmaJJBSKkNaYwKw4vGlWGXpJT8D3xHSDI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=nZoGOIXuz4y0tD+Yi5BsWGhPjt9IpSX0AJWiLhV3EI+9ba/7saDlnd/8iWzdyHLr0
	 5gvIXNpqtnt0g/30RVh8+hKTDvdkSnIIah0geSBd8TUfT7qBbn1DiJjqr8uxH4nUAJ
	 8Lo4GuQM+uUVYtLgTKQ30a1/8hTgx/+fAgUNCFsk=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250121212936eucas1p2c925e95385d4b69589b59e2397829d07~c0nmkVVkN2313723137eucas1p2q;
	Tue, 21 Jan 2025 21:29:36 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 33.53.20409.FB110976; Tue, 21
	Jan 2025 21:29:36 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250121212934eucas1p1b2b479b2d4d0209545f504e43cb55f3c~c0nlWqMnC3043530435eucas1p1t;
	Tue, 21 Jan 2025 21:29:34 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250121212934eusmtrp224eaf8fd6fbcfe02d3793c29d8e7c2a8~c0nlT6iCD1186611866eusmtrp2N;
	Tue, 21 Jan 2025 21:29:34 +0000 (GMT)
X-AuditID: cbfec7f4-c39fa70000004fb9-49-679011bf7ed8
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 49.08.19920.EB110976; Tue, 21
	Jan 2025 21:29:34 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250121212933eusmtip169e90c368964dad66b54da5603c440b7~c0nkCl9_L3226132261eusmtip15;
	Tue, 21 Jan 2025 21:29:33 +0000 (GMT)
Message-ID: <8af66556-90d9-4360-ac38-f300f487f55a@samsung.com>
Date: Tue, 21 Jan 2025 22:29:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 01/18] dt-bindings: clock: Add VO subsystem clock
 controller support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
	wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
	matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	ulf.hansson@linaro.org, jszhang@kernel.org, p.zabel@pengutronix.de,
	m.szyprowski@samsung.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org,
	linux-pm@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20250121-raptor-of-terrific-perfection-cafc27@krzk-bin>
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0xbVRzOuff23ku17NJt4Ywt4pqJskyYg4SjTtQIy43OZUTmzIwbddx1
	CxSwHeKDuMKggdEKQ4RR5kBEyhDkYSm0AzsYUp7FgaOD8FjiIMJWC9KxMMKQcpny3/f7vu98
	v0cOjYtbSR/6TNxZThEnjZWQQsLYsWh78bpXjmyvZRigTnsphhqWdBSqarFhqLjdJkDjAwYM
	/fHASaKfJ3+n0F8tKQQaqviOQuc7akg0rRsnUX9/LYXmNOMCNGi+TKJ5bTtAxvk0ElW3j1Ho
	+7kGApU1mQFSZ5YL0M3ucDQ23kmg6UENjtS6TWiluYlCj4fqCFT0t4VChvsXBchafRSlWfKI
	N55hnbfTKfb+9DTB3shwUWzLQgnBmnRjFKsx9QK2vjKTZEeHmkn2SlcEO5Flxdhfys6xadUd
	GJu9vJd1/nqLZL82VAJ24LydOiw+JtwfzcWe+ZRTBIZGCU//VNoHEq56fmYv81eBi8ILwIOG
	TDD807WEXwBCWsxUANjZWEPyhQtAbW4r4It5ADMrZoknT0a6G9YFPYC5pnsYXzgA/KZDD9wu
	ERMK1dcrMDcmmOdg97V8kue9YFfh3bWkrYwvnBi5RLnxZuZDmFnTs+bfwvhD+/JDgTsUZ5oF
	MD+vVuAWcMYbjtwtXjORzD54R1+8xnsw4bBrfozkPb6w0XEZ50e9KYRt5Qk8DoO1Dss6vxnO
	WA0Uj3fAFROfCZl4eKfhn3VPMjRprOv4VThqe7SaT6/m+8MacyBPvwlzirJwNw0ZT3jb4cVP
	4AlzjQXrtAhmqMW82w9+q9H+19RWYcRygES34Si6DTvqNuyi+79vCSAqgTeXqJTLOOW+OC4p
	QCmVKxPjZAEn4+X1YPWX9zy2upqAfmYuoA1gNGgDkMYlW0RbZzUysSha+vkXnCL+hCIxllO2
	ge00IfEWlVrSZWJGJj3LxXBcAqd4omK0h48KC2x8OwQLqlFF6OWKoqvYJ3W7tr0rfzSZelLn
	lX0vqy/jhahq7aEp39ln1QeSjHsuHamzHgF9IdqPwrqUk5UFo3Zh/dEbbwk14eH1vqaPFyaO
	0wPxS63pP74Tueu34JmdZf4xBrQ/yjNeefCWJNrh/CF7yhUR3TtsRZg+OnPw1PioX8rhFNGh
	Y0KL/vngkqDuKxNBzQs+hT1av8VrubG1D+S7O2cms1Wpfck9XkzzwTpsT0F5bFVqWO+myLi8
	c6+p8STVTvjyjgPbv3r6xEp+pOx155dRC/6u/vesQVFTVWZzUdrDdPJ9sz1hmA6JSV72Djbn
	eDx1/INXQk/h24oXywt9JITytPSl3bhCKf0XwA36YVQEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMKsWRmVeSWpSXmKPExsVy+t/xu7r7BCekG9ycqG1x4voiJoutv2ex
	W6zZe47JYv6Rc6wW9y5tYbK48vU9m8W6pxfYLV7sbWSxuLZiLrtF87H1bBYvZ91jszh/fgO7
	xceee6wWl3fNYbP43HuE0WLb5xY2i7VH7rJbLPy4lcViyY5djBZtnctYLS6ecrW4e+8Ei8XL
	yz3MFm2z+C3+79nBbvHv2kYWi9nv9rNbbHkzkdXi+Npwi5b9U1gc5Dze32hl93jz8iWLx+GO
	L+wee78tYPHYOesuu0fPzjOMHptWdbJ53Lm2h81j3slAj/vdx5k8Ni+p92hZe4zJo/+vgcf7
	fVfZPPq2rGL0uNR8nT1AKErPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/O
	JiU1J7MstUjfLkEvY/Wis4wFK/kqri/RbGCcyNXFyMkhIWAicevUVkYQW0hgKaNEw4YSiLiM
	xLXulywQtrDEn2tdbF2MXEA1rxklpn1sZwNJ8ArYSbQdWMEEYrMIqEqc2j0NKi4ocXLmE7Bm
	UQF5ifu3ZrCD2MIC0RKd60+D1YsIaEpc//udFWQos8AeVonDmz9DbWhhknhypAmsillAXOLW
	k/lgNpuAkcSD5fNZQWxOAVeJk5/vAjVwANWoS6yfJwRRLi+x/e0c5gmMQrOQ3DELyaRZCB2z
	kHQsYGRZxSiSWlqcm55bbKhXnJhbXJqXrpecn7uJEZi6th37uXkH47xXH/UOMTJxMB5ilOBg
	VhLhFf3Qky7Em5JYWZValB9fVJqTWnyI0RQYFhOZpUST84HJM68k3tDMwNTQxMzSwNTSzFhJ
	nNft8vk0IYH0xJLU7NTUgtQimD4mDk6pBqaeYO7FlZxHRJu1krv+N3y8ddHvoc02rwI5/0ke
	TXJi7tbPTqrIfNRx//r/2buyP8dzFlvYX11VdGSq8ax1P5MKhI26Rf74mhctjYxZ+sZ4w3EO
	leuH6mNvvf5v2jCnvpXL+9aPT8XHfXa3hJQdPFWzSFBKsSL6lu6p6ds5v9zgaXr5rWTnodTH
	v+4wboo8lxBfpP9l3bveDebP2ZmS62Qv1H57wc8lWrLahj+i7dmHzhf2U1oMThxwTurf8Ju/
	++NK/ne/Vfx/VyS/WbH16YQlF3uEXp66dG/O3f/7GV9mT3pgn6KrInOV61DiG05B7bdBflo5
	yx0OXU4179fj+xFw3isz6S7fTMv+lQJ8/E+VWIozEg21mIuKEwFvtHrJ5gMAAA==
X-CMS-MailID: 20250121212934eucas1p1b2b479b2d4d0209545f504e43cb55f3c
X-Msg-Generator: CA
X-RootMTR: 20250120172120eucas1p23993cdbbe65e82054b9cb92fb704103b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250120172120eucas1p23993cdbbe65e82054b9cb92fb704103b
References: <20250120172111.3492708-1-m.wilczynski@samsung.com>
	<CGME20250120172120eucas1p23993cdbbe65e82054b9cb92fb704103b@eucas1p2.samsung.com>
	<20250120172111.3492708-2-m.wilczynski@samsung.com>
	<20250121-raptor-of-terrific-perfection-cafc27@krzk-bin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_132942_548935_2C81FA74 
X-CRM114-Status: GOOD (  14.36  )
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



On 1/21/25 10:47, Krzysztof Kozlowski wrote:
> On Mon, Jan 20, 2025 at 06:20:54PM +0100, Michal Wilczynski wrote:
>>  properties:
>>    compatible:
>> -    const: thead,th1520-clk-ap
>> +    enum:
>> +      - thead,th1520-clk-ap
>> +      - thead,th1520-clk-vo
>>  
>>    reg:
>>      maxItems: 1
>>  
>>    clocks:
>>      items:
>> -      - description: main oscillator (24MHz)
>> +      - description: main oscillator (24MHz) or CLK_VIDEO_PLL
> 
> thead,th1520-clk-ap gets also VIDEO_PLL? Aren't both serving the same
> purpose from these devices point of view? Bindings are telling what this
> device is expecting.

Since thead,th1520-clk-ap configures PLL clocks it takes the oscillator
24MHz as an input, so no.

The VO subsystem takes as an input VIDEO_PLL that's configured by the
AP.

I could do something like this if this needs to be formally expressed in
the schema:

if:
  properties:
    compatible:
      contains:
        const: thead,th1520-clk-ap
then:
  properties:
    clocks:
      description:
        main oscillator (24MHz)

if:
  properties:
    compatible:
      contains:
        const: thead,th1520-clk-vo
then:
  properties:
    clocks:
      description:
        VIDEO_PLL (derived from AP) for the VO clock controller.


> 
>>  
>>    "#clock-cells":
>>      const: 1
>> @@ -51,3 +54,10 @@ examples:
>>          clocks = <&osc>;
>>          #clock-cells = <1>;
>>      };
>> +
>> +    clock-controller@ff010000 {
>> +        compatible = "thead,th1520-clk-vo";
> 
> Difference in one property does not justify new example. If there is
> goign to be resend, just drop.
> 
> 
>> +        reg = <0xff010000 0x1000>;
>> +        clocks = <&clk CLK_VIDEO_PLL>;
>> +        #clock-cells = <1>;
> 
> Best regards,
> Krzysztof
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
