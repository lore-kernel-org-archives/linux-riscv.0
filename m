Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67024C83F1B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 08:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EeSQVL3nr7rMeIhNmX5+V66NN3gt++OE9RkPqtG9kdE=; b=dKcrbU/XjxyKrO
	aOywVNfneA56WH7JpTZ5DwBNhwu1BMQQGTTdc3fSaWi94xDFbwMfTS4jluHE78oGl2OgAr7kaBYQx
	K+NJhiSxIZG9AF+8OjmAf91DH7cgMlonefXnwIpqY/AXYan8aCjUT7mXFQkYWSpq/MGDVWk5kbjUn
	DyRuKPuHU75xk7Zo/K4Jy8IraUAig0RrrzQwZAnnd0/hCrdrYjTiLR2TEi0YP8zYQjOvzXGMjs7xW
	YeCGb4ZLGixFFGV9sZKsETeqfMgb1a0L7vCsFsmCCIxW/u2XAxWzsxqbQPTQC7eqPQ8rI7N+6ZHFW
	B/L0OC/Ag45dsu2tQY/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucJcj-00000009X7T-0sxd;
	Thu, 17 Jul 2025 08:05:49 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIzI-00000009R5M-0RHQ
	for linux-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 07:25:05 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e8bc1258b2eso527233276.2
        for <linux-riscv@lists.infradead.org>; Thu, 17 Jul 2025 00:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1752737102; x=1753341902; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZO3PPY2XBP748YrMIC0vrtHH5fS4RDPrIYRbHrH2g8=;
        b=f3W1OsinfRPOnp879jBL8gpYrhC1+jecPxTAP2UCK/LiRB/NY5NLRmZV3aR4wnacSd
         AcHXxjTwN/Z+xbh6cwRznJ3QCLm9IxGjtoZ0bbvPEsJ44hF4o8bgJyZW2FaYYZyuAYAI
         nA554PaGUhnHEc+ZC5ZBJf+VcIa335thlIeYi8I/7XizC/iDYgmKMm1ck4hFBD/glK7G
         DIyDW+LyVidslz1Qa59SafEpuXQtd+EBKw0wXbaR5kyuWhJY3TwAu232BgIAEw0fsfpe
         DheWEbY2w8unk9PrjYSOe+vo4Ln+5EAgSp0uazt2IgsMd21nnWyICw797pFi44yjAp33
         gHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752737102; x=1753341902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DZO3PPY2XBP748YrMIC0vrtHH5fS4RDPrIYRbHrH2g8=;
        b=giVPIYZS8fTlFZBqw1+BODB9fKrcVKHjC46aDnbFbT8iUSM6BzKLw1EbNGp8FG+gW2
         ijrlfAcjNeqPZZ264l3Xm5Yczz+R9VZiqUqFQeC9Vxmt1NBs9rDtb7ddTOs4Ic/Bsf5M
         rg09JO1QwYggH3ZZLWN9XdE7tvHj1hTUKQJE5Q+6u3zvkaF+vBs/7eNDZtnecQTOH0Mf
         ANYBLHeiDDFSqz8J517V1UgNJtxttbFJ5Mk7kyyWNui1DpW4EMb7+JJEx4wln0tBKMqb
         SHMZpbZzZHVL/EXexyDCya/RIQgXftWV6WxNnplk7yxlIQKi7FUek/dHCWC0hs/p5taB
         k45A==
X-Forwarded-Encrypted: i=1; AJvYcCXa2M/NRk3VbwxyRoYUuo/Q040g8mpbx2cviPCRKrUR+Lz0FW1qxsTB/UfG749HePJCoE3kYxkrazC1AQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPqTjW9WzhozMOrCsslkeI0zk6/NR8+GaMHJ/3nG4fEjjKLqKA
	eSjZpfdVVSd58B78mQR1L52ujlywqFFTL1gohJ7tmV5Q6xwM6298Xokd3cYmFPNbHdGBj/8E8g3
	0q9WQNJ5VF8iThaIlyv5xbsRfrPpvbxX1uanuIntwrA==
