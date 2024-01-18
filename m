Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F229BC4725D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jan 2024 00:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=04n59nSyLYHQUGHV2TG1GIf19218sayd3+k92F2hflg=; b=ZFscEKxy2bmnZi20CLxWcgu6IP
	EfMSV5DMAyCVj1blVzmv19eSBhB2zLX4zJZoM2jdxOZCLew8GEd2gzxn4cCsUgnGG8rCRZNczgFr2
	pjdFgvG6W+GNX7msAnfK6/z+Yd21JyqPDLDNGVI4CZKcJTpwgVZ55qyWikq2tchcBXb0zri8tNUbR
	ExqrQNWWr4DxEbmKLXS/jTMzbxS+bgOxzfRmLK33JFXMlW/cVl5dJ7C4rIl2CiV4Y9xY/o+gO3KRN
	5ly+WtAKTzny7DJtdEHNtNhyBPbpWvnn52zTOrI0hXzg44jo56yYDfXlAA31gxAYNLJLoxEpNaYzi
	GWXRT8tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQGbx-001DvW-0h;
	Thu, 18 Jan 2024 00:50:25 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQGbt-001DuK-1r
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jan 2024 00:50:23 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3606dd96868so62322405ab.2
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jan 2024 16:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1705539019; x=1706143819; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7T6+PUqnYVA+g50Opqgq8C85S5Y3X7o8IynG4S0vGrI=;
        b=GlThMpsKNq5v8mnA1Anl3PnQJEfvynwebpY/TkR4iude26vPvaHDeHTwbJO7sdMBot
         ys832jDwHv3nqsaS9tjcO3T/f8AP6uWjFgMYAF3+U6jCLLb7GveXBBLCcadXzCUSB6N2
         uIQ30941DcWmPmIPp7njK48OJc3Adruk66UbmgpwRBoW3hFLsEp9/+97NaTk9OUXcvca
         eRKSHqfzmPei+AOTCzIb4eRYue756Jl6sCS7Z26I3vUFXJRDRslBP64HhXPvz7UNNoa5
         OCiJM0/s9UBjoiGLMCEWTbStaV8iVBHJIPFF60yK5Lv7PtrYBy0HYYx6KniHQRI8MZB5
         1TPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705539019; x=1706143819;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7T6+PUqnYVA+g50Opqgq8C85S5Y3X7o8IynG4S0vGrI=;
        b=r4BwYcAWSkDxZFiqambXKhunXKblmrqBVHQaUW5Oeiop4Uu6KXDsQRHeE6w43RVefp
         2JHQZB8D1NOTPXaScT45qCjdDzNK17wfEOy6PN6tWEUMXAorotEVyOWd+Wq+ge1Fpzh0
         jNBUDXzgTRGZQivxQyC/MAwyn+zOxG1FcAHYmDLqnvH9xJiUCgIxPSNUq+2gCx9hV51x
         KAIQzRzqEkxVfpo56ns2zeDs6ayOQSOTZYZtwXsUCC49C9qjdWU02nTw3yOyjePn3wPS
         lDLGl8aV4vGTM3Du2ZE6lBSFsUrLPNmXiFrHSXnsSiq2mOuXNcsPm54BzF54vCV3ixvH
         ywqA==
X-Gm-Message-State: AOJu0YyEsJUoShcOnfI3dr0HHgIfi/tVH4LvZcVk4bpI9PD1kjqAvjFP
	cecZGGmG7z9GcNn3roosYVSeagl693StpNz4aaHH/WATyCPDvbHHwMg2ThEQvo9fCJELkJ7fnKV
	omT3JeEdGftun9SncMlLP0pXT5eKZaG4Peg8gTJY/kH3exXjc
X-Google-Smtp-Source: AGHT+IEztnAJuBWRCrV40VVKQMBOLrQVaqbPo6g4vRvGgSJFYuKBaidyQHihuBBVKuvITHf58HtS0rKgVyHFCdSjMVI=
X-Received: by 2002:a92:4a0e:0:b0:35f:efdc:764e with SMTP id
 m14-20020a924a0e000000b0035fefdc764emr155882ilf.32.1705539018934; Wed, 17 Jan
 2024 16:50:18 -0800 (PST)
MIME-Version: 1.0
References: <20231205085959.32177-1-zong.li@sifive.com> <CANXhq0r6A48q+ehayaURLO6snDEjzVJO6Ti+1we-57i0ORT9yg@mail.gmail.com>
 <CANXhq0qqv3MBEt8zsWBT+gkdyt1PD4ZjDSrznEotdFM7M7K+yQ@mail.gmail.com>
