Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA97FC25B67
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 12:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+EMmJonQjfcuysBwNKY5NbEVGklHWPt3gR9x0E7SmzM=; b=OHpuDmOXG4cfkc
	xr3ngdOVWKym9fANq0U6ly5I9DAigVvuwwDF3hjjWyduhZmDnDuDYhHmy9xfHkmD7cwcvMXVaL3nQ
	Pt/8XZfUjKasW9GUm9lZAgQnCc6mX2PE6uBuYkfj0B3Xc1BsHK5OkTJ6LufbFwWTQbPzDjEk6NXzG
	pUpzoO8TtBXpHxV1ISoAgqwezC61SCWxNVnVEZPCkyD6vj1UyqazrVuWVG2irfF/79LdL39BmLaWT
	q8X0ww9O5GpKNMViEN26j81x7aIfjdLbMI4jz5yJsF7KWX+SagIJcrHj05RkUmyI7qBzHbM5HyuGk
	oDkh2YnEusdq7sZ5DeSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvzRz-00ERF8-1g;
	Thu, 26 Oct 2023 12:26:59 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvzRw-00EREE-2u
	for linux-riscv@lists.infradead.org;
	Thu, 26 Oct 2023 12:26:58 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-27d104fa285so665255a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 26 Oct 2023 05:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698323213; x=1698928013; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXJ5tou+MTDDsn+Qorzf1KVbPbDjWZpFZtthsZ+ew3Q=;
        b=g/kxKoqXsLCwSF+aQYxfwxfK2Zh8kaAZff217PvrxqF+zA65ae7t0KwTRLrqfbO4uh
         SfxUgQ9Tt3TgbiYqlLxsgML1/+MDg3bcQQifL/radPe+fXGkiLjjYXUmbUeJUXb+Vtun
         pNltOmI+d9A6zVd6oJkl/KiZyQ5tnM/lNDKyzjeMvLF14XQ3cLiVhMQJKxotiakAxr4g
         m5hfCJYWSKEurV9RYT6EoRkHQT4iLDA1c/pihZDr4W6GlH9kU86nUSPQ8RwfVz6MGTwo
         xyI590lHc2wSrQYlNdJsX/Kl9RcirkOSs8dieHThcfJ3msqPBcQ9liqPcC1Omc3wA2xC
         RQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698323213; x=1698928013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PXJ5tou+MTDDsn+Qorzf1KVbPbDjWZpFZtthsZ+ew3Q=;
        b=mTXlZTF4SbgZ2Ab3tadDXRWvVJMpCkabLbgHR5CAJhPC+AjY1iC5dG9croFSStmGIq
         ddNHld1BN2sMcMvn1JFsPA2wPBbNT4tCItZXR17HXET7H9yQYx/gIO7Xb4ibg2E/iE/s
         HW+lTCKNE/WHPOcOBe2LRijaq9PoRQNSHeWaST/owLGvDsFSwHmi8P6LSu03SBAgrlnp
         qUW0SfFweZE8KRdAzqdwwrXT6YmefQ11ofLsihzgNy6TEFdPejj8qHajXHGTRy30aNsz
         aDc+e7Rel1ji5ovaEFrh5fLt/fWQ1d/97tFnHOl5bFmcYssXDKG8SWhSod98fl7MxJAN
         SChg==
X-Gm-Message-State: AOJu0YysxKOiD5CmMZsDmW3FhnEYftv/S12CWKCrlvcl+rlsWao0vzAL
	bBH+Ihqnx7WPDWAkK8fG11iVUVTcgib04jU3daNVwDKOvH/HNcs8
X-Google-Smtp-Source: AGHT+IH80GhU4nXYY42cYgV15oqUGIZjnG/cJ28a1F8rp4lIL02+oyjlyhoHrT831HjrIFrxQZxtMTEM+EhdKGZ18eg=
X-Received: by 2002:a17:90a:f593:b0:27f:f1fa:b448 with SMTP id
 ct19-20020a17090af59300b0027ff1fab448mr2310488pjb.11.1698323213187; Thu, 26
 Oct 2023 05:26:53 -0700 (PDT)
