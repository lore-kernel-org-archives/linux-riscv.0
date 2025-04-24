Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385D8C369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 13:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q1RxwuMtNJA6HGDplOdQSzsOaiMwFBxRwMznKpB2rns=; b=e+TMcDNyQKSdPo
	YwKx+Oc6X42CrmahmeeIPF0ou22b4kGcJuUHT03f5cIuBg30QLYPk520Qx8KrughY5niNESDf+Mw0
	lT5BbkdXAbwt7YOPixjbn4S0pOKcEzVvcjjPhDueUnUa9fnC4Ib0zA1wk5jC6j/m5Nh54GwhOxEbE
	iH3MJpagLwGY+qZ30hPrLmFnAaXsWTZCWKsSBLBLDvenQFS4mYVxYiZKo84AKRhHLZFHbAmZtZae/
	0kCo2WuSxBtuNXV7xlLjyNjkY3w8PibdBKAJW7w6vfgGh2lPhc9rM5W+dzsyxb1rMLjpYqCaYfngY
	VcjFsPImAu0gWh1aPuiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wnf-0000000EDbr-0Cyt;
	Thu, 24 Apr 2025 13:39:35 +0000
Received: from mail-wr1-f44.google.com ([209.85.221.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vVL-0000000E08t-1VTQ
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 12:16:36 +0000
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39127effa72so126767f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 05:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745496993; x=1746101793; darn=lists.infradead.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byLZxcTmkHUnhPkEGnhkt8kzHy94FpcWiEA8cXwsuq0=;
        b=QG8WBJYvT6Cofnx/U1ohCKTGrZHpA8mLj0oxJ26epWmLh17Uor5yMjhdd312qqD6LC
         K9TrxJ3eVU6Ee0muJzXGRTXD+NoyV/Of9Ihpl8HjQDGBbNJRqr1AyHY72d3A3ZxV8+h1
         4I9dkp7TchSIsONUMG0O826QgKotsCjhroguief5Cd1LnxtSmrQE8IP5ZmTHaTmZ7jd6
         TnmvfDK5ZnWZXY0nkrI9kjbzCDfyGFaoWPWFWHXu0U9xUn3qj+yX2bZyiZCGBF3Ie4BF
         sEJUXvekrjMOQnx6IHywm10eL4SPguoEwLmpW48eXAbjRWguC0Tf+K2f6Ya4+bg6Ht6v
         3GRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745496993; x=1746101793;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=byLZxcTmkHUnhPkEGnhkt8kzHy94FpcWiEA8cXwsuq0=;
        b=c1vkn4pdRJHClBECElaqswPx1m0MD3WsWkir1Q688Qj6koy2HakUnBrCowxagZrSoj
         47XL8noJbHOjjyFShrhrJrG+Ir7RSbAq5D8JvkhzoyQJYQHZqV00j+RJNRBN9cOCdHUf
         6KRjys0GS4QrJivOMwf6ETp7ap4Sz7bXAc5le7a8k7d8Pid7qTkvG3XdWDxnDcbTqOce
         IzTLp1QdRBvfvCE1p7UcX+00HbFZrnv0N50WjxVkZFbgFKfb5LHgFcKw/k2T+C3EkAJ3
         rX5wBdH9J+rabEKhPpolEuwNra30HO0KA46OKHEdAbalTwv4GUfRj+anlXxdXbYuBChg
         MsoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaTqt/QEIWQ6Snxx0+UEaXdNErrMUH4upjBpc0jad8hhMZb7OBO6SVD+Ssy6eKpxSifdRxo27A861HpA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXDidNPZqV+ObekkeQKNEubdx9CUb86d+DUT5aovSnAJL8sWYd
	yTj2jl+5TxbUYgAusAPNeZ0X+SFK5qTUHsiaJGco40VhkL9rmPz4y2cy6/38XmI=
X-Gm-Gg: ASbGncvIksexm5i+nQtfFfNBnDYsm21giKn9Be2yaA1RRsvQUZfmr4YCtXDCEOiYUrt
	8h+gzjAK+5UyUxW/gz3uOZ7a9BxCrjlNcbrNKbYED4HPufAtJVU7lipfw7oaQlxQ+6RIZqD8E8U
	yvcBj9+Z+QmM0WYBCcswqro9HiTJsuQPK5gVx49T3vs+d7FJDquVo8NKE2iReWE833GdZhn2A86
	NpNQidZlvInMqMjiUl+y3iOFWcQBfO3QGeC015KmLNXy0eMKS7GeS7GIkRUs40MzugeymCg/5HM
	bJfjB6Hc+iej13jkbli7ZqXOxz3iHhA8xbC7WYfDmwzWDdpS
X-Google-Smtp-Source: AGHT+IERZA3DYVew3V/bn5OiODM5GwUm1JM3y/BJyY+6CSbEdsIoN7nn+jjX5wED4r1h6h8dKZG5oA==
X-Received: by 2002:a05:6000:40da:b0:39c:12ce:697 with SMTP id ffacd0b85a97d-3a06cf5cb78mr706514f8f.7.1745496993026;
        Thu, 24 Apr 2025 05:16:33 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:b30c:ee4d:9e10:6a46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d5326casm1929903f8f.64.2025.04.24.05.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 05:16:32 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 24 Apr 2025 14:16:32 +0200
Message-Id: <D9EV1K8ZQQJR.20CRTYLQBN9UE@ventanamicro.com>
Cc: "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar"
 <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, "Andrew Morton" <akpm@linux-foundation.org>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, "Vlastimil Babka" <vbabka@suse.cz>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Conor Dooley" <conor@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Arnd Bergmann" <arnd@arndb.de>, "Christian Brauner" <brauner@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Oleg Nesterov" <oleg@redhat.com>,
 "Eric Biederman" <ebiederm@xmission.com>, "Kees Cook" <kees@kernel.org>,
 "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan" <shuah@kernel.org>, "Jann
 Horn" <jannh@google.com>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arch@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <alistair.francis@wdc.com>, <richard.henderson@linaro.org>,
 <jim.shu@sifive.com>, <andybnac@gmail.com>, <kito.cheng@sifive.com>,
 <charlie@rivosinc.com>, <atishp@rivosinc.com>, <evan@rivosinc.com>,
 <cleger@rivosinc.com>, <alexghiti@rivosinc.com>, <samitolvanen@google.com>,
 <broonie@kernel.org>, <rick.p.edgecombe@intel.com>, "Zong Li"
 <zong.li@sifive.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Deepak Gupta" <debug@rivosinc.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v12 05/28] riscv: usercfi state for task and
 save/restore of CSR_SSP on trap entry/exit
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-5-e51202b53138@rivosinc.com>
 <D92WQWAUQYY4.2ED8JAFBDHGRN@ventanamicro.com>
 <aAmEnK0vSgZZOORL@debug.ba.rivosinc.com>
In-Reply-To: <aAmEnK0vSgZZOORL@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_051635_393005_BAA463D7 
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

MjAyNS0wNC0yM1QxNzoyMzo1Ni0wNzowMCwgRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5j
b20+Ogo+IE9uIFRodSwgQXByIDEwLCAyMDI1IGF0IDAxOjA0OjM5UE0gKzAyMDAsIFJhZGltIEty
xI1tw6HFmSB3cm90ZToKPj4yMDI1LTAzLTE0VDE0OjM5OjI0LTA3OjAwLCBEZWVwYWsgR3VwdGEg
PGRlYnVnQHJpdm9zaW5jLmNvbT46Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwv
ZW50cnkuUyBiL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKPj4+IEBAIC0xNDcsNiArMTQ3LDIw
IEBAIFNZTV9DT0RFX1NUQVJUKGhhbmRsZV9leGNlcHRpb24pCj4+Pgo+Pj4gIAlSRUdfTCBzMCwg
VEFTS19USV9VU0VSX1NQKHRwKQo+Pj4gIAljc3JyYyBzMSwgQ1NSX1NUQVRVUywgdDAKPj4+ICsJ
LyoKPj4+ICsJICogSWYgcHJldmlvdXMgbW9kZSB3YXMgVSwgY2FwdHVyZSBzaGFkb3cgc3RhY2sg
cG9pbnRlciBhbmQgc2F2ZSBpdCBhd2F5Cj4+PiArCSAqIFplcm8gQ1NSX1NTUCBhdCB0aGUgc2Ft
ZSB0aW1lIGZvciBzYW5pdGl6YXRpb24uCj4+PiArCSAqLwo+Pj4gKwlBTFRFUk5BVElWRSgibm9w
OyBub3A7IG5vcDsgbm9wIiwKPj4+ICsJCQkJX19zdHJpbmdpZnkoCQkJXAo+Pj4gKwkJCQlhbmRp
IHMyLCBzMSwgU1JfU1BQOwlcCj4+PiArCQkJCWJuZXogczIsIHNraXBfc3NwX3NhdmU7CVwKPj4+
ICsJCQkJY3NycncgczIsIENTUl9TU1AsIHgwOwlcCj4+PiArCQkJCVJFR19TIHMyLCBUQVNLX1RJ
X1VTRVJfU1NQKHRwKTsgXAo+Pj4gKwkJCQlza2lwX3NzcF9zYXZlOiksCj4+PiArCQkJCTAsCj4+
PiArCQkJCVJJU0NWX0lTQV9FWFRfWklDRklTUywKPj4+ICsJCQkJQ09ORklHX1JJU0NWX1VTRVJf
Q0ZJKQo+Pgo+PihJJ2QgcHJlZmVyIHRoaXMgY2xvc2VyIHRvIHRoZSB1c2VyX3NwIGFuZCBrZXJu
ZWxfc3Agc3dhcCwgaXQncyBicmVha2luZwo+PiB0aGUgZmxvdyBoZXJlLiAgV2UgYWxzbyBhbHJl
YWR5IGtub3cgaWYgd2UndmUgcmV0dXJuZWQgZnJvbSB1c2Vyc3BhY2UKPj4gb3Igbm90IGV2ZW4g
d2l0aG91dCBTUl9TUFAsIGJ1dCByZXVzaW5nIHRoZSBpbmZvcm1hdGlvbiBtaWdodCB0YW5nbGUK
Pj4gdGhlIGxvZ2ljLikKPgo+IElmIENTUl9TQ1JBVENIIHdhcyAwLCB0aGVuIHdlIHdvdWxkIGJl
IGNvbWluZyBmcm9tIGtlcm5lbCBlbHNlIGZsb3cgZ29lcwo+IHRvIGAuTHNhdmVfY29udGV4dGAu
IElmIHdlIHdlcmUgY29taW5nIGZyb20ga2VybmVsIG1vZGUsIHRoZW4gZXZlbnR1YWxseQo+IGZs
b3cgbWVyZ2VzIHRvIGAuTHNhdmVfY29udGV4dGAuCj4KPiBTbyB3ZSB3aWxsIGJlIHNhdmluZyBD
U1JfU1NQIG9uIGFsbCBrZXJuZWwgLS0gPiBrZXJuZWwgdHJhcCBoYW5kbGluZy4gVGhhdAo+IHdv
dWxkIGJlIHVubmVjZXNzYXJ5LiBJSVJDLCB0aGlzIHdhcyBvbmUgb2YgdGhlIGZpcnN0IHJldmll
dyBjb21tZW50cyBpbgo+IGVhcmx5IFJGQyBzZXJpZXMgb2YgdGhlc2UgcGF0Y2ggc2VyaWVzICh0
byBub3QgdG91Y2ggQ1NSX1NTUCB1bi1uZWNlc3NhcmlseSkKPgo+IFdlIGNhbiBhdm9pZCB0aGF0
IGJ5IGVuc3VyaW5nIHdoZW4gd2UgYnJhbmNoIGJ5IGRldGVybWluaW5nIGlmIHdlIGFyZSBjb21p
bmcKPiBmcm9tIHVzZXIgdG8gc29tZXRoaW5nIGxpa2UgYC5Mc2F2ZV9zc3BgIHdoaWNoIGV2ZW50
dWFsbHkgbWVyZ2VzIGludG8KPiAiLkxzYXZlX2NvbnRleHQiLiBBbmQgaWYgd2Ugd2VyZSBjb21p
bmcgZnJvbSBrZXJuZWwgdGhlbiB3ZSB3b3VsZCBicmFuY2ggdG8KPiBgLkxzYXZlX2NvbnRleHRg
IGFuZCB0aHVzIHNraXBwaW5nIHNzcCBzYXZlIGxvZ2ljLiBCdXQgIyBvZiBicmFuY2hlcyBpdAo+
IGludHJvZHVjZXMgaW4gZWFybHkgZXhjZXB0aW9uIGhhbmRsaW5nIGlzIGVxdWl2YWxlbnQgdG8g
d2hhdCBjdXJyZW50IHBhdGNoZXMKPiBkby4gU28gSSBkb24ndCBzZWUgYW55IHZhbHVlIGluIGRv
aW5nIHRoYXQuCj4KPiBMZXQgbWUga25vdyBpZiBJIGFtIG1pc3Npbmcgc29tZXRoaW5nLgoKUmln
aHQsIGl0J3MgaGFyZCB0byBhdm9pZCB0aGUgZXh0cmEgYnJhbmNoZXMuCgpJIHRoaW5rIHdlIGNv
dWxkIG1vZGlmeSB0aGUgZW50cnkgcG9pbnQgKFNUVkVDKSwgc28gd2Ugc3RhcnQgYXQKZGlmZmVy
ZW50IHBhdGhzIGJhc2VkIG9uIGtlcm5lbC91c2Vyc3BhY2UgdHJhcCBhbmQgb25seSBqdW1wIG9u
Y2UgdG8gdGhlCmNvbW1vbiBjb2RlLCBsaWtlOgoKICBTWU1fQ09ERV9TVEFSVChoYW5kbGVfZXhj
ZXB0aW9uX2tlcm5lbCkKICAgIC8qIGtlcm5lbCBzZXR1cCBtYWdpYyAqLwogICAgaiBoYW5kbGVf
ZXhjZXB0aW9uX2NvbW1vbgogIFNZTV9DT0RFX1NUQVJUKGhhbmRsZV9leGNlcHRpb25fdXNlcikK
ICAgIC8qIHVzZXJzcGFjZSBzZXR1cCBtYWdpYyAqLwogIGhhbmRsZV9leGNlcHRpb25fY29tbW9u
OgoKVGhpcyBpcyBub3QgYSBzdWdnZXN0aW9uIGZvciB0aGlzIHNlcmllcy4gIEkgd291bGQgYmUg
cGVyZmVjdGx5IGhhcHB5CndpdGgganVzdCBhIGNsZWFuZXIgY29kZS4KCldvdWxkIGl0IGJlIHBv
c3NpYmxlIHRvIGhpZGUgdGhlIEFMVEVSTkFUSVZFIHVnbGluZXNzIGJlaGluZCBhIG1hY3JvIGFu
ZAptb3ZlIGl0IG91dHNpZGUgdGhlIGNvZGUgYmxvY2sgdGhhdCBzYXZlcyBwdF9yZWdzPwoKVGhh
bmtzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
