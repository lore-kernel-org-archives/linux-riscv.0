Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0794CEB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 15:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P3j85mBAuITfEDBrKOWdGU+xqp++YDy0twFyshDndxc=; b=kI4sflxZoyMfq6
	X3/k4IHP0yKIkW715RgJ0yySX33DKJDb1lu2/xI1X3w9cGAfkaML+zOXGuPM0ELtmCADBQ75CyNEu
	RU8Afbi8+bB3wjk8H/pIQaOWJ/wLIzb0Kts5BFjvhdr0/fqmzSAYn69nyzcs1anCJNzTx7qiiM9JG
	HcEYENkHhTyLGalqHL7IA82dzAqnYp0vXtqycYzIoTFv2YrUBhOgbCw9dByl4hkETkSICc4djR9z3
	ZOUWdtp2IV7PQvU126i3NjpKerB6cCXa6Jty/KLHgTCmJysbecNLee+9WDBlW1PyoUm0XU6YhjC0m
	E9uNpY0Cl/E8+4Oij19w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEAPb-00DUFG-1a;
	Tue, 27 Jun 2023 15:15:23 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEAPY-00DUDg-19
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 15:15:22 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4fb77f21c63so3080299e87.2
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jun 2023 08:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1687878916; x=1690470916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EQuyVr7JHKg0+/1h2GBy4g/huTlSZlh5DOVx9XkYto=;
        b=OrdMtENPoBnvA/SviTV3GZG1R36+mKwF7oUyYSEcFmv3zXtOCejJJNQMHv1ET4B8m7
         SyLVEUmHgcEPSBtBdz6QYXaG7+KSwtRczH/gFJbcKHnY399QpM12eBP6xy5HNDnoTt4q
         5gVk4TP8iRGkHerJuGCJx1X5y8iNBv2PdDVHY35bZ/xodU7+xKpU8naho1bhOK8WSOQ2
         /UJWQBxClvNnMepzvZv/hbU18ZWdBCI7iYs3gtJhrOan73aG09Vedxf+B/lRa1sctg9R
         GzVTI+TrZwdnOaJ5bbJpN9mD5OlLBoS8Qd1qA8lzkihQNEhlfFeFGPygef0UUZAJPDiv
         NTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687878916; x=1690470916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4EQuyVr7JHKg0+/1h2GBy4g/huTlSZlh5DOVx9XkYto=;
        b=Kiln2B+2WFZwyof7DjTDNZnQ/wmv6qNkmHQVoNIh7ZmoJ+G4FOs1W4jQu34dr4nHO9
         4GcQOqHQ/dBq0EaAleQsBoZTElER01qJ1UkpHRhKHLnMpLuQlSx0nfbqVZTj5mZnfCbm
         e7ykR1EsSUBwCnFz1oeqRflKfzJBCF4f9H+BcZFYorSkXRkVVcMOkD+5m27mgU6KA3L0
         +5K9mw8397UMbC1KPfjfPNCxJeBanp93Z+jmTtb/BGOlADNQa17Idqzsi4maJzzI2BFd
         pUyA0dY4vZqhMGMufttYTOiY227AU01oUwvRjsoXF36blZu+aL+BQd/4SJCox79rMZIp
         ns0A==
X-Gm-Message-State: AC+VfDxIVvP+Gl6ktNUr7s12N62fX2l4bn0ESs8TjFbD/4G10fxYKv2y
	szAbJXSIB6TSbX7G7ADrGu7WgeqWMLlwpjFZUiDXyQ==
X-Google-Smtp-Source: ACHHUZ52fzXrBv0CBQuudYgePTbv9h72sFJOP/S+PLzzwTofgYHEqU+9ntIIx0uloa9FUXk7t4qszeCLK/7Haje1jJc=
X-Received: by 2002:a05:6512:3ba8:b0:4fb:822d:83ab with SMTP id
 g40-20020a0565123ba800b004fb822d83abmr2261151lfv.20.1687878915827; Tue, 27
 Jun 2023 08:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230626165736.65927-1-bjorn@kernel.org>
