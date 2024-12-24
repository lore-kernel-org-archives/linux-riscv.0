Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF8CE7718D
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Dec 2024 08:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j4VoC8P6q1bLPdG/T+siitmwho70Cqg9l5uxmY6bktU=; b=FI0mWpdRVQgpP3
	WR/L8UJ/aDd2kGFuxhS+4anFllH9KrZnBJn9GE0HpXUlW0HvMaGSH5SCBxTMnIzJ2ArGzt9wZq4hk
	Lm6Vh1peYKFihqP5MWFhOyC3Td/xPYmxr6Jif1bR1WANpp8ln6kcxlOvjAcpizwTB/9em4YpCKyet
	Y4fFIwIKq5DDTPgr2KAwOiwkLvPtHivgGd+YplMFjQYGOcAc8Fmw5e03Cvzu5/4BxmDHxWpEWZbKj
	66NqFboqoWvx7ftPde7tOKTCBWSLzImaVFM0Kp4WMf8qbUefaXbvh51xMnLiHXIYY2C7JjCOXtdnv
	uwyYDlmBo2uuhSL/8bPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ0OV-0000000BVYA-2Ptf;
	Tue, 24 Dec 2024 08:35:59 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ0Nd-0000000BVRu-3sHC
	for linux-riscv@lists.infradead.org;
	Tue, 24 Dec 2024 08:35:07 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-e396c98af22so3880727276.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Dec 2024 00:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735029304; x=1735634104; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BgCVgeN0wOheXPUe0p+npMyY7H/G+TEP8YjiV9rhOnQ=;
        b=S6rgyc2hWMlx5qvSgsW1pL27jMA6naoLzsk4CBBWqE3FpCWbHWJC+MWvDV9FKD9NFU
         ny3xTLMM9FzbFlIHP5nmoiXY+uDjqa0vcXYUeS0spla9Xz6HfwRqKaosH5mCz35ucDTe
         i0XB9g39NBxdv2pLsDKJlsJqhJrd0yLPxiZJz6gjkeaqfSC5htKh0j4D8mM637aGKqXv
         A2qY4XDJOTetJFoIiNwtUzO6tggrfGj2uGPDVq/1IFZN+fkNZtn9r0G7ytwwuJEXK6Cq
         KaatUlfU+UoeAf+LAjqzPhKoywtLqWtIEgnndi+ouwHSZJy62kL9eruxD3YRar5tWDJY
         FeBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735029304; x=1735634104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BgCVgeN0wOheXPUe0p+npMyY7H/G+TEP8YjiV9rhOnQ=;
        b=uO76qaIMCGIESMDQYAGYwVafyHoimNDxanJU1BOowqXCAPYcBhNisz07ri3HDIDwsK
         CBbjr5/a5eUECkjLQ7ywgJ1k3i6oLZMq5yW6AMy8FX949jbWzr4KUqY0tSbEPrZzSmXn
         t8++8DrB9bzTSNHFknhPm01E/RUhHhKzo8xccYU4lPmh4dVZ9+JjVcHBJ1oecFmCjHnd
         zvcgf47pGgK4wt7ZWtxQJAuFVfPex2DPI+HAV/1u/WUOgWzUAYReusljpYyGiyYH8TzA
         hIopNyfaHsrR72HsvP6dj1IDvrJTyRrOA6WW5a8axunguwBNiBK9iPBLmzb1sV/sJuLw
         oUJg==
X-Forwarded-Encrypted: i=1; AJvYcCXFhxRFBKzEXu026D0oqZIdFzU0hu1n753FYUWaDwWD6/QvavB3qbi4Di+pQ+SKFVyOffruHml0JmxBQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzH2o8mrLqGyIFOYtZ7YXs26TDT5BvJRcZUX7bgV48XnhhVFIo6
	QAUpdI5w1zGkv6rFLYiCNgv95QWgDesVeN8RReLdfOBddsYCWJuwlRXqa5z1EOJlRtNl7yBGfL4
	ysVY+4dS12lguUO1ayHkpc2hKUgs=
