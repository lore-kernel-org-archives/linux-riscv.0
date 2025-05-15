Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53088C54755
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 07:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LmOa5dNh2vyLjVe7fkXZCfHBz8X3YXJeH30uGrf1myY=; b=pY7iYlec2itnay
	oXcjzYK9EyXgchc4oT975m57G/Zeh5av9zF3HXCH3pYxg6kVHIWmP18tUd1TXgjOQic8QNgQxi407
	Ux1RPfBXqDajOdA1Qm+aAjQmhroA26ib6/5eN4/Koz2/kkSXV3vqyxXJQ2r2GC49rm8Ih3RT9zL69
	qBzavS+WTLqFUNSyER4/oY80NmDL7QrFoEVPs7l+btmG1JV3iAph+HIw60dbY08B6JQAg+4lR+u2b
	7Xt/pTQoG+HjwkjcHBPi3OBmJMTOVpXRr9GrItOP5hiFCp51L1OZ67ObIyNxPrTYG8NIa5iN8BEnM
	6xOABCVaSKKzBme0gAgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFSl9-0000000HEXW-2sDi;
	Thu, 15 May 2025 07:12:03 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFSjh-0000000HEKp-0b6h
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 07:10:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B7F9A43A81;
	Thu, 15 May 2025 07:10:11 +0000 (UTC)
Message-ID: <c911eead-30c4-497d-8a56-1450792b24bd@ghiti.fr>
Date: Thu, 15 May 2025 09:10:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 22/27] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
Content-Language: en-US
To: Deepak Gupta <debug@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Christian Brauner <brauner@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com,
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com,
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com,
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org,
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org,
 Zong Li <zong.li@sifive.com>
References: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
 <20250502-v5_user_cfi_series-v15-22-914966471885@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250502-v5_user_cfi_series-v15-22-914966471885@rivosinc.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdelvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeettdehkefghfekvdetteefgedvheejgfefhfekudeukeefieduudegtdehgffgueenucffohhmrghinhephhgvrggurdhssgenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeegsgejudemgegvtgeimeejfhehsgemjegstddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeegsgejudemgegvtgeimeejfhehsgemjegstddupdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeegsgejudemgegvtgeimeejfhehsgemjegstddungdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeehledprhgtphhtthhopeguvggsuhhgsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehmihhnghhosehrvgguh
 hgrthdrtghomhdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopegurghvvgdrhhgrnhhsvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepgiekieeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhhprgesiiihthhorhdrtghomhdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_001033_343669_D587668E 
X-CRM114-Status: GOOD (  15.91  )
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

