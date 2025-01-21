Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CDFC02182
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 08:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cr5HQG8QYWtuOTxfEZRdz8ojBKoSUx0Bo18kHXHhoeU=; b=T02EH+hdCR3Z+I
	ZcrgCTD7HRIMSwK5szQESW5J13O+IhSbbqdH3KHN9JqJwSMXflsZgM/RJWKCnlZuBpv65WmfauVqX
	08cQO+gTbJeAK+nDrkR0G+rPSBMLa7OFcvZFWK1vI+BkwhMHcyqzqjIEZnq9MPGCL6lipDDUXQRoh
	4MumQ7ksJl24x4KwD2bEix+ZxFvkIXB18Sg3NKCeAGFvtsEQiOJP+i238vcQlL7ql5b+FQUFEF+4k
	dS+S68SireOXNNUVlkW0Vr6pa2CZAr7FpYwTk2se3EkuJHwbX0tZmaiHhhCjO77xUfmn2LzYZCikt
	1kXBTW2H1zEUSivW2FEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taA0B-00000007Jte-2dSP;
	Tue, 21 Jan 2025 08:52:51 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta9vS-00000007Ish-3oSZ
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jan 2025 08:48:00 +0000
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-85b83479f45so939282241.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Jan 2025 00:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1737449277; x=1738054077; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylm0SQb6Ef9jjirSI4sl+IsEvfZdYeaZm3dNfDBGQWQ=;
        b=TLjGMpmsoLHh1gu3nWztIF6eu6arXigQw/DYIbWQh+bzjVEeoIhSBXMGk4tpWJWxuF
         eyULiLtst07EQR6TExeyJGoCobL6SK1aYU2rrxIvcg7nKCyvHvF0AfUhDtkpglqiILA4
         3JSvo2c2fOtmQevznOK7QYqQlmQawCVecMpCTH8pZiY3gOrLNVRXJVr0xtI+yypIDjbo
         vq4r9m8Ot6rrNESotVY4sZfYGT92vK+fo0yIPw5aPGFM5+QvEjeWXgjJ7xRGpP00BHNd
         UOEtNMDJ9Z2hDRh/HhpNzbEhCW36bAd3ObAUQkELi0xmuFnNK/ZLKh32+5dOUabG9Z+p
         anGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737449277; x=1738054077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ylm0SQb6Ef9jjirSI4sl+IsEvfZdYeaZm3dNfDBGQWQ=;
        b=eOmKv4iEs/ev1yYKxT8uEbBVbtFe8ylkJZ2NMyzkxM+8erpk38HuNcHGveZqWZ+HEL
         cRnsjyj6+q4s3C8GVfZ5DxAYX8EhhXDOqehs6n8lWdsrNgFxmh+Hy6oXGcKhkdnY8zAO
         taKq+N0/iKiWvLLs4S8kVjMQLG4cLL5VAbWUqHWf1wvfpdSPlixEf1dl/YAUmFYy8DcQ
         pmKy3su/p3zAYhAWrIXcL0pgMPsJlpQd2ciCHVnPTb7yKwhYc/drUf4BZluQMkpdknpS
         +9RnBE/iM9BuSbwozJOufd3SPH2GFOCTHdJ7tmNM/Sm813vX7pJd1PKAdcBAntVZv8Z9
         qcMg==
X-Forwarded-Encrypted: i=1; AJvYcCWYUZv64j3PSrKVYIW8rJqVzIoQY6cfeAbaJJ1FBDI8WPsNKjy0lguUA3tMZ/CyhPgcuByo0JYAEAMz9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxmlOueLlL5EMRdQAc6zauSG2c6JqYp/HUX/qu4LDAfqNmiXmkj
	oos4fSaeKXrji8sY+Nnklv603P8v/g9RtuWZYNDmiFTEk5fGIRqyhUqydsAESqVKWedcOX/YUqJ
	sHNP8l6Kfj/R90L3uSD2AJ0T2DvutANLazbwLbg==
X-Gm-Gg: ASbGnct2bAdeKoMm7vuVDshJHN3vfdJaNldt8gcNcBqgjlsp+L82+7dLhpEnESf3yEz
	zDVV13cwAQn91LyWLXK2PXDeKD6jl2uiGL0puYfwfVP4CxWlDt46ZKw==
