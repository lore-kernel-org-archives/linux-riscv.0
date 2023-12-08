Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3703DC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 21:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G3aZCC++43b9JGo20W62UDMjjRH3h3UtUeeAntI/5WA=; b=TL6kkuLQjOEltW
	/AfDBav8yHm6bJ9D1WyCmb53OgSew1TwjK8r+kzMhAV5I/MHXZFc3HCrDf+8TRieVu9raNSe/xu1N
	QVebPA1RMIdIeQolJ7x175DNMTLoP57oFPOOb0YbXDwoQABKRCjczyqKo09S9f5ienlqKeGH4T4rN
	lcBv5I04TJGz7dtsLNXM1HBwowC5FbotohNqWx2iKkBD43P+8/aJgJn6cX8xRlHWZCMknu64cPSJf
	06Pm8TBqCH/HxniED0dPQH1dVa6JxRUqZhnGJ4j+hg8KZGKJTToMm2hYv9+nEOovhyJWf/8Gk/afa
	Q2a7dVU2tri+C+Gj5A+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBi1a-00GZ2D-2l;
	Fri, 08 Dec 2023 21:04:42 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBi1Y-00GZ0b-1R
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 21:04:41 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40c19467a63so28048965e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 08 Dec 2023 13:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702069474; x=1702674274; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6NtR+oTUIOd2AHKXBfJVs3VbzXFOw3VtZb1y+6tew0=;
        b=ZQH/v+9bbVihU5HQojrr1/qetUaSachmPaLNBAiAqiL19dcUH0nGSHTmxcuIOHvZWC
         T0Noc8/vzaOwLb1DGTsZLnK4WUnBXRbRPEyndbb5Usc8h5dL8uO1w/yIXSd8Q3GrxoLZ
         TRzwfJGbwbPJ6dk1T5ybQQIj5S2jNjBPAM+fs4HRAcioXQhI+JJrhggdEFuOo1Y6Lq2L
         CpHO5BLLoMOmfe6/7wB1uxozeRaxxH1MW8B7F2sfbSj1jzb1XBT2Lcs4p+R9sAdFNCoA
         HrfYdjT9sd0dJv/+DobNMg5nTMrcsm1CmnrGaPANBXrynKyx0sXYtA3M1dOUOrJ9oKrV
         t9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702069474; x=1702674274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6NtR+oTUIOd2AHKXBfJVs3VbzXFOw3VtZb1y+6tew0=;
        b=u8UCrQxuqk8GTkqntdgR/Bf2sDeRtSQDY6Jqh9vjR9i+//qh6vElhO3o2ogtZ5EWTl
         VDZopGX0o8iBzwEtaKmMv4hGY0uFyrHB2IDPyU68VD6rICvol0Iuqk62KO/bGhvBAX4P
         0OfKpJ2xp7yMBpqYfDP1P4MnbdK0PF2l9GmrruFfQmfdKpGbe877JZmLFC/K4Qrvp1zP
         iTcw/1nbhbR1wYDOK1QUbTwvpPOiIm+mtiaiorfLOlDmuBg1xp0asLYVjKfsmWdPHr7e
         cp2vJ+ThDI0lxhmSFck2WepFKdbsl2+iKfsVyoigrJdiekYnEktqVUgN/cKaW18MgmOK
         s3hw==
X-Gm-Message-State: AOJu0YxIZrfpQDz6Xa/YG78kaa9PufGSqACDkVjE98YRp8VnqWw0ZjWh
	fwSa8OJ6OIh0QZC1CJV9OidEKEqMZroQiiaZJLU=
X-Google-Smtp-Source: AGHT+IEkTtKeS6XS1G3jyMsgzOhUXClVJ029bbBc4Aqz+vIee0Tzhjlve6H0wlutP+qM9rQB9kK5huFu1aQL+LEf+9E=
X-Received: by 2002:a1c:4c0a:0:b0:40c:2ad3:1aed with SMTP id
 z10-20020a1c4c0a000000b0040c2ad31aedmr288910wmf.35.1702069473424; Fri, 08 Dec
 2023 13:04:33 -0800 (PST)
MIME-Version: 1.0
References: <20231206163814.GB36423@noisy.programming.kicks-ass.net>
 <20231206183713.GA35897@noisy.programming.kicks-ass.net> <zu5eb2robdqnp2ojwaxjhnglcummrnjaqbw6krdds6qac3bql2@5zx46c2s6ez4>
 <20231207093105.GA28727@noisy.programming.kicks-ass.net> <ivhrgimonsvy3tyj5iidoqmlcyqvtsh2ay3cm3ouemsdbvjzs4@6jlt6zv55tgh>
 <20231208102940.GB28727@noisy.programming.kicks-ass.net> <20231208134041.GD28727@noisy.programming.kicks-ass.net>
 <CAADnVQJFB_CPtFS3=VV=RwnP=EQRL3yEsR8wXVcicb07P8NODw@mail.gmail.com>
 <20231208201819.GE36716@noisy.programming.kicks-ass.net> <CAADnVQ+1nVBuKkjdvh0eu19p+J0UqbO9mcCf3yzVeQtALxzQ+Q@mail.gmail.com>
 <20231208205647.GL28727@noisy.programming.kicks-ass.net>
