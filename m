Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE7D6C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 00:48:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99ABD610CB
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 00:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 99ABD610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eloAJN94r7IlYslCXlbPrjK/+siCaclXb2SOoVC8D8U=; b=OfQDcIgnqccL26
	E9NEhEt9GKubte5/CCHUx7xbvks/rDkXeRNQ5AFlHW2bktriclZal0wSjbVlvk6UbzWHIe83o0o/c
	agbnLZAzNPS7lrfeTkakAOfWmNBFQpRnX9B8vxZV3AouT54x0M9kon4e2CSyq8UOb8ws5vJIX2bqn
	0yf1DJ9WDluqI6M7f7c72h0fh0WAWyv/TJhkBGqDfVunUxDTEv8x9Q65W87vLg8cW/QDigVc3WAj2
	fv7mAf08bon6dBXC+S1kA/ciKNHsHYBzL5EfcAJ7wyu0RZJMWx0lpXXpD0fn59+qD6y43aeb0nCb1
	uY9Tt/oyjkykUVP89jHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maSRG-00EPod-H2; Wed, 13 Oct 2021 00:48:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maSRD-00EPnW-IJ
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 00:48:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB56E60F11
 for <linux-riscv@lists.infradead.org>; Wed, 13 Oct 2021 00:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634086080;
 bh=a6HAceh2igYZ/jHxri/gKKRe+lR1pmv01NNdtrqIyGY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mLX8E04C7L4HGCzGqu639GlpJmRrd1wcJtrYvlHfM72UJu7yTwlYggsxJSDdxB32c
 eRzy2FQWSx87AhMoBjYCMCOtr3ApW0ozKXPOHLnzcPDUiNELIZDHeqLl7AyrSpzngR
 /T60PvKvmdnwVrWwCh1iA6/dHW6/BrcCi/+smbU/koEvlZX7J5zgmLRD7rWqk2iKtd
 wjwOOkfQgRmTDvQHhLoI9m4Xxr0SKVGJMDxQCvSOKpkH3QJVWYbJRbf/X1Fz+NN6gH
 iQaAjY3ryZBaANp5QH8Cd+SRNZVW49x9h0LSDJnkU/2+2l9c7/wY1Ba/hahm7W9yYN
 dPfoOQxBeoNGg==
Received: by mail-vk1-f176.google.com with SMTP id o42so796152vkf.9
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 17:48:00 -0700 (PDT)
X-Gm-Message-State: AOAM531VRNS2da+BY4QJd9WOO1TxJTwl/ussoCI6rBQY8RBO3bGLiDZh
 4sWYv1TNj/RnmVH+/KlTqN8hjpi2qtj5oo134DU=
X-Google-Smtp-Source: ABdhPJwuAeXffmbONs1Dm69zu98tZn1ZPM4jYu8FThhRGYdQvURZeKDofJtl/UtQQNoUTDmqIukoBu7Zkg/YVcYLt/A=
X-Received: by 2002:a67:c08d:: with SMTP id x13mr35590851vsi.43.1634086079921; 
 Tue, 12 Oct 2021 17:47:59 -0700 (PDT)
MIME-Version: 1.0
References: <20211012153432.2817285-1-guoren@kernel.org>
 <20211012153432.2817285-2-guoren@kernel.org>
 <CAAhSdy32wkwH5k3iwdUNDsXjUNX8icQwcz_h2E6UixH7ZmD5KQ@mail.gmail.com>
 <4404316.9H8m7z83OK@diego>
In-Reply-To: <4404316.9H8m7z83OK@diego>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 13 Oct 2021 08:47:48 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTjuyE2TbsieRiw7sGR1_2kqdfwSS3pvhc7_6C2b8zJZQ@mail.gmail.com>
Message-ID: <CAJF2gTTjuyE2TbsieRiw7sGR1_2kqdfwSS3pvhc7_6C2b8zJZQ@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] irqchip/sifive-plic: Add thead,c9xx-plic support
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Atish Patra <atish.patra@wdc.com>, 
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_174807_665625_4A490B77 
X-CRM114-Status: GOOD (  35.12  )
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

