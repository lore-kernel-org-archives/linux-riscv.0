Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146ECC282CD
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 14:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=ItQM+U7X9VU0bqoLNNxaPnDZ1/yo1onN5W9RE30lEd8=; b=YOF7/5hfPbWuJB
	5otf7AO8FadZeKq+it/Xro87SapchciDQDoj631CighXcIgFA49c4rHWX5pwdbLgEDmJTplyzPblX
	cjktBEIxipt9qmgSh/9nRVdr/T767bUEcQWpKB1NTVQdLnkYwM4Pra4lv7XBVnFH8NEni7KuxeXh5
	j4Sf13+HL0EqG43uNyxGurVT0IEN7elDnTqgFEOhV3zn0prttVKPcf8E+/PSHtc7fh8cz1PGoWDfR
	7aCftoB2bFX7qzjuRcsjjXbbwo3l7YrD1mYCMqVKOHd75x4Z4EpkFs2H0ti04mr0lQEHUG9jYGKC6
	ldw59dxUQ1SxojgUVUXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6uP-000000017rd-0xlx;
	Mon, 03 Mar 2025 14:36:41 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6uL-000000017pw-3EiA
	for linux-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 14:36:39 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250303143635euoutp01769bf08024145512591f8a4ca0446b70~pUbsbjhpr0985609856euoutp012
	for <linux-riscv@lists.infradead.org>; Mon,  3 Mar 2025 14:36:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250303143635euoutp01769bf08024145512591f8a4ca0446b70~pUbsbjhpr0985609856euoutp012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1741012595;
	bh=pTjIhab8FRPR9yXV/fmQexbnMHTD4v3PKosSwFKK0e4=;
	h=From:To:Cc:Subject:Date:References:From;
	b=b0jxFdoyc43MHMRFKwa1VHx4XZT/eOv7H6+dZpdH5/juf2W44WVVAPu+nDJxaTOWW
	 INT3I//iX6ekTonAyQONmx/wN9xB1a86BpgPA8gPJUcHXgK6fk0ffmRAS1GsvZK6Qb
	 MxiBhPLlsdy6TYVBnA8uv6x+wtFi09AZl4rHxIxA=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250303143634eucas1p203aef65baec1b28baa23e41bdcbfbdef~pUbsDPrX42682126821eucas1p2s;
	Mon,  3 Mar 2025 14:36:34 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id A9.8D.20409.27EB5C76; Mon,  3
	Mar 2025 14:36:34 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250303143634eucas1p269281f72bdc4d764edd54b9427f68787~pUbrokfQM2682126821eucas1p2r;
	Mon,  3 Mar 2025 14:36:34 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250303143634eusmtrp194320dd4bcc931db79a659cb79d181c8~pUbrmn-s01014710147eusmtrp1l;
	Mon,  3 Mar 2025 14:36:34 +0000 (GMT)
X-AuditID: cbfec7f4-c0df970000004fb9-99-67c5be722ace
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id B4.89.19654.17EB5C76; Mon,  3
	Mar 2025 14:36:34 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250303143633eusmtip28a4429ddccd06e468ba9ba46be450def~pUbqqIMVy2026320263eusmtip2j;
	Mon,  3 Mar 2025 14:36:33 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
	wefu@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, jszhang@kernel.org,
	p.zabel@pengutronix.de, m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Michal
	Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v1 0/4] Add T-Head TH1520 VO clock support for LicheePi 4A
 GPU enablement
