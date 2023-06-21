Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA94EB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 14:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RPWsoJNOTi8MAFQCJ9QdiDTXJj7NblhVMFAk0sthbXg=; b=urM9onA6CutvoV
	R2nZGwM+JuSJM8ewB9acoDO8ViC+cr6UkoIgx0yzmpVdtKgrDpipNzXjZg8G3zBzyd+V07yTsodK/
	SAHzDAXn9oVYDqawH30qVr46wYIXASpDVw782wYJ1JlFuO7gAlUds/P0ltZDWubyNtyOiHeGpLDny
	o2tQKUU2erVlsj/0mdk5KJWMIHvyTd3qej+1kLd2YUlXiQo2UasXDBIr6SdFwujZgRCb3op626UKe
	N49htKPloRDAsBA5DEzdkWUceeOiBeE2hsW02o9wtVPxUt+51elFnC44BXst4gHIOzXVUvFMI6wSS
	3FiaXTSovvcVVwJgc0CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBzA8-00EraB-0F;
	Wed, 21 Jun 2023 14:50:24 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBzA4-00ErVe-1n
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 14:50:22 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f8735ac3e3so4898501e87.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jun 2023 07:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1687359018; x=1689951018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKK4Yoy7fg7W9c8Ix4HfzpMFMpIDK3hvS5fSUAvnw14=;
        b=Q/ibzcrqz59LcwcxaGeE6zfRVfK7QWVaZNIJh/Qy7f20RFKV4nsVaX6hRgDmj/ZGDD
         fV9ICRlNQQPhSCZ22mrYmNOGPvmfaURnjLNGXoYxTnQZNd59y/sTJFkKkmhWKX1jEYLe
         xdJ/JsmR/LWXoz4E5+i+bflfaBVR+baLRTJDpo6XaCm0Q9Ej5X9ZleVv+ROdFcz2yinL
         nFle4yf4k9jIJns0QziGpBFsVBreaXDub/1eVtwLHhJGCmhhZEt/ZAQ/hpF+sREZEzsH
         myqROlg4IUG3e2nY5vOypeiGELaZchObEHO8ha/IUEmGK2rNy3DSZ/OGvdKef1gf0i2M
         fOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687359018; x=1689951018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EKK4Yoy7fg7W9c8Ix4HfzpMFMpIDK3hvS5fSUAvnw14=;
        b=G9ZsO1iBMo+cIcA3dqQasoQ6z09jBkIhbGdCaDh14i1RHwWvU8LIjOKn0jIaDCFqGV
         eVycO3vOicsEckX1PogSlvxaPEjuSaa3uu5wYSQHSJ/xne0rman8d2zzTUEWYPrSvLJ3
         ho1TeT6ziQBVhvz3d6de5aCma6vG2izQzlawGB3enoBvjfFSt9hObiRl3Y4/TLgTkQZj
         FuLi3pBldWhDF+QJRsz/vVTzJOMPMznwbhrIYrpkItNE3v/8Tl/d/IfVqOtAeOHfqBgV
         Zo+WDOZPbyJdXASNg40ggh6ZBfzD1j1TcSMaubkP8koejUdehh43CwSV1461EkE0tWdS
         RvTQ==
X-Gm-Message-State: AC+VfDzNLNmMiJi9AUcXSQ1SsgAs3fkJ7cn2OkfDJj0BoUz55kTlw04T
	fuQBxHPaJUibMRajDae0H7JNaj1lPeWd1dfiYn1e4Q==
X-Google-Smtp-Source: ACHHUZ5U2kkwk4dCba69aZo+gzKFXTXGSKBMLF3xpz6+3P7SyXKa0m9wfs/0ov9Zz0XFP9ARAn5zXKkRzSEMVOfCuRc=
X-Received: by 2002:a19:6558:0:b0:4f8:6abe:5249 with SMTP id
 c24-20020a196558000000b004f86abe5249mr6717284lfj.3.1687359018034; Wed, 21 Jun
 2023 07:50:18 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-6bb8dac2-33c3-410f-82ce-36554e497e9c@palmer-ri-x1c9> <878rccoprt.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <878rccoprt.fsf@all.your.base.are.belong.to.us>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Wed, 21 Jun 2023 22:50:06 +0800
