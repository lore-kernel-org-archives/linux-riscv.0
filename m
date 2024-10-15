Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B46D1F9D8
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2024 22:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jeR5Oz/ptDIKdm5ALi747/Vey09VqJ+YUrqtgt0HFpg=; b=Uex5HtpesUwJKd
	oaAvCpguhYvfacQVRfaEWSHguum3/MuM3pkjm1ynAXXq5B2bPH+E8z7QRdO0b/HWTJv/XuW7n7To2
	4BXSR57NggAzaANZPuyc1p/KQpv7mup84tVq0FQWLHc7i7j0xg65vS16wM85LB8YUI4cnzclvDypf
	cSPu/Mh8i0wKPgIFzi7ss5sgDGN826WE1XRuhM31hldlePfGufmfNLEuJgMj58TabokDMHg6c7WOj
	rWNjWihSdZZJJV+AZWgKuW2FNXAx1XePbbfGv06zIDLOURGFgJOK5HBZa4dCPwCG5nOp6t3dNtGO+
	JQlawGXzqudcFBKbn62A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0pdO-00000009kMX-0QhP;
	Tue, 15 Oct 2024 22:03:18 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0pdK-00000009kK1-147g
	for linux-riscv@lists.infradead.org;
	Tue, 15 Oct 2024 22:03:16 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20241015220308euoutp01cbfccd051b648ec4e14fe034c21e13b8~_v26E70rg2795927959euoutp01p
	for <linux-riscv@lists.infradead.org>; Tue, 15 Oct 2024 22:03:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20241015220308euoutp01cbfccd051b648ec4e14fe034c21e13b8~_v26E70rg2795927959euoutp01p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1729029788;
	bh=berGr2Vz+quvHhU94cieaPOMw7ZLSoJJPu/DfSCrFwA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=dimTcLVVYiwf1sGwqydPSfD2/KvfDQsDrVzHmHrKO1YX9sPYEMpeQQji3MAT0I99M
	 rWEJRzblQDDdL5KPHWi9aeiO62CBFD9iCjVRXmBTUwZUl2q4FSXS1c65gW2PBGQ72j
	 CEEx7V4zdy8y2VktdJAWsa3y+DLZOEiV4tqtbFUc=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20241015220307eucas1p2a2ee3bd214c61cd1582c6d207f03c2c4~_v25mgj8n2506925069eucas1p2o;
	Tue, 15 Oct 2024 22:03:07 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 31.B2.20409.B96EE076; Tue, 15
	Oct 2024 23:03:07 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20241015220306eucas1p11669db132104dae39c26c62c142666a4~_v24wWv6P1111111111eucas1p11;
	Tue, 15 Oct 2024 22:03:06 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241015220306eusmtrp2c3be41633a0c7190151f52768bab8825~_v24vtWFK2618226182eusmtrp2i;
	Tue, 15 Oct 2024 22:03:06 +0000 (GMT)
X-AuditID: cbfec7f4-c39fa70000004fb9-ce-670ee69b05b6
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id B0.31.19654.A96EE076; Tue, 15
	Oct 2024 23:03:06 +0100 (BST)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241015220306eusmtip1d7286bf674401982c74a13516a1b7a70~_v23-srmZ0557905579eusmtip1h;
	Tue, 15 Oct 2024 22:03:06 +0000 (GMT)
