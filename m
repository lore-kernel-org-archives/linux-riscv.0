Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612DBC021B8
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 08:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t3yi1Lo2H+1cJw21KhcefpfjMIAiMN/mFStf2elt+Co=; b=MEL+t0+7PYnJHD
	if8TmibrUx4Mjh91GlPX1nj96CKgYVhunfDIK+IdBe2kBQBMhh5WFrSKXXOxHeb/dFYpIaYqYLc/z
	yvxYwGFuDaHJAD4sa1KckuCQGw6bHfPbUk/SL/8I9UBXFVqwbbfbHobq+BAZa/b7k0Jd1B9ffKYDJ
	jnOqq4vWaFEw0CNnvpp5ZunNtayaQWKAGLwf1vUA11dqM7RgvqqwJ4/COg6hi6ug/maG+IAL/usTA
	xy0ix9oo6OKPpaz+GI2N8eGZ99vXPqt7PUFKHZuzKuXpE7USdp6x8szb73Ct3edrq2SxnTzBhH8qf
	CQUhzUGy/YSVUYXhQscw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNE3-00000003YLC-0K9j;
	Tue, 04 Mar 2025 08:02:03 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpMwd-00000003UBJ-0GDM
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 07:44:05 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250304074401euoutp016e7d5711d0fd59ee9693aa05aac58b1a~picw8N0dY2019520195euoutp01a
	for <linux-riscv@lists.infradead.org>; Tue,  4 Mar 2025 07:44:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250304074401euoutp016e7d5711d0fd59ee9693aa05aac58b1a~picw8N0dY2019520195euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1741074241;
	bh=4BFr8Rd+AuGGA2HLx1V5tn0sMoKxIe9Ixbj1HyvfRuA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=W2IrArBc9wnni4siafqd7en20enM43Cf5mC3GDVO6EjWZ8uvvjs1+XDmlkmnMycut
	 yXEyCxM122jLgA1XZo/2Km4xdBjpZ5iJDtVEoDOHVST0T2TQowjT8lEy73Mh9Uzevd
	 zwrO0fb3ReKtbN/rycYER3r4giaUoZbmYzUZkgoM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20250304074400eucas1p1efde6961d5015269dd80c497f968f098~picwTkFL92735327353eucas1p19;
	Tue,  4 Mar 2025 07:44:00 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 59.7A.20397.04FA6C76; Tue,  4
	Mar 2025 07:44:00 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250304074359eucas1p1dff7a62b9ece707006c704ae4180c592~picvucTlh2932929329eucas1p1-;
	Tue,  4 Mar 2025 07:43:59 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250304074359eusmtrp2f76278813dd5971a494fdbe749d29c17~picvtvhh33203132031eusmtrp2M;
	Tue,  4 Mar 2025 07:43:59 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-f5-67c6af40cee5
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 1D.8B.19920.F3FA6C76; Tue,  4
	Mar 2025 07:43:59 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250304074358eusmtip206d631ffbee06748542ec1c8f6f073f8~picu1dvys0733307333eusmtip2N;
	Tue,  4 Mar 2025 07:43:58 +0000 (GMT)
