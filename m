Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D38E77180
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 08:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XFQbPHkwCzHBEl4KN4uIoF9W3oxSddxtpeDSW4gJQ54=; b=fvYDm8u/LleBIP
	02NOoe6ID3GHz5VL8Lg3aVU9ozb7ZYP7Whn7ClhIGwAqP+x/pbZalSBdT+vqG8TnH77LLutiYABWp
	RGHIJO1P8BT862pCyXpvVeyl8Ju20QtrYPTiWVqa7ySEcihDBkzNIkRxyvUlFNHK/yfBjC+Zlv3lY
	POstnWWQfos9OgSMXZb7ZTsYa2y9WrqbXaylnMge/tp4tdzQOEBJ03y4E8wywiVXs1QMLeGxD9zVn
	9YEyGzA5WcfZEUFgor29vx1RWpi6B/efbsRaXDtXroyPQcdbLHNK5pSkSy377+kP/WAvK8Std8c1G
	BmHLlKr+x7kMKtB4WYnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIJE-0000000EFz4-1OHL;
	Wed, 11 Dec 2024 08:43:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIIA-0000000EFpN-0T3n;
	Wed, 11 Dec 2024 08:41:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8B83DA41FD3;
	Wed, 11 Dec 2024 08:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 519F9C4CEEE;
	Wed, 11 Dec 2024 08:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733906516;
	bh=11k4EF5OtV96AkBGLTd+hH0qKo61NlPe3GiJ6SKgOkU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pm8GQBRyxvJBdkrJvB5xqnkaQDK3pQH87o2d08mKRohKRhHeZREIXkL0k4nqUt2cm
	 hPk5xQc3DdC83EUlt0uuVyRLixOlSM/eq/88PsXvN7dVJqm/xljHvKMIBC1C/gFBHQ
	 P8aJVl5g1ko3s6+ndoUJmGaN+L+ce0g8sKQS3+1C6YhCPXYds31oE4aUehqq1aqt3U
	 rq15OYEnt6oohrzKUah8SL1L/YUO6y2qYlI1J5WAyK9LQzlpbzO/tP8WJBI/FgEn3F
	 ndJ1ytAS7pYHzrUy+wcnCubZp+bJEiXgPYiWJqv5+94lJqn7J9A9Qwoszdch4dNaPq
	 LIrJbvVowJqtg==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d3d479b1e6so5819948a12.2;
        Wed, 11 Dec 2024 00:41:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9q4IUn55RxgjZ3L65mRpduz7b8RQRFfda1ic16uwzgAt2QacylYZMyc0b7NmfJqnejhR7ecna25+f2+Q=@lists.infradead.org, AJvYcCWvVcKNNsjCV+oDJUESxvyt8OzWL9S1JmY8wSgfEq89IO/DccsVirtLhIHf0ACdPceRV9EjSsL6ItrI+TBIphF2@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi5ZDDFomjZX3SaMf7zhFT7Xz9RwpVyPEkZMPJAD5q1HMXe2R2
	XUWPrcjpvMe+DfXPJOVNTBNw4jXk/Dev6yEhF4D9RoTaUOzhKa7DtQd+V4z2gisAfxGX4k1PNzB
	VqoyRXPXJSHejl8lEGINUylzPSPI=
X-Google-Smtp-Source: AGHT+IGBqIIVL8M8gd1swf2r/NXYFCJNyY0lS3KZFrZ3efUdXDZaZlzPpq5HkoxLe8d8jwzVBsIy563EXgXKfOfsJeo=
X-Received: by 2002:a05:6402:2105:b0:5d0:cfad:f71 with SMTP id
 4fb4d7f45d1cf-5d43316510amr4128041a12.32.1733906514580; Wed, 11 Dec 2024
 00:41:54 -0800 (PST)
MIME-Version: 1.0
References: <20241210001802.228725-1-fujita.tomonori@gmail.com> <20241210001802.228725-5-fujita.tomonori@gmail.com>
In-Reply-To: <20241210001802.228725-5-fujita.tomonori@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 11 Dec 2024 16:41:42 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7BxE7xeA982Pr4PFxgfNpgXs6H4OZ2LydmYAtYjvYNaw@mail.gmail.com>
Message-ID: <CAAhV-H7BxE7xeA982Pr4PFxgfNpgXs6H4OZ2LydmYAtYjvYNaw@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] loongarch/bug: Add ARCH_WARN_ASM macro for
 BUG/WARN asm code sharing with Rust
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	x86@kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, peterz@infradead.org, hpa@zytor.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	catalin.marinas@arm.com, will@kernel.org, kernel@xen0n.name, 
	tangyouling@loongson.cn, hejinyang@loongson.cn, yangtiezhu@loongson.cn, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_004158_273712_90744152 
X-CRM114-Status: GOOD (  14.99  )
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

