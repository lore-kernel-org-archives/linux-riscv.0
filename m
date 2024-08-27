Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05C1C52D6F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 08:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ou1o+yuc5OgLO+pFCqiLcwE+PTsjkcOU2YNsmUPcBl4=; b=JS2tTmPg9E5FmD
	qUAn/mw/AE4Juar2FUQQbYuk/OS+Cg+7ouSoI2HnCkLzJzVl3+BsIoXATu+9c+HzvR10u950V6Stl
	TOBgLuGbRFoRgy7q5FjV4AnizXbL44GGgd1qvpOdfuOSenfBBzJZzAq1AnUSHpSUeCq+iYOzDRRAC
	48ekmWPdhkKLmxBrj/mnasEKoEK9L0bS5wVVys8b+l4RZ8a2jE5qraRbP3vJMikmjG2jCtgpyLO4B
	aS9laXj8GmOE9s2Z4gHO5T7+yc/0+S7Yl2A3AkQNyAeY7UgqQ1oPOt+2zILmRUeC4xcyQM+d4OuaX
	ejrOKLp9buVgEUTiK9Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sirA5-0000000AKGs-1dC3;
	Tue, 27 Aug 2024 08:02:45 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sirA3-0000000AKGF-0D8v
	for linux-riscv@lists.infradead.org;
	Tue, 27 Aug 2024 08:02:44 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5bed83489c3so5814843a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 27 Aug 2024 01:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724745761; x=1725350561; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aBms7y/tBFsZy50lNtASZmPiwThWbZhDKwKfTMeuMMA=;
        b=fM1ybHBChkQTZet1VEQ/uPx9Wq6XLijUcN3q4gOTWASAzJTabJGXbQV5IeUh+reczv
         G/BFRLuSPJSrj7wnRkIPUl2BzVb6MQqbvWuB5YzcQvWQkIXK0cgfoMREiiGZ3oIx9ME8
         o9f1imNRJDsiQYWlyjSQxRr5l8oj3Vc/GYkubsLl0HDJxcNS7baFZDkvbX2gsBuhkg2K
         ztFJxYSRl+GUkF3Eo+214pr1hHoo8z1EYlOx2R5a0yrBIL/DIoIFKTCiAU6/k29pQXVl
         hT3IIoCuzzwwDxr34VieyVnac0r0+WfkSB7P22eSgSjE9O1mITbLvS1YVwXzjplLrMl/
         G1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724745761; x=1725350561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aBms7y/tBFsZy50lNtASZmPiwThWbZhDKwKfTMeuMMA=;
        b=YhfYXjGDX6lM9pJtaSLF1bXJRfIp7begrDm33mjg4e6Yl3XL5kVBvGtZIKjZM9S4jS
         CuCXyjbSuLWbpnj/KSC0Dbo8/Truj2MpfSvpH9zJaEsrs0UleqPOOHV9xSB7GFOA1rEE
         lBvuVfTo2L6EpEA3PCTYdHCOmekqwkp6OvOlsKl9RLSoyBLv4mgXWzKl7CFpXA1kaFBf
         rl8q8DsDn1CJ0LmR2GbRWS/DHwQZOqaGHMv1TMIP4kavwpoBVV9bFFgCmBGZmR/wqK0s
         ZlW/7MQwUuL7hqL6iRd2N62erzrgyW8dloAfokwgAMjaJBo2iU21x8PvH8YCvzdH5UJK
         bnbw==
X-Forwarded-Encrypted: i=1; AJvYcCVFKTerQ4gkhVVbw4TpYvQs6yjCSQO6xsbHCU2JxEIhfe8/TnwVL0T7/TLbDeoZ7qtXGtwPBG/2SF7Ffg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxjm0XaE7b62dRLaMKrETK8RziKIXhjj1/LEJNJAyM/hotRQdy1
	g86pybUmkb4ryeJ1LAzEzbZXxQbFVH/EPZ6vZL2W+aqd2fhItDfMEZxi0YmZyDwm2VBVnNweRui
	yjIfPaREm0FfyIdg1nwNEhbvwa9tAfxiLP0wtEQ==
