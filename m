Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DCDCCD199
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 18:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZJdTwaVZdmdTdSX1DaeK8OCPyt+l0eXBO17PsC4sU8=; b=oFd+ty1TPf2wHG
	Wj+M/hshEkuUamkQ/na38GohVCSCb4ZgDqRcLIc1epeWTMI3dMOpiwPYFt5gO2Z0u+KvvX0h09QJL
	n7hDMJm8fSl0G7it4apuWN1+250hcQV2O4uk6oUf6elxo7KjtWCadz0C51O4RJEi16tUHM0CEcySY
	wFEuOnK1HqzgzCkslDKfMvHFDnI1yaAIlINkGfUdh11q5aM4nCj7l2qZJpOIgJw2w5dtPx/6yjoAK
	nQdaozYyB5SSwqkTrR5mo8XXMK0aXZYykDfPsIswjcMYsYqonpy7jQQEeqKvcpq0kUHyKLBgI1pKe
	EucGQ1oSlwREu/eyTKEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v95u9-00000002Vlk-1oQp;
	Wed, 15 Oct 2025 18:07:17 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v95u5-00000002Vik-447Q
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 18:07:15 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251015180707euoutp026f620a73af3b0dcef724362e97967bfb~uvGCMUYaF2993129931euoutp02J
	for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 18:07:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251015180707euoutp026f620a73af3b0dcef724362e97967bfb~uvGCMUYaF2993129931euoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760551627;
	bh=1unSNZI8VVG1hZT1k2vqCzNyKxvx74sReaYy4ZaeWcg=;
	h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
	b=VPO5zguYIuPc3B21jKCzpb0qhISKYcuWR+BTY97+2WnhUCqsJUWtDKzyeMMsrWZjG
	 bmokn3srqhoHGqfKNvDbBSfI22W+K0pwXmH3SZ5rgGppmvZWTE3uTQgmKujT9pA8/k
	 +3DI6mQ+7L4Dr7MQQeowNoSnv4GyKEAVLXkpTb0M=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251015180706eucas1p2a2d2e1bcde06b30e15194fe089f1b980~uvGBhsboA1744017440eucas1p2B;
	Wed, 15 Oct 2025 18:07:06 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251015180705eusmtip1e1fd7a667aef662fa645684ccf6bfd3a~uvGAWHpMN0945709457eusmtip1P;
	Wed, 15 Oct 2025 18:07:05 +0000 (GMT)
Message-ID: <0da1d4cc-1984-4813-9265-7f10aa1542f2@samsung.com>
Date: Wed, 15 Oct 2025 20:07:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 0/7] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
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
	Drew Fustini <fustini@kernel.org>, Daniel Almeida
	<daniel.almeida@collabora.com>, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Elle Rhumsaa
	<elle@weathered-steel.dev>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Content-Language: en-US
In-Reply-To: <99a41538-ce1a-4130-a093-d0c600e63d16@samsung.com>
X-CMS-MailID: 20251015180706eucas1p2a2d2e1bcde06b30e15194fe089f1b980
X-Msg-Generator: CA
X-RootMTR: 20250930122729eucas1p2c4f1c07a4a504a59ba691b407a39420d
X-EPHeader: CA
X-CMS-RootMailID: 20250930122729eucas1p2c4f1c07a4a504a59ba691b407a39420d
References: <CGME20250930122729eucas1p2c4f1c07a4a504a59ba691b407a39420d@eucas1p2.samsung.com>
	<20250930-rust-next-pwm-working-fan-for-sending-v15-0-5661c3090877@samsung.com>
	<ayuqnx7fjfe3zwicvdbdr3qsgb4w6s2gwjt7r3m5ikzrylmium@hsrxazwelnvp>
	<99a41538-ce1a-4130-a093-d0c600e63d16@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_110714_603880_5201460B 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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

