Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7513C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 31 May 2022 21:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P1y02g/z+aMunyjHqyBUAYCoy5ehsyAQp6H4QviBU/M=; b=Ri4JZu6j4ygMqV
	Wjx2dOYYCROfejHU4Hv05lW7pEWAf4dCsurHzaRptHVaXS+8MPqz1eezAxdvHzvqZMiQXLal3L8YX
	+UKcYB5tmXhiP2PpRtyibeQuCekpHFUnhyHmc3eIY3FpxCav4YXosVqiSJhcp/GHulL3GmRPmk68v
	UiETDq/Pimq5cS6yFkgyGth9msuxiJzDkboJfBfQ1mVsOT8flMnWpito68IRzvME3oMkoJo3vjvTj
	jMg/j5nX1jQ0s1qfWI94gnvum0W00ddNcTki7jwJfb7ww7Mnf0Wg+EWKl1l2lZpkRztdXo7WPNnQz
	zC+lYLXdzMPPE9Uld0GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw9MP-00CiOw-7r; Tue, 31 May 2022 21:25:05 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw9MM-00CiNq-I7
	for linux-riscv@lists.infradead.org; Tue, 31 May 2022 21:25:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: dmitry.osipenko)
	with ESMTPSA id 4C9F21F43F0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654032299;
	bh=dWPjJiUcTEsCTwSVeYSxHnF1/ruJ13+dt9/M97DHXpY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iw1cl93DawB1wUr9b6KkZdHCFs5+L/GBohLHlROEAOks05zME/v6MXMPk6D7ui5Yi
	 RNRHdZFdzCLwhRjjb38P9M6JexB3Wbp2yKOPr5eeU8sVg/8ntyHzURiHlZSY6J8Cm9
	 q6oV/gJyO14M2ElVzYwoEuvi7LeAOBJpJO7JVAQIQbIk2iZISrAGCD8WEks6N0mo8W
	 PABIM3KRc5wMYvZgEpozGR6zO7yQLUE2dke3U5CmMfjFhmLTkzt3Ddgs0XBxEfDRJn
	 c+JlwyAdHThzhqLupTWaB45a5dOVfxT+a6WiHu8uAbSXS41ExvvXWl05U0ZRpjuSZP
	 ldNnEXKzwDRFg==
Message-ID: <a41c323a-5d69-0ff1-d0da-38eb55e1e4db@collabora.com>
Date: Wed, 1 Jun 2022 00:24:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v8 16/27] m68k: Switch to new sys-off handler API
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Sebastian Reichel <sre@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 the arch/x86 maintainers <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>, Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, xen-devel@lists.xenproject.org,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
 <20220509233235.995021-17-dmitry.osipenko@collabora.com>
 <CAMuHMdUFqf58F31EAGnhp_cu9k-G4Sx1cmwx-PGb3mU+6bjRnQ@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAMuHMdUFqf58F31EAGnhp_cu9k-G4Sx1cmwx-PGb3mU+6bjRnQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_142502_891621_6B163DB5 
X-CRM114-Status: GOOD (  32.07  )
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

