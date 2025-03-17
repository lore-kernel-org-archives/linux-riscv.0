Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A32C35FF1
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 01:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FmYGsVt8lKx98K2oAGafWKPy14Hycr5Lus/AweCBn70=; b=Gcev3fZQs94Q4S
	emgkc9Jfl2BSYQBFr1awi/6/WjXKSihgQOR+RH6//gbcTdBr0clS+ZwfVV1imR4x2iy0EVZ3AtoSp
	amK3tzTlQnYsdO/umhNZs1cSRTNgRBUvUiPtcQc+E8yray9TFYTsuQhdDF/31Sa0nlPTkhp3KQzaR
	/miggzVSYMdBzCpsYS6F90K+JeGHbcE1dk8cUp4woNlu9Tfdhmef1dEbZXr+8Xp+bODd72w2sKx2b
	tN6KxggHtO4agIc1/xNbpGzGELJLf4BeS3MFgfFbzAHFf9yiDQJNU51sCTq3Co7UH6JHm1BLVjkY4
	NpEyn1QcGzu31afVepAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttzIy-00000000ql5-3OtM;
	Mon, 17 Mar 2025 01:30:12 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttzIw-00000000qjm-0bEN
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 01:30:11 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-85d9a87660fso342026239f.1
        for <linux-riscv@lists.infradead.org>; Sun, 16 Mar 2025 18:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1742175009; x=1742779809; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0BgPqh2lb+Uwmfrt3ADGADV+FsUyp9TAnyh5DCYwF0A=;
        b=QvjhgP1AMwgfTMA9ima5Dl6K2ddtn7Mzl32bvPjR8RShHDMx8TdBlBLjApYh6kebsK
         bEH/ZPsk1a/hJhH+3mcqIoeS2qKtxtyXdTLx4dC+BGAwNYQO/oTK4uRFmGwFAjk+pzaE
         1V2cqAe36db7E2ulaayChJwBkvvolb8rktA7Mj6KHxGsQSZ0XScPQK/AvCaPoVmlBjGE
         QKnLsLPX6apb2VlwJJmt8qRlIsE657rUEbQQiq3FQG2kcBUM4JbKl9Q2MDN2oKKvnEb/
         oeC+CBdX828QitmXA4nf7jvRfKMdMH7WTYlxhIfQbsPh5nu/onhPD0ba8PoGsCdhWm/1
         2Bjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742175009; x=1742779809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0BgPqh2lb+Uwmfrt3ADGADV+FsUyp9TAnyh5DCYwF0A=;
        b=RpId70KvD98MW3RBkJT+mjYLk6mKaqikIfr893QbzQJUj7WBOInn6W9dIlY2wbXslb
         k9V+rIG+DK/pMt+KgwMZDMxvOUdEV/bQfmPwjkomOEq9GhIRsF00IRqUH19IenOrj/t1
         tfpvMvyuDi7k8v+VZL/khO9iL5wij06Q//xGc1efIcnTiISI4Jx5qU3o11OZiCjE0U0r
         U3ppBWEbTmDPCAAwm+bH/8f/QudqI4z+qta3aV34yfvWS1uC7tv65VuczxFOJbPRcxdr
         FUZ1X8ko5kV/fgngPGWYNPfnPPmGdfks6u0Ywj09OcCJLN8XX4h0rNeK7brsmY60+PKV
         Leyg==
X-Forwarded-Encrypted: i=1; AJvYcCUwwJYbtX1e/Ip5Ji1iD6RAj8e+jhQiJZvtwJbBwRa1Kz9plCfUO8Rsp18+G4at8tL9ayOmQ6QxH2C68w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxaBeiGagv6CcGXUzh9elY+Pm7+DR7FEtMre1sNC8KXTERqam0b
	3yuUFB8K7FZra8Nz/xiJchZfhA/bT83uSCohp6aUmQ2rZbtDAGfZqQvDzSjfjjSNXo4oX38SkGn
	xpIzmaM54fN114m1Zw4y5jfojv6nZQbtqfGhMSA==
X-Gm-Gg: ASbGncu98Tpg2f97AC1WenkMRfc88enL6rAN1Rgbpdr/zokkmvc2//44iiAnfvs8tYQ
	Zy1RtOZWrMQopDhxoxMWnIz7+Drg9ysgEopp7/my0nmyoxl7dgL0LKzwJqz6ig/JzTjtaErzzqt
	bMK+YOL9DB6RpEo7eKkhnYc+du848a
