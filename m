Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2507C87FCA
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 04:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rw+sDDu0avoJo8vL2zOn3HhGDWRp8MKYzF88n7F/FI8=; b=VAh1HTY0ubOhVs
	0I8ARVoYxBDAkN3G1zQQJEyHyoHRcFtKwmC394qYjsL6spURtEBSOwv0pSP7HpUYY9ZRqdK9/eO9U
	QbRkTa1sVhTa/89SoKA0TBWr0fJOSPq09yo6NY7jVoDIsuWL+UHkoK0Q437uwH75d/lGBJH8jDhGC
	40HH0qCBN/osNbnDGAtL0+RU30gNrly0gBid8vZuiY7lltAnuzuvVv414gaX97sbwfP522W+NEkAb
	pspRpMIWN+vbn0wGMe09D3BlRg0LHyDUVrUpFRsWYuWqsEGwiZkEP6m/vJ7hEVUDUJvXsBpNEQmYY
	z5XXnXj84/P1/3CNbnFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujVse-0000000EHL6-0RuK;
	Wed, 06 Aug 2025 04:36:00 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujVsb-0000000EHKj-1RbL;
	Wed, 06 Aug 2025 04:35:58 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-332559ace6eso38270441fa.1;
        Tue, 05 Aug 2025 21:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754454955; x=1755059755; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dyl+4iOlTi/aeKebUp39F24cwHyqM1kxjjt1F2AMIE8=;
        b=E6sd8qNKvd2Xzebrv6Q9NrPUKkMzFOEEdBNeawH/y2CxdFB0QBqxlA0o0NUiNh0kQw
         3qQ5S+FNXZoyV3XJTzaABqAvnwSKxWQ9BHyfsUdwse836fKrRNI3VJjMG9iFLM06kAjN
         pCr3g+cYtMLdZI01JpkUw37cbwoZpuqSvHgldvfimjpU/driFyYXE3GXjSUGJduD584N
         P3baPiDhcTSJhphQUJajfYRltZzGZPH0bN2zaCSRFKRwicZVXWWIvfE1CXwu0UtHMaVn
         RKuoLnVWB5hM72I4NlMbmP65fLQ6pLfT+SSD4d7DwpHlTkohtXG2vl/ywW0alBT8Vjph
         9J5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754454955; x=1755059755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dyl+4iOlTi/aeKebUp39F24cwHyqM1kxjjt1F2AMIE8=;
        b=KYtEVc1tETU1H8BoMLb/7T5ug27xxzCOcdwPDjGgC7cwygBG/JW1ld8Mnzfd74VQEx
         mOJvH3CX3Ha3wRkvu7voO4hXHNmGqRAijqdz0kity5TnmoNWeD7ftAkbZYUhU/oq0Hog
         vRphecWYTcuHGGKZbJ0auyTvhIgsZsSGek1abpRvIHfhi/9LOF9BTQvkAVRVpwEQT5pV
         BRe06OD6JqnvJ9SQWIaUBDxKHJnPe6h/nL9kyUigWdkKmJCfd1HLV/Siewz3YFtJnMju
         NksaXXxnZQk5oc0F55S0odB4IM8rBY+E+9G/3fWgfMgSPSwvHfJNyouzVQb7vkqU6OCZ
         VzUw==
X-Forwarded-Encrypted: i=1; AJvYcCU7bEnqFyXRmIlrFD+9hoDiV0J/Eateid0bOIP2WU1gDvSiLKB92jTB7w5DiasJQ6U7I2oLvWQ4ABs=@lists.infradead.org, AJvYcCWm99J8yBoiFB37UrJi2sNTR5OLPAaFjvyTN9R5ThFqU0tQnOXskEjEaNKNR8sa9iE8JEWbNxhQo+QXzA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsYNgOoQE877T0qIfNYBiWqoirM6n/WFORM3Q6XVm+b3rLLgyE
	hwbqeQHZ/DTy4/8f96QN4UCMJo20R7C6K7SPMARdaqYvd4FD903sAyRIbOnjMPOPnNcuyf+BW+d
	x2Ffgf6GNPUyL4wNFlfPOKM7hXx+1JZY=