T24gV2VkLCBPY3QgMTMsIDIwMjEgYXQgNzowNiBBTSBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250
ZWNoLmRlPiB3cm90ZToKPgo+IEhpLAo+Cj4gQW0gRGllbnN0YWcsIDEyLiBPa3RvYmVyIDIwMjEs
IDE4OjQwOjI2IENFU1Qgc2NocmllYiBBbnVwIFBhdGVsOgo+ID4gT24gVHVlLCBPY3QgMTIsIDIw
MjEgYXQgOTowNCBQTSA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBGcm9t
OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPiA+Cj4gPiA+IHRoZWFkLGM5
eHgtcGxpYyB3b3VsZCBtYXNrIElSUSB3aXRoIHJlYWRsKGNsYWltKSwgc28gaXQgbmVlZG4ndAo+
ID4gPiBtYXNrL3VubWFzayB3aGljaCBuZWVkZWQgaW4gUklTQy1WIFBMSUMuCj4gPiA+Cj4gPiA+
IFdoZW4gaW4gSVJRU19PTkVTSE9UICYgSVJRQ0hJUF9FT0lfVEhSRUFERUQgcGF0aCwgdW5uZWNl
c3NhcnkgbWFzawo+ID4gPiBvcGVyYXRpb24gd291bGQgY2F1c2UgYSBibG9ja2luZyBpcnEgYnVn
IGluIHRoZWFkLGM5eHgtcGxpYy4gQmVjYXVzZQo+ID4gPiB3aGVuIElSUSBpcyBkaXNhYmxlZCBp
biBjOXh4LCB3cml0ZWwoaHdpcnEsIGNsYWltKSB3b3VsZCBiZSBpbnZhbGlkLgo+ID4gPgo+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPiA+
IENjOiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgo+ID4gPiBDYzogVGhvbWFzIEds
ZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+Cj4gPiA+IENjOiBNYXJjIFp5bmdpZXIgPG1hekBr
ZXJuZWwub3JnPgo+ID4gPiBDYzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4K
PiA+ID4gQ2M6IEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRyYUB3ZGMuY29tPgo+ID4gPgo+ID4gPiAt
LS0KPiA+ID4KPiA+ID4gQ2hhbmdlcyBzaW5jZSBWMjoKPiA+ID4gIC0gQWRkIGEgc2VwYXJhdGUg
Y29tcGF0aWJsZSBzdHJpbmcgInRoZWFkLGM5eHgtcGxpYyIKPiA+ID4gIC0gc2V0IGlycV9tYXNr
L3VubWFzayBvZiAicGxpY19jaGlwIiB0byBOVUxMIGFuZCBwb2ludAo+ID4gPiAgICBpcnFfZW5h
YmxlL2Rpc2FibGUgb2YgInBsaWNfY2hpcCIgdG8gcGxpY19pcnFfbWFzay91bm1hc2sKPiA+ID4g
IC0gQWRkIGEgZGV0YWlsZWQgY29tbWVudCBibG9jayBpbiBwbGljX2luaXQoKSBhYm91dCB0aGUK
PiA+ID4gICAgZGlmZmVyZW5jZXMgaW4gQ2xhaW0vQ29tcGxldGlvbiBwcm9jZXNzIG9mIFJJU0Mt
ViBQTElDIGFuZCBDOXh4Cj4gPiA+ICAgIFBMSUMuCj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9p
cnFjaGlwL2lycS1zaWZpdmUtcGxpYy5jIHwgMTcgKysrKysrKysrKysrKysrKysKPiA+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2lycWNoaXAvaXJxLXNpZml2ZS1wbGljLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXNp
Zml2ZS1wbGljLmMKPiA+ID4gaW5kZXggY2Y3NGNmYTgyMDQ1Li4zNzU2YjFjMTQ3YzMgMTAwNjQ0
Cj4gPiA+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtc2lmaXZlLXBsaWMuYwo+ID4gPiArKysg
Yi9kcml2ZXJzL2lycWNoaXAvaXJxLXNpZml2ZS1wbGljLmMKPiA+ID4gQEAgLTc5LDYgKzc5LDcg
QEAgc3RydWN0IHBsaWNfaGFuZGxlciB7Cj4gPiA+ICB9Owo+ID4gPiAgc3RhdGljIGludCBwbGlj
X3BhcmVudF9pcnEgX19yb19hZnRlcl9pbml0Owo+ID4gPiAgc3RhdGljIGJvb2wgcGxpY19jcHVo
cF9zZXR1cF9kb25lIF9fcm9fYWZ0ZXJfaW5pdDsKPiA+ID4gK3N0YXRpYyBib29sIGRpc2FibGVf
bWFza191bm1hc2sgX19yb19hZnRlcl9pbml0Owo+ID4gPiAgc3RhdGljIERFRklORV9QRVJfQ1BV
KHN0cnVjdCBwbGljX2hhbmRsZXIsIHBsaWNfaGFuZGxlcnMpOwo+ID4gPgo+ID4gPiAgc3RhdGlj
IGlubGluZSB2b2lkIHBsaWNfdG9nZ2xlKHN0cnVjdCBwbGljX2hhbmRsZXIgKmhhbmRsZXIsCj4g
PiA+IEBAIC0xODEsNiArMTgyLDEzIEBAIHN0YXRpYyBpbnQgcGxpY19pcnFkb21haW5fbWFwKHN0
cnVjdCBpcnFfZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgaXJxLAo+ID4gPiAgewo+ID4gPiAgICAg
ICAgIHN0cnVjdCBwbGljX3ByaXYgKnByaXYgPSBkLT5ob3N0X2RhdGE7Cj4gPiA+Cj4gPiA+ICsg
ICAgICAgaWYgKGRpc2FibGVfbWFza191bm1hc2spIHsKPiA+ID4gKyAgICAgICAgICAgICAgIHBs
aWNfY2hpcC5pcnFfbWFzayAgICAgID0gTlVMTDsKPiA+ID4gKyAgICAgICAgICAgICAgIHBsaWNf
Y2hpcC5pcnFfdW5tYXNrICAgID0gTlVMTDsKPiA+ID4gKyAgICAgICAgICAgICAgIHBsaWNfY2hp
cC5pcnFfZW5hYmxlICAgID0gcGxpY19pcnFfdW5tYXNrOwo+ID4gPiArICAgICAgICAgICAgICAg
cGxpY19jaGlwLmlycV9kaXNhYmxlICAgPSBwbGljX2lycV9tYXNrOwo+ID4gPiArICAgICAgIH0K
PiA+ID4gKwo+ID4gPiAgICAgICAgIGlycV9kb21haW5fc2V0X2luZm8oZCwgaXJxLCBod2lycSwg
JnBsaWNfY2hpcCwgZC0+aG9zdF9kYXRhLAo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgaGFuZGxlX2Zhc3Rlb2lfaXJxLCBOVUxMLCBOVUxMKTsKPiA+ID4gICAgICAgICBpcnFfc2V0
X25vcHJvYmUoaXJxKTsKPiA+ID4gQEAgLTM5MCw1ICszOTgsMTQgQEAgc3RhdGljIGludCBfX2lu
aXQgcGxpY19pbml0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSwKPiA+ID4gICAgICAgICByZXR1
cm4gZXJyb3I7Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+ICtzdGF0aWMgaW50IF9faW5pdCB0aGVhZF9j
OXh4X3BsaWNfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUsCj4gPiA+ICsgICAgICAgICAg
ICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKnBhcmVudCkKPiA+ID4gK3sKPiA+ID4gKyAgICAgICBk
aXNhYmxlX21hc2tfdW5tYXNrID0gdHJ1ZTsKPiA+Cj4gPiBUaGUgcGxpY19pcnFkb21haW5fbWFw
KCkgaXMgY2FsbGVkIGZvciBlYWNoIGlycSBzbyAicGxpY19jaGlwIgo+ID4gd2lsbCBiZSB1cGRh
dGVkIG11bHRpcGxlIHRpbWVzLgo+ID4KPiA+IFlvdSBjYW4gZHJvcCB0aGUgZGlzYWJsZV9tYXNr
X3VubWFzayB2YXJpYWJsZSBhbmQgaW5zdGVhZAo+ID4gZGlyZWN0bHkgdXBkYXRlICJwbGljX2No
aXAiIGhlcmUuCj4KPiBBY3R1YWxseSBJJ2QgdGhpbmsgc29tZXRoaW5nIG1vcmUgZHluYW1pYyBt
aWdodCBiZSBhcHByb3ByaWF0ZT8KPgo+IEkuZS4gZG9uJ3QgbW9kaWZ5IHRoZSBnZW5lcmljIHBs
aWNfY2hpcCBzdHJ1Y3R1cmUsIGJ1dCBkZWZpbmUgYSBzZWNvbmQKPiBvbmUgZm9yIHRoaXMgdHlw
ZSBvZiBjaGlwIGFuZCByZWZlcmVuY2UgdGhhdCBvbmUgaW4gcGxpY19pcnFkb21haW5fbWFwCj4g
ZGVwZW5kaW5nIG9uIHRoZSBibG9jayBmb3VuZD8KPgo+IEFjY29yZGluZyB0byBbMF0gYSBzeXN0
ZW0gY2FuIGhhdmUgbXVsdGlwbGUgUExJQ3MgYW5kIG5vdGhpbmcKPiBndWFyYW50ZWVzIHRoYXQg
dGhleSdsbCBhbHdheXMgYmUgdGhlIHNhbWUgdmFyaWFudCBvbiBmdXR1cmUgc29jcwo+IFtoYXJk
d2FyZSBlbmdpbmVlcnMgYXJlIHZlcnkgY3JlYXRpdmVdCj4KPiBTbyBhZGRpbmcgbW9yZSBzdHVm
ZiB0aGF0IG1vZGlmaWVzIHN0YXRpYyBjb250ZW50IHVzZWQgYnkgYWxsIFBMSUNzCj4gZG9lc24n
dCByZWFsbHkgaW1wcm92ZSBkcml2ZXIgcXVhbGl0eSBoZXJlIDstKQpBZ3JlZSwgSSBsaWtlIHlv
dXIgc3R5bGUgYmVjYXVzZSBpdCBhbHNvIGNvdWxkIG1ha2UgY2F0Ci9wcm9jL2ludGVycnVwdHMg
bmFtZSBwcm9wZXJseS4KCnN0YXRpYyBzdHJ1Y3QgaXJxX2NoaXAgc2lmaXZlX3BsaWNfY2hpcCA9
IHsKICAgICAgICAubmFtZSAgICAgICAgICAgPSAiU2lGaXZlIFBMSUMiLAoKc3RhdGljIHN0cnVj
dCBpcnFfY2hpcCB0aGVhZF9wbGljX2NoaXAgPSB7CiAgICAgICAgLm5hbWUgICAgICAgICAgID0g
IlQtSEVBRCBQTElDIiwKPgo+Cj4gSGVpa28KPgo+Cj4gWzBdIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LXJpc2N2LzE4MzliZjllZjkxZGUyMzU4YTdlOGVjYWRlMzYxZjdhQHd3dy5sb2Vu
LmZyL1QvCj4KPgo+ID4KPiA+ID4gKwo+ID4gPiArICAgICAgIHJldHVybiBwbGljX2luaXQobm9k
ZSwgcGFyZW50KTsKPiA+ID4gK30KPiA+ID4gKwo+ID4gPiAgSVJRQ0hJUF9ERUNMQVJFKHNpZml2
ZV9wbGljLCAic2lmaXZlLHBsaWMtMS4wLjAiLCBwbGljX2luaXQpOwo+ID4gPiAgSVJRQ0hJUF9E
RUNMQVJFKHJpc2N2X3BsaWMwLCAicmlzY3YscGxpYzAiLCBwbGljX2luaXQpOyAvKiBmb3IgbGVn
YWN5IHN5c3RlbXMgKi8KPiA+ID4gK0lSUUNISVBfREVDTEFSRSh0aGVhZF9jOXh4X3BsaWMsICJ0
aGVhZCxjOXh4LXBsaWMiLCB0aGVhZF9jOXh4X3BsaWNfaW5pdCk7Cj4gPiA+IC0tCj4gPiA+IDIu
MjUuMQo+ID4gPgo+ID4KPiA+IFJlZ2FyZHMsCj4gPiBBbnVwCj4gPgo+ID4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdAo+ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo+ID4KPgo+Cj4K
PgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCk1MOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1jc2t5LwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
