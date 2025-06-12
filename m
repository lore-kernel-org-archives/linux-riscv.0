Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D1DC71136
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 19:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qWyheXGMAHlx0zDP3z2bXviQ1MdmyhJKTdO4SAAron8=; b=R0+eIQ/h/kBlmH
	BFmuB73gG8BPPtTLwl//ASTXeY9DUlhHqfQ58bZskDMhV1Rc+ulMGKlmLHRag4Kwst8kiJ+8SurJY
	1CLs8SnyU/Cj2YnAeodUsYi6rXU/V3kvtX003rJj9a8np+2UIx797hKt9JtNp1A3qz5NkNTLomxtE
	ZfI/lBg48axw/qx+CGqBDaOrxK8DgmiChVjOqG4EHMKG+NLOZH0qA0StTHn8dx+ln/XAPvEiWpl3k
	WPP+AUHr3p1tFlCK368jmtF0VHmBRjK5JlFBuyef1m6gf1vmL688j4DUpKGGoZLVQUetcY1HdmxbG
	sVUlC3lc2XQ4OMOm1O1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnoW-0000000EG17-2nfM;
	Thu, 12 Jun 2025 19:42:16 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhxc-0000000DS9N-0C2l
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 13:27:19 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250612132711euoutp01ae3db1a1e4aa1befe933b5ea3c8e317d~ITo8hvhzs2699826998euoutp01s
	for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 13:27:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250612132711euoutp01ae3db1a1e4aa1befe933b5ea3c8e317d~ITo8hvhzs2699826998euoutp01s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749734831;
	bh=PULRw5otkpn6GT9WVK7m+LoEccaSTbNn1hjyoEzOiIs=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=sPGRr+z2ur+bCTBoTcTgQVxnXmb7gi6E81zBmw7KTB7claBBvZP2yiSQNZjGqkhN6
	 rRi3iBqaHAjgiI+sRYUF4djYyIpDo5K5JdGsUjiIuDsd/zyvKWajf5HspToXVJkZ82
	 S3IUbBLGfDCQTqTwgtap9+CxgZr6aPdbd2qMQANY=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250612132711eucas1p1db84d1c02a89f07e7346dec9dc6c48e8~ITo75vBrM2197421974eucas1p1Q;
	Thu, 12 Jun 2025 13:27:11 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250612132709eusmtip2f714daf4dd428c2679068f9872962dc7~ITo6trRkm1234712347eusmtip23;
	Thu, 12 Jun 2025 13:27:09 +0000 (GMT)
Message-ID: <b3252042-e7fd-4ac9-a4ad-0226d21fd477@samsung.com>
Date: Thu, 12 Jun 2025 15:27:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Drew Fustini
	<drew@pdp7.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
	Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Guo Ren
	<guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
	Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
	Ghiti <alex@ghiti.fr>, Marek Szyprowski <m.szyprowski@samsung.com>, Benno
	Lossin <lossin@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <t26bhukukjzy7e4d2omtvjchxxzlnfyx54ku7xbytcnxkuk7xk@6tap2t3z2oaq>
X-CMS-MailID: 20250612132711eucas1p1db84d1c02a89f07e7346dec9dc6c48e8
X-Msg-Generator: CA
X-RootMTR: 20250610125330eucas1p2a573627ca8f124fe11e725c2d75bdcc9
X-EPHeader: CA
X-CMS-RootMailID: 20250610125330eucas1p2a573627ca8f124fe11e725c2d75bdcc9
References: <CGME20250610125330eucas1p2a573627ca8f124fe11e725c2d75bdcc9@eucas1p2.samsung.com>
	<20250610-rust-next-pwm-working-fan-for-sending-v2-0-753e2955f110@samsung.com>
	<aEifXZnLxKd2wa0w@x1> <6ca6016e-3b17-48a0-ad8d-bb05317aa100@samsung.com>
	<aEoWtviFl0vYATXe@x1>
	<t26bhukukjzy7e4d2omtvjchxxzlnfyx54ku7xbytcnxkuk7xk@6tap2t3z2oaq>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_062717_473444_AC8C8CE6 
X-CRM114-Status: GOOD (  15.44  )
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

