Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DEBC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 06:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vIYJ3EnMix0nHSzP+CWyi6Wv6Yn5UhBiZCad7EaBi8A=; b=pzg4AZyJfdiq8C
	Y1ydy906lEXIkOlni6G9/hkNw5/WQRdWlND35THAHzfWGIuh1jrHMxdJsM2UaJNZR8KAQhGjkxdq1
	C/ZimAOKewCk7Mq32Xz2vK6MN6kExljt7/qUdVM+cyKfpf8Q0phgY5BGsX5xSjyxPPyw9h89SMepI
	YrJEy3levRPvA8nTsf/jgvXmtKNf36TOy5s5UWGWKxPJmKnp6qHuP2LNYM8ZZyshW/auEtoVTDdqg
	zID1Ii+k5yFLCXv10dI1sh6WavKNxpqQiWE9Z6QxkihMxahIDxYNPUKEdXu2LVHrQu5+Q2agC4rXL
	TEZWVoeb47M6HXn7hoWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDez2-00GwDc-29;
	Thu, 14 Dec 2023 06:14:08 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDeyz-00GwBc-0p
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 06:14:06 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6d9f9fbfd11so4069771a34.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 22:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1702534442; x=1703139242; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3sMkRAMQECWLiukPZgPf+GGB55ddSK20MJ/gjXWD1s=;
        b=RuYUvLLzq1sz8rkwrP50h1LihKfwyWOW9W0eyBehGb9voRFzffD/CLcoBT9kufLoys
         17A0/HEmkXUID7ItLOdLaOG20mAaiYnMMagnm5iNbO8NqFDN8zRQ01dEAxueY/pdXdan
         P7aKDHzHKMoWxdmtsh+aKYxGUafc6uBr1BbRv9u92i70vc47pTV//JjdjhGLmQOG2x15
         UZRQ9vSrgk2Hn8Jtp/ZMabDqo0gqLIX+vtSxfM4L4ck7Abh+6F80Ld0jO64uE8Jf0Owl
         L5mCaqnVydw2vXOzVhlQrVLzOMwer8l5d1ycAFL4nl1SNyjMy8/k7HGfwuqN4tMuED56
         01Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702534442; x=1703139242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3sMkRAMQECWLiukPZgPf+GGB55ddSK20MJ/gjXWD1s=;
        b=qL8lpNEkUHzGWtJXYrQP0Qns9OcYGDKN7rMUjL4S2BawOZugMZ/jHyydLXWDeXpgA0
         +Rf7VUaL0+HXUWEY/4ZJOfHpZIuCNFxI6ZHyVbRSUSSLtOFaRGrCS4jpIYafylIBEhfK
         FQFQCOqHDxODNYEo5N4eMTN7WyuTG1TizVX3We8dvCOFYpgGcVgrQk61wMbOLABGeBQR
         kDeBUxFPfzdpgqXTrjwZa5Xlmxv8Nk/ecjLvS/THtnPL3hdb4HEJxJ404l+6odEQQElv
         HhQvWn2BnIZ/eleUILgN2SIhYIc1f95OoHcJjaXW4jAs5yrxkr8c0wbhexsuf2MoQ9mq
         pgXw==
X-Gm-Message-State: AOJu0YyJsXhBKKCDmPtd+S5dlmpM2yKaJSese9a0O7p1/gMZSz99v8U2
	CQQtRBScyh+9TnyEi0YgtLuQrJWsAW/og/Qe/4Xw0w==
X-Google-Smtp-Source: AGHT+IHQd+GqK3y5tlwO2tTpsax7aS81PVJh1PsMGIYAkqaLtpj/3C4S2vBn648Rccq1W4+OEQ+fJWJGTJEaydQwxew=
X-Received: by 2002:a05:6808:2e85:b0:3ba:8d5:4009 with SMTP id
 gt5-20020a0568082e8500b003ba08d54009mr11288098oib.110.1702534442120; Wed, 13
 Dec 2023 22:14:02 -0800 (PST)
MIME-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com> <20230916003118.2540661-23-seanjc@google.com>
In-Reply-To: <20230916003118.2540661-23-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 14 Dec 2023 11:43:50 +0530
Message-ID: <CAAhSdy2N8PmP2+-8sFVpgduED0HU9D3dqg7sk3+R9f2wRgZ7KA@mail.gmail.com>
Subject: Re: [PATCH 22/26] entry/kvm: KVM: Move KVM details related to
 signal/-EINTR into KVM proper
