Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CACCEFC39
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 17:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=lIK2qhWEOB0T5LTwhlsObWQWJM0hehTWJ18wFSfOJls=; b=Egv9DQVxXMjuZl
	To3DQLLnASYLk6PqSegg2gu/NcznDHH5ms1zMyIAi5iFUoovFnmCw+a5QIsb17t2YYW6sP4kbkdDr
	R4uHLIq2ePD6nKeFwOADBIzMffeIAD3hjj300poFqqKyRBEzBy2JtvbFw+jes6lnaAXSp9YdiXDM8
	Er+6X5uTZ+Zq+A+WhR55jrvy2Lr2NlhFhloINFcgCASxLurehdZeJGBiFHx29p+7KMcKmwUo5J5Ev
	yFQ+9lDuKauGQnHwgVKy0TF2mWC4Y/BJV/k2OcrHerhgoDT32y79gzXAmy0dY3Vgx8BvaSL5X9x3n
	xd6lN6+m9nRwhfubQi1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syEOL-00000006iVq-2X2N;
	Tue, 08 Oct 2024 17:53:01 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syEKe-00000006htR-0pKI
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 17:49:14 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20241008174909euoutp01a046a59cd64546e4bf4512f8f6a12dbc~8i4Jl1myi3183731837euoutp01O
	for <linux-riscv@lists.infradead.org>; Tue,  8 Oct 2024 17:49:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20241008174909euoutp01a046a59cd64546e4bf4512f8f6a12dbc~8i4Jl1myi3183731837euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1728409749;
	bh=8vrYJB8Siw9RAOlVinaG8bxKGfgftgY8netEzRiOTRc=;
	h=From:To:Cc:Subject:Date:References:From;
	b=KFeE6dY1BNR9Dg4rMIWrCCKwV+pGQQa6BJd8qDHod0+ufETt2T921spDo95uvDf56
	 VqBD19WWazc1RFNS4GW+GUOhsKlw0TEjRoDF6xkXG6afOeqSpnZnrCZgzI2mgAcyDO
	 8bk3aeB4E+cf9uLFjNzjVkG7RAwTiAQXZ9lE3WmA=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20241008174908eucas1p1c65fb2196e9986025af67b2602ae0619~8i4JLK_DL2026120261eucas1p19;
	Tue,  8 Oct 2024 17:49:08 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id 4E.2E.09624.49075076; Tue,  8
	Oct 2024 18:49:08 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20241008174907eucas1p1100fe37efdcb49cc20c5171248492fed~8i4IUrnN41985419854eucas1p14;
	Tue,  8 Oct 2024 17:49:07 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241008174907eusmtrp228ebb2c5ca0e6368bfe5b9dd3dfafc09~8i4IUAIxA2980729807eusmtrp2m;
	Tue,  8 Oct 2024 17:49:07 +0000 (GMT)
X-AuditID: cbfec7f2-bfbff70000002598-f4-67057094a608
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 88.40.19096.39075076; Tue,  8
	Oct 2024 18:49:07 +0100 (BST)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241008174906eusmtip2082484b90db97fd8aa733cecde52b13c~8i4HhAlrM2347223472eusmtip25;
	Tue,  8 Oct 2024 17:49:06 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com,
	jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, m.szyprowski@samsung.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v3 0/3] Introduce support for T-head TH1520 Mailbox
