Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1F7C6FD1C
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Mar 2023 10:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UzbfzOsKaLrd2x8fn3rRCZMD7/pupMxMSSyjVS8Spzw=; b=I9UayQUJT1nLUb
	R7XzNM5Y8pEYngYIaCpCCqgkMt0M3XmgqTresECMNo4D8j5/eZ70xSdStyDXmBiXmuFmIaeeb4sMJ
	4aUvsyACofXca9oKw/OPDrffUfLQQAbRmWeoE8jbqoOymZBBfoGRnwMeSfAzrJSbE9GPgUjrG+ylo
	VI44t1qQLmZuUecmPjPrHF7bpVRBf2blLNvEX56paU3gss1E+A9zXoshQFzClxXBCWoej3ubKYmEj
	q4Oe68vZnUvFRTzN2bkFkBXt1cDkwTmMZbY0XAVsq9CjnSsPdIilWwAyJNpc15hWqjnV002Ak/+qy
	yFVJILyA3qYmyGaNfaZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc24B-009meV-2d;
	Tue, 14 Mar 2023 10:39:39 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc247-009mdE-0U
	for linux-riscv@lists.infradead.org;
	Tue, 14 Mar 2023 10:39:37 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id z83so10995482ybb.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 Mar 2023 03:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1678790370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yu39TNvqQnNoXX8hkbpumBIW7PEMEsaP5j9Jtp3j5c0=;
        b=nuqquZarQi0XRF1lNsfXXLT58CukRtTcSq8ehFTIGXzIhJMTAHbnbsr9tllyRl4+Df
         Re4vmDhBBWV9NTT857MyzA6DDWCiw2GsMysyCCKK9EICSPeiytnbvjrwiNSNkFhkiDDP
         B+Jxsp/NHOljh5aPohPpmzc5NjCxSKYOvxvnRQebuD1dgMEen/wO33PppARw8iR6u03c
         EECfl4/Tuta73OZv4lswN+Rxw3ZqEAxLRK5kev0OlyPjCeKN0bdVI1Tclv48eHK74cI0
         O+UuHMfJWu21FoZh4tgRrCPFvwU6TBDAyTAcD3lMARDnqgtWJ86pMW5TBEFHLQQIWK9f
         jxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678790370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yu39TNvqQnNoXX8hkbpumBIW7PEMEsaP5j9Jtp3j5c0=;
        b=SjkpvlGC/5qA4GzQ+/YXrjUXYCNmALKaBobR+UFdqHAweByosIZRunp9QfOzUUicaQ
         KbpUC9OSrIHGxjW8Kc5FQ6zyvgLiVkzXeI7GdQYiHw/yT+1VXi2xfrhTwmPRRteH/I7G
         xulZi4KwerHW/LEmJKZ5CFLw35/rRYw/mdUvWNrd55DgXCH9VTYcaeJdh90Q8WYUGOOV
         1IndMPX8lm/xq1MSFq2iaV+FxUv++THz48kyTdnMvWhHq6TeFmSdr4IQAUutlLE21c4g
         AjGZYyoM90CVQy4CK5K78nyeb/pgti90rJp28I094hXMf69VlqK/g9PTu55PBXZwHiDT
         dC/w==
X-Gm-Message-State: AO0yUKXVg1pTjqsn0MzzgXcwVqakhZNGlTvefnFL/nZkyO3hLRkOOgPF
	aeqEzn4ZlNv4dV+I9h1OD4YLv8O3+MzJ7Utunsve/A==
X-Google-Smtp-Source: AK7set9SXhCZjwP6lNAaNDriGW7JDr3Y4d0EMaZDNDiulZE6m2OvwDsZLCTfqrARJtbI5djaUSqY3HVtI954rV8THog=
X-Received: by 2002:a5b:6c4:0:b0:b26:d140:5f74 with SMTP id
 r4-20020a5b06c4000000b00b26d1405f74mr9038758ybq.1.1678790370297; Tue, 14 Mar
 2023 03:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230224170118.16766-1-andy.chiu@sifive.com> <20230224170118.16766-12-andy.chiu@sifive.com>
 <87mt4v4clq.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87mt4v4clq.fsf@all.your.base.are.belong.to.us>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue, 14 Mar 2023 18:39:19 +0800
