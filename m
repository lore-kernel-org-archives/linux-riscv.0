Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F8F606A326
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 13:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gpy96p5E;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=TLrltDMm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UyfJBkiEdupGPHCDb49EUaKlcz3Utm/yJAb1cRRfXXQ=; b=Gpy96p5Eofc4ct5v/0IiwvwT2j
	8zkSi75VyTj3LbqSzDzlxa1FY6PwhwbKg/rsHs3+UBmqUQHLfehh7QzkHrL/8YBOk9dB4kqrVR+L8
	POAbIp93V7VBK1yleA5Qmb+FBr1h+PoIdwYtmBebnz/fY1oVD9J3VZd6uQkTTAAmOqP92EvYiEL3A
	UKpJUmjjqvuWvOEQLT8isEue5hYf0XT3vpds+uwFHr6gxusIxFDg4L1GzbF91Pf4mPdQ8ROTctf7A
	cLowJ04V+ipnME4ZKBEU8NpFgcjhofk5S/cd43+df5hQ/W0WJ69OwbUrkO5bjDMDLZVAU7QGbkhU8
	J8NKtxGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOvg-0000000FACJ-22Ow;
	Fri, 20 Nov 2026 13:45:28 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOvU-0000000FA5h-2KvW
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 13:45:26 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261120134515euoutp01e2fb228133f421a504b39b2d9996a803~pxM3hhXWt0544505445euoutp01g
	for <linux-riscv@lists.infradead.org>; Fri, 20 Nov 2026 13:45:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261120134515euoutp01e2fb228133f421a504b39b2d9996a803~pxM3hhXWt0544505445euoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795182315;
	bh=l2Yxm36V5tBhErrcCI/BN9DRDZoU36qNkjQdm2MUH7s=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=TLrltDMm3kWaPUD7IXG44TYhRGqZc1YF0/gxHWAV41SY99aLCg5Lsv4ssabfNKPqm
	 WDURxLymCHkPe1ispED7y0ERYjfxR+aX6Ez7kZ4BVeANrZ5OYrnCqxn9sZzHKfPe0z
	 NnAI73XzSbG/Nq2A106Tg+luqWqWkzmD56LLJluU=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261120134514eucas1p1b2acaadc0f7ee0c943442ea0a6a5a930~pxM3Fyaui2369923699eucas1p1_;
	Fri, 20 Nov 2026 13:45:14 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261120134513eusmtip195325329a5fb89c448a965ac7eab3801~pxM2Lxly-0213302133eusmtip1v;
	Fri, 20 Nov 2026 13:45:13 +0000 (GMT)
Message-ID: <bf228d28-c6a1-4bb0-b606-489f30eebda6@samsung.com>
Date: Fri, 20 Nov 2026 14:45:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] pwm: th1520: Fix 32-bit build with COMPILE_TEST
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, FUJITA Tomonori
	<tomo@flapping.org>
Cc: fustini@kernel.org, guoren@kernel.org, ojeda@kernel.org,
	wefu@redhat.com, a.hindborg@kernel.org, acourbot@nvidia.com,
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun@kernel.org,
	chenhan0017.work@gmail.com, dakr@kernel.org, daniel.almeida@collabora.com,
	gary@garyguo.net, linux-riscv@lists.infradead.org, lossin@kernel.org,
	tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org, FUJITA Tomonori
	<fujita.tomonori@gmail.com>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <avsZPKgzc9DIIsh8@monoceros>
X-CMS-MailID: 20261120134514eucas1p1b2acaadc0f7ee0c943442ea0a6a5a930
X-Msg-Generator: CA
X-RootMTR: 20261116145758eucas1p26d210030d9ab6b4a95fb048f061a8024
X-EPHeader: CA
X-CMS-RootMailID: 20261116145758eucas1p26d210030d9ab6b4a95fb048f061a8024
References: <20261030020209.3833766-1-tomo@flapping.org>
	<20261030020209.3833766-3-tomo@flapping.org>
	<CGME20261116145758eucas1p26d210030d9ab6b4a95fb048f061a8024@eucas1p2.samsung.com>
	<avsZPKgzc9DIIsh8@monoceros>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_054517_001258_A17688F6 
