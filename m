Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D91FEB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 01:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cELX36AeYnXZe6bT4rSLgqL0NApF7gJVTBVkIJ0ILyk=; b=0fYLwwi5999NTi
	BhzsVzZKULe2fFWW2UgU/k3M08QO+OPq55E/NpWKyLgHase10q19uz8dPHFH4ScW4ibP92tOjB5Jv
	7Z0Dq6g3tNts0cWPrF+QZRVC39yPSmJlSzaQEgYIaW+uzaMcP0pF1TtxOtFcDrDXvu1dNffi7aoSJ
	S/D0vjp8BQ6Ih9Hkff9nr4rAn0mWs/p3EuzFXECLm/HjG5kuASm703ODMtqUORuuzrC3mLxOkYoQO
	I6ubEplTDtTrTvfO/2jr7CZX9GVHDV3so5M32NFTY7UYIFH29KvRT4Jj8+RuQuoSxpvQaeM3i46GI
	Jw62vgRpMJ1uR8X1c+7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDxB6-00BKed-2k;
	Tue, 27 Jun 2023 01:07:32 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDxB3-00BKdx-0z
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 01:07:30 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fa48b5dc2eso3553542e87.1
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 18:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1687828034; x=1690420034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lG+HgTOrNQ2TQbeu6pyVoWoMRZLWbg4+dG4LNvTEwbs=;
        b=dTD4luiVqw3mTkBjFtomt+1RCDI5sTbPHsK2bms8+l5NavZB56aEONeyHQA5c9TW6f
         ksE/52bH2jvV5Yof+UKkya4go84j9c7/YZ8/Yae+rexV3IsN+jDqQnpjc5bnmDux76O1
         9NJeKTH+sCxyV+Uct/JHBuPAb6HB/LPbzRYh6xBK15tqALBPIVsqqajHHDU+vqnHFUXJ
         xA9pOHRjL6CLRpGc/M0uDseJlLwU7nnSdZTN6CDI9lI+5E9Gfklndgi7BpFtHziECTy2
         8Nmo0XNqZlIAKO1Xv5Bs2ihK9IHH6GfWG9MOHuMo4H/w7Tu/e9x7tiwuE6wY+aqegTVo
         jZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687828034; x=1690420034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lG+HgTOrNQ2TQbeu6pyVoWoMRZLWbg4+dG4LNvTEwbs=;
        b=j7/nNLJtfucWsaVaOiNP00Ntw2eU3ysIYtuLnK6r1BbFwaQIJQ7bS9SaqOSF7b6esN
         JYgDWBgzwcx90/3KZs3/i8miwElg0MnexgOogTpuZhwxAtiWvPFs/Q6gKWuReBo8n+HV
         ATZtgKq80lAKYJoGBGP4z42xEp/8WK2JnzbRjY1Qyg8HjHT+5MkluBdAhgfWJjEttqqD
         YxjD0vlhmo6qpV7FjKWdbrR37wi4xTB/rfRp6tbZqU+4baZeP/jpKEPzlkclbhfI6yIt
         8d7Y6JTQnNWwKT00vOsRxM9SYDu+yKXcSkVuzISPyUMFhu3uxAreVULB0Jghos1tfc4s
         iUCg==
X-Gm-Message-State: AC+VfDyOCD62D9+8QudoRYJd9W97kd2Leaxw1JVIx7NTi3g4EWk98qH+
	9aOpgwok4ZDAE/epz8ujIVrc7F36vWdyys/cmX/8FA==
X-Google-Smtp-Source: ACHHUZ4eyI+Uqd8UEgTnIgWlHNidZ9OuhDQNcN9az3YItKUHfy65v3sgA1BWl2E1iQbC6kpRRTtivT+VKw4JtZvKvHw=
X-Received: by 2002:a05:6512:239d:b0:4fa:d194:36be with SMTP id
 c29-20020a056512239d00b004fad19436bemr3817330lfv.65.1687828033829; Mon, 26
 Jun 2023 18:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <871qi4334n.fsf@all.your.base.are.belong.to.us>
 <20230622154738.6403-1-andy.chiu@sifive.com> <87edm3jvub.fsf@all.your.base.are.belong.to.us>
 <CABgGipWOaAmXYtNQv0reAwVFQD42wGsZoX2Ba8NYed3xLL3Z4g@mail.gmail.com> <878rc6nsl8.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <878rc6nsl8.fsf@all.your.base.are.belong.to.us>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue, 27 Jun 2023 09:07:02 +0800