Message-ID: <CABgGipU9LjvT6RQ6OfTXm6==pV0KXUjvyTR-FCNC05sfDec+9g@mail.gmail.com>
Subject: Re: [PATCH -next v14 11/19] riscv: Add ptrace vector support
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org, 
	atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	Vincent Chen <vincent.chen@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Oleg Nesterov <oleg@redhat.com>, 
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Brown <broonie@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Rolf Eike Beer <eb@emlix.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Alexey Dobriyan <adobriyan@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_033935_276162_23129822 
X-CRM114-Status: GOOD (  15.72  )
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

T24gVGh1LCBNYXIgMiwgMjAyMyBhdCA3OjI34oCvUE0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPiB3cml0
ZXM6Cj4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wdHJhY2UuYyBiL2FyY2gv
cmlzY3Yva2VybmVsL3B0cmFjZS5jCj4gPiBpbmRleCAyYWU4MjgwYWU0NzUuLjNjMGUwMWQ3Zjhm
YiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3B0cmFjZS5jCj4gPiArKysgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9wdHJhY2UuYwo+ID4gQEAgLTgzLDYgKzg3LDYyIEBAIHN0YXRpYyBp
bnQgcmlzY3ZfZnByX3NldChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhcmdldCwKPiA+ICB9Cj4gPiAg
I2VuZGlmCj4gPgo+ID4gKyNpZmRlZiBDT05GSUdfUklTQ1ZfSVNBX1YKPiA+ICtzdGF0aWMgaW50
IHJpc2N2X3ZyX2dldChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhcmdldCwKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICBjb25zdCBzdHJ1Y3QgdXNlcl9yZWdzZXQgKnJlZ3NldCwKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgbWVtYnVmIHRvKQo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCBf
X3Jpc2N2X3ZfZXh0X3N0YXRlICp2c3RhdGUgPSAmdGFyZ2V0LT50aHJlYWQudnN0YXRlOwo+ID4g
Kwo+ID4gKyAgICAgaWYgKCFyaXNjdl92X3ZzdGF0ZV9xdWVyeSh0YXNrX3B0X3JlZ3ModGFyZ2V0
KSkpCj4gPiArICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gKyAgICAgLyoKPiA+ICsg
ICAgICAqIEVuc3VyZSB0aGUgdmVjdG9yIHJlZ2lzdGVycyBoYXZlIGJlZW4gc2F2ZWQgdG8gdGhl
IG1lbW9yeSBiZWZvcmUKPiA+ICsgICAgICAqIGNvcHlpbmcgdGhlbSB0byBtZW1idWYuCj4gPiAr
ICAgICAgKi8KPiA+ICsgICAgIGlmICh0YXJnZXQgPT0gY3VycmVudCkKPiA+ICsgICAgICAgICAg
ICAgcmlzY3Zfdl92c3RhdGVfc2F2ZShjdXJyZW50LCB0YXNrX3B0X3JlZ3MoY3VycmVudCkpOwo+
ID4gKwo+ID4gKyAgICAgLyogQ29weSB2ZWN0b3IgaGVhZGVyIGZyb20gdnN0YXRlLiAqLwo+ID4g
KyAgICAgbWVtYnVmX3dyaXRlKCZ0bywgdnN0YXRlLCBvZmZzZXRvZihzdHJ1Y3QgX19yaXNjdl92
X2V4dF9zdGF0ZSwgZGF0YXApKTsKPiA+ICsgICAgIG1lbWJ1Zl96ZXJvKCZ0bywgc2l6ZW9mKHZv
aWQgKikpOwo+ID4gKyNpZiBfX3Jpc2N2X3hsZW4gPT0gMzIKPiA+ICsgICAgIG1lbWJ1Zl96ZXJv
KCZ0bywgc2l6ZW9mKF9fdTMyKSk7Cj4gPiArI2VuZGlmCj4KPiBSZW1pbmQgbWUgd2h5IHRoZSBl
eHRyYSBjYXJlIGlzIG5lZWRlZCBmb3IgMzJiPwo+CgpUaGF0IGlzIGZyb20gdGhlIG9sZCB2ZXJz
aW9uIG9mIHRoZSBjb2RlIGFuZCBJIGFncmVlIHdlIHNob3VsZCByZW1vdmUKdGhhdC4gSGV5IENv
bm9yLCBkb2VzIHlvdXIgUmIgc3RpbGwgaG9sZCBhZnRlciByZW1vdmluZyB0aGlzICNpZiwKI2Vu
ZGlmIHNlY3Rpb24/Cgo+Cj4gQmrDtnJuCgpBbmR5CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
