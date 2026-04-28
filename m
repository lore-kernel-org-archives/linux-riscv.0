Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E998FF885D
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 09:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VdC1A+LOm64TzSjKihBcZdRoSqDtU/0VLY2zNxH7sxY=; b=scdws24H4KPSCL
	MPd60s2hq/hlTMOWqrs8kzZKVpmKbTNZHDhTiqMyFxL6B3xc8H7hPSrIlvIJNYpHgKIyyonKI6nvQ
	OdCjnmd8nnfDJe0CnZcLErFqCUZKCrqFWTPVu8RUnekHD67lv5ilTRTHuMB5aZzVglg24Mhei33Iu
	pT4B0S2rc9s4EsBCjZB1NQB34+V3fzigw5WRND/bfLtcLIk2DcoRh+Y9jZZNgbsW2l0GEaoxIeiw6
	bVWRsji0Mhny9YYB4J2GFHOTBQNJSNXnPOlKa0TUUDD0L8sO0Zfj9h3Q8+EeM7BJjUJ3SLow9JTFS
	9aikStMLi4HcEHqx99IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeQm-000000011g3-2KIU;
	Tue, 28 Apr 2026 09:08:36 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeQi-000000011fj-2FTT
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 09:08:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=HzVvXkjtHMlQP5m5OfYGE0prQLJfO2WXW
	lW0bXC9e0o=; b=BprzMAnxHu8qpAQ60zB79QIzvsguVv0nazLSx1nLX2+04id0e
	FUH3gZ0Oa576B1u4KcgZkt1g4OMV1vbu87tJeOEc6QhEPfivHB1U53HFkC2KFNEF
	Lpm3nNmAut6F6pv7y1OG62ULfhwdiK6q6NcYY47sqRnzYFpvYOuIptMz2w=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDXEEIRefBpaBUDAA--.1579S2;
	Tue, 28 Apr 2026 17:08:33 +0800 (CST)
MIME-Version: 1.0
Subject: Re: [PATCH v5 2/4] serial: 8250_dw: build Renesas RZN1 CPR value
 from DW_UART_CPR_* definitions
From: Jia Wang <wangjia@ultrarisc.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jia Wang <wangjia@ultrarisc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 linux-serial <linux-serial@vger.kernel.org>, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <23c80500-f2c1-0eb3-f640-00f7b108059b@linux.intel.com>
References: <20260428-ultrarisc-serial-v5-0-97de63b1e3eb@ultrarisc.com>
 <20260428-ultrarisc-serial-v5-2-97de63b1e3eb@ultrarisc.com>
 <afBhkbGLsuqUitOl@ashevche-desk.local>
 <23c80500-f2c1-0eb3-f640-00f7b108059b@linux.intel.com>
Date: Tue, 28 Apr 2026 17:07:49 +0800
Message-Id: <177736726936.2886867.7725295920724488690.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777367269; l=3351;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=r57WeZxTj6pt4VOVxJMhJeP2CSBC7RAURv6QcqEOJxY=;
 b=oJkdrzOOf8Wb25XGDhMGiao3y9Xh8lMSkwBohAqxsvQOl1CRKqKHWrP+FmHIw7loxcZMK6LgY
 nRoHiAv5p1uA9BlB9HLaakkU1FFmDDkawSvPH+sa0Z0CirPA6QVYM39
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwDXEEIRefBpaBUDAA--.1579S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWF4xWFy8Ww13uF4kJFyxZrb_yoW5Zr15pF
	yfKa1Uta18GF1kG340y3y2va1SqF1rGw10qFyUur1UAan0vrn2qw1qvFZIkrZ7ZFZ5CayY
	gFsFqrnxu34rt3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAKEWnti78ACwA0sV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_020833_662020_A18FA0E0 
X-CRM114-Status: GOOD (  27.64  )
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