X-Gm-Gg: ASbGncvaRUrw6a5eBDNfl4tPORA1eF5trbNlOdqhKMtWKo0v+HH9wNqMuVWkxuXwDAe
	uqChMOcf5OLyIOoFJjgozHjR+sa9EC8LytQDGpcm2
X-Google-Smtp-Source: AGHT+IHi7ZkSCFx2vwI8ZF7AXi5AHBQsK++ke2rv1PF8DQ0znblHAfcvl+lWC3uBrJAstXD0hu8gA2de7Y4XVRLgaZI=
X-Received: by 2002:a05:6902:240e:b0:e38:a081:f533 with SMTP id
 3f1490d57ef6-e538c20dfc4mr10174313276.7.1735029304401; Tue, 24 Dec 2024
 00:35:04 -0800 (PST)
MIME-Version: 1.0
References: <20240222081231.213406-1-nylon.chen@sifive.com>
 <20240222081231.213406-4-nylon.chen@sifive.com> <jvwgsszvs4jtcytcphsdjulzgqfqzdp4sisu236ddwsqgmvriw@ngi4ljgh5b74>
 <CAHh=Yk92=hp+kaTJWL13_jwJ5gzAAi8gbRF=Ns9=yq2trRUQEg@mail.gmail.com> <xf6ympnaljfjztptb5w5qdpuluckptozdz5a7gtuycsev32ngr@x2ovibqv6evr>
In-Reply-To: <xf6ympnaljfjztptb5w5qdpuluckptozdz5a7gtuycsev32ngr@x2ovibqv6evr>
From: Nylon Chen <nylon7717@gmail.com>
Date: Tue, 24 Dec 2024 16:34:53 +0800
Message-ID: <CAGKtFavQAZOof5QSTFCEaRJEPETm5aBqzkV4g24n3ioiBAOgDA@mail.gmail.com>
Subject: Re: [PATCH v9 3/3] pwm: sifive: Fix the error in the idempotent test
 within the pwm_apply_state_debug function
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Nylon Chen <nylon.chen@sifive.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, conor@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, thierry.reding@gmail.com, 
	vincent.chen@sifive.com, zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_003505_966793_7517D368 
X-CRM114-Status: GOOD (  24.11  )
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

VXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4g5pa8IDIw
MjTlubQ05pyIMTLml6Ug6YCx5LqUIOS4i+WNiDM6MDXlr6vpgZPvvJoKPgo+IE9uIFR1ZSwgQXBy
IDAyLCAyMDI0IGF0IDEwOjAxOjM5QU0gKzA4MDAsIE55bG9uIENoZW4gd3JvdGU6Cj4gPiBVd2Ug
S2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiDmlrwgMjAyNOW5
tDPmnIgxOeaXpSDpgLHkuowg5LiK5Y2IMjoxN+Wvq+mBk++8mgo+ID4gPgo+ID4gPiBIZWxsbywK
PiA+ID4KPiA+ID4gT24gVGh1LCBGZWIgMjIsIDIwMjQgYXQgMDQ6MTI6MzFQTSArMDgwMCwgTnls
b24gQ2hlbiB3cm90ZToKPiA+ID4gPiBSb3VuZCB0aGUgcmVzdWx0IHRvIHRoZSBuZWFyZXN0IHdo
b2xlIG51bWJlci4gVGhpcyBlbnN1cmVzIHRoYXQKPiA+ID4gPiByZWFsX3BlcmlvZCBpcyBhbHdh
eXMgYSByZWFzb25hYmxlIGludGVnZXIgdGhhdCBpcyBub3QgbG93ZXIgdGhhbiB0aGUKPiA+ID4g
PiBhY3R1YWwgdmFsdWUuCj4gPiA+ID4KPiA+ID4gPiBlLmcuCj4gPiA+ID4gJCBlY2hvIDExMCA+
IC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9sZWQtY29udHJvbGxlci0xL2xlZHMvZDEyL2JyaWdodG5l
c3MKPiA+ID4gPiAkIC5hcHBseSBpcyBub3QgaWRlbXBvdGVudCAoZW5hPTEgcG9sPTAgMTczOTY5
Mi80MDMyOTg1KSAtPiAoZW5hPTEgcG9sPTAgMTczOTYzMC80MDMyOTg1KQo+ID4gPiA+Cj4gPiA+
ID4gQ28tZGV2ZWxvcGVkLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gPiA+ID4g
U2lnbmVkLW9mZi1ieTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPgo+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IE55bG9uIENoZW4gPG55bG9uLmNoZW5Ac2lmaXZlLmNvbT4KPiA+ID4gPiAtLS0K
PiA+ID4gPiAgZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jIHwgMiArLQo+ID4gPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+ID4gPgo+ID4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMgYi9kcml2ZXJzL3B3bS9wd20tc2lm
aXZlLmMKPiA+ID4gPiBpbmRleCBhNTg2Y2ZlNDE5MWIuLmJlYmNiZWJhY2NjZCAxMDA2NDQKPiA+
ID4gPiAtLS0gYS9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMKPiA+ID4gPiArKysgYi9kcml2ZXJz
L3B3bS9wd20tc2lmaXZlLmMKPiA+ID4gPiBAQCAtMTAxLDcgKzEwMSw3IEBAIHN0YXRpYyB2b2lk
IHB3bV9zaWZpdmVfdXBkYXRlX2Nsb2NrKHN0cnVjdCBwd21fc2lmaXZlX2RkYXRhICpkZGF0YSwK
PiA+ID4gPgo+ID4gPiA+ICAgICAgIC8qIEFzIHNjYWxlIDw9IDE1IHRoZSBzaGlmdCBvcGVyYXRp
b24gY2Fubm90IG92ZXJmbG93LiAqLwo+ID4gPiA+ICAgICAgIG51bSA9ICh1bnNpZ25lZCBsb25n
IGxvbmcpTlNFQ19QRVJfU0VDIDw8IChQV01fU0lGSVZFX0NNUFdJRFRIICsgc2NhbGUpOwo+ID4g
PiA+IC0gICAgIGRkYXRhLT5yZWFsX3BlcmlvZCA9IGRpdjY0X3VsKG51bSwgcmF0ZSk7Cj4gPiA+
ID4gKyAgICAgZGRhdGEtPnJlYWxfcGVyaW9kID0gRElWX1JPVU5EX1VQX1VMTChudW0sIHJhdGUp
Owo+ID4gPiA+ICAgICAgIGRldl9kYmcoZGRhdGEtPmNoaXAuZGV2LAo+ID4gPiA+ICAgICAgICAg
ICAgICAgIk5ldyByZWFsX3BlcmlvZCA9ICV1IG5zXG4iLCBkZGF0YS0+cmVhbF9wZXJpb2QpOwo+
ID4gPiA+ICB9Cj4gPiBIaSBVd2UKPiA+ID4KPiA+ID4gcHdtX3NpZml2ZV9hcHBseSBoYXMgYSBE
SVY2NF9VNjRfUk9VTkRfQ0xPU0VTVCgpLiBJIHdvbmRlciBpZiB0aGF0IG5lZWRzCj4gPiA+IGFk
YXB0aW9uLCB0b28/IQo+ID4gQWNjb3JkaW5nIHRvIG15IGV4cGVyaW1lbnRzLCBubyBhZGp1c3Rt
ZW50IGlzIG5lY2Vzc2FyeS4KPgo+IERpZCB5b3UgZW5hYmxlIFBXTV9ERUJVRyBhbmQgdGVzdGVk
IHdpdGggc29tZXRoaW5nIGxpa2U6Cj4KPiAgICAgICAgIHNlcSA1MDAwIDEwMDAwMCB8IHdoaWxl
IHJlYWQgcDsgZG8gZWNobyBwID4gL3N5cy9jbGFzcy9wd20vcHdtY2hpcFgvcHdtWS9wZXJpb2Q7
IGRvbmUKPgpIaSBVd2UsCkkgYXBvbG9naXplIGZvciB0aGUgc2lnbmlmaWNhbnQgZGVsYXkgaW4g
cmVzcG9uZGluZyB0byB5b3VyIHF1ZXJ5LApJJ3ZlIG5vdyBjb21wbGV0ZWQgYSB0aG9yb3VnaCB2
ZXJpZmljYXRpb24gb2YgdGhlIFBXTV9ERUJVRwpmdW5jdGlvbmFsaXR5LgoKVGhlIFBlcmlvZCBU
ZXN0aW5nOgpzZXEgNTAwMCA1MDAwIDEwMDAwMCB8IHdoaWxlIHJlYWQgcDsgZG8gZWNobyAkcCA+
Ci9zeXMvY2xhc3MvcHdtL3B3bWNoaXAwL3B3bTAvcGVyaW9kIGVjaG8gIlRlc3RpbmcgcGVyaW9k
OiAkcCIgZG9uZQoKVGhlIER1dHkgQ3ljbGUgVGVzdGluZzoKZm9yIHBlcmNlbnQgaW4gMCAyNSA1
MCA3NSAxMDA7IGRvIGR1dHk9JCgoMTAwMDAwICogcGVyY2VudCAvIDEwMCkpCmVjaG8gJGR1dHkg
PiAvc3lzL2NsYXNzL3B3bS9wd21jaGlwMC9wd20wL2R1dHlfY3ljbGUgZG9uZQoKLSBBbGwgcGVy
aW9kIHZhbHVlcyBmcm9tIDUwMDBucyB0byAxMDAwMDBucyB3ZXJlIGFwcGxpZWQgc3VjY2Vzc2Z1
bGx5Ci0gVmFyaW91cyBkdXR5IGN5Y2xlIHJhdGlvcyB3ZXJlIHRlc3RlZCB3aXRob3V0IGlzc3Vl
cwotIE1vbml0b3JlZCBkbWVzZyBvdXRwdXQgZHVyaW5nIHRlc3RzIC0gbm8ga2VybmVsIG1lc3Nh
Z2VzIGFib3V0IHdyb25nCnNldHRpbmdzIHdlcmUgb2JzZXJ2ZWQKCkxldCBtZSBrbm93IGlmIHlv
dSBuZWVkIGFueSBhZGRpdGlvbmFsIHRlc3QgZGF0YSBvciBoYXZlIG90aGVyCnBhcmFtZXRlcnMg
eW91J2QgbGlrZSBtZSB0byB2ZXJpZnkuCgo+IGFuZCB0aGVuIHZlcmlmaWVkIHRoYXQgdGhpcyB0
ZXN0IGRpZG4ndCByZXN1bHQgaW4ga2VybmVsIG1lc3NhZ2VzIGFib3V0Cj4gd3Jvbmcgc2V0dGlu
Z3M/Cj4KPiBCZXN0IHJlZ2FyZHMKPiBVd2UKPgo+IC0tCj4gUGVuZ3V0cm9uaXggZS5LLiAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgVXdlIEtsZWluZS1Lw7ZuaWcgICAgICAgICAgICB8Cj4g
SW5kdXN0cmlhbCBMaW51eCBTb2x1dGlvbnMgICAgICAgICAgICAgICAgIHwgaHR0cHM6Ly93d3cu
cGVuZ3V0cm9uaXguZGUvIHwKCi0tIAoKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09CnNpZml2ZSBzeXN0ZW0gc29mdHdhcmUgIHRlYW0g6Zmz5Lyv57a4CgpDZWxsIHBo
b25lOiAgMDk4OTA1Nzg1NApFLW1haWw6IG55bG9uNzcxN0BnbWFpbC5jb20KPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