Message-ID: <431e98cd-6c53-4478-86a6-e532be4ed58e@samsung.com>
Date: Wed, 16 Oct 2024 00:03:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Introduce support for T-head TH1520 Mailbox
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com,
	jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, m.szyprowski@samsung.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <Zw1jdl64f5l8N+Km@x1>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAKsWRmVeSWpSXmKPExsWy7djP87qzn/GlG2x/qG+x9fcsdos1e88x
	Wcw/co7V4sCeEot7l7YwWbzY28hicW3FXHaLl7PusVlc3jWHzWLb5xY2i7VH7gLFLvcwW7TN
	4rf4v2cHu0XL/iksDvweb16+ZPE43PGF3WPnrLvsHptWdbJ5bF5S79Gy9hiTx/t9V9k8+ras
	YvS41Hyd3WN6xzN2j8+b5AK4o7hsUlJzMstSi/TtErgyzi95wlwwT7hiQ9sP1gbG7/xdjJwc
	EgImEic3H2DsYuTiEBJYwShxY/N5dgjnC6PE1XnNTBDOZ0aJ5xfussO0bGk5wwKRWM4osX/1
	O6j+t4wSmxedYOti5ODgFbCTuPlCGKSBRUBVYurt3cwgNq+AoMTJmU9YQGxRAXmJ+7dmgA0V
	FnCX+HXyEVhcREBbYufpxWALmAXOMkmsnbANrIhZQFzi1pP5TCA2m4CRxIPl81lBbE4BJYmn
	i9+xQdTISzRvnc0M0iwhcJhT4tf0vUwQZ7tIzNq3lRnCFpZ4dXwL1DsyEv93zoeqyZd4sPUT
	VE2NxM6e41C2tcSdc7/AHmMW0JRYv0sfIuwosWTGbCaQsIQAn8SNt4IQJ/BJTNo2nRkizCvR
	0SYEUa0mMbWnF27puRXbmCYwKs1CCpVZSJ6cheSZWQh7FzCyrGIUTy0tzk1PLTbKSy3XK07M
	LS7NS9dLzs/dxAhMhKf/Hf+yg3H5q496hxiZOBgPMUpwMCuJ8E7q4k0X4k1JrKxKLcqPLyrN
	SS0+xCjNwaIkzquaIp8qJJCeWJKanZpakFoEk2Xi4JRqYNr6ZkmTwFGpfXKnmMQudbL8fLN0
	8o5g7Zf3NDcd3dLLPFH99zHtN98rve/OPSXkGyHzV2VFjGXtwvUfAnKU0x/Lm4sYzPz/uy/x
	z7a5pyu1LrZ8KHy9erXh2t/pGUkz79ltmPJDPitwb/lW73nJT496vamf5LunLLEte+fz7kuV
	j3N/fPtSssOHW++xp0iFRv0EifW31HNFpry3LNWZHf9o17TeFM3Wr07Zl6IdN2md8Nycf/5V
	ySrHCRMW7FgcucDiiJ1K76vFZzusS52Uk44yT7zJqHp3p82V2efN5sls3a7ssmlV1DLWqp3T
	Q00eFrMfCfi8//7di9eqLvZ3zNqh/497ibGJ4cTaC5JbH9ukKbEUZyQaajEXFScCAPxU71Lz
	AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrEIsWRmVeSWpSXmKPExsVy+t/xu7qznvGlGyztNbTY+nsWu8WaveeY
	LOYfOcdqcWBPicW9S1uYLF7sbWSxuLZiLrvFy1n32Cwu75rDZrHtcwubxdojd4Fil3uYLdpm
	8Vv837OD3aJl/xQWB36PNy9fsngc7vjC7rFz1l12j02rOtk8Ni+p92hZe4zJ4/2+q2wefVtW
	MXpcar7O7jG94xm7x+dNcgHcUXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK
	+nY2Kak5mWWpRfp2CXoZ55c8YS6YJ1yxoe0HawPjd/4uRk4OCQETiS0tZ1i6GLk4hASWMkr0
	X7rOApGQkbjW/RLKFpb4c62LDaLoNaPEsilP2bsYOTh4Bewkbr4QBqlhEVCVmHp7NzOIzSsg
	KHFy5hOwXlEBeYn7t2awg9jCAu4Sv04+AouLCGhL7Dy9GGwxs8BZJoltm99CXbGSUeL9l6+s
	IFXMAuISt57MZwKx2QSMJB4snw8W5xRQkni6+B0byBHMAuoS6+cJQZTLSzRvnc08gVFoFpI7
	ZiGZNAuhYxaSjgWMLKsYRVJLi3PTc4uN9IoTc4tL89L1kvNzNzECI3/bsZ9bdjCufPVR7xAj
	EwfjIUYJDmYlEd5JXbzpQrwpiZVVqUX58UWlOanFhxhNgWExkVlKNDkfmHrySuINzQxMDU3M
	LA1MLc2MlcR52a6cTxMSSE8sSc1OTS1ILYLpY+LglGpgSgx2uvdshQ2f7Z0dqnnJ89/rXnde
	JTHTq7lP22x+k3nKlLtrUn8yNnNo9cgIe/5xvjA5fd7W1Q1H17qVCafsVtqzTaRGWFlGW7hp
	44R6XcVPZYvsOb7PvbQrqk/a2djOdOfTAKEgNoOfK7kaD5zIbO99cGCnWOTC1LYJzMHHnB9/
	NLSxttwi7Bv5a7XgfQbmlUrznTTvC+QWmO08JZiw4F74SbWnGsWV/Je+nvTZdNiqLTWEJT1F
	sC7a/PU/I2sGlRT1vZ6rGE2+v1j0Mf/nuZwJWnbRfsd/aHz8vyTYPaax9deBbe16sX/8b75m
	05ZTOyY5+eVr0zdPCqcr7n9gdnhai3PiZXUhZuWi3zpKLMUZiYZazEXFiQAut+0LhQMAAA==