X-Google-Smtp-Source: AGHT+IFIq9kkasXmtYBi1bOlasABayp5RTyarU6d4HJ+lY/VA6wq4Lo3I/SyszKkcRTrfrE4ClECajli89b3tva72eM=
X-Received: by 2002:a05:6602:3f09:b0:85d:a1c4:ee03 with SMTP id
 ca18e2360f4ac-85dc47d36b5mr1483188839f.7.1742175009124; Sun, 16 Mar 2025
 18:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com> <20250314-v5_user_cfi_series-v12-13-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-13-e51202b53138@rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 17 Mar 2025 09:29:57 +0800
X-Gm-Features: AQ5f1JrP5j_jWeX4yoQDmxgHc7C_BW3_CH6nIyiVQO54RVQmiKVGFtDika6nCYk
Message-ID: <CANXhq0o2gxV462GY6h=_4GmBDcDf3oeh-L=WXzz=AsMCV=x2Kw@mail.gmail.com>
Subject: Re: [PATCH v12 13/28] prctl: arch-agnostic prctl for indirect branch tracking
To: Deepak Gupta <debug@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Jann Horn <jannh@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_183010_187494_82E3CBC8 
X-CRM114-Status: GOOD (  23.79  )
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

T24gU2F0LCBNYXIgMTUsIDIwMjUgYXQgNjo1MeKAr0FNIERlZXBhayBHdXB0YSA8ZGVidWdAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IFRocmVlIGFyY2hpdGVjdHVyZXMgKHg4NiwgYWFyY2g2NCwg
cmlzY3YpIGhhdmUgc3VwcG9ydCBmb3IgaW5kaXJlY3QgYnJhbmNoCj4gdHJhY2tpbmcgZmVhdHVy
ZSBpbiBhIHZlcnkgc2ltaWxhciBmYXNoaW9uLiBPbiBhIHZlcnkgaGlnaCBsZXZlbCwgaW5kaXJl
Y3QKPiBicmFuY2ggdHJhY2tpbmcgaXMgYSBDUFUgZmVhdHVyZSB3aGVyZSBDUFUgdHJhY2tzIGJy
YW5jaGVzIHdoaWNoIHVzZXMKPiBtZW1vcnkgb3BlcmFuZCB0byBwZXJmb3JtIGNvbnRyb2wgdHJh
bnNmZXIgaW4gcHJvZ3JhbS4gQXMgcGFydCBvZiB0aGlzCj4gdHJhY2tpbmcgb24gaW5kaXJlY3Qg
YnJhbmNoZXMsIENQVSBnb2VzIGluIGEgc3RhdGUgd2hlcmUgaXQgZXhwZWN0cyBhCj4gbGFuZGlu
ZyBwYWQgaW5zdHIgb24gdGFyZ2V0IGFuZCBpZiBub3QgZm91bmQgdGhlbiBDUFUgcmFpc2VzIHNv
bWUgZmF1bHQKPiAoYXJjaGl0ZWN0dXJlIGRlcGVuZGVudCkKPgo+IHg4NiBsYW5kaW5nIHBhZCBp
bnN0ciAtIGBFTkRCUkFOQ0hgCj4gYXJjaDY0IGxhbmRpbmcgcGFkIGluc3RyIC0gYEJUSWAKPiBy
aXNjdiBsYW5kaW5nIGluc3RyIC0gYGxwYWRgCj4KPiBHaXZlbiB0aGF0IHRocmVlIG1ham9yIGFy
Y2hlcyBoYXZlIHN1cHBvcnQgZm9yIGluZGlyZWN0IGJyYW5jaCB0cmFja2luZywKPiBUaGlzIHBh
dGNoIG1ha2VzIGBwcmN0bGAgZm9yIGluZGlyZWN0IGJyYW5jaCB0cmFja2luZyBhcmNoIGFnbm9z
dGljLgo+Cj4gVG8gYWxsb3cgdXNlcnNwYWNlIHRvIGVuYWJsZSB0aGlzIGZlYXR1cmUgZm9yIGl0
c2VsZiwgZm9sbG93aW5nIHBydGNscyBhcmUKPiBkZWZpbmVkOgo+ICAtIFBSX0dFVF9JTkRJUl9C
Ul9MUF9TVEFUVVM6IEdldHMgY3VycmVudCBjb25maWd1cmVkIHN0YXR1cyBmb3IgaW5kaXJlY3QK
PiAgICBicmFuY2ggdHJhY2tpbmcuCj4gIC0gUFJfU0VUX0lORElSX0JSX0xQX1NUQVRVUzogU2V0
cyBhIGNvbmZpZ3VyYXRpb24gZm9yIGluZGlyZWN0IGJyYW5jaAo+ICAgIHRyYWNraW5nLgo+ICAg
IEZvbGxvd2luZyBzdGF0dXMgb3B0aW9ucyBhcmUgYWxsb3dlZAo+ICAgICAgICAtIFBSX0lORElS
X0JSX0xQX0VOQUJMRTogRW5hYmxlcyBpbmRpcmVjdCBicmFuY2ggdHJhY2tpbmcgb24gdXNlcgo+
ICAgICAgICAgIHRocmVhZC4KPiAgICAgICAgLSBQUl9JTkRJUl9CUl9MUF9ESVNBQkxFOyBEaXNh
YmxlcyBpbmRpcmVjdCBicmFuY2ggdHJhY2tpbmcgb24gdXNlcgo+ICAgICAgICAgIHRocmVhZC4K
PiAgLSBQUl9MT0NLX0lORElSX0JSX0xQX1NUQVRVUzogTG9ja3MgY29uZmlndXJlZCBzdGF0dXMg
Zm9yIGluZGlyZWN0IGJyYW5jaAo+ICAgIHRyYWNraW5nIGZvciB1c2VyIHRocmVhZC4KPgo+IFNp
Z25lZC1vZmYtYnk6IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPgo+IFJldmlld2Vk
LWJ5OiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGluY2x1ZGUvbGlu
dXgvY3B1LmggICAgICAgIHwgIDQgKysrKwo+ICBpbmNsdWRlL3VhcGkvbGludXgvcHJjdGwuaCB8
IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBrZXJuZWwvc3lzLmMgICAgICAgICAg
ICAgICB8IDMwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAzIGZpbGVzIGNoYW5n
ZWQsIDYxIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2NwdS5o
IGIvaW5jbHVkZS9saW51eC9jcHUuaAo+IGluZGV4IDZhMGE4ZjFjN2M5MC4uZmIwYzM5NDQzMGM2
IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvY3B1LmgKPiArKysgYi9pbmNsdWRlL2xpbnV4
L2NwdS5oCj4gQEAgLTIwNCw0ICsyMDQsOCBAQCBzdGF0aWMgaW5saW5lIGJvb2wgY3B1X21pdGln
YXRpb25zX2F1dG9fbm9zbXQodm9pZCkKPiAgfQo+ICAjZW5kaWYKPgo+ICtpbnQgYXJjaF9nZXRf
aW5kaXJfYnJfbHBfc3RhdHVzKHN0cnVjdCB0YXNrX3N0cnVjdCAqdCwgdW5zaWduZWQgbG9uZyBf
X3VzZXIgKnN0YXR1cyk7Cj4gK2ludCBhcmNoX3NldF9pbmRpcl9icl9scF9zdGF0dXMoc3RydWN0
IHRhc2tfc3RydWN0ICp0LCB1bnNpZ25lZCBsb25nIHN0YXR1cyk7Cj4gK2ludCBhcmNoX2xvY2tf
aW5kaXJfYnJfbHBfc3RhdHVzKHN0cnVjdCB0YXNrX3N0cnVjdCAqdCwgdW5zaWduZWQgbG9uZyBz
dGF0dXMpOwo+ICsKPiAgI2VuZGlmIC8qIF9MSU5VWF9DUFVfSF8gKi8KPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS91YXBpL2xpbnV4L3ByY3RsLmggYi9pbmNsdWRlL3VhcGkvbGludXgvcHJjdGwuaAo+
IGluZGV4IDVjNjA4MDY4MGNiMi4uNmNkOTA0NjBjYmFkIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUv
dWFwaS9saW51eC9wcmN0bC5oCj4gKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L3ByY3RsLmgKPiBA
QCAtMzUzLDQgKzM1MywzMSBAQCBzdHJ1Y3QgcHJjdGxfbW1fbWFwIHsKPiAgICovCj4gICNkZWZp
bmUgUFJfTE9DS19TSEFET1dfU1RBQ0tfU1RBVFVTICAgICAgNzYKPgo+ICsvKgo+ICsgKiBHZXQg
dGhlIGN1cnJlbnQgaW5kaXJlY3QgYnJhbmNoIHRyYWNraW5nIGNvbmZpZ3VyYXRpb24gZm9yIHRo
ZSBjdXJyZW50Cj4gKyAqIHRocmVhZCwgdGhpcyB3aWxsIGJlIHRoZSB2YWx1ZSBjb25maWd1cmVk
IHZpYSBQUl9TRVRfSU5ESVJfQlJfTFBfU1RBVFVTLgo+ICsgKi8KPiArI2RlZmluZSBQUl9HRVRf
SU5ESVJfQlJfTFBfU1RBVFVTICAgICAgNzcKPiArCj4gKy8qCj4gKyAqIFNldCB0aGUgaW5kaXJl
Y3QgYnJhbmNoIHRyYWNraW5nIGNvbmZpZ3VyYXRpb24uIFBSX0lORElSX0JSX0xQX0VOQUJMRSB3
aWxsCj4gKyAqIGVuYWJsZSBjcHUgZmVhdHVyZSBmb3IgdXNlciB0aHJlYWQsIHRvIHRyYWNrIGFs
bCBpbmRpcmVjdCBicmFuY2hlcyBhbmQgZW5zdXJlCj4gKyAqIHRoZXkgbGFuZCBvbiBhcmNoIGRl
ZmluZWQgbGFuZGluZyBwYWQgaW5zdHJ1Y3Rpb24uCj4gKyAqIHg4NiAtIElmIGVuYWJsZWQsIGFu
IGluZGlyZWN0IGJyYW5jaCBtdXN0IGxhbmQgb24gYEVOREJSQU5DSGAgaW5zdHJ1Y3Rpb24uCj4g
KyAqIGFyY2g2NCAtIElmIGVuYWJsZWQsIGFuIGluZGlyZWN0IGJyYW5jaCBtdXN0IGxhbmQgb24g
YEJUSWAgaW5zdHJ1Y3Rpb24uCj4gKyAqIHJpc2N2IC0gSWYgZW5hYmxlZCwgYW4gaW5kaXJlY3Qg
YnJhbmNoIG11c3QgbGFuZCBvbiBgbHBhZGAgaW5zdHJ1Y3Rpb24uCj4gKyAqIFBSX0lORElSX0JS
X0xQX0RJU0FCTEUgd2lsbCBkaXNhYmxlIGZlYXR1cmUgZm9yIHVzZXIgdGhyZWFkIGFuZCBpbmRp
cmVjdAo+ICsgKiBicmFuY2hlcyB3aWxsIG5vIG1vcmUgYmUgdHJhY2tlZCBieSBjcHUgdG8gbGFu
ZCBvbiBhcmNoIGRlZmluZWQgbGFuZGluZyBwYWQKPiArICogaW5zdHJ1Y3Rpb24uCj4gKyAqLwo+
ICsjZGVmaW5lIFBSX1NFVF9JTkRJUl9CUl9MUF9TVEFUVVMgICAgICA3OAo+ICsjIGRlZmluZSBQ
Ul9JTkRJUl9CUl9MUF9FTkFCTEUgICAgICAgICAgICAoMVVMIDw8IDApCj4gKwo+ICsvKgo+ICsg
KiBQcmV2ZW50IGZ1cnRoZXIgY2hhbmdlcyB0byB0aGUgc3BlY2lmaWVkIGluZGlyZWN0IGJyYW5j
aCB0cmFja2luZwo+ICsgKiBjb25maWd1cmF0aW9uLiAgQWxsIGJpdHMgbWF5IGJlIGxvY2tlZCB2
aWEgdGhpcyBjYWxsLCBpbmNsdWRpbmcKPiArICogdW5kZWZpbmVkIGJpdHMuCj4gKyAqLwo+ICsj
ZGVmaW5lIFBSX0xPQ0tfSU5ESVJfQlJfTFBfU1RBVFVTICAgICAgNzkKPiArCj4gICNlbmRpZiAv
KiBfTElOVVhfUFJDVExfSCAqLwo+IGRpZmYgLS1naXQgYS9rZXJuZWwvc3lzLmMgYi9rZXJuZWwv
c3lzLmMKPiBpbmRleCBjYjM2NmZmODcwM2EuLmYzNDdmMzUxOGQwYiAxMDA2NDQKPiAtLS0gYS9r
ZXJuZWwvc3lzLmMKPiArKysgYi9rZXJuZWwvc3lzLmMKPiBAQCAtMjMzNiw2ICsyMzM2LDIxIEBA
IGludCBfX3dlYWsgYXJjaF9sb2NrX3NoYWRvd19zdGFja19zdGF0dXMoc3RydWN0IHRhc2tfc3Ry
dWN0ICp0LCB1bnNpZ25lZCBsb25nIHN0Cj4gICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiAgfQo+
Cj4gK2ludCBfX3dlYWsgYXJjaF9nZXRfaW5kaXJfYnJfbHBfc3RhdHVzKHN0cnVjdCB0YXNrX3N0
cnVjdCAqdCwgdW5zaWduZWQgbG9uZyBfX3VzZXIgKnN0YXR1cykKPiArewo+ICsgICAgICAgcmV0
dXJuIC1FSU5WQUw7Cj4gK30KPiArCj4gK2ludCBfX3dlYWsgYXJjaF9zZXRfaW5kaXJfYnJfbHBf
c3RhdHVzKHN0cnVjdCB0YXNrX3N0cnVjdCAqdCwgdW5zaWduZWQgbG9uZyBzdGF0dXMpCj4gK3sK
PiArICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICt9Cj4gKwo+ICtpbnQgX193ZWFrIGFyY2hfbG9j
a19pbmRpcl9icl9scF9zdGF0dXMoc3RydWN0IHRhc2tfc3RydWN0ICp0LCB1bnNpZ25lZCBsb25n
IHN0YXR1cykKPiArewo+ICsgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gK30KPiArCj4gICNkZWZp
bmUgUFJfSU9fRkxVU0hFUiAoUEZfTUVNQUxMT0NfTk9JTyB8IFBGX0xPQ0FMX1RIUk9UVExFKQo+
Cj4gICNpZmRlZiBDT05GSUdfQU5PTl9WTUFfTkFNRQo+IEBAIC0yODExLDYgKzI4MjYsMjEgQEAg
U1lTQ0FMTF9ERUZJTkU1KHByY3RsLCBpbnQsIG9wdGlvbiwgdW5zaWduZWQgbG9uZywgYXJnMiwg
dW5zaWduZWQgbG9uZywgYXJnMywKPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsKPiAgICAgICAgICAgICAgICAgZXJyb3IgPSBhcmNoX2xvY2tfc2hhZG93X3N0YWNrX3N0
YXR1cyhtZSwgYXJnMik7Cj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgY2FzZSBQ
Ul9HRVRfSU5ESVJfQlJfTFBfU1RBVFVTOgo+ICsgICAgICAgICAgICAgICBpZiAoYXJnMyB8fCBh
cmc0IHx8IGFyZzUpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4g
KyAgICAgICAgICAgICAgIGVycm9yID0gYXJjaF9nZXRfaW5kaXJfYnJfbHBfc3RhdHVzKG1lLCAo
dW5zaWduZWQgbG9uZyBfX3VzZXIgKilhcmcyKTsKPiArICAgICAgICAgICAgICAgYnJlYWs7Cj4g
KyAgICAgICBjYXNlIFBSX1NFVF9JTkRJUl9CUl9MUF9TVEFUVVM6Cj4gKyAgICAgICAgICAgICAg
IGlmIChhcmczIHx8IGFyZzQgfHwgYXJnNSkKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1
cm4gLUVJTlZBTDsKPiArICAgICAgICAgICAgICAgZXJyb3IgPSBhcmNoX3NldF9pbmRpcl9icl9s
cF9zdGF0dXMobWUsIGFyZzIpOwo+ICsgICAgICAgICAgICAgICBicmVhazsKPiArICAgICAgIGNh
c2UgUFJfTE9DS19JTkRJUl9CUl9MUF9TVEFUVVM6Cj4gKyAgICAgICAgICAgICAgIGlmIChhcmcz
IHx8IGFyZzQgfHwgYXJnNSkKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZB
TDsKPiArICAgICAgICAgICAgICAgZXJyb3IgPSBhcmNoX2xvY2tfaW5kaXJfYnJfbHBfc3RhdHVz
KG1lLCBhcmcyKTsKPiArICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICBkZWZhdWx0Ogo+
ICAgICAgICAgICAgICAgICB0cmFjZV90YXNrX3ByY3RsX3Vua25vd24ob3B0aW9uLCBhcmcyLCBh
cmczLCBhcmc0LCBhcmc1KTsKPiAgICAgICAgICAgICAgICAgZXJyb3IgPSAtRUlOVkFMOwo+CgpM
R1RNCgpSZXZpZXdlZC1ieTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPgoKPiAtLQo+IDIu
MzQuMQo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