Date: Mon,  3 Mar 2025 15:36:25 +0100
Message-Id: <20250303143629.400583-1-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrIKsWRmVeSWpSXmKPExsWy7djPc7pF+46mG3QeULB4ducrq8XW37PY
	LdbsPcdkMf/IOVaLe5e2MFm82NvIYtF8bD2bxctZ99gsPvbcY7W4vGsOm8W2zy1sFmuP3GW3
	WP91PpPFxVOuFnfvnWCxeHm5h9mibRa/xf89O9gt/l3byGLRsn8Ki4OIx/sbreweb16+ZPE4
	3PGF3ePeiWmsHptWdbJ5bF5S79Gy9hiTR/9fA4/3+66yefRtWcXocan5OrvH501yATxRXDYp
	qTmZZalF+nYJXBn7phcUXOSpaHi7iqmBcStXFyMnh4SAicS0b98Yuxi5OIQEVjBKrGtsZ4Vw
	vjBKnJ/+kxnC+cwo8bH3OTNMS8O5RewQieVALVPfs4EkhATeMEpMvcAIYrMJGEk8WD4fbJSI
	wB4mie/fIUYxC6xilHjy7SM7SJWwQLTEkgkNYDaLgKrExEOtLCA2r4CdxJX2xVDr5CX2HzzL
	DBEXlDg58wlYDTNQvHnrbLChEgL7OSX2rn/MCtHgIrH9RAcjhC0s8er4FnYIW0bi9OQeFgg7
	X+LB1k9QC2okdvYch7KtJe6c+wX0DgfQAk2J9bv0IcKOEj+vzwELSwjwSdx4KwhxAp/EpG3T
	mSHCvBIdbUIQ1WoSU3t64ZaeW7GNCcL2kHj+YCsjJKxiJT4dnc44gVFhFpLHZiF5bBbCDQsY
	mVcxiqeWFuempxYb5aWW6xUn5haX5qXrJefnbmIEpsrT/45/2cG4/NVHvUOMTByMhxglOJiV
	RHhvtR9NF+JNSaysSi3Kjy8qzUktPsQozcGiJM67aH9rupBAemJJanZqakFqEUyWiYNTqoGp
	Kvf30c9JD9e6JXSxOz5IOKKxJH6qhfbvVTml3gwPCmOfFy48+efTmml1sa6h/7lmb1uklPgq
	sHamsJ5p4OIsp9rfji/4c879FtppE/pk14Uf9hU3nNO1lc/bFCnWS6+uF1wVaDFd9VbG4lPq
	JgbsKVVMSin2S3rSXGyL9SfHRQl4zRF4fvLM+UWfVAX3W3Dl2F+0b2ivUru0ONHP/tIprlN5
	t5/1cD+SrWb8cfvilmVV3bdXOlm2eR0yXv0vKPhj9r/ULx+3HL/Kc3Rii8SLksnrr4adDCgz
	TZ2TtX9J35r2XZN62YUvGj0Umyb7OXv626y7FnnzDzmarVBnXcjx8lN2y5WFfxnLsm0WGnUo
	sRRnJBpqMRcVJwIA2loBZQQEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRmVeSWpSXmKPExsVy+t/xe7pF+46mG0w/xGzx7M5XVoutv2ex
	W6zZe47JYv6Rc6wW9y5tYbJ4sbeRxaL52Ho2i5ez7rFZfOy5x2pxedccNottn1vYLNYeuctu
	sf7rfCaLi6dcLe7eO8Fi8fJyD7NF2yx+i/97drBb/Lu2kcWiZf8UFgcRj/c3Wtk93rx8yeJx
	uOMLu8e9E9NYPTat6mTz2Lyk3qNl7TEmj/6/Bh7v911l8+jbsorR41LzdXaPz5vkAnii9GyK
	8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DL2TS8ouMhT
	0fB2FVMD41auLkZODgkBE4mGc4vYuxi5OIQEljJKrDuzmRkiISNxrfslC4QtLPHnWhcbiC0k
	8IpRoudkFYjNJmAk8WD5fFaQZhGBC0wSu9atZgJxmAXWMUpM2b6DCaRKWCBS4v33hWCTWARU
	JSYeagWzeQXsJK60L4baJi+x/+BZZoi4oMTJmU+AajiABqlLrJ8nBBJmBipp3jqbeQIj/ywk
	VbMQqmYhqVrAyLyKUSS1tDg3PbfYSK84Mbe4NC9dLzk/dxMjMKK3Hfu5ZQfjylcf9Q4xMnEw
	HmKU4GBWEuG91X40XYg3JbGyKrUoP76oNCe1+BCjKdDVE5mlRJPzgSklryTe0MzA1NDEzNLA
	1NLMWEmcl+3K+TQhgfTEktTs1NSC1CKYPiYOTqkGppCtrvvNv70z1Y45pLXhVvPF+pdawdMf
	MLXv25g965HNx4tzHjEsT1kkldzh9TclP1ujZCnPl91Gj+wYdRQj7q8WfDp36qZKiclxP5xE
	JS9frhPlEggSe5yZrLTbZ+ME9qP9bwT28qjmbZlSzLn7UE5o/H/HQuk1sha2687/WdbCqPBS
	SlDq2iEWSYPwfPYZJb8+VTHe2+CePEMm4PySJTrLW26rH/rQLTqrP5zh6E7nl5MfJEtNrbhl
	J3+oaKJVjr4A7wyB01efPv/GWmHXpMp3826oWOeUG+Er1+bItPHGdzre27uh377dxyXmUUnE
	92jLk9GZD1bxt9p2+BbvWBcQ+JFXQ3em04t7vuEZSizFGYmGWsxFxYkACo1pLXEDAAA=
