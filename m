Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA44DCC6B1A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 10:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+c7QWp1xHtjRP8PJOukUQimuQZxJQhDTcwr9+8zlrY4=; b=azt/Ef2nwcGFc3
	PTptCD8zo87EBNNQBnLsVzq0cwd/dsaJq5/L44sKSPvDhTpAYZ5AqPEFRkuT8gz80OQBm1FpQoyhR
	5Z+lKNATNUrv8ak7mrIPlbOLpDiyVaDdFtJ85Y+3KhAsZuelhq8Edj/1RivEjkeRvs3g5RskIRDm+
	0TeJ2iz9u32YbX5qcPjbFqnEYoanAd/HS3X0fg7etlHQXqNaEbU9pkPBwygk7rVTcrhp6fLh2pdDL
	u8LNPi/2VbtxDLPhMKGPM10/D98a+FDlSgKBth2iQ1De/sBr8+wr2VV7/FhX7iTDaFHHqM0BwtFe/
	/Sin4zz15teor2zNj6OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwbo-0000000FFiZ-00rH;
	Wed, 14 Oct 2026 10:53:20 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwbk-0000000FFi5-376Z
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 10:53:18 +0000
Date: Wed, 14 Oct 2026 12:53:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791975194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Kygbp8cZypTKiQmO5xyQ6S7jVl/BhpU4TxaEVjtZwg=;
	b=FE6zXOb1ibNkTIYX9fkmtAKRCszNmJLjiHlLN/7PozaNiolBOlMji8xNG8cdJJsIRrJWXS
	7+2OljmQqPlWPszEsqldwe4K0uwCxkjrOkGJfmtyZf14gxsMDCS6ggognEGM/MqG9zKtCk
	03P+FK6hW2UDJfcHW54aLmZp5pgERv5ddfHPoiem9DGMWXSEse6ZV7uqj3JesrvwdfwUFf
	tcUXGYo+Rqh5gITtUGdWa4VsG7oxbrJg1/laWgpZDhAYTc788Gu+5F/mZVRrZzxUZ/B0ra
	lF+tLDkLNHrTbv2H/nqyGPSq1OP5sBYQPquBXKKA0f4uYbD6P6FFn5fgwz+ecg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791975194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Kygbp8cZypTKiQmO5xyQ6S7jVl/BhpU4TxaEVjtZwg=;
	b=0Jtz5jgLsKOaOlDQ7uCL0ljyUcsUiyj6k2yO7j90IAm+/pYt0CVoOyUVkS+tRMGavuCqGw
	bfK8Pepdy+qwvBBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
Cc: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jessica Liu <liu.xuemei1@zte.com.cn>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v3] irqchip/riscv-aplic: fix asynchronous probing
Message-ID: <20261014105312.xNkvgkGg@linutronix.de>
References: <20261012-aplic-async-probe-v3-1-5cf52dc28690@mobileye.com>
 <20261013152727.2cUDX3l0@linutronix.de>
 <5a8048ef-a241-4486-adc1-440721d3606a@mobileye.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5a8048ef-a241-4486-adc1-440721d3606a@mobileye.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_035316_952386_4DCC2E52 
X-CRM114-Status: GOOD (  26.70  )
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

