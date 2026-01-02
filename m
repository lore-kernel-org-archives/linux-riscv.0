Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF3FFA3741
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jan 2026 12:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AFjGO+HvusXCTaxj09jdgfgmJCRwVMHq1N6wNCzOkJ4=; b=Rg4UkW3vHbKBmZ
	E8VGE6rUHjf1XOAcMxzQfLrdqcVZZi0ikH/8Wk0pK+npRvhdTFKQMOmekKa7btJOokuk9DgeYaCvI
	AqspKOb3dOOET6Jqfzr46rPvlww17l4TSYUWwerGZ0Z+VEWU6ovBgXJK+k6k+2h2iFlPIQ2gaXl+F
	xrKIkqiGxYXMfUR0JTtpYq1jLF1OaupHRAYms1SSkkP/0tSDzOUcMGOK7y7KlHHdnuwxcbcDddHpV
	kA1YCf8FJsjnLzzw8tTc9Z31OAInHeaY1GIZaFkBjFhAmH5C/spw2zTSnqpD4uKYL6bCVbUuEarVm
	3P3o2xSnlHcy55tolX8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbe9H-00000008BcW-2odS;
	Fri, 02 Jan 2026 12:20:55 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbe9F-00000008Bc5-2uSq
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jan 2026 12:20:54 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id D5F8D341291;
	Fri, 02 Jan 2026 12:20:50 +0000 (UTC)
Date: Fri, 2 Jan 2026 20:20:45 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] gpio: spacemit: Add GPIO support for K3 SoC
Message-ID: <20260102122045-GYA2060493@gentoo.org>
References: <20251229-02-k3-gpio-v1-0-269e76785abb@gentoo.org>
 <20251229-02-k3-gpio-v1-2-269e76785abb@gentoo.org>
 <CAMRc=MfHzP+xm-uX+jad5gPOGDpR23O6mB+xcSvF6ZiZfnxQjg@mail.gmail.com>
 <20260102113643-GYA2060252@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260102113643-GYA2060252@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_042053_755193_78A58FC7 
X-CRM114-Status: GOOD (  23.94  )
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

