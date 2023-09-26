Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A3AE7E62F
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 12:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eWZQyg/YfzZSMk369vb0MWRrxyhsd2dc6DASKNqlyJc=; b=OUdH9Na1I5b6zv
	zOU2F9uwoK1s9pcZRjMnVqJp3MaTzmZPSi1vzfr4dmJGHVEXwbDQIQL80qxBFls7L7tE9OwblhWQG
	BLm0tA7WGtfGrsYfMtrL94+YxkjDjidR9wmX9AyD3GJ3j2p5bpe5+gozJBf8RHzeSUsL56thHDpsi
	EnvTmFGKcsg75aGhjR2VEg5OZKZlDFV3+A876qWTD7/+g072BdMVC4Iw5N/ZkNXcEKiPOr3EI6eQf
	IAioPbd9oEGJSwE7BkWKo5bQ7J1ljOEpTSxr3mos+E7GNsOLII/gCaYyuAT2JgzK/I9IIMR1K0J4E
	oBIJw74LB2JMnS7YtYYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql7AM-00GMZz-1l;
	Tue, 26 Sep 2023 12:27:50 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql7AI-00GMYy-32
	for linux-riscv@lists.infradead.org;
	Tue, 26 Sep 2023 12:27:48 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3ae214a077cso4384875b6e.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Sep 2023 05:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695731264; x=1696336064; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecd6aTwmPojDhhjXTS5Sm+x1aifN6HhuUDSTeCWBUOE=;
        b=Zq7bi3Cmh/5bGGNsGq9oCTPROPzw2S0an55lsVP1ehWYaXAWDdi+QAfErOOCKyFk7I
         Fj5nkQdWlZv4Cz8f0dXYPg0b6IrTHCPRcy3ytRMZW7ZMR4lYNsBDthKx8UGOn/tF6XSO
         k6+Q80aEsImZkMaW9/t03QAVgliiOpkG8Xj4KkpqCbgT+BSzPfHdeGS+pdU2oWXzX1Vd
         3f5PFpOPxLEwDbDz/MQg2v8QxJDi7m085CiEkN1GWVLwrpQaasBiQq20NBQKSrSWEQP0
         OQkpIUbaGOkv47PqYKD6EAgePR3kpgu+EbaVeP7arCNYuNgRRMHNI5UL6kEA4B1jT1Sc
         9AFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695731264; x=1696336064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ecd6aTwmPojDhhjXTS5Sm+x1aifN6HhuUDSTeCWBUOE=;
        b=B9dOR9gv8PJ6B7EO7lV1cBpP9NXbjpj4lVTHY4zc+Mo5bTv182OpqdIY4LfxVSPCP8
         KDTU7Sb4VuqDyFrsE0yT5Wk5cj9E/o8ASW+K38/PhtlPgSqVxSJFNm/OtUENCbjohFlw
         7+uLjE1LE76RTpl/b6GbvkDW6YsmFGh1qrK5HwmbSMePn8lnAEblkUcMnnTyomPYJShE
         VfA0o348lvRfZnDcWQtFdCMtxsNdkdgFDgH9vxtqIzfKvWxXhoMyLie1wzKjaEqPC8Ab
         CjorJYIyLGu/cOATW6Kqb4BlYABrimlyNFxL1kk9mfXiRp8UWEThxvmH82uACUVI2znx
         /CPQ==
X-Gm-Message-State: AOJu0Yzm26bkL5v2bTu6j9grzG2gSiX0r86zJ/ajnlS+KdyqOWzLn/o4
	L+bWG0Vt8KjRd1S1OG5ou9EnifvaLOvAIwuu9wVEkA==
X-Google-Smtp-Source: AGHT+IFcDYRKHI3MnCK+bdOiQSNRW9LfrPqOMjaeUxaMn6JJWkAZ5/iGEXuoRrOGmpuhKaQj689lWd1pSPIwfBK8lyo=
X-Received: by 2002:a05:6808:14cf:b0:3ae:1446:d48b with SMTP id
 f15-20020a05680814cf00b003ae1446d48bmr14011249oiw.3.1695731264006; Tue, 26
 Sep 2023 05:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230912174928.528414-1-apatel@ventanamicro.com>
 <20230912174928.528414-3-apatel@ventanamicro.com> <ZRE5A5GxF7wU68vt@sunil-laptop>