X-CMS-MailID: 20241015220306eucas1p11669db132104dae39c26c62c142666a4
X-Msg-Generator: CA
X-RootMTR: 20241014123409eucas1p2a3a3f085c0630073326ca299a870f3ee
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241014123409eucas1p2a3a3f085c0630073326ca299a870f3ee
References: <CGME20241014123409eucas1p2a3a3f085c0630073326ca299a870f3ee@eucas1p2.samsung.com>
	<20241014123314.1231517-1-m.wilczynski@samsung.com> <Zw1jdl64f5l8N+Km@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_150314_709731_4C821EA9 
X-CRM114-Status: GOOD (  23.06  )
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

CgpPbiAxMC8xNC8yNCAyMDozMSwgRHJldyBGdXN0aW5pIHdyb3RlOgo+IE9uIE1vbiwgT2N0IDE0
LCAyMDI0IGF0IDAyOjMzOjExUE0gKzAyMDAsIE1pY2hhbCBXaWxjenluc2tpIHdyb3RlOgo+PiBU
aGUgVC1oZWFkIFRIMTUyMCBTb0Mgc3VwcG9ydHMgYSBoYXJkd2FyZSBtYWlsYm94IHRoYXQgZW5h
YmxlcyB0d28gY29yZXMKPj4gd2l0aGluIHRoZSBTb0MgdG8gY29tbXVuaWNhdGUgYW5kIGNvb3Jk
aW5hdGUgWzFdLiBPbmUgZXhhbXBsZSBvZiBzdWNoCj4+IGNvb3JkaW5hdGlvbiB3b3VsZCBiZSBj
b29wZXJhdGlvbiB3aXRoIHRoZSBULUhlYWQgRTkwMiBjb3JlLCB3aGljaCBpcwo+PiByZXNwb25z
aWJsZSBmb3IgcG93ZXIsIGNsb2NrLCBhbmQgcmVzb3VyY2UgbWFuYWdlbWVudC4gRm9yIGV4YW1w
bGUsIGluCj4+IHRoZSBzcGVjaWZpYyBjYXNlIG9mIHRoZSBCWE0tNC02NCBHUFUsIGl0IG5lZWRz
IHRvIGJlIHBvd2VyZWQgb24gYnkgdGhlCj4+IEU5MDIgY29yZSwgYW5kIHRoZSBrZXJuZWwgcnVu
bmluZyBvbiB0aGUgRTkxMCBuZWVkcyB0byAnYXNrJyB0aGUKPj4gZmlybXdhcmUgcnVubmluZyBv
biB0aGUgRTkwMiBjb3JlIHRvIGVuYWJsZSBwb3dlciB0byB0aGUgR1BVIGlzbGFuZC4KPj4gR2l2
ZW4gcmVjZW50IGFkdmFuY2VtZW50cyBpbiB3b3JrIG9uIHRoZSB1cHN0cmVhbSBHUFUgZHJpdmVy
IFsyXSwgdGhlcmUKPj4gaXMgYW4gZW1lcmdpbmcgbmVlZCB0byBnZXQgdGhpcyBjb2RlIGluIHRo
ZSBtYWlubGluZSBrZXJuZWwuCj4+Cj4+IExpbms6IGh0dHBzOi8vcHJvdGVjdDIuZmlyZWV5ZS5j
b20vdjEvdXJsP2s9MjAyMWQyNTYtN2ZiZGZiN2MtMjAyMDU5MTktMDAwYmFiZTU5OGY3LWNhNjU0
ZDFhOWJjODY2YWMmcT0xJmU9MTFlOTczNTUtZTZlOS00YWFjLWE5OTYtY2M0NzUxNTZiM2M4JnU9
aHR0cHMlM0ElMkYlMkZvcGVuYmVhZ2xlLm9yZyUyRmJlYWdsZXYtYWhlYWQlMkZiZWFnbGV2LWFo
ZWFkJTJGLSUyRmJsb2IlMkZtYWluJTJGZG9jcyUyRlRIMTUyMCUyNTIwU3lzdGVtJTI1MjBVc2Vy
JTI1MjBNYW51YWwucGRmIFsxXQo+PiBMaW5rOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5v
cmcvaW1hZ2luYXRpb24vbGludXgtZmlybXdhcmUvLS9pc3N1ZXMvMSBbMl0KPj4KPj4gVGhhbmtz
LCBLcnp5c3p0b2YgYW5kIFJvYiwgZm9yIHlvdXIgcmV2aWV3ISBTaW5jZSB0aGlzIHNlcmllcyBp
cyBnYWluaW5nCj4+IHNvbWUgaW50ZXJlc3QsIEkndmUgZHJvcHBlZCB0aGUgUkZDIHByZWZpeCB3
aXRoIHRoZSB2MyB1cGRhdGUuCj4gCj4gSSd2ZSBhcHBsaWVkIHRoaXMgc2VyaWVzIGFuZCBib290
ZWQgb2theS4gSSBzZWUgdGhlIGRyaXZlciBsb2FkZWQ6Cj4gCj4gIC9zeXMvZGV2aWNlcy9wbGF0
Zm9ybS9zb2MvZmZmZmMzODAwMC5tYWlsYm94L2RyaXZlciBwb2ludHMgdG8KPiAgL3N5cy9idXMv
cGxhdGZvcm0vZHJpdmVycy90aDE1MjAtbWJveAo+IAo+IEhvdyBkbyB5b3UgdGVzdCB0aGF0IHRo
ZSBjb21tdW5pY2F0aW9uIHdpdGggdGhlIEU5MDIgaXMgd29ya2luZwo+IGNvcnJlY3RseT8KClRo
YW5rIHlvdSBmb3IgeW91ciBpbnRlcmVzdC4gVG8gdGVzdCB0aGlzLCBJJ3ZlIHByZXBhcmVkIGEg
ZGlmZiB0aGF0CmluY2x1ZGVzIHRoZSBtaXNzaW5nIGRyaXZlcnMgdXRpbGl6aW5nIHRoZSBtYWls
Ym94IGFuZCBlbmFibGVkIHRoZSBHUFUKbm9kZSBpbiB0aGUgZGV2aWNlIHRyZWUgdG8gdXNlIHRo
ZSBkcm0vaW1hZ2luYXRpb24gZHJpdmVyLgoKSSd2ZSBvYnNlcnZlZCB0aGF0IHdoZW4gdGhlIHBv
d2VyIHdhcyB0dXJuZWQgb2ZmIHRocm91Z2ggdGhlIEU5MDIgY29yZQp1c2luZyB0aGUgbWFpbGJv
eCwgdGhlIGRybS9pbWFnaW5hdGlvbiBkcml2ZXIgd291bGQgaGFuZyBpbgpwdnJfbG9hZF9ncHVf
aWQoKSB3aGlsZSBhdHRlbXB0aW5nIHRvIHJlYWQgaXRzIEJWTkMgZnJvbSB0aGUgcmVnaXN0ZXIu
Ckhvd2V2ZXIsIHdoZW4gdGhlIEdQVSB3YXMgdHVybmVkIG9uIHZpYSB0aGUgbWFpbGJveCwgdGhl
IEJWTkMgY291bGQgYmUKcmVhZCBjb3JyZWN0bHkuIFN0aWxsLCB0aGUgZmlybXdhcmUgZmFpbHMg
dG8gYm9vdCBkdWUgdG8gc29tZSBtaXNzaW5nCnByb2dyYW1taW5nIGluIHRoZSBkcm0vaW1hZ2lu
YXRpb24gZHJpdmVyLCB3aGljaCBpcyBjdXJyZW50bHkgYmVpbmcKd29ya2VkIG9uLiBJJ3ZlIGJy
aWVmbHkgZXhwbGFpbmVkIHRoaXMgaW4gdGhlIGZpcnN0IGNvbW1pdCBvZiB0aGlzCnNlcmllcy4K
CklmIHlvdSdkIGxpa2UgdG8gdHJ5IHRoaXMgeW91cnNlbGYsIEknZCBiZSBoYXBweSB0byBwdXNo
IHRoZXNlIHNldHVwcyB0bwphIEdpdEh1YiByZXBvc2l0b3J5IGFuZCBwcm92aWRlIHlvdSB3aXRo
IGEgbGluaywgc28geW91IGNhbiBzZWUgdGhlCnNldHVwIGluIGFjdGlvbi4KCk1pY2hhxYIKCj4g
Cj4gVGhhbmtzLAo+IERyZXcKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