T24gMjAyNi0wNC0yOCAxMTo0MSArMDMwMCwgSWxwbyBKw6RydmluZW4gd3JvdGU6Cj4gT24gVHVl
LCAyOCBBcHIgMjAyNiwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+IAo+ID4gT24gVHVlLCBBcHIg
MjgsIDIwMjYgYXQgMDE6MjY6MjdQTSArMDgwMCwgSmlhIFdhbmcgd3JvdGU6Cj4gPiA+IFJlcGxh
Y2UgdGhlIG1hZ2ljIENQUiB2YWx1ZSBmb3IgUmVuZXNhcyBSWi9OMSB3aXRoIGEgY29tcG9zaXRp
b24gdXNpbmcKPiA+ID4gRFdfVUFSVF9DUFJfKiBiaXQvZmllbGQgZGVmaW5pdGlvbnMgYW5kIEZJ
RUxEX1BSRVBfQ09OU1QoKS4KPiA+ID4gCj4gPiA+IEludHJvZHVjZSBhIGhlbHBlciBtYWNybyB0
byBjb252ZXJ0IGEgRklGTyBzaXplIChieXRlcykgaW50byB0aGUgQ1BSCj4gPiA+IEZJRk9fTU9E
RSBmaWVsZCB2YWx1ZSwgd2l0aCBCVUlMRF9CVUdfT05fWkVSTygpIGNoZWNrcyBmb3IgYWxpZ25t
ZW50IGFuZAo+ID4gPiBib3VuZHMuIFVzZSBpdCB0byByZXBsYWNlIHRoZSBsaXRlcmFsIEZJRk9f
TU9ERSB2YWx1ZXMgaW4gdGhlIFJaTjEuCj4gPiAKPiA+IEEgY291cGxlIG9mIG5pdC1waWNrcyBi
ZWxvdy4gQWZ0ZXIgYWRkcmVzc2luZyB0aGVtIHlvdSBjYW4gYWRkCj4gPiAKPiA+IFJldmlld2Vk
LWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4K
PiA+IAo+ID4gLi4uCj4gPiAKPiA+ID4gICNpbmNsdWRlIDxsaW51eC9iaXRmaWVsZC5oPgo+ID4g
PiAgI2luY2x1ZGUgPGxpbnV4L2JpdHMuaD4KPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9idWlsZF9i
dWcuaD4KPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9hbGlnbi5oPgo+ID4gCj4gPiBQcmVzZXJ2ZSBv
cmRlciwgJ2EnIGdvZXMgYmVmb3JlICdiJy4KPiA+IAo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L2lv
Lmg+Cj4gPiA+ICAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPiA+IAo+ID4gLi4uCj4gPiAKPiA+
ID4gIC8qIEhlbHBlciBmb3IgRklGTyBzaXplIGNhbGN1bGF0aW9uICovCj4gPiA+ICAjZGVmaW5l
IERXX1VBUlRfQ1BSX0ZJRk9fU0laRShhKQkoRklFTERfR0VUKERXX1VBUlRfQ1BSX0ZJRk9fTU9E
RSwgKGEpKSAqIDE2KQo+ID4gCj4gPiA+ICsjZGVmaW5lIERXX1VBUlRfQ1BSX0ZJRk9fTU9ERV9N
QVgJMHg4MAo+ID4gCj4gPiBZb3UgdXNlZCBkZWNpbWFsIHZhbHVlcyBlbHNld2hlcmUgKGlkIGVz
dCAxNiksIHVzZSB1cHBlciBsaW1pdCBpbiBkZWNpbWFsCj4gPiBhcyB3ZWxsLgo+ID4gCj4gPiA+
ICsjZGVmaW5lIERXX1VBUlRfQ1BSX0ZJRk9fTU9ERV9GUk9NX1NJWkUoc2l6ZSkJCQkJXAo+ID4g
PiArCShCVUlMRF9CVUdfT05fWkVSTyghSVNfQUxJR05FRCgoc2l6ZSksIDE2KSkgKwkJCVwKPiA+
ID4gKwkgQlVJTERfQlVHX09OX1pFUk8oKChzaXplKSAvIDE2KSA+IERXX1VBUlRfQ1BSX0ZJRk9f
TU9ERV9NQVgpICsJXAo+ID4gPiArCSAoKHNpemUpIC8gMTYpKQo+ID4gCj4gPiBJIGRvbid0IHNl
ZSB0aGUgbmVlZCBpbiBoYXZpbmcgdGhhdCBtYXhpbXVtIGJlaW5nIGRlZmluZWQgc2VwYXJhdGVs
eSAod2UgZG9uJ3QKPiA+IGhhdmUgdGhhdCBmb3IgMTYsIG5vIG5lZWQgdG8gaGF2ZSBpdCBmb3Ig
MTI4Lgo+ID4gCj4gPiBTaW5jZSBzb21lIElTQTpzIGhhdmUgb25lIGFzc2VtYmx5IGluc3RydWN0
aW9uIHRvIGdldCBib3RoIC8gYW5kICUgZGl2aXNpb25zLAo+ID4gaXQncyBiZXR0ZXIgdG8gdXNl
IHRoYXQgaW5zdGVhZCBvZiBJU19BTElHTkVEKCkuIENhbiB5b3UgY2hlY2sgY29kZSBnZW5lcmF0
aW9uCj4gPiBmb3IgeDg2XzY0IC8geDg2Pwo+IAo+IERvIHRob3NlIEJVSUxEX0JVR3MgZXZlbiBn
ZW5lcmF0ZSBjb2RlLCBlc3BlY2lhbGx5IHdoZW4gdGhleSBhcmUgZXhwZWN0ZWQgCj4gdG8gb25s
eSBhcHBlYXIgaW4gYSBzdHJ1Y3QgaW5pdGlhbGl6ZXI/Cj4gCj4gPiAjZGVmaW5lIERXX1VBUlRf
Q1BSX0ZJRk9fTU9ERV9GUk9NX1NJWkUoc2l6ZSkJCQkJXAo+ID4gCShCVUlMRF9CVUdfT05fWkVS
Tygoc2l6ZSkgPiAyMDQ4KSArIEJVSUxEX0JVR19PTl9aRVJPKChzaXplKSAlIDE2KSArICgoc2l6
ZSkgLyAxNikpCj4gPiAKPiA+IE5vdGUsIEkgZHJvcHBlZCBmaXJzdCBkaXZpc2lvbiBpbiBvcmRl
ciB0byBzaG93IHRoZSB1cHBlciBsaW1pdCBpbiBhIHBsYWluCj4gPiBudW1iZXIgc2luY2UgMTYg
aXMgYWxzbyBGSUZPIHNpemUgaW4gYnl0ZXMuCj4gPiAKPiA+IEFsc28gbm90ZSwgdGhpcyBldmFs
dWF0ZXMgKHNpemUpIHRocmVlIHRpbWVzLCB3aGljaCBtaWdodCBiZSBwcm9ibGVtYXRpYywKPiA+
IGJ1dCBJIHRoaW5rIHdlIGNhbiBsZWF2ZSB3aXRoIHRoYXQgZm9yIG5vdy4KPiAKPiBJJ2QgcHV0
IGFsc28gRklFTERfUFJFUF9DT05TVCgpIGludG8gdGhlIG1hY3JvIGl0c2VsZiBhcyBJIGRvbid0
IHNlZSBtdWNoIAo+IHZhbHVlIGZvciB0aGlzIG1hY3JvIG91dHNpZGUgb2YgdGhvc2UgLmNwcl92
YWx1ZSBpbml0aWFsaXphdGlvbnMuCj4gCj4gSU1PLCB0aGUgZW50aXJlIG1hY3JvIHdvdWxkIGJl
IGNsZWFuZXIgbG9va2luZyBhcyBhIHRydWx5IG11bHRpLWxpbmUgCj4gY29uc3RydWN0LiBDYW4g
d2UgdXNlIHN0YXRpY19hc3NlcnQoKXMgaW4gc3RydWN0IGZpZWxkIGluaXRpYWxpemF0aW9uIAo+
IChJJ20gbm90IHN1cmUpLCBzb21ldGhpbmcgYWxvbmcgdGhlc2UgbGluZXM6Cj4gCj4gI2RlZmlu
ZSBEV19VQVJUX0NQUl9GSUZPX01PREVfRlJPTV9TSVpFKHNpemUpCQkJXAo+ICh7CQkJCQkJCQlc
Cj4gCXR5cGVvZiAoc2l6ZSkgX19zaXplID0gc2l6ZTsJCQkJXAo+IAkJCQkJCQkJXAo+IAlzdGF0
aWNfYXNzZXJ0KElTX0FMSUdORUQoKF9fc2l6ZSksIDE2KSk7CQlcCj4gCXN0YXRpY19hc3NlcnQo
X19zaXplIDw9IERXX1VBUlRfQ1BSX0ZJRk9fTU9ERV9NQVgpOwlcCj4gCQkJCQkJCQlcCj4gCUZJ
RUxEX1BSRVBfQ09OU1QoRFdfVUFSVF9DUFJfRklGT19NT0RFLCBfX3NpemUgLyAxNik7CVwKPiB9
KQo+IAoKVGhhbmtzLiBJIHRyaWVkIHRoYXQgYXBwcm9hY2gsIGJ1dCB0aGUgc3RhdGVtZW50LWV4
cHJlc3Npb24gZm9ybSBkb2VzCm5vdCB3b3JrIGluIHRoaXMgY2FzZSBiZWNhdXNlIHRoZSBoZWxw
ZXIgaXMgdXNlZCBpbiBzdGF0aWMgaW5pdGlhbGl6ZXJzLgpTbyBJJ2xsIGtlZXAgaXQgYXMgYSBw
bGFpbiBleHByZXNzaW9uIG1hY3JvIGZvciBub3csIGFuZCBqdXN0IHJld29yayBpdAppbnRvIGEg
Y2xlYW5lciBtdWx0aS1saW5lIGZvcm0uCgo+IC0tIAo+ICBpLgo+IAo+CgpCZXN0IFJlZ2FyZHMs
CkppYSBXYW5nIAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
