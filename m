Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10A9EB8FA3
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 02:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:Message-ID:Date
	:Subject:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FGxay3kSrwhAz7AugiWqL4ANtDPFxn2Nj5F6LaRQFoM=; b=kLHiaHxhqPkVnx
	fTnGXHwG8NvqZZLMOkpaxwbnOYylk3zDsFFuXW88f47G8xS6V69DyT/Af8qLKwOrEgaDEbouHXw6X
	1w9lUbVk6O2s1ISCH+bj+zBHo+HAJc1Iq6t/VMuMaEeiQX1KQi4Uv9SAK1mOYYKxikhpm2JfWGiyX
	WM7CqStHKJDpImsidB7ENyzvkQRuPYJxHCVm46X6BvdF0GZ0Xf7rPtNmBjbKrkbr6KGu93/eSU8qQ
	I/9yWtldxYTDEPXcE+o3OQ22NIs4jp84FAyPtB0Epe/Ccy6YfjOVvSwXyXn6hFW2wBQUIdCrvetOl
	N7BiAdcoR3WA5SIgEAKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdi8e-0074RW-30;
	Wed, 06 Sep 2023 02:19:28 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdi8Z-0074Qc-05
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 02:19:27 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20230906021911epoutp011ce36eb4b217e2f05d21d4b4b3fdacf9~CLckqlevd1585015850epoutp01X
	for <linux-riscv@lists.infradead.org>; Wed,  6 Sep 2023 02:19:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20230906021911epoutp011ce36eb4b217e2f05d21d4b4b3fdacf9~CLckqlevd1585015850epoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1693966751;
	bh=FcJBi9rHHQS0PibJX6niGmezArkc4jnoWMaw+AO0YsM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=eB4B/5mxkI5//0XTZdzWs/RRI0r92emcamPn9CCMN9GKgh5RFtI75qECLB30Hs3UB
	 TDWcf7/IuaA43SuDDLM6pJf5WG91K2U4ZDI+kI86eN2uax2qDyqkpMPrbrhDVuuKzp
	 iRS8E2r+pOliyWd100bAezI75Fq2PC2TWjtqeUi4=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTP id
	20230906021911epcas1p256d36f11583a7c74c5bed56214fadf93~CLcj7DaPd3265332653epcas1p2Q;
	Wed,  6 Sep 2023 02:19:11 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.36.136]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4RgQzf1Vvnz4x9Ps; Wed,  6 Sep
	2023 02:19:10 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
	epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
	EC.DD.09567.D91E7F46; Wed,  6 Sep 2023 11:19:10 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20230906021909epcas1p2050b0564283dbfa7a5b8dd8398c6a6e6~CLcikxwHv3245032450epcas1p2P;
	Wed,  6 Sep 2023 02:19:09 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20230906021909epsmtrp1ca7319375b81a521ab9081c268ff1d64~CLcij6HHR0132301323epsmtrp1e;
	Wed,  6 Sep 2023 02:19:09 +0000 (GMT)
