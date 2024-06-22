Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22187C27C4F
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jun 2024 00:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X+pUAjGMCf4LTKT1um6B+EbJnyl6vqF2Bw2swUtyFhE=; b=iK8q8/CvCt/mtv
	lvuPRQAZmfX8AYKw+cJyVBz8Uq8ZieqZjHqXd6VnquvsayiFdiH4Ifnjkgptw42PDlOx57iFxRlja
	9AxPL3TqQbRG81ofr8gNTmajFtJccHHifS//uEP3jozw8XKd27oPK6co7zFqMWepmZ+MeqW8LFU0P
	1GtpccW8Z2JUQZkESP6kUBRE2OrTStX1dnor4FQ5rIca4InIItiL4rJf9YjzmgTbvru97Q39Ey2/2
	fUO/My2PZixq0K2v3QOJO8IsZvh10OkBFW8Ql/s0cwoG76Y/BF50BTRDG+Elixr8eO7cKh9cvkXTE
	vsPWGqELTLgxi97jWfiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKp6E-0000000B5G9-3XRq;
	Sat, 22 Jun 2024 00:59:26 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKp6A-0000000B5FO-41e3
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jun 2024 00:59:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 57D8DCE2D98;
	Sat, 22 Jun 2024 00:59:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7ECC2BBFC;
	Sat, 22 Jun 2024 00:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719017956;
	bh=FQ1S0HDz0vGglXBuV05rXrXWvmAMYzorAlIge6VS7nE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e6p6yNc+6wYkOLheeXy5wx7XnlxNGY6XrTs3XFzZ11RSX/pOWaja5pXoi0pwvnqjl
	 UBZ8Mti2dRn44UvUN6IbKwjKVl1EcdcrZRIuJDmF2uNbEIuJDCX7F8fKxqlFULHNuZ
	 /VjBZb/gaKMZ2mANPL8NOLQXVIJ8Pxdz4s7jIez7FPVEvWfwUhpEFmkOQLqIYjRr0H
	 UnFYkPw7qd8nh52b6hpwuBKAK2yEfdipX9QQowu0nn7sdgcXaGiAY2NUF5POlnpZtA
	 aurDTD+pwSv7PEszXP8OVMbz+B7nPd1ZzGOCn62M4/B18FeivW2GqgNCg6l22lRy+i
	 xn0moK+0q3hmw==
Date: Sat, 22 Jun 2024 08:45:16 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org
Subject: Re: [PATCH] riscv: enable HAVE_ARCH_STACKLEAK
Message-ID: <ZnYenFigMU4Lxa0K@xhacker>
References: <20240617123029.723-1-jszhang@kernel.org>
 <ZnX6YtFGfXd0ixwR@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZnX6YtFGfXd0ixwR@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_175923_455464_3F40EA8A 
X-CRM114-Status: GOOD (  22.98  )
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

