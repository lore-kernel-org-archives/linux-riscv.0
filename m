Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076E5C87FCA
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 14:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3z2tbuNSospCs05TdGm+todxod4Azxh0476+StDnYvA=; b=WeraCA2d6PQ9+H
	4IpRLDIf8c1US/2FDtJzfe0+UltI7Jk0Jd3ZZuzkdKhLR/vOB3QdGYGdW4TaWzJ/+J6yTuLawddBC
	3FAVEkT4HmQCwC3MBIvRmuotlkl8Vfv+uLMukcYx23dO3oj8bGBD1TSfjFKJbKQ99MOSIKIkDeWj7
	QtM0kmwTvS6oPPHEEH2H0xl70PCeDZ+c1Xt7ClMsD5cGJX0VagVIX/Z0j7opXuhCuPMry0GWTQWXW
	86gzJ2qT8RnajFafSHTxRUeqAIT9wZCiH3zVHXQsLdltQSTnIbfUb/i1XbvI1W6cbelitLFHxPRHP
	3cNv0LvqBTapIGGM8fVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJIp-0000000A0CU-1ZhP;
	Fri, 25 Jul 2025 14:21:39 +0000
Received: from relay15.mail.gandi.net ([2001:4b98:dc4:8::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJIm-0000000A0Bp-0e8X
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 14:21:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 412DE44280;
	Fri, 25 Jul 2025 14:21:31 +0000 (UTC)
Message-ID: <61532c2c-0509-49ed-bdb5-f229f0be8576@ghiti.fr>
Date: Fri, 25 Jul 2025 16:21:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] riscv: use lw instead of REG_L when reading int cpu
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Deepak Gupta <debug@rivosinc.com>
References: <20250722160556.2216925-2-rkrcmar@ventanamicro.com>
 <20250722160556.2216925-4-rkrcmar@ventanamicro.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250722160556.2216925-4-rkrcmar@ventanamicro.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekfeejiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhephffhtdefjeetgfdvhfehgefhteekkeevffehheegtedtieduheeltdegheeuleffnecuffhomhgrihhnpegvnhhtrhihrdhssgenucfkphepleehrddugedurddutddvrddukeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepleehrddugedurddutddvrddukeeipdhhvghloheplgdutddruddtrddugeeirddvudejngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeejpdhrtghpthhtoheprhhkrhgtmhgrrhesvhgvnhhtrghnrghmihgtrhhordgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehpr
 ghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepuggvsghughesrhhivhhoshhinhgtrdgtohhm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_072136_337758_61A0175E 
X-CRM114-Status: GOOD (  14.05  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDcvMjIvMjUgMTg6MDUsIFJhZGltIEtyxI1tw6HFmSB3cm90ZToKPiBSRUdfTCBpcyB3cm9u
ZywgYmVjYXVzZSB0aHJlYWRfaW5mby5jcHUgaXMgMzItYml0LCBub3QgeGxlbi1iaXQgd2lkZS4K
PiBUaGUgc3RydWN0IGN1cnJlbnRseSBoYXMgYSBob2xlIGFmdGVyIGNwdSwgc28gbGl0dGxlIGVu
ZGlhbiBhY2Nlc3Nlcwo+IHNlZW1lZCBmaW5lLgo+Cj4gRml4ZXM6IGJlOTdkMGRiNWY0NCAoInJp
c2N2OiBWTUFQX1NUQUNLIG92ZXJmbG93IGRldGVjdGlvbiB0aHJlYWQtc2FmZSIpCj4gRml4ZXM6
IDUwMzYzOGUwYmFiZiAoInJpc2N2OiBTdG9wIGVtaXR0aW5nIHByZXZlbnRpdmUgc2ZlbmNlLnZt
YSBmb3IgbmV3IHZtYWxsb2MgbWFwcGluZ3MiKQo+IFNpZ25lZC1vZmYtYnk6IFJhZGltIEtyxI1t
w6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPgo+IC0tLQo+ICAgYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9hc20uaCB8IDIgKy0KPiAgIGFyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMgICAgfCAy
ICstCj4gICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FzbS5oIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9hc20uaAo+IGluZGV4IGIzMDIyYmMyMjRlYy4uOTNiMWU0Y2UzNGQxIDEw
MDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLmgKPiArKysgYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2FzbS5oCj4gQEAgLTkxLDcgKzkxLDcgQEAKPiAgICNlbmRpZgo+ICAg
Cj4gICAubWFjcm8gYXNtX3Blcl9jcHUgZHN0IHN5bSB0bXAKPiAtCVJFR19MIFx0bXAsIFRBU0tf
VElfQ1BVKHRwKQo+ICsJbHcgICAgXHRtcCwgVEFTS19USV9DUFUodHApCj4gICAJc2xsaSAgXHRt
cCwgXHRtcCwgUEVSX0NQVV9PRkZTRVRfU0hJRlQKPiAgIAlsYSAgICBcZHN0LCBfX3Blcl9jcHVf
b2Zmc2V0Cj4gICAJYWRkICAgXGRzdCwgXGRzdCwgXHRtcAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2tlcm5lbC9lbnRyeS5TIGIvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUwo+IGluZGV4IDc1
NjU2YWZhMmQ2Yi4uNGZkZjE4N2E2MmJmIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVs
L2VudHJ5LlMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TCj4gQEAgLTQ2LDcgKzQ2
LDcgQEAKPiAgIAkgKiBhMCA9ICZuZXdfdm1hbGxvY1tCSVRfV09SRChjcHUpXQo+ICAgCSAqIGEx
ID0gQklUX01BU0soY3B1KQo+ICAgCSAqLwo+IC0JUkVHX0wgCWEyLCBUQVNLX1RJX0NQVSh0cCkK
PiArCWx3CWEyLCBUQVNLX1RJX0NQVSh0cCkKPiAgIAkvKgo+ICAgCSAqIENvbXB1dGUgdGhlIG5l
d192bWFsbG9jIGVsZW1lbnQgcG9zaXRpb246Cj4gICAJICogKGNwdSAvIDY0KSAqIDggPSAoY3B1
ID4+IDYpIDw8IDMKCgpJIHdlbnQgYWNyb3NzIHRoZSBzYW1lIGtpbmQgb2YgYnVnIGEgd2VlayBh
Z28sIHRoYW5rcyBmb3IgY2F0Y2hpbmcgdGhpcyBvbmUuCgpZb3UgY2FuIGFkZDoKClJldmlld2Vk
LWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+CgpUaG91Z2gsIHRv
IGdldCBiYWNrcG9ydGVkIHRvIHN0YWJsZSBrZXJuZWxzLCBpdCB3aWxsIGJlIGVhc2llciBpZiB5
b3UgCnNwbGl0IHRoaXMgcGF0Y2ggaW50byAyIGluZGVwZW5kZW50IHBhdGNoZXMgYXMgaXQgd2ls
bCBmYWlsIHRvIGFwcGx5IG9uIApvbGRlciByZWxlYXNlcy4gQW5kIGl0IHNob3VsZCBub3QgYmUg
ZGVwZW5kZW50IG9uIHRoZSByZW5hbWluZyBvZiAKVEFTS19USV9DUFVfTlVNLgoKUGxlYXNlIGFs
c28gYWRkOgoKQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgoKU28gdGhhdCB0aGV5IHdpbGwg
Z2V0IGJhY2twb3J0ZWQgYXV0b21hdGljYWxseS4KClRoYW5rcyBhZ2FpbiBmb3IgdGhlIGNhdGNo
LAoKQWxleAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