X-Gm-Gg: ASbGnctyckwLz6+UdSod6BEe+FWYWyLxTVFtjSlX5XjiUDiGw7ef71U7cdusOV+JzCi
	7bGl/N1vymO3LDU9Ol9nyu5TiMo6TWB/ElpGu78KDr4z7V1tXAm6z5CRnqY4KyeX7MBZVkTkhrK
	bZ9/NO0BOf2rOGDWyX/ZQy671v18DXVbapVauf6WK8Z3vuadPe7mt/L/XZ5Br0DlXAYtDyw6aWg
	oQp2VTmRA==
X-Google-Smtp-Source: AGHT+IHbHhPYYb+k831eazsYDNt1rPOncGE6SqrWC+YnWF0atILZMfYXZRzierPS88Y0Mp8rI/N8+hI6L8iMWb3zj3o=
X-Received: by 2002:a05:6902:2b12:b0:e89:85ba:2197 with SMTP id
 3f1490d57ef6-e8bc246bb0fmr6368800276.19.1752737102417; Thu, 17 Jul 2025
 00:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250709025516.28051-1-nick.hu@sifive.com> <20250709025516.28051-2-nick.hu@sifive.com>
 <CAAhSdy2J6C8LvBCB0LKd2np47qBQ2EFXXnDvb2OjYKqSOF7EbQ@mail.gmail.com>
In-Reply-To: <CAAhSdy2J6C8LvBCB0LKd2np47qBQ2EFXXnDvb2OjYKqSOF7EbQ@mail.gmail.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Thu, 17 Jul 2025 15:24:51 +0800
X-Gm-Features: Ac12FXxQ4tgNQntiZzQuZ4AONH_MLogmY5rpxtlHgkk0sUx63aRfaZn6OnTU0yk
Message-ID: <CAKddAkAOeoKZ9A7t4eK5JPN0xaVPBojCeY0X9khu-b=irE5=JQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] irqchip/riscv-imsic: Restore the IMSIC registers
To: Anup Patel <anup@brainfault.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_002504_166845_799BA8B6 
X-CRM114-Status: GOOD (  22.98  )
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

