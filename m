Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B36AFF8862
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 07:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p9DwufXvhvRfb8YxFutBaCcq+wc1OkMQ60kOA3JgEKY=; b=LbWWIP631HJ4a3
	8XUGxp7I14aQ9dnHh4oq93dhRf+xyDFGxXsO/ZnSASCAEN3k4LoOOEyq7EuCUW6OpVCuEheCxMxox
	Gm7Om0cdmNus+FYPjP7WPYsjkWZFm4YSvPFgLWI0mIGtU9VVpXaXHddQEDdECOo9er2wvOGYNu/Yr
	nqq8IFGnZkCMkGvQp3mfkFx1qSioJYtxlKyal0/cnUn8tTu+hs7dqXFhPjsOxJOTTJu6k+mdItVbG
	xfcXcBT2bfWsWFRBeRd8XSnKyb0+gtG8rWgLiCFkNx94EQLt//tvOCsfkc+CLuU+C8N0teUN2dhRz
	18uKuRRnLc7CrFg/bbww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHGS5-0000000GO0B-150W;
	Mon, 27 Apr 2026 07:32:21 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHGS1-0000000GNza-0A1j
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 07:32:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=9daiWUd7+mDFWppd/lLOASVmD/eZMAIDQ
	fi0EwUbB8o=; b=N7sMJ2QgL6XBV0wtW5cpZ/1rA44oP2O5kQW3qtOPXgfkfKsSx
	S2URw5PtkEw/GLM8DaBQbdzuEFHvZwM/CHROGElWD9aTstZzMlKAminWXNn9eSVo
	nmjU3P0DqjyRjjvyUt5O34BimApD/WqcOvMhySMbTr0Dd39nW4yVJO+t/8=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDXEEIcEe9pwwEDAA--.1554S2;
	Mon, 27 Apr 2026 15:32:45 +0800 (CST)
MIME-Version: 1.0
Subject: Re: [PATCH v4 2/4] serial: 8250_dw: build Renesas RZN1 CPR value
 from DW_UART_CPR_* definitions
From: Jia Wang <wangjia@ultrarisc.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Jia Wang <wangjia@ultrarisc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 linux-serial <linux-serial@vger.kernel.org>, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <aeuJTMqADw8J0x0u@ashevche-desk.local>
References: <20260424-ultrarisc-serial-v4-0-1765a0b4c4a0@ultrarisc.com>
 <20260424-ultrarisc-serial-v4-2-1765a0b4c4a0@ultrarisc.com>
 <4548483c-cbba-899e-6b1a-1290d36b59cd@linux.intel.com>
 <aetv2ljDOpH_Hs4s@ashevche-desk.local>
 <363a636d-f014-cc29-6be4-ec3041f43855@linux.intel.com>
 <aeuJTMqADw8J0x0u@ashevche-desk.local>
Date: Mon, 27 Apr 2026 15:32:00 +0800
Message-Id: <177727512077.1796253.17951689513534549167.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777275121; l=1960;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=z6STT3pmp/kQBgHhBzbeymcDt4gyan7Jmn4OwjXUfv8=;
 b=Zmk7cQzNqKX2aQZQQyrNt5HXRMNdjrAcbrEgt4ShlWIw9e2VNfgYrlj6XxHuyq4nBzzOfBOmT
 rcay0btFWpBDRxDF7nT33gZad7L1/8UktLaSjW/pLS0coTWS7LZ0xcn
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwDXEEIcEe9pwwEDAA--.1554S2
X-Coremail-Antispam: 1UD129KBjvJXoW7trWxtw13GFW8XryDZryDAwb_yoW8Cr1Dpr
	W3Wa4jqFZ7KrnrAr4kt3WFqF4rtFs8JFyDXrn8Xry8AFZF9r1agrW8tFWYkF9rZrn3Aw1U
	Aa1UXa9xu34vvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAKEWnti78ACwAHsm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_003217_504417_F74CE464 
X-CRM114-Status: GOOD (  21.90  )
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