Date: Tue,  8 Oct 2024 19:48:49 +0200
Message-Id: <20241008174852.222374-1-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIKsWRmVeSWpSXmKPExsWy7djPc7pTCljTDW7M1LDY+nsWu8WaveeY
	LOYfOcdqce/SFiaLF3sbWSyurZjLbvFy1j02i8u75rBZbPvcwmax9shddov1X+czWby83MNs
	0TaL3+L/nh3sFi37p7A48Hu8efmSxeNwxxd2j52z7rJ7bFrVyeaxeUm9R8vaY0we7/ddZfPo
	27KK0eNS83V2j8+b5AK4orhsUlJzMstSi/TtErgy9izawlpwQ6xi0d9G5gbGNqEuRk4OCQET
	iYajHexdjFwcQgIrGCV272phgnC+MEr0r5vCCOF8ZpS4teYNO0zL7CUXWSASyxklDl95yQaS
	EBJ4wyix93EAiM0mYCTxYPl8VpAiEYF3jBKTrt0Gm8ss0MsoMXXvTCaQKmEBZ4n3y74xgtgs
	AqoSPzo2sILYvAJ2Emc332eCWCcvsf/gWWaIuKDEyZlPWEBsZqB489bZzCBDJQSmc0pcnDyf
	EaLBReLYnbtQtwpLvDq+BcqWkfi/cz7U0HyJB1s/MUPYNRI7e45D2dYSd879AnqHA2iBpsT6
	XfoQYUeJW++eMoGEJQT4JG68FYQ4gU9i0rbpzBBhXokOWJiqSUzt6YVbem7FNqilHhIXd71g
	hoRVrMSjhQ8YJzAqzELy2Cwkj81CuGEBI/MqRvHU0uLc9NRiw7zUcr3ixNzi0rx0veT83E2M
	wFR3+t/xTzsY5776qHeIkYmD8RCjBAezkghvxBrGdCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8
	qinyqUIC6YklqdmpqQWpRTBZJg5OqQamBOEZKfWBG41tt3cIvrXzLa2QnWJrJzXr5kvN9Kp5
	f5Ye/9jWYbBl+xYdtXYD/4Zlj2v2zfJ1VrqUxHDwR//WN1kuOxhO6119suTHtbcbGaXCTJ9t
	/rVefYFlr15ZRN+2pzGB1Wsyj3/Yd7xU5s+xd13xa1rsVJIteC/80HvmuiVPQFTk/94TX25N
	ZDjTe1C9zyzgzY2XK58f37DTT3SR/M3EDT73rc5869Ao6NiRWRvr7nlAZEs8d/q7TJM7Fr1M
	J7elLr/ewJr85YWv6PuYW43TK89f59vVsdNhkXSz/qaIvaVFO2NqLfq+eYdx2fjM6ZE82Hje
	Quehc4zs57tRDXvtj1u8XVdkduuy+hNuJZbijERDLeai4kQAu/rOLuQDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRmVeSWpSXmKPExsVy+t/xe7qTC1jTDWZ/0bDY+nsWu8WaveeY
	LOYfOcdqce/SFiaLF3sbWSyurZjLbvFy1j02i8u75rBZbPvcwmax9shddov1X+czWby83MNs
	0TaL3+L/nh3sFi37p7A48Hu8efmSxeNwxxd2j52z7rJ7bFrVyeaxeUm9R8vaY0we7/ddZfPo
	27KK0eNS83V2j8+b5AK4ovRsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1s
	UlJzMstSi/TtEvQy9izawlpwQ6xi0d9G5gbGNqEuRk4OCQETidlLLrJ0MXJxCAksZZQ4OnUV
	G0RCRuJa90sWCFtY4s+1LjaIoleMEo+WzmUHSbAJGEk8WD6fFSQhIvCHUeL6szeMIA6zwERG
	iZtz7zOCVAkLOEu8X/YNzGYRUJX40bGBFcTmFbCTOLv5PhPECnmJ/QfPMkPEBSVOznwCtJoD
	aJC6xPp5YKcyA5U0b53NPIGRfxaSqlkIVbOQVC1gZF7FKJJaWpybnltspFecmFtcmpeul5yf
	u4kRGJPbjv3csoNx5auPeocYmTgYDzFKcDArifBGrGFMF+JNSaysSi3Kjy8qzUktPsRoCnT1
	RGYp0eR8YFLIK4k3NDMwNTQxszQwtTQzVhLnZbtyPk1IID2xJDU7NbUgtQimj4mDU6qBSXOu
	2V0Tg7ijyfmJtxSyxM1LHmqG3NU5eTpK5OzcY4fYlMOYOJaemFM9fePB8pp/vzbzFaXX+F/5
	FfB2/eK98TnzWlYEJwRKpc1+kKFZyWe1yU73w3r5RZFFz0vnSy/mfpx0vi3PdN2nQN0/G87v
	erFq6sYNx75t3+NdNPPY8qeVj8rttBe+1N9xSfjUay7t6mm8lzc0RHo4RB0R0CgwsHKef3Tp
	zvkaBh+Cr4Q+1Fxep3RrDmfNRHufC8VbYx06ZU1sg1qm9PpZfZiwjGO3j87lZc3+xic2iaev
	uB40c/u2Xf9UmZxfB181jJl0S33Jvw3Fq9QOO4qkWi7+8Uf6j83BN/PME/UVJU6pcz7Uf63E
	UpyRaKjFXFScCACHylRoUgMAAA==
