Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EA7C47DD9
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 17:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pDQstVWMa5I2rIo24dyAv2sO12QVxWaeTvRI4IDqp5I=; b=O34baaBYcAACd+
	iI+ERm0oJbqwZaLkG4qvmsHCyjoOSYp69gNsmoU6aOghwHh2+wjqkdnb5gOx/ouMfX/MGp6rk9tha
	6J1SOtvjmO48FSvvtR0ECVQFtW7onYsO9xg1hG+1+jDHmEoJMjsML9izOx2KzlgPoWYtOJVSuqmzA
	yq2kPAHRlCYhyXH/PQZ94mobXvEIAQWHb8gbVEl6loBf34or/AAWZ/Qp17Y4wcusonF3qoDL48R/b
	Wb5AAy2yoZi1JPE5KYiNbHDZzToRzkRPpRIr5kbFc8ByeAmqshmMVs6yICbIQhVemswbpFQPiVHwO
	D7qteVb/jBvc9rYp948g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRy7l-00DEdr-2h;
	Mon, 22 Jan 2024 17:30:17 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRy7i-00DEbx-1F;
	Mon, 22 Jan 2024 17:30:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tqeHdyzk9+LqVKL+Enz5ftndgdvcVseYfwgC7K5xJtc=; b=RX/YM9PwgXxnH0nCr+3iTk8zEu
	evRNa8qak5GpCSjIuF9kG8Ay111DoUzbNpfuCblFeFkBV/fTl433eI5+zAwCHTum0KS01/4Egw5yl
	CtcuTmz+CxuTQRXWXGvmhc7nGHZlb2VvQz+1yrMEKR7yDDAIdbmQaT5B4MQMK5DwYKhXFzXm9VySw
	jZW0uiJxM2NHvoRc0cunafkRBO7+IXV3Ba5DRwtXMnzKPSFxTpf0q/YJhA0/0zbu9jdfzOawjKtoM
	VbvdA1aeq1giRiAjuDGeujTIeI1BX41XMKWx1yFIWgavtQCfYdrinAa3q975nzSh5mU9bJXuzi2RC
	xS+GfMUg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34032)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rRy7a-0001Gs-09;
	Mon, 22 Jan 2024 17:30:06 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rRy7Z-0001C6-GD; Mon, 22 Jan 2024 17:30:05 +0000
Date: Mon, 22 Jan 2024 17:30:05 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, acpica-devel@lists.linuxfoundation.org,
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
	Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com,
	James Morse <james.morse@arm.com>
Subject: Re: [PATCH RFC v3 03/21] ACPI: processor: Register CPUs that are
 online, but not described in the DSDT
Message-ID: <Za6mHRJVjb6M1mun@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
 <E1rDOg2-00Dvjk-RI@rmk-PC.armlinux.org.uk>
 <CAJZ5v0ju1JHgpjuFLHZVs4NZiARG6iBZN_wza6c2e0kDhZjK0w@mail.gmail.com>
 <ZaURtUvWQyjYfiiO@shell.armlinux.org.uk>
 <20240122160227.00002d83@Huawei.com>
 <CAJZ5v0hamuXJ_w-TSmVb=5jGide=Lb7sCjbzzNb_rFuPrvkgxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0hamuXJ_w-TSmVb=5jGide=Lb7sCjbzzNb_rFuPrvkgxQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_093014_425777_25529E85 
X-CRM114-Status: GOOD (  36.78  )
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