X-Google-Smtp-Source: AGHT+IEPKjzBgfiAk9G0dnZjYH9HkHNAZ5iX4+y8YvtQs+BwlAOu22sCjko/Iouwb9iDtzPGYnZU+k2kKs5nhqRDXTc=
X-Received: by 2002:a17:907:9491:b0:a7a:b643:654f with SMTP id
 a640c23a62f3a-a86e39f9082mr158372366b.15.1724745761303; Tue, 27 Aug 2024
 01:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
 <20240731072405.197046-14-alexghiti@rivosinc.com> <20240731-ce25dcdc5ce9ccc6c82912c0@orel>
 <CAHVXubgtD_nDBL2H-MYb9V+3jLBoszz8HAZ2NTTsiS2wR6aPDQ@mail.gmail.com>
 <6f1bcc9b-1812-4e8c-9050-a750bfadd008@ghiti.fr> <CAJF2gTS4L6=HE_-9rgn3L8+6R7C4Jx=QgCkvOBhQHdHVGzr5MA@mail.gmail.com>
 <20240821-6befd27b90a9e9ff89f4a277@orel>
In-Reply-To: <20240821-6befd27b90a9e9ff89f4a277@orel>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 27 Aug 2024 10:02:30 +0200
Message-ID: <CAHVXubiy3=bEf29qpzGX0MoBXkjBy38p9Xhz7yRYN5Sr3qRw0g@mail.gmail.com>
Subject: Re: [PATCH v4 13/13] riscv: Add qspinlock support
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Guo Ren <guoren@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_010243_113430_368B3566 
X-CRM114-Status: GOOD (  19.32  )
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