X-CMS-MailID: 20241008174907eucas1p1100fe37efdcb49cc20c5171248492fed
X-Msg-Generator: CA
X-RootMTR: 20241008174907eucas1p1100fe37efdcb49cc20c5171248492fed
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241008174907eucas1p1100fe37efdcb49cc20c5171248492fed
References: <CGME20241008174907eucas1p1100fe37efdcb49cc20c5171248492fed@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_104912_666124_A27184B4 
X-CRM114-Status: GOOD (  18.28  )
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

VGhlIFQtaGVhZCBUSDE1MjAgU29DIHN1cHBvcnRzIGEgaGFyZHdhcmUgbWFpbGJveCB0aGF0IGVu
YWJsZXMgdHdvIGNvcmVzCndpdGhpbiB0aGUgU29DIHRvIGNvbW11bmljYXRlIGFuZCBjb29yZGlu
YXRlIFsxXS4gT25lIGV4YW1wbGUgb2Ygc3VjaApjb29yZGluYXRpb24gd291bGQgYmUgY29vcGVy
YXRpb24gd2l0aCB0aGUgVC1IZWFkIEU5MDIgY29yZSwgd2hpY2ggaXMKcmVzcG9uc2libGUgZm9y
IHBvd2VyLCBjbG9jaywgYW5kIHJlc291cmNlIG1hbmFnZW1lbnQuIEZvciBleGFtcGxlLCBpbgp0
aGUgc3BlY2lmaWMgY2FzZSBvZiB0aGUgQlhNLTQtNjQgR1BVLCBpdCBuZWVkcyB0byBiZSBwb3dl
cmVkIG9uIGJ5IHRoZQpFOTAyIGNvcmUsIGFuZCB0aGUga2VybmVsIHJ1bm5pbmcgb24gdGhlIEU5
MTAgbmVlZHMgdG8gJ2FzaycgdGhlCmZpcm13YXJlIHJ1bm5pbmcgb24gdGhlIEU5MDIgY29yZSB0
byBlbmFibGUgcG93ZXIgdG8gdGhlIEdQVSBpc2xhbmQuCkdpdmVuIHJlY2VudCBhZHZhbmNlbWVu
dHMgaW4gd29yayBvbiB0aGUgdXBzdHJlYW0gR1BVIGRyaXZlciBbMl0sIHRoZXJlCmlzIGFuIGVt
ZXJnaW5nIG5lZWQgdG8gZ2V0IHRoaXMgY29kZSBpbiB0aGUgbWFpbmxpbmUga2VybmVsLgoKTGlu
azogaHR0cHM6Ly9vcGVuYmVhZ2xlLm9yZy9iZWFnbGV2LWFoZWFkL2JlYWdsZXYtYWhlYWQvLS9i
bG9iL21haW4vZG9jcy9USDE1MjAlMjBTeXN0ZW0lMjBVc2VyJTIwTWFudWFsLnBkZiBbMV0KTGlu
azogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2ltYWdpbmF0aW9uL2xpbnV4LWZpcm13
YXJlLy0vaXNzdWVzLzEgWzJdCgpUaGFua3MsIEtyenlzenRvZiBhbmQgUm9iLCBmb3IgeW91ciBy
ZXZpZXchIFNpbmNlIHRoaXMgc2VyaWVzIGlzIGdhaW5pbmcKc29tZSBpbnRlcmVzdCwgSSdtIGRy
b3BwaW5nIHRoZSBSRkMgcHJlZml4IHdpdGggdGhpcyB2MyB1cGRhdGUuCgp2MzoKLSBhZGRlZCBh
IGNvbW1lbnQgYWJvdXQgbWl4aW5nIGRldm1fIGFuZCBub24tZGV2bSByZXNvdXJjZXMgaW4gdGhl
IGNvbnRleHQKICBvZiBzaGFyZWQgaW50ZXJydXB0cyBhbmQgZXhwbGFpbmVkIHdoeSBpdCdzIHNh
ZmUgdG8gZG8gc28gaW4gdGhpcwogIHBhcnRpY3VsYXIgY2FzZQotIGNoYW5nZWQgdGhlIG9yZGVy
IG9mIHJlc291cmNlIGZyZWVpbmcgaW4gdGhlIC5zaHV0ZG93biBjYWxsYmFjawotIHVzZWQgYSB3
cmFwcGVyIGZ1bmN0aW9uIGZvciByZWdpc3RlciBtYXBwaW5nCi0gc2luY2UgdGhlIG9ubHkgY29u
Y2VpdmFibGUgdXNlIGNhc2UgZm9yIHRoaXMgbWFpbGJveCBkcml2ZXIgaXMKICBjb21tdW5pY2F0
aW9uIHdpdGggY29yZXMgbm90IG1hbmFnZWQgYnkgdGhlIGtlcm5lbCwgSeKAmXZlIGhhcmQtY29k
ZWQKICB0aGlzIGJ5IHJlbW92aW5nIHRoZSB0aGVhZCxpY3UtY3B1LWlkIHByb3BlcnR5IGFuZCBh
ZGp1c3RlZCB0aGUgbWFpbGJveAogIGRyaXZlciBjb2RlIGFjY29yZGluZ2x5LgotIGFkZGVkIGEg
bW9yZSBkZXRhaWxlZCBkZXNjcmlwdGlvbiBmb3IgbWJveC1jZWxscy4KLSBtYWRlIHNvbWUgY29z
bWV0aWMgY2hhbmdlcy4KLSByZXRlc3RlZCBieSBhcHBseWluZyB0aGUgcGF0Y2ggd2l0aCBub24t
eWV0LXVwc3RyZWFtZWQgcGF0Y2hlcywKICBjb25maXJtaW5nIHRoYXQgdGhlIGRybS9pbWFnaW5h
dGlvbiBkcml2ZXIgY2FuIHJlYWQgdGhlIHJlZ2lzdGVycwogIGNvcnJlY3RseS4KCnYyOgogLSBm
aXhlZCB0aGVhZCx0aDE1MjAtbWJveC55YW1sIGJpbmRpbmcgZmlsZSBieSBkcm9wcGluZyByZWR1
bmRhbnQKICAgZGVzY3JpcHRpb25zLCByZW5hbWluZyByZWctbmFtZXMsIHJlbW92aW5nIHVubmVj
ZXNzYXJ5IGNsb2NrcywKICAgcHJvdmlkaW5nIGNvbnN0cmFpbnRzIGFuZCBkZWZpbmluZyBJQ1Un
cwogLSBmaXhlZCB0aGUgbWFpbGJveCBkcml2ZXIgY29kZSB0byB3b3JrIHdlbGwgd2l0aCB1cGRh
dGVkIGJpbmRpbmctZmlsZSwKICAgcmVtb3ZlZCBjbG9ja3Mgc3VwcG9ydCwgYXMgaXQncyBub3Qg
bmVjZXNzYXJ5IGZvciBtYWlsYm94IHRvIHdvcmsKIC0gYWRqdXN0ZWQgdGhlIGRldmljZSB0cmVl
IG5vZGUgaW5zdGFuY2Ugb2YgbWJveF85MTB0IHNvIGl0IHdpbGwgd29yawogICB3aXRoIHVwZGF0
ZWQgYmluZGluZ3MgZmlsZQoKTWljaGFsIFdpbGN6eW5za2kgKDMpOgogIG1haWxib3g6IEludHJv
ZHVjZSBzdXBwb3J0IGZvciBULWhlYWQgVEgxNTIwIE1haWxib3ggZHJpdmVyCiAgZHQtYmluZGlu
Z3M6IG1haWxib3g6IEFkZCB0aGVhZCx0aDE1MjAtbWFpbGJveCBiaW5kaW5ncwogIHJpc2N2OiBk
dHM6IHRoZWFkOiBBZGQgbWFpbGJveCBub2RlCgogLi4uL2JpbmRpbmdzL21haWxib3gvdGhlYWQs
dGgxNTIwLW1ib3gueWFtbCAgIHwgIDgxICsrKwogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICAyICsKIGFyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgx
NTIwLmR0c2kgICAgICAgICB8ICAxMiArCiBkcml2ZXJzL21haWxib3gvS2NvbmZpZyAgICAgICAg
ICAgICAgICAgICAgICAgfCAgMTAgKwogZHJpdmVycy9tYWlsYm94L01ha2VmaWxlICAgICAgICAg
ICAgICAgICAgICAgIHwgICAyICsKIGRyaXZlcnMvbWFpbGJveC9tYWlsYm94LXRoMTUyMC5jICAg
ICAgICAgICAgICB8IDU3NiArKysrKysrKysrKysrKysrKysKIDYgZmlsZXMgY2hhbmdlZCwgNjgz
IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWFpbGJveC90aGVhZCx0aDE1MjAtbWJveC55YW1sCiBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9tYWlsYm94L21haWxib3gtdGgxNTIwLmMKCi0tIAoyLjM0LjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
