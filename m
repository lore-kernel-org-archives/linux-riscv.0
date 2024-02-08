Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35591C48260
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 13:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vs+8poDxnR2Yr4kg2xdD1bg8hlNB7s2c0CK2pyl2OL0=; b=uqNd4Sg+LK5UgX
	4qhELip5a/tjNlESPmanulnkQuWx0HzhIz4o9r41P1wGT0Oy/XfaFlRIRlwbLLuYtnJ7tJPrQHYI+
	PsD1/Vn65Vd90vDtmsWO6v5m7aQG1fg0V2yBu2NyEkptR0rVfzWDDpzyw6w1mB16JpEpjx8F/uj9o
	bsS+sOS6wZBRy4hXWRFpU4Apf1rCGMmgfqv4Xr5aD9oBuJhL7BCgHKP4paElgpZE2KA11vY3vNdgE
	y8X1a7RLvXL9dSZHROKbMSH0yjp+krR1k7sWeimr2RthXr0ZlmNjwLDtV85jqeb0DdInKQEJmQ2x2
	hF2SMYRuK2+ZTXzvv2yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY4N3-0000000DtH0-4B8W;
	Thu, 08 Feb 2024 13:23:18 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY4N1-0000000DtG0-0a1i
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 13:23:16 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5610c233b95so577436a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Feb 2024 05:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1707398593; x=1708003393; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2zpgdujj1gYFQCxpzgk3AGLL3hOuoYEj3pj3VOmX9g=;
        b=VmdbWY9Gs1D10I+cjEPDUwefSYFsM8g40dVuuWAeq+iPjXj1WnfyYi9DKCB3REl4Oo
         a0F814crcsRW0WAtdl4QyT3VH+8BJqjjySGo96UaqmaN0b5OA00OhskLLd6PBp6l4CL8
         tNaAZpnVBSoiHdff3YghQPAQj5kTmms+lu5ilbuqzmZ+MeClK7O9qt5HVdE4XccnuxTv
         Qq+std9vOmAKNi4sqlI2osoVOt1eQMdcE+2n+wvTX+hNJ24qknnPH1WX+06aL5AAmYpf
         tzdoLJCgNmdCRxqk/lHUh5mOftknbIOqlsBzZ8g9/FgdjPpLJhjj0t1vI3ei+Wz9epwk
         wKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707398593; x=1708003393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2zpgdujj1gYFQCxpzgk3AGLL3hOuoYEj3pj3VOmX9g=;
        b=v9Hb00tup/Vsbj3zf/lBMypdc/bueAVhnU3l9CjqSLyEm7yRunxK5lwVeiJadCuQYE
         tGExsvcwywTfvaCBCQRmJvV8EA0Wx7uBKTp4OoC5EQUlVHnx8faRti085CeuKDUGlpSE
         oUe3PTsy8ZmL7NFObjaTUBj5vI++ErQQUolqoRDuqTkRBZuWqZ0Sxg0MZeKBdBEpaKaX
         l8iGdDInclvFodYl7mefTORv2rTydOI/zAq9FsUdvZuvXKVTSRf0cj7V21K/3eNv7Gju
         hLFHCpf/0yfemk5/cpiXL2+UGGRpeQ1HBafxfgjDqmpiX6+nSXEMIZx8d8ufBVOgWLPl
         okpQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9qAzRLCubjfgCmBf7QLI9vIKa5Y8JsH3VzdCLqzfj+zSRG2hpShb0KcStUTQ7Brb6rRmbe9Rql6nS5H/8Pih081FNsG8Xf8tTDv4bZDRM
X-Gm-Message-State: AOJu0YzoFgXAOM3retH5ubhpeY5pUytEQrddJ0HCF1cEp9hE8EYyIh3d
	HBv0FuzSlv/T5as6ykenuamWcTWhECJpdeHHUHxX+WkBHD7wNKziDNwQoJ3b+FYvZfAOqx32azA
	Npk2hePnI5UHMbGoayQy/sX6Qt874adENPD7Fhw==