T24gRnJpLCBKdW4gMjEsIDIwMjQgYXQgMDM6MTA6NDJQTSAtMDcwMCwgQ2hhcmxpZSBKZW5raW5z
IHdyb3RlOgo+IE9uIE1vbiwgSnVuIDE3LCAyMDI0IGF0IDA4OjMwOjI5UE0gKzA4MDAsIEppc2hl
bmcgWmhhbmcgd3JvdGU6Cj4gPiBBZGQgc3VwcG9ydCBmb3IgdGhlIHN0YWNrbGVhayBmZWF0dXJl
LiBXaGVuZXZlciB0aGUga2VybmVsIHJldHVybnMgdG8gdXNlcgo+ID4gc3BhY2UgdGhlIGtlcm5l
bCBzdGFjayBpcyBmaWxsZWQgd2l0aCBhIHBvaXNvbiB2YWx1ZS4KPiA+IAo+ID4gQXQgdGhlIHNh
bWUgdGltZSwgZGlzYWJsZXMgdGhlIHBsdWdpbiBpbiBFRkkgc3R1YiBjb2RlIGJlY2F1c2UgRUZJ
IHN0dWIKPiA+IGlzIG91dCBvZiBzY29wZSBmb3IgdGhlIHByb3RlY3Rpb24uCj4gPiAKPiA+IFRl
c3RlZCBvbiBxZW11IGFuZCBtaWxrdiBkdW86Cj4gPiAvICMgZWNobyBTVEFDS0xFQUtfRVJBU0lO
RyA+IC9zeXMva2VybmVsL2RlYnVnL3Byb3Zva2UtY3Jhc2gvRElSRUNUCj4gPiBbICAgMzguNjc1
NTc1XSBsa2R0bTogUGVyZm9ybWluZyBkaXJlY3QgZW50cnkgU1RBQ0tMRUFLX0VSQVNJTkcKPiA+
IFsgICAzOC42Nzg0NDhdIGxrZHRtOiBzdGFja2xlYWsgc3RhY2sgdXNhZ2U6Cj4gPiBbICAgMzgu
Njc4NDQ4XSAgIGhpZ2ggb2Zmc2V0OiAyODggYnl0ZXMKPiA+IFsgICAzOC42Nzg0NDhdICAgY3Vy
cmVudDogICAgIDQ5NiBieXRlcwo+ID4gWyAgIDM4LjY3ODQ0OF0gICBsb3dlc3Q6ICAgICAgMTMy
OCBieXRlcwo+ID4gWyAgIDM4LjY3ODQ0OF0gICB0cmFja2VkOiAgICAgMTMyOCBieXRlcwo+ID4g
WyAgIDM4LjY3ODQ0OF0gICB1bnRyYWNrZWQ6ICAgNDQ4IGJ5dGVzCj4gPiBbICAgMzguNjc4NDQ4
XSAgIHBvaXNvbmVkOiAgICAxNDMxMiBieXRlcwo+ID4gWyAgIDM4LjY3ODQ0OF0gICBsb3cgb2Zm
c2V0OiAgOCBieXRlcwo+ID4gWyAgIDM4LjY4OTg4N10gbGtkdG06IE9LOiB0aGUgcmVzdCBvZiB0
aGUgdGhyZWFkIHN0YWNrIGlzIHByb3Blcmx5IGVyYXNlZAo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5
OiBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jp
c2N2L0tjb25maWcgICAgICAgICAgICAgICAgICAgIHwgMSArCj4gPiAgYXJjaC9yaXNjdi9rZXJu
ZWwvZW50cnkuUyAgICAgICAgICAgICB8IDQgKysrKwo+ID4gIGRyaXZlcnMvZmlybXdhcmUvZWZp
L2xpYnN0dWIvTWFrZWZpbGUgfCAzICsrLQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tj
b25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiA+IGluZGV4IDA1MjVlZTJkNjNjNy4uOWNiZmRm
ZmVjOTZjIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiArKysgYi9hcmNo
L3Jpc2N2L0tjb25maWcKPiA+IEBAIC0xMTgsNiArMTE4LDcgQEAgY29uZmlnIFJJU0NWCj4gPiAg
CXNlbGVjdCBIQVZFX0FSQ0hfTU1BUF9STkRfQ09NUEFUX0JJVFMgaWYgQ09NUEFUCj4gPiAgCXNl
bGVjdCBIQVZFX0FSQ0hfUkFORE9NSVpFX0tTVEFDS19PRkZTRVQKPiA+ICAJc2VsZWN0IEhBVkVf
QVJDSF9TRUNDT01QX0ZJTFRFUgo+ID4gKwlzZWxlY3QgSEFWRV9BUkNIX1NUQUNLTEVBSwo+IAo+
IFdoZW4gdGhpcyBpcyBzZWxlY3RlZCwgc3RhY2tsZWFrLmggaW5jbHVkZQo+IGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaCB3aXRob3V0IHNpemVzLmggYW5kIEkgaGl0Ogo+IAo+
IC4vYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90aHJlYWRfaW5mby5oOjMwOjMzOiBlcnJvcjog4oCY
U1pfNEvigJkgdW5kZWNsYXJlZCBoZXJlIChub3QgaW4gYSBmdW5jdGlvbikKPiAgICAzMCB8ICNk
ZWZpbmUgT1ZFUkZMT1dfU1RBQ0tfU0laRSAgICAgU1pfNEsKPiAgICAgICB8ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXn5+fn4KPiAKPiBBZGRpbmcgIiNpbmNsdWRlIDxsaW51eC9z
aXplcy5oPiIgdG8gdGhyZWFkX2luZm8uaCByZXNvbHZlcyB0aGUgaXNzdWUuCj4gSSBhbSB0ZXN0
aW5nIHRoaXMgYmFzZWQgb24gNi4xMC1yYzQuIERpZCB5b3UgZW5jb3VudGVyIHRoaXM/CgpJIGRp
ZG4ndCBtZWV0IHRoaXMga2luZCBvZiBjb21waWxlciBlcnJvciB3aGVuIHRlc3RpbmcuIE1pbmQK
dG8gc2hhcmUgeW91ciAuY29uZmlnIGZpbGU/IEl0IGxvb2tzIHN0cmFuZ2UuCgo+IAo+IC0gQ2hh
cmxpZQo+IAo+ID4gIAlzZWxlY3QgSEFWRV9BUkNIX1RIUkVBRF9TVFJVQ1RfV0hJVEVMSVNUCj4g
PiAgCXNlbGVjdCBIQVZFX0FSQ0hfVFJBQ0VIT09LCj4gPiAgCXNlbGVjdCBIQVZFX0FSQ0hfVFJB
TlNQQVJFTlRfSFVHRVBBR0UgaWYgNjRCSVQgJiYgTU1VCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvZW50cnkuUyBiL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKPiA+IGluZGV4
IDY4YTI0Y2Y5NDgxYS4uODBmZjU1YTI2ZDEzIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9r
ZXJuZWwvZW50cnkuUwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUwo+ID4gQEAg
LTEzMCw2ICsxMzAsMTAgQEAgU1lNX0NPREVfU1RBUlRfTk9BTElHTihyZXRfZnJvbV9leGNlcHRp
b24pCj4gPiAgI2VuZGlmCj4gPiAgCWJuZXogczAsIDFmCj4gPiAgCj4gPiArI2lmZGVmIENPTkZJ
R19HQ0NfUExVR0lOX1NUQUNLTEVBSwo+ID4gKwljYWxsCXN0YWNrbGVha19lcmFzZV9vbl90YXNr
X3N0YWNrCj4gPiArI2VuZGlmCj4gPiArCj4gPiAgCS8qIFNhdmUgdW53b3VuZCBrZXJuZWwgc3Rh
Y2sgcG9pbnRlciBpbiB0aHJlYWRfaW5mbyAqLwo+ID4gIAlhZGRpIHMwLCBzcCwgUFRfU0laRV9P
Tl9TVEFDSwo+ID4gIAlSRUdfUyBzMCwgVEFTS19USV9LRVJORUxfU1AodHApCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9maXJtd2FyZS9lZmkvbGlic3R1Yi9NYWtlZmlsZSBiL2RyaXZlcnMvZmly
bXdhcmUvZWZpL2xpYnN0dWIvTWFrZWZpbGUKPiA+IGluZGV4IDA2ZjA0MjhhNzIzYy4uM2E5NTIx
YzU3NjQxIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9maXJtd2FyZS9lZmkvbGlic3R1Yi9NYWtl
ZmlsZQo+ID4gKysrIGIvZHJpdmVycy9maXJtd2FyZS9lZmkvbGlic3R1Yi9NYWtlZmlsZQo+ID4g
QEAgLTI4LDcgKzI4LDggQEAgY2ZsYWdzLSQoQ09ORklHX0FSTSkJCSs9IC1ERUZJX0hBVkVfU1RS
TEVOIC1ERUZJX0hBVkVfU1RSTkxFTiBcCj4gPiAgCQkJCSAgIC1ERUZJX0hBVkVfTUVNQ0hSIC1E
RUZJX0hBVkVfU1RSUkNIUiBcCj4gPiAgCQkJCSAgIC1ERUZJX0hBVkVfU1RSQ01QIC1mbm8tYnVp
bHRpbiAtZnBpYyBcCj4gPiAgCQkJCSAgICQoY2FsbCBjYy1vcHRpb24sLW1uby1zaW5nbGUtcGlj
LWJhc2UpCj4gPiAtY2ZsYWdzLSQoQ09ORklHX1JJU0NWKQkJKz0gLWZwaWMgLUROT19BTFRFUk5B
VElWRSAtbW5vLXJlbGF4Cj4gPiArY2ZsYWdzLSQoQ09ORklHX1JJU0NWKQkJKz0gLWZwaWMgLURO
T19BTFRFUk5BVElWRSAtbW5vLXJlbGF4IFwKPiA+ICsJCQkJICAgJChESVNBQkxFX1NUQUNLTEVB
S19QTFVHSU4pCj4gPiAgY2ZsYWdzLSQoQ09ORklHX0xPT05HQVJDSCkJKz0gLWZwaWUKPiA+ICAK
PiA+ICBjZmxhZ3MtJChDT05GSUdfRUZJX1BBUkFNU19GUk9NX0ZEVCkJKz0gLUkkKHNyY3RyZWUp
L3NjcmlwdHMvZHRjL2xpYmZkdAo+ID4gLS0gCj4gPiAyLjQzLjAKPiA+IAo+ID4gCj4gPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0Cj4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
