Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2612CD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 05:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OnPyl+EsA8/tnUhx12J2z6K6MmTxCFjJJKKoN6kmnI4=; b=vCTVkE11gaJdCK
	2IfTRdL2ix8Fwn0VMabpDSff6r7Wq18f8Gb9PB3xW6ZZczGlperwNQXuM2qOOytTOhBXvt44OcvrE
	9KG7fQoBaAwXAh+RSLxLnwUbju54zrjbL7TkaJenj6NFLLGPrXjqdpK/6uvkfiEQJQq3QObaSyv/+
	ERPYCyXwAQuPY68wFrpGPPY/sVRHsD4/5LNpYiLMNMNzwM72yPcOBPPTKA5RC2qT1qXXZQAbD9CWB
	IgcvRMbEnKq/6g6SoMkvAhOvApbSVs/q9NVsi/HIBolcQOZakInW5vguGuT9FyDjaxRKGUYqAWrM2
	b9fx9CpaPgausM3EmdAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrtGR-0000000E7cS-43vw;
	Wed, 03 Apr 2024 05:34:23 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrtGO-0000000E7aJ-27zU
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 05:34:21 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-dc742543119so5873697276.0
        for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2024 22:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712122456; x=1712727256; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMhJUAqYdUyXE6Qj5LLiAEui3/1WTCPuc8rsDHLD3M0=;
        b=ntRixBeX/G4/xo3lN3nyv7qjsVKwyZVpS3BGQQiYjoDm6pVUGX/SOwhJJcvf0stGcm
         +GXtxWpww4uMBkrk8sJRNV1GCaLw6D7pKNOhbM2bAHHwLyeqnYSaKrfNh05mLgWKdqPb
         w2yki2m2yTIXJnb8UpAOPo7TKD8lDTRaHRy5+2WiBEpRbuSncC4if+3An/Ls4kNcZbUm
         minL76kcsIe29pCL97FThr1Uza2WaL+y4HtppaYk4iTEeaY0Vi0vgltLsWJIrou6rc56
         tbEYiecHNxOXKpx55ZfMkbjh1dLGbeal7asEP/ajZK/QGpJ9DvDX8LzFzOj1MgmNuwDv
         5Qsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712122456; x=1712727256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VMhJUAqYdUyXE6Qj5LLiAEui3/1WTCPuc8rsDHLD3M0=;
        b=lESqiYtGyHrQxQT3PVgaGPIDXlTaAAh6UZ7UCyPI7Qa4HhN7M5s17ri+QIFZcz8FFu
         I/anPJPJcl7qJ1YDzAVSy6yXWfWzcT94iOLII3FHOYf53Zr9qWdOVnbrQ7Ik8FAhruJ6
         kuIDVzXNpLVrRLcv5YqSMg2+yamDFoH0tBu5YgDACXMkeaY00c32w1H6tGGrcJCRQlDy
         5BH4ZO2O/9npspkELgOEFlG3XtNbvBTjbZJHN9MFls+yTFFI2j4W3G+h0rElXmi3bSuO
         tpYjRCJ1dvwCjQu/9FWw8/JtomHKOx3smEC5BsBpkWa+RsdODHy4vl59M2d4L6HM+da5
         nDfA==
X-Forwarded-Encrypted: i=1; AJvYcCXMy0Q+SCrSdlqyhcn+2VhF1jxN16HYPkbGJY+fAV9GRA1reb5EtNaHDyQ3gTdc7wP7FEv/f2u7+4txrIKxJ8VezNNFTu2lcFXCgQzNc7Zm
X-Gm-Message-State: AOJu0YzNG1tKYZZg4eSgjS9bobwkjYadXSJU7PLzmW6XzgSKcdEfxPeo
	jQ9UbYqYQflaWbiodl2IaJdORUSXwdk1bqq6nWZxviXUn/jA7yerVwhJxjwlNV+VrzKKG9ObxuD
	AtDcPWTjoygGo7s5w+c7djeSla+LybMipbVmK
