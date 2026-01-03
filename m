Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E703FC619A
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 21:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fPzYwqw6oq/xysQ3SLtEgZEs2wJzPOazPCiMCdprmek=; b=vDgz+GShkCV8sA
	9UHUtVU0RTBxIr4w4he0GuMLzeJS0smnFKWdQFIP8bIjcd5LACFF9FarPzDbhCy43XymbMRIDok0S
	m+M54R/5SalIa8d6uJcYYcD0v2E+IgW45a2gQAjOaiL2pqlpB50MMfcFi4MJ7ukK0j5cLmR5oLjmJ
	h0vq57xsOYOpzkyXm2tn6PIeQ05aOqLu+SoUReb9xPKEeCck6Lnf5pCZTMVLsUIe+2lNxQDDeqH5G
	7qfw+wpWUuP5bBKIKw24hn+w94JJ56oL6d+kz49wDoynC+hDda0Y2/RRHZu5+QS5s5mU1C2jJsDHp
	kN1ezRfEdL78Pixy1ofw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc97v-00000009qM8-25TK;
	Sat, 03 Jan 2026 21:25:35 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc97s-00000009qLD-3Bnu
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 21:25:33 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id A4B2634107F;
	Sat, 03 Jan 2026 21:25:29 +0000 (UTC)
Date: Sun, 4 Jan 2026 05:25:24 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] gpio: spacemit: Add GPIO support for K3 SoC
Message-ID: <20260103212524-GYB2053787@gentoo.org>
References: <20251229-02-k3-gpio-v1-0-269e76785abb@gentoo.org>
 <20251229-02-k3-gpio-v1-2-269e76785abb@gentoo.org>
 <CAMRc=MfHzP+xm-uX+jad5gPOGDpR23O6mB+xcSvF6ZiZfnxQjg@mail.gmail.com>
 <20260102113643-GYA2060252@gentoo.org>
 <20260102122045-GYA2060493@gentoo.org>
 <CAMRc=Meq8T_HJwDvf3wm5W2+ZFuHezGjqQx6sj-6HNJhThKjhg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMRc=Meq8T_HJwDvf3wm5W2+ZFuHezGjqQx6sj-6HNJhThKjhg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_132532_825934_F1CE8ED3 
X-CRM114-Status: GOOD (  29.18  )
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

