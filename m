Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B83C46CD4
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 06:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3uFnyIPLPAGzHE5iGkQcQK7EEmrKpZzuy/1gApW5Dw0=; b=ckBatNqBenBXklwQihOlLdEUcN
	F79j+PZ4cAD1b5lQfZDcaV3KHS+ShHPaP6p1D/8k2EkMC5oF6Q549dY904wJ+//4T3+XUNOXKdOBN
	aQEjmXRHp0GMTJtvEpM4aFm+nwFy4ypYE+Mx830FU/ow1iUaTXvKlEOW/CK0S3yIgkiLfUbW0D3Mv
	xyR8IJOSrBhxVgRpfHPQaEKTLg/+f+Ht7W7EYiQUHe10+ytM9qBsnqrbIHt5B9MIiSOhy+jiJimQR
	PWJgOZ/+YVT69lH2W0qmlV8LkRwyICkJ0pd6cBVVohqNWrUQpFmlPZPgE9zMx4yAj1cI08IOQkDjk
	3Gwq+4gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ6SR-000Iu5-0R;
	Fri, 29 Dec 2023 06:34:59 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ6SO-000ItD-1u
	for linux-riscv@lists.infradead.org;
	Fri, 29 Dec 2023 06:34:58 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-7b3b819f8a3so354779939f.1
        for <linux-riscv@lists.infradead.org>; Thu, 28 Dec 2023 22:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703831694; x=1704436494; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4fxdxmEtIFysGtrQ7NwRVJRTpTS+SS/+oWoKGj9FOU=;
        b=cSZWRrDorg+FwvHmZztlhoSoWJQrDQdwYvSyBTXHWKZctTk+nxFFjybbTPoefXUpYk
         R+yD7OWxfHuENLyNXM+KMy9xxDqp3cdaFALUQYzsqjjJ2pgeqYCdVTp5n2YZaf+5vRjP
         fpWqcxkRKpZN2Pn4FGQjqSa84uji3gVNi/9gwklHTiqLAx+aap5nYZiXFFIgOEfK/nMK
         d1GnWrFGsRh4jatnCbBH/TqFHJ+qWIR5RYdB/zD5LgkA5yFuPVzAJNih8OKX7f40X6T4
         XiiO5CpJeu2bBPuofugPBsObfs2bTC34rirYSBk8SvKPkhF7guZ3vZgQXTbBW9jUZd1L
         464A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703831694; x=1704436494;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4fxdxmEtIFysGtrQ7NwRVJRTpTS+SS/+oWoKGj9FOU=;
        b=kpbePFdHUu4KbWiT8+U5yfZW8Vytk2STjZ9ZpIkMm06E7ldjppmw07e0kDydRX+n8/
         mXFDqNSqdywCtS53xEqdVs6vPpokPeUATxqES63jDOpQj5Napsai4BGoLz+rswu5HipY
         DzXTfogQjYO8ZOL483/pT0sChyK2ZFY9mY63GqXoOyeUUZkcBmPNNoN+puONaX90T901
         uAla7ZO5QXfT8NWZKAf5t5M+NK47vq2s6tHt3cpJR0DMJbrAAuclQBtyYOL2djgPRyty
         XRWdmSKQZMjITLmPEMFSmeMLADj4EpewnI3kNTyy8ZRCOMpQ30sMtsJ/I3LoONJXDS2x
         XqRA==
X-Gm-Message-State: AOJu0YyOEQHDNi1lzpHy4WdHcEr7NpjnFScmr2LXf8e2nSXOdoCAEAA5
	gD+AikVBrUBNpqwAB03vORcCPWKcUFEqmrWxoZDu3ecTquCamg==
X-Google-Smtp-Source: AGHT+IFEZdsZZnSUh+m3xzxHBI40M9F3hKuiKUuTXOsXYxca0ywV7LDrEpu0ijjBXv3OeCC0Oa31vlLGasT/LG+acQo=
X-Received: by 2002:a05:6602:4a:b0:7ba:94dd:fd89 with SMTP id
 z10-20020a056602004a00b007ba94ddfd89mr8581340ioz.41.1703831694654; Thu, 28
 Dec 2023 22:34:54 -0800 (PST)
MIME-Version: 1.0
References: <20231205085959.32177-1-zong.li@sifive.com>
In-Reply-To: <20231205085959.32177-1-zong.li@sifive.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 29 Dec 2023 14:34:43 +0800
Message-ID: <CANXhq0r6A48q+ehayaURLO6snDEjzVJO6Ti+1we-57i0ORT9yg@mail.gmail.com>
Subject: Re: [PATCH] riscv: add CALLER_ADDRx support
To: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_223456_663896_0CECEF49 
X-CRM114-Status: GOOD (  23.49  )
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