X-Google-Smtp-Source: AGHT+IEc4w81N06k/dJCCWI/8ie/Uaz6Jb1ky5A9KAQW2kGf8+rE4iLeOHNbonyyyUv3nuMoSXMDNxqjJlJT0K+Lu+s=
X-Received: by 2002:a17:906:dce:b0:a3b:a4e6:f83e with SMTP id
 p14-20020a1709060dce00b00a3ba4e6f83emr1277933eji.20.1707398593065; Thu, 08
 Feb 2024 05:23:13 -0800 (PST)
MIME-Version: 1.0
References: <20240206204607.527195-1-alexghiti@rivosinc.com> <ZcS+GAaM25LXsBOl@andrea>
In-Reply-To: <ZcS+GAaM25LXsBOl@andrea>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 8 Feb 2024 14:23:02 +0100
Message-ID: <CAHVXubj7ChgpvN4F_QO0oASaT5WC2VS0Q-bEqhnmF8z8QV=yDQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix text patching when icache flushes use IPIs
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_052315_393867_DBCA3A66 
X-CRM114-Status: GOOD (  25.29  )
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

SGkgQW5kcmVhLAoKT24gVGh1LCBGZWIgOCwgMjAyNCBhdCAxMjo0MuKAr1BNIEFuZHJlYSBQYXJy
aSA8cGFycmkuYW5kcmVhQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiA+ICtzdGF0aWMgaW50IF9fZnRy
YWNlX21vZGlmeV9jb2RlKHZvaWQgKmRhdGEpCj4gPiArewo+ID4gKyAgICAgc3RydWN0IGZ0cmFj
ZV9tb2RpZnlfcGFyYW0gKnBhcmFtID0gZGF0YTsKPiA+ICsKPiA+ICsgICAgIGlmIChhdG9taWNf
aW5jX3JldHVybigmcGFyYW0tPmNwdV9jb3VudCkgPT0gbnVtX29ubGluZV9jcHVzKCkpIHsKPiA+
ICsgICAgICAgICAgICAgZnRyYWNlX21vZGlmeV9hbGxfY29kZShwYXJhbS0+Y29tbWFuZCk7Cj4g
PiArICAgICAgICAgICAgIGF0b21pY19pbmMoJnBhcmFtLT5jcHVfY291bnQpOwo+Cj4gSSBzdGFy
ZWQgYXQgZnRyYWNlX21vZGlmeV9hbGxfY29kZSgpIGZvciBhIGJpdCBidXQgaG9uZXN0bHkgSSBk
b24ndCBzZWUKPiB3aGF0IHByZXZlbnRzIHRoZSAtPmNwdV9jb3VudCBpbmNyZW1lbnQgZnJvbSBi
ZWluZyByZW9yZGVyZWQgYmVmb3JlIHRoZQo+IGluc24gd3JpdGUocykgKGFyY2hpdGVjdHVyYWxs
eSkgbm93IHRoYXQgeW91IGhhdmUgcmVtb3ZlZCB0aGUgSVBJIGRhbmNlOgo+IHBlcmhhcHMgYWRk
IGFuIHNtcF93bWIoKSByaWdodCBiZWZvcmUgdGhlIGF0b21pY19pbmMoKSAob3IgcHJvbW90ZSB0
aGlzCj4gbGF0dGVyIHRvIGEgKHZvaWQpYXRvbWljX2luY19yZXR1cm5fcmVsZWFzZSgpKSBhbmQv
b3IgYW4gaW5saW5lIGNvbW1lbnQKPiBzYXlpbmcgd2h5IHN1Y2ggcmVvcmRlcmluZyBpcyBub3Qg
cG9zc2libGU/CgpJIGRpZCBub3QgZXZlbiB0aGluayBvZiB0aGF0LCBhbmQgaXQgYWN0dWFsbHkg
bWFrZXMgc2Vuc2Ugc28gSSdsbCBnbwp3aXRoIHdoYXQgeW91IHByb3Bvc2U6IEknbGwgcmVwbGFj
ZSBhdG9taWNfaW5jKCkgd2l0aAphdG9taWNfaW5jX3JldHVybl9yZWxlYXNlKCkuIEFuZCBJJ2xs
IGFkZCB0aGUgZm9sbG93aW5nIGNvbW1lbnQgaWYKdGhhdCdzIG9rIHdpdGggeW91OgoKIk1ha2Ug
c3VyZSB0aGUgcGF0Y2hpbmcgc3RvcmUgaXMgZWZmZWN0aXZlICpiZWZvcmUqIHdlIGluY3JlbWVu
dCB0aGUKY291bnRlciB3aGljaCByZWxlYXNlcyBhbGwgd2FpdGluZyBjcHVzIgoKPgo+Cj4gPiAr
ICAgICB9IGVsc2Ugewo+ID4gKyAgICAgICAgICAgICB3aGlsZSAoYXRvbWljX3JlYWQoJnBhcmFt
LT5jcHVfY291bnQpIDw9IG51bV9vbmxpbmVfY3B1cygpKQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgIGNwdV9yZWxheCgpOwo+ID4gKyAgICAgICAgICAgICBzbXBfbWIoKTsKPgo+IEkgc2VlIHRo
YXQgeW91J3ZlIGxpZnRlZC9jb3BpZWQgdGhlIG1lbW9yeSBiYXJyaWVyIGZyb20gcGF0Y2hfdGV4
dF9jYigpOgo+IHdoYXQncyBpdHMgcG9pbnQ/ICBBRkFJVSwgdGhlIGJhcnJpZXIgaGFzIG5vIG9y
ZGVyaW5nIGVmZmVjdCBvbiBwcm9ncmFtCj4gb3JkZXIgbGF0ZXIgaW5zbiBmZXRjaGVzOyBwZXJo
YXBzIHRoZSBjb2RlIHdhcyBiYXNlZCBvbiBzb21lIGxlZ2FjeS9vbGQKPiB2ZXJzaW9uIG9mIFpp
ZmVuY2VpPyAgSUFDLCBjb21tZW50cywgY29tbWVudHMsIC4uLiBvciBtYXliZSBqdXN0IHJlbW92
ZQo+IHRoYXQgbWVtb3J5IGJhcnJpZXI/CgpIb25lc3RseSwgSSBsb29rZWQgYXQgaXQgb25lIG1p
bnV0ZSwgZGlkIG5vdCB1bmRlcnN0YW5kIGl0cyBwdXJwb3NlCmFuZCBzYWlkIHRvIG15c2VsZiAi
b2sgdGhhdCBjYW4ndCBodXJ0IGFueXdheSwgSSBtYXkgYmUgbWlzc2luZwpzb21ldGhpbmciLgoK
RldJVywgIEkgc2VlIHRoYXQgYXJtNjQgdXNlcyBpc2IoKSBoZXJlLiBJZiB5b3UgZG9uJ3Qgc2Vl
IGl0cyBwdXJwb3NlLApJJ2xsIHJlbW92ZSBpdCAoaGVyZSBhbmQgd2hlcmUgSSBjb3BpZWQgaXQp
LgoKPgo+Cj4gPiArICAgICB9Cj4gPiArCj4gPiArICAgICBsb2NhbF9mbHVzaF9pY2FjaGVfYWxs
KCk7Cj4gPiArCj4gPiArICAgICByZXR1cm4gMDsKPiA+ICt9Cj4KPiBbLi4uXQo+Cj4KPiA+IEBA
IC0yMzIsOCArMjMwLDcgQEAgc3RhdGljIGludCBwYXRjaF90ZXh0X2NiKHZvaWQgKmRhdGEpCj4g
PiAgICAgICBpZiAoYXRvbWljX2luY19yZXR1cm4oJnBhdGNoLT5jcHVfY291bnQpID09IG51bV9v
bmxpbmVfY3B1cygpKSB7Cj4gPiAgICAgICAgICAgICAgIGZvciAoaSA9IDA7IHJldCA9PSAwICYm
IGkgPCBwYXRjaC0+bmluc25zOyBpKyspIHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBsZW4g
PSBHRVRfSU5TTl9MRU5HVEgocGF0Y2gtPmluc25zW2ldKTsKPiA+IC0gICAgICAgICAgICAgICAg
ICAgICByZXQgPSBwYXRjaF90ZXh0X25vc3luYyhwYXRjaC0+YWRkciArIGkgKiBsZW4sCj4gPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnBhdGNoLT5pbnNu
c1tpXSwgbGVuKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICByZXQgPSBwYXRjaF9pbnNuX3dy
aXRlKHBhdGNoLT5hZGRyICsgaSAqIGxlbiwgJnBhdGNoLT5pbnNuc1tpXSwgbGVuKTsKPiA+ICAg
ICAgICAgICAgICAgfQo+ID4gICAgICAgICAgICAgICBhdG9taWNfaW5jKCZwYXRjaC0+Y3B1X2Nv
dW50KTsKPiA+ICAgICAgIH0gZWxzZSB7Cj4gPiBAQCAtMjQyLDYgKzIzOSw4IEBAIHN0YXRpYyBp
bnQgcGF0Y2hfdGV4dF9jYih2b2lkICpkYXRhKQo+ID4gICAgICAgICAgICAgICBzbXBfbWIoKTsK
PiA+ICAgICAgIH0KPiA+Cj4gPiArICAgICBsb2NhbF9mbHVzaF9pY2FjaGVfYWxsKCk7Cj4gPiAr
Cj4gPiAgICAgICByZXR1cm4gcmV0Owo+ID4gIH0KPiA+ICBOT0tQUk9CRV9TWU1CT0wocGF0Y2hf
dGV4dF9jYik7Cj4KPiBNeSBhYm92ZSByZW1hcmtzL3F1ZXN0aW9ucyBhbHNvIGFwcGx5IHRvIHRo
aXMgZnVuY3Rpb24uCj4KPgo+IE9uIGEgbGFzdCB0b3BpYywgYWx0aG91Z2ggc29tZWhvdyBvcnRo
b2dvbmFsIHRvIHRoZSBzY29wZSBvZiB0aGlzIHBhdGNoLAo+IEknbSBub3Qgc3VyZSB0aGUgcGF0
Y2hfe21hcCx1bm1hcH0oKSBkYW5jZSBpbiBvdXIgcGF0Y2hfaW5zbl93cml0ZSgpIGlzCj4gY29y
cmVjdDogSSBjYW4gc2VlIHdoeSB3ZSBtYXkgd2FudCAobmVlZCB0byBkbykgdGhlIGxvY2FsIFRM
QiBmbHVzaCBiZS0KPiBmb3JlIHJldHVybmluZyBmcm9tIHBhdGNoX3ttYXAsdW5tYXB9KCksIGJ1
dCBkb2VzIGEgbG9jYWwgZmx1c2ggc3VmZmljZT8KPiBGb3IgY29tcGFyaXNvbiwgYXJtNjQgc2Vl
bXMgdG8gZ28gdGhyb3VnaCBhIGNvbXBsZXRlIGRzYi10bGJpLWRzYigtaXNiKQo+IHNlcXVlbmNl
IGluIHRoZWlyIHVubWFwcGluZyBzdGFnZSAoYW5kIGFwcGFyZW50bHkgcmVseWluZyBvbiAibm8g
Y2FjaGluZwo+IG9mIGludmFsaWQgcHRlcyIgaW4gdGhlaXIgbWFwcGluZyBzdGFnZSkuICBPZiBj
b3Vyc2UsICJicm9hZGNhc3RpbmciIG91cgo+IChyaXNjdidzKSBUTEIgaW52YWxpZGF0aW9ucyB3
aWxsIG5lY2Vzc2FyeSBpbnRyb2R1Y2Ugc29tZSBjb21wbGV4aXR5Li4uCj4KPiBUaG91Z2h0cz8K
ClRvIGF2b2lkIHJlbW90ZSBUTEJJLCBjb3VsZCB3ZSBzaW1wbHkgZGlzYWJsZSB0aGUgcHJlZW1w
dGlvbiBiZWZvcmUKdGhlIGZpcnN0IHBhdGNoX21hcCgpPyBhcm02NCBkaXNhYmxlcyB0aGUgaXJx
cywgYnV0IHRoYXQgc2VlbXMKb3ZlcmtpbGwgdG8gbWUsIGJ1dCBtYXliZSBJJ20gbWlzc2luZyBz
b21ldGhpbmcgYWdhaW4/CgpUaGFua3MgZm9yIHlvdXIgY29tbWVudHMgQW5kcmVhLAoKQWxleAoK
Pgo+ICAgQW5kcmVhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