SGkgRGVlcGFrLAoKT24gMDMvMDUvMjAyNSAwMTozMCwgRGVlcGFrIEd1cHRhIHdyb3RlOgo+IEtl
cm5lbCB3aWxsIGhhdmUgdG8gcGVyZm9ybSBzaGFkb3cgc3RhY2sgb3BlcmF0aW9ucyBvbiB1c2Vy
IHNoYWRvdyBzdGFjay4KPiBMaWtlIGR1cmluZyBzaWduYWwgZGVsaXZlcnkgYW5kIHNpZ3JldHVy
biwgc2hhZG93IHN0YWNrIHRva2VuIG11c3QgYmUKPiBjcmVhdGVkIGFuZCB2YWxpZGF0ZWQgcmVz
cGVjdGl2ZWx5LiBUaHVzIHNoYWRvdyBzdGFjayBhY2Nlc3MgZm9yIGtlcm5lbAo+IG11c3QgYmUg
ZW5hYmxlZC4KPgo+IEluIGZ1dHVyZSB3aGVuIGtlcm5lbCBzaGFkb3cgc3RhY2tzIGFyZSBlbmFi
bGVkIGZvciBsaW51eCBrZXJuZWwsIGl0IG11c3QKPiBiZSBlbmFibGVkIGFzIGVhcmx5IGFzIHBv
c3NpYmxlIGZvciBiZXR0ZXIgY292ZXJhZ2UgYW5kIHByZXZlbnQgaW1iYWxhbmNlCj4gYmV0d2Vl
biByZWd1bGFyIHN0YWNrIGFuZCBzaGFkb3cgc3RhY2suIEFmdGVyIGByZWxvY2F0ZV9lbmFibGVf
bW11YCBoYXMKPiBiZWVuIGRvbmUsIHRoaXMgaXMgYXMgZWFybHkgYXMgcG9zc2libGUgaXQgY2Fu
IGVuYWJsZWQuCj4KPiBSZXZpZXdlZC1ieTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPgo+IC0tLQo+
ICAgYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYyB8ICA0ICsrKysKPiAgIGFyY2gvcmlz
Y3Yva2VybmVsL2hlYWQuUyAgICAgICAgfCAyNyArKysrKysrKysrKysrKysrKysrKysrKysrKysK
PiAgIDIgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva2VybmVsL2FzbS1vZmZzZXRzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9hc20tb2Zm
c2V0cy5jCj4gaW5kZXggZjMzOTQ1NDMyZjhmLi43YWI0MWYwMWFhMTcgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVs
L2FzbS1vZmZzZXRzLmMKPiBAQCAtNTE0LDQgKzUxNCw4IEBAIHZvaWQgYXNtX29mZnNldHModm9p
ZCkKPiAgIAlERUZJTkUoRlJFR1NfQTYsCSAgICBvZmZzZXRvZihzdHJ1Y3QgX19hcmNoX2Z0cmFj
ZV9yZWdzLCBhNikpOwo+ICAgCURFRklORShGUkVHU19BNywJICAgIG9mZnNldG9mKHN0cnVjdCBf
X2FyY2hfZnRyYWNlX3JlZ3MsIGE3KSk7Cj4gICAjZW5kaWYKPiArCURFRklORShTQklfRVhUX0ZX
RlQsIFNCSV9FWFRfRldGVCk7Cj4gKwlERUZJTkUoU0JJX0VYVF9GV0ZUX1NFVCwgU0JJX0VYVF9G
V0ZUX1NFVCk7Cj4gKwlERUZJTkUoU0JJX0ZXRlRfU0hBRE9XX1NUQUNLLCBTQklfRldGVF9TSEFE
T1dfU1RBQ0spOwo+ICsJREVGSU5FKFNCSV9GV0ZUX1NFVF9GTEFHX0xPQ0ssIFNCSV9GV0ZUX1NF
VF9GTEFHX0xPQ0spOwoKCmtlcm5lbCB0ZXN0IHJvYm90IHJlcG9ydGVkIGVycm9ycyB3aGVuICFS
VjY0IGFuZCAhU0JJLCB0aGUgZm9sbG93aW5nIApkaWZmIGZpeGVzIGl0OgoKZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL2FzbS1vZmZzZXRzLmMgCmIvYXJjaC9yaXNjdi9rZXJuZWwvYXNt
LW9mZnNldHMuYwppbmRleCA3ZmMwODVkMjdjYTc5Li4zYWE1ZjU2YTg0ZTlhIDEwMDY0NAotLS0g
YS9hcmNoL3Jpc2N2L2tlcm5lbC9hc20tb2Zmc2V0cy5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVs
L2FzbS1vZmZzZXRzLmMKQEAgLTUzMiw4ICs1MzIsMTAgQEAgdm9pZCBhc21fb2Zmc2V0cyh2b2lk
KQogwqDCoMKgwqDCoMKgwqAgREVGSU5FKEZSRUdTX0E2LMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
b2Zmc2V0b2Yoc3RydWN0IF9fYXJjaF9mdHJhY2VfcmVncywgCmE2KSk7CiDCoMKgwqDCoMKgwqDC
oCBERUZJTkUoRlJFR1NfQTcswqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvZmZzZXRvZihzdHJ1Y3Qg
X19hcmNoX2Z0cmFjZV9yZWdzLCAKYTcpKTsKIMKgI2VuZGlmCisjaWZkZWYgQ09ORklHX1JJU0NW
X1NCSQogwqDCoMKgwqDCoMKgwqAgREVGSU5FKFNCSV9FWFRfRldGVCwgU0JJX0VYVF9GV0ZUKTsK
IMKgwqDCoMKgwqDCoMKgIERFRklORShTQklfRVhUX0ZXRlRfU0VULCBTQklfRVhUX0ZXRlRfU0VU
KTsKIMKgwqDCoMKgwqDCoMKgIERFRklORShTQklfRldGVF9TSEFET1dfU1RBQ0ssIFNCSV9GV0ZU
X1NIQURPV19TVEFDSyk7CiDCoMKgwqDCoMKgwqDCoCBERUZJTkUoU0JJX0ZXRlRfU0VUX0ZMQUdf
TE9DSywgU0JJX0ZXRlRfU0VUX0ZMQUdfTE9DSyk7CisjZW5kaWYKIMKgfQoKTm8gbmVlZCB0byBy
ZXNlbmQgdGhlIHdob2xlIHNlcmllcywgSSdsbCBzcXVhc2ggaXQuCgpUaGFua3MsCgpBbGV4CgoK
PiAgIH0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TIGIvYXJjaC9yaXNj
di9rZXJuZWwvaGVhZC5TCj4gaW5kZXggMzU2ZDUzOTdiMmEyLi43ZWFlOWExNzIzNTEgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvaGVhZC5TCj4gQEAgLTE1LDYgKzE1LDcgQEAKPiAgICNpbmNsdWRlIDxhc20vaW1hZ2UuaD4K
PiAgICNpbmNsdWRlIDxhc20vc2NzLmg+Cj4gICAjaW5jbHVkZSA8YXNtL3hpcF9maXh1cC5oPgo+
ICsjaW5jbHVkZSA8YXNtL3VzZXJjZmkuaD4KPiAgICNpbmNsdWRlICJlZmktaGVhZGVyLlMiCj4g
ICAKPiAgIF9fSEVBRAo+IEBAIC0xNjQsNiArMTY1LDE5IEBAIHNlY29uZGFyeV9zdGFydF9zYmk6
Cj4gICAJY2FsbCByZWxvY2F0ZV9lbmFibGVfbW11Cj4gICAjZW5kaWYKPiAgIAljYWxsIC5Mc2V0
dXBfdHJhcF92ZWN0b3IKPiArI2lmIGRlZmluZWQoQ09ORklHX1JJU0NWX1NCSSkgJiYgZGVmaW5l
ZChDT05GSUdfUklTQ1ZfVVNFUl9DRkkpCj4gKwlsaSBhNywgU0JJX0VYVF9GV0ZUCj4gKwlsaSBh
NiwgU0JJX0VYVF9GV0ZUX1NFVAo+ICsJbGkgYTAsIFNCSV9GV0ZUX1NIQURPV19TVEFDSwo+ICsJ
bGkgYTEsIDEgLyogZW5hYmxlIHN1cGVydmlzb3IgdG8gYWNjZXNzIHNoYWRvdyBzdGFjayBhY2Nl
c3MgKi8KPiArCWxpIGEyLCBTQklfRldGVF9TRVRfRkxBR19MT0NLCj4gKwllY2FsbAo+ICsJYmVx
eiBhMCwgMWYKPiArCWxhIGExLCByaXNjdl9ub3VzZXJjZmkKPiArCWxpIGEwLCBDTURMSU5FX0RJ
U0FCTEVfUklTQ1ZfVVNFUkNGSV9CQ0ZJCj4gKwlSRUdfUyBhMCwgKGExKQo+ICsxOgo+ICsjZW5k
aWYKPiAgIAlzY3NfbG9hZF9jdXJyZW50Cj4gICAJY2FsbCBzbXBfY2FsbGluCj4gICAjZW5kaWYg
LyogQ09ORklHX1NNUCAqLwo+IEBAIC0zMjAsNiArMzM0LDE5IEBAIFNZTV9DT0RFX1NUQVJUKF9z
dGFydF9rZXJuZWwpCj4gICAJbGEgdHAsIGluaXRfdGFzawo+ICAgCWxhIHNwLCBpbml0X3RocmVh
ZF91bmlvbiArIFRIUkVBRF9TSVpFCj4gICAJYWRkaSBzcCwgc3AsIC1QVF9TSVpFX09OX1NUQUNL
Cj4gKyNpZiBkZWZpbmVkKENPTkZJR19SSVNDVl9TQkkpICYmIGRlZmluZWQoQ09ORklHX1JJU0NW
X1VTRVJfQ0ZJKQo+ICsJbGkgYTcsIFNCSV9FWFRfRldGVAo+ICsJbGkgYTYsIFNCSV9FWFRfRldG
VF9TRVQKPiArCWxpIGEwLCBTQklfRldGVF9TSEFET1dfU1RBQ0sKPiArCWxpIGExLCAxIC8qIGVu
YWJsZSBzdXBlcnZpc29yIHRvIGFjY2VzcyBzaGFkb3cgc3RhY2sgYWNjZXNzICovCj4gKwlsaSBh
MiwgU0JJX0ZXRlRfU0VUX0ZMQUdfTE9DSwo+ICsJZWNhbGwKPiArCWJlcXogYTAsIDFmCj4gKwls
YSBhMSwgcmlzY3Zfbm91c2VyY2ZpCj4gKwlsaSBhMCwgQ01ETElORV9ESVNBQkxFX1JJU0NWX1VT
RVJDRklfQkNGSQo+ICsJUkVHX1MgYTAsIChhMSkKPiArMToKPiArI2VuZGlmCj4gICAJc2NzX2xv
YWRfY3VycmVudAo+ICAgCj4gICAjaWZkZWYgQ09ORklHX0tBU0FOCj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
