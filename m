Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA6DC04FFE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 08:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0SSEfVQqZm1vmVztrULOn1fzRrrQPdnEO4XMBb7Ss98=; b=LLqk+/ESiSpl8Q
	MFNj+JGh4uSe8GcbYZKSJgEfj6W11FOwwCnbPLEtm/x5jhT6irAMDAbpiBG8ftg893hbgPZTKykpv
	Dqm+dxplH58rkMqdkvGL/qS5DFJMGa62svRSMVZvc0vgdEu7LOURP162w58SgZd5QuyNmOAk7CD+d
	ogsGiFLePQ6m1Y/1/qx+jkm3zg9AFuMjOq4P1uksAHnxmogwbuj8neo0RJdmSHupIqTFNEqljExuB
	weFJZJxNaiMuKQRiIuqEeWgAYyJeeYpCfRf30X5dQ2yPOHRGhDnKrw/thybDayklYoWsB8rESuaPZ
	BchJbQf7aawfXiOgpRsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4cYz-0000000Eb5L-3LD0;
	Wed, 08 May 2024 08:22:09 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4cYw-0000000Eb4H-3Fxi
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 08:22:09 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-61df496df01so31492557b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 01:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715156522; x=1715761322; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+tentO31VDVL/Z5hwv/0ekLp4NqtTVqujXuNpdLcPc=;
        b=kvEVO7NP5T7jHHHEp06lViuNKfW8CQ8QWwPneJzG4Xvs+aFKtVQTwOGlUSCL+hnkjV
         H0Xmo+gZVGgLV4IJg7BUFcGS38BLlJ+Vk+yrNK68Jhwnr3F3im8BheQ/HZgyVccSTC3N
         a5IZegoku7O+khiILNY+Y8sb0gqH+yOoUPfL+xLufddqdVy67l57mGWi55L72DgHG5eW
         wUyQuIXHpggb9j8KteDuICzFeJ/+J4vnOie8pczsUm9HxeRrw0XlZjZL3ghXB30lOdJb
         SKsVcDiulY0hWeC/Q5ZUP6uzL2SqaddGC1iarGVRJGWocu2oINE1XCU8EvUbuGhyrZ3F
         0/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715156522; x=1715761322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+tentO31VDVL/Z5hwv/0ekLp4NqtTVqujXuNpdLcPc=;
        b=YvVokd3rqO0m83UfcmNUBpo3ZUsgL2Cs8E0addeu8efvKGXlQjAwK7287Hb07leCCy
         IMspdGmkww8EGjA+uUQQe08d8MIWE5GKp4kABAE0s9xJeZLgGrrx4L4NCJc2ChD+YJUA
         TMhZPm9jbLUZPR0gAs5Ozlu4tniQKEANZ/69V+AY6rQcGHFH6XLF8D6Rp1yOwYchrEpM
         pNLNQXSwVrxNuIzwpEcCe9A3kDOzCtG7DK8TRpmNPMAIxXZv1zSgRF/AjsC1niYuOO0u
         7/hhRJul0MplyIFRtz96ayhZx7yYopUm0nfA0Woz2nJfcH3WnJ5GRN8KYikyzusgy+xc
         DSYg==
X-Forwarded-Encrypted: i=1; AJvYcCVTskD1mTBHgvUD4kwov8ArsmtvXL5FRd09kzdYGilkKfasnZj9gFn4beZLanN1u3xbJOusQoB/wwtlar7/z8G1WEci1MOdzN2TmmZYyr1m
X-Gm-Message-State: AOJu0YwtMEobk5A/ce2l+uGNDhnoBDoCFBOvqL66o9OC0+Ny2dGJ+KH6
	YIARwCWnNNkdSz3GBUEHp71KGevmyQAUtdEp8WEwn6vRESPecM/2cghWyoDDGs4baHWf3L8Jv1G
	7FKaL6xOAQuqWxxieJL3oeEZxF6cI3dxWH0PIKA==