CgpPbiA2LzEyLzI1IDA3OjAxLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBIZWxsbyBEcmV3
LAo+IAo+IE9uIFdlZCwgSnVuIDExLCAyMDI1IGF0IDA0OjUyOjIyUE0gLTA3MDAsIERyZXcgRnVz
dGluaSB3cm90ZToKPj4gSSBhbHNvIGVuYWJsZWQgdGhlIHB3bSBmYW4gZHJpdmVyLiBIb3dldmVy
LCB0aGVyZSBpcyBhIHByb2JlIGZhaWx1cmU6Cj4+Cj4+IFsgICAgMS4yNTA5MjFdIHB3bS1mYW4g
cHdtLWZhbjogRmFpbGVkIHRvIGNvbmZpZ3VyZSBQV006IC01MjQKPj4gWyAgICAxLjI1NjU0Nl0g
cHdtLWZhbiBwd20tZmFuOiBwcm9iZSB3aXRoIGRyaXZlciBwd20tZmFuIGZhaWxlZCB3aXRoIGVy
cm9yIC01MjQKPiAKPiA1MjQgPSBFTk9UU1VQUCwgc28gaXQgc2VlbXMgdGhlIHJlcXVlc3QgaGFk
IGR1dHlfb2Zmc2V0ID4gMC4gRG9lcyB5b3VyCj4gZmFuIHVzZSBQV01fUE9MQVJJVFlfSU5WRVJU
RUQ/IElmIHNvLCB0cnkgd2l0aG91dCB0aGF0IGZsYWcuIElmIHlvdXIgZmFuCj4gcmVhbGx5IG5l
ZWRzIGFuIGludmVydGVkIFBXTSB0aGlzIG9mIGNvdXJzZSBtYWtlcyBmYW4gY29udHJvbCBidWdn
eS4KPiBXaXRoIHRoZSBuZXh0IHJldmlzaW9uIGl0IHNob3VsZCB3b3JrIGZpbmUgKGFzIGEgZHV0
eV9vZmZzZXQgPiAwIHNob3VsZAo+IGdldCByb3VuZGVkIGRvd24gdG8gMCkuCgpTaW5jZSB3ZSdy
ZSBydW5uaW5nIHRoZSBzYW1lIERULCB0aGUgcG9sYXJpdHkgc2hvdWxkbid0IGJlIGludmVydGVk
LiBJCnNlZSB5b3UgaGF2ZSBDT05GSUdfUFdNX0RFQlVHPXkgZW5hYmxlZCwgd2hpY2ggaXMgbW9z
dCBsaWtlbHkgdGhlIHJlYXNvbgp0aGUgcHJvYmUgZmFpbHMuCgpXaXRoIHRoYXQgb3B0aW9uLCB0
aGUgZm9sbG93aW5nIGNoZWNrIGlzIHBlcmZvcm1lZCBpbiBfX3B3bV9hcHBseToKCmlmIChJU19F
TkFCTEVEKENPTkZJR19QV01fREVCVUcpKSB7CglzdHJ1Y3QgcHdtX3dhdmVmb3JtIHdmX3JvdW5k
ZWQ7CgoJCWVyciA9IF9fcHdtX3JvdW5kX3dhdmVmb3JtX2Zyb21odyhjaGlwLCBwd20sICZ3Zmh3
LCAmd2Zfcm91bmRlZCk7CgkJaWYgKGVycikKCQkJcmV0dXJuIGVycjsKCkluIHRoaXMgcmV2aXNp
b24gb2YgdGhlIGRyaXZlciwgSSBoYXZlIG5vdCBpbXBsZW1lbnRlZCB0aGUgcmVhZC13YXZlZm9y
bQpjYWxsYmFja3MsIHNvIHRoZSBSdXN0IFBXTSBhYnN0cmFjdGlvbnMgY29ycmVjdGx5IHJldHVy
biAtRU5PVFNVUFAuCgpVd2UsIHRoaXMgcG9zZXMgYSBwcm9ibGVtLCBhcyByZWFkaW5nIGZyb20g
dGhlIGR1dHkgYW5kIHBlcmlvZCByZWdpc3RlcnMKb24gdGhlIFRIMTUyMCBTb0MncyBQV00gY29u
dHJvbGxlciBhcHBlYXJzIHRvIGJlIGJyb2tlbi4KCgo+IAo+IEJlc3QgcmVnYXJkcwo+IFV3ZQoK
QmVzdCByZWdhcmRzLAotLSAKTWljaGFsIFdpbGN6eW5za2kgPG0ud2lsY3p5bnNraUBzYW1zdW5n
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
