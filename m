Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47237C35FF3
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 07:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YoM3gROv2vzzpdc6I7CsqquGbCqexw2KjwhoksxfrAE=; b=P+vtzcEH9iKMw0
	rgv2KoXSLHcZW07CIVUBWtSj+r6hsPcMlItVAwn3t+KAUS2ufWNRFtD0Kve5Cd6sQ+Pr27f8Q9K6m
	zd20qXi4z4zy6SdWyvDQOrcy/0t6u7I/6cqlIELnbT9F6jH4/DohObLRBMNJgU9dLOcaSUb4l3XWU
	J/GgW5sy+KrfDo+/rXQnOMPUOqE8plDi7ZX2bt8mD/s3g4jQMXSPxqTg06jON9BIBSBI/meGPzTIR
	pILNlgdabttj1tb02D5jyeRuhDTwp3cHfdnpg1DxElE4L8uaERJNkJYmBrMXwbkPjCAoV3tucDbVm
	lYGYcwUiPTOOTGzf9sAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvX7i-0000000E9ei-3Pn7;
	Fri, 21 Mar 2025 07:48:58 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvWv3-0000000E7BT-0Dd7
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 07:35:55 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-39127effa72so192677f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Mar 2025 00:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742542551; x=1743147351; darn=lists.infradead.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uE0YN48K2zRXVt+YdSQ/RPd3ayIjfmSlm7kfHTz7O6c=;
        b=ipZxRw47YVM5W11+w20kqZ5WBwoWAaYIM4mqfUFvOpfw2yJ7lcCpANkQMBotU1oURu
         kkeyK0vlNHtjDT0sMfkmJJUJxCjKp8RVkSZjL+lbg0GssNmIoEPoeBdckA7iUQvkE27M
         hIfUb+nEr6ZMEJSwG58x1pJ2ESeKSTqmlTT12WPdUNmjjoioVuD/PLp3ENNCCs0RAuLy
         bxeCWm2ARBbWJ50qKc3NJTyPGoOrCHGFoIfBvNJRtt3jmuL64aeN5qWz73YJemoKoUAU
         iYTQ4Povl6ukABRZb8OmII+CmekiyLL2JGAFkYPjFZeVYUrHW1KYJ3MT3tB4vLvHGPza
         sZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742542551; x=1743147351;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uE0YN48K2zRXVt+YdSQ/RPd3ayIjfmSlm7kfHTz7O6c=;
        b=boC5t648Qtqjlr4UI5WLPnNM1mapsCrJC1mA1rekx81wtenYlSl8QVbedlCUtvLysb
         XqLo3jL1IGZ5uGmXXHzlqRxUoR0GoXPXt9GPHZHYQwjsP9Os//6NF3WYo8idzgZ8fFQd
         OrIr8wuM3Gz5R7DzC5cnPyv08pN3DB5X9NffMgEuPzsJCCBr4uUkc0avokpf3cdZPTin
         km9lcGBomOwTwyl9RXIPvK9xZ+W0zFZ/2NMvxJXEJ2irXFbHBPOer4ye68fBYN/PmInn
         sV+bll2xhEoPYnFYWTrDUl8FURzY6DLJnK0VtltxjAlt7T1jdudmkCIxmJ4VF3a74nnI
         ucyg==
X-Forwarded-Encrypted: i=1; AJvYcCV6FFF4NzxLTP45ihzLsK7tMYha1MB5zCX9Lh6nZ/d3U3fS3yANfuusWrax1wp3qH+EeNOkHLcwT10i6A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXfa5oYnBmbDGP5WqwzE4FYlMcBipCkimT+rM2HhCrk24Y2qCq
	8oAzrOdDC0lBeFR/FB+2O8hN7VjEj++4fBWm+GlBISMmx+QOUWpt3LKW4xhym5M=