To: Sean Christopherson <seanjc@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Tony Krowiak <akrowiak@linux.ibm.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>, 
	Harald Freudenberger <freude@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>, 
	Andy Lutomirski <luto@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Anish Ghulati <aghulati@google.com>, Venkatesh Srinivas <venkateshs@chromium.org>, 
	Andrew Thornton <andrewth@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_221405_296175_B0EBDC7E 
X-CRM114-Status: GOOD (  23.32  )
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

T24gU2F0LCBTZXAgMTYsIDIwMjMgYXQgNjowMuKAr0FNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE1vdmUgS1ZNJ3MgbW9ycGhpbmcgb2YgcGVuZGlu
ZyBzaWduYWxzIGludG8gZXhpdHMgdG8gdXNlcnNwYWNlIGludG8gS1ZNCj4gcHJvcGVyLCBhbmQg
ZHJvcCB0aGUgQHZjcHUgcGFyYW0gZnJvbSB4ZmVyX3RvX2d1ZXN0X21vZGVfaGFuZGxlX3dvcmso
KS4KPiBIb3cgS1ZNIHJlc3BvbmRzIHRvIC1FSU5UUiBpcyBhIGRldGFpbCB0aGF0IHJlYWxseSBi
ZWxvbmdzIGluIEtWTSBpdHNlbGYsCj4gYW5kIHJlbW92aW5nIHRoZSBub24tS1ZNIGNhbGwgdG8g
a3ZtX2hhbmRsZV9zaWduYWxfZXhpdCgpIHdpbGwgYWxsb3cKPiBoaWRpbmcgc2FpZCBBUEkgYW5k
IHRoZSBkZWZpbml0aW9uIG9mICJzdHJ1Y3Qga3ZtX3ZjcHUiIGZyb20gdGhlIGtlcm5lbC4KPgo+
IEFsdGVybmF0aXZlbHksIGVudHJ5L2t2bS5jIGNvdWxkIGJlIHRyZWF0ZWQgYXMgcGFydCBvZiBL
Vk0sIGkuZS4gYmUgZ2l2ZW4KPiBhY2Nlc3MgdG8gS1ZNIGludGVybmFscywgYnV0IHRoYXQncyBu
b3Qgb2J2aW91c2x5IGJldHRlciB0aGFuIGhhdmluZyBLVk0KPiByZWFjdCB0byAtRUlOVFIgKHRo
b3VnaCBpdCdzIG5vdCBvYnZpb3VzbHkgd29yc2UgZWl0aGVyKS4KPgo+IFNpZ25lZC1vZmYtYnk6
IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgoKRm9yIEtWTSBSSVNDLVY6
CkFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+
ICBhcmNoL2FybTY0L2t2bS9hcm0uYyAgICAgIHwgIDMgKy0tCj4gIGFyY2gvcmlzY3Yva3ZtL3Zj
cHUuYyAgICAgfCAgMiArLQo+ICBhcmNoL3g4Ni9rdm0vdm14L3ZteC5jICAgIHwgIDEgLQo+ICBh
cmNoL3g4Ni9rdm0veDg2LmMgICAgICAgIHwgIDMgKy0tCj4gIGluY2x1ZGUvbGludXgvZW50cnkt
a3ZtLmggfCAgMyArLS0KPiAgaW5jbHVkZS9saW51eC9rdm1faG9zdC5oICB8IDEzICsrKysrKysr
KysrKy0KPiAga2VybmVsL2VudHJ5L2t2bS5jICAgICAgICB8IDExICsrKystLS0tLS0tCj4gIDcg
ZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9hcm02NC9rdm0vYXJtLmMgYi9hcmNoL2FybTY0L2t2bS9hcm0uYwo+IGlu
ZGV4IDY0ODA2MjgxOTdiNC4uNjQxZGYwOTFlNDZiIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQv
a3ZtL2FybS5jCj4gKysrIGIvYXJjaC9hcm02NC9rdm0vYXJtLmMKPiBAQCAtNiw3ICs2LDYgQEAK
Pgo+ICAjaW5jbHVkZSA8bGludXgvYnVnLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9jcHVfcG0uaD4K
PiAtI2luY2x1ZGUgPGxpbnV4L2VudHJ5LWt2bS5oPgo+ICAjaW5jbHVkZSA8bGludXgvZXJybm8u
aD4KPiAgI2luY2x1ZGUgPGxpbnV4L2Vyci5oPgo+ICAjaW5jbHVkZSA8bGludXgva3ZtX2hvc3Qu
aD4KPiBAQCAtOTI5LDcgKzkyOCw3IEBAIGludCBrdm1fYXJjaF92Y3B1X2lvY3RsX3J1bihzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gICAgICAgICAgICAgICAgIC8qCj4gICAgICAgICAgICAgICAg
ICAqIENoZWNrIGNvbmRpdGlvbnMgYmVmb3JlIGVudGVyaW5nIHRoZSBndWVzdAo+ICAgICAgICAg
ICAgICAgICAgKi8KPiAtICAgICAgICAgICAgICAgcmV0ID0geGZlcl90b19ndWVzdF9tb2RlX2hh
bmRsZV93b3JrKHZjcHUpOwo+ICsgICAgICAgICAgICAgICByZXQgPSBrdm1feGZlcl90b19ndWVz
dF9tb2RlX2hhbmRsZV93b3JrKHZjcHUpOwo+ICAgICAgICAgICAgICAgICBpZiAoIXJldCkKPiAg
ICAgICAgICAgICAgICAgICAgICAgICByZXQgPSAxOwo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IGluZGV4IDgyMjI5ZGIxY2U3
My4uYzMxM2Y0ZTkwZTcwIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+ICsr
KyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IEBAIC02NjcsNyArNjY3LDcgQEAgaW50IGt2bV9h
cmNoX3ZjcHVfaW9jdGxfcnVuKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAgICAgICAgIHJ1bi0+
ZXhpdF9yZWFzb24gPSBLVk1fRVhJVF9VTktOT1dOOwo+ICAgICAgICAgd2hpbGUgKHJldCA+IDAp
IHsKPiAgICAgICAgICAgICAgICAgLyogQ2hlY2sgY29uZGl0aW9ucyBiZWZvcmUgZW50ZXJpbmcg
dGhlIGd1ZXN0ICovCj4gLSAgICAgICAgICAgICAgIHJldCA9IHhmZXJfdG9fZ3Vlc3RfbW9kZV9o
YW5kbGVfd29yayh2Y3B1KTsKPiArICAgICAgICAgICAgICAgcmV0ID0ga3ZtX3hmZXJfdG9fZ3Vl
c3RfbW9kZV9oYW5kbGVfd29yayh2Y3B1KTsKPiAgICAgICAgICAgICAgICAgaWYgKHJldCkKPiAg
ICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiAgICAgICAgICAgICAgICAgcmV0ID0g
MTsKPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3ZteC92bXguYyBiL2FyY2gveDg2L2t2bS92
bXgvdm14LmMKPiBpbmRleCBmYWYwMDcxNTY2ZWYuLjQzYjg3YWQ1ZmRlOCAxMDA2NDQKPiAtLS0g
YS9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jCj4gKysrIGIvYXJjaC94ODYva3ZtL3ZteC92bXguYwo+
IEBAIC0yOCw3ICsyOCw2IEBACj4gICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gICNpbmNsdWRl
IDxsaW51eC90Ym9vdC5oPgo+ICAjaW5jbHVkZSA8bGludXgvdHJhY2VfZXZlbnRzLmg+Cj4gLSNp
bmNsdWRlIDxsaW51eC9lbnRyeS1rdm0uaD4KPgo+ICAjaW5jbHVkZSA8YXNtL2FwaWMuaD4KPiAg
I2luY2x1ZGUgPGFzbS9hc20uaD4KPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3g4Ni5jIGIv
YXJjaC94ODYva3ZtL3g4Ni5jCj4gaW5kZXggNmM5YzgxZTgyZTY1Li5hYWIwOTVmODlkOWUgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC94ODYva3ZtL3g4Ni5jCj4gKysrIGIvYXJjaC94ODYva3ZtL3g4Ni5j
Cj4gQEAgLTU5LDcgKzU5LDYgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L3NjaGVkL3N0YXQuaD4KPiAg
I2luY2x1ZGUgPGxpbnV4L3NjaGVkL2lzb2xhdGlvbi5oPgo+ICAjaW5jbHVkZSA8bGludXgvbWVt
X2VuY3J5cHQuaD4KPiAtI2luY2x1ZGUgPGxpbnV4L2VudHJ5LWt2bS5oPgo+ICAjaW5jbHVkZSA8
bGludXgvc3VzcGVuZC5oPgo+ICAjaW5jbHVkZSA8bGludXgvc21wLmg+Cj4KPiBAQCAtMTA5ODcs
NyArMTA5ODYsNyBAQCBzdGF0aWMgaW50IHZjcHVfcnVuKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkK
Pgo+ICAgICAgICAgICAgICAgICBpZiAoX194ZmVyX3RvX2d1ZXN0X21vZGVfd29ya19wZW5kaW5n
KCkpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBrdm1fdmNwdV9zcmN1X3JlYWRfdW5sb2Nr
KHZjcHUpOwo+IC0gICAgICAgICAgICAgICAgICAgICAgIHIgPSB4ZmVyX3RvX2d1ZXN0X21vZGVf
aGFuZGxlX3dvcmsodmNwdSk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgciA9IGt2bV94ZmVy
X3RvX2d1ZXN0X21vZGVfaGFuZGxlX3dvcmsodmNwdSk7Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAga3ZtX3ZjcHVfc3JjdV9yZWFkX2xvY2sodmNwdSk7Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgaWYgKHIpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcjsKPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9lbnRyeS1rdm0uaCBiL2luY2x1ZGUvbGludXgvZW50
cnkta3ZtLmgKPiBpbmRleCBlN2Q5MGQwNmU1NjYuLmUyMzVhOTFkMjhmYyAxMDA2NDQKPiAtLS0g
YS9pbmNsdWRlL2xpbnV4L2VudHJ5LWt2bS5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9lbnRyeS1r
dm0uaAo+IEBAIC00MiwxMSArNDIsMTAgQEAgc3RhdGljIGlubGluZSBpbnQgYXJjaF94ZmVyX3Rv
X2d1ZXN0X21vZGVfaGFuZGxlX3dvcmsodW5zaWduZWQgbG9uZyB0aV93b3JrKQo+ICAvKioKPiAg
ICogeGZlcl90b19ndWVzdF9tb2RlX2hhbmRsZV93b3JrIC0gQ2hlY2sgYW5kIGhhbmRsZSBwZW5k
aW5nIHdvcmsgd2hpY2ggbmVlZHMKPiAgICogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB0byBiZSBoYW5kbGVkIGJlZm9yZSBnb2luZyB0byBndWVzdCBtb2RlCj4gLSAqIEB2Y3B1OiAg
ICAgIFBvaW50ZXIgdG8gY3VycmVudCdzIFZDUFUgZGF0YQo+ICAgKgo+ICAgKiBSZXR1cm5zOiAw
IG9yIGFuIGVycm9yIGNvZGUKPiAgICovCj4gLWludCB4ZmVyX3RvX2d1ZXN0X21vZGVfaGFuZGxl
X3dvcmsoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKPiAraW50IHhmZXJfdG9fZ3Vlc3RfbW9kZV9o
YW5kbGVfd29yayh2b2lkKTsKPgo+ICAvKioKPiAgICogeGZlcl90b19ndWVzdF9tb2RlX3ByZXBh
cmUgLSBQZXJmb3JtIGxhc3QgbWludXRlIHByZXBhcmF0aW9uIHdvcmsgdGhhdAo+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggYi9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgK
PiBpbmRleCBmYjZjNjEwOWZkY2EuLmQ1MjBkNjgwMTA3MCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRl
L2xpbnV4L2t2bV9ob3N0LmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgKPiBAQCAt
Miw3ICsyLDcgQEAKPiAgI2lmbmRlZiBfX0tWTV9IT1NUX0gKPiAgI2RlZmluZSBfX0tWTV9IT1NU
X0gKPgo+IC0KPiArI2luY2x1ZGUgPGxpbnV4L2VudHJ5LWt2bS5oPgo+ICAjaW5jbHVkZSA8bGlu
dXgvdHlwZXMuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2hhcmRpcnEuaD4KPiAgI2luY2x1ZGUgPGxp
bnV4L2xpc3QuaD4KPiBAQCAtMjI5Myw2ICsyMjkzLDE3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBr
dm1faGFuZGxlX3NpZ25hbF9leGl0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAgICAgICAgIHZj
cHUtPnJ1bi0+ZXhpdF9yZWFzb24gPSBLVk1fRVhJVF9JTlRSOwo+ICAgICAgICAgdmNwdS0+c3Rh
dC5zaWduYWxfZXhpdHMrKzsKPiAgfQo+ICsKPiArc3RhdGljIGlubGluZSBpbnQga3ZtX3hmZXJf
dG9fZ3Vlc3RfbW9kZV9oYW5kbGVfd29yayhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gK3sKPiAr
ICAgICAgIGludCByID0geGZlcl90b19ndWVzdF9tb2RlX2hhbmRsZV93b3JrKCk7Cj4gKwo+ICsg
ICAgICAgaWYgKHIpIHsKPiArICAgICAgICAgICAgICAgV0FSTl9PTl9PTkNFKHIgIT0gLUVJTlRS
KTsKPiArICAgICAgICAgICAgICAga3ZtX2hhbmRsZV9zaWduYWxfZXhpdCh2Y3B1KTsKPiArICAg
ICAgIH0KPiArICAgICAgIHJldHVybiByOwo+ICt9Cj4gICNlbmRpZiAvKiBDT05GSUdfS1ZNX1hG
RVJfVE9fR1VFU1RfV09SSyAqLwo+Cj4gIC8qCj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9lbnRyeS9r
dm0uYyBiL2tlcm5lbC9lbnRyeS9rdm0uYwo+IGluZGV4IGMyZmMzOTgyNDE1Ny4uODcyNjE3NDY4
YjRhIDEwMDY0NAo+IC0tLSBhL2tlcm5lbC9lbnRyeS9rdm0uYwo+ICsrKyBiL2tlcm5lbC9lbnRy
eS9rdm0uYwo+IEBAIC0xLDE3ICsxLDE0IEBACj4gIC8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wCj4KPiAgI2luY2x1ZGUgPGxpbnV4L2VudHJ5LWt2bS5oPgo+IC0jaW5jbHVkZSA8
bGludXgva3ZtX2hvc3QuaD4KPgo+IC1zdGF0aWMgaW50IHhmZXJfdG9fZ3Vlc3RfbW9kZV93b3Jr
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyB0aV93b3JrKQo+ICtzdGF0aWMg
aW50IHhmZXJfdG9fZ3Vlc3RfbW9kZV93b3JrKHVuc2lnbmVkIGxvbmcgdGlfd29yaykKPiAgewo+
ICAgICAgICAgZG8gewo+ICAgICAgICAgICAgICAgICBpbnQgcmV0Owo+Cj4gLSAgICAgICAgICAg
ICAgIGlmICh0aV93b3JrICYgKF9USUZfU0lHUEVORElORyB8IF9USUZfTk9USUZZX1NJR05BTCkp
IHsKPiAtICAgICAgICAgICAgICAgICAgICAgICBrdm1faGFuZGxlX3NpZ25hbF9leGl0KHZjcHUp
Owo+ICsgICAgICAgICAgICAgICBpZiAodGlfd29yayAmIChfVElGX1NJR1BFTkRJTkcgfCBfVElG
X05PVElGWV9TSUdOQUwpKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVFI7
Cj4gLSAgICAgICAgICAgICAgIH0KPgo+ICAgICAgICAgICAgICAgICBpZiAodGlfd29yayAmIF9U
SUZfTkVFRF9SRVNDSEVEKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHNjaGVkdWxlKCk7Cj4g
QEAgLTI4LDcgKzI1LDcgQEAgc3RhdGljIGludCB4ZmVyX3RvX2d1ZXN0X21vZGVfd29yayhzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxvbmcgdGlfd29yaykKPiAgICAgICAgIHJldHVy
biAwOwo+ICB9Cj4KPiAtaW50IHhmZXJfdG9fZ3Vlc3RfbW9kZV9oYW5kbGVfd29yayhzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUpCj4gK2ludCB4ZmVyX3RvX2d1ZXN0X21vZGVfaGFuZGxlX3dvcmsodm9p
ZCkKPiAgewo+ICAgICAgICAgdW5zaWduZWQgbG9uZyB0aV93b3JrOwo+Cj4gQEAgLTQ0LDYgKzQx
LDYgQEAgaW50IHhmZXJfdG9fZ3Vlc3RfbW9kZV9oYW5kbGVfd29yayhzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUpCj4gICAgICAgICBpZiAoISh0aV93b3JrICYgWEZFUl9UT19HVUVTVF9NT0RFX1dPUksp
KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPgo+IC0gICAgICAgcmV0dXJuIHhmZXJfdG9f
Z3Vlc3RfbW9kZV93b3JrKHZjcHUsIHRpX3dvcmspOwo+ICsgICAgICAgcmV0dXJuIHhmZXJfdG9f
Z3Vlc3RfbW9kZV93b3JrKHRpX3dvcmspOwo+ICB9Cj4gIEVYUE9SVF9TWU1CT0xfR1BMKHhmZXJf
dG9fZ3Vlc3RfbW9kZV9oYW5kbGVfd29yayk7Cj4gLS0KPiAyLjQyLjAuNDU5LmdlNGUzOTZmZDVl
LWdvb2cKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