In-Reply-To: <CANXhq0qqv3MBEt8zsWBT+gkdyt1PD4ZjDSrznEotdFM7M7K+yQ@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 18 Jan 2024 08:50:08 +0800
Message-ID: <CANXhq0qNA5JO1xZLbuL6ig1Ddws0m2azMwCyqLFgN3B0VZmvEw@mail.gmail.com>
Subject: Re: [PATCH] riscv: add CALLER_ADDRx support
To: palmer@dabbelt.com, Palmer Dabbelt <palmer@rivosinc.com>, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_165021_664776_5DA415CB 
X-CRM114-Status: GOOD (  29.66  )
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

T24gV2VkLCBKYW4gMTAsIDIwMjQgYXQgMTE6MzPigK9BTSBab25nIExpIDx6b25nLmxpQHNpZml2
ZS5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBEZWMgMjksIDIwMjMgYXQgMjozNOKAr1BNIFpvbmcg
TGkgPHpvbmcubGlAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVHVlLCBEZWMgNSwgMjAy
MyBhdCA1OjAw4oCvUE0gWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPiB3cm90ZToKPiA+ID4K
PiA+ID4gQ0FMTEVSX0FERFJ4IHJldHVybnMgY2FsbGVyJ3MgYWRkcmVzcyBhdCBzcGVjaWZpZWQg
bGV2ZWwsIHRoZXkgYXJlIHVzZWQKPiA+ID4gZm9yIHNldmVyYWwgdHJhY2Vycy4gVGhlc2UgbWFj
cm9zIGV2ZW50dWFsbHkgdXNlCj4gPiA+IF9fYnVpbHRpbl9yZXR1cm5fYWRkcmVzcyhuKSB0byBn
ZXQgdGhlIGNhbGxlcidzIGFkZHJlc3MgaWYgYXJjaCBkb2Vzbid0Cj4gPiA+IGRlZmluZSB0aGVp
ciBvd24gaW1wbGVtZW50YXRpb24uCj4gPiA+Cj4gPiA+IEluIFJJU0MtViwgX19idWlsdGluX3Jl
dHVybl9hZGRyZXNzKG4pIG9ubHkgd29ya3Mgd2hlbiBuID09IDAsIHdlIG5lZWQKPiA+ID4gdG8g
d2FsayB0aGUgc3RhY2sgZnJhbWUgdG8gZ2V0IHRoZSBjYWxsZXIncyBhZGRyZXNzIGF0IHNwZWNp
ZmllZCBsZXZlbC4KPiA+ID4KPiA+ID4gZGF0YS5sZXZlbCBzdGFydGVkIGZyb20gJ2xldmVsICsg
MycgZHVlIHRvIHRoZSBjYWxsIGZsb3cgb2YgZ2V0dGluZwo+ID4gPiBjYWxsZXIncyBhZGRyZXNz
IGluIFJJU0MtViBpbXBsZW1lbnRhdGlvbi4gSWYgd2UgZG9uJ3QgaGF2ZSBhZGRpdGlvbmFsCj4g
PiA+IHRocmVlIGl0ZXJhdGlvbiwgdGhlIGxldmVsIGlzIGNvcnJlc3BvbmRpbmcgdG8gZm9sbG93
czoKPiA+ID4KPiA+ID4gY2FsbHNpdGUgLT4gcmV0dXJuX2FkZHJlc3MgLT4gYXJjaF9zdGFja193
YWxrIC0+IHdhbGtfc3RhY2tmcmFtZQo+ID4gPiB8ICAgICAgICAgICB8ICAgICAgICAgICAgICAg
ICB8ICAgICAgICAgICAgICAgICAgfAo+ID4gPiBsZXZlbCAzICAgICBsZXZlbCAyICAgICAgICAg
ICBsZXZlbCAxICAgICAgICAgICAgbGV2ZWwgMAo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBa
b25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9mdHJhY2UuaCAgICB8ICA1ICsrKysKPiA+ID4gIGFyY2gvcmlzY3Yva2VybmVs
L01ha2VmaWxlICAgICAgICAgfCAgMiArKwo+ID4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvcmV0dXJu
X2FkZHJlc3MuYyB8IDQ4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiAgMyBm
aWxlcyBjaGFuZ2VkLCA1NSBpbnNlcnRpb25zKCspCj4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
YXJjaC9yaXNjdi9rZXJuZWwvcmV0dXJuX2FkZHJlc3MuYwo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mdHJhY2UuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vZnRyYWNlLmgKPiA+ID4gaW5kZXggMmIyZjVkZjdlZjJjLi40Mjc3N2Y5MWE5YzUgMTAwNjQ0
Cj4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnRyYWNlLmgKPiA+ID4gKysrIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mdHJhY2UuaAo+ID4gPiBAQCAtMjUsNiArMjUsMTEgQEAK
PiA+ID4KPiA+ID4gICNkZWZpbmUgQVJDSF9TVVBQT1JUU19GVFJBQ0VfT1BTIDEKPiA+ID4gICNp
Zm5kZWYgX19BU1NFTUJMWV9fCj4gPiA+ICsKPiA+ID4gK2V4dGVybiB2b2lkICpyZXR1cm5fYWRk
cmVzcyh1bnNpZ25lZCBpbnQgbGV2ZWwpOwo+ID4gPiArCj4gPiA+ICsjZGVmaW5lIGZ0cmFjZV9y
ZXR1cm5fYWRkcmVzcyhuKSByZXR1cm5fYWRkcmVzcyhuKQo+ID4gPiArCj4gPiA+ICB2b2lkIE1D
T1VOVF9OQU1FKHZvaWQpOwo+ID4gPiAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGZ0cmFj
ZV9jYWxsX2FkanVzdCh1bnNpZ25lZCBsb25nIGFkZHIpCj4gPiA+ICB7Cj4gPiA+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZSBiL2FyY2gvcmlzY3Yva2VybmVsL01ha2Vm
aWxlCj4gPiA+IGluZGV4IGZlZTIyYTNkMWI1My4uNDBkMDU0OTM5YWUyIDEwMDY0NAo+ID4gPiAt
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZQo+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9NYWtlZmlsZQo+ID4gPiBAQCAtNyw2ICs3LDcgQEAgaWZkZWYgQ09ORklHX0ZUUkFDRQo+
ID4gPiAgQ0ZMQUdTX1JFTU9WRV9mdHJhY2UubyA9ICQoQ0NfRkxBR1NfRlRSQUNFKQo+ID4gPiAg
Q0ZMQUdTX1JFTU9WRV9wYXRjaC5vICA9ICQoQ0NfRkxBR1NfRlRSQUNFKQo+ID4gPiAgQ0ZMQUdT
X1JFTU9WRV9zYmkubyAgICA9ICQoQ0NfRkxBR1NfRlRSQUNFKQo+ID4gPiArQ0ZMQUdTX1JFTU9W
RV9yZXR1cm5fYWRkcmVzcy5vID0gJChDQ19GTEFHU19GVFJBQ0UpCj4gPiA+ICBlbmRpZgo+ID4g
PiAgQ0ZMQUdTX3N5c2NhbGxfdGFibGUubyArPSAkKGNhbGwgY2Mtb3B0aW9uLC1Xbm8tb3ZlcnJp
ZGUtaW5pdCwpCj4gPiA+ICBDRkxBR1NfY29tcGF0X3N5c2NhbGxfdGFibGUubyArPSAkKGNhbGwg
Y2Mtb3B0aW9uLC1Xbm8tb3ZlcnJpZGUtaW5pdCwpCj4gPiA+IEBAIC00Niw2ICs0Nyw3IEBAIG9i
ai15ICs9IGlycS5vCj4gPiA+ICBvYmoteSAgKz0gcHJvY2Vzcy5vCj4gPiA+ICBvYmoteSAgKz0g
cHRyYWNlLm8KPiA+ID4gIG9iai15ICArPSByZXNldC5vCj4gPiA+ICtvYmoteSAgKz0gcmV0dXJu
X2FkZHJlc3Mubwo+ID4gPiAgb2JqLXkgICs9IHNldHVwLm8KPiA+ID4gIG9iai15ICArPSBzaWdu
YWwubwo+ID4gPiAgb2JqLXkgICs9IHN5c2NhbGxfdGFibGUubwo+ID4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwvcmV0dXJuX2FkZHJlc3MuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Jl
dHVybl9hZGRyZXNzLmMKPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+ID4gaW5kZXggMDAw
MDAwMDAwMDAwLi5jMjAwOGQ0YWE2ZTUKPiA+ID4gLS0tIC9kZXYvbnVsbAo+ID4gPiArKysgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9yZXR1cm5fYWRkcmVzcy5jCj4gPiA+IEBAIC0wLDAgKzEsNDggQEAK
PiA+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKPiA+ID4gKy8q
Cj4gPiA+ICsgKiBUaGlzIGNvZGUgY29tZSBmcm9tIGFyY2gvYXJtNjQva2VybmVsL3JldHVybl9h
ZGRyZXNzLmMKPiA+ID4gKyAqCj4gPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjMgU2lGaXZlLgo+
ID4gPiArICovCj4gPiA+ICsKPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9leHBvcnQuaD4KPiA+ID4g
KyNpbmNsdWRlIDxsaW51eC9rcHJvYmVzLmg+Cj4gPiA+ICsjaW5jbHVkZSA8bGludXgvc3RhY2t0
cmFjZS5oPgo+ID4gPiArCj4gPiA+ICtzdHJ1Y3QgcmV0dXJuX2FkZHJlc3NfZGF0YSB7Cj4gPiA+
ICsgICAgICAgdW5zaWduZWQgaW50IGxldmVsOwo+ID4gPiArICAgICAgIHZvaWQgKmFkZHI7Cj4g
PiA+ICt9Owo+ID4gPiArCj4gPiA+ICtzdGF0aWMgYm9vbCBzYXZlX3JldHVybl9hZGRyKHZvaWQg
KmQsIHVuc2lnbmVkIGxvbmcgcGMpCj4gPiA+ICt7Cj4gPiA+ICsgICAgICAgc3RydWN0IHJldHVy
bl9hZGRyZXNzX2RhdGEgKmRhdGEgPSBkOwo+ID4gPiArCj4gPiA+ICsgICAgICAgaWYgKCFkYXRh
LT5sZXZlbCkgewo+ID4gPiArICAgICAgICAgICAgICAgZGF0YS0+YWRkciA9ICh2b2lkICopcGM7
Cj4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiA+ICsgICAgICAgfQo+ID4g
PiArCj4gPiA+ICsgICAgICAgLS1kYXRhLT5sZXZlbDsKPiA+ID4gKwo+ID4gPiArICAgICAgIHJl
dHVybiB0cnVlOwo+ID4gPiArfQo+ID4gPiArTk9LUFJPQkVfU1lNQk9MKHNhdmVfcmV0dXJuX2Fk
ZHIpOwo+ID4gPiArCj4gPiA+ICt2b2lkICpyZXR1cm5fYWRkcmVzcyh1bnNpZ25lZCBpbnQgbGV2
ZWwpCj4gPiA+ICt7Cj4gPiA+ICsgICAgICAgc3RydWN0IHJldHVybl9hZGRyZXNzX2RhdGEgZGF0
YTsKPiA+ID4gKwo+ID4gPiArICAgICAgIGRhdGEubGV2ZWwgPSBsZXZlbCArIDM7Cj4gPiA+ICsg
ICAgICAgZGF0YS5hZGRyID0gTlVMTDsKPiA+ID4gKwo+ID4gPiArICAgICAgIGFyY2hfc3RhY2tf
d2FsayhzYXZlX3JldHVybl9hZGRyLCAmZGF0YSwgY3VycmVudCwgTlVMTCk7Cj4gPiA+ICsKPiA+
ID4gKyAgICAgICBpZiAoIWRhdGEubGV2ZWwpCj4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4g
ZGF0YS5hZGRyOwo+ID4gPiArICAgICAgIGVsc2UKPiA+ID4gKyAgICAgICAgICAgICAgIHJldHVy
biBOVUxMOwo+ID4gPiArCj4gPiA+ICt9Cj4gPiA+ICtFWFBPUlRfU1lNQk9MX0dQTChyZXR1cm5f
YWRkcmVzcyk7Cj4gPiA+ICtOT0tQUk9CRV9TWU1CT0wocmV0dXJuX2FkZHJlc3MpOwo+ID4gPiAt
LQo+ID4gPiAyLjE3LjEKPiA+ID4KPiA+Cj4gPiBIaSBQYWxtZXIgYW5kIGFsbCwKPiA+IEkgd2Fz
IHdvbmRlcmluZyB3aGV0aGVyIHRoaXMgcGF0Y2ggaXMgZ29vZCBmb3IgZXZlcnlvbmU/IFRoYW5r
cwo+Cj4gSGkgUGFsbWVyLAo+IElzIHRoZXJlIGFueSBjaGFuY2UgdG8gaW5jbHVkZSB0aGlzIHBh
dGNoIGluIDYuOC1yYzE/IFRoYW5rcwoKSGkgUGFsbWVyLApJJ20gbm90IHN1cmUgaWYgdGhpcyBw
YXRjaCBpcyBhIGZlYXR1cmUgb3IgYnVnIGZpeCwgd291bGQgeW91IGNvbnNpZGVyCml0IGZvciA2
LjgtcmNYPyBUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