X-Gm-Gg: ASbGncuw1261ucsDyfNRF4Ocp/wyhO9oh8jfhq7/or69bT+Pm4PGXoq8Bh6FPabcb/r
	f/7Hq2WuefBSWhG7/kV4jZ2EcnjAdiq0t9ykKEgMf8lyxiioDERV9z9PYI4IIqgBFJn6XlVvj6N
	17r52zO4tnWOrkLVcC0+H/bz+n9QEaMOY7e1TFsBeEMUdTjNSX8ShCHfJp019EYS6OTEEXbUhf/
	kPQ1lc=
X-Google-Smtp-Source: AGHT+IELREFbM69cWDMgkv0oAyeZWfUsogtR626ngafWyGyn4A7prZJUgwVT4kX8m1x5U9hUnIU0ztH0bEfAmGCquxc=
X-Received: by 2002:a05:651c:f0e:b0:32c:e253:20cc with SMTP id
 38308e7fff4ca-3338128c651mr2551171fa.11.1754454955157; Tue, 05 Aug 2025
 21:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250805142622.560992-1-snovitoll@gmail.com> <20250805142622.560992-7-snovitoll@gmail.com>
 <60895f3d-abe2-4fc3-afc3-176a188f06d4@gmail.com>
In-Reply-To: <60895f3d-abe2-4fc3-afc3-176a188f06d4@gmail.com>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Wed, 6 Aug 2025 09:35:38 +0500
X-Gm-Features: Ac12FXwBfBQD8yoFidSr60fw7LigvE8ZBweRU29uoAzLmmdybvheO1FdbNA_5DM
Message-ID: <CACzwLxhs+Rt9-q6tKi3Kvu7HpZ2VgZAc4XEXZ4MEB60UbFjDKg@mail.gmail.com>
Subject: Re: [PATCH v4 6/9] kasan/um: select ARCH_DEFER_KASAN and call kasan_init_generic
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: hca@linux.ibm.com, christophe.leroy@csgroup.eu, andreyknvl@gmail.com, 
	agordeev@linux.ibm.com, akpm@linux-foundation.org, zhangqing@loongson.cn, 
	chenhuacai@loongson.cn, trishalfonso@google.com, davidgow@google.com, 
	glider@google.com, dvyukov@google.com, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_213557_384138_2141A784 
X-CRM114-Status: GOOD (  14.68  )
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

