Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9832BC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 13:14:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 340206140D
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 13:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 340206140D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=do5DDuzC30zBvqFy+V6vdIRKnwpyQiguLcTmO4eQzVQ=; b=ZeNLMm6LVtNokH
	zG+YxdWeWefpbF1fkQGlcZMgF4D7O6BTUBEF2cVpxSfqgWBLY6y9YpCjqHvw6s4PAHPCl3f10uhhF
	59lhUp3+jB74k7XYT8qm/MxzoA2M59ClLV0gyok9tCg6KeFQbeb8hudY5ZGKO0wy9XMGoji1wXeRG
	11Axbb0K+E7YciKoPqKLoqrP+cnlRLqAwJhzjFFjktca0pIP1Ke/qSfutK+fYtFqXcZfF/4vGuyGp
	nriHauiIFt5lNYm9wiL+IxyhSjAbGUulaptdRJLwo7ajMjiqKLRsA9aTppRp2OLFbXFbpf1ae5+6I
	bKkiWfcBh87gm5uKSNUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmyIO-001mVR-Dz; Tue, 16 Nov 2021 13:14:44 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmyIM-001mUQ-7l
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 13:14:43 +0000
Received: by mail-qv1-xf34.google.com with SMTP id a24so13682984qvb.5
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 05:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uZ1JuaUurJ9x7hs8AmvOJPLM2vmz4I11pNUxZE6cU4A=;
 b=GYhuZckZyPch3cWPxRwVuhSACCyfJ9LvSvEOmEoKHNzsFW3RjCtI/rYEQhBt0MIfJ6
 z0vsuWNxbti9RSCG6M6jSYp09YO9FUvvpg3cQIgZqj+2eKocH7GdxWM8bhkiWbER11Qi
 ruAB3xwON1CIKqPCwUsAKQE69+ObohnVciVrRTwZsqcypeA0bsxu/qPg9Th/D56O76PQ
 AoYDgBVDOBnWVqe1llr5qsa01yQWEHLznmqNS8FniM0O0IBgGBqV0oBuD/apSSo/PhQY
 yd+NF3cLaxMqWLncyg/z6XAXEBIEQCXfliSX8srvAWFsK8rEWyc/mvxzRpJSZcETHdE7
 MdVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uZ1JuaUurJ9x7hs8AmvOJPLM2vmz4I11pNUxZE6cU4A=;
 b=mE5YMGUlZ7pv60fv4je3NQ6br9zL4aK4KBA6bjAXOueVfKQeS/EKvELzt2agGNtp4A
 F6RXk915BdXIs3s9sCUV1Y0o/RLVAmRmqumdvVnvuaLOvfErHxc/VIJ5g5npUMzp7PCN
 Gkc4Nn5RYGgdUW0k1Fv1233vtJFA5a29ZYpcc2PDj2rqkgJmuyBAkN99kMcCuapGio2z
 6VQqZ/d0war1qJGABLFPfzN0njhOERqEptEt4NbxdY6SWSQLQph1U9juJd5iH+ejdmzc
 149y04rduiN93xyTuNt1UwFJgAL2TcB/pfe3PcE1PP1BxczDnTphhOkTkyEEAQXS4L6N
 T8Yw==
X-Gm-Message-State: AOAM533oG5X4qrbnB79bgKCbHcpoZ4wsEsGnbXT1+T3rh7NV2roZw5e3
 JPc819wFmA24KCFgR0WMq6E2R6ptJla09Q7VlKITgg==
X-Google-Smtp-Source: ABdhPJyIYcXYXWAl1wi6t8pJ+NbgIFtrqgJBffDghsKj2nKZd2NnxnFgZbgG5dz3q/GKi2TWlP21zEdimL5TohOPvOo=
X-Received: by 2002:a05:6214:529e:: with SMTP id
 kj30mr46523085qvb.50.1637068480091; 
 Tue, 16 Nov 2021 05:14:40 -0800 (PST)
MIME-Version: 1.0
References: <cover.1636362169.git.greentime.hu@sifive.com>
 <3c0297d8335e4cac54a4397c880092c1c983e04e.1636362169.git.greentime.hu@sifive.com>
 <2d08f105-64fd-a43a-1dea-24870ff7c5b0@codethink.co.uk>
In-Reply-To: <2d08f105-64fd-a43a-1dea-24870ff7c5b0@codethink.co.uk>
From: Greentime Hu <greentime.hu@sifive.com>
Date: Tue, 16 Nov 2021 21:14:29 +0800
Message-ID: <CAHCEehLnX6hAr6uRYy4BxzuBhTp64wn0yCVGJ85+0aS88OeKtA@mail.gmail.com>
Subject: Re: [PATCH v9 16/17] riscv: Fix an illegal instruction exception when
 accessing vlenb without enable vector first
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_051442_364474_558283C3 
X-CRM114-Status: GOOD (  22.61  )
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