Message-ID: <99fcf36f-7fed-43e8-a94f-47563ab00fc6@samsung.com>
Date: Tue, 4 Mar 2025 08:43:58 +0100
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
In-Reply-To: <8dcdd2ec-e4b6-4fc0-be50-12fe187cd5e0@kernel.org>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCKsWRmVeSWpSXmKPExsWy7djPc7oO64+lG7zbLm3x7M5XVoutv2ex
	W6zZe47JYv6Rc6wW9y5tYbJ4sbeRxaL52Ho2i5ez7rFZnD+/gd1i7+ut7BaXd81hs/jce4TR
	YtvnFjaLtUfuslu8vNzDbNE2i9/i/54d7BbH14ZbtOyfwuIg7PHm5UsWj8MdX9g97p2Yxuqx
	aVUnm8eda3vYPDYvqfdoWXuMyeP9vqtsHn1bVjF6XGq+zu7xeZNcAHcUl01Kak5mWWqRvl0C
	V8blfauYCx6wVWyft4+5gfEwaxcjJ4eEgInEtZ+rmboYuTiEBFYwSsz6/BcsISTwhVGi7Wku
	ROIzo8TxgxPhOrbt3skCkVjOKLHhzh42COcto0Tjsl42kCpeATuJH1+PMoLYLAIqEjOXn4CK
	C0qcnPmEBcQWFZCXuH9rBjuILSyQIHH7fBMzyCARgR1MElfe7AFzmAU2MkqsO/oarINZQFzi
	1pP5TCA2m4CRxIPl88Fu4gTa1rDmFitEjbzE9rdzwJolBB5xSpxfvBXoDA4gx0Xi4roiiB+E
	JV4d38IOYctI/N8JMVNCIF/iwdZPzBB2jcTOnuNQtrXEnXO/2EDGMAtoSqzfpQ8RdpSY8LqN
	CWI6n8SNt4IQF/BJTNo2nRkizCvR0SYEUa0mMbWnF27puRXbmCYwKs1CCpVZSH6cheSXWQh7
	FzCyrGIUTy0tzk1PLTbOSy3XK07MLS7NS9dLzs/dxAhMmKf/Hf+6g3HFq496hxiZOBgPMUpw
	MCuJ8N5qP5ouxJuSWFmVWpQfX1Sak1p8iFGag0VJnHfR/tZ0IYH0xJLU7NTUgtQimCwTB6dU
	AxPHk+JZW9NdErk3f7Dfab/xe1YL6y3Nq9MLNAJena+Idbn4o9SueSrfr1KO9OAZS37+WFnv
	sqHfgv07c7Xt2VMLajjXW7KcdZ5hNe336/uq+eeUVuiszejYwZqiVP3u39S67Cl+IX81VSob
	6m5uW/UlZMr6a3M+cRsFBa19dEKwfcuVn8udkmqtFb9tr/3W6yHmIb3C/E/M7IMrhNjTFVrY
	l2784errIHDn47L/a7v6+fRSPizbU9t05PpZ1yml96/OjpnRky3rePLnw/st93RfHOObEqn3
	9Mm95rsWC2KDFr/TWrjg/+bXi3iDOlg/Fk53T9oza2bz5Zdi3+fyL5EOf9m1reC2wJPMGf16
	PhoKSizFGYmGWsxFxYkA9SDlBwcEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgleLIzCtJLcpLzFFi42I5/e/4PV379cfSDVofGFo8u/OV1WLr71ns
	Fmv2nmOymH/kHKvFvUtbmCxe7G1ksWg+tp7N4uWse2wW589vYLfY+3oru8XlXXPYLD73HmG0
	2Pa5hc1i7ZG77BYvL/cwW7TN4rf4v2cHu8XxteEWLfunsDgIe7x5+ZLF43DHF3aPeyemsXps
	WtXJ5nHn2h42j81L6j1a1h5j8ni/7yqbR9+WVYwel5qvs3t83iQXwB2lZ1OUX1qSqpCRX1xi
	qxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZllqkb5egl3F53yrmggdsFdvn7WNuYDzM
	2sXIySEhYCKxbfdOli5GLg4hgaWMEoePTWSCSMhIXOt+yQJhC0v8udbFBlH0mlFi1+db7CAJ
	XgE7iR9fjzKC2CwCKhIzl59gg4gLSpyc+QSsWVRAXuL+rRlg9cICCRK3zzcxgwwSEdjBJHG0
	bwfYVGaBjYwSC7/vYodYsZ5JYu+OP8wgLcwC4hK3nswHu4lNwEjiwfL5YIdzAq1uWHMLyOYA
	qlGXWD9PCKJcXmL72znMExiFZiE5ZBaSSbMQOmYh6VjAyLKKUSS1tDg3PbfYUK84Mbe4NC9d
	Lzk/dxMjMElsO/Zz8w7Gea8+6h1iZOJgPMQowcGsJMJ7q/1ouhBvSmJlVWpRfnxRaU5q8SFG
	U2BgTGSWEk3OB6apvJJ4QzMDU0MTM0sDU0szYyVxXrfL59OEBNITS1KzU1MLUotg+pg4OKUa
	mKyD2jP6xaTvh0cv3cXzqeh9vsfNx/ozTCY6+LCXOR7+VHt09hSH1d8X/t5SLvR4ynmO0m6r
	L1M3G21SLNdI32yUqLL7E89snolm7gq6PqIhIoFyL0Mavrf5GxXNOe5/d8WpTZLZZnFBZd+j
	prByvw9LvGrpeGP2OhUFDYl335JdNtzKicxSvWAotGP/pxuNPQe42W/7ykWnSLRvmHT/1Op1
	mRtsP1UIvTnK0vqn3292a73HOfOcHRK5bx5lXQv+lHrzUVTEdLb0lq6W+i7X2Y9FWjQ+1nYp
	dF9w2lSfcfjdv3unlr8KmPh+/bNzUzsqLPY9TWN6psyx/uz9mBuKtfZ7lmSIckbXuGhNX6zY
	psRSnJFoqMVcVJwIAPqFG5CbAwAA
X-CMS-MailID: 20250304074359eucas1p1dff7a62b9ece707006c704ae4180c592
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_234403_669619_56DCB656 
X-CRM114-Status: GOOD (  11.97  )
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
> On 03/03/2025 18:42, Krzysztof Kozlowski wrote:
>> On 03/03/2025 15:58, Michal Wilczynski wrote:
>>> The kernel communicates with the E902 core through the mailbox
>>> transport using AON firmware protocol. Add dt-bindings to document it
>>> the dt node.
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>>
>> How is this possible? That's v1 and I never review outside of mailing list.
>>
> OK, I found v5:
> https://lore.kernel.org/all/20250219140239.1378758-4-m.wilczynski@samsung.com/
> 
> so is this the same?

Yeah, I thought by splitting the patchset and creating new sub-series I
should start versioning from v1 again, and leave that bigger patchset as
a reference, I've linked it in each cover letter for each sub-series.

> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