SGkgQmFydG9zeiwKCk9uIDA4OjM4IEZyaSAwMiBKYW4gICAgICwgQmFydG9zeiBHb2xhc3pld3Nr
aSB3cm90ZToKPiBPbiBGcmksIDIgSmFuIDIwMjYgMTM6MjA6NDUgKzAxMDAsIFlpeHVuIExhbiA8
ZGxhbkBnZW50b28ub3JnPiBzYWlkOgo+ID4gSGkgYmFydCwKPiA+Cj4gPiBPbiAxOTozNiBGcmkg
MDIgSmFuICAgICAsIFlpeHVuIExhbiB3cm90ZToKPiA+PiBIaSBCYXJ0LAo+ID4+Cj4gPj4gT24g
MTI6MTAgRnJpIDAyIEphbiAgICAgLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4+ID4g
T24gTW9uLCBEZWMgMjksIDIwMjUgYXQgMTo0N+KAr1BNIFlpeHVuIExhbiA8ZGxhbkBnZW50b28u
b3JnPiB3cm90ZToKPiA+PiA+ID4KPiA+PiA+ID4gU3BhY2VtaVQgSzMgU29DIGhhcyBjaGFuZ2Vk
IGdwaW8gcmVnaXN0ZXIgbGF5b3V0IHdoaWxlIGNvbXBhcmluZwo+ID4+ID4gPiB3aXRoIHByZXZp
b3VzIGdlbmVyYXRpb24sIHRoZSByZWdpc3RlciBvZmZzZXQgYW5kIGJhbmsgb2Zmc2V0Cj4gPj4g
PiA+IG5lZWQgdG8gYmUgYWRqdXN0ZWQsIGludHJvZHVjZSBhIGNvbXBhdGlibGUgZGF0YSB0byBl
eHRlbmQgdGhlCj4gPj4gPiA+IGRyaXZlciB0byBzdXBwb3J0IHRoaXMuCj4gPj4gPiA+Cj4gPj4g
PiA+IFNpZ25lZC1vZmYtYnk6IFlpeHVuIExhbiA8ZGxhbkBnZW50b28ub3JnPgo+ID4+ID4gPiAt
LS0KPiA+PiA+ID4gIGRyaXZlcnMvZ3Bpby9ncGlvLXNwYWNlbWl0LWsxLmMgfCAxNTAgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQo+ID4+ID4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDEwNiBpbnNlcnRpb25zKCspLCA0NCBkZWxldGlvbnMoLSkKPiA+PiA+ID4KPiA+PiA+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3Bpby9ncGlvLXNwYWNlbWl0LWsxLmMgYi9kcml2ZXJzL2dw
aW8vZ3Bpby1zcGFjZW1pdC1rMS5jCj4gPj4gPiA+IGluZGV4IGViNjZhMTVjMDAyZi4uMDJjYzVj
MTFiNjE3IDEwMDY0NAo+ID4+ID4gPiAtLS0gYS9kcml2ZXJzL2dwaW8vZ3Bpby1zcGFjZW1pdC1r
MS5jCj4gPj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3Bpby9ncGlvLXNwYWNlbWl0LWsxLmMKPiA+PiA+
ID4gQEAgLTE1LDI4ICsxNSwxOSBAQAo+ID4+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3Jt
X2RldmljZS5oPgo+ID4+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L3NlcV9maWxlLmg+Cj4gPj4gPiA+
Cj4gPiBbc25pcF0uLi4KPiA+PiA+ID4gIHN0YXRpYyB1MzIgc3BhY2VtaXRfZ3Bpb19iYW5rX2lu
ZGV4KHN0cnVjdCBzcGFjZW1pdF9ncGlvX2JhbmsgKmdiKQo+ID4+ID4gPiAgewo+ID4+ID4gPiAg
ICAgICAgIHJldHVybiAodTMyKShnYiAtIGdiLT5zZy0+c2diKTsKPiA+PiA+ID4gQEAgLTYwLDEz
ICs3MCwxNCBAQCBzdGF0aWMgdTMyIHNwYWNlbWl0X2dwaW9fYmFua19pbmRleChzdHJ1Y3Qgc3Bh
Y2VtaXRfZ3Bpb19iYW5rICpnYikKPiA+PiA+ID4gIHN0YXRpYyBpcnFyZXR1cm5fdCBzcGFjZW1p
dF9ncGlvX2lycV9oYW5kbGVyKGludCBpcnEsIHZvaWQgKmRldl9pZCkKPiA+PiA+ID4gIHsKPiA+
PiA+ID4gICAgICAgICBzdHJ1Y3Qgc3BhY2VtaXRfZ3Bpb19iYW5rICpnYiA9IGRldl9pZDsKPiA+
PiA+ID4gKyAgICAgICBzdHJ1Y3Qgc3BhY2VtaXRfZ3BpbyAqc2cgPSBnYi0+c2c7Cj4gPj4gPiA+
ICAgICAgICAgdW5zaWduZWQgbG9uZyBwZW5kaW5nOwo+ID4+ID4gPiAgICAgICAgIHUzMiBuLCBn
ZWRyOwo+ID4+ID4gPgo+ID4+ID4gPiAtICAgICAgIGdlZHIgPSByZWFkbChnYi0+YmFzZSArIFNQ
QUNFTUlUX0dFRFIpOwo+ID4+ID4gPiArICAgICAgIGdlZHIgPSByZWFkbChnYi0+YmFzZSArIHRv
X3NwYWNlbWl0X2dwaW9fcmVncyhzZyktPmdlZHIpOwo+ID4+ID4KPiA+PiA+IFNpbmNlIHlvdSdy
ZSBhbHJlYWR5IHRvdWNoaW5nIGFsbCB0aGVzZSByZWdpc3RlciBhY2Nlc3NlcyAtIGNhbiB5b3UK
PiA+PiA+IG1heWJlIHByb3ZpZGUgZGVkaWNhdGVkIHdyYXBwZXIgZnVuY3Rpb25zIGFyb3VuZCBy
ZWFkbCgpL3dyaXRlbCgpIGFuZAo+ID4+ID4gYXZvaWQgYW55IGZpbGUtd2lkZSBjaGFuZ2VzIGlu
IHRoZSBmdXR1cmUgaWYgYW55dGhpbmcgcmVxdWlyZXMgZnVydGhlcgo+ID4+ID4gbW9kaWZpY2F0
aW9uPwo+ID4+ID4KPiA+PiBjYW4geW91IGVsYWJvcmF0ZSBhIGJpdCBmdXJ0aGVyIG9uIHRoaXM/
Cj4gPj4gSSBkb24ndCBnZXQgaG93IGEgd3JhcHBlciBoZWxwZXIgY291bGQgaGVscCB0byBhdm9p
ZCBmaWxlLXdpZGUgY2hhbmdlcy4uCj4gPj4KPiA+IGhlcmUgaXMgbXkgYXR0ZW1wdCB0byBzb2x2
ZSB0aGlzLCBkZWZpbmUgYSBtYWNybyB0byByZWdpc3RlciBhZGRyZXNzOgo+ID4KPiA+ICNkZWZp
bmUgdG9fc3BhY2VtaXRfZ3Bpb19yZWdzKGdiKSAoKGdiKS0+c2ctPmRhdGEtPnJlZ19vZmZzZXRz
KQo+ID4KPiA+ICNkZWZpbmUgU1BBQ0VNSVRfR0VEUihnYikgICAgICAoKGdiKS0+YmFzZSArIHRv
X3NwYWNlbWl0X2dwaW9fcmVncyhnYiktPmdlZHIpCj4gPgo+ID4gCWdlZHIgPSByZWFkbChTUEFD
RU1JVF9HRURSKGdiKSk7Cj4gPgo+ID4gcGxlYXNlIGxldCBtZSBrbm93IGlmIHRoaXMgZm9sbG93
IHlvdXIgc3VnZ2VzdGlvbiBvciBub3QKPiA+Cj4gPiAtLQo+ID4gWWl4dW4gTGFuIChkbGFuKQo+
ID4KPiAKPiBJIHdhcyB0aGlua2luZyBtb3JlIG9mIHNvbWV0aGluZyBsaWtlIHRoaXM6Cj4gCj4g
ZW51bSBzcGFjZW1pdF9ncGlvX3JlZ2lzdGVycyB7Cj4gCVNQQUNFTUlUX0dQTFIsCj4gCVNQQUNF
TUlUX0dQRFIsCj4gCS4uLgo+IH07Cj4gCj4gc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCBzcGFj
ZW1pdF9ncGlvX2sxX29mZnNldHMgPSB7Cj4gCVtTUEFDRU1JVF9HUExSXSA9IDB4MDAsCj4gCVtT
UEFDRU1JVF9HUERSXSA9IDB4MGMsCj4gCS4uLgo+IH07Cj4gCj4gc3RhdGljIGNvbnN0IHVuc2ln
bmVkIGludCBzcGFjZW1pdF9ncGlvX2szX29mZnNldHMgPSAuLi4KPiAKPiBzdHJ1Y3Qgc3BhY2Vt
aXRfZ3Bpb19kYXRhIHsKPiAJY29uc3QgdW5zaWduZWQgaW50ICpvZmZzZXRzOwo+IAl1MzIgYmFu
a19vZmZzZXRzWzRdOwo+IH07Cj4gCj4gc3RhdGljIHZvaWQgc3BhY2VtaXRfZ3Bpb193cml0ZShz
dHJ1Y3Qgc3BhY2VtaXRfZ3Bpb19iYW5rICpnYiwKPiAJCQkJZW51bSBzcGFjZW1pdF9ncGlvX3Jl
Z2lzdGVycyByZWcsIHUzMiB2YWwpCj4gewo+IAl3cml0ZWwodmFsLCBnYi0+YmFzZSArIGdiLT5k
YXRhLT5vZmZzZXRzW3JlZ10pOwo+IH0KPiAKT2ssIEkgd2lsbCBpbXBsZW1lbnQgdGhpcywgdGhh
bmtzIGZvciB0aGUgZGV0YWlsIHByb3RvdHlwZQoKLS0gCllpeHVuIExhbiAoZGxhbikKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