X-Gm-Gg: ASbGncuV2j21Zq6MAR8xbKOONOlE09T5NO4o9/tmDOu3L20EotPYVLN7v6JwWNJzFaV
	tS+bXmk8rXdNejTIqdOGOM06uHvaVqR417kmilgkM5GiqAo17nU90dX4RS7znPsejkd8J7Kfocv
	ChI3vKG+wZOY1s/0PzpdGJ3hX21dP2R9PjwcQjfmyT72vQcDSKLexSxysQHBvi47mdgdOpHKQMr
	btBh+kml8dCjcVwujMFStB9E4AYQlKffsDbxsXUkVDIevyvnHxI/K48bh0WaU3ZdIGwXmxQUVVB
	JBe1o1Vus8Uh73EubCd+1GZaHivw8xK9dKxur6wDRGiDwesEb22g0sj+TSNTeJgnz5ABJTwdjtp
	IP2PTuJ2zvoRkwr4=
X-Google-Smtp-Source: AGHT+IGZStgpQKD6s5SPSh0Un5MoJV2dCYto8osYkw90aX9XoWoskpnSL/J6+EfI/KAtzzUYKMCKnA==
X-Received: by 2002:a05:6000:188f:b0:391:277e:c400 with SMTP id ffacd0b85a97d-3997f941b74mr851925f8f.13.1742542551154;
        Fri, 21 Mar 2025 00:35:51 -0700 (PDT)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b3f7csm1592933f8f.49.2025.03.21.00.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 00:35:50 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 21 Mar 2025 08:35:49 +0100
Message-Id: <D8LRS46QQ2FE.ZF1856CR80JM@ventanamicro.com>
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
Subject: Re: [PATCH v12 22/28] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-22-e51202b53138@rivosinc.com>
 <D8LFQYX4EHF8.2AJ01XL34WK0W@ventanamicro.com>
 <CAKC1njTyiaBkmHvAM8VT_MG4Cdch=H9P8r3C-m-=QQEuzyrRNA@mail.gmail.com>
In-Reply-To: <CAKC1njTyiaBkmHvAM8VT_MG4Cdch=H9P8r3C-m-=QQEuzyrRNA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_003553_092894_231C1DFF 
X-CRM114-Status: GOOD (  17.66  )
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