SGksIEZVSklUQSwKCk9uIFR1ZSwgRGVjIDEwLCAyMDI0IGF0IDg6MTnigK9BTSBGVUpJVEEgVG9t
b25vcmkKPGZ1aml0YS50b21vbm9yaUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQWRkIG5ldyBBUkNI
X1dBUk5fQVNNIG1hY3JvIGZvciBCVUcvV0FSTiBhc3NlbWJseSBjb2RlIHNoYXJpbmcgd2l0aAo+
IFJ1c3QgdG8gYXZvaWQgdGhlIGR1cGxpY2F0aW9uLgo+Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2Vz
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogRlVKSVRBIFRvbW9ub3JpIDxmdWppdGEudG9tb25vcmlAZ21h
aWwuY29tPgo+IC0tLQo+ICBhcmNoL2xvb25nYXJjaC9pbmNsdWRlL2FzbS9idWcuaCB8IDMxICsr
KysrKysrKysrKysrKysrKysrKysrKysrKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDI4IGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9sb29uZ2FyY2gv
aW5jbHVkZS9hc20vYnVnLmggYi9hcmNoL2xvb25nYXJjaC9pbmNsdWRlL2FzbS9idWcuaAo+IGlu
ZGV4IDA4Mzg4ODc2YWRlNC4uMjM0M2M0MjI2NTk1IDEwMDY0NAo+IC0tLSBhL2FyY2gvbG9vbmdh
cmNoL2luY2x1ZGUvYXNtL2J1Zy5oCj4gKysrIGIvYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20v
YnVnLmgKPiBAQCAtMjEsMTQgKzIxLDIxIEBACj4gICNpZm5kZWYgQ09ORklHX0dFTkVSSUNfQlVH
Cj4gICNkZWZpbmUgX19CVUdfRU5UUlkoZmxhZ3MpCj4gICNlbHNlCj4gLSNkZWZpbmUgX19CVUdf
RU5UUlkoZmxhZ3MpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArCj4g
KyNkZWZpbmUgX19CVUdfRU5UUllfU1RBUlQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKPiAgICAgICAgICAgICAgICAgLnB1c2hzZWN0aW9uIF9fYnVnX3RhYmxlLCAiYXci
OyAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgICAgICAgICAuYWxpZ24gMjsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAgICAxMDAwMDogIC5sb25nIDEw
MDAxZiAtIC47ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAtICAgICAgICAgICAg
ICAgX0JVR1ZFUkJPU0VfTE9DQVRJT04oX19GSUxFX18sIF9fTElORV9fKSAgICAgICAgXAo+IC0g
ICAgICAgICAgICAgICAuc2hvcnQgZmxhZ3M7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCj4gKwo+ICsjZGVmaW5lIF9fQlVHX0VOVFJZX0VORCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAgICAgICAgICAgLnBvcHNlY3Rp
b247ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgMTAwMDE6
Cj4gKwo+ICsjZGVmaW5lIF9fQlVHX0VOVFJZKGZsYWdzKSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgIF9fQlVHX0VOVFJZX1NUQVJUICAgICAg
ICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgIF9CVUdWRVJCT1NFX0xPQ0FUSU9O
KF9fRklMRV9fLCBfX0xJTkVfXykgICAgICAgIFwKPiArICAgICAgICAgICAgICAgLnNob3J0IGZs
YWdzOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAg
ICBfX0JVR19FTlRSWV9FTkQKPiAgI2VuZGlmCj4KPiAgI2RlZmluZSBBU01fQlVHX0ZMQUdTKGZs
YWdzKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+IEBAIC01NSw2ICs2Miwy
NCBAQCBkbyB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXAo+ICAgICAgICAgdW5yZWFjaGFibGUoKTsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4gIH0gd2hpbGUgKDApCj4KPiArI2lmZGVmIENPTkZJR19E
RUJVR19CVUdWRVJCT1NFCj4gKyNkZWZpbmUgX19CVUdfTE9DQVRJT05fU1RSSU5HKGZpbGUsIGxp
bmUpICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICIubG9uZyAiIGZpbGUgIi0gLjsi
ICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICIuc2hvcnQgIiBsaW5lICI7
Igo+ICsjZWxzZQo+ICsjZGVmaW5lIF9fQlVHX0xPQ0FUSU9OX1NUUklORyhfZmlsZSwgX2xpbmUp
Cj4gKyNlbmRpZgpDYW4gd2UgdXNlIGZpbGUgYW5kIGxpbmUgaW5zdGVhZCBvZiBfZmlsZSBhbmQg
X2xpbmUsIHdoaWNoIGlzIHRoZSBzYW1lCmFzIHRoZSBDT05GSUdfREVCVUdfQlVHVkVSQk9TRSBj
YXNlPwoKPiArCj4gKyNkZWZpbmUgX19CVUdfRU5UUllfU1RSSU5HKGZpbGUsIGxpbmUsIGZsYWdz
KSAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgIF9fc3RyaW5naWZ5KF9fQlVHX0VOVFJZX1NU
QVJUKSAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgIF9fQlVHX0xPQ0FUSU9OX1NUUklORyhm
aWxlLCBsaW5lKSAgICAgICBcCj4gKyAgICAgICAgICAgICAgICIuc2hvcnQgIiBmbGFncyAiOyIg
ICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgIF9fc3RyaW5naWZ5KF9fQlVH
X0VOVFJZX0VORCkKPiArCj4gKyNkZWZpbmUgQVJDSF9XQVJOX0FTTShmaWxlLCBsaW5lLCBmbGFn
cywgc2l6ZSkgICAgICAgICBcCj4gKyAgICAgICBfX0JVR19FTlRSWV9TVFJJTkcoZmlsZSwgbGlu
ZSwgZmxhZ3MpICAgICAgICAgICBcCj4gKyAgICAgICBfX3N0cmluZ2lmeShicmVhayBCUktfQlVH
KSAiOyIKPiArCkNhbiB3ZSB1c2UgdGhlIHNhbWUgaW5kZW50YXRpb24gaW4gdGhpcyBmaWxlPwoK
SHVhY2FpCgo+ICAjZGVmaW5lIEhBVkVfQVJDSF9CVUcKPgo+ICAjaW5jbHVkZSA8YXNtLWdlbmVy
aWMvYnVnLmg+Cj4gLS0KPiAyLjQzLjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