X-Google-Smtp-Source: AGHT+IFHtHI+kOgQbA0jN0HDYS831HEs6w0y5y/YrI4Iocm+EMqRSzcSDQggfc1RbHP4jEbfZEvpbo6dJNCJOpQwGVo=
X-Received: by 2002:a25:a28a:0:b0:dcd:3575:db79 with SMTP id
 c10-20020a25a28a000000b00dcd3575db79mr1551217ybi.6.1712122456055; Tue, 02 Apr
 2024 22:34:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240402075142.196265-1-wangkefeng.wang@huawei.com> <20240402075142.196265-5-wangkefeng.wang@huawei.com>
In-Reply-To: <20240402075142.196265-5-wangkefeng.wang@huawei.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 2 Apr 2024 22:34:02 -0700
Message-ID: <CAJuCfpGhF9xLhJ1_fWKRirVdeT2C0QCMsWht2sB62q3ZaWA2wQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] powerpc: mm: accelerate pagefault when badaccess
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: akpm@linux-foundation.org, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_223420_589743_34C25F37 
X-CRM114-Status: GOOD (  22.13  )
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

T24gVHVlLCBBcHIgMiwgMjAyNCBhdCAxMjo1M+KAr0FNIEtlZmVuZyBXYW5nIDx3YW5na2VmZW5n
LndhbmdAaHVhd2VpLmNvbT4gd3JvdGU6Cj4KPiBUaGUgdm1fZmxhZ3Mgb2Ygdm1hIGFscmVhZHkg
Y2hlY2tlZCB1bmRlciBwZXItVk1BIGxvY2ssIGlmIGl0IGlzIGEKPiBiYWQgYWNjZXNzLCBkaXJl
Y3RseSBoYW5kbGUgZXJyb3IgYW5kIHJldHVybiwgdGhlcmUgaXMgbm8gbmVlZCB0bwo+IGxvY2tf
bW1fYW5kX2ZpbmRfdm1hKCkgYW5kIGNoZWNrIHZtX2ZsYWdzIGFnYWluLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogS2VmZW5nIFdhbmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPgoKQ29kZS13aXNl
IGxvb2tzIGNvcnJlY3QgdG8gbWUgYW5kIGFsbW9zdCBpZGVudGljYWwgdG8geDg2IGNoYW5nZSBi
dXQKc29tZW9uZSB3aXRoIG1vcmUgZXhwZXJpZW5jZSB3aXRoIHRoaXMgYXJjaGl0ZWN0dXJlIHNo
b3VsZCByZXZpZXcuCgo+IC0tLQo+ICBhcmNoL3Bvd2VycGMvbW0vZmF1bHQuYyB8IDMzICsrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0
aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL21t
L2ZhdWx0LmMgYi9hcmNoL3Bvd2VycGMvbW0vZmF1bHQuYwo+IGluZGV4IDUzMzM1YWUyMWE0MC4u
MjE1NjkwNDUyNDk1IDEwMDY0NAo+IC0tLSBhL2FyY2gvcG93ZXJwYy9tbS9mYXVsdC5jCj4gKysr
IGIvYXJjaC9wb3dlcnBjL21tL2ZhdWx0LmMKPiBAQCAtNzEsMjMgKzcxLDI2IEBAIHN0YXRpYyBu
b2lubGluZSBpbnQgYmFkX2FyZWFfbm9zZW1hcGhvcmUoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHVu
c2lnbmVkIGxvbmcgYWRkCj4gICAgICAgICByZXR1cm4gX19iYWRfYXJlYV9ub3NlbWFwaG9yZShy
ZWdzLCBhZGRyZXNzLCBTRUdWX01BUEVSUik7Cj4gIH0KPgo+IC1zdGF0aWMgaW50IF9fYmFkX2Fy
ZWEoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGxvbmcgYWRkcmVzcywgaW50IHNpX2Nv
ZGUpCj4gK3N0YXRpYyBpbnQgX19iYWRfYXJlYShzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5zaWdu
ZWQgbG9uZyBhZGRyZXNzLCBpbnQgc2lfY29kZSwKPiArICAgICAgICAgICAgICAgICAgICAgc3Ry
dWN0IG1tX3N0cnVjdCAqbW0sIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+ICB7Cj4gLSAg
ICAgICBzdHJ1Y3QgbW1fc3RydWN0ICptbSA9IGN1cnJlbnQtPm1tOwo+Cj4gICAgICAgICAvKgo+
ICAgICAgICAgICogU29tZXRoaW5nIHRyaWVkIHRvIGFjY2VzcyBtZW1vcnkgdGhhdCBpc24ndCBp
biBvdXIgbWVtb3J5IG1hcC4uCj4gICAgICAgICAgKiBGaXggaXQsIGJ1dCBjaGVjayBpZiBpdCdz
IGtlcm5lbCBvciB1c2VyIGZpcnN0Li4KPiAgICAgICAgICAqLwo+IC0gICAgICAgbW1hcF9yZWFk
X3VubG9jayhtbSk7Cj4gKyAgICAgICBpZiAobW0pCj4gKyAgICAgICAgICAgICAgIG1tYXBfcmVh
ZF91bmxvY2sobW0pOwo+ICsgICAgICAgZWxzZQo+ICsgICAgICAgICAgICAgICB2bWFfZW5kX3Jl
YWQodm1hKTsKPgo+ICAgICAgICAgcmV0dXJuIF9fYmFkX2FyZWFfbm9zZW1hcGhvcmUocmVncywg
YWRkcmVzcywgc2lfY29kZSk7Cj4gIH0KPgo+ICBzdGF0aWMgbm9pbmxpbmUgaW50IGJhZF9hY2Nl
c3NfcGtleShzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5zaWduZWQgbG9uZyBhZGRyZXNzLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2bV9hcmVhX3N0cnVj
dCAqdm1hKQo+ICB7Cj4gLSAgICAgICBzdHJ1Y3QgbW1fc3RydWN0ICptbSA9IGN1cnJlbnQtPm1t
Owo+ICAgICAgICAgaW50IHBrZXk7Cj4KPiAgICAgICAgIC8qCj4gQEAgLTEwOSw3ICsxMTIsMTAg
QEAgc3RhdGljIG5vaW5saW5lIGludCBiYWRfYWNjZXNzX3BrZXkoc3RydWN0IHB0X3JlZ3MgKnJl
Z3MsIHVuc2lnbmVkIGxvbmcgYWRkcmVzcywKPiAgICAgICAgICAqLwo+ICAgICAgICAgcGtleSA9
IHZtYV9wa2V5KHZtYSk7Cj4KPiAtICAgICAgIG1tYXBfcmVhZF91bmxvY2sobW0pOwo+ICsgICAg
ICAgaWYgKG1tKQo+ICsgICAgICAgICAgICAgICBtbWFwX3JlYWRfdW5sb2NrKG1tKTsKPiArICAg
ICAgIGVsc2UKPiArICAgICAgICAgICAgICAgdm1hX2VuZF9yZWFkKHZtYSk7Cj4KPiAgICAgICAg
IC8qCj4gICAgICAgICAgKiBJZiB3ZSBhcmUgaW4ga2VybmVsIG1vZGUsIGJhaWwgb3V0IHdpdGgg
YSBTRUdWLCB0aGlzIHdpbGwKPiBAQCAtMTI0LDkgKzEzMCwxMCBAQCBzdGF0aWMgbm9pbmxpbmUg
aW50IGJhZF9hY2Nlc3NfcGtleShzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5zaWduZWQgbG9uZyBh
ZGRyZXNzLAo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+IC1zdGF0aWMgbm9pbmxpbmUgaW50
IGJhZF9hY2Nlc3Moc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGxvbmcgYWRkcmVzcykK
PiArc3RhdGljIG5vaW5saW5lIGludCBiYWRfYWNjZXNzKHN0cnVjdCBwdF9yZWdzICpyZWdzLCB1
bnNpZ25lZCBsb25nIGFkZHJlc3MsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0
cnVjdCBtbV9zdHJ1Y3QgKm1tLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiAgewo+IC0g
ICAgICAgcmV0dXJuIF9fYmFkX2FyZWEocmVncywgYWRkcmVzcywgU0VHVl9BQ0NFUlIpOwo+ICsg
ICAgICAgcmV0dXJuIF9fYmFkX2FyZWEocmVncywgYWRkcmVzcywgU0VHVl9BQ0NFUlIsIG1tLCB2
bWEpOwo+ICB9Cj4KPiAgc3RhdGljIGludCBkb19zaWdidXMoc3RydWN0IHB0X3JlZ3MgKnJlZ3Ms
IHVuc2lnbmVkIGxvbmcgYWRkcmVzcywKPiBAQCAtNDc5LDEzICs0ODYsMTMgQEAgc3RhdGljIGlu
dCBfX19kb19wYWdlX2ZhdWx0KHN0cnVjdCBwdF9yZWdzICpyZWdzLCB1bnNpZ25lZCBsb25nIGFk
ZHJlc3MsCj4KPiAgICAgICAgIGlmICh1bmxpa2VseShhY2Nlc3NfcGtleV9lcnJvcihpc193cml0
ZSwgaXNfZXhlYywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoZXJy
b3JfY29kZSAmIERTSVNSX0tFWUZBVUxUKSwgdm1hKSkpIHsKPiAtICAgICAgICAgICAgICAgdm1h
X2VuZF9yZWFkKHZtYSk7Cj4gLSAgICAgICAgICAgICAgIGdvdG8gbG9ja19tbWFwOwo+ICsgICAg
ICAgICAgICAgICBjb3VudF92bV92bWFfbG9ja19ldmVudChWTUFfTE9DS19TVUNDRVNTKTsKPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIGJhZF9hY2Nlc3NfcGtleShyZWdzLCBhZGRyZXNzLCBOVUxM
LCB2bWEpOwo+ICAgICAgICAgfQo+Cj4gICAgICAgICBpZiAodW5saWtlbHkoYWNjZXNzX2Vycm9y
KGlzX3dyaXRlLCBpc19leGVjLCB2bWEpKSkgewo+IC0gICAgICAgICAgICAgICB2bWFfZW5kX3Jl
YWQodm1hKTsKPiAtICAgICAgICAgICAgICAgZ290byBsb2NrX21tYXA7Cj4gKyAgICAgICAgICAg
ICAgIGNvdW50X3ZtX3ZtYV9sb2NrX2V2ZW50KFZNQV9MT0NLX1NVQ0NFU1MpOwo+ICsgICAgICAg
ICAgICAgICByZXR1cm4gYmFkX2FjY2VzcyhyZWdzLCBhZGRyZXNzLCBOVUxMLCB2bWEpOwo+ICAg
ICAgICAgfQo+Cj4gICAgICAgICBmYXVsdCA9IGhhbmRsZV9tbV9mYXVsdCh2bWEsIGFkZHJlc3Ms
IGZsYWdzIHwgRkFVTFRfRkxBR19WTUFfTE9DSywgcmVncyk7Cj4gQEAgLTUyMSwxMCArNTI4LDEw
IEBAIHN0YXRpYyBpbnQgX19fZG9fcGFnZV9mYXVsdChzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5z
aWduZWQgbG9uZyBhZGRyZXNzLAo+Cj4gICAgICAgICBpZiAodW5saWtlbHkoYWNjZXNzX3BrZXlf
ZXJyb3IoaXNfd3JpdGUsIGlzX2V4ZWMsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgKGVycm9yX2NvZGUgJiBEU0lTUl9LRVlGQVVMVCksIHZtYSkpKQo+IC0gICAgICAg
ICAgICAgICByZXR1cm4gYmFkX2FjY2Vzc19wa2V5KHJlZ3MsIGFkZHJlc3MsIHZtYSk7Cj4gKyAg
ICAgICAgICAgICAgIHJldHVybiBiYWRfYWNjZXNzX3BrZXkocmVncywgYWRkcmVzcywgbW0sIHZt
YSk7Cj4KPiAgICAgICAgIGlmICh1bmxpa2VseShhY2Nlc3NfZXJyb3IoaXNfd3JpdGUsIGlzX2V4
ZWMsIHZtYSkpKQo+IC0gICAgICAgICAgICAgICByZXR1cm4gYmFkX2FjY2VzcyhyZWdzLCBhZGRy
ZXNzKTsKPiArICAgICAgICAgICAgICAgcmV0dXJuIGJhZF9hY2Nlc3MocmVncywgYWRkcmVzcywg
bW0sIHZtYSk7Cj4KPiAgICAgICAgIC8qCj4gICAgICAgICAgKiBJZiBmb3IgYW55IHJlYXNvbiBh
dCBhbGwgd2UgY291bGRuJ3QgaGFuZGxlIHRoZSBmYXVsdCwKPiAtLQo+IDIuMjcuMAo+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