X-AuditID: b6c32a39-955f97000000255f-4f-64f7e19d0bdb
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	7C.B0.08649.D91E7F46; Wed,  6 Sep 2023 11:19:09 +0900 (KST)
Received: from kson001 (unknown [10.102.7.58]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20230906021908epsmtip2dbebd06b7dfd1939a173b253df7c77a9~CLch8jm5q1902919029epsmtip2w;
	Wed,  6 Sep 2023 02:19:08 +0000 (GMT)
From: "Kwanghoon Son" <k.son@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
	<p.zabel@pengutronix.de>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<jszhang@kernel.org>, <guoren@kernel.org>, <wefu@redhat.com>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<inki.dae@samsung.com>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
In-Reply-To: <a19f9b10-f65f-6719-635f-06bc10b79c61@linaro.org>
Subject: RE: [RFC PATCH 2/3] reset: Add th1520 reset driver support
Date: Wed, 6 Sep 2023 11:19:08 +0900
Message-ID: <000001d9e068$84cabcc0$8e603640$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIKln6jBiI8NctqyBug/lhtZHj/zgHJqwAgAquW57cCUmlUDq91ZLCg
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCJsWRmVeSWpSXmKPExsWy7bCmvu68h99TDOa1Mlts/T2L3WLN3nNM
	FvOPnGO1eLG3kcVi0v0JLBbNx9azWfS9eMhssff1VnaLy7vmsFls+9zCZnH33gkWi5eXe5gt
	2mbxW7TuPcJu0bJ/CosDv8ebly9ZPA53fGH32LSqk83jzrU9bB6bl9R79P818Hi/7yqbR9+W
	VYwel5qvs3t83iQXwBWVbZORmpiSWqSQmpecn5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtq
	q+TiE6DrlpkD9ISSQlliTilQKCCxuFhJ386mKL+0JFUhI7+4xFYptSAlp8C0QK84Mbe4NC9d
	Ly+1xMrQwMDIFKgwITujf8IStoLjLBXXJu5naWDczdzFyMkhIWAi0b1zPmMXIxeHkMAORomr
	3zYxQzifGCXOPH3OCuF8Y5RYOaWTFaal49J1JojEXkaJy6smM4IkhAQeM0pcX2kAYrMJaEos
	PPcbbK6IwGUmick9H1lAEswCqRJHL89jA7E5Bewk5p5qBNrHwSEs4Cwx72IVSJhFQEXix4T7
	YPfxClhKTP5xnhXCFpQ4OfMJ1Bh5ie1v50D9oCDx8+kysBoRATeJJzfamSFqRCRmd7aBvSMh
	8IZD4s6ijSwQDS4SDz59gfpGWOLV8S3sELaUxMv+Nig7W+Lox71sEHaJxPVZi6DqjSX2L53M
	BHIzM9CT63fpQ4QVJXb+nssIsZdP4t3XHlaQEgkBXomONiEIU17iVmc5RLUoMGw/sk1gVJqF
	5LFZSB6bheSBWQi7FjCyrGIUSy0ozk1PLTYsMIXHdXJ+7iZGcPLWstzBOP3tB71DjEwcjIcY
	JTiYlUR438l/SxHiTUmsrEotyo8vKs1JLT7EaAoM6onMUqLJ+cD8kVcSb2hiaWBiZmRsYmFo
	ZqgkznvubW+KkEB6YklqdmpqQWoRTB8TB6dUA5Pu3BX7JDXkT077ka8g/f3gj31hk9ctcV/4
	cpfjSbbnInPvqvs8yLu97C7jIUvewuc7Jd80G1ZqfJN6+/Tfwy/KM/wjg2/em76oo+bvudNp
	YRVZDHEbvviejTohuN37oez/n9PVTe4e/G+4Yf0Kv39L/14zMfeM/B7wnWtxvdbeT8vzE7Pq
	X9n71M3sbbxdMOmYn170zlO3A2vfyTx6zZV4VvHzGYEvxoemzbb4keJ5NGDRa2EG+XO/W2Ke
	LDVz3/fiTMh8V728H/pKhpsnTfXk1I252Gqsmh14qk3Ncue++gNcDWLXhFk+nEw/aKb43YEt
	ID3Yeanxvuhzj1MsaxgkPGLKWfNLBab8/akXm/xLiaU4I9FQi7moOBEAxWEyhmcEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRmVeSWpSXmKPExsWy7bCSvO7ch99TDC7ulrbY+nsWu8WaveeY
	LOYfOcdq8WJvI4vFpPsTWCyaj61ns+h78ZDZYu/rrewWl3fNYbPY9rmFzeLuvRMsFi8v9zBb
	tM3it2jde4TdomX/FBYHfo83L1+yeBzu+MLusWlVJ5vHnWt72Dw2L6n36P9r4PF+31U2j74t
	qxg9LjVfZ/f4vEkugCuKyyYlNSezLLVI3y6BK6N/whK2guMsFdcm7mdpYNzN3MXIySEhYCLR
	cek6UxcjF4eQwG5GifttB1ggEqISHZcbGbsYOYBsYYnDh4shah4ySvx6tZURpIZNQFNi4bnf
	YLaIwH0miXs340FsZoF0iVuvz7BCNLxklLh+5hPYUE4BO4m5pxqZQYYKCzhLzLtYBRJmEVCR
	+DHhPthBvAKWEpN/nGeFsAUlTs58wgIxU1vi6c2nULa8xPa3c6AeUJD4+XQZK8QNbhJPbrQz
	Q9SISMzubGOewCg8C8moWUhGzUIyahaSlgWMLKsYJVMLinPTc5MNCwzzUsv1ihNzi0vz0vWS
	83M3MYIjWUtjB+O9+f/0DjEycTAeYpTgYFYS4X0n/y1FiDclsbIqtSg/vqg0J7X4EKM0B4uS
	OK/hjNkpQgLpiSWp2ampBalFMFkmDk6pBqa4lp+qr1T72zTD/z3njXzwytxEji/WUFm3WHiH
	W498le6TK52usm+rFzOu9zecaPlEoWlSkQdLi85/bbvJFWeCPI6Ezpq45rsX8821M+8+CZK+
	G7mW1ffA/vJlN2dOERb28TP9JFL8uaLVJ3Ljhb5ZmTtzj9VuTLyzR38Db1LVo9iSuBUzWjSz
	v/unhomp7ezn2XK4Juxp2SNe7d7AhjOBCxcxzWSKZGzm6bzRKfgvbZIIs1X1jvV+T/e/nJ7Q
	yKQsvtjN0lsmW/L/k3/Fd7pe9bd3rIlvX3/sVYt7dJXE/KtK3UlN9TvkvaYvnzXJX6buaYrO
	ucsVflpuxnbH5F8Jhe5iCbyaoq3ZzLlRiaU4I9FQi7moOBEA3nIEGVMDAAA=
X-CMS-MailID: 20230906021909epcas1p2050b0564283dbfa7a5b8dd8398c6a6e6
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230904042603epcas1p2ae04f309c60dde70a0b254287f61dfb1
References: <20230904042559.2322997-1-k.son@samsung.com>
	<CGME20230904042603epcas1p2ae04f309c60dde70a0b254287f61dfb1@epcas1p2.samsung.com>
	<20230904042559.2322997-3-k.son@samsung.com>
	<a19f9b10-f65f-6719-635f-06bc10b79c61@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_191923_408881_28FA0220 
X-CRM114-Status: GOOD (  15.01  )
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

> >  drivers/reset/Kconfig                    |  10 +++
> >  drivers/reset/Makefile                   |   1 +
> >  drivers/reset/reset-th1520.c             | 109 +++++++++++++++++++++++
> >  include/dt-bindings/reset/th1520-reset.h |   9 ++
> 
> Bindings are always separate patches. In this case, all bindings should
> be together. Also you clearly forgot one step:

Thanks for the feedback. Does it mean 2 files
`include/dt-bindings/reset/th1520-reset.h`, `Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml`
Should be one patch first together?

Kwnag.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
