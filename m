Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44912C46CD3
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 00:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hADU/ArgKvyJF/VxOrkmJG3n12xLZxSrz+gdcUSlq3s=; b=Y3Mm1ZiwZ5mcw8
	zdnxPo70dF50SL5HBYUnYQ+LUPQ6ZnvLQLHAqtm4AZr4RLbIo2RAKOrZGz+VLYm05t+X1t0XhRKTa
	PZMf8EncYIa+YuVc0WKv/WV4UoihAe6G08Z12qV3iafBJB/a7F7hBNJKQrdde5YpqdA1iYhvJ3YkS
	km1OhhKSNqsSjqyoGkCgHHO/nfbQBteazJ7l5HLh2Vd66y6JtA8WjqhDWKlmNxIHtqdehg9tEBeSy
	YpKnwX3D5vikx702nJH3JsAjbnvOBm7UL6WmrFTdqdR3o587QxRe5zQL/WDxvBM8CzXipoZII2hG2
	57cGZZK0XMBb3wx+PGUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGTTs-004X9D-2S;
	Fri, 22 Dec 2023 00:33:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGTTp-004X8l-2s
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 00:33:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 88CCB61B20
	for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 00:33:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DE5FC433C7
	for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 00:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703205212;
	bh=DCqhY8G5czXPSCGceoCrCYsQxI4lJLYKd7y7x4FihOc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VwT61Jw1XQYHEa2vgWAYs1YoHWRO0S7hE7Htv1Ic0gxCEFWc0JYnVBTnXfvqX6avS
	 jUJ6S9/rLOx0USXJDoa7SDnefPcILSXcFE6wDKsN4NNO9OoMi7KwoGlxnovMqMPgj2
	 oDypB3jIbd+6LeJvPKF3jO1e7YE9fz07sAExO7UXzLDJ+TILLAqsKhafsszWX2XvyZ
	 os4QPe1VQCru8CxOejXi7ZSHZ3owJ8Y7CBT5EQeSXQroPYTMOu5t0LFcvYgqN2FI+H
	 u9o2HpMzk8wQac4LTIziwTZAyl7uYmpZccVo56FfHumBTqhfMmFQNZy0DkrOqDOEjB
	 SRmizus1ojIhQ==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5543aec7440so933244a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 16:33:32 -0800 (PST)
X-Gm-Message-State: AOJu0Yyn3uerO0J4hNS5eSqK0N8owQCL/RfT9NuZpu2aoRfKsYFjvxO8
	TUSLyeoWu+GD8b1rZudb6qvA3ifdAFhs/Mxqri0=
X-Google-Smtp-Source: AGHT+IHE7xapUYCkVvGCFmi9RV46Y/s9vLaqov6zcKDyS05KELd7antkz5QZYd8VP1HoG9uNwf0gfIGOkRvmZc5qbtU=
X-Received: by 2002:a50:cd16:0:b0:554:1171:4495 with SMTP id
 z22-20020a50cd16000000b0055411714495mr61774edi.23.1703205210523; Thu, 21 Dec
 2023 16:33:30 -0800 (PST)
MIME-Version: 1.0
References: <20231220-optimize_checksum-v13-0-a73547e1cad8@rivosinc.com> <20231220-optimize_checksum-v13-2-a73547e1cad8@rivosinc.com>
In-Reply-To: <20231220-optimize_checksum-v13-2-a73547e1cad8@rivosinc.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 22 Dec 2023 08:33:18 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR9ZxLZwEs=TMeih+vEEuuxNHRkgLsG2ShjXPEZ-G44_w@mail.gmail.com>
Message-ID: <CAJF2gTR9ZxLZwEs=TMeih+vEEuuxNHRkgLsG2ShjXPEZ-G44_w@mail.gmail.com>
Subject: Re: [PATCH v13 2/5] riscv: Add static key for misaligned accesses
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, David Laight <David.Laight@aculab.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Evan Green <evan@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_163334_038275_4AF392F4 
X-CRM114-Status: GOOD (  21.67  )
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