Message-ID: <CABgGipUBObbwLx_sB1gyE4np=s7yu==CyWXzomVoZ7x+WTkU0g@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Clobber V registers on syscalls
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_075020_657182_FF9A7DDF 
X-CRM114-Status: GOOD (  38.89  )
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

T24gV2VkLCBKdW4gMjEsIDIwMjMgYXQgMTA6MjbigK9QTSBCasO2cm4gVMO2cGVsIDxiam9ybkBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29t
PiB3cml0ZXM6Cj4KPiA+IE9uIE1vbiwgMTkgSnVuIDIwMjMgMTI6MDE6MjAgUERUICgtMDcwMCks
IGJqb3JuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPj4gUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZv
c2luYy5jb20+IHdyaXRlczoKPiA+Pgo+ID4+IFsuLi5dCj4gPj4KPiA+Pj4+PiArICAgICAgICAg
cmlzY3Zfdl92c3RhdGVfb2ZmKHJlZ3MpOwo+ID4+Pj4+ICsKPiA+Pj4+Cj4gPj4+PiBOb3Qgb2Zm
LCByaWdodD8gSXNuJ3QgaXQgX19yaXNjdl92X3ZzdGF0ZV9jbGVhbigpIHRoYXQgeW91J2QgbGlr
ZSB0bwo+ID4+Pj4gY2FsbD8gU29tZXRoaW5nIGxpa2U6Cj4gPj4+Pgo+ID4+Pj4gc3RhdGljIHZv
aWQgdnN0YXRlX2Rpc2NhcmQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPj4+PiB7Cj4gPj4+PiAg
ICAgICAgaWYgKChyZWdzLT5zdGF0dXMgJiBTUl9WUykgPT0gU1JfVlNfRElSVFkpCj4gPj4+PiAg
ICAgICAgICAgICAgICBfX3Jpc2N2X3ZfdnN0YXRlX2NsZWFuKHJlZ3MpOwo+ID4+Pj4gfQo+ID4+
Pj4KPiA+Pj4+IENvbXBsZW1lbnRlZCBieSBhICFWIGNvbmZpZyB2YXJpYW50Lgo+ID4+Pgo+ID4+
PiBJIHRoaW5rIGl0J3MganVzdCBhIHF1ZXN0aW9uIG9mIHdoYXQgd2UncmUgdHJ5aW5nIHRvIGRv
IGhlcmU6IGNsZWFuCj4gPj4+IGF2b2lkcyB0aGUga2VybmVsIFYgc3RhdGUgc2F2ZSwgYnV0IHVu
bGVzcyB0aGUga2VybmVsIGRlY2lkZXMgdG8gdXNlIFYKPiA+Pj4gZHVyaW5nIHRoZSBzeXNjYWxs
IHRoZSByZWdpc3RlciBjb250ZW50cyB3aWxsIHN0aWxsIGJlIHVzYWJsZSBieQo+ID4+PiB1c2Vy
c3BhY2UuICBNYXliZSB0aGF0J3MgZmluZSBhbmQgd2UgY2FuIGp1c3QgcmVseSBvbiB0aGUgSVNB
IHNwZWMsCj4gPj4+IHRob3VnaD8gIEkgc2VudCBhbm90aGVyIHBhdGNoIHRvIGp1c3QgZG9jdW1l
bnQgaXQgaW4gTGludXgsIGV2ZW4gaWYgaXQncwo+ID4+PiBpbiB0aGUgSVNBIHNwZWMgaXQgc2Vl
bXMgd29ydGggaGF2aW5nIGluIHRoZSBrZXJuZWwgYXMgd2VsbC4KPiA+Pj4KPiA+Pj4gVGhhdCBz
YWlkLCBJIHRoaW5rIHRoZSByaWdodCB0aGluZyB0byBkbyBoZXJlIG1pZ2h0IGJlIHRvIHplcm8g
dGhlIFYKPiA+Pj4gcmVnaXN0ZXIgc3RhdGUgYW5kIHNldCBpdCB0byBpbml0aWFsOiB0aGF0IHdh
eSB3ZSBjYW4gcHJldmVudCB1c2Vyc3BhY2UKPiA+Pj4gZnJvbSBhY2NpZGVudGFsbHkgcmVseWlu
ZyBvbiB0aGUgc3RhdGUgc2F2ZSwgYnV0IHdlIGNhbiBhbHNvIGF2b2lkIHRoZQo+ID4+PiB0cmFw
IHRoYXQgd291bGQgY29tZSBmcm9tIHR1cm5pbmcgaXQgb2ZmLiAgVGhhdCBsZXRzIHVzIGdpdmUg
dGhlCj4gPj4+IGhhcmR3YXJlIGEgbmljZSBjbGVhbiBpbmRpY2F0aW9uIHdoZW4gdGhlIFYgc3Rh
dGUgaXNuJ3QgaW4gdXNlLCB3aGljaAo+ID4+PiB3aWxsIGhvcGVmdWxseSBoZWxwIHVzIGF2b2lk
IHRoZSBzYXZlL3Jlc3RvcmUgcGVyZm9ybWFuY2UgaXNzdWVzIHRoYXQKPiA+Pj4gb3RoZXIgcG9y
dHMgaGF2ZSBoaXQuCj4gPj4KPiA+PiBGV0lXLCBJIHRoaW5rIHRoYXQncyBhIG11Y2ggYmV0dGVy
IGlkZWEgdGhhbiB0dXJuaW5nIFYgb2ZmLiBJIGFsc28gbGlrZQo+ID4+IHRoYXQgaXQnbGwgcHJl
dmVudGluZyB1c2VybGFuZCB0byByZWx5IG9uIHByZS1lY2FsbCBzdGF0ZS4KPiA+Cj4gPiBPSywg
YW55b25lIGVsc2Ugb3Bwb3NlZD8KPiA+Cj4gPiBXZSdyZSBraW5kIG9mIGluIHRoZSB3ZWVkcyBv
biBwZXJmb3JtYW5jZSwgSSB0aGluayB3ZSdkIG5lZWQgSFcgdG8ga25vdwo+ID4gZm9yIHN1cmUg
aWYgZWl0aGVyIGlzIGFuIGlzc3VlLiAgU2VlbXMgYmVzdCB0byBqdXN0IHBsYXkgaXQgc2FmZSBX
UlQgdGhlCj4gPiB1QUJJIGZvciBub3csIHdlIGNhbiBhbHdheXMgZGVhbCB3aXRoIGFueSBwZXJm
b3JtYW5jZSBpc3N1ZXMgaWYgdGhlCj4gPiBleGlzdC4KPgo+IEhlcmUncyB0aGUgcGF0Y2ggeW91
IG1lbnRpb25lZCBhdCB0aGUgUFcgc3luY2h1cDsgSSd2ZSBrZXB0IHRoZSBTdWJqZWN0Cj4gYW5k
IHN1Y2ggaWYgeW91IHdhbid0IHRvIGFwcGx5IGl0LiBMTUsgaWYgeW91J2QgbGlrZSBhIHByb3Bl
ciBvbmUuCj4KPiAtLQo+Cj4gU3ViamVjdDogW1BBVENIXSByaXNjdjogRGlzY2FyZCB2ZWN0b3Ig
c3RhdGUgb24gc3lzY2FsbHMKPiBNSU1FLVZlcnNpb246IDEuMAo+IENvbnRlbnQtVHlwZTogdGV4
dC9wbGFpbjsgY2hhcnNldD1VVEYtOAo+IENvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQK
Pgo+IFRoZSBSSVNDLVYgdmVjdG9yIHNwZWNpZmljYXRpb24gc3RhdGVzOgo+ICAgRXhlY3V0aW5n
IGEgc3lzdGVtIGNhbGwgY2F1c2VzIGFsbCBjYWxsZXItc2F2ZWQgdmVjdG9yIHJlZ2lzdGVycwo+
ICAgKHYwLXYzMSwgdmwsIHZ0eXBlKSBhbmQgdnN0YXJ0IHRvIGJlY29tZSB1bnNwZWNpZmllZC4K
Pgo+IFRoZSB2ZWN0b3Igc3RhdHVzIGlzIHNldCB0byBJbml0aWFsLCBhbmQgdGhlIHZlY3RvciBz
dGF0ZSBpcwo+IGV4cGxpY2l0bHkgemVyb2VkLiBUaGF0IHdheSB3ZSBjYW4gcHJldmVudCB1c2Vy
c3BhY2UgZnJvbSBhY2NpZGVudGFsbHkKPiByZWx5aW5nIG9uIHRoZSBzdGF0ZWQgc2F2ZS4KPgo+
IFNpZ25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPiAtLS0K
PiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oIHwgMjQgKysrKysrKysrKysrKysrKysr
KysrKysrCj4gIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgICAgICAgfCAgMiArKwo+ICAyIGZp
bGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3ZlY3Rvci5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaAo+
IGluZGV4IDA0YzBiMDdiZjZjZC4uYjMwMjBkMDY0ZjQyIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vdmVjdG9yLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zl
Y3Rvci5oCj4gQEAgLTE2Myw2ICsxNjMsMjkgQEAgc3RhdGljIGlubGluZSB2b2lkIF9fc3dpdGNo
X3RvX3ZlY3RvcihzdHJ1Y3QgdGFza19zdHJ1Y3QgKnByZXYsCj4gIHZvaWQgcmlzY3Zfdl92c3Rh
dGVfY3RybF9pbml0KHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrKTsKPiAgYm9vbCByaXNjdl92X3Zz
dGF0ZV9jdHJsX3VzZXJfYWxsb3dlZCh2b2lkKTsKPgo+ICtzdGF0aWMgaW5saW5lIHZvaWQgcmlz
Y3Zfdl92c3RhdGVfZGlzY2FyZChzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiArewo+ICsgICAgICAg
dW5zaWduZWQgbG9uZyB2bDsKPiArCj4gKyAgICAgICBpZiAoIXJpc2N2X3ZfdnN0YXRlX3F1ZXJ5
KHJlZ3MpKQo+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4gKwo+ICsgICAgICAgcmlzY3Zfdl92
c3RhdGVfb24ocmVncyk7CgpEbyB3ZSBuZWVkIHRoaXMgcmlzY3Zfdl92c3RhdGVfb24oKT8gIElm
IGl0IGlzIG5vdCBvbiB3ZSdkIHJldHVybgplYXJseSBpbiB0aGUgcHJldmlvdXMgImlmIiBzdGF0
ZW1lbnQsIHJpZ2h0PwoKPiArCj4gKyAgICAgICByaXNjdl92X2VuYWJsZSgpOwo+ICsgICAgICAg
YXNtIHZvbGF0aWxlICgKPiArICAgICAgICAgICAgICAgIi5vcHRpb24gcHVzaFxuXHQiCj4gKyAg
ICAgICAgICAgICAgICIub3B0aW9uIGFyY2gsICt2XG5cdCIKPiArICAgICAgICAgICAgICAgInZz
ZXR2bGkgICAgICAgICUwLCB4MCwgZTgsIG04LCB0YSwgbWFcblx0Igo+ICsgICAgICAgICAgICAg
ICAidm12LnYuaSAgICAgICAgdjAsIDBcblx0Igo+ICsgICAgICAgICAgICAgICAidm12LnYuaSAg
ICAgICAgdjgsIDBcblx0Igo+ICsgICAgICAgICAgICAgICAidm12LnYuaSAgICAgICAgdjE2LCAw
XG5cdCIKPiArICAgICAgICAgICAgICAgInZtdi52LmkgICAgICAgIHYyNCwgMFxuXHQiCj4gKyAg
ICAgICAgICAgICAgICIub3B0aW9uIHBvcFxuXHQiCj4gKyAgICAgICAgICAgICAgIDogIj0mciIg
KHZsKSA6IDogIm1lbW9yeSIpOwo+ICsgICAgICAgcmlzY3Zfdl9kaXNhYmxlKCk7CgpNYXliZSBj
b25zaWRlciBjbGVhbmluZyB0aGUgdnN0YXRlIChzdGF0dXMudnMpIGhlcmUuIEFzIHN1Y2ggd2Ug
ZG9uJ3QKaGF2ZSB0byBzYXZlIFYgZHVyaW5nIGNvbnRleHQgc3dpdGNoLiBPciwgbWF5YmUgd2Ug
Y291bGQgc2V0IHZzdGF0ZSBhcwpvZmYgZHVyaW5nIHN5c2NhbGwgYW5kIGRpc2NhcmQgVi1yZWcg
KyByZXN0b3JlIHN0YXR1cy5WUyB3aGVuCnJldHVybmluZyBiYWNrIHRvIHVzZXJzcGFjZT8KCj4g
K30KPiArCj4gICNlbHNlIC8qICEgQ09ORklHX1JJU0NWX0lTQV9WICAqLwo+Cj4gIHN0cnVjdCBw
dF9yZWdzOwo+IEBAIC0xNzgsNiArMjAxLDcgQEAgc3RhdGljIGlubGluZSBib29sIHJpc2N2X3Zf
dnN0YXRlX2N0cmxfdXNlcl9hbGxvd2VkKHZvaWQpIHsgcmV0dXJuIGZhbHNlOyB9Cj4gICNkZWZp
bmUgX19zd2l0Y2hfdG9fdmVjdG9yKF9fcHJldiwgX19uZXh0KSAgICAgZG8ge30gd2hpbGUgKDAp
Cj4gICNkZWZpbmUgcmlzY3Zfdl92c3RhdGVfb2ZmKHJlZ3MpICAgICAgICAgICAgICAgZG8ge30g
d2hpbGUgKDApCj4gICNkZWZpbmUgcmlzY3Zfdl92c3RhdGVfb24ocmVncykgICAgICAgICAgICAg
ICAgICAgICAgICBkbyB7fSB3aGlsZSAoMCkKPiArI2RlZmluZSByaXNjdl92X3ZzdGF0ZV9kaXNj
YXJkKHJlZ3MpICAgICAgICAgICBkbyB7fSB3aGlsZSAoMCkKPgo+ICAjZW5kaWYgLyogQ09ORklH
X1JJU0NWX0lTQV9WICovCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMu
YyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiBpbmRleCAwNWZmZGNkMTQyNGUuLjAwYzY4
YjU3ZmY4OCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gKysrIGIv
YXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+IEBAIC0yOTUsNiArMjk1LDggQEAgYXNtbGlua2Fn
ZSBfX3Zpc2libGUgX190cmFwX3NlY3Rpb24gdm9pZCBkb190cmFwX2VjYWxsX3Uoc3RydWN0IHB0
X3JlZ3MgKnJlZ3MpCj4gICAgICAgICAgICAgICAgIHJlZ3MtPmVwYyArPSA0Owo+ICAgICAgICAg
ICAgICAgICByZWdzLT5vcmlnX2EwID0gcmVncy0+YTA7Cj4KPiArICAgICAgICAgICAgICAgcmlz
Y3Zfdl92c3RhdGVfZGlzY2FyZChyZWdzKTsKPiArCj4gICAgICAgICAgICAgICAgIHN5c2NhbGwg
PSBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKHJlZ3MsIHN5c2NhbGwpOwo+Cj4gICAgICAg
ICAgICAgICAgIGlmIChzeXNjYWxsIDwgTlJfc3lzY2FsbHMpCj4KPiBiYXNlLWNvbW1pdDogYWJk
NjE1MmQ2MDQ2ZGRjNGJlMTA0MGI2MjA2YmVlMmUwMjVlOGE3OQo+IC0tCj4gMi4zOS4yCgpBZ3Jl
ZS4gSXQgaXMgYmV0dGVyIHRvIGNsZWFuIFYgcmVnaXN0ZXJzIGluc3RlYWQgb2YgdHVybmluZyBv
ZmYgVmVjdG9yLgoKUmVnYXJkcywKQW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