T24gVHVlLCBEZWMgNSwgMjAyMyBhdCA1OjAw4oCvUE0gWm9uZyBMaSA8em9uZy5saUBzaWZpdmUu
Y29tPiB3cm90ZToKPgo+IENBTExFUl9BRERSeCByZXR1cm5zIGNhbGxlcidzIGFkZHJlc3MgYXQg
c3BlY2lmaWVkIGxldmVsLCB0aGV5IGFyZSB1c2VkCj4gZm9yIHNldmVyYWwgdHJhY2Vycy4gVGhl
c2UgbWFjcm9zIGV2ZW50dWFsbHkgdXNlCj4gX19idWlsdGluX3JldHVybl9hZGRyZXNzKG4pIHRv
IGdldCB0aGUgY2FsbGVyJ3MgYWRkcmVzcyBpZiBhcmNoIGRvZXNuJ3QKPiBkZWZpbmUgdGhlaXIg
b3duIGltcGxlbWVudGF0aW9uLgo+Cj4gSW4gUklTQy1WLCBfX2J1aWx0aW5fcmV0dXJuX2FkZHJl
c3Mobikgb25seSB3b3JrcyB3aGVuIG4gPT0gMCwgd2UgbmVlZAo+IHRvIHdhbGsgdGhlIHN0YWNr
IGZyYW1lIHRvIGdldCB0aGUgY2FsbGVyJ3MgYWRkcmVzcyBhdCBzcGVjaWZpZWQgbGV2ZWwuCj4K
PiBkYXRhLmxldmVsIHN0YXJ0ZWQgZnJvbSAnbGV2ZWwgKyAzJyBkdWUgdG8gdGhlIGNhbGwgZmxv
dyBvZiBnZXR0aW5nCj4gY2FsbGVyJ3MgYWRkcmVzcyBpbiBSSVNDLVYgaW1wbGVtZW50YXRpb24u
IElmIHdlIGRvbid0IGhhdmUgYWRkaXRpb25hbAo+IHRocmVlIGl0ZXJhdGlvbiwgdGhlIGxldmVs
IGlzIGNvcnJlc3BvbmRpbmcgdG8gZm9sbG93czoKPgo+IGNhbGxzaXRlIC0+IHJldHVybl9hZGRy
ZXNzIC0+IGFyY2hfc3RhY2tfd2FsayAtPiB3YWxrX3N0YWNrZnJhbWUKPiB8ICAgICAgICAgICB8
ICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgfAo+IGxldmVsIDMgICAgIGxldmVs
IDIgICAgICAgICAgIGxldmVsIDEgICAgICAgICAgICBsZXZlbCAwCj4KPiBTaWduZWQtb2ZmLWJ5
OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vZnRyYWNlLmggICAgfCAgNSArKysrCj4gIGFyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxl
ICAgICAgICAgfCAgMiArKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9yZXR1cm5fYWRkcmVzcy5jIHwg
NDggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgNTUg
aW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rZXJuZWwvcmV0
dXJuX2FkZHJlc3MuYwo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnRy
YWNlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z0cmFjZS5oCj4gaW5kZXggMmIyZjVkZjdl
ZjJjLi40Mjc3N2Y5MWE5YzUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9m
dHJhY2UuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnRyYWNlLmgKPiBAQCAtMjUs
NiArMjUsMTEgQEAKPgo+ICAjZGVmaW5lIEFSQ0hfU1VQUE9SVFNfRlRSQUNFX09QUyAxCj4gICNp
Zm5kZWYgX19BU1NFTUJMWV9fCj4gKwo+ICtleHRlcm4gdm9pZCAqcmV0dXJuX2FkZHJlc3ModW5z
aWduZWQgaW50IGxldmVsKTsKPiArCj4gKyNkZWZpbmUgZnRyYWNlX3JldHVybl9hZGRyZXNzKG4p
IHJldHVybl9hZGRyZXNzKG4pCj4gKwo+ICB2b2lkIE1DT1VOVF9OQU1FKHZvaWQpOwo+ICBzdGF0
aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgZnRyYWNlX2NhbGxfYWRqdXN0KHVuc2lnbmVkIGxvbmcg
YWRkcikKPiAgewo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZSBiL2Fy
Y2gvcmlzY3Yva2VybmVsL01ha2VmaWxlCj4gaW5kZXggZmVlMjJhM2QxYjUzLi40MGQwNTQ5Mzlh
ZTIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUKPiArKysgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9NYWtlZmlsZQo+IEBAIC03LDYgKzcsNyBAQCBpZmRlZiBDT05GSUdfRlRS
QUNFCj4gIENGTEFHU19SRU1PVkVfZnRyYWNlLm8gPSAkKENDX0ZMQUdTX0ZUUkFDRSkKPiAgQ0ZM
QUdTX1JFTU9WRV9wYXRjaC5vICA9ICQoQ0NfRkxBR1NfRlRSQUNFKQo+ICBDRkxBR1NfUkVNT1ZF
X3NiaS5vICAgID0gJChDQ19GTEFHU19GVFJBQ0UpCj4gK0NGTEFHU19SRU1PVkVfcmV0dXJuX2Fk
ZHJlc3MubyA9ICQoQ0NfRkxBR1NfRlRSQUNFKQo+ICBlbmRpZgo+ICBDRkxBR1Nfc3lzY2FsbF90
YWJsZS5vICs9ICQoY2FsbCBjYy1vcHRpb24sLVduby1vdmVycmlkZS1pbml0LCkKPiAgQ0ZMQUdT
X2NvbXBhdF9zeXNjYWxsX3RhYmxlLm8gKz0gJChjYWxsIGNjLW9wdGlvbiwtV25vLW92ZXJyaWRl
LWluaXQsKQo+IEBAIC00Niw2ICs0Nyw3IEBAIG9iai15ICs9IGlycS5vCj4gIG9iai15ICArPSBw
cm9jZXNzLm8KPiAgb2JqLXkgICs9IHB0cmFjZS5vCj4gIG9iai15ICArPSByZXNldC5vCj4gK29i
ai15ICArPSByZXR1cm5fYWRkcmVzcy5vCj4gIG9iai15ICArPSBzZXR1cC5vCj4gIG9iai15ICAr
PSBzaWduYWwubwo+ICBvYmoteSAgKz0gc3lzY2FsbF90YWJsZS5vCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3JldHVybl9hZGRyZXNzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9yZXR1
cm5fYWRkcmVzcy5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAu
LmMyMDA4ZDRhYTZlNQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9y
ZXR1cm5fYWRkcmVzcy5jCj4gQEAgLTAsMCArMSw0OCBAQAo+ICsvLyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMC1vbmx5Cj4gKy8qCj4gKyAqIFRoaXMgY29kZSBjb21lIGZyb20gYXJj
aC9hcm02NC9rZXJuZWwvcmV0dXJuX2FkZHJlc3MuYwo+ICsgKgo+ICsgKiBDb3B5cmlnaHQgKEMp
IDIwMjMgU2lGaXZlLgo+ICsgKi8KPiArCj4gKyNpbmNsdWRlIDxsaW51eC9leHBvcnQuaD4KPiAr
I2luY2x1ZGUgPGxpbnV4L2twcm9iZXMuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3N0YWNrdHJhY2Uu
aD4KPiArCj4gK3N0cnVjdCByZXR1cm5fYWRkcmVzc19kYXRhIHsKPiArICAgICAgIHVuc2lnbmVk
IGludCBsZXZlbDsKPiArICAgICAgIHZvaWQgKmFkZHI7Cj4gK307Cj4gKwo+ICtzdGF0aWMgYm9v
bCBzYXZlX3JldHVybl9hZGRyKHZvaWQgKmQsIHVuc2lnbmVkIGxvbmcgcGMpCj4gK3sKPiArICAg
ICAgIHN0cnVjdCByZXR1cm5fYWRkcmVzc19kYXRhICpkYXRhID0gZDsKPiArCj4gKyAgICAgICBp
ZiAoIWRhdGEtPmxldmVsKSB7Cj4gKyAgICAgICAgICAgICAgIGRhdGEtPmFkZHIgPSAodm9pZCAq
KXBjOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gKyAgICAgICB9Cj4gKwo+ICsg
ICAgICAgLS1kYXRhLT5sZXZlbDsKPiArCj4gKyAgICAgICByZXR1cm4gdHJ1ZTsKPiArfQo+ICtO
T0tQUk9CRV9TWU1CT0woc2F2ZV9yZXR1cm5fYWRkcik7Cj4gKwo+ICt2b2lkICpyZXR1cm5fYWRk
cmVzcyh1bnNpZ25lZCBpbnQgbGV2ZWwpCj4gK3sKPiArICAgICAgIHN0cnVjdCByZXR1cm5fYWRk
cmVzc19kYXRhIGRhdGE7Cj4gKwo+ICsgICAgICAgZGF0YS5sZXZlbCA9IGxldmVsICsgMzsKPiAr
ICAgICAgIGRhdGEuYWRkciA9IE5VTEw7Cj4gKwo+ICsgICAgICAgYXJjaF9zdGFja193YWxrKHNh
dmVfcmV0dXJuX2FkZHIsICZkYXRhLCBjdXJyZW50LCBOVUxMKTsKPiArCj4gKyAgICAgICBpZiAo
IWRhdGEubGV2ZWwpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBkYXRhLmFkZHI7Cj4gKyAgICAg
ICBlbHNlCj4gKyAgICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+ICsKPiArfQo+ICtFWFBPUlRf
U1lNQk9MX0dQTChyZXR1cm5fYWRkcmVzcyk7Cj4gK05PS1BST0JFX1NZTUJPTChyZXR1cm5fYWRk
cmVzcyk7Cj4gLS0KPiAyLjE3LjEKPgoKSGkgUGFsbWVyIGFuZCBhbGwsCkkgd2FzIHdvbmRlcmlu
ZyB3aGV0aGVyIHRoaXMgcGF0Y2ggaXMgZ29vZCBmb3IgZXZlcnlvbmU/IFRoYW5rcwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