X-Google-Smtp-Source: AGHT+IEXgJR7FBS0oCD/booQ+HNJEgAOmWTrDpDTW/qaHhGxw4LiMjzSVLLC7ISbeidXkEBvgCdyI4cw47HDIT5WA/I=
X-Received: by 2002:a81:8395:0:b0:618:7f3c:cbac with SMTP id
 00721157ae682-62085ddbd63mr20603007b3.31.1715156519351; Wed, 08 May 2024
 01:21:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
 <20240412-zve-detection-v4-2-e0c45bb6b253@sifive.com> <4acc62d0-d62b-4d42-805b-0bc7f663a81c@ghiti.fr>
In-Reply-To: <4acc62d0-d62b-4d42-805b-0bc7f663a81c@ghiti.fr>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Wed, 8 May 2024 16:21:47 +0800
Message-ID: <CABgGipXcjY9KDU=fN6KtER3mPbxsQdb+Y5Czhq7QDBFFc6p__w@mail.gmail.com>
Subject: Re: [PATCH v4 2/9] riscv: smp: fail booting up smp if inconsistent
 vlen is detected
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>, Evan Green <evan@rivosinc.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
	Vincent Chen <vincent.chen@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_012207_019046_F11F7BC8 
X-CRM114-Status: GOOD (  32.37  )
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