T24gMjAyNi0xMC0xNCAxMToxNTowNSBbKzAzMDBdLCBWbGFkaW1pciBLb25kcmF0aWV2IHdyb3Rl
Ogo+IE9uIDEwLzEzLzI2IDE4OjI3LCBTZWJhc3RpYW4gQW5kcnplaiBTaWV3aW9yIHdyb3RlOgo+
ID4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBhbnkgbGlua3Mgb3Igb3BlbiBhbnkgYXR0
YWNobWVudHMgdW5sZXNzIHlvdSB0cnVzdCB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50
IGlzIHNhZmUuCj4gPiAKPiA+IE9uIDIwMjYtMTAtMTIgMTI6MTI6NTkgWyswMzAwXSwgVmxhZGlt
aXIgS29uZHJhdGlldiB3cm90ZToKPiA+PiBib29sZWFuIGZsYWcgZG9uJ3QgcHJvdGVjdCBmcm9t
IHJhY2Ugd2hlbiBwcm9iaW5nIHNldmVyYWwgaW5zdGFuY2VzCj4gPj4gYXN5bmNocm9ub3VzbHku
IE9uIHN5c3RlbSB3aXRoIG11bHRpcGxlIEFQTElDcywgaWYgcHJvYmVkIGFzeW5jaHJvbm91c2x5
LAo+ID4+IHdhcm5pbmcgdHJpZ2dlcmVkIGFzIGJlbG93Lgo+ID4gCj4gPiBXaHkgaXMgdGhpcyBh
c3luYz8gRG9lc24ndCBfX3BsYXRmb3JtX2RyaXZlcl9wcm9iZSgpIHNldCBpdCB0byBzeW5jPwo+
IAo+IFllcyBpdCBkb2VzIGJ1dCBhcGxpYyBkcml2ZXIgdXNlcwo+IAo+IGJ1aWx0aW5fcGxhdGZv
cm1fZHJpdmVyKGFwbGljX2RyaXZlcik7Cj4gCj4gdGhhdCB0YWtlcyBkaWZmZXJlbnQgcm91dGUu
IEVhc3kgd2F5IHRvIGRpcmVjdGx5IHByb29mIGl0OiBJIGJvb3Qgd2l0aAo+IAo+IGRyaXZlcl9h
c3luY19wcm9iZT0qIGR5bmRiZz1cImZ1bmMgX19kcml2ZXJfYXR0YWNoICtwXCIKPiAKPiB0byBy
ZXF1ZXN0IGFzeW5jaHJvbm91cyBwcm9iZSBhbmQgZGVidWcgcHJpbnRzIGluIHRoZSBfX2RyaXZl
cl9hdHRhY2gKPiBzaG93czoKPiBbICAgIDAuMjM2NDgzXSBwbGF0Zm9ybSA0ODc2MDAwMC5pbnRl
cnJ1cHQtY29udHJvbGxlcjogcHJvYmluZyBkcml2ZXIgcmlzY3YtYXBsaWMgYXN5bmNocm9ub3Vz
bHkKPiBbICAgIDAuMjM2NTEzXSBwbGF0Zm9ybSA2NzRlMDAwMC5pbnRlcnJ1cHQtY29udHJvbGxl
cjogcHJvYmluZyBkcml2ZXIgcmlzY3YtYXBsaWMgYXN5bmNocm9ub3VzbHkKPiBbICAgIDAuMjM2
NTM5XSBwbGF0Zm9ybSA2NzU2MDAwMC5pbnRlcnJ1cHQtY29udHJvbGxlcjogcHJvYmluZyBkcml2
ZXIgcmlzY3YtYXBsaWMgYXN5bmNocm9ub3VzbHkKCkRvZXMgImRyaXZlcl9hc3luY19wcm9iZT0q
IiBtYXJrIF9hbGxfIGRyaXZlcnMgYXMgc2FmZSBhbmQgeW91IHJ1biBpbnRvCmEgcHJvYmxlbSB3
aGVyZSBhIGRyaXZlciBpc24ndCBzYWZlPyBEb2VzIHRoZSAiZHluZGJnPSIgYXJndW1lbnQgc2hv
dwp0aGUgZHJpdmVyIGlzIHByb2JlZCBhc3luY2hyb25vdXNseSBpZiB5b3Ugb21pdCB0aGUgImRy
aXZlcl9hc3luY19wcm9iZSIKYXJndW1lbnQ/ClNvIHRoZSBxdWVzdGlvbiBpcyBkbyB3ZSB3YW50
IHRvIGxldCBpdCBwcm9iZSBhc3luY2hyb25vdXNseSBvciBzaG91bGQKd2UgZm9yY2UgaXQgdG8g
c3luYy4KCj4gPiBXb3VsZCB5b3UgbWluZCBwcm92aWRpbmcgYSBjb2hlcmVudCBkZXNjcmlwdGlv
biBvZiB0aGUgcHJvYmxlbSBhbmQKPiA+IGltcGxlbWVudGVkIHNvbHV0aW9uIGluc3RlYWQgb2Yg
c2xhcHBpbmcgY29uc29sZSBvdXRwdXQ/Cj4gCj4gU29ycnkgaWYgaXQgd2FzIG5vdCBjbGVhcjsg
c2hhbGwgSSBleHBsYWluIGluIGRldGFpbHMgd2h5IHBhdHRlcm4KPiAKPiBpZiAoIWRvbmUpIHsK
PiAJZG9fc29tZXRoaW5nKCk7Cj4gCWRvbmUgPSB0cnVlOwo+IH0KPiAKPiBpcyBub3QgU01QIHNh
ZmU/IEFkZCBkZXRhaWxlZCBleHBsYW5hdGlvbiB0byBjb21taXQgbWVzc2FnZSBhbmQgc2hvcnRl
biBjb25zb2xlIG91dHB1dD8KCk5vIGNvbnNvbGUgb3V0cHV0IGF0IGFsbC4gWW91IG5lZWQgdG8g
Y29oZXJlbnRseSBleHBsYWluIHRoZSBwcm9ibGVtCndpdGhvdXQgYWRkaW5nIGNvbnNvbGUgb3V0
cHV0LiBUaGlzIGlzIGEgc2ltcGxlIHByb2JsZW0sIHRoZXJlIGlzIG5vCm5lZWQgdG8gZm9yIGEg
aHVnZSBjb21taXQgbWVzc2FnZSBoZXJlLiBBbHNvIHRoZXJlIGlzIG5vIG5lZWQgZm9yIFNNUApo
ZXJlIGFzIHdlIGRvIGhhdmUga2VybmVsIHByZWVtcHRpb24uCgo+IFJlYXNvbiBmb3IgYXN5bmNo
cm9ub3VzIHByb2JpbmcgaXMgc2ltcGxlIC0gdG8gcmVkdWNlIGJvb3QgdGltZSwgaXQgaXMgY3Jp
dGljYWwgZm9yIGVtYmVkZGVkCj4gc3lzdGVtcy4gVGhpbmsgb2Ygc3lzdGVtIG1hbmFnaW5nIGNh
ciByZWFyIGNhbWVyYSBhbmQgcHJveGltaXR5IHNlbnNvcnMsIGl0IHNob3VsZCBiZSByZWFkeSB3
aGVuIHlvdQo+IHN0YXJ0IGRyaXZpbmcsIHRoaXMgbGVmdHMgdmVyeSBzaG9ydCB0aW1lIGZvciB0
aGUga2VybmVsIHRvIGJvb3QuCgpTbyB0aGUgZHJpdmVyIGRvZXMgbm90IHN1cHBvcnQgYXN5bmMg
cHJvYmluZyBhbmQgeW91IGFkZCBpdCBhbmQgY2FsbCBpdAphIGZpeD8gSSBkb24ndCBtaW5kIGFz
eW5jIHByb2JpbmcgYnV0IGl0IHNob3VsZCBiZSBkZWNsYXJlZCB3aGF0IHRoZQphY3R1YWwgaW50
ZW50aW9uIGlzLiBBbmQgbWF5YmUgdGhlIGRyaXZlciBzaG91bGQgYmUgbWFya2VkIGFzeW5jIGlu
IHRoZQplbmQuCgo+ID4+IC0tLQo+ID4+IENoYW5nZXMgaW4gdjM6Cj4gPj4gLSBkcm9wIF9fcm9f
YWZ0ZXJfaW5pdCBhdHRyaWJ1dGUgZHVlIHRvIHdyaXRlIHRvIHJlYWQtb25seSBwYWdlIGNvbmNl
cm4KPiA+IAo+ID4gV2hhdCBjb25jZXJuPyBUaGF0IF9fcm9fYWZ0ZXJfaW5pdCBjYW4gc3RheS4g
SXQgaXMgYnVpbHQtaW4gb25seS4KPiBTZWUgY29tbWVudCB0byB2MiBieSBzYWNoaWtvLWJvdCRr
ZXJuZWwub3JnIGhlcmUKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvc2FzaGlrby1vdXRi
b3gtMTY3ODU2QGtlcm5lbC5vcmcvCj4gcXVvdGU6Cj4gLS0tY3V0LS0tCj4gW1NldmVyaXR5OiBI
aWdoXQo+IAo+IFdpbGwgdGhpcyB0cmlnZ2VyIGEgZmF0YWwgcGFnZSBmYXVsdCBpZiB0aGUgcHJv
YmUgaXMgZGVmZXJyZWQ/Cj4gCuKApgo+IFBsYXRmb3JtIGRyaXZlciBwcm9iZXMgY2FuIGJlIGRl
ZmVycmVkIChmb3IgaW5zdGFuY2UsIHdhaXRpbmcgZm9yIGFuIE1TSQo+IAo+IGRvbWFpbikgYW5k
IHJ1biBpbiBhIHdvcmtxdWV1ZSBhZnRlciB0aGUgaW5pdCBwaGFzZSBpcyBkb25lLgrigKYKPiBh
bmQgaW5kZWVkLCBhcGxpY19tc2lfc2V0dXAoKSBjYW4gcmV0dXJuIC1FUFJPQkVfREVGRVIgc28g
Y29uY2VybiBpcyB2YWxpZCBhbmQKPiBleGlzdGVkIGluIG9yaWdpbmFsIGNvZGUsIGl0IGlzIG5v
dCByZWxhdGVkIHRvIGFzeW5jaHJvbm91cyBwcm9iaW5nCgpJIHdvdWxkIG5vdCBleHBlY3QgdGhl
IE1TSSBkb21haW4gdG8gYmUgcHJvYmVkIGFmdGVyIGtlcm5lbCBib290aW5nIHZpYQphIG1vZHVs
ZS4gVGhpcyBpcyB0aGUgc2NlbmFyaW8gd2hlcmUgdGhpcyB3b3VsZCBleHBsb2RlLgpBbmQgaWYg
eW91IGNvbnNpZGVyIHRoaXMgYSBwcm9ibGVtIHlvdSBzaG91bGQgYWRkcmVzcyBpdCBhbmQgZGVu
b3RlIGl0CmluIHRoZSBjb21taXQgZGVzY3JpcHRpb24gYXMgc3VjaCBhbmQgbm90IHNpbGVudGx5
IGNoYW5naW5nIGl0IGFzIHBhcnQKb2YgYW5vdGhlciBjaGFuZ2Ugd2l0aG91dCBhbnkgZXhwbGFu
YXRpb24uCgpTZWJhc3RpYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