T24gVHVlLCBBdWcgNSwgMjAyNSBhdCAxMDoxOeKAr1BNIEFuZHJleSBSeWFiaW5pbiA8cnlhYmlu
aW4uYS5hQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gOC81LzI1IDQ6MjYgUE0sIFNhYnly
emhhbiBUYXNib2xhdG92IHdyb3RlOgo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3VtL0tjb25m
aWcgYi9hcmNoL3VtL0tjb25maWcKPiA+IGluZGV4IDkwODNiZmRiNzczLi44ZDE0YzhmYzJjZCAx
MDA2NDQKPiA+IC0tLSBhL2FyY2gvdW0vS2NvbmZpZwo+ID4gKysrIGIvYXJjaC91bS9LY29uZmln
Cj4gPiBAQCAtNSw2ICs1LDcgQEAgbWVudSAiVU1MLXNwZWNpZmljIG9wdGlvbnMiCj4gPiAgY29u
ZmlnIFVNTAo+ID4gICAgICAgYm9vbAo+ID4gICAgICAgZGVmYXVsdCB5Cj4gPiArICAgICBzZWxl
Y3QgQVJDSF9ERUZFUl9LQVNBTgo+Cj4gc2VsZWN0IEFSQ0hfREVGRVJfS0FTQU4gaWYgU1RBVElD
X0xJTksKCkFzIHBvaW50ZWQgb3V0IGluIGNvbW1pdCA1YjMwMTQwOWU4YmMoIlVNTDogYWRkIHN1
cHBvcnQgZm9yIEtBU0FOCnVuZGVyIHg4Nl82NCIpLAoKOiBBbHNvIG5vdGUgdGhhdCwgd2hpbGUg
VU1MIHN1cHBvcnRzIGJvdGggS0FTQU4gaW4gaW5saW5lIG1vZGUKKENPTkZJR19LQVNBTl9JTkxJ
TkUpCjogYW5kIHN0YXRpYyBsaW5raW5nIChDT05GSUdfU1RBVElDX0xJTkspLCBpdCBkb2VzIG5v
dCBzdXBwb3J0IGJvdGggYXQKdGhlIHNhbWUgdGltZS4KCkkndmUgdGVzdGVkIHRoYXQgZm9yIFVN
TCwKQVJDSF9ERUZFUl9LQVNBTiB3b3JrcyBpZiBTVEFUSUNfTElOSyAmJiBLQVNBTl9PVVRMSU5F
CkFSQ0hfREVGRVJfS0FTQU4gd29ya3MgaWYgS0FTQU5fSU5MSU5FICYmICFTVEFUSUNfTElOSwoK
QVJDSF9ERUZFUl9LQVNBTiBpZiBTVEFUSUNfTElOSywgYW5kIEtBU0FOX0lOTElORT15IGJ5IGRl
ZmF1bHQgZnJvbSBkZWZjb25maWcKY3Jhc2hlcyB3aXRoIFNFR0ZBVUxUIGhlcmUgKEkgZGlkbid0
IHVuZGVyc3RhbmQgd2hhdCBpdCBpcywgSSB0aGluawp0aGUgbWFpbigpIGNvbnN0cnVjdG9ycwpp
cyBub3QgcHJlcGFyZWQgaW4gVU1MKToKCiDilrogMCAgICAgICAweDYwOWQ2Zjg3IHN0cmxlbis0
MwogICAxICAgICAgIDB4NjBhMjBkYjAgX2RsX25ld19vYmplY3QrNDgKICAgMiAgICAgICAweDYw
YTI0NjI3IF9kbF9ub25fZHluYW1pY19pbml0KzEwMwogICAzICAgICAgIDB4NjBhMjVmOWEgX19s
aWJjX2luaXRfZmlyc3QrNDIKICAgNCAgICAgICAweDYwOWViNmIyIF9fbGliY19zdGFydF9tYWlu
X2ltcGwrMjQzNAogICA1ICAgICAgIDB4NjAwNGEwMjUgX3N0YXJ0KzM3CgpTaW5jZSB0aGlzIGlz
IHRoZSBjYXNlIG9ubHkgZm9yIFVNTCwgQUZBSVUsIEkgZG9uJ3QgdGhpbmsgd2Ugd2FudCB0byBj
aGFuZ2UKY29uZGl0aW9ucyBpbiBsaWIvS2NvbmZpZy5rYXNhbi4gU2hhbGwgSSBsZWF2ZSBVTUwg
S2NvbmZpZyBhcyBpdCBpcz8gZS5nLgoKc2VsZWN0IEFSQ0hfREVGRVJfS0FTQU4KCj4KPiA+ICAg
ICAgIHNlbGVjdCBBUkNIX1dBTlRTX0RZTkFNSUNfVEFTS19TVFJVQ1QKPiA+ICAgICAgIHNlbGVj
dCBBUkNIX0hBU19DQUNIRV9MSU5FX1NJWkUKPiA+ICAgICAgIHNlbGVjdCBBUkNIX0hBU19DUFVf
RklOQUxJWkVfSU5JVAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvdW0vaW5jbHVkZS9hc20va2FzYW4u
aCBiL2FyY2gvdW0vaW5jbHVkZS9hc20va2FzYW4uaAo+ID4gaW5kZXggZjk3YmIxZjdiODUuLjgx
YmNkYzBmOTYyIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC91bS9pbmNsdWRlL2FzbS9rYXNhbi5oCj4g
PiArKysgYi9hcmNoL3VtL2luY2x1ZGUvYXNtL2thc2FuLmgKPiA+IEBAIC0yNCwxMSArMjQsNiBA
QAo+ID4KPiA+ICAjaWZkZWYgQ09ORklHX0tBU0FOCj4gPiAgdm9pZCBrYXNhbl9pbml0KHZvaWQp
Owo+ID4gLWV4dGVybiBpbnQga2FzYW5fdW1faXNfcmVhZHk7Cj4gPiAtCj4gPiAtI2lmZGVmIENP
TkZJR19TVEFUSUNfTElOSwo+ID4gLSNkZWZpbmUga2FzYW5fYXJjaF9pc19yZWFkeSgpIChrYXNh
bl91bV9pc19yZWFkeSkKPiA+IC0jZW5kaWYKPiA+ICAjZWxzZQo+ID4gIHN0YXRpYyBpbmxpbmUg
dm9pZCBrYXNhbl9pbml0KHZvaWQpIHsgfQo+ID4gICNlbmRpZiAvKiBDT05GSUdfS0FTQU4gKi8K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