In-Reply-To: <ZRE5A5GxF7wU68vt@sunil-laptop>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 26 Sep 2023 17:57:31 +0530
Message-ID: <CAK9=C2X=KbvCjR2pQCVnqt3kgNtRH9-0S4JtXf+qci--fAuY8Q@mail.gmail.com>
Subject: Re: [PATCH v8 02/16] RISC-V: Add riscv_get_intc_hartid() function
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand <frowand.list@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, Atish Patra <atishp@atishpatra.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Saravana Kannan <saravanak@google.com>, 
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_052746_985074_20C0F387 
X-CRM114-Status: GOOD (  30.41  )
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

T24gTW9uLCBTZXAgMjUsIDIwMjMgYXQgMTowOOKAr1BNIFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiBPbiBUdWUsIFNlcCAxMiwgMjAy
MyBhdCAxMToxOToxNFBNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gV2UgYWRkIGEgY29t
bW9uIHJpc2N2X2dldF9pbnRjX2hhcnRpZCgpIHdoaWNoIGhlbHAgZGV2aWNlIGRyaXZlcnMgdG8K
PiA+IGdldCBoYXJ0aWQgb2YgdGhlIEhBUlQgYXNzb2NpYXRlZCB3aXRoIGEgSU5UQyAoaS5lLiBs
b2NhbCBpbnRlcnJ1cHQKPiA+IGNvbnRyb2xsZXIpIGZ3bm9kZS4gVGhpcyBuZXcgZnVuY3Rpb24g
aXMgbW9yZSBnZW5lcmljIGNvbXBhcmVkIHRvCj4gPiB0aGUgZXhpc3RpbmcgcmlzY3Zfb2ZfcGFy
ZW50X2hhcnRpZCgpIGZ1bmN0aW9uIGhlbmNlIHdlIGFsc28gcmVwbGFjZQo+ID4gdXNlIG9mIHJp
c2N2X29mX3BhcmVudF9oYXJ0aWQoKSB3aXRoIHJpc2N2X2dldF9pbnRjX2hhcnRpZCgpLgo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+
ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCB8ICA0ICsrKy0K
PiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHUuYyAgICAgICAgICAgIHwgMTMgKysrKysrKysrKysr
LQo+ID4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jICAgfCAgMiArLQo+ID4gIGRy
aXZlcnMvaXJxY2hpcC9pcnEtc2lmaXZlLXBsaWMuYyAgfCAgMyArKy0KPiA+ICA0IGZpbGVzIGNo
YW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmggYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3Byb2Nlc3Nvci5oCj4gPiBpbmRleCAzZTIzZTE3ODZkMDUuLjNjZTY0YjNiZWE0ZSAx
MDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgKPiA+ICsr
KyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgKPiA+IEBAIC0xMTksNyArMTE5
LDkgQEAgc3RhdGljIGlubGluZSB2b2lkIHdhaXRfZm9yX2ludGVycnVwdCh2b2lkKQo+ID4gIHN0
cnVjdCBkZXZpY2Vfbm9kZTsKPiA+ICBpbnQgcmlzY3Zfb2ZfcHJvY2Vzc29yX2hhcnRpZChzdHJ1
Y3QgZGV2aWNlX25vZGUgKm5vZGUsIHVuc2lnbmVkIGxvbmcgKmhhcnRpZCk7Cj4gPiAgaW50IHJp
c2N2X2Vhcmx5X29mX3Byb2Nlc3Nvcl9oYXJ0aWQoc3RydWN0IGRldmljZV9ub2RlICpub2RlLCB1
bnNpZ25lZCBsb25nICpoYXJ0aWQpOwo+ID4gLWludCByaXNjdl9vZl9wYXJlbnRfaGFydGlkKHN0
cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSwgdW5zaWduZWQgbG9uZyAqaGFydGlkKTsKPiA+ICsKPiA+
ICtzdHJ1Y3QgZndub2RlX2hhbmRsZTsKPiA+ICtpbnQgcmlzY3ZfZ2V0X2ludGNfaGFydGlkKHN0
cnVjdCBmd25vZGVfaGFuZGxlICpub2RlLCB1bnNpZ25lZCBsb25nICpoYXJ0aWQpOwo+ID4KPiA+
ICBleHRlcm4gdm9pZCByaXNjdl9maWxsX2h3Y2FwKHZvaWQpOwo+ID4gIGV4dGVybiBpbnQgYXJj
aF9kdXBfdGFza19zdHJ1Y3Qoc3RydWN0IHRhc2tfc3RydWN0ICpkc3QsIHN0cnVjdCB0YXNrX3N0
cnVjdCAqc3JjKTsKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHUuYyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL2NwdS5jCj4gPiBpbmRleCAxNTdhY2U4YjI2MmMuLmVlNTgzZWFjM2M1
YiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdS5jCj4gPiArKysgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9jcHUuYwo+ID4gQEAgLTEyMyw3ICsxMjMsOCBAQCBpbnQgX19pbml0IHJp
c2N2X2Vhcmx5X29mX3Byb2Nlc3Nvcl9oYXJ0aWQoc3RydWN0IGRldmljZV9ub2RlICpub2RlLCB1
bnNpZ25lZCBsbwo+ID4gICAqIFRvIGFjaGlldmUgdGhpcywgd2Ugd2FsayB1cCB0aGUgRFQgdHJl
ZSB1bnRpbCB3ZSBmaW5kIGFuIGFjdGl2ZQo+ID4gICAqIFJJU0MtViBjb3JlIChIQVJUKSBub2Rl
IGFuZCBleHRyYWN0IHRoZSBjcHVpZCBmcm9tIGl0Lgo+ID4gICAqLwo+ID4gLWludCByaXNjdl9v
Zl9wYXJlbnRfaGFydGlkKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSwgdW5zaWduZWQgbG9uZyAq
aGFydGlkKQo+ID4gK3N0YXRpYyBpbnQgcmlzY3Zfb2ZfcGFyZW50X2hhcnRpZChzdHJ1Y3QgZGV2
aWNlX25vZGUgKm5vZGUsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGxvbmcgKmhhcnRpZCkKPiA+ICB7Cj4gPiAgICAgICBmb3IgKDsgbm9kZTsgbm9kZSA9IG5v
ZGUtPnBhcmVudCkgewo+ID4gICAgICAgICAgICAgICBpZiAob2ZfZGV2aWNlX2lzX2NvbXBhdGli
bGUobm9kZSwgInJpc2N2IikpIHsKPiA+IEBAIC0xMzksNiArMTQwLDE2IEBAIGludCByaXNjdl9v
Zl9wYXJlbnRfaGFydGlkKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSwgdW5zaWduZWQgbG9uZyAq
aGFydGlkKQo+ID4gICAgICAgcmV0dXJuIC0xOwo+ID4gIH0KPiA+Cj4gPiArLyogRmluZCBoYXJ0
IElEIG9mIHRoZSBJTlRDIGZ3bm9kZS4gKi8KPiA+ICtpbnQgcmlzY3ZfZ2V0X2ludGNfaGFydGlk
KHN0cnVjdCBmd25vZGVfaGFuZGxlICpub2RlLCB1bnNpZ25lZCBsb25nICpoYXJ0aWQpCj4gPiAr
ewo+ID4gKyAgICAgLyogRXh0ZW5kIHRoaXMgZnVuY3Rpb24gQUNQSSBpbiB0aGUgZnV0dXJlLiAq
Lwo+Cj4gQXMgcGVyIE1hcmMncyBmZWVkYmFjaywgd2UgY2FuJ3QgdXNlIHN3bm9kZSBmb3IgQUNQ
SSBpcmNoaXBzLiBTbywgdGhlcmUKPiBpcyBubyBuZWVkIHRvIGNyZWF0ZSB0aGlzIHdyYXBwZXIg
ZnVuY3Rpb24gYW5kIHRoaXMgcGF0Y2ggY2FuIGJlCj4gZHJvcHBlZC4KCk9rYXksIEkgd2lsbCBk
cm9wIHRoaXMgcGF0Y2guCgpSZWdhcmRzLApBbnVwCgo+Cj4gVGhhbmtzLAo+IFN1bmlsCj4KPiA+
ICsgICAgIGlmICghaXNfb2Zfbm9kZShub2RlKSkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1F
Tk9ERVY7Cj4gPiArCj4gPiArICAgICByZXR1cm4gcmlzY3Zfb2ZfcGFyZW50X2hhcnRpZCh0b19v
Zl9ub2RlKG5vZGUpLCBoYXJ0aWQpOwo+ID4gK30KPiA+ICsKPiA+ICBERUZJTkVfUEVSX0NQVShz
dHJ1Y3QgcmlzY3ZfY3B1aW5mbywgcmlzY3ZfY3B1aW5mbyk7Cj4gPgo+ID4gIHVuc2lnbmVkIGxv
bmcgcmlzY3ZfY2FjaGVkX212ZW5kb3JpZCh1bnNpZ25lZCBpbnQgY3B1X2lkKQo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jIGIvZHJpdmVycy9pcnFjaGlw
L2lycS1yaXNjdi1pbnRjLmMKPiA+IGluZGV4IDRhZGVlZTFiYzM5MS4uNjVmNGEyYWZiMzgxIDEw
MDY0NAo+ID4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMKPiA+ICsrKyBi
L2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jCj4gPiBAQCAtMTQzLDcgKzE0Myw3IEBA
IHN0YXRpYyBpbnQgX19pbml0IHJpc2N2X2ludGNfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5v
ZGUsCj4gPiAgICAgICBpbnQgcmM7Cj4gPiAgICAgICB1bnNpZ25lZCBsb25nIGhhcnRpZDsKPiA+
Cj4gPiAtICAgICByYyA9IHJpc2N2X29mX3BhcmVudF9oYXJ0aWQobm9kZSwgJmhhcnRpZCk7Cj4g
PiArICAgICByYyA9IHJpc2N2X2dldF9pbnRjX2hhcnRpZChvZl9md25vZGVfaGFuZGxlKG5vZGUp
LCAmaGFydGlkKTsKPiA+ICAgICAgIGlmIChyYyA8IDApIHsKPiA+ICAgICAgICAgICAgICAgcHJf
d2FybigidW5hYmxlIHRvIGZpbmQgaGFydCBpZCBmb3IgJXBPRlxuIiwgbm9kZSk7Cj4gPiAgICAg
ICAgICAgICAgIHJldHVybiAwOwo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEt
c2lmaXZlLXBsaWMuYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtc2lmaXZlLXBsaWMuYwo+ID4gaW5k
ZXggZTE0ODQ5MDViN2JkLi41NmIwNTQ0YjFmMjcgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2ly
cWNoaXAvaXJxLXNpZml2ZS1wbGljLmMKPiA+ICsrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtc2lm
aXZlLXBsaWMuYwo+ID4gQEAgLTQ3Nyw3ICs0NzcsOCBAQCBzdGF0aWMgaW50IF9faW5pdCBfX3Bs
aWNfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUsCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgY29udGludWU7Cj4gPiAgICAgICAgICAgICAgIH0KPiA+Cj4gPiAtICAgICAgICAgICAgIGVy
cm9yID0gcmlzY3Zfb2ZfcGFyZW50X2hhcnRpZChwYXJlbnQubnAsICZoYXJ0aWQpOwo+ID4gKyAg
ICAgICAgICAgICBlcnJvciA9IHJpc2N2X2dldF9pbnRjX2hhcnRpZChvZl9md25vZGVfaGFuZGxl
KHBhcmVudC5ucCksCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICZoYXJ0aWQpOwo+ID4gICAgICAgICAgICAgICBpZiAoZXJyb3IgPCAwKSB7Cj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgcHJfd2FybigiZmFpbGVkIHRvIHBhcnNlIGhhcnQgSUQgZm9yIGNv
bnRleHQgJWQuXG4iLCBpKTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+
IC0tCj4gPiAyLjM0LjEKPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