X-CRM114-Status: GOOD (  19.13  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CgpPbiAxMS8xNi8yNiAxNTo1NywgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSGVsbG8sCj4g
Cj4gT24gRnJpLCBPY3QgMzAsIDIwMjYgYXQgMTE6MDI6MDlBTSArMDkwMCwgRlVKSVRBIFRvbW9u
b3JpIHdyb3RlOgo+PiBGcm9tOiBGVUpJVEEgVG9tb25vcmkgPGZ1aml0YS50b21vbm9yaUBnbWFp
bC5jb20+Cj4+Cj4+IEZpeCB0aGUgZm9sbG93aW5nIGJ1aWxkIGVycm9yIG9uIDMyLWJpdCBBUk0g
d2l0aCBDT01QSUxFX1RFU1Q6Cj4+Cj4+ICAgRVJST1I6IG1vZHBvc3Q6IGRyaXZlcnMvcHdtL3B3
bV90aDE1MjAua286IHN5bWJvbCAnX19hZWFiaV91bGRpdm1vZCcgdW5kZWZpbmVkIQo+Pgo+PiBU
aGUgZHJpdmVyIGRpdmlkZXMgdTY0IHZhbHVlcyB3aGVuIGl0IGNvbnZlcnRzIGJldHdlZW4gbmFu
b3NlY29uZHMgYW5kCj4+IGNsb2NrIGN5Y2xlcy4gT24gMzItYml0IEFSTSwgdGhlc2UgZGl2aXNp
b25zIGFyZSBjb21waWxlZCB0byBjYWxscyB0bwo+PiBfX2FlYWJpX3VsZGl2bW9kLCB3aGljaCB0
aGUga2VybmVsIGRvZXMgbm90IHByb3ZpZGUuCj4+Cj4+IFVzZSBkaXY2NF91NjQoKSBhbmQgZGl2
NjRfdTY0X3JvdW5kX3VwKCkgZm9yIHRoZXNlIGRpdmlzaW9ucywgaW4gdGhlCj4+IHNhbWUgd2F5
IGFzIEMgZHJpdmVycyB1c2UgZGl2NjRfdTY0KCkgYW5kIERJVjY0X1U2NF9ST1VORF9VUCgpLiBU
aGUKPj4gcmVzdWx0cyBkbyBub3QgY2hhbmdlLgo+Pgo+PiBGaXhlczogM2MxODAwMDNkZmZiICgi
cHdtOiB0aDE1MjA6IEZpeCBtaXNzaW5nIEtjb25maWcgZGVwZW5kZW5jaWVzIikKPj4gUmVwb3J0
ZWQtYnk6IEFuZHJlYXMgSGluZGJvcmcgPGEuaGluZGJvcmdAa2VybmVsLm9yZz4KPj4gQ2xvc2Vz
OiBodHRwczovL3J1c3QtZm9yLWxpbnV4Lnp1bGlwY2hhdC5jb20vI25hcnJvdy9jaGFubmVsLzI5
MTU2NS1IZWxwL3RvcGljLzY0Yml0LjIwZGl2aXNpb24uMjBpbi4yMC42MHB3bV90aDE1MjAuMkVy
cy42MC9uZWFyLzYyNjgyNTU5OQo+PiBTdWdnZXN0ZWQtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1
a2xlaW5la0BrZXJuZWwub3JnPgo+PiBBc3Npc3RlZC1ieTogTExNCj4+IFNpZ25lZC1vZmYtYnk6
IEZVSklUQSBUb21vbm9yaSA8ZnVqaXRhLnRvbW9ub3JpQGdtYWlsLmNvbT4KPj4gLS0tCj4+ICBk
cml2ZXJzL3B3bS9wd21fdGgxNTIwLnJzIHwgOCArKysrKystLQo+PiAgMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvcHdtL3B3bV90aDE1MjAucnMgYi9kcml2ZXJzL3B3bS9wd21fdGgxNTIwLnJzCj4+IGluZGV4
IDcyODk5Mzk5ODQ0Ni4uYmQwNWZlNDk2NTBlIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3B3bS9w
d21fdGgxNTIwLnJzCj4+ICsrKyBiL2RyaXZlcnMvcHdtL3B3bV90aDE1MjAucnMKPj4gQEAgLTMx
LDYgKzMxLDEwIEBACj4+ICAgICAgICAgIG1lbTo6RGV2cmVzSW9NZW0sCj4+ICAgICAgICAgIElv
LCAvLwo+PiAgICAgIH0sCj4+ICsgICAgbWF0aDo6ewo+PiArICAgICAgICBkaXY2NF91NjQsCj4+
ICsgICAgICAgIGRpdjY0X3U2NF9yb3VuZF91cCwgLy8KPj4gKyAgICB9LAo+PiAgICAgIG9mLAo+
PiAgICAgIHBsYXRmb3JtLAo+PiAgICAgIHByZWx1ZGU6OiosCj4+IEBAIC02OCwxMyArNzIsMTMg
QEAgY29uc3QgZm4gdGgxNTIwX3B3bV9mcChuOiB1MzIpIC0+IHVzaXplIHsKPj4gIGZuIG5zX3Rv
X2N5Y2xlcyhuczogdTY0LCByYXRlX2h6OiB1NjQpIC0+IHU2NCB7Cj4+ICAgICAgY29uc3QgTlNF
Q19QRVJfU0VDX1U2NDogdTY0ID0gdGltZTo6TlNFQ19QRVJfU0VDIGFzIHU2NDsKPj4gIAo+PiAt
ICAgIG5zLnNhdHVyYXRpbmdfbXVsKHJhdGVfaHopIC8gTlNFQ19QRVJfU0VDX1U2NAo+PiArICAg
IGRpdjY0X3U2NChucy5zYXR1cmF0aW5nX211bChyYXRlX2h6KSwgTlNFQ19QRVJfU0VDX1U2NCkK
Pj4gIH0KPj4gIAo+PiAgZm4gY3ljbGVzX3RvX25zKGN5Y2xlczogdTMyLCByYXRlX2h6OiB1NjQp
IC0+IHU2NCB7Cj4+ICAgICAgY29uc3QgTlNFQ19QRVJfU0VDX1U2NDogdTY0ID0gdGltZTo6TlNF
Q19QRVJfU0VDIGFzIHU2NDsKPj4gIAo+PiAtICAgICh1NjQ6OmZyb20oY3ljbGVzKSAqIE5TRUNf
UEVSX1NFQ19VNjQpLmRpdl9jZWlsKHJhdGVfaHopCj4+ICsgICAgZGl2NjRfdTY0X3JvdW5kX3Vw
KHU2NDo6ZnJvbShjeWNsZXMpICogTlNFQ19QRVJfU0VDX1U2NCwgcmF0ZV9oeikKPj4gIH0KPj4g
IAo+PiAgLy8vIEhhcmR3YXJlLXNwZWNpZmljIHdhdmVmb3JtIHJlcHJlc2VudGF0aW9uIGZvciBU
SDE1MjAuCj4gCj4gRm9yIG1lIChiZWluZyBhdCBtb3N0IGhhbGYtbGl0ZXJhdGUgaW4gUnVzdCkg
aXQgbG9va3Mgb2ssIGFuZCBJJ20gZmluZQo+IHRvIGxldCB0aGlzIHBhdGNoIGdvIGluIHRvZ2V0
aGVyIHdpdGggdGhlIGZpcnN0IHBhdGNoIG9mIHRoaXMgc2VyaWVzIHZpYQo+IHRoZSBSdXN0IHRy
ZWUuCj4gCj4gQE1pY2hhbDogSWYgeW91IGhhdmUgb2JqZWN0aW9ucyBzcGVhayB1cCBxdWljayEK
PiAKPiBBY2tlZC1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJy
ZS5jb20+Cj4gCj4gQmVzdCByZWdhcmRzCj4gVXdlCgpJIHRoaW5rIHRoZSBjb2RlIGlzIGdvb2Qu
IFRoYW5rcyAhCgpSZXZpZXdlZC1ieTogTWljaGFsIFdpbGN6eW5za2kgPG0ud2lsY3p5bnNraUBz
YW1zdW5nLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