MIME-Version: 1.0
References: <20231026101957.320572-1-bjorn@kernel.org>
In-Reply-To: <20231026101957.320572-1-bjorn@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 26 Oct 2023 17:56:41 +0530
Message-ID: <CAK9=C2Vcbq_ReGcK51uOYp+M2hakz=9=RNHaHFMbfxhth_4cnA@mail.gmail.com>
Subject: Re: [RFC PATCH] genirq/matrix: Dynamic bitmap allocation
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_052656_942151_E2D78E5D 
X-CRM114-Status: GOOD (  22.11  )
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

T24gVGh1LCBPY3QgMjYsIDIwMjMgYXQgMzo1MOKAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gRnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMu
Y29tPgo+Cj4gU29tZSAoZnV0dXJlKSB1c2VycyBvZiB0aGUgaXJxIG1hdHJpeCBhbGxvY2F0b3Is
IGRvIG5vdCBrbm93IHRoZSBzaXplCj4gb2YgdGhlIG1hdHJpeCBiaXRtYXBzIGF0IGNvbXBpbGUg
dGltZS4KPgo+IFRvIGF2b2lkIHdhc3RpbmcgbWVtb3J5IG9uIHVubmVjZXNzYXJ5IGxhcmdlIGJp
dG1hcHMsIHNpemUgdGhlIGJpdG1hcAo+IGF0IG1hdHJpeCBhbGxvY2F0aW9uIHRpbWUuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4gLS0tCj4g
SGVyZSdzIGEgY2xlYW5lZCB1cCwgYm9vdCB0ZXN0ZWQsIHByb3BlciBwYXRjaC4KPgo+IFRob21h
cywgdGhpcyBpcyBqdXN0IEZZSS9SRkMuIFRoaXMgY2hhbmdlIHdvdWxkIG9ubHkgbWFrZSBzZW5z
ZSwgaWYKPiB0aGUgUklTQy1WIEFJQSBzZXJpZXMgc3RhcnRzIHVzaW5nIHRoZSBJUlEgbWF0cml4
IGFsbG9jYXRvci4KCkkgaGF2ZSBkcm9wcGVkICJtdWx0aS1NU0kiIHN1cHBvcnQgZnJvbSB0aGUg
QUlBIHYxMiBzZXJpZXMKYW5kIGFsc28gaW50ZWdyYXRlZCB0aGUgSVJRIG1hdHJpeCBhbGxvY2F0
b3IuIFRoaXMgcGF0Y2ggaXMKaW5jbHVkZWQgaW4gdGhlIEFJQSB2MTIgc2VyaWVzLgoKRm9yIHJl
ZmVyZW5jZSwgbG9vayBhdCByaXNjdl9haWFfdjEyIGJyYW5jaCBhdDoKaHR0cHM6Ly9naXRodWIu
Y29tL2F2cGF0ZWwvbGludXguZ2l0CgpJIHN0aWxsIG5lZWQgdG8gcmViYXNlIHRoaXMgdXBvbiBk
ZXZpY2UgTVNJIGRvbWFpbiBzdXBwb3J0CmZyb20gVGhvbWFzLgoKUmVnYXJkcywKQW51cAoKCj4K
Pgo+IEJqw7Zybgo+IC0tLQo+ICBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9od19pcnEuaCB8ICAyIC0t
Cj4gIGtlcm5lbC9pcnEvbWF0cml4LmMgICAgICAgICAgIHwgMjggKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDEzIGRlbGV0
aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2h3X2lycS5oIGIv
YXJjaC94ODYvaW5jbHVkZS9hc20vaHdfaXJxLmgKPiBpbmRleCA1NTE4Mjk4ODQ3MzQuLmRjZmFh
MzgxMjMwNiAxMDA2NDQKPiAtLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9od19pcnEuaAo+ICsr
KyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2h3X2lycS5oCj4gQEAgLTE2LDggKzE2LDYgQEAKPgo+
ICAjaW5jbHVkZSA8YXNtL2lycV92ZWN0b3JzLmg+Cj4KPiAtI2RlZmluZSBJUlFfTUFUUklYX0JJ
VFMgICAgICAgICAgICAgICAgTlJfVkVDVE9SUwo+IC0KPiAgI2lmbmRlZiBfX0FTU0VNQkxZX18K
Pgo+ICAjaW5jbHVkZSA8bGludXgvcGVyY3B1Lmg+Cj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9pcnEv
bWF0cml4LmMgYi9rZXJuZWwvaXJxL21hdHJpeC5jCj4gaW5kZXggMTY5OGU3NzY0NWFjLi45OTZj
YmI0NmQ2NTQgMTAwNjQ0Cj4gLS0tIGEva2VybmVsL2lycS9tYXRyaXguYwo+ICsrKyBiL2tlcm5l
bC9pcnEvbWF0cml4LmMKPiBAQCAtOCw4ICs4LDYgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L2NwdS5o
Pgo+ICAjaW5jbHVkZSA8bGludXgvaXJxLmg+Cj4KPiAtI2RlZmluZSBJUlFfTUFUUklYX1NJWkUg
ICAgICAgIChCSVRTX1RPX0xPTkdTKElSUV9NQVRSSVhfQklUUykpCj4gLQo+ICBzdHJ1Y3QgY3B1
bWFwIHsKPiAgICAgICAgIHVuc2lnbmVkIGludCAgICAgICAgICAgIGF2YWlsYWJsZTsKPiAgICAg
ICAgIHVuc2lnbmVkIGludCAgICAgICAgICAgIGFsbG9jYXRlZDsKPiBAQCAtMTcsOCArMTUsOCBA
QCBzdHJ1Y3QgY3B1bWFwIHsKPiAgICAgICAgIHVuc2lnbmVkIGludCAgICAgICAgICAgIG1hbmFn
ZWRfYWxsb2NhdGVkOwo+ICAgICAgICAgYm9vbCAgICAgICAgICAgICAgICAgICAgaW5pdGlhbGl6
ZWQ7Cj4gICAgICAgICBib29sICAgICAgICAgICAgICAgICAgICBvbmxpbmU7Cj4gLSAgICAgICB1
bnNpZ25lZCBsb25nICAgICAgICAgICBhbGxvY19tYXBbSVJRX01BVFJJWF9TSVpFXTsKPiAtICAg
ICAgIHVuc2lnbmVkIGxvbmcgICAgICAgICAgIG1hbmFnZWRfbWFwW0lSUV9NQVRSSVhfU0laRV07
Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nICAgICAgICAgICAqbWFuYWdlZF9tYXA7Cj4gKyAgICAg
ICB1bnNpZ25lZCBsb25nICAgICAgICAgICBhbGxvY19tYXBbXTsKPiAgfTsKPgo+ICBzdHJ1Y3Qg
aXJxX21hdHJpeCB7Cj4gQEAgLTMyLDggKzMwLDggQEAgc3RydWN0IGlycV9tYXRyaXggewo+ICAg
ICAgICAgdW5zaWduZWQgaW50ICAgICAgICAgICAgdG90YWxfYWxsb2NhdGVkOwo+ICAgICAgICAg
dW5zaWduZWQgaW50ICAgICAgICAgICAgb25saW5lX21hcHM7Cj4gICAgICAgICBzdHJ1Y3QgY3B1
bWFwIF9fcGVyY3B1ICAqbWFwczsKPiAtICAgICAgIHVuc2lnbmVkIGxvbmcgICAgICAgICAgIHNj
cmF0Y2hfbWFwW0lSUV9NQVRSSVhfU0laRV07Cj4gLSAgICAgICB1bnNpZ25lZCBsb25nICAgICAg
ICAgICBzeXN0ZW1fbWFwW0lSUV9NQVRSSVhfU0laRV07Cj4gKyAgICAgICB1bnNpZ25lZCBsb25n
ICAgICAgICAgICAqc3lzdGVtX21hcDsKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgICAgICAgICAg
IHNjcmF0Y2hfbWFwW107Cj4gIH07Cj4KPiAgI2RlZmluZSBDUkVBVEVfVFJBQ0VfUE9JTlRTCj4g
QEAgLTUwLDI0ICs0OCwzMiBAQCBfX2luaXQgc3RydWN0IGlycV9tYXRyaXggKmlycV9hbGxvY19t
YXRyaXgodW5zaWduZWQgaW50IG1hdHJpeF9iaXRzLAo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgYWxsb2Nfc3RhcnQsCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBhbGxvY19lbmQp
Cj4gIHsKPiArICAgICAgIHVuc2lnbmVkIGludCBjcHUsIG1hdHJpeF9zaXplID0gQklUU19UT19M
T05HUyhtYXRyaXhfYml0cyk7Cj4gICAgICAgICBzdHJ1Y3QgaXJxX21hdHJpeCAqbTsKPgo+IC0g
ICAgICAgaWYgKG1hdHJpeF9iaXRzID4gSVJRX01BVFJJWF9CSVRTKQo+IC0gICAgICAgICAgICAg
ICByZXR1cm4gTlVMTDsKPiAtCj4gLSAgICAgICBtID0ga3phbGxvYyhzaXplb2YoKm0pLCBHRlBf
S0VSTkVMKTsKPiArICAgICAgIG0gPSBremFsbG9jKHN0cnVjdF9zaXplKG0sIHNjcmF0Y2hfbWFw
LCBtYXRyaXhfc2l6ZSAqIDIpLCBHRlBfS0VSTkVMKTsKPiAgICAgICAgIGlmICghbSkKPiAgICAg
ICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4KPiArICAgICAgIG0tPnN5c3RlbV9tYXAgPSAmbS0+
c2NyYXRjaF9tYXBbbWF0cml4X3NpemVdOwo+ICsKPiAgICAgICAgIG0tPm1hdHJpeF9iaXRzID0g
bWF0cml4X2JpdHM7Cj4gICAgICAgICBtLT5hbGxvY19zdGFydCA9IGFsbG9jX3N0YXJ0Owo+ICAg
ICAgICAgbS0+YWxsb2NfZW5kID0gYWxsb2NfZW5kOwo+ICAgICAgICAgbS0+YWxsb2Nfc2l6ZSA9
IGFsbG9jX2VuZCAtIGFsbG9jX3N0YXJ0Owo+IC0gICAgICAgbS0+bWFwcyA9IGFsbG9jX3BlcmNw
dSgqbS0+bWFwcyk7Cj4gKyAgICAgICBtLT5tYXBzID0gX19hbGxvY19wZXJjcHUoc3RydWN0X3Np
emUobS0+bWFwcywgYWxsb2NfbWFwLCBtYXRyaXhfc2l6ZSAqIDIpLAo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIF9fYWxpZ25vZl9fKCptLT5tYXBzKSk7Cj4gICAgICAgICBpZiAo
IW0tPm1hcHMpIHsKPiAgICAgICAgICAgICAgICAga2ZyZWUobSk7Cj4gICAgICAgICAgICAgICAg
IHJldHVybiBOVUxMOwo+ICAgICAgICAgfQo+ICsKPiArICAgICAgIGZvcl9lYWNoX3Bvc3NpYmxl
X2NwdShjcHUpIHsKPiArICAgICAgICAgICAgICAgc3RydWN0IGNwdW1hcCAqY20gPSBwZXJfY3B1
X3B0cihtLT5tYXBzLCBjcHUpOwo+ICsKPiArICAgICAgICAgICAgICAgY20tPm1hbmFnZWRfbWFw
ID0gJmNtLT5hbGxvY19tYXBbbWF0cml4X3NpemVdOwo+ICsgICAgICAgfQo+ICsKPiAgICAgICAg
IHJldHVybiBtOwo+ICB9Cj4KPgo+IGJhc2UtY29tbWl0OiA2MTFkYTA3Yjg5ZmRkNTNmMTQwZDdi
MzMwMTNmMjU1YmYwZWQ4ZjM0Cj4gLS0KPiAyLjQwLjEKPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