T24gTW9uLCBKYW4gMjIsIDIwMjQgYXQgMDU6MjI6NDZQTSArMDEwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gTW9uLCBKYW4gMjIsIDIwMjQgYXQgNTowMuKAr1BNIEpvbmF0aGFuIENh
bWVyb24KPiA8Sm9uYXRoYW4uQ2FtZXJvbkBodWF3ZWkuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBN
b24sIDE1IEphbiAyMDI0IDExOjA2OjI5ICswMDAwCj4gPiAiUnVzc2VsbCBLaW5nIChPcmFjbGUp
IiA8bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiA+Cj4gPiA+IE9uIE1vbiwgRGVjIDE4
LCAyMDIzIGF0IDA5OjIyOjAzUE0gKzAxMDAsIFJhZmFlbCBKLiBXeXNvY2tpIHdyb3RlOgo+ID4g
PiA+IE9uIFdlZCwgRGVjIDEzLCAyMDIzIGF0IDE6NDnigK9QTSBSdXNzZWxsIEtpbmcgPHJtaytr
ZXJuZWxAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBGcm9tOiBK
YW1lcyBNb3JzZSA8amFtZXMubW9yc2VAYXJtLmNvbT4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBBQ1BJ
IGhhcyB0d28gZGVzY3JpcHRpb25zIG9mIENQVXMsIG9uZSBpbiB0aGUgTUFEVC9BUElDIHRhYmxl
LCB0aGUgb3RoZXIKPiA+ID4gPiA+IGluIHRoZSBEU0RULiBCb3RoIGFyZSByZXF1aXJlZC4gKEFD
UEkgNi41J3MgOC40ICJEZWNsYXJpbmcgUHJvY2Vzc29ycyIKPiA+ID4gPiA+IHNheXMgIkVhY2gg
cHJvY2Vzc29yIGluIHRoZSBzeXN0ZW0gbXVzdCBiZSBkZWNsYXJlZCBpbiB0aGUgQUNQSQo+ID4g
PiA+ID4gbmFtZXNwYWNlIikuIEhhdmluZyB0d28gZGVzY3JpcHRpb25zIGFsbG93cyBmaXJtd2Fy
ZSBhdXRob3JzIHRvIGdldAo+ID4gPiA+ID4gdGhpcyB3cm9uZy4KPiA+ID4gPiA+Cj4gPiA+ID4g
PiBJZiBDUFVzIGFyZSBkZXNjcmliZWQgaW4gdGhlIE1BRFQvQVBJQywgdGhleSB3aWxsIGJlIGJy
b3VnaHQgb25saW5lCj4gPiA+ID4gPiBlYXJseSBkdXJpbmcgYm9vdC4gT25jZSB0aGUgcmVnaXN0
ZXJfY3B1KCkgY2FsbHMgYXJlIG1vdmVkIHRvIEFDUEksCj4gPiA+ID4gPiB0aGV5IHdpbGwgYmUg
YmFzZWQgb24gdGhlIERTRFQgZGVzY3JpcHRpb24gb2YgdGhlIENQVXMuIFdoZW4gQ1BVcyBhcmUK
PiA+ID4gPiA+IG1pc3NpbmcgZnJvbSB0aGUgRFNEVCBkZXNjcmlwdGlvbiwgdGhleSB3aWxsIGVu
ZCB1cCBvbmxpbmUsIGJ1dCBub3QKPiA+ID4gPiA+IHJlZ2lzdGVyZWQuCj4gPiA+ID4gPgo+ID4g
PiA+ID4gQWRkIGEgaGVscGVyIHRoYXQgcnVucyBhZnRlciBhY3BpX2luaXQoKSBoYXMgY29tcGxl
dGVkIHRvIHJlZ2lzdGVyCj4gPiA+ID4gPiBDUFVzIHRoYXQgYXJlIG9ubGluZSwgYnV0IHdlcmVu
J3QgZm91bmQgaW4gdGhlIERTRFQuIEFueSBDUFUgdGhhdAo+ID4gPiA+ID4gaXMgcmVnaXN0ZXJl
ZCBieSB0aGlzIGNvZGUgdHJpZ2dlcnMgYSBmaXJtd2FyZS1idWcgd2FybmluZyBhbmQga2VybmVs
Cj4gPiA+ID4gPiB0YWludC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBRZW11IFRDRyBvbmx5IGRlc2Ny
aWJlcyB0aGUgZmlyc3QgQ1BVIGluIHRoZSBEU0RULCB1bmxlc3MgY3B1LWhvdHBsdWcKPiA+ID4g
PiA+IGlzIGNvbmZpZ3VyZWQuCj4gPiA+ID4KPiA+ID4gPiBTbyB3aHkgaXMgdGhpcyBhIGtlcm5l
bCBwcm9ibGVtPwo+ID4gPgo+ID4gPiBTbyB3aGF0IGFyZSB5b3UgcHJvcG9zaW5nIHNob3VsZCBi
ZSB0aGUgYmVoYXZpb3VyIGhlcmU/IFdoYXQgdGhpcwo+ID4gPiBzdGF0ZW1lbnQgc2VlbXMgdG8g
YmUgc2F5aW5nIGlzIHRoYXQgUUVNVSBhcyBpdCBleGlzdHMgdG9kYXkgb25seQo+ID4gPiBkZXNj
cmliZXMgdGhlIGZpcnN0IENQVSBpbiBEU0RULgo+ID4KPiA+IFRoaXMgY29uZnVzZXMgbWUgc29t
ZXdoYXQsIGJlY2F1c2UgSSdtIGZhciBmcm9tIHN1cmUgd2hpY2ggbWFjaGluZXMgdGhpcwo+ID4g
aXMgdHJ1ZSBmb3IgaW4gUUVNVS4gIEknbSBndWVzc2luZyBpdCdzIGEgbGVnYWN5IHRoaW5nIHdp
dGgKPiA+IHNvbWUgb2xkIGRpc3RybyB2ZXJzaW9uIG9mIFFFTVUgLSBzbyB3ZSdsbCBoYXZlIHRv
IHBhcGVyIG92ZXIgaXQgYW55d2F5Cj4gPiBidXQgZm9yIGN1cnJlbnQgUUVNVSBJJ20gbm90IHN1
cmUgaXQncyB0cnVlLgo+ID4KPiA+IEhlbHBmdWxseSB0aGVyZSBhcmUgYSBidW5jaCBvZiBBQ1BJ
IHRhYmxlIHRlc3RzIHNvIEkndmUgYmVlbiBjaGVja2luZwo+ID4gdGhyb3VnaCBhbGwgdGhlIG11
bHRpIENQVSBjYXNlcy4KPiA+Cj4gPiBDUFUgaG90cGx1ZyBub3QgZW5hYmxlZC4KPiA+IHBjL0RT
RFQuZGltbXB4bSAgLSA0eCBQcm9jZXNzb3IgZW50cmllcy4gIC1zbXAgNAo+ID4gcGMvRFNEVC5h
Y3BpaG1hdCAtIDJ4IFByb2Nlc3NvciBlbnRyaWVzLiAgLXNtcCAyCj4gPiBxMzUvRFNEVC5hY3Bp
aG1hdCAtIDJ4IFByb2Nlc3NvciBlbnRyaWVzLiAtc21wIDIKPiA+IHZpcnQvRFNEVC5hY3BpaG1h
dHZpcnQgLSA0eCBBQ1BJMDAwNyBlbnRyaWVzIC1zbXAgNAo+ID4gcTM1L0RTRFQuYWNwaWhtYXQt
bm9pbml0aWF0b3IgLSA0IHggUHJvY2Vzc29yICgpIGVudHJpZXMgLXNtcCA0Cj4gPiB2aXJ0L0RT
RFQudG9wb2xvZ3kgLSA4eCBBQ1BJMDAwNyBlbnRyaWVzCj4gPgo+ID4gSSd2ZSBhbHNvIGxvb2tl
ZCBhdCB0aGUgY29kZSBhbmQgd2UgaGF2ZSB2YXJpb3VzIHR5cGVzIG9mCj4gPiBDUFUgaG90cGx1
ZyBvbiB4ODYgYnV0IHRoZXkgYWxsIGJ1aWxkIGFwcHJvcHJpYXRlIG51bWJlcnMgb2YKPiA+IFBy
b2Nlc3NvcigpIGVudHJpZXMgaW4gRFNEVC4KPiA+IEFybSBsaWtld2lzZSBzZWVtcyB0byBidWls
ZCB0aGUgcmlnaHQgbnVtYmVyIG9mIEFDUEkwMDA3IGVudHJpZXMKPiA+IChhbmQgZG9lc24ndCB5
ZXQgaGF2ZSBDUFUgSFAgc3VwcG9ydCkuCj4gPgo+ID4gSWYgYW55b25lIGNhbiBhZGQgYSByZWZl
cmVuY2Ugb24gd2h5IHRoaXMgaXMgbmVlZGVkIHRoYXQgd291bGQgYmUgdmVyeQo+ID4gaGVscGZ1
bC4KPiAKPiBZZXMsIGl0IHdvdWxkLgo+IAo+IFBlcnNvbmFsbHksIEkgd291bGQgcHJlZmVyIHRv
IGFzc3VtZSB0aGF0IGl0IGlzIG5vdCBuZWNlc3NhcnkgdW50aWwgaXQKPiB0dXJucyBvdXQgdGhh
dCAoMSkgdGhlcmUgaXMgZmlybXdhcmUgd2l0aCB0aGlzIGlzc3VlIGFjdHVhbGx5IGluIHVzZQo+
IGFuZCAoMikgdXBkYXRpbmcgdGhlIGZpcm13YXJlIGluIHF1ZXN0aW9uIHRvIGZvbGxvdyB0aGUg
c3BlY2lmaWNhdGlvbgo+IGlzIG5vdCBwcmFjdGljYWwuCj4gCj4gT3RoZXJ3aXNlLCB3ZSdkIG1h
a2UgaXQgZWFzaWVyIHRvIHNoaXAgbm9uLWNvbXBsaWFudCBmaXJtd2FyZSBmb3Igbm8KPiBnb29k
IHJlYXNvbi4KCklmIFNhbGlsIGNhbid0IGNvbWUgdXAgd2l0aCBhIHJlYXNvbiwgdGhlbiBJJ20g
aW4gZmF2b3VyIG9mIGRyb3BwaW5nCnRoZSBwYXRjaCBsaWtlIGFscmVhZHkgZG9uZSBmb3IgcGF0
Y2ggMi4gSWYgdGhlIGNvZGUgY2hhbmdlIHNlcnZlcyBubwp1c2VmdWwgcHVycG9zZSwgdGhlcmUn
cyBubyBwb2ludCBpbiBtYWtpbmcgdGhlIGNoYW5nZS4KCi0tIApSTUsncyBQYXRjaCBzeXN0ZW06
IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8KRlRUUCBpcyBo
ZXJlISA4ME1icHMgZG93biAxME1icHMgdXAuIERlY2VudCBjb25uZWN0aXZpdHkgYXQgbGFzdCEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