In-Reply-To: <20231208205647.GL28727@noisy.programming.kicks-ass.net>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 8 Dec 2023 13:04:22 -0800
Message-ID: <CAADnVQKjAwWLfn-gBxq03qv4SQTt0YguYSDZXj8L6nmBZqU66g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] x86/cfi,bpf: Fix BPF JIT call
To: Peter Zijlstra <peterz@infradead.org>
Cc: Jiri Olsa <olsajiri@gmail.com>, Song Liu <song@kernel.org>, 
	Song Liu <songliubraving@meta.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Network Development <netdev@vger.kernel.org>, 
	bpf <bpf@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Joao Moreira <joao@overdrivepizza.com>, Mark Rutland <mark.rutland@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_130440_484446_5EDCF2F8 
X-CRM114-Status: GOOD (  13.80  )
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

T24gRnJpLCBEZWMgOCwgMjAyMyBhdCAxMjo1NuKAr1BNIFBldGVyIFppamxzdHJhIDxwZXRlcnpA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIERlYyAwOCwgMjAyMyBhdCAxMjo0NTo1
MVBNIC0wODAwLCBBbGV4ZWkgU3Rhcm92b2l0b3Ygd3JvdGU6Cj4KPiA+IEkgbWVhbiB3ZSBkb24n
dCBuZWVkIHRvIHN0b3JlIGEgcG9pbnRlciB0byBhIGZ1bmMgaW4gc3R1YnMuCj4gPiBDYW4gaXQg
YmUsIHJvdWdobHk6Cj4gPgo+ID4gZXh0ZXJuIHZvaWQgYnBmX3RjcF9jYV9jb25nX2F2b2lkKHN0
cnVjdCBzb2NrICpzaywgdTMyIGFjaywgdTMyIGFja2VkKTsKPiA+IEtDRklfTUFDUk8oaGFzaF9v
Zl9jb25nX2F2b2lkLCBicGZfdGNwX2NhX2NvbmdfYXZvaWQpOwo+ID4gdTMyIF9fYXJyYXlfb2Zf
a2NmaV9oYXNoW10gPSB7aGFzaF9vZl9jb25nX2F2b2lkLCBoYXNoX29mX3NldF9zdGF0ZSwuLi59
Owo+ID4gICAgICAgLmJwZl9vcHNfc3R1YnMgPSBfX2FycmF5X29mX2tjZmlfaGFzaCwKPgo+IEJ1
dCB0aGVuIGhvdyBkbyBJIGluZGV4IHRoaXMgYXJyYXk/IFRoZSBicGZfb3BzX3N0dWJzIHRoaW5n
IGhhdmluZyB0aGUKPiBzYW1lIGxheW91dCBhdCB0aGUgdGFyZ2V0IHN0cnVjdCBtYWRlIGl0IGVh
c3kgYW5kIHdlIGNvdWxkIHVzZSAnbW9mZicKPiBmb3IgYm90aC4KPgo+IFRoYXQgYWxzbyByZW1h
aW5zIHdvcmtpbmcgaWYgc29tZW9uZSBhZGRzIGEgbWVtYmVyIHRvIHRoZSBzdHJ1Y3Qgb3IKPiBt
b3ZlcyBzb21lIG1lbWJlcnMgYXJvdW5kLgoKSSB3YXMgdGhpbmtpbmcgdG8ganVzdCBtb2ZmLzIg
YXNzdW1pbmcgdTMyIGFycmF5IHdpbGwgaGF2ZSB0aGUgc2FtZSBvcmRlciwKYnV0IEkgbWlzc2Vk
IHRoZSBmYWN0IHRoYXQgaW5pdCgpIGFuZCByZWxlYXNlKCkgaW4gdGNwX2Nvbmdlc3Rpb25fb3Bz
CmNvbWUgYWZ0ZXIgc29tZSB2YXJpYWJsZXMuCkFuZCB5b3UncmUgcmlnaHQgaXQncyBtb3JlIGZy
YWdpbGUgd2hlbiB0aGluZ3MgY2hhbmdlIGluIHRjcF9jb25nZXN0aW9uX29wcy4KU3RvcmluZyB1
MzIgaGFzaCBhcyAodm9pZCAqKSBpbnRvIGZ1bmN0aW9uIHBvaW50ZXJzIGlzIGp1c3QgdWdseS4K
TGV0J3MgZ28gd2l0aCB5b3VyIGluaXRpYWwgYXBwcm9hY2guCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