T24gVGh1LCBKdWwgMTcsIDIwMjUgYXQgMToxNeKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdWwgOSwgMjAyNSBhdCA4OjI24oCvQU0gTmlj
ayBIdSA8bmljay5odUBzaWZpdmUuY29tPiB3cm90ZToKPiA+Cj4gPiBXaGVuIHRoZSBzeXN0ZW0g
d29rZW4gdXAgZnJvbSB0aGUgbG93IHBvd2VyIHN0YXRlLCB0aGUgSU1TSUMgbWlnaHQgYmUgaW4K
PiA+IHRoZSByZXNldCBzdGF0ZS4gVGhlcmVmb3JlIGFkZGluZyB0aGUgQ1BVIFBNIGNhbGxiYWNr
cyB0byByZXN0b3JlIHRoZQo+ID4gSU1TSUMgcmVnaXN0ZXIgd2hlbiB0aGUgY3B1IHJlc3VtZSBm
cm9tIHRoZSBsb3cgcG93ZXIgc3RhdGUuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTmljayBIdSA8
bmljay5odUBzaWZpdmUuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IFlvbmctWHVhbiBXYW5nIDx5b25n
eHVhbi53YW5nQHNpZml2ZS5jb20+Cj4gPiBSZXZpZXdlZC1ieTogQ3lhbiBZYW5nIDxjeWFuLnlh
bmdAc2lmaXZlLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1z
aWMtZWFybHkuYyB8IDQxICsrKysrKysrKysrKysrKysrKysrLS0tLS0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1lYXJseS5jIGIvZHJpdmVycy9pcnFj
aGlwL2lycS1yaXNjdi1pbXNpYy1lYXJseS5jCj4gPiBpbmRleCBkOWFlODc4MDg2NTEuLmY2NGQ5
YTA2NDJiYiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMt
ZWFybHkuYwo+ID4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1lYXJseS5j
Cj4gPiBAQCAtNyw2ICs3LDcgQEAKPiA+ICAjZGVmaW5lIHByX2ZtdChmbXQpICJyaXNjdi1pbXNp
YzogIiBmbXQKPiA+ICAjaW5jbHVkZSA8bGludXgvYWNwaS5oPgo+ID4gICNpbmNsdWRlIDxsaW51
eC9jcHUuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvY3B1X3BtLmg+Cj4gPiAgI2luY2x1ZGUgPGxp
bnV4L2ludGVycnVwdC5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9pby5oPgo+ID4gICNpbmNsdWRl
IDxsaW51eC9pcnEuaD4KPiA+IEBAIC0xMDksMTQgKzExMCw4IEBAIHN0YXRpYyB2b2lkIGltc2lj
X2hhbmRsZV9pcnEoc3RydWN0IGlycV9kZXNjICpkZXNjKQo+ID4gICAgICAgICBjaGFpbmVkX2ly
cV9leGl0KGNoaXAsIGRlc2MpOwo+ID4gIH0KPiA+Cj4gPiAtc3RhdGljIGludCBpbXNpY19zdGFy
dGluZ19jcHUodW5zaWduZWQgaW50IGNwdSkKPiA+ICtzdGF0aWMgdm9pZCBpbXNpY19yZXN0b3Jl
KHZvaWQpCj4gPiAgewo+ID4gLSAgICAgICAvKiBNYXJrIHBlci1DUFUgSU1TSUMgc3RhdGUgYXMg
b25saW5lICovCj4gPiAtICAgICAgIGltc2ljX3N0YXRlX29ubGluZSgpOwo+ID4gLQo+ID4gLSAg
ICAgICAvKiBFbmFibGUgcGVyLUNQVSBwYXJlbnQgaW50ZXJydXB0ICovCj4gPiAtICAgICAgIGVu
YWJsZV9wZXJjcHVfaXJxKGltc2ljX3BhcmVudF9pcnEsIGlycV9nZXRfdHJpZ2dlcl90eXBlKGlt
c2ljX3BhcmVudF9pcnEpKTsKPiA+IC0KPiA+ICAgICAgICAgLyogU2V0dXAgSVBJcyAqLwo+ID4g
ICAgICAgICBpbXNpY19pcGlfc3RhcnRpbmdfY3B1KCk7Cj4gPgo+ID4gQEAgLTEyOCw2ICsxMjMs
MTkgQEAgc3RhdGljIGludCBpbXNpY19zdGFydGluZ19jcHUodW5zaWduZWQgaW50IGNwdSkKPiA+
Cj4gPiAgICAgICAgIC8qIEVuYWJsZSBsb2NhbCBpbnRlcnJ1cHQgZGVsaXZlcnkgKi8KPiA+ICAg
ICAgICAgaW1zaWNfbG9jYWxfZGVsaXZlcnkodHJ1ZSk7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRp
YyBpbnQgaW1zaWNfc3RhcnRpbmdfY3B1KHVuc2lnbmVkIGludCBjcHUpCj4gPiArewo+ID4gKyAg
ICAgICAvKiBNYXJrIHBlci1DUFUgSU1TSUMgc3RhdGUgYXMgb25saW5lICovCj4gPiArICAgICAg
IGltc2ljX3N0YXRlX29ubGluZSgpOwo+ID4gKwo+ID4gKyAgICAgICAvKiBFbmFibGUgcGVyLUNQ
VSBwYXJlbnQgaW50ZXJydXB0ICovCj4gPiArICAgICAgIGVuYWJsZV9wZXJjcHVfaXJxKGltc2lj
X3BhcmVudF9pcnEsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgIGlycV9nZXRfdHJpZ2dl
cl90eXBlKGltc2ljX3BhcmVudF9pcnEpKTsKPiA+ICsKPiA+ICsgICAgICAgLyogUmVzdG9yZSB0
aGUgaW1zaWMgcmVnICovCj4gPiArICAgICAgIGltc2ljX3Jlc3RvcmUoKTsKPiA+Cj4gPiAgICAg
ICAgIHJldHVybiAwOwo+ID4gIH0KPiA+IEBAIC0xNDMsNiArMTUxLDIzIEBAIHN0YXRpYyBpbnQg
aW1zaWNfZHlpbmdfY3B1KHVuc2lnbmVkIGludCBjcHUpCj4gPiAgICAgICAgIHJldHVybiAwOwo+
ID4gIH0KPiA+Cj4gPiArc3RhdGljIGludCBpbXNpY19ub3RpZmllcihzdHJ1Y3Qgbm90aWZpZXJf
YmxvY2sgKnNlbGYsIHVuc2lnbmVkIGxvbmcgY21kLAo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICB2b2lkICp2KQo+Cj4gcy9pbXNpY19ub3RpZmllci9pbXNpY19wbV9ub3RpZmllci8KPgpX
aWxsIHVwZGF0ZSBpdCBpbiB0aGUgbmV4dCB2ZXJzaW9uLiBUaGFua3MKClJlZ2FyZHMsCk5pY2sK
PiBUaGUgInZvaWQgKnYiIHBhcmFtZXRlciBjYW4gYmUgb24gdGhlIHNhbWUgbGluZSBhcyBmdW5j
dGlvbiBkZWNsYXJhdGlvbi4KPgo+ID4gK3sKPiA+ICsgICAgICAgc3dpdGNoIChjbWQpIHsKPiA+
ICsgICAgICAgY2FzZSBDUFVfUE1fRVhJVDoKPiA+ICsgICAgICAgICAgICAgICAvKiBSZXN0b3Jl
IHRoZSBpbXNpYyByZWcgKi8KPiA+ICsgICAgICAgICAgICAgICBpbXNpY19yZXN0b3JlKCk7Cj4g
PiArICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiArICAgICAgIH0KPiA+ICsKPiA+ICsgICAgICAg
cmV0dXJuIE5PVElGWV9PSzsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIHN0cnVjdCBub3RpZmll
cl9ibG9jayBpbXNpY19ub3RpZmllcl9ibG9jayA9IHsKPgo+IHMvaW1zaWNfbm90aWZpZXJfYmxv
Y2svaW1zaWNfcG1fbm90aWZpZXJfYmxvY2svCj4KPiA+ICsgICAgICAgLm5vdGlmaWVyX2NhbGwg
PSBpbXNpY19ub3RpZmllciwKPiA+ICt9Owo+ID4gKwo+ID4gIHN0YXRpYyBpbnQgX19pbml0IGlt
c2ljX2Vhcmx5X3Byb2JlKHN0cnVjdCBmd25vZGVfaGFuZGxlICpmd25vZGUpCj4gPiAgewo+ID4g
ICAgICAgICBzdHJ1Y3QgaXJxX2RvbWFpbiAqZG9tYWluOwo+ID4gQEAgLTE4MCw3ICsyMDUsNyBA
QCBzdGF0aWMgaW50IF9faW5pdCBpbXNpY19lYXJseV9wcm9iZShzdHJ1Y3QgZndub2RlX2hhbmRs
ZSAqZndub2RlKQo+ID4gICAgICAgICBjcHVocF9zZXR1cF9zdGF0ZShDUFVIUF9BUF9JUlFfUklT
Q1ZfSU1TSUNfU1RBUlRJTkcsICJpcnFjaGlwL3Jpc2N2L2ltc2ljOnN0YXJ0aW5nIiwKPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgaW1zaWNfc3RhcnRpbmdfY3B1LCBpbXNpY19keWluZ19j
cHUpOwo+ID4KPiA+IC0gICAgICAgcmV0dXJuIDA7Cj4gPiArICAgICAgIHJldHVybiBjcHVfcG1f
cmVnaXN0ZXJfbm90aWZpZXIoJmltc2ljX25vdGlmaWVyX2Jsb2NrKTsKPiA+ICB9Cj4gPgo+ID4g
IHN0YXRpYyBpbnQgX19pbml0IGltc2ljX2Vhcmx5X2R0X2luaXQoc3RydWN0IGRldmljZV9ub2Rl
ICpub2RlLCBzdHJ1Y3QgZGV2aWNlX25vZGUgKnBhcmVudCkKPiA+IC0tCj4gPiAyLjE3LjEKPiA+
Cj4KPiBPdGhlcndpc2UsIHRoaXMgbG9va3MgZ29vZCB0byBtZS4KPgo+IFJldmlld2VkLWJ5OiBB
bnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgo+Cj4gUmVnYXJkcywKPiBBbnVwCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
