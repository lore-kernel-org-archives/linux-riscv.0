Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63745EBFD10
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 08:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kcNi/I0oIaYk/Xiom3ySE1qrD/Wsfe8Q1VWq/rjeBh8=; b=mug/y8QbA5qljn
	URDRinVEqQ4eMubyux5rxUe8RMJlr433RN3BqrvBzTqZiZaiZoJ5S0WO+6rQn922Yov4vONCu3N7C
	SCHd2UQjX0PG7kB1AgP62V0UEATv5zSm6QA6jEL8d13oQHxSZ9ARruogZYctSBPdmTBC0zqO7abEn
	s2mbeU0djlvh1wgLre33OzzJu2t+2HzDEnCxze+dEvWFG6MsMFaMob9wOMZORiYajievzggfcQOGp
	VBJILvuKQ7QiUeYSQw6ucv48sbptC/yfHfbTEVrq0NBEJ84YLxn1Ut+OrWAhP0WoruwwkvdqjaqjY
	LLC8bKCAcTFY1pOyCRyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCTi-0000000FFUh-03rS;
	Mon, 13 Apr 2026 08:17:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCTe-0000000FFUI-3DvC
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 08:17:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2069644478
	for <linux-riscv@lists.infradead.org>; Mon, 13 Apr 2026 08:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05337C2BCB8
	for <linux-riscv@lists.infradead.org>; Mon, 13 Apr 2026 08:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776068222;
	bh=0xgT9UAyy6dldeOjLlvwyOSVilJyIrH3poxlzwBN6a0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XOd6hoqqlKIo4k3T2HbVRXHA1Rf82e+aH9u/PUdZuT397p8W0KpbbaWV7fIJ/dnQZ
	 IJ28kyV9O3isFx1cC3twLtNm2Y9AdQVw/yx/3Twrgb3RaQ7xEKWLYFzprEBpNmDaqu
	 /MUoZMMUhMqOeAQeiopbyDBDoNkAWqAA6D3E4MiTzrTg1wrCVoYmuEZz/rfdRLMUzk
	 VS0g9wQYMtHrmaGWXL781yXr4GmLx/cIayyuRJ+YDVddjzrkLrVvU2baWXquubG29V
	 wpyCWNZn/H/ff3BS/yHiRrORzWIKEErbriYgifXupGO3LYOJcFV8/gx6rWVkiWlGCm
	 3Yz7SY6GBaYNw==
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so55216145e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 Apr 2026 01:17:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+9/+lKYS9YN/EdSFGl2PboQYBMetxiGUZr/7OE4lYgr9JNBQY1GPB0OlHv0RYsuHtF4iyDttf1moadQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCLDqyq6HrO7sfP91vfZK3YTY9B2cm9UAg2X2QHCEdnSTqTeu2
	K65OwQWN+ks3umVOeSOqQjFnVviXrBJ66N8Xu0ycGrkipTWzZhqhXC3LhVetU/5ZsPsNTI4tsCP
	FYI+8hfgjEtFeMUOt05O69OIqCM96KjA=
X-Received: by 2002:a05:6000:18a8:b0:43d:71b:204b with SMTP id
 ffacd0b85a97d-43d642cd3a0mr17228065f8f.39.1776068220423; Mon, 13 Apr 2026
 01:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260412143116.1445893-1-guoren@kernel.org> <535f3eaa-ff93-4de4-86c7-8a6e46bcca63@app.fastmail.com>
In-Reply-To: <535f3eaa-ff93-4de4-86c7-8a6e46bcca63@app.fastmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 13 Apr 2026 16:16:48 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTmBp09jAhxRsfxOQUGwJfcDi=yn=0P=b_EA0j5pkhzvg@mail.gmail.com>
X-Gm-Features: AQROBzAQ_TMNnMXoKwQOIsDBlTlp-ZA7dGPUKWUKO0eqq1cjymrJu0NCXGNs45A
Message-ID: <CAJF2gTTmBp09jAhxRsfxOQUGwJfcDi=yn=0P=b_EA0j5pkhzvg@mail.gmail.com>
Subject: Re: [PATCH V4] riscv: errata: Add ERRATA_THEAD_WRITE_ONCE fixup
To: Arnd Bergmann <arnd@arndb.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Leonardo Bras <leobras@redhat.com>, djordje.todorovic@htecgroup.com, 
	aleksa.paunovic@htecgroup.com, Han Gao <rabenda.cn@gmail.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Linux-Arch <linux-arch@vger.kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Han Gao <gaohan@iscas.ac.cn>, Yao Zi <me@ziyao.cc>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Xiaoguang Xing <xiaoguang.xing@sophgo.com>, 
	Paul Walmsley <pjw@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_011702_870559_5D8C3D25 
X-CRM114-Status: GOOD (  16.25  )
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