X-CMS-MailID: 20250303143634eucas1p269281f72bdc4d764edd54b9427f68787
X-Msg-Generator: CA
X-RootMTR: 20250303143634eucas1p269281f72bdc4d764edd54b9427f68787
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250303143634eucas1p269281f72bdc4d764edd54b9427f68787
References: <CGME20250303143634eucas1p269281f72bdc4d764edd54b9427f68787@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_063638_076738_EECE5EA6 
X-CRM114-Status: GOOD (  11.49  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhpcyBpcyBhIHN1YnNldCBvZiBhIGxhcmdlciBwYXRjaCBzZXJpZXMgZW5hYmxpbmcgdGhlIElt
YWdpbmF0aW9uIEJYTS00LTY0IEdQVQpvbiB0aGUgTGljaGVlUGkgNEEgYm9hcmQsIHdoaWNoIGlz
IHBvd2VyZWQgYnkgdGhlIFQtSEVBRCBUSDE1MjAgU29DLiBXaGlsZSB0aGUKZnVsbCBzZXJpZXMg
aW5jbHVkZXMgcG93ZXItZG9tYWluLCByZXNldCwgYW5kIGZpcm13YXJlIGNoYW5nZXMsIHRoaXMg
cGFydApmb2N1c2VzIHNvbGVseSBvbiB0aGUgY2xvY2sgc3Vic3lzdGVtIG5lZWRlZCBmb3IgdGhl
IEdQVSBhbmQgb3RoZXIgVk8gKHZpZGVvCm91dHB1dCkgYmxvY2tzLiBCeSBtZXJnaW5nIHRoZXNl
IGNsb2NrIHBhdGNoZXMgaW5kZXBlbmRlbnRseSwgd2UgcHJlcGFyZSB0aGUKZ3JvdW5kd29yayBm
b3IgZnV0dXJlIEdQVSBpbnRlZ3JhdGlvbiB2aWEgdGhlIGBkcm0vaW1hZ2luYXRpb25gIGRyaXZl
ci4KClRoZSBULUhFQUQgVEgxNTIwIFNvQyBmZWF0dXJlcyBtdWx0aXBsZSBjbG9jayBjb250cm9s
bGVycy4gSW5pdGlhbGx5LCBvbmx5IHRoZQpBUCBjbG9jayBjb250cm9sbGVyIHdhcyBzdXBwb3J0
ZWQgdXBzdHJlYW0uIFRoZSBwYXRjaGVzIGJlbG93IGFkZCBzdXBwb3J0IGZvcgp0aGUgVk8gKHZp
ZGVvIG91dHB1dCkgY2xvY2sgY29udHJvbGxlciwgd2hpY2ggbWFuYWdlcyBHUFUtcmVsYXRlZCBn
YXRlcywgSERNSSwKYW5kIG90aGVyIG11bHRpbWVkaWEgY2xvY2tzLiBBZGRpdGlvbmFsbHksIHRo
ZXkgaW50cm9kdWNlIGEgbWVjaGFuaXNtIHRvCnByb3ZpZGUgbm8tb3Agb3BlcmF0aW9ucyBmb3Ig
dGhlIEdQVSdzICJtZW0iIGNsb2NrIGdhdGUgKGRvY3VtZW50ZWQgYXMK4oCcUmVzZXJ2ZWTigJ0g
aW4gdGhlIGhhcmR3YXJlIG1hbnVhbCkgYW5kIGNvb3JkaW5hdGUgdGhlIEdQVSBDTEtHRU4gcmVz
ZXQgaW4gdGhlCmNsb2NrIGRyaXZlci4KCkJpZ2dlciBzZXJpZXMgY292ZXIgbGV0dGVyOgoKaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwMjE5MTQwMjM5LjEzNzg3NTgtMS1tLndpbGN6
eW5za2lAc2Ftc3VuZy5jb20vCgpNaWNoYWwgV2lsY3p5bnNraSAoNCk6CiAgZHQtYmluZGluZ3M6
IGNsb2NrOiB0aGVhZDogQWRkIFRIMTUyMCBWTyBjbG9jayBjb250cm9sbGVyCiAgY2xrOiB0aGVh
ZDogQWRkIGNsb2NrIHN1cHBvcnQgZm9yIFZPIHN1YnN5c3RlbSBpbiBULUhlYWQgVEgxNTIwIFNv
QwogIGNsazogdGhlYWQ6IEFkZCBzdXBwb3J0IGZvciBjdXN0b20gb3BzIGluIENDVV9HQVRFX0NM
S19PUFMgbWFjcm8KICBjbGs6IHRoZWFkOiBBZGQgR1BVIGNsb2NrIGdhdGUgY29udHJvbCB3aXRo
IENMS0dFTiByZXNldCBzdXBwb3J0CgogLi4uL2JpbmRpbmdzL2Nsb2NrL3RoZWFkLHRoMTUyMC1j
bGstYXAueWFtbCAgIHwgIDMzICstCiBkcml2ZXJzL2Nsay90aGVhZC9jbGstdGgxNTIwLWFwLmMg
ICAgICAgICAgICAgfCAyOTggKysrKysrKysrKysrKysrKy0tCiAuLi4vZHQtYmluZGluZ3MvY2xv
Y2svdGhlYWQsdGgxNTIwLWNsay1hcC5oICAgfCAgMzQgKysKIDMgZmlsZXMgY2hhbmdlZCwgMzM0
IGluc2VydGlvbnMoKyksIDMxIGRlbGV0aW9ucygtKQoKLS0gCjIuMzQuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