Message-ID: <CABgGipVeMLiCN_md47MmE28b4HEHJvY8fa2qpcoe2CFQT5vEcg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Clobber V registers on syscalls
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_180729_425011_C36BD68D 
X-CRM114-Status: GOOD (  23.35  )
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

T24gTW9uLCBKdW4gMjYsIDIwMjMgYXQgMTE6MzbigK9QTSBCasO2cm4gVMO2cGVsIDxiam9ybkBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNpZml2ZS5jb20+IHdy
aXRlczoKPgo+ID4+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgYi9h
cmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gPj4gPiBpbmRleCAyNGQzMDljNmFiOGQuLmUzNmI2
OWM5YjA3ZiAxMDA2NDQKPiA+PiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiA+
PiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiA+PiA+IEBAIC0yOTEsMTAgKzI5
MSwxNCBAQCBhc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBf
ZWNhbGxfdShzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+PiA+ICB7Cj4gPj4gPiAgICAgICBpZiAo
dXNlcl9tb2RlKHJlZ3MpKSB7Cj4gPj4gPiAgICAgICAgICAgICAgIHVsb25nIHN5c2NhbGwgPSBy
ZWdzLT5hNzsKPiA+PiA+ICsgICAgICAgICAgICAgYm9vbCB2X2lzX29uOwo+ID4+ID4KPiA+PiA+
ICAgICAgICAgICAgICAgcmVncy0+ZXBjICs9IDQ7Cj4gPj4gPiAgICAgICAgICAgICAgIHJlZ3Mt
Pm9yaWdfYTAgPSByZWdzLT5hMDsKPiA+PiA+Cj4gPj4gPiArICAgICAgICAgICAgIHZfaXNfb24g
PSByaXNjdl92X3ZzdGF0ZV9xdWVyeShyZWdzKTsKPiA+PiA+ICsgICAgICAgICAgICAgcmlzY3Zf
dl92c3RhdGVfb2ZmKHJlZ3MpOwo+ID4+ID4gKwo+ID4+ID4gICAgICAgICAgICAgICBzeXNjYWxs
ID0gc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZShyZWdzLCBzeXNjYWxsKTsKPiA+PiA+Cj4g
Pj4gPiAgICAgICAgICAgICAgIGlmIChzeXNjYWxsIDwgTlJfc3lzY2FsbHMpCj4gPj4gPiBAQCAt
MzAzLDYgKzMwNywxMCBAQCBhc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lk
IGRvX3RyYXBfZWNhbGxfdShzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+PiA+ICAgICAgICAgICAg
ICAgICAgICAgICByZWdzLT5hMCA9IC1FTk9TWVM7Cj4gPj4gPgo+ID4+ID4gICAgICAgICAgICAg
ICBzeXNjYWxsX2V4aXRfdG9fdXNlcl9tb2RlKHJlZ3MpOwo+ID4+ID4gKyAgICAgICAgICAgICBp
ZiAodl9pc19vbikgewo+ID4+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJpc2N2X3ZfdnN0YXRl
X2Rpc2NhcmQocmVncyk7Cj4gPj4gPiArICAgICAgICAgICAgICAgICAgICAgcmlzY3Zfdl92c3Rh
dGVfZGlydHkocmVncyk7Cj4gPj4KPiA+PiBBaCEgTmVhdCEgV2h5IGRpcnR5LCBpbnN0ZWFkIG9m
IGp1c3Qga2VlcGluZyB0aGUgInNldCB0byBJbml0aWFsIiBmcm9tCj4gPj4gbXkgZGlmZj8KPiA+
Cj4gPiBCb3RoIHdvcmssIEkgdGhpbmsuIEJ1dCBoZXJlIGlmIHdlIHNldCBpdCB0byAib24iIGFm
dGVyIGRpc2NhcmRpbmcKPiA+IFYtcmVncywgdGhlbiB0YWtlIGEgY29udGV4dCBzd2l0Y2ggYmVm
b3JlIGV4ZWN1dGluZyBhbnkgViBpbnN0cnVjdGlvbnMKPiA+IGluIHVzZXIgc3BhY2UgKGRvZXMg
bm90IGNoYW5nZSBmdXR1cmUgdnN0YXRlIHRvIGRpcnR5KS4gVGhlbiB3ZSB3aWxsCj4gPiBsZWFr
IFYtcmVncyBwcmV2aW91c2x5IHNldCBpbnRvIGl0cyB2c3RhdGUuZGF0YXAgYWZ0ZXIgc3dpdGNo
aW5nIGJhY2ssCj4gPiBiZWNhdXNlIHdlIG9ubHkgc2F2ZSBWIGNvbnRleHQgaWYgdnN0YXRlIGlz
IGRpcnR5LiBTbywgSSB0aGluayBzZXR0aW5nCj4gPiB2c3RhdGUgdG8gZGlydHkgaXMgYSBzYWZl
ciBvcHRpb24uCj4KPiBBaCwgeWVzLCBnb29kIHBvaW50LiBBbiBhbHRlcm5hdGl2ZSB2YXJpYW50
IGlzIHRoaXM6Cj4KPiAtLS0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92
ZWN0b3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmgKPiBpbmRleCAwNGMwYjA3
YmY2Y2QuLjMyYjYxMTVhNTRhNSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3ZlY3Rvci5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaAo+IEBAIC0x
MzksMTUgKzEzOSw1MSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgcmlzY3Zfdl92c3RhdGVfc2F2ZShz
dHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2ssCj4gICAgICAgICB9Cj4gIH0KPgo+ICtzdGF0aWMgaW5s
aW5lIHZvaWQgX19yaXNjdl92X3ZzdGF0ZV9kaXNjYXJkKHZvaWQpCj4gK3sKPiArICAgICAgIHVu
c2lnbmVkIGxvbmcgdmwsIHZ0eXBlX2ludmFsID0gMVVMIDw8IChCSVRTX1BFUl9MT05HIC0gMSk7
Cj4gKwo+ICsgICAgICAgcmlzY3Zfdl9lbmFibGUoKTsKPiArICAgICAgIGFzbSB2b2xhdGlsZSAo
Cj4gKyAgICAgICAgICAgICAgICIub3B0aW9uIHB1c2hcblx0Igo+ICsgICAgICAgICAgICAgICAi
Lm9wdGlvbiBhcmNoLCArdlxuXHQiCj4gKyAgICAgICAgICAgICAgICJ2c2V0dmxpICAgICAgICAl
MCwgeDAsIGU4LCBtOCwgdGEsIG1hXG5cdCIKPiArICAgICAgICAgICAgICAgInZtdi52LmkgICAg
ICAgIHYwLCAwXG5cdCIKPiArICAgICAgICAgICAgICAgInZtdi52LmkgICAgICAgIHY4LCAwXG5c
dCIKPiArICAgICAgICAgICAgICAgInZtdi52LmkgICAgICAgIHYxNiwgMFxuXHQiCj4gKyAgICAg
ICAgICAgICAgICJ2bXYudi5pICAgICAgICB2MjQsIDBcblx0Igo+ICsgICAgICAgICAgICAgICAi
dnNldHZsICAgICAgICAgJTAsIHgwLCAlMVxuXHQiCj4gKyAgICAgICAgICAgICAgICIub3B0aW9u
IHBvcFxuXHQiCj4gKyAgICAgICAgICAgICAgIDogIj0mciIgKHZsKSA6ICJyIiAodnR5cGVfaW52
YWwpIDogIm1lbW9yeSIpOwo+ICsgICAgICAgcmlzY3Zfdl9kaXNhYmxlKCk7Cj4gK30KPiArCj4g
K3N0YXRpYyBpbmxpbmUgdm9pZCByaXNjdl92X3ZzdGF0ZV9kaXNjYXJkKHN0cnVjdCBwdF9yZWdz
ICpyZWdzKQo+ICt7Cj4gKyAgICAgICBpZiAoIXJpc2N2X3ZfdnN0YXRlX3F1ZXJ5KHJlZ3MpKQo+
ICsgICAgICAgICAgICAgICByZXR1cm47Cj4gKwo+ICsgICAgICAgX19yaXNjdl92X3ZzdGF0ZV9k
aXNjYXJkKCk7Cj4gKyAgICAgICByaXNjdl92X3ZzdGF0ZV9vbihyZWdzKTsKPiArfQo+ICsKPiAg
c3RhdGljIGlubGluZSB2b2lkIHJpc2N2X3ZfdnN0YXRlX3Jlc3RvcmUoc3RydWN0IHRhc2tfc3Ry
dWN0ICp0YXNrLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0
cnVjdCBwdF9yZWdzICpyZWdzKQo+ICB7Cj4gLSAgICAgICBpZiAoKHJlZ3MtPnN0YXR1cyAmIFNS
X1ZTKSAhPSBTUl9WU19PRkYpIHsKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgc3RhdHVzID0gcmVn
cy0+c3RhdHVzICYgU1JfVlM7Cj4gKwo+ICsgICAgICAgV0FSTl9PTihzdGF0dXMgPT0gU1JfVlNf
RElSVFkpOwo+ICsKPiArICAgICAgIGlmIChzdGF0dXMgPT0gU1JfVlNfQ0xFQU4pIHsKPiAgICAg
ICAgICAgICAgICAgc3RydWN0IF9fcmlzY3Zfdl9leHRfc3RhdGUgKnZzdGF0ZSA9ICZ0YXNrLT50
aHJlYWQudnN0YXRlOwo+Cj4gICAgICAgICAgICAgICAgIF9fcmlzY3Zfdl92c3RhdGVfcmVzdG9y
ZSh2c3RhdGUsIHZzdGF0ZS0+ZGF0YXApOwo+ICAgICAgICAgICAgICAgICBfX3Jpc2N2X3ZfdnN0
YXRlX2NsZWFuKHJlZ3MpOwo+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4gICAgICAgICB9Cj4g
Kwo+ICsgICAgICAgaWYgKHN0YXR1cyA9PSBTUl9WU19JTklUSUFMKQo+ICsgICAgICAgICAgICAg
ICBfX3Jpc2N2X3ZfdnN0YXRlX2Rpc2NhcmQoKTsKPiAgfQo+Cj4gIHN0YXRpYyBpbmxpbmUgdm9p
ZCBfX3N3aXRjaF90b192ZWN0b3Ioc3RydWN0IHRhc2tfc3RydWN0ICpwcmV2LAo+IEBAIC0xNzgs
NiArMjE0LDcgQEAgc3RhdGljIGlubGluZSBib29sIHJpc2N2X3ZfdnN0YXRlX2N0cmxfdXNlcl9h
bGxvd2VkKHZvaWQpIHsgcmV0dXJuIGZhbHNlOyB9Cj4gICNkZWZpbmUgX19zd2l0Y2hfdG9fdmVj
dG9yKF9fcHJldiwgX19uZXh0KSAgICAgZG8ge30gd2hpbGUgKDApCj4gICNkZWZpbmUgcmlzY3Zf
dl92c3RhdGVfb2ZmKHJlZ3MpICAgICAgICAgICAgICAgZG8ge30gd2hpbGUgKDApCj4gICNkZWZp
bmUgcmlzY3Zfdl92c3RhdGVfb24ocmVncykgICAgICAgICAgICAgICAgICAgICAgICBkbyB7fSB3
aGlsZSAoMCkKPiArI2RlZmluZSByaXNjdl92X3ZzdGF0ZV9kaXNjYXJkKHJlZ3MpICAgICAgICAg
ICBkbyB7fSB3aGlsZSAoMCkKPgo+ICAjZW5kaWYgLyogQ09ORklHX1JJU0NWX0lTQV9WICovCj4K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL3RyYXBzLmMKPiBpbmRleCA1MTU4OTYxZWE5NzcuLjVmZjYzYTc4NGE2ZCAxMDA2NDQKPiAt
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwv
dHJhcHMuYwo+IEBAIC0yOTYsNiArMjk2LDggQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFw
X3NlY3Rpb24gdm9pZCBkb190cmFwX2VjYWxsX3Uoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gICAg
ICAgICAgICAgICAgIHJlZ3MtPmVwYyArPSA0Owo+ICAgICAgICAgICAgICAgICByZWdzLT5vcmln
X2EwID0gcmVncy0+YTA7Cj4KPiArICAgICAgICAgICAgICAgcmlzY3Zfdl92c3RhdGVfZGlzY2Fy
ZChyZWdzKTsKPiArCj4gICAgICAgICAgICAgICAgIHN5c2NhbGwgPSBzeXNjYWxsX2VudGVyX2Zy
b21fdXNlcl9tb2RlKHJlZ3MsIHN5c2NhbGwpOwo+Cj4gICAgICAgICAgICAgICAgIGlmIChzeXNj
YWxsIDwgTlJfc3lzY2FsbHMpCj4KPiAtLS0KPgo+Cj4gSGVyZSwgd2Ugc2ltcGx5IGRpc2NhcmQg
dGhlIHJlZ3MgaWYgdGhlIHN0YXRlIGlzIEluaXRpYWwuIFRob3VnaHRzPwo+Cj4KPiBCasO2cm4K
ClllcywgaXQgbWFrZXMgc2Vuc2UgdG8gbWUgdG8gaGFuZGxlIHRoZSBpbml0aWFsIHN0YXRlIGlu
IHZzdGF0ZV9yZXN0b3JlLgoKVGhhbmtzLApBbmR5CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