T24gVGh1LCBEZWMgMjEsIDIwMjMgYXQgNzozOOKAr0FNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gU3VwcG9ydCBzdGF0aWMgYnJhbmNoZXMgZGVwZW5k
aW5nIG9uIHRoZSB2YWx1ZSBvZiBtaXNhbGlnbmVkIGFjY2Vzc2VzLgo+IFRoaXMgd2lsbCBiZSB1
c2VkIGJ5IGEgbGF0ZXIgcGF0Y2ggaW4gdGhlIHNlcmllcy4gQWxsIGNwdXMgbXVzdCBiZQo+IGNv
bnNpZGVyZWQgImZhc3QiIGZvciB0aGlzIHN0YXRpYyBicmFuY2ggdG8gYmUgZmxpcHBlZC4KPgo+
IFNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+Cj4g
LS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oIHwgIDIgKysKPiAgYXJj
aC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jICAgICAgfCAzMCArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspCj4KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmggYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaAo+IGluZGV4IGE0MThjMzExMmNkNi4uN2IxMjllNWUy
ZjA3IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oCj4g
KysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgKPiBAQCAtMTMzLDQgKzEz
Myw2IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCByaXNjdl9jcHVfaGFzX2V4dGVuc2lv
bl91bmxpa2VseShpbnQgY3B1LCBjb25zdCB1bnNpCj4gICAgICAgICByZXR1cm4gX19yaXNjdl9p
c2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShoYXJ0X2lzYVtjcHVdLmlzYSwgZXh0KTsKPiAgfQo+Cj4g
K0RFQ0xBUkVfU1RBVElDX0tFWV9GQUxTRShmYXN0X21pc2FsaWduZWRfYWNjZXNzX3NwZWVkX2tl
eSk7Cj4gKwo+ICAjZW5kaWYKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVh
dHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gaW5kZXggYjM3ODVmZmMx
NTcwLi4wOTVlYjZlYmRjYWEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVh
dHVyZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gQEAgLTEwLDYg
KzEwLDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L2JpdG1hcC5oPgo+ICAjaW5jbHVkZSA8bGludXgv
Y3B1aG90cGx1Zy5oPgo+ICAjaW5jbHVkZSA8bGludXgvY3R5cGUuaD4KPiArI2luY2x1ZGUgPGxp
bnV4L2p1bXBfbGFiZWwuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2xvZzIuaD4KPiAgI2luY2x1ZGUg
PGxpbnV4L21lbW9yeS5oPgo+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gQEAgLTcyOCw2
ICs3MjksMzUgQEAgdm9pZCByaXNjdl91c2VyX2lzYV9lbmFibGUodm9pZCkKPiAgICAgICAgICAg
ICAgICAgY3NyX3NldChDU1JfU0VOVkNGRywgRU5WQ0ZHX0NCWkUpOwo+ICB9Cj4KPiArREVGSU5F
X1NUQVRJQ19LRVlfRkFMU0UoZmFzdF9taXNhbGlnbmVkX2FjY2Vzc19zcGVlZF9rZXkpOwo+ICsK
PiArc3RhdGljIGludCBzZXRfdW5hbGlnbmVkX2FjY2Vzc19zdGF0aWNfYnJhbmNoZXModm9pZCkK
PiArewo+ICsgICAgICAgLyoKPiArICAgICAgICAqIFRoaXMgd2lsbCBiZSBjYWxsZWQgYWZ0ZXIg
Y2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19hbGxfY3B1cyBzbyB0aGUKPiArICAgICAgICAqIHJlc3Vs
dCBvZiB1bmFsaWduZWQgYWNjZXNzIHNwZWVkIGZvciBhbGwgY3B1cyB3aWxsIGJlIGF2YWlsYWJs
ZS4KPiArICAgICAgICAqLwo+ICsKPiArICAgICAgIGludCBjcHU7Cj4gKyAgICAgICBib29sIGZh
c3RfbWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQgPSB0cnVlOwo+ICsKPiArICAgICAgIGZvcl9lYWNo
X29ubGluZV9jcHUoY3B1KSB7CkVhY2ggb25saW5lX2NwdT8gSXMgdGhlcmUgYW55IG9mZmxpbmVf
Y3B1IHRoYXQgaXMgbm8KZmFzdF9taXNhbGlnbmVkX2FjY2Vzc19zcGVlZD8KCk1vdmUgaW50byB5
b3VyIHJpc2N2X29ubGluZV9jcHUgZm9yIGVhY2ggQ1BVLCBhbmQgdXNlIHN0b3BfbWFjaGluZSBm
b3IKc3luY2hyb25pemF0aW9uLgoKPiArICAgICAgICAgICAgICAgaW50IHRoaXNfcGVyZiA9IHBl
cl9jcHUobWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQsIGNwdSk7Cj4gKwo+ICsgICAgICAgICAgICAg
ICBpZiAodGhpc19wZXJmICE9IFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9GQVNUKSB7Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgZmFzdF9taXNhbGlnbmVkX2FjY2Vzc19zcGVlZCA9IGZhbHNl
Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgICAgICAgICB9Cj4g
KyAgICAgICB9Cj4gKwo+ICsgICAgICAgaWYgKGZhc3RfbWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQp
Cj4gKyAgICAgICAgICAgICAgIHN0YXRpY19icmFuY2hfZW5hYmxlKCZmYXN0X21pc2FsaWduZWRf
YWNjZXNzX3NwZWVkX2tleSk7Cj4gKwo+ICsgICAgICAgcmV0dXJuIDA7Cj4gK30KPiArCj4gK2Fy
Y2hfaW5pdGNhbGxfc3luYyhzZXRfdW5hbGlnbmVkX2FjY2Vzc19zdGF0aWNfYnJhbmNoZXMpOwo+
ICsKPiAgI2lmZGVmIENPTkZJR19SSVNDVl9BTFRFUk5BVElWRQo+ICAvKgo+ICAgKiBBbHRlcm5h
dGl2ZSBwYXRjaCBzaXRlcyBjb25zaWRlciA0OCBiaXRzIHdoZW4gZGV0ZXJtaW5pbmcgd2hlbiB0
byBwYXRjaAo+Cj4gLS0KPiAyLjQzLjAKPgo+CgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
