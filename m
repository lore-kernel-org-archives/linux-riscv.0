Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B432FC433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Apr 2022 11:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ttv6feIggFTCrlEKYc6d3VCV3mrsv0sAduGYHAYxacI=; b=ATyhtOp/vuwaAL
	nfAPpHwZZWFHD29cZMGA+8ezmS0NQgELQTRtIygClOV0Pj/hrFD1zMtSPHB9slhBQ4zSPbcccMxiy
	m4ABtHbk55mmLDktlnqPbtxI5YlKodHyoUqGMDHi0hfbyYWDvBuhC5nQoh+TXK4YCCRdTqyEESjf2
	clkHf4gEjNfFUBIchAxMGuDEIxepIAd/goi4Tx2G1v3Tw9nQuWF2PoC41uxh/f0rN42FnPCWHOI26
	qherRiBkA+b29Pkx2U48iOG7rpQK7ZqR0iUdkTSYL9DSALkJPyGW0TO/44E1HlPrUg8E6R7F9MCaF
	TNZNkrLgxhPwnG8zisEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfgJa-00CooB-Mh; Sat, 16 Apr 2022 11:10:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfgJM-00Cok2-Sq; Sat, 16 Apr 2022 11:09:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BCD4460EEB;
 Sat, 16 Apr 2022 11:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFEE4C385A1;
 Sat, 16 Apr 2022 11:09:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="jfu76xom"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1650107387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BWpDj5fGUy3iYp41L7HbRmBg65jO9i+zxCcxvQs/HHk=;
 b=jfu76xom3slcyrLPr+BUwVI6nPL8nG3aXgE8fZJl0c9n5ZgLv5H3d42KSvsfHd77uWN+LS
 qHe+UjCX3i+WHi/Hn3DagRLOt8M+5Td5aT22KZpriM0+0LOeSf5dAGk6ZCoV6XSL7N2sD7
 cVI+9oxF5pGzl5QMFWU0b52tD2Z/rDk=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0e28074c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Sat, 16 Apr 2022 11:09:47 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 o20-20020a9d7194000000b005cb20cf4f1bso6810213otj.7; 
 Sat, 16 Apr 2022 04:09:46 -0700 (PDT)
X-Gm-Message-State: AOAM533WiKsNYqXzQ0TTmVMvN5qr+uZcScA/g+fXxPLApuzpT/iCpJz/
 kFccuAd1tbEYv/UjVS3fTzixIGJdDFMR+xDMd2M=
X-Google-Smtp-Source: ABdhPJyAY5xi4OGR681ypI25l7Liwu41MbRbYQFXrT4jbAkvhI1v7BitiVeDW4TLYpgWqNVatNZXdBjODAZ+DfSqjbM=
X-Received: by 2002:a5b:782:0:b0:634:683f:310e with SMTP id
 b2-20020a5b0782000000b00634683f310emr2707608ybq.398.1650107375189; Sat, 16
 Apr 2022 04:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220413115411.21489-1-Jason@zx2c4.com>
 <20220413115411.21489-5-Jason@zx2c4.com>
 <20220413122546.GA11860@alpha.franken.de>
 <alpine.DEB.2.21.2204131331450.9383@angie.orcam.me.uk>
 <CAHmME9pQ4xdeTUDxAdrOu=S9NRTonYzJVk50fa0Zfz4knZt5WA@mail.gmail.com>
 <alpine.DEB.2.21.2204140014580.9383@angie.orcam.me.uk>
 <YlfoeGRM6w2O+eXA@zx2c4.com>
 <alpine.DEB.2.21.2204142349180.9383@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2204142349180.9383@angie.orcam.me.uk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 16 Apr 2022 13:09:24 +0200