T24gTW9uLCBBcHIgMTMsIDIwMjYgYXQgMjoxOOKAr1BNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJu
ZGIuZGU+IHdyb3RlOgo+Cj4gT24gU3VuLCBBcHIgMTIsIDIwMjYsIGF0IDE2OjMxLCBndW9yZW5A
a2VybmVsLm9yZyB3cm90ZToKPiA+ICBhcmNoL3Jpc2N2L0tjb25maWcuZXJyYXRhICAgICAgICAg
ICAgICAgICAgICB8IDE3ICsrKysrKysrKysKPiA+ICBhcmNoL3Jpc2N2L2VycmF0YS90aGVhZC9l
cnJhdGEuYyAgICAgICAgICAgICB8IDIwICsrKysrKysrKysrKwo+ID4gIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vZXJyYXRhX2xpc3RfdmVuZG9ycy5oIHwgIDMgKy0KPiA+ICBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3J3b25jZS5oICAgICAgICAgICAgICB8IDM0ICsrKysrKysrKysrKysrKysrKysr
Cj4gPiAgaW5jbHVkZS9hc20tZ2VuZXJpYy9yd29uY2UuaCAgICAgICAgICAgICAgICAgfCAgMiAr
Kwo+Cj4gRm9yIGFzbS1nZW5lcmljOgo+Cj4gQWNrZWQtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRA
YXJuZGIuZGU+Cj4KPiA+ICtzdGF0aWMgYm9vbCBlcnJhdGFfcHJvYmVfd3JpdGVfb25jZSh1bnNp
Z25lZCBpbnQgc3RhZ2UsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgbG9uZyBhcmNoX2lkLCB1bnNpZ25lZCBsb25nIGltcGlkKQo+ID4gK3sKPiA+ICsgICAg
IGlmICghSVNfRU5BQkxFRChDT05GSUdfRVJSQVRBX1RIRUFEX1dSSVRFX09OQ0UpKQo+ID4gKyAg
ICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiArCj4gPiArICAgICAvKiB0YXJnZXQtYzl4eCBj
b3JlcyByZXBvcnQgYXJjaF9pZCBhbmQgaW1waWQgYXMgMCAqLwo+ID4gKyAgICAgaWYgKGFyY2hf
aWQgIT0gMCB8fCBpbXBpZCAhPSAwKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4g
PiArCj4gPiArICAgICBpZiAoc3RhZ2UgPT0gUklTQ1ZfQUxURVJOQVRJVkVTX0JPT1QgfHwKPiA+
ICsgICAgICAgICBzdGFnZSA9PSBSSVNDVl9BTFRFUk5BVElWRVNfTU9EVUxFKQo+ID4gKyAgICAg
ICAgICAgICByZXR1cm4gdHJ1ZTsKPgo+IFF1ZXN0aW9uOiBBcmUgdGhlIGFmZmVjdGVkIGNvcmVz
IHRoZSBvbmx5IG9uZXMgdGhhdCByZXBvcnQKPiBhcmNoX2lkPT1pbXBpZD09MD8gSWYgdGhlcmUg
YXJlIG90aGVyIGtub3duIGltcGxlbWVudGF0aW9ucwo+IHRoYXQgZ2V0IHRoZSBleHRyYSBiYXJy
aWVyIGJ1dCBkb24ndCBuZWVkIGl0IGhlcmUsIHRoYXQKPiBzaG91bGQgcHJvYmFibHkgYmUgbWVu
dGlvbmVkIGluIHRoZSBLY29uZmlnIHRleHQgYW5kCj4gdGhlIGNvZGUgY29tbWVudC4KClRoYW5r
IHlvdSBmb3IgeW91ciBxdWVzdGlvbi4KClNvIGZhciwgd2UgaGF2ZSBvbmx5IG9ic2VydmVkIHRo
aXMgaXNzdWUgb24gdGhlIFNHMjA0MiBjaGlwLiBIb3dldmVyLAppbiB0aGVvcnksIGl0IGFmZmVj
dHMgYWxsIG9sZGVyIGM5eHggY29yZXMgdGhhdCByZXBvcnQgYXJjaF9pZCA9PSAwCmFuZCBpbXBp
ZCA9PSAwLgoKU2luY2UgdGhlc2UgZWFybHkgdmVyc2lvbnMgYXJlIHJlbGF0aXZlbHkgZmV3IGlu
IG51bWJlciBhbmQgc2hhcmUgdGhlCnNhbWUgc2lnbmF0dXJlIChhcmNoX2lkID0gMCAmJiBpbXBp
ZCA9IDApLCB3ZSBkZWNpZGVkIHRvIGFwcGx5IHRoZQp3b3JrYXJvdW5kIHRvIGFsbCBjb3JlcyB0
aGF0IG1hdGNoIHRoaXMgY29uZGl0aW9uIHRvIGVuc3VyZSBjb21wbGV0ZQpjb3ZlcmFnZSBhbmQg
YXZvaWQgbWlzc2luZyBhbnkgYWZmZWN0ZWQgc2lsaWNvbi4KCi0tIApCZXN0IFJlZ2FyZHMKIEdV
TyBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