X-Google-Smtp-Source: AGHT+IHq4KMBokiyD5WugWcwEvEj0WpVyisepAYzvkq3Q3ow3rYydwBTKGAk6ok+pF9C8Pda6DGP35aW3y6LsiGm1r0=
X-Received: by 2002:a05:6102:161e:b0:4b2:cc94:1879 with SMTP id
 ada2fe7eead31-4b690d1e374mr11844622137.22.1737449277184; Tue, 21 Jan 2025
 00:47:57 -0800 (PST)
MIME-Version: 1.0
References: <20241224093902.1632627-1-nylon.chen@sifive.com>
 <zqkx7cx5nalslfmxeoxdnsjbvrvzajrjybsmsyeyc65a64sntr@gpc5qp6aoyp7>
 <CAHh=Yk-_0rKB=FG6Voif2MDjtRxzUA5vXDP2J-o5=8ru1ewt0w@mail.gmail.com>
 <CAHh=Yk-TosOmwEughfK9mMx-=DgzWK5H_bf6H641SGh1ue8BrA@mail.gmail.com> <zneb3qwgf52zitcbq4wz76shnmhwfkabbsts3sussjpc5s5tsz@uneaxdfp4m2f>
In-Reply-To: <zneb3qwgf52zitcbq4wz76shnmhwfkabbsts3sussjpc5s5tsz@uneaxdfp4m2f>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Tue, 21 Jan 2025 16:47:46 +0800
X-Gm-Features: AbW1kvb1k96mTed4V1SVNr18MrzJpI0GDeXCbwcceOVDYQeW1YSiE4o1vNYPLLY
Message-ID: <CAHh=Yk_oTdURhkna_saF6mrA9gDY=+v_j5NoY_7jTDLuZ=EXtg@mail.gmail.com>
Subject: Re: [PATCH v10 0/3] Change PWM-controlled LED pin active mode and algorithm
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_004758_960501_535F6731 
X-CRM114-Status: GOOD (  23.11  )
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

VXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+IOaWvCAyMDI1
5bm0MeaciDIx5pelIOmAseS6jCDkuIvljYgzOjQ35a+r6YGT77yaCj4KPiBIZWxsbywKPgo+IE9u
IFN1biwgSmFuIDE5LCAyMDI1IGF0IDAzOjAzOjE2UE0gKzA4MDAsIE55bG9uIENoZW4gd3JvdGU6
Cj4gPiBJIHJhbiBzb21lIGJhc2ljIHRlc3RzIGJ5IGNoYW5naW5nIHRoZSBwZXJpb2QgYW5kIGR1
dHkgY3ljbGUgaW4gYm90aAo+ID4gZGVjcmVhc2luZyBhbmQgaW5jcmVhc2luZyBzZXF1ZW5jZXMg
KHNlZSB0aGUgc2NyaXB0IGJlbG93KS4KPgo+IFdoYXQgaXMgY2xrX2dldF9yYXRlKGRkYXRhLT5j
bGspIGZvciB5b3U/CjEzMCBNSHoKPgo+ID4gIyBCYWNrd2FyZCB0ZXN0aW5nIGZvciBwZXJpb2Qg
KGRlY3JlYXNpbmcpCj4gPiBlY2hvICJUZXN0aW5nIHBlcmlvZCBiYWNrd2FyZC4uLiIKPiA+Cj4g
PiBzZXEgMTUwMDAgLTEgNTAwMCB8IHdoaWxlIHJlYWQgcDsgZG8KPiA+Cj4gPiAgICBlY2hvICRw
ID4gL3N5cy9jbGFzcy9wd20vcHdtY2hpcDEvcHdtMC9wZXJpb2QKPiA+Cj4gPiAgICBlY2hvICJU
ZXN0aW5nIHBlcmlvZDogJHAiCj4gPgo+ID4gZG9uZQo+ID4KPiA+Cj4gPiAjIEZvcndhcmQgdGVz
dGluZyBmb3IgcGVyaW9kIChpbmNyZWFzaW5nKQo+ID4gZWNobyAiVGVzdGluZyBwZXJpb2QgZm9y
d2FyZC4uLiIKPiA+Cj4gPiBzZXEgNTAwMCAxIDE1MDAwIHwgd2hpbGUgcmVhZCBwOyBkbwo+ID4K
PiA+ICAgIGVjaG8gJHAgPiAvc3lzL2NsYXNzL3B3bS9wd21jaGlwMS9wd20wL3BlcmlvZAo+ID4K
PiA+ICAgIGVjaG8gIlRlc3RpbmcgcGVyaW9kOiAkcCIKPiA+Cj4gPiBkb25lCj4gPgo+ID4KPiA+
ICMgQmFja3dhcmQgdGVzdGluZyBmb3IgZHV0eSBjeWNsZSAoZGVjcmVhc2luZykKPiA+IGVjaG8g
IlRlc3RpbmcgZHV0eSBjeWNsZSBiYWNrd2FyZC4uLiIKPiA+Cj4gPiBmb3IgZHV0eSBpbiAkKHNl
cSAxMDAwMCAtMSAwKTsgZG8KPiA+Cj4gPiAgICBlY2hvICRkdXR5ID4gL3N5cy9jbGFzcy9wd20v
cHdtY2hpcDEvcHdtMC9kdXR5X2N5Y2xlCj4gPgo+ID4gICAgZWNobyAiVGVzdGluZyBkdXR5IGN5
Y2xlOiAkZHV0eSIKPiA+Cj4gPiBkb25lCj4gPgo+ID4KPiA+ICMgRm9yd2FyZCB0ZXN0aW5nIGZv
ciBkdXR5IGN5Y2xlIChpbmNyZWFzaW5nKQo+ID4KPiA+IGVjaG8gIlRlc3RpbmcgZHV0eSBjeWNs
ZSBmb3J3YXJkLi4uIgo+ID4KPiA+IGZvciBkdXR5IGluICQoc2VxIDAgMSAxMDAwMCk7IGRvCj4g
Pgo+ID4gICAgZWNobyAkZHV0eSA+IC9zeXMvY2xhc3MvcHdtL3B3bWNoaXAxL3B3bTAvZHV0eV9j
eWNsZQo+ID4KPiA+ICAgIGVjaG8gIlRlc3RpbmcgZHV0eSBjeWNsZTogJGR1dHkiCj4gPgo+ID4g
ZG9uZQo+ID4KPiA+Cj4gPgo+ID4gSW4gdGhlc2UgcGFydGljdWxhciB0ZXN0cywgSSBkaWRu4oCZ
dCBzZWUgYW55IGZ1bmN0aW9uYWwgZGlmZmVyZW5jZSBvcgo+ID4gdW5leHBlY3RlZCBiZWhhdmlv
ciB3aGV0aGVyIEkgdXNlZCBESVY2NF9VNjRfUk9VTkRfQ0xPU0VTVCgpIG9yCj4gPiBESVY2NF9V
NjRfUk9VTkRfVVAuCj4gPiBPZiBjb3Vyc2UsIHRoZXJl4oCZcyBhIGNoYW5jZSBteSB0ZXN0cyBo
YXZlbuKAmXQgY292ZXJlZCBldmVyeSBzY2VuYXJpbywKPiA+IHNvIHRoZXJlIGNvdWxkIHN0aWxs
IGJlIGVkZ2UgY2FzZXMgSSBtaXNzZWQuCj4KPiBKdXN0IHRvIGJlIHN1cmU6IFlvdSBoYXZlIFBX
TV9ERUJVRyBlbmFibGVkPwpZZXMsIHRvIHZlcmlmeSBteSBwYXRjaCwgSSBhbHdheXMgZW5hYmxl
IGl0IGJ5IGRlZmF1bHQuCgo+Cj4gPiBGcm9tIHdoYXQgSSB1bmRlcnN0YW5kLCB5b3VyIG1haW4g
Y29uY2VybiBpcyB0byBlbnN1cmUgd2UgbmV2ZXIgZW5kIHVwCj4gPiB3aXRoIGEgZHV0eSBjeWNs
ZSB0aGF04oCZcyBzbWFsbGVyIHRoYW4gd2hhdCB0aGUgdXNlciByZXF1ZXN0ZWQsIHdoaWNoIGEK
PiA+IHJvdW5kLXVwIGFwcHJvYWNoIHdvdWxkIGhlbHAgZ3VhcmFudGVlLiBJZiB5b3Ugc3RpbGwg
cmVjb21tZW5kIG1ha2luZwo+ID4gdGhhdCBjaGFuZ2UgdG8gYWNoaWV2ZSB0aGUgZGVzaXJlZCBi
ZWhhdmlvciwgSeKAmW0gaGFwcHkgdG8gdXBkYXRlIHRoZQo+ID4gY29kZSBhY2NvcmRpbmdseShD
TE9TRVNULT5VUCkuCj4KPiBObywgLmFwcGx5IHNob3VsZCByb3VuZCBkb3duIGFuZCBzbyB0byBl
bnN1cmUgdGhhdAo+Cj4gICAgICAgICBwd21fZ2V0X3N0YXRlKG15cHdtLCAmc3RhdGUpOwo+ICAg
ICAgICAgcHdtX2FwcGx5KG15cHdtLCAmc3RhdGUpOwo+Cj4gZG9lc24ndCBtb2RpZnkgdGhlIGhh
cmR3YXJlIHNldHRpbmcsIC5nZXRfc3RhdGUgaGFzIHRvIHJvdW5kIHVwLgpJIGhhdmUgc29tZSBx
dWVzdGlvbnMgdGhhdCBJJ2QgbGlrZSB0byBmdXJ0aGVyIGNvbmZpcm0sIHRvIGVuc3VyZSBJCnVu
ZGVyc3RhbmQgY29ycmVjdGx5IGFuZCBjYW4gYWRqdXN0IHRoZSBwYXRjaCBhY2NvcmRpbmdseQoK
eW91ciBlYXJsaWVyIHN1Z2dlc3Rpb25zIHdlcmUgYXMgZm9sbG93czoKIlJvdW5kLWNsb3Nlc3Qg
aXMgdXN1YWxseSB3cm9uZyBpbiBhbiAuYXBwbHkoKSBjYWxsYmFjay4gSSBkaWRuJ3QgZG8KdGhl
IGRldGFpbGVkIG1hdGgsIGJ1dCBJIHRoaW5rIHlvdSBuZWVkIHRvIHJvdW5kIHVwIGhlcmUuIgoK
VGhlIG1vcmUgcmVjZW50IHN1Z2dlc3Rpb25zIGFyZSBhcyBmb2xsb3dzOgoiTm8sIC5hcHBseSBz
aG91bGQgcm91bmQgZG93biBhbmQgc28gdG8gZW5zdXJlIHRoYXQuLi4uLiIKCkkgc3BlY3VsYXRl
IHRoYXQgdGhlIGxhdHRlciBzdWdnZXN0aW9uIGlzIHRvIGVuc3VyZSBpZGVtcG90ZW5jeQpiZXR3
ZWVuIC5hcHBseSBhbmQgLmdldF9zdGF0ZSwgYXZvaWRpbmcgdW5uZWNlc3NhcnkgaGFyZHdhcmUg
c2V0dGluZwptb2RpZmljYXRpb25zIGR1cmluZyByZXBlYXRlZCByZWFkaW5nIGFuZCBhcHBseWlu
ZyBwcm9jZXNzZXMuIEhvd2V2ZXIsCnRoZSBlYXJsaWVyIHN1Z2dlc3Rpb25zIHNlZW0gdG8gY29u
ZmxpY3Qgd2l0aCB0aGlzLgoKSWYgbmVlZGVkLCBJIGNhbiBwcm92aWRlIG1vcmUgdGVzdCByZXN1
bHRzIG9yIG1ha2UgZnVydGhlciBhZGp1c3RtZW50cy4KVGhhbmsgeW91IGFnYWluIGZvciB5b3Vy
IHBhdGllbnQgZ3VpZGFuY2UuCj4KPiBCZXN0IHJlZ2FyZHMKPiBVd2UKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