SGkgYmFydCwKCk9uIDE5OjM2IEZyaSAwMiBKYW4gICAgICwgWWl4dW4gTGFuIHdyb3RlOgo+IEhp
IEJhcnQsCj4gCj4gT24gMTI6MTAgRnJpIDAyIEphbiAgICAgLCBCYXJ0b3N6IEdvbGFzemV3c2tp
IHdyb3RlOgo+ID4gT24gTW9uLCBEZWMgMjksIDIwMjUgYXQgMTo0N+KAr1BNIFlpeHVuIExhbiA8
ZGxhbkBnZW50b28ub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gU3BhY2VtaVQgSzMgU29DIGhhcyBj
aGFuZ2VkIGdwaW8gcmVnaXN0ZXIgbGF5b3V0IHdoaWxlIGNvbXBhcmluZwo+ID4gPiB3aXRoIHBy
ZXZpb3VzIGdlbmVyYXRpb24sIHRoZSByZWdpc3RlciBvZmZzZXQgYW5kIGJhbmsgb2Zmc2V0Cj4g
PiA+IG5lZWQgdG8gYmUgYWRqdXN0ZWQsIGludHJvZHVjZSBhIGNvbXBhdGlibGUgZGF0YSB0byBl
eHRlbmQgdGhlCj4gPiA+IGRyaXZlciB0byBzdXBwb3J0IHRoaXMuCj4gPiA+Cj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IFlpeHVuIExhbiA8ZGxhbkBnZW50b28ub3JnPgo+ID4gPiAtLS0KPiA+ID4gIGRy
aXZlcnMvZ3Bpby9ncGlvLXNwYWNlbWl0LWsxLmMgfCAxNTAgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEwNiBpbnNlcnRpb25z
KCspLCA0NCBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3Bp
by9ncGlvLXNwYWNlbWl0LWsxLmMgYi9kcml2ZXJzL2dwaW8vZ3Bpby1zcGFjZW1pdC1rMS5jCj4g
PiA+IGluZGV4IGViNjZhMTVjMDAyZi4uMDJjYzVjMTFiNjE3IDEwMDY0NAo+ID4gPiAtLS0gYS9k
cml2ZXJzL2dwaW8vZ3Bpby1zcGFjZW1pdC1rMS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3Bpby9n
cGlvLXNwYWNlbWl0LWsxLmMKPiA+ID4gQEAgLTE1LDI4ICsxNSwxOSBAQAo+ID4gPiAgI2luY2x1
ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L3NlcV9m
aWxlLmg+Cj4gPiA+CltzbmlwXS4uLgo+ID4gPiAgc3RhdGljIHUzMiBzcGFjZW1pdF9ncGlvX2Jh
bmtfaW5kZXgoc3RydWN0IHNwYWNlbWl0X2dwaW9fYmFuayAqZ2IpCj4gPiA+ICB7Cj4gPiA+ICAg
ICAgICAgcmV0dXJuICh1MzIpKGdiIC0gZ2ItPnNnLT5zZ2IpOwo+ID4gPiBAQCAtNjAsMTMgKzcw
LDE0IEBAIHN0YXRpYyB1MzIgc3BhY2VtaXRfZ3Bpb19iYW5rX2luZGV4KHN0cnVjdCBzcGFjZW1p
dF9ncGlvX2JhbmsgKmdiKQo+ID4gPiAgc3RhdGljIGlycXJldHVybl90IHNwYWNlbWl0X2dwaW9f
aXJxX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqZGV2X2lkKQo+ID4gPiAgewo+ID4gPiAgICAgICAg
IHN0cnVjdCBzcGFjZW1pdF9ncGlvX2JhbmsgKmdiID0gZGV2X2lkOwo+ID4gPiArICAgICAgIHN0
cnVjdCBzcGFjZW1pdF9ncGlvICpzZyA9IGdiLT5zZzsKPiA+ID4gICAgICAgICB1bnNpZ25lZCBs
b25nIHBlbmRpbmc7Cj4gPiA+ICAgICAgICAgdTMyIG4sIGdlZHI7Cj4gPiA+Cj4gPiA+IC0gICAg
ICAgZ2VkciA9IHJlYWRsKGdiLT5iYXNlICsgU1BBQ0VNSVRfR0VEUik7Cj4gPiA+ICsgICAgICAg
Z2VkciA9IHJlYWRsKGdiLT5iYXNlICsgdG9fc3BhY2VtaXRfZ3Bpb19yZWdzKHNnKS0+Z2Vkcik7
Cj4gPiAKPiA+IFNpbmNlIHlvdSdyZSBhbHJlYWR5IHRvdWNoaW5nIGFsbCB0aGVzZSByZWdpc3Rl
ciBhY2Nlc3NlcyAtIGNhbiB5b3UKPiA+IG1heWJlIHByb3ZpZGUgZGVkaWNhdGVkIHdyYXBwZXIg
ZnVuY3Rpb25zIGFyb3VuZCByZWFkbCgpL3dyaXRlbCgpIGFuZAo+ID4gYXZvaWQgYW55IGZpbGUt
d2lkZSBjaGFuZ2VzIGluIHRoZSBmdXR1cmUgaWYgYW55dGhpbmcgcmVxdWlyZXMgZnVydGhlcgo+
ID4gbW9kaWZpY2F0aW9uPwo+ID4gCj4gY2FuIHlvdSBlbGFib3JhdGUgYSBiaXQgZnVydGhlciBv
biB0aGlzPwo+IEkgZG9uJ3QgZ2V0IGhvdyBhIHdyYXBwZXIgaGVscGVyIGNvdWxkIGhlbHAgdG8g
YXZvaWQgZmlsZS13aWRlIGNoYW5nZXMuLgo+IApoZXJlIGlzIG15IGF0dGVtcHQgdG8gc29sdmUg
dGhpcywgZGVmaW5lIGEgbWFjcm8gdG8gcmVnaXN0ZXIgYWRkcmVzczoKCiNkZWZpbmUgdG9fc3Bh
Y2VtaXRfZ3Bpb19yZWdzKGdiKSAoKGdiKS0+c2ctPmRhdGEtPnJlZ19vZmZzZXRzKQoKI2RlZmlu
ZSBTUEFDRU1JVF9HRURSKGdiKSAgICAgICgoZ2IpLT5iYXNlICsgdG9fc3BhY2VtaXRfZ3Bpb19y
ZWdzKGdiKS0+Z2VkcikKCglnZWRyID0gcmVhZGwoU1BBQ0VNSVRfR0VEUihnYikpOwoKcGxlYXNl
IGxldCBtZSBrbm93IGlmIHRoaXMgZm9sbG93IHlvdXIgc3VnZ2VzdGlvbiBvciBub3QKCi0tIApZ
aXh1biBMYW4gKGRsYW4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