T24gNS8zMS8yMiAyMjowNCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+IEhpIERtaXRyeSwK
PiAKPiBPbiBUdWUsIE1heSAxMCwgMjAyMiBhdCAxOjM0IEFNIERtaXRyeSBPc2lwZW5rbwo+IDxk
bWl0cnkub3NpcGVua29AY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4+IEtlcm5lbCBub3cgc3VwcG9y
dHMgY2hhaW5lZCBwb3dlci1vZmYgaGFuZGxlcnMuIFVzZQo+PiByZWdpc3Rlcl9wb3dlcl9vZmZf
aGFuZGxlcigpIHRoYXQgcmVnaXN0ZXJzIHBvd2VyLW9mZiBoYW5kbGVycyBhbmQKPj4gZG9fa2Vy
bmVsX3Bvd2VyX29mZigpIHRoYXQgaW52b2tlcyBjaGFpbmVkIHBvd2VyLW9mZiBoYW5kbGVycy4g
TGVnYWN5Cj4+IHBtX3Bvd2VyX29mZigpIHdpbGwgYmUgcmVtb3ZlZCBvbmNlIGFsbCBkcml2ZXJz
IHdpbGwgYmUgY29udmVydGVkIHRvCj4+IHRoZSBuZXcgc3lzLW9mZiBBUEkuCj4+Cj4+IE5vcm1h
bGx5IGFyY2ggY29kZSBzaG91bGQgYWRvcHQgb25seSB0aGUgZG9fa2VybmVsX3Bvd2VyX29mZigp
IGF0IGZpcnN0LAo+PiBidXQgbTY4ayBpcyBhIHNwZWNpYWwgY2FzZSBiZWNhdXNlIGl0IHVzZXMg
cG1fcG93ZXJfb2ZmKCkgImluc2lkZSBvdXQiLAo+PiBpLmUuIHBtX3Bvd2VyX29mZigpIGludm9r
ZXMgbWFjaGluZV9wb3dlcl9vZmYoKSBbaW4gZmFjdCBpdCBkb2VzIG5vdGhpbmddLAo+PiB3aGls
ZSBpdCdzIG1hY2hpbmVfcG93ZXJfb2ZmKCkgdGhhdCBzaG91bGQgaW52b2tlIHRoZSBwbV9wb3dl
cl9vZmYoKSwgYW5kCj4+IHRodXMsIHdlIGNhbid0IGNvbnZlcnQgcGxhdGZvcm1zIHRvIHRoZSBu
ZXcgQVBJIHNlcGFyYXRlbHkuIFRoZXJlIGFyZSBvbmx5Cj4+IHR3byBwbGF0Zm9ybXMgY2hhbmdl
ZCBoZXJlLCBzbyBpdCdzIG5vdCBhIGJpZyBkZWFsLgo+Pgo+PiBBY2tlZC1ieTogR2VlcnQgVXl0
dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4KPj4gUmV2aWV3ZWQtYnk6IE1pY2hhxYIg
TWlyb3PFgmF3IDxtaXJxLWxpbnV4QHJlcmUucW1xbS5wbD4KPj4gU2lnbmVkLW9mZi1ieTogRG1p
dHJ5IE9zaXBlbmtvIDxkbWl0cnkub3NpcGVua29AY29sbGFib3JhLmNvbT4KPiAKPiBUaGFua3Mg
Zm9yIHlvdXIgcGF0Y2gsIHdoaWNoIGlzIG5vdyBjb21taXQgZjBmN2U1MjY1YjNiMzdiMAo+ICgi
bTY4azogU3dpdGNoIHRvIG5ldyBzeXMtb2ZmIGhhbmRsZXIgQVBJIikgdXBzdHJlYW0uCj4gCj4+
IC0tLSBhL2FyY2gvbTY4ay9lbXUvbmF0ZmVhdC5jCj4+ICsrKyBiL2FyY2gvbTY4ay9lbXUvbmF0
ZmVhdC5jCj4+IEBAIC0xNSw2ICsxNSw3IEBACj4+ICAjaW5jbHVkZSA8bGludXgvc3RyaW5nLmg+
Cj4+ICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxl
Lmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvcmVib290Lmg+Cj4+ICAjaW5jbHVkZSA8bGludXgvaW8u
aD4KPj4gICNpbmNsdWRlIDxhc20vbWFjaGRlcC5oPgo+PiAgI2luY2x1ZGUgPGFzbS9uYXRmZWF0
Lmg+Cj4+IEBAIC05MCw1ICs5MSw1IEBAIHZvaWQgX19pbml0IG5mX2luaXQodm9pZCkKPj4gICAg
ICAgICBwcl9pbmZvKCJOYXRGZWF0cyBmb3VuZCAoJXMsICVsdS4lbHUpXG4iLCBidWYsIHZlcnNp
b24gPj4gMTYsCj4+ICAgICAgICAgICAgICAgICB2ZXJzaW9uICYgMHhmZmZmKTsKPj4KPj4gLSAg
ICAgICBtYWNoX3Bvd2VyX29mZiA9IG5mX3Bvd2Vyb2ZmOwo+PiArICAgICAgIHJlZ2lzdGVyX3Bs
YXRmb3JtX3Bvd2VyX29mZihuZl9wb3dlcm9mZik7Cj4gCj4gVW5mb3J0dW5hdGVseSBub3RoaW5n
IGlzIHJlZ2lzdGVyZWQsIGFzIHRoaXMgaXMgY2FsbGVkIHZlcnkgZWFybHkKPiAoZnJvbSBzZXR1
cF9hcmNoKCksIGJlZm9yZSB0aGUgbWVtb3J5IGFsbG9jYXRvciBpcyBhdmFpbGFibGUuCj4gSGVu
Y2UgcmVnaXN0ZXJfc3lzX29mZl9oYW5kbGVyKCkgZmFpbHMgd2l0aCAtRU5PTUVNLCBhbmQgcG93
ZXJvZmYKPiBzdG9wcyB3b3JraW5nLgo+IAo+IFBvc3NpYmxlIHNvbHV0aW9uczoKPiAgIC0gQXMg
YXQgbW9zdCBvbmUgaGFuZGxlciBjYW4gYmUgcmVnaXN0ZXJlZCwKPiAgICAgcmVnaXN0ZXJfcGxh
dGZvcm1fcG93ZXJfb2ZmKCkgY291bGQgdXNlIGEgc3RhdGljIHN0cnVjdCBzeXNfb2ZmX2hhbmRs
ZXIKPiAgICAgaW5zdGFuY2UsCj4gICAtIEtlZXAgbWFjaF9wb3dlcl9vZmYsIGFuZCBjYWxsIHJl
Z2lzdGVyX3BsYXRmb3JtX3Bvd2VyX29mZigpIGxhdGVyLgo+IAo+IEFueXRoaW5nIGVsc2U/Cj4g
VGhhbmtzIQo+IAo+PiAtLS0gYS9hcmNoL202OGsvbWFjL2NvbmZpZy5jCj4+ICsrKyBiL2FyY2gv
bTY4ay9tYWMvY29uZmlnLmMKPj4gQEAgLTEyLDYgKzEyLDcgQEAKPj4KPj4gICNpbmNsdWRlIDxs
aW51eC9lcnJuby5oPgo+PiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+PiArI2luY2x1ZGUg
PGxpbnV4L3JlYm9vdC5oPgo+PiAgI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Cj4+ICAjaW5jbHVk
ZSA8bGludXgvbW0uaD4KPj4gICNpbmNsdWRlIDxsaW51eC90dHkuaD4KPj4gQEAgLTE0MCw3ICsx
NDEsNiBAQCB2b2lkIF9faW5pdCBjb25maWdfbWFjKHZvaWQpCj4+ICAgICAgICAgbWFjaF9od2Ns
ayA9IG1hY19od2NsazsKPj4gICAgICAgICBtYWNoX3Jlc2V0ID0gbWFjX3Jlc2V0Owo+PiAgICAg
ICAgIG1hY2hfaGFsdCA9IG1hY19wb3dlcm9mZjsKPj4gLSAgICAgICBtYWNoX3Bvd2VyX29mZiA9
IG1hY19wb3dlcm9mZjsKPj4gICNpZiBJU19FTkFCTEVEKENPTkZJR19JTlBVVF9NNjhLX0JFRVAp
Cj4+ICAgICAgICAgbWFjaF9iZWVwID0gbWFjX21rc291bmQ7Cj4+ICAjZW5kaWYKPj4gQEAgLTE2
MCw2ICsxNjAsOCBAQCB2b2lkIF9faW5pdCBjb25maWdfbWFjKHZvaWQpCj4+Cj4+ICAgICAgICAg
aWYgKG1hY2ludG9zaF9jb25maWctPmlkZW50ID09IE1BQ19NT0RFTF9JSUNJKQo+PiAgICAgICAg
ICAgICAgICAgbWFjaF9sMl9mbHVzaCA9IHZpYV9sMl9mbHVzaDsKPj4gKwo+PiArICAgICAgIHJl
Z2lzdGVyX3BsYXRmb3JtX3Bvd2VyX29mZihtYWNfcG93ZXJvZmYpOwo+PiAgfQo+IAo+IFRoaXMg
bXVzdCBoYXZlIHRoZSBzYW1lIHByb2JsZW0uCgpUaGUgc3RhdGljIHZhcmlhbnQgc2hvdWxkIGJl
IGJldHRlciwgSU1PLiBJJ20gbm90IHN1cmUgd2hldGhlciBvdGhlciBwbGF0Zm9ybXMgd29uJ3Qg
ZmFjZSB0aGUgc2FtZSBwcm9ibGVtIG9uY2UgdGhleSB3aWxsIHN0YXJ0IHVzaW5nIHJlZ2lzdGVy
X3BsYXRmb3JtX3Bvd2VyX29mZigpLiBJJ2xsIHNlbmQgdGhlIGZpeCwgdGhhbmsgeW91IGZvciB0
aGUgdGVzdGluZyEKCi0tLSA+OCAtLS0KCmRpZmYgLS1naXQgYS9rZXJuZWwvcmVib290LmMgYi9r
ZXJuZWwvcmVib290LmMKaW5kZXggYTA5MTE0NWVlNzEwLi40ZmVhMDVkMzg3ZGMgMTAwNjQ0Ci0t
LSBhL2tlcm5lbC9yZWJvb3QuYworKysgYi9rZXJuZWwvcmVib290LmMKQEAgLTMxNSw2ICszMTUs
MzcgQEAgc3RhdGljIGludCBzeXNfb2ZmX25vdGlmeShzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5i
LAogCXJldHVybiBoYW5kbGVyLT5zeXNfb2ZmX2NiKCZkYXRhKTsKIH0KIAorc3RhdGljIHN0cnVj
dCBzeXNfb2ZmX2hhbmRsZXIgcGxhdGZvcm1fc3lzX29mZl9oYW5kbGVyOworCitzdGF0aWMgc3Ry
dWN0IHN5c19vZmZfaGFuZGxlciAqYWxsb2Nfc3lzX29mZl9oYW5kbGVyKGludCBwcmlvcml0eSkK
K3sKKwlzdHJ1Y3Qgc3lzX29mZl9oYW5kbGVyICpoYW5kbGVyOworCisJLyoKKwkgKiBQbGF0Zm9y
bXMgbGlrZSBtNjhrIGNhbid0IGFsbG9jYXRlIHN5c19vZmYgaGFuZGxlciBkeW5hbWljYWxseQor
CSAqIGF0IHRoZSBlYXJseSBib290IHRpbWUuCisJICovCisJaWYgKHByaW9yaXR5ID09IFNZU19P
RkZfUFJJT19QTEFURk9STSkgeworCQloYW5kbGVyID0gJnBsYXRmb3JtX3N5c19vZmZfaGFuZGxl
cjsKKwkJaWYgKGhhbmRsZXItPmNiX2RhdGEpCisJCQlyZXR1cm4gRVJSX1BUUigtRUJVU1kpOwor
CX0gZWxzZSB7CisJCWhhbmRsZXIgPSBremFsbG9jKHNpemVvZigqaGFuZGxlciksIEdGUF9LRVJO
RUwpOworCQlpZiAoIWhhbmRsZXIpCisJCQlyZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsKKwl9CisK
KwlyZXR1cm4gaGFuZGxlcjsKK30KKworc3RhdGljIHZvaWQgZnJlZV9zeXNfb2ZmX2hhbmRsZXIo
c3RydWN0IHN5c19vZmZfaGFuZGxlciAqaGFuZGxlcikKK3sKKwlpZiAoaGFuZGxlciA9PSAmcGxh
dGZvcm1fc3lzX29mZl9oYW5kbGVyKQorCQltZW1zZXQoaGFuZGxlciwgMCwgc2l6ZW9mKCpoYW5k
bGVyKSk7CisJZWxzZQorCQlrZnJlZShoYW5kbGVyKTsKK30KKwogLyoqCiAgKglyZWdpc3Rlcl9z
eXNfb2ZmX2hhbmRsZXIgLSBSZWdpc3RlciBzeXMtb2ZmIGhhbmRsZXIKICAqCUBtb2RlOiBTeXMt
b2ZmIG1vZGUKQEAgLTM0NSw5ICszNzYsOSBAQCByZWdpc3Rlcl9zeXNfb2ZmX2hhbmRsZXIoZW51
bSBzeXNfb2ZmX21vZGUgbW9kZSwKIAlzdHJ1Y3Qgc3lzX29mZl9oYW5kbGVyICpoYW5kbGVyOwog
CWludCBlcnI7CiAKLQloYW5kbGVyID0ga3phbGxvYyhzaXplb2YoKmhhbmRsZXIpLCBHRlBfS0VS
TkVMKTsKLQlpZiAoIWhhbmRsZXIpCi0JCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOworCWhhbmRs
ZXIgPSBhbGxvY19zeXNfb2ZmX2hhbmRsZXIocHJpb3JpdHkpOworCWlmIChJU19FUlIoaGFuZGxl
cikpCisJCXJldHVybiBoYW5kbGVyOwogCiAJc3dpdGNoIChtb2RlKSB7CiAJY2FzZSBTWVNfT0ZG
X01PREVfUE9XRVJfT0ZGX1BSRVBBUkU6CkBAIC0zNjQsNyArMzk1LDcgQEAgcmVnaXN0ZXJfc3lz
X29mZl9oYW5kbGVyKGVudW0gc3lzX29mZl9tb2RlIG1vZGUsCiAJCWJyZWFrOwogCiAJZGVmYXVs
dDoKLQkJa2ZyZWUoaGFuZGxlcik7CisJCWZyZWVfc3lzX29mZl9oYW5kbGVyKGhhbmRsZXIpOwog
CQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsKIAl9CiAKQEAgLTM5MSw3ICs0MjIsNyBAQCByZWdp
c3Rlcl9zeXNfb2ZmX2hhbmRsZXIoZW51bSBzeXNfb2ZmX21vZGUgbW9kZSwKIAl9CiAKIAlpZiAo
ZXJyKSB7Ci0JCWtmcmVlKGhhbmRsZXIpOworCQlmcmVlX3N5c19vZmZfaGFuZGxlcihoYW5kbGVy
KTsKIAkJcmV0dXJuIEVSUl9QVFIoZXJyKTsKIAl9CiAKQEAgLTQyMiw3ICs0NTMsNyBAQCB2b2lk
IHVucmVnaXN0ZXJfc3lzX29mZl9oYW5kbGVyKHN0cnVjdCBzeXNfb2ZmX2hhbmRsZXIgKmhhbmRs
ZXIpCiAJLyogc2FuaXR5IGNoZWNrLCBzaGFsbCBuZXZlciBoYXBwZW4gKi8KIAlXQVJOX09OKGVy
cik7CiAKLQlrZnJlZShoYW5kbGVyKTsKKwlmcmVlX3N5c19vZmZfaGFuZGxlcihoYW5kbGVyKTsK
IH0KIEVYUE9SVF9TWU1CT0xfR1BMKHVucmVnaXN0ZXJfc3lzX29mZl9oYW5kbGVyKTsKIAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