T24gMjAyNi0wNC0yNCAxODoxNiArMDMwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+IE9uIEZy
aSwgQXByIDI0LCAyMDI2IGF0IDA1OjA5OjQ2UE0gKzAzMDAsIElscG8gSsOkcnZpbmVuIHdyb3Rl
Ogo+ID4gT24gRnJpLCAyNCBBcHIgMjAyNiwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+ID4gPiBP
biBGcmksIEFwciAyNCwgMjAyNiBhdCAwMjozODo1NlBNICswMzAwLCBJbHBvIErDpHJ2aW5lbiB3
cm90ZToKPiA+ID4gPiBPbiBGcmksIDI0IEFwciAyMDI2LCBKaWEgV2FuZyB3cm90ZToKPiAKPiAu
Li4KPiAKPiA+ID4gPiBIbW0sIG1heWJlIHRoZXJlIHNob3VsZCBhbHNvIGJlIG1hY3JvIGFsc28g
Zm9yIHRoaXMgb25lIHdoaWNoIHRha2VzIHRoZSAKPiA+ID4gPiBmaWZvc2l6ZSBhcyBpbnB1dCBh
bmQgY29udmVydHMgaXQgdG8gQ1BSIGZpZWxkIHZsYXVlIChlZmZlY3RpdmVseSwgdGhlIAo+ID4g
PiA+IG1hY3JvIGlzIGFuIGludmVyc2Ugb2YgRFdfVUFSVF9DUFJfRklGT19TSVpFKCkpLiBJdCB3
b3VsZCBiZSBtb3JlIHJlYWRhYmxlIAo+ID4gPiA+IHRoYW4gdGhlIGxpdGVyYWwuCj4gPiA+IAo+
ID4gPiBCdXQgdGhpcyBjYW4gYmUgZG9uZSBzZXBhcmF0ZWx5LCByaWdodD8KPiA+IAo+ID4gSXQn
cyBsb2dpY2FsbHkgcGFydCBvZiB0aGUgY3ByX3ZhbHVlIGxpdGVyYWwgdG8gZGVmaW5lcyBjb252
ZXJzaW9uIChvZiAKPiA+IGNvdXJzZSBvbmUgY291bGQgaW50cm9kdWNlIGl0IGluIG93biBwYXRj
aCB3aXRob3V0IHVzZXJzIGJ1dCBJIGRvbid0IHNlZSAKPiA+IG11Y2ggYmVuZWZpdCBmcm9tIHRo
YXQpLgo+IAo+IE5vIG9iamVjdGlvbnMuCj4gCj4gPiA+ID4gQWxzbyBpbmNsdWRlIEJVSUxEX0JV
R19PTighSVNfQUxJR05FRChmaWZvc2l6ZSwgMTYpICsgYm91bmRzIGNoZWNrcykgCj4gPiA+ID4g
aW5zaWRlIHRoYXQgbWFjcm8gdG8gY2F0Y2ggaW52YWxpZCBmaWZvIHNpemVzICgrIGRvbid0IGZv
cmdldCB0aGUgCj4gPiA+ID4gbmVjZXNzYXJ5IGhlYWRlcnMgZm9yIHRob3NlIHR3byBuZXcgdGhp
bmdzKS4KPiA+ID4gCj4gPiA+IEhtbS4uLiBTb21lIGRldmljZXMgbWF5IGhhdmUgRklGTyA9IDgg
b3IgNCBieXRlcyAoSW50ZWwgUXVhcmsgSUlSQyBoYXMgbGVzcwo+ID4gPiB0aGFuIDE2IGFuZCBp
dCdzIERXIElQKS4KPiA+IAo+ID4gUGVyaGFwcyBidXQgYWNjb3JkaW5nIHRoZSBEVyBkYXRhYm9v
ayBJJ3ZlIGF0IGhhbmQsIHRoZXJlIGFyZSBubyB2YWx1ZXMgaW4gCj4gPiBGSUZPX01PREUgZmll
bGQgZm9yIHN1Y2ggRklGTyBzaXplcy4gU28gd2hhdCB3b3VsZCBDUFIgY29udGFpbiBpbiB0aG9z
ZQo+ID4gY2FzZXMgZm9yIEZJRk9fTU9ERSBmaWVsZD8KPiAKPiBPbiByZWFsIEhXIGl0IHJldHVy
bnMgMHMgZm9yIGFsbCByZWdpc3RlcnMgYWJvdmUgMHgwNyAobXVsdGlwbGllZCBieSA0IGFzCj4g
YSBzdHJpZGUpLiBCdXQgSSBhbHNvIGNoZWNrZWQgdGhlIHZhbHVlcyBvZiB4bWl0X2ZpZm9fc2l6
ZSBhbmQgaXQgc2hvd3MgMTYuCj4gV2hhdCA4IGlzIGl0IGlzIHRoZSBETUEgbWF4X2J1cnN0LiBI
ZW5jZSB0aGUgcHJvcG9zZWQgYXNzZXJ0aW9uIHNob3VsZCB3b3JrLgo+IAoKVGhhbmtzIGZvciB0
aGUgZGlzY3Vzc2lvbiBhbmQgY2xhcmlmaWNhdGlvbi4gSSdsbCBhZGQgdGhlIG1hY3JvCkRXX1VB
UlRfQ1BSX0ZJRk9fTU9ERV9GUk9NX1NJWkUoKSBpbiA4MjUwX2R3bGliLmggKGluIHBhdGNoIDIp
IHdpdGggdGhlCnN1Z2dlc3RlZCBidWlsZOKAkXRpbWUgY2hlY2tzICh1c2luZyBCVUlMRF9CVUdf
T05fWkVSTyBmb3IgYm91bmRzIHZhbGlkYXRpb24pLAogYW5kIHVwZGF0ZSBwYXRjaCA0IHRvIHVz
ZSBpdC4KCj4gLS0gCj4gV2l0aCBCZXN0IFJlZ2FyZHMsCj4gQW5keSBTaGV2Y2hlbmtvCj4gCj4g
Cj4gCgpCZXN0IFJlZ2FyZHMsCkppYSBXYW5nCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