QmVuIERvb2tzIDxiZW4uZG9va3NAY29kZXRoaW5rLmNvLnVrPiDmlrwgMjAyMeW5tDEx5pyIMTDm
l6Ug6YCx5LiJIOS4i+WNiDY6Mzjlr6vpgZPvvJoKPgo+IE9uIDA5LzExLzIwMjEgMDk6NDgsIEdy
ZWVudGltZSBIdSB3cm90ZToKPiA+IEl0IHRyaWdnZXJlZCBhbiBpbGxlZ2FsIGluc3RydWN0aW9u
IGV4Y2VwdGlvbiB3aGVuIGFjY2Vzc2luZyB2bGVuYiBDU1IKPiA+IHdpdGhvdXQgZW5hYmxlIHZl
Y3RvciBmaXJzdC4gVG8gZml4IHRoaXMgaXNzdWUsIHdlIHNob3VsZCBlbmFibGUgdmVjdG9yCj4g
PiBiZWZvcmUgdXNpbmcgaXQgYW5kIGRpc2FibGUgdmVjdG9yIGFmdGVyIHVzaW5nIGl0Lgo+ID4K
PiA+IENvLWRldmVsb3BlZC1ieTogVmluY2VudCBDaGVuIDx2aW5jZW50LmNoZW5Ac2lmaXZlLmNv
bT4KPiA+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgQ2hlbiA8dmluY2VudC5jaGVuQHNpZml2ZS5j
b20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHcmVlbnRpbWUgSHUgPGdyZWVudGltZS5odUBzaWZpdmUu
Y29tPgo+ID4gLS0tCj4gPiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmggICAgICAg
IHwgMiArKwo+ID4gICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgICAgICAgICB8IDIg
KysKPiA+ICAgYXJjaC9yaXNjdi9rZXJuZWwva2VybmVsX21vZGVfdmVjdG9yLmMgfCA2ICsrKyst
LQo+ID4gICAzIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaCBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmgKPiA+IGluZGV4IDVkN2YxNDQ1M2Y2OC4uY2Ew
NjNjOGY0N2YyIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3Iu
aAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaAo+ID4gQEAgLTgsNiAr
OCw4IEBACj4gPgo+ID4gICAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPiA+Cj4gPiArdm9pZCBy
dnZfZW5hYmxlKHZvaWQpOwo+ID4gK3ZvaWQgcnZ2X2Rpc2FibGUodm9pZCk7Cj4gPiAgIHZvaWQg
a2VybmVsX3J2dl9iZWdpbih2b2lkKTsKPiA+ICAgdm9pZCBrZXJuZWxfcnZ2X2VuZCh2b2lkKTsK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJj
aC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gPiBpbmRleCA4ZTc1NTc5ODBmYWYuLjAxMzll
YzIwYWRjZSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+
ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gPiBAQCAtMTU5LDcgKzE1
OSw5IEBAIHZvaWQgX19pbml0IHJpc2N2X2ZpbGxfaHdjYXAodm9pZCkKPiA+ICAgICAgIGlmIChl
bGZfaHdjYXAgJiBDT01QQVRfSFdDQVBfSVNBX1YpIHsKPiA+ICAgICAgICAgICAgICAgc3RhdGlj
X2JyYW5jaF9lbmFibGUoJmNwdV9od2NhcF92ZWN0b3IpOwo+ID4gICAgICAgICAgICAgICAvKiBU
aGVyZSBhcmUgMzIgdmVjdG9yIHJlZ2lzdGVycyB3aXRoIHZsZW5iIGxlbmd0aC4gKi8KPiA+ICsg
ICAgICAgICAgICAgcnZ2X2VuYWJsZSgpOwo+ID4gICAgICAgICAgICAgICByaXNjdl92c2l6ZSA9
IGNzcl9yZWFkKENTUl9WTEVOQikgKiAzMjsKPiA+ICsgICAgICAgICAgICAgcnZ2X2Rpc2FibGUo
KTsKPiA+ICAgICAgIH0KPiA+ICAgI2VuZGlmCj4KPiBXb3VsZCBpdCBiZSBiZXR0ZXIgdG8gZW5h
YmxlIHRoaXMgaGVyZSwgYW5kIHRoZW4gcmVzdG9yZSB0aGUgb3JpZ2luYWwKPiBzdGF0ZSBpbnN0
ZWFkIG9mIGNhbGxpbmcgcnZ2X2Rpc2FibGU/IElmIGl0IHdhcyBlbmFibGVkIHRoZW4gbWF5YmUK
PiBzb21ldGhpbmcgZWxzZSBpcyBnb2luZyB0byByZWx5IG9uIHRoYXQgc3RhdGU/Cj4KPiBNYXli
ZSBzb21ldGhpbmcgbGlrZToKPgo+ICAgICAgICAgICAgICAgICBwcmV2ID0gcnZ2X2VuYWJsZSgp
Cj4gICAgICAgICAgICAgICAgIHJpc2N2X3ZzaXplID0gY3NyX3JlYWQoQ1NSX1ZMRU5CKSAqIDMy
Owo+ICAgICAgICAgICAgICAgICBydnZfcmVzdG9yZShwcmV2KTsKPgo+CkhpIEJlbiwKClRoYW5r
IHlvdSBmb3IgcmV2aWV3aW5nIHRoaXMuIFRoZSBydnYgd29uJ3QgYmUgZW5hYmxlZCBoZXJlIGJl
Y2F1c2Ugd2UKZGlzYWJsZSBpdCBpbiBoZWFkLlMgYXQgYmVnaW5uaW5nIGFuZCB0aGlzIHN0YWdl
IGlzIHN0aWxsIGRvaW5nIHNvbWUKaW5pdGlhbGl6YXRpb24gd29yayBmb3IgcnZ2IHRvIHNldCBy
aXNjdl92c2l6ZSwgc28gd2UgY2FuIGFzc3VtZSB0aGF0Cmtlcm5lbCBtb2RlIHZlY3RvciBzaG91
bGQgbm90IGJlIGFsbG93ZWQgdG8gdXNlIHZlY3RvciB5ZXQuCgo+ID4gICB9Cj4gPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwva2VybmVsX21vZGVfdmVjdG9yLmMgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9rZXJuZWxfbW9kZV92ZWN0b3IuYwo+ID4gaW5kZXggOGQyZTUzZWEyNWMxLi4xZWNi
NmVjNWM1NmQgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9rZXJuZWxfbW9kZV92
ZWN0b3IuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwva2VybmVsX21vZGVfdmVjdG9yLmMK
PiA+IEBAIC03MSwxNSArNzEsMTcgQEAgc3RhdGljIHZvaWQgcHV0X2NwdV92ZWN0b3JfY29udGV4
dCh2b2lkKQo+ID4gICAgICAgcHJlZW1wdF9lbmFibGUoKTsKPiA+ICAgfQo+ID4KPiA+IC1zdGF0
aWMgdm9pZCBydnZfZW5hYmxlKHZvaWQpCj4gPiArdm9pZCBydnZfZW5hYmxlKHZvaWQpCj4gPiAg
IHsKPiA+ICAgICAgIGNzcl9zZXQoQ1NSX1NUQVRVUywgU1JfVlMpOwo+ID4gICB9Cj4gPiArRVhQ
T1JUX1NZTUJPTChydnZfZW5hYmxlKTsKPiA+Cj4gPiAtc3RhdGljIHZvaWQgcnZ2X2Rpc2FibGUo
dm9pZCkKPiA+ICt2b2lkIHJ2dl9kaXNhYmxlKHZvaWQpCj4gPiAgIHsKPiA+ICAgICAgIGNzcl9j
bGVhcihDU1JfU1RBVFVTLCBTUl9WUyk7Cj4gPiAgIH0KPiA+ICtFWFBPUlRfU1lNQk9MKHJ2dl9k
aXNhYmxlKTsKPiA+Cj4gPiAgIC8qCj4gPiAgICAqIGtlcm5lbF9ydnZfYmVnaW4oKTogb2J0YWlu
IHRoZSBDUFUgdmVjdG9yIHJlZ2lzdGVycyBmb3IgdXNlIGJ5IHRoZSBjYWxsaW5nCj4gPgo+Cj4K
PiAtLQo+IEJlbiBEb29rcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBodHRwOi8vd3d3
LmNvZGV0aGluay5jby51ay8KPiBTZW5pb3IgRW5naW5lZXIgICAgICAgICAgICAgICAgICAgICAg
ICAgQ29kZXRoaW5rIC0gUHJvdmlkaW5nIEdlbml1cwo+Cj4gaHR0cHM6Ly93d3cuY29kZXRoaW5r
LmNvLnVrL3ByaXZhY3kuaHRtbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