T24gVGh1LCBBcHIgMjUsIDIwMjQgYXQgNDowMeKAr0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxleEBn
aGl0aS5mcj4gd3JvdGU6Cj4KPiBIaSBBbmR5LAo+Cj4gT24gMTIvMDQvMjAyNCAwODo0OCwgQW5k
eSBDaGl1IHdyb3RlOgo+ID4gQ3VycmVudGx5IHdlIG9ubHkgc3VwcG9ydCBWZWN0b3IgZm9yIFNN
UCBwbGF0Zm9ybXMsIHRoYXQgaXMsIGFsbCBTTVAKPiA+IGNvcmVzIGhhdmUgdGhlIHNhbWUgdmxl
bmIuIElmIHdlIGhhcHBlbiB0byBkZXRlY3QgYSBtaXNtYXRjaGluZyB2bGVuLCBpdAo+ID4gaXMg
YmV0dGVyIHRvIGp1c3QgZmFpbCBib290dGluZyBpdCB1cCB0byBwcmV2ZW50IGZ1cnRoZXIgcmFj
ZS9zY2hlZHVsaW5nCj4gPiBpc3N1ZXMuCj4gPgo+ID4gQWxzbywgbW92ZSAuTHNlY29uZGFyeV9w
YXJrIGZvcndhcmQgYW5kIGNoYWdlIGB0YWlsIHNtcF9jYWxsaW5gIGludG8gYQo+ID4gcmVndWxh
ciBjYWxsIGluIHRoZSBlYXJseSBhc3NlbWJseS4gU28gYSBjb3JlIHdvdWxkIGJlIHBhcmtlZCBy
aWdodAo+ID4gYWZ0ZXIgYSByZXR1cm4gZnJvbSBzbXBfY2FsbGluLiBOb3RlIHRoYXQgYSBzdWNj
ZXNzZnVsIHNtcF9jYWxsaW4KPiA+IGRvZXMgbm90IHJldHVybi4KPiA+Cj4gPiBGaXhlczogNzAx
Nzg1OGViMmQ3ICgicmlzY3Y6IEludHJvZHVjZSByaXNjdl92X3ZzaXplIHRvIHJlY29yZCBzaXpl
IG9mIFZlY3RvciBjb250ZXh0IikKPiA+IFJlcG9ydGVkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9y
LmRvb2xleUBtaWNyb2NoaXAuY29tPgo+ID4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1yaXNjdi8yMDI0MDIyOC12aWNpbml0eS1jb3Juc3RhbGstNGI4ZWI1ZmU1NzMwQHNw
dWQvCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgo+
ID4gLS0tCj4gPiBDaGFuZ2Vsb2cgdjQ6Cj4gPiAgIC0gdXBkYXRlIGNvbW1lbnQgYWxzbyBpbiB0
aGUgYXNzZW1ibHkgY29kZSAoWXVuaHVpKQo+ID4gQ2hhbmdlbG9nIHYyOgo+ID4gICAtIHVwZGF0
ZSBjb21taXQgbWVzc2FnZSB0byBleHBsYWluIGFzbSBjb2RlIGNoYW5nZSAoQ29ub3IpCj4gPiAt
LS0KPiA+ICAgYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TICAgIHwgMTkgKysrKysrKysrKysrLS0t
LS0tLQo+ID4gICBhcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMgfCAxNCArKysrKysrKystLS0t
LQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygt
KQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9oZWFkLlMKPiA+IGluZGV4IDQyMzZhNjljMzVjYi4uYTAwZjc1MjNjYjkxIDEw
MDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TCj4gPiArKysgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9oZWFkLlMKPiA+IEBAIC0xNjUsOSArMTY1LDIwIEBAIHNlY29uZGFyeV9zdGFy
dF9zYmk6Cj4gPiAgICNlbmRpZgo+ID4gICAgICAgY2FsbCAuTHNldHVwX3RyYXBfdmVjdG9yCj4g
PiAgICAgICBzY3NfbG9hZF9jdXJyZW50Cj4gPiAtICAgICB0YWlsIHNtcF9jYWxsaW4KPiA+ICsg
ICAgIGNhbGwgc21wX2NhbGxpbgo+ID4gICAjZW5kaWYgLyogQ09ORklHX1NNUCAqLwo+ID4KPiA+
ICsuYWxpZ24gMgo+ID4gKy5Mc2Vjb25kYXJ5X3Bhcms6Cj4gPiArICAgICAvKgo+ID4gKyAgICAg
ICogUGFyayB0aGlzIGhhcnQgaWYgd2U6Cj4gPiArICAgICAgKiAgLSBoYXZlIHRvbyBtYW55IGhh
cnRzIG9uIENPTkZJR19SSVNDVl9CT09UX1NQSU5XQUlUCj4gPiArICAgICAgKiAgLSByZWNlaXZl
IGFuIGVhcmx5IHRyYXAsIGJlZm9yZSBzZXR1cF90cmFwX3ZlY3RvciBmaW5pc2hlZAo+ID4gKyAg
ICAgICogIC0gZmFpbCBpbiBzbXBfY2FsbGluKCksIGFzIGEgc3VjY2Vzc2Z1bCBvbmUgd291bGRu
J3QgcmV0dXJuCj4gPiArICAgICAgKi8KPiA+ICsgICAgIHdmaQo+ID4gKyAgICAgaiAuTHNlY29u
ZGFyeV9wYXJrCj4gPiArCj4gPiAgIC5hbGlnbiAyCj4gPiAgIC5Mc2V0dXBfdHJhcF92ZWN0b3I6
Cj4gPiAgICAgICAvKiBTZXQgdHJhcCB2ZWN0b3IgdG8gZXhjZXB0aW9uIGhhbmRsZXIgKi8KPiA+
IEBAIC0xODEsMTIgKzE5Miw2IEBAIHNlY29uZGFyeV9zdGFydF9zYmk6Cj4gPiAgICAgICBjc3J3
IENTUl9TQ1JBVENILCB6ZXJvCj4gPiAgICAgICByZXQKPiA+Cj4gPiAtLmFsaWduIDIKPiA+IC0u
THNlY29uZGFyeV9wYXJrOgo+ID4gLSAgICAgLyogV2UgbGFjayBTTVAgc3VwcG9ydCBvciBoYXZl
IHRvbyBtYW55IGhhcnRzLCBzbyBwYXJrIHRoaXMgaGFydCAqLwo+ID4gLSAgICAgd2ZpCj4gPiAt
ICAgICBqIC5Mc2Vjb25kYXJ5X3BhcmsKPiA+IC0KPiA+ICAgU1lNX0NPREVfRU5EKF9zdGFydCkK
PiA+Cj4gPiAgIFNZTV9DT0RFX1NUQVJUKF9zdGFydF9rZXJuZWwpCj4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5j
Cj4gPiBpbmRleCBkNDEwOTBmYzMyMDMuLjY3MzQzN2NjYzEzZCAxMDA2NDQKPiA+IC0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3NtcGJvb3QuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc21w
Ym9vdC5jCj4gPiBAQCAtMjE0LDYgKzIxNCwxNSBAQCBhc21saW5rYWdlIF9fdmlzaWJsZSB2b2lk
IHNtcF9jYWxsaW4odm9pZCkKPiA+ICAgICAgIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tID0gJmluaXRf
bW07Cj4gPiAgICAgICB1bnNpZ25lZCBpbnQgY3Vycl9jcHVpZCA9IHNtcF9wcm9jZXNzb3JfaWQo
KTsKPiA+Cj4gPiArICAgICBpZiAoaGFzX3ZlY3RvcigpKSB7Cj4gPiArICAgICAgICAgICAgIC8q
Cj4gPiArICAgICAgICAgICAgICAqIFJldHVybiBhcyBlYXJseSBhcyBwb3NzaWJsZSBzbyB0aGUg
aGFydCB3aXRoIGEgbWlzbWF0Y2hpbmcKPiA+ICsgICAgICAgICAgICAgICogdmxlbiB3b24ndCBi
b290Lgo+ID4gKyAgICAgICAgICAgICAgKi8KPiA+ICsgICAgICAgICAgICAgaWYgKHJpc2N2X3Zf
c2V0dXBfdnNpemUoKSkKPiA+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm47Cj4gPiArICAg
ICB9Cj4gPiArCj4gPiAgICAgICAvKiBBbGwga2VybmVsIHRocmVhZHMgc2hhcmUgdGhlIHNhbWUg
bW0gY29udGV4dC4gICovCj4gPiAgICAgICBtbWdyYWIobW0pOwo+ID4gICAgICAgY3VycmVudC0+
YWN0aXZlX21tID0gbW07Cj4gPiBAQCAtMjI2LDExICsyMzUsNiBAQCBhc21saW5rYWdlIF9fdmlz
aWJsZSB2b2lkIHNtcF9jYWxsaW4odm9pZCkKPiA+ICAgICAgIG51bWFfYWRkX2NwdShjdXJyX2Nw
dWlkKTsKPiA+ICAgICAgIHNldF9jcHVfb25saW5lKGN1cnJfY3B1aWQsIDEpOwo+ID4KPiA+IC0g
ICAgIGlmIChoYXNfdmVjdG9yKCkpIHsKPiA+IC0gICAgICAgICAgICAgaWYgKHJpc2N2X3Zfc2V0
dXBfdnNpemUoKSkKPiA+IC0gICAgICAgICAgICAgICAgICAgICBlbGZfaHdjYXAgJj0gfkNPTVBB
VF9IV0NBUF9JU0FfVjsKPiA+IC0gICAgIH0KPiA+IC0KPiA+ICAgICAgIHJpc2N2X3VzZXJfaXNh
X2VuYWJsZSgpOwo+ID4KPiA+ICAgICAgIC8qCj4gPgo+Cj4gU28gdGhpcyBzaG91bGQgZ28gaW50
byAtZml4ZXMsIHdvdWxkIHlvdSBtaW5kIHNlbmRpbmcgYSBzaW5nbGUgcGF0Y2ggZm9yCj4gdGhp
cyBmaXg/CgpJIHRob3VnaHQgaXQgd291bGQgYmUgbWFnaWNhbGx5IHBpY2tlZCB1cCBieSBhIGJv
dCBhcyBsb25nIGFzIHdlIGhhdmUKYSBmaXggdGFnLiBBbSBJIGFzc3VtaW5nIHNvbWV0aGluZyB3
cm9uZz8KCj4KPiBZb3VyIHBhdGNoIDggaXMgYWN0dWFsbHkgYWxyZWFkeSBmaXhlZCBieSBDbGVt
ZW50J3MgcGF0Y2gKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI0MDQw
OTE0MzgzOS41NTg3ODQtMS1jbGVnZXJAcml2b3NpbmMuY29tLwoKT2theSwgSSB3aWxsIGRyb3Ag
aXQgYXQgdGhlIG5leHQgcmV2aXNpb24uCgo+IGFuZCBJIGFscmVhZHkgbWVudGlvbmVkIHRoaXMg
b25lIHRvIFBhbG1lci4KPgo+IFRoYW5rcywKPgo+IEFsZXgKPgoKVGhhbmtzLApBbmR5CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