SGkgZHJldywKCk9uIFdlZCwgQXVnIDIxLCAyMDI0IGF0IDI6MTjigK9QTSBBbmRyZXcgSm9uZXMg
PGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIFNhdCwgQXVnIDE3LCAyMDI0
IGF0IDAxOjA4OjM0UE0gR01ULCBHdW8gUmVuIHdyb3RlOgo+IC4uLgo+ID4gPiBTbyBJIGhhdmUg
anVzdCBjaGVja2VkIHRoZSBzaXplIG9mIHRoZSBqdW1wIHRhYmxlIHNlY3Rpb246Cj4gPiA+Cj4g
PiA+ICogZGVmY29uZmlnOgo+ID4gPgo+ID4gPiAtIHRpY2tldDogMjY5MjggYnl0ZXMKPiA+ID4g
LSBjb21ibzogMjgzMjAgYnl0ZXMKPiA+ID4KPiA+ID4gU28gdGhhdCdzIGEgfjUlIGluY3JlYXNl
Lgo+ID4gPgo+ID4gPiAqIHVidW50dSBjb25maWcKPiA+ID4KPiA+ID4gLSB0aWNrZXQ6IDEwNzg0
MCBieXRlcwo+ID4gPiAtIGNvbWJvOiAxNzQ3NTIgYnl0ZXMKPiA+ID4KPiA+ID4gQW5kIHRoYXQn
cyBhIH42MiUgaW5jcmVhc2UuCj4gPiBUaGUgc2l6ZSBvZiB0aGUganVtcCB0YWJsZSBzZWN0aW9u
IGhhcyBpbmNyZWFzZWQgZnJvbSA1JSB0byA2MiUuIEkKPiA+IHRoaW5rIHNvbWUgY29uZmlndXJh
dGlvbiB0cmlnZ2VycyB0aGUganVtcCB0YWJsZSdzIGRlYnVnIGNvZGUuIElmIGl0J3MKPiA+IG5v
dCBhIGRlYnVnZ2luZyBjb25maWd1cmF0aW9uLCB0aGF0J3MgYSBidWcgb2YgdGhlIFVidW50dSBj
b25maWcuCj4KPiBBbmQgSSBqdXN0IHJlbWVtYmVyZWQgd2Ugd2FudGVkIHRvIGNoZWNrIHdpdGgg
Q09ORklHX0NDX09QVElNSVpFX0ZPUl9TSVpFCgpIZXJlIHdlIGdvIQoKVGhlIHNpemUgb2YgdGhl
IGp1bXAgdGFibGUgc2VjdGlvbjoKCiogZGVmY29uZmlnOgoKLSB0aWNrZXQ6IDEyMTc2IGJ5dGVz
Ci0gY29tYm86IDEzMTY4IGJ5dGVzCgpTbyB0aGF0J3MgYSB+OCUgaW5jcmVhc2UuCgoqIHVidW50
dSBjb25maWcKCi0gdGlja2V0OiAgIDczOTIwIGJ5dGVzCi0gY29tYm86IDg0NjU2IGJ5dGVzCgpB
bmQgdGhhdCdzIGEgfjE0JSBpbmNyZWFzZS4KClRoaXMgaXMgdGhlIEVMRiBzaXplIGRpZmZlcmVu
Y2UgYmV0d2VlbiB0aWNrZXQgYW5kIGNvbWJvIHNwaW5sb2NrczoKCiogdGlja2V0OiAgIDY5NTkw
Njg3MiBieXRlcwoqIGNvbWJvOiA2OTc1NTg0OTYgYnl0ZXMKClNvIHRoYXQncyBhbiBpbmNyZWFz
ZSBvZiB+MC4yMyUgb24gdGhlIEVMRi4KCkFuZCB0aGUgLnRleHQgc2VjdGlvbiBzaXplOgoKKiB0
aWNrZXQ6ICAgMTAzMjI4MjAgYnl0ZXMKKiBjb21ibzogMTAzMzIxMzYgYnl0ZXMKCkFuZCB0aGF0
J3MgYSB+MC4wOSUgaW5jcmVhc2UhCgpTbyB0aGF0J3MgZXZlbiBiZXR0ZXIgOikKClRoYW5rcyBm
b3IgYXNraW5nIQoKQWxleAoKPgo+IFRoYW5rcywKPiBkcmV3Cj4KPiA+Cj4gPiA+Cj4gPiA+IFRo
aXMgaXMgdGhlIEVMRiBzaXplIGRpZmZlcmVuY2UgYmV0d2VlbiB0aWNrZXQgYW5kIGNvbWJvIHNw
aW5sb2NrczoKPiA+ID4KPiA+ID4gKiB0aWNrZXQ6IDc3NjkxNTU5MiBieXRlcwo+ID4gPiAqIGNv
bWJvOiA3ODY5NTg5NjggYnl0ZXMKPiA+ID4KPiA+ID4gU28gdGhhdCdzIGFuIGluY3JlYXNlIG9m
IH4xLjMlIG9uIHRoZSBFTEYuCj4gPiA+Cj4gPiA+IEFuZCB0aGUgLnRleHQgc2VjdGlvbiBzaXpl
Ogo+ID4gPgo+ID4gPiAqIHRpY2tldDogMTIyOTA5NjAgYnl0ZXMKPiA+ID4gKiBjb21ibzogMTIz
NjY2NDQgYnl0ZXMKPiA+ID4KPiA+ID4gQW5kIHRoYXQncyBhIH4wLjYlIGluY3JlYXNlIQo+ID4g
Pgo+ID4gPiBGaW5hbGx5LCBJJ2Qgc2F5IHRoZSBpbXBhY3QgaXMgdmVyeSBsaW1pdGVkIDopCj4g
PiA+Cj4gPiA+IFRoYW5rcywKPiA+ID4KPiA+ID4gQWxleAo+ID4gPgo+ID4gPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