CgpPbiAxMC8xNS8yNSAxOTo1MiwgTWljaGFsIFdpbGN6eW5za2kgd3JvdGU6Cj4gCj4gCj4gT24g
MTAvMTMvMjUgMTg6NDgsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+Pgo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9wd20vcHdtX3RoMTUyMC5ycyBiL2RyaXZlcnMvcHdtL3B3bV90aDE1MjAucnMK
Pj4gaW5kZXggYzlmZDFkOGQxN2JjLi5hNTY2NjA1MmI3Y2UgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZl
cnMvcHdtL3B3bV90aDE1MjAucnMKPj4gKysrIGIvZHJpdmVycy9wd20vcHdtX3RoMTUyMC5ycwo+
PiBAQCAtMTIxLDYgKzEyMSw3IEBAIGZuIHJvdW5kX3dhdmVmb3JtX3RvaHcoCj4+ICAgICAgICAg
IHdmOiAmcHdtOjpXYXZlZm9ybSwKPj4gICAgICApIC0+IFJlc3VsdDxwd206OlJvdW5kZWRXYXZl
Zm9ybTxTZWxmOjpXZkh3Pj4gewo+PiAgICAgICAgICBsZXQgZGF0YSA9IGNoaXAuZHJ2ZGF0YSgp
Owo+PiArICAgICAgICBsZXQgc3RhdHVzID0gMDsKPj4gIAo+PiAgICAgICAgICBpZiB3Zi5wZXJp
b2RfbGVuZ3RoX25zID09IDAgewo+PiAgICAgICAgICAgICAgZGV2X2RiZyEoY2hpcC5kZXZpY2Uo
KSwgIlJlcXVlc3RlZCBwZXJpb2QgaXMgMCwgZGlzYWJsaW5nIFBXTS5cbiIpOwo+PiBAQCAtMTQx
LDE4ICsxNDIsMTMgQEAgZm4gcm91bmRfd2F2ZWZvcm1fdG9odygKPj4gICAgICAgICAgaWYgcGVy
aW9kX2N5Y2xlcyA9PSAwIHsKPj4gICAgICAgICAgICAgIGRldl9kYmchKAo+PiAgICAgICAgICAg
ICAgICAgIGNoaXAuZGV2aWNlKCksCj4+IC0gICAgICAgICAgICAgICAgIlJlcXVlc3RlZCBwZXJp
b2Qge30gbnMgaXMgdG9vIHNtYWxsIGZvciBjbG9jayByYXRlIHt9IEh6LCBkaXNhYmxpbmcgUFdN
LlxuIiwKPj4gKyAgICAgICAgICAgICAgICAiUmVxdWVzdGVkIHBlcmlvZCB7fSBucyBpcyB0b28g
c21hbGwgZm9yIGNsb2NrIHJhdGUge30gSHosIHJvdW5kaW5nIHVwLlxuIiwKPj4gICAgICAgICAg
ICAgICAgICB3Zi5wZXJpb2RfbGVuZ3RoX25zLAo+PiAgICAgICAgICAgICAgICAgIHJhdGVfaHoK
Pj4gICAgICAgICAgICAgICk7Cj4+ICAKPj4gLSAgICAgICAgICAgIHJldHVybiBPayhwd206OlJv
dW5kZWRXYXZlZm9ybSB7Cj4+IC0gICAgICAgICAgICAgICAgc3RhdHVzOiAwLAo+PiAtICAgICAg
ICAgICAgICAgIGhhcmR3YXJlX3dhdmVmb3JtOiBUaDE1MjBXZkh3IHsKPj4gLSAgICAgICAgICAg
ICAgICAgICAgZW5hYmxlZDogZmFsc2UsCj4+IC0gICAgICAgICAgICAgICAgICAgIC4uRGVmYXVs
dDo6ZGVmYXVsdCgpCj4+IC0gICAgICAgICAgICAgICAgfSwKPj4gLSAgICAgICAgICAgIH0pOwo+
PiArICAgICAgICAgICAgcGVyaW9kX2N5Y2xlcyA9IDE7Cj4+ICsgICAgICAgICAgICBzdGF0dXMg
PSAxOwoKV2VsbCBzdGF0dXMgYW5kIHBlcmlvZF9jeWNsZXMgbmVlZCB0byBiZSBtdXRhYmxlIG9i
dmlvdXNseSwgd2lsbCBjaGFuZ2UKdGhhdC4KCgpCZXN0IHJlZ2FyZHMsCi0tIApNaWNoYWwgV2ls
Y3p5bnNraSA8bS53aWxjenluc2tpQHNhbXN1bmcuY29tPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