In-Reply-To: <20230626165736.65927-1-bjorn@kernel.org>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue, 27 Jun 2023 23:15:01 +0800
Message-ID: <CABgGipWUO6bXQQzMCXxpkv4MYTpH3MUtPHUVe-=VhsZk3HPNMg@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: Discard vector state on syscalls
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-kernel@vger.kernel.org, linux@rivosinc.com, 
	Palmer Dabbelt <palmer@rivosinc.com>, =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi@remlab.net>, 
	Darius Rad <darius@bluespec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_081520_438470_F9CA09E9 
X-CRM114-Status: GOOD (  26.36  )
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

T24gVHVlLCBKdW4gMjcsIDIwMjMgYXQgMTI6NTfigK9BTSBCasO2cm4gVMO2cGVsIDxiam9ybkBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IEZyb206IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5j
LmNvbT4KPgo+IFRoZSBSSVNDLVYgdmVjdG9yIHNwZWNpZmljYXRpb24gc3RhdGVzOgo+ICAgRXhl
Y3V0aW5nIGEgc3lzdGVtIGNhbGwgY2F1c2VzIGFsbCBjYWxsZXItc2F2ZWQgdmVjdG9yIHJlZ2lz
dGVycwo+ICAgKHYwLXYzMSwgdmwsIHZ0eXBlKSBhbmQgdnN0YXJ0IHRvIGJlY29tZSB1bnNwZWNp
ZmllZC4KPgo+IFRoZSB2ZWN0b3IgcmVnaXN0ZXJzIGFyZSBzZXQgdG8gYWxsIDFzLCB2aWxsIGlz
IHNldCAoaW52YWxpZCksIGFuZCB0aGUKPiB2ZWN0b3Igc3RhdHVzIGlzIHNldCB0byBJbml0aWFs
Lgo+Cj4gVGhhdCB3YXkgd2UgY2FuIHByZXZlbnQgdXNlcnNwYWNlIGZyb20gYWNjaWRlbnRhbGx5
IHJlbHlpbmcgb24gdGhlCj4gc3RhdGVkIHNhdmUuCj4KPiBSw6ltaSBwb2ludGVkIG91dCBbMV0g
dGhhdCB3cml0aW5nIHRvIHRoZSByZWdpc3RlcnMgbWlnaHQgYmUKPiBzdXBlcmZsdW91cywgYW5k
IHNldHRpbmcgdmlsbCBpcyBzdWZmaWNpZW50Lgo+Cj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtcmlzY3YvMTI3ODQzMjYuOVVQUEszTUFlQkBiYXNpbGUucmVtbGFiLm5ldC8g
IyBbMV0KPiBTdWdnZXN0ZWQtYnk6IERhcml1cyBSYWQgPGRhcml1c0BibHVlc3BlYy5jb20+Cj4g
U3VnZ2VzdGVkLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KPiBTdWdn
ZXN0ZWQtYnk6IFLDqW1pIERlbmlzLUNvdXJtb250IDxyZW1pQHJlbWxhYi5uZXQ+Cj4gU2lnbmVk
LW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+IC0tLQo+IHYxLT52
MjoKPiAgIFByb3BlciByZWdpc3RlciByZXN0b3JlIGZvciBpbml0aWFsIHN0YXRlIChBbmR5KQo+
ICAgU2V0IHJlZ2lzdGVycyB0byAxcywgYW5kIG5vdCAwcyAoRGFyaXVzKQo+IC0tLQo+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oIHwgNDIgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgICAgICAgfCAgMiArKwo+ICAy
IGZpbGVzIGNoYW5nZWQsIDQxIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaCBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vdmVjdG9yLmgKPiBpbmRleCAwNGMwYjA3YmY2Y2QuLjkzZDcwMmQ5OTg4YyAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCj4gKysrIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaAo+IEBAIC0xMzksMTQgKzEzOSw0OSBAQCBzdGF0aWMg
aW5saW5lIHZvaWQgcmlzY3Zfdl92c3RhdGVfc2F2ZShzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2ss
Cj4gICAgICAgICB9Cj4gIH0KPgo+ICtzdGF0aWMgaW5saW5lIHZvaWQgX19yaXNjdl92X3ZzdGF0
ZV9kaXNjYXJkKHZvaWQpCj4gK3sKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgdmwsIHZ0eXBlX2lu
dmFsID0gMVVMIDw8IChCSVRTX1BFUl9MT05HIC0gMSk7Cj4gKwo+ICsgICAgICAgcmlzY3Zfdl9l
bmFibGUoKTsKPiArICAgICAgIGFzbSB2b2xhdGlsZSAoCj4gKyAgICAgICAgICAgICAgICIub3B0
aW9uIHB1c2hcblx0Igo+ICsgICAgICAgICAgICAgICAiLm9wdGlvbiBhcmNoLCArdlxuXHQiCj4g
KyAgICAgICAgICAgICAgICJ2c2V0dmxpICAgICAgICAlMCwgeDAsIGU4LCBtOCwgdGEsIG1hXG5c
dCIKPiArICAgICAgICAgICAgICAgInZtdi52LmkgICAgICAgIHYwLCAtMVxuXHQiCj4gKyAgICAg
ICAgICAgICAgICJ2bXYudi5pICAgICAgICB2OCwgLTFcblx0Igo+ICsgICAgICAgICAgICAgICAi
dm12LnYuaSAgICAgICAgdjE2LCAtMVxuXHQiCj4gKyAgICAgICAgICAgICAgICJ2bXYudi5pICAg
ICAgICB2MjQsIC0xXG5cdCIKPiArICAgICAgICAgICAgICAgInZzZXR2bCAgICAgICAgICUwLCB4
MCwgJTFcblx0Igo+ICsgICAgICAgICAgICAgICAiLm9wdGlvbiBwb3Bcblx0Igo+ICsgICAgICAg
ICAgICAgICA6ICI9JnIiICh2bCkgOiAiciIgKHZ0eXBlX2ludmFsKSA6ICJtZW1vcnkiKTsKPiAr
ICAgICAgIHJpc2N2X3ZfZGlzYWJsZSgpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIHZvaWQg
cmlzY3Zfdl92c3RhdGVfZGlzY2FyZChzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiArewo+ICsgICAg
ICAgaWYgKCFyaXNjdl92X3ZzdGF0ZV9xdWVyeShyZWdzKSkKPiArICAgICAgICAgICAgICAgcmV0
dXJuOwo+ICsKPiArICAgICAgIF9fcmlzY3Zfdl92c3RhdGVfZGlzY2FyZCgpOwo+ICsgICAgICAg
cmlzY3Zfdl92c3RhdGVfb24ocmVncyk7Cj4gK30KPiArCj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBy
aXNjdl92X3ZzdGF0ZV9yZXN0b3JlKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcHRfcmVncyAqcmVncykK
PiAgewo+IC0gICAgICAgaWYgKChyZWdzLT5zdGF0dXMgJiBTUl9WUykgIT0gU1JfVlNfT0ZGKSB7
Cj4gLSAgICAgICAgICAgICAgIHN0cnVjdCBfX3Jpc2N2X3ZfZXh0X3N0YXRlICp2c3RhdGUgPSAm
dGFzay0+dGhyZWFkLnZzdGF0ZTsKPiAtCj4gKyAgICAgICBzdHJ1Y3QgX19yaXNjdl92X2V4dF9z
dGF0ZSAqdnN0YXRlID0gJnRhc2stPnRocmVhZC52c3RhdGU7Cj4gKyAgICAgICB1bnNpZ25lZCBs
b25nIHN0YXR1cyA9IHJlZ3MtPnN0YXR1cyAmIFNSX1ZTOwo+ICsKPiArICAgICAgIHN3aXRjaCAo
c3RhdHVzKSB7Cj4gKyAgICAgICBjYXNlIFNSX1ZTX0lOSVRJQUw6Cj4gKyAgICAgICAgICAgICAg
IF9fcmlzY3Zfdl92c3RhdGVfZGlzY2FyZCgpOwo+ICsgICAgICAgICAgICAgICBicmVhazsKPiAr
ICAgICAgIGNhc2UgU1JfVlNfQ0xFQU46Cj4gKyAgICAgICBjYXNlIFNSX1ZTX0RJUlRZOgo+ICAg
ICAgICAgICAgICAgICBfX3Jpc2N2X3ZfdnN0YXRlX3Jlc3RvcmUodnN0YXRlLCB2c3RhdGUtPmRh
dGFwKTsKPiAgICAgICAgICAgICAgICAgX19yaXNjdl92X3ZzdGF0ZV9jbGVhbihyZWdzKTsKPiAr
ICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICB9Cj4gIH0KPgo+IEBAIC0xNzgsNiArMjEz
LDcgQEAgc3RhdGljIGlubGluZSBib29sIHJpc2N2X3ZfdnN0YXRlX2N0cmxfdXNlcl9hbGxvd2Vk
KHZvaWQpIHsgcmV0dXJuIGZhbHNlOyB9Cj4gICNkZWZpbmUgX19zd2l0Y2hfdG9fdmVjdG9yKF9f
cHJldiwgX19uZXh0KSAgICAgZG8ge30gd2hpbGUgKDApCj4gICNkZWZpbmUgcmlzY3Zfdl92c3Rh
dGVfb2ZmKHJlZ3MpICAgICAgICAgICAgICAgZG8ge30gd2hpbGUgKDApCj4gICNkZWZpbmUgcmlz
Y3Zfdl92c3RhdGVfb24ocmVncykgICAgICAgICAgICAgICAgICAgICAgICBkbyB7fSB3aGlsZSAo
MCkKPiArI2RlZmluZSByaXNjdl92X3ZzdGF0ZV9kaXNjYXJkKHJlZ3MpICAgICAgICAgICBkbyB7
fSB3aGlsZSAoMCkKPgo+ICAjZW5kaWYgLyogQ09ORklHX1JJU0NWX0lTQV9WICovCj4KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Ry
YXBzLmMKPiBpbmRleCA1MTU4OTYxZWE5NzcuLjVmZjYzYTc4NGE2ZCAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMu
Ywo+IEBAIC0yOTYsNiArMjk2LDggQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rp
b24gdm9pZCBkb190cmFwX2VjYWxsX3Uoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gICAgICAgICAg
ICAgICAgIHJlZ3MtPmVwYyArPSA0Owo+ICAgICAgICAgICAgICAgICByZWdzLT5vcmlnX2EwID0g
cmVncy0+YTA7Cj4KPiArICAgICAgICAgICAgICAgcmlzY3Zfdl92c3RhdGVfZGlzY2FyZChyZWdz
KTsKPiArCj4gICAgICAgICAgICAgICAgIHN5c2NhbGwgPSBzeXNjYWxsX2VudGVyX2Zyb21fdXNl
cl9tb2RlKHJlZ3MsIHN5c2NhbGwpOwo+Cj4gICAgICAgICAgICAgICAgIGlmIChzeXNjYWxsIDwg
TlJfc3lzY2FsbHMpCj4KPiBiYXNlLWNvbW1pdDogNDg4ODMzY2NkY2FjMTE4ZGExNjcwMWY0ZWUw
NjczYjIwYmE0N2ZlMwo+IC0tCj4gMi4zOS4yCj4KCkhpLCB0aGUgYWJvdmUgcGFydCBsb29rcyBn
b29kIHRvIG1lLiBJbiB0aGUgY29udGV4dCBvZiBrZXJuZWwtbW9kZQp2ZWN0b3IsIGl0IHdvdWxk
IGFsc28gYmUgZ29vZCB0byBqdXN0IGRpc2NhcmQgVi1jb250ZXh0IGF0IHRoZSBzeXNjYWxsCmVu
dHJ5LiBTbyB0aGUga2VybmVsIGNhbiBmcmVlbHkgdXNlIFZlY3RvciBpZiBuZWVkZWQuIEkgd2ls
bCByZWJhc2UgbXkKd29yayBvbiB0b3Agb2YgeW91cnMuCgpBbm90aGVyIHBhcnQgdGhhdCBqdXN0
IGNhbWUgaW50byBteSBtaW5kIGlzIHRoZSBvbmUgZm9yIHB0cmFjZS4gRG8gd2UKbmVlZCB0byBk
aXNhbGxvdywgb3IgaW1tZWRpYXRlbHkgcmV0dXJuIGFsbCAtMSBpZiB0aGUgdHJhY2VlIHByb2Nl
c3MKaXMgaW4gdGhlIHN5c2NhbGwgcGF0aD8gSXQgc2VlbXMgdGhhdCB3ZSBhcmUgbGlrZWx5IHRv
IGdldCBzdGFsZQp2YWx1ZXMgb24gZGF0YXAgaWYgYSB0cmFjZWUgaXMgYmVpbmcgdHJhY2VkIGR1
cmluZyBhIHN5c2NhbGwuCgpUaGFua3MsCkFuZHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