X-Gmail-Original-Message-ID: <CAHmME9qzkZqkGntLn--XfMKzyR=tYiCaZu1uFpoQBzAzCipZ-A@mail.gmail.com>
Message-ID: <CAHmME9qzkZqkGntLn--XfMKzyR=tYiCaZu1uFpoQBzAzCipZ-A@mail.gmail.com>
Subject: Re: [PATCH v4 04/11] mips: use fallback for random_get_entropy()
 instead of zero
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 LKML <linux-kernel@vger.kernel.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Arnd Bergmann <arnd@arndb.de>, "Theodore Ts'o" <tytso@mit.edu>, 
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 "David S . Miller" <davem@davemloft.net>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
 John Stultz <john.stultz@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Dinh Nguyen <dinguyen@kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 sparclinux <sparclinux@vger.kernel.org>, linux-um@lists.infradead.org, 
 X86 ML <x86@kernel.org>, linux-xtensa@linux-xtensa.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220416_040953_059473_42EB311C 
X-CRM114-Status: GOOD (  24.31  )
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

SGkgTWFjaWVqLAoKT24gRnJpLCBBcHIgMTUsIDIwMjIgYXQgMjoyNiBQTSBNYWNpZWogVy4gUm96
eWNraSA8bWFjcm9Ab3JjYW0ubWUudWs+IHdyb3RlOgo+ICAgICByZXR1cm4gKHJhbmRvbV9nZXRf
ZW50cm9weV9mYWxsYmFjaygpIDw8IDE0KSB8ICgoMTw8MTQpIC0gcmVhZF9jMF9yYW5kb20oKSk7
Cj4KPiBvZiBjb3Vyc2UsIGFzIGJpdCAxMyBpcyBzdGlsbCBvbmUgb2YgdGhlIGFjdGl2ZSBvbmVz
IGluIHRoZSBSM2sgQ1AwIFJhbmRvbQo+IHJlZ2lzdGVyLgoKQWgsIHRoYW5rcywgd2lsbCBkbyB0
aGF0LgoKPiAgVGhlcmUgYXJlIHR3byB2YXJpYW50cyBvbmx5IG9mIHRoZSBDUDAgUmFuZG9tIHJl
Z2lzdGVyIHRoYXQgd2UgY2FuIGV2ZXIKPiBlbmNvdW50ZXIsIGFzIGl0J3MgYmVlbiBkZS1mYWN0
byBzdGFuZGFyZGlzZWQgaW4gZWFybHkgMTk5MHMgYWxyZWFkeSBhbmQKPiB0aGVuIHdyaXR0ZW4g
ZG93biBpbiB0aGUgTUlQU3IxIGFyY2hpdGVjdHVyZSBzcGVjaWZpY2F0aW9uIH4yMDAwLiAgU28g
SQo+IHRoaW5rIGl0IG1heSBtYWtlIHNlbnNlIHRvIGFjdHVhbGx5IGhhbmRsZSB0aGVtIGJvdGgg
ZXhwbGljdGl0bHkgd2l0aAo+IGluZGl2aWR1YWwgY2FsY3VsYXRpb25zLCBwb3NzaWJseSBjb25k
aXRpb25hbGlzZWQgb24gYSBDT05GSUcgc2V0dGluZyBvcgo+IGBjcHVfaGFzXzNrZXgnLCBiZWNh
dXNlIGtlcm5lbHMgdGhhdCBzdXBwb3J0IHRoZSB0d28gdmFyaWFudHMgb2YgdGhlIE1NVQo+IGFy
Y2hpdGVjdHVyZSBhcmUgbXV0dWFsbHkgaW5jb21wYXRpYmxlLgoKT2theSwgSSBjYW4gZ2l2ZSB0
aGlzIGEgc2hvdCwgYnV0IHRoaXMgY2VydGFpbmx5IGlzbid0IG15IGZvcnTDqS4gSXQKbWF5IHVs
dGltYXRlbHkgd2luZCB1cCBiZWluZyBzaW1wbGVyIGZvciB5b3UgdG8ganVzdCBzZW5kIHNvbWUg
Y29kZSBvZgp3aGF0IHlvdSBlbnZpc2lvbiBmb3IgdGhpcywgYnV0IGlmIEkgdW5kZXJzdGFuZCB5
b3VyIGlkZWEgY29ycmVjdGx5LAp3aGF0IHlvdSdyZSBzYXlpbmcgaXMgc29tZXRoaW5nIGxpa2U6
CgpzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgcmFuZG9tX2dldF9lbnRyb3B5KHZvaWQpCnsK
ICAgICAgICB1bnNpZ25lZCBpbnQgcHJpZCA9IHJlYWRfYzBfcHJpZCgpOwogICAgICAgIHVuc2ln
bmVkIGludCBpbXAgPSBwcmlkICYgUFJJRF9JTVBfTUFTSzsKICAgICAgICB1bnNpZ25lZCBpbnQg
YzBfcmFuZG9tOwoKICAgICAgICBpZiAoY2FuX3VzZV9taXBzX2NvdW50ZXIocHJpZCkpCiAgICAg
ICAgICAgICAgICByZXR1cm4gcmVhZF9jMF9jb3VudCgpOwoKICAgICAgICBpZiAoY3B1X2hhc18z
a2V4KQogICAgICAgICAgICAgICAgYzBfcmFuZG9tID0gKHJlYWRfYzBfcmFuZG9tKCkgPj4gOCkg
JiAweDNmOwogICAgICAgIGVsc2UKICAgICAgICAgICAgICAgIGMwX3JhbmRvbSA9IHJlYWRfYzBf
cmFuZG9tKCkgJiAweDNmOwogICAgICAgIHJldHVybiAocmFuZG9tX2dldF9lbnRyb3B5X2ZhbGxi
YWNrKCkgPDwgNikgfCAoMHgzZiAtIGMwX3JhbmRvbSk7Cn0KCldoYXQgZG8geW91IHRoaW5rIG9m
IHRoYXQ/IFNvbWUgdHdlYWsgSSdtIG1pc3Npbmc/Cgo+ICBJc24ndCBpdCBnb2luZyB0byBiZSBh
biBpc3N1ZSBmb3IgYW4gZW50cm9weSBzb3VyY2UgdGhhdCB0aGUgZGlzdHJpYnV0aW9uCj4gb2Yg
dmFsdWVzIG9idGFpbmVkIGZyb20gdGhlIENQMCBSYW5kb20gYml0LWZpZWxkIGlzIG5vdCBldmVu
LCB0aGF0IGlzIHNvbWUKPiB2YWx1ZXMgZnJvbSB0aGUgNi1iaXQgcmFuZ2Ugd2lsbCBuZXZlciBh
cHBlYXI/CgpJdCdzIHRoZSBzYW1lIHNpdHVhdGlvbiB3aXRob3V0IGludmVydGluZyB0aGUgb3Jk
ZXI6IGluc3RlYWQgb2Ygc29tZQpiaXRzIG9uIHRoZSB0b3AgbmV2ZXIgaGFwcGVuaW5nLCBzb21l
IGJpdHMgb24gdGhlIGJvdHRvbSBuZXZlciBoYXBwZW4KaW5zdGVhZC4gSW4gZ2VuZXJhbCwgY291
bnRlcnMgZG9uJ3QgZm9ybSB1bmlmb3JtIGRpc3RyaWJ1dGlvbnMgYW55d2F5LApzaW5jZSB0aGUg
bG93ZXIgYml0cyBjaGFuZ2UgZmFzdGVyLCBhbmQgbmVpdGhlciBhcmUgdGhleSBpbmRlcGVuZGVu
dCwKc2luY2Ugb25lIHNhbXBsZSBpbiBsYXJnZSBwYXJ0IGRlcGVuZHMgb24gdGhlIHByZXZpb3Vz
LiBUaGlzIGlzIGp1c3QKc29ydCBvZiB0aGUgbmF0dXJlIG9mIHRoZSBiZWFzdCwgYW5kIHRoZSBj
b2RlIHRoYXQgY2FsbHMKcmFuZG9tX2dldF9lbnRyb3B5KCkgZGVhbHMgd2l0aCB0aGlzIGFwcHJv
cHJpYXRlbHkgKGJ5LCBhdCB0aGUgbW9tZW50LApqdXN0IGhhc2hpbmcgYWxsIHRoZSBiaXRzKS4K
Ckphc29uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