MjAyNS0wMy0yMFQxNTo0Mjo0NC0wNzowMCwgRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5j
b20+Ogo+IE9uIFRodSwgTWFyIDIwLCAyMDI1IGF0IDM6MTDigK9QTSBSYWRpbSBLcsSNbcOhxZkg
PHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4+Cj4+IDIwMjUtMDMtMTRUMTQ6Mzk6
NDEtMDc6MDAsIERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPjoKPj4gPiBLZXJuZWwg
d2lsbCBoYXZlIHRvIHBlcmZvcm0gc2hhZG93IHN0YWNrIG9wZXJhdGlvbnMgb24gdXNlciBzaGFk
b3cgc3RhY2suCj4+ID4gTGlrZSBkdXJpbmcgc2lnbmFsIGRlbGl2ZXJ5IGFuZCBzaWdyZXR1cm4s
IHNoYWRvdyBzdGFjayB0b2tlbiBtdXN0IGJlCj4+ID4gY3JlYXRlZCBhbmQgdmFsaWRhdGVkIHJl
c3BlY3RpdmVseS4gVGh1cyBzaGFkb3cgc3RhY2sgYWNjZXNzIGZvciBrZXJuZWwKPj4gPiBtdXN0
IGJlIGVuYWJsZWQuCj4+Cj4+IFdoeSBjYW4ndCBrZXJuZWwgYWNjZXNzIHRoZSB1c2VyIHNoYWRv
dyBzdGFjayB0aHJvdWdoIGFuIGFsaWFzZWQgV1IKPj4gbWFwcGluZz8KPgo+IEl0IGNhbiwgYWx0
aG91Z2ggdGhhdCBvcGVucyB1cCBhIGNhbiBvZiB3b3Jtcy4gSWYgdGhpcyBhbHRlcm5hdGluZwo+
IG1hcHBpbmcgaXMgdXNlciBtb2RlCj4gdGhlbiBlbnN1cmluZyB0aGF0IGFub3RoZXIgdGhyZWF0
IGluIHVzZXJzcGFjZSBjYW4ndCB3cml0ZSB0byB0aGlzCj4gYWRkcmVzcyBpbiB0aGlzIHdpbmRv
dwo+IG9mIHNpZ25hbCBoYW5kbGluZy4KClJpZ2h0LCBpdCBtdXN0IG5vdCBiZSB1c2VyIG1vZGUu
Cgo+ICAgICAgICAgICAgICAgICAgICAgQSBrZXJuZWwgYWx0ZXJuYXRlIG1hcHBpbmcgY2FuIGJl
IGNyZWF0ZWQsIGJ1dAo+IHRoYXQgY2FuIGxlYWQgdG8gYWxsCj4gc29ydHMgb2YgcmVxdWlyZW1l
bnRzIG9mIGVuc3VyaW5nIHRoZSBwYWdlIGlzIHBpbm5lZCBkb3duLiBJSVJDLCBJdAo+IGhhcyBi
ZWVuIGRlYmF0ZWQKPiBvbiB4ODYgc2hhZG93IHN0YWNrIG1lcmdlIHRpbWUgYXMgd2VsbCBvbiBo
b3cgYSBmbGFreSBhbGlhcyBtYXBwaW5nIGFwcHJvYWNoIGNhbgo+IGJlY29tZSBhbmQgd2Vha2Vu
IHRoZSB0aHJlYXQgbW9kZWwgaXQgaXMgc3VwcG9zZWQgdG8gcHJvdGVjdCBhZ2FpbnN0LgoKVHJ1
ZS4KCj4gU2ltcGx5IHVzaW5nIGBzc2Ftb3N3YXBgIGlzIHNpbXBsZSBhbmQgc2VydmVzIHRoZSBw
dXJwb3NlLiBFbmFibGluZyBzaGFkb3cgc3RhY2sKPiBhY2Nlc3MgZm9yIHRoZSBrZXJuZWwgZG9l
c24ndCBoYXZlIGFueSBhZHZlcnNlIGVmZmVjdCBvbiB0aGUga2VybmVsLgoKTWFrZXMgc2Vuc2Uu
ICBXZSBqdXN0IGRlcGVuZCBvbiBhbiBleHRyYSBmZWF0dXJlLCBiZWNhdXNlIHdlIHNob3VsZApj
b25zaWRlciB0aGUgY2FzZSB3aGVuIE0tbW9kZSBkb2Vzbid0IGFsbG93IFMtbW9kZSBzaGFkb3cg
c3RhY2ssIGJ1dApTLW1vZGUgY2FuIGVuYWJsZSBVLW1vZGUgc2hhZG93IHN0YWNrOgoKPj4gPiAt
LS0KPj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TIGIvYXJjaC9yaXNj
di9rZXJuZWwvaGVhZC5TCj4+ID4gQEAgLTMyMCw2ICszMjYsMTIgQEAgU1lNX0NPREVfU1RBUlQo
X3N0YXJ0X2tlcm5lbCkKPj4gPiAgICAgICBsYSB0cCwgaW5pdF90YXNrCj4+ID4gICAgICAgbGEg
c3AsIGluaXRfdGhyZWFkX3VuaW9uICsgVEhSRUFEX1NJWkUKPj4gPiAgICAgICBhZGRpIHNwLCBz
cCwgLVBUX1NJWkVfT05fU1RBQ0sKPj4gPiArICAgICBsaSBhNywgU0JJX0VYVF9GV0ZUCj4+ID4g
KyAgICAgbGkgYTYsIFNCSV9FWFRfRldGVF9TRVQKPj4gPiArICAgICBsaSBhMCwgU0JJX0ZXRlRf
U0hBRE9XX1NUQUNLCj4+ID4gKyAgICAgbGkgYTEsIDEgLyogZW5hYmxlIHN1cGVydmlzb3IgdG8g
YWNjZXNzIHNoYWRvdyBzdGFjayBhY2Nlc3MgKi8KPj4gPiArICAgICBsaSBhMiwgU0JJX0ZXRlRf
U0VUX0ZMQUdfTE9DSwo+PiA+ICsgICAgIGVjYWxsCj4+Cj4+IEkgdGhpbmsgdGhlIGVjYWxsIGNh
biBmYWlsIGV2ZW4gb24gbWFjaGluZXMgdGhhdCBoYXZlIFppY2Zpc3MsIHNvIGl0Cj4+IHdvdWxk
IGJlIGdvb2QgdG8gZGlzYWJsZSB1c2VyIHNoYWRvdyBzdGFjayBpZiB0aGF0IGhhcHBlbnMuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
