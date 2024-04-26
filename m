Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0531C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 18:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJsN1BHZXo11buQTCr5ZEB4qysnNN1qx+IqQBrHaSIk=; b=oU2KECwUzxgI/e
	vn6yMW+tXsZB4giIa5OPXJwtSe+NzXyuepxalYaPKs12IhAM4PCuml8/PdWNQSTI56iZzylhuLDfc
	pxRp6jpdlH2MzfQ6lZU7uzH4cIzorqjv/zEJfuBkvenb7KzLlipCUe/gJJPwBaS5AhkooANMY26ll
	a/8PzdmaivE0EnnXKGfoDVJrB1APJbzclNM0PKtfSkRz1Cf8O++R2R2l7Rs24xpw459cRvhIFiMU5
	j5WrHnhfaDeVbA/AbhwowFBwwnFq19T1NLgHm0t+r8rj65UwmShw0HL/181XbNYT/jouia3tEaqJ9
	vQoqmRgiZ4p0JxRgMG1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Qf2-0000000DiLU-2Hfd;
	Fri, 26 Apr 2024 18:51:04 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Qey-0000000DiJy-3Brd;
	Fri, 26 Apr 2024 18:51:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AA188CE1CD7;
	Fri, 26 Apr 2024 18:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A440FC32786;
	Fri, 26 Apr 2024 18:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714157457;
	bh=qzSv2gnEZ82yuyykHlGJGrukq6yL7NdagG67pBjWhfw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=G31cPiC6TK9kOZfS+7vIsvfHb7uuZNOwj55DutBKEwvj1ZktMpti079oDLoQepzqx
	 wVszL7O0AJVxtjaOjY0n9kY4/Bve7m6gE0ic4Iybrzklpad4O8Ro4Zf5m6HkkhiJ2+
	 w3461SEnX9aUsT6TIAtdY2xAhX4Y1lrXomoRm91/r6VXYAPdqg/BAUR9Ku0+ffN2fF
	 +m/rEaMDw+oIuNEa2S2MKLtCa+l5O0n2aCdo6H2uhPypnxbndLUx0bGMePJQhqLBqn
	 5LBIsT64XdigQdLAx2qvxJDfAfqchkz63z7zPloWzIi6w7OHWw93PJ1yRE7jC7BXYK
	 k1xLvs7Vr7U6Q==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-57258c90899so1524619a12.1;
        Fri, 26 Apr 2024 11:50:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUyz7m5v8szeHnCo3sPowBttp9pYdz/VfHqV+UBIHK6u0j89AENiRulQSeS3BT1ZoTGgBiZ/QAcKCXbv0TtMZZuy3ar9/RWgXnsiieoQzuqd80l9gAEc5hy+HJEspX2OX+f5u1+o+QtBffxY8OSyqteR4W4Mno=
X-Gm-Message-State: AOJu0YwZzs+tZJ12BcRSpjaw3a/TYNukit4WL7BUrcRqzSs3cmUfm7uT
	HWOEO10y/CZhxyXP3Hm8mcglpMerdOxevqFL1BdR8QC6OkkoIQV66am8FwodewzJDzAkBEH7CMs
	H8YsUGW788/VTmd5nao6RGfHlbcI=
X-Google-Smtp-Source: AGHT+IEtbFUWWfDryHUamYvitrmf8tAKbyELfuzd/vDmOPU4uvcIS74lAE+iFPq4wKESZs2zgaxMHYvoVHUDPQWBV9c=
X-Received: by 2002:a05:6512:3116:b0:516:ce34:e4fc with SMTP id
 n22-20020a056512311600b00516ce34e4fcmr167995lfb.31.1714157435505; Fri, 26 Apr
 2024 11:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240426082854.7355-1-rppt@kernel.org> <20240426082854.7355-7-rppt@kernel.org>
In-Reply-To: <20240426082854.7355-7-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 26 Apr 2024 11:50:24 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6FZqYXvk4anxby8MccwejPPK5DNU-NGmg7_6T1XDU=Hg@mail.gmail.com>
Message-ID: <CAPhsuW6FZqYXvk4anxby8MccwejPPK5DNU-NGmg7_6T1XDU=Hg@mail.gmail.com>
Subject: Re: [PATCH v6 06/16] mm: introduce execmem_alloc() and execmem_free()
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Donald Dutile <ddutile@redhat.com>, Eric Chanudet <echanude@redhat.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nadav Amit <nadav.amit@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Russell King <linux@armlinux.org.uk>, 
	Sam Ravnborg <sam@ravnborg.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Will Deacon <will@kernel.org>, bpf@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_115101_288168_EF0A036D 
X-CRM114-Status: GOOD (  16.85  )
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

T24gRnJpLCBBcHIgMjYsIDIwMjQgYXQgMTozMOKAr0FNIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiAiTWlrZSBSYXBvcG9ydCAoSUJNKSIgPHJwcHRAa2Vy
bmVsLm9yZz4KPgo+IG1vZHVsZV9hbGxvYygpIGlzIHVzZWQgZXZlcnl3aGVyZSBhcyBhIG1lYW4g
dG8gYWxsb2NhdGUgbWVtb3J5IGZvciBjb2RlLgo+Cj4gQmVzaWRlIGJlaW5nIHNlbWFudGljYWxs
eSB3cm9uZywgdGhpcyB1bm5lY2Vzc2FyaWx5IHRpZXMgYWxsIHN1YnN5c3RlbXMKPiB0aGF0IG5l
ZWQgdG8gYWxsb2NhdGUgY29kZSwgc3VjaCBhcyBmdHJhY2UsIGtwcm9iZXMgYW5kIEJQRiB0byBt
b2R1bGVzIGFuZAo+IHB1dHMgdGhlIGJ1cmRlbiBvZiBjb2RlIGFsbG9jYXRpb24gdG8gdGhlIG1v
ZHVsZXMgY29kZS4KPgo+IFNldmVyYWwgYXJjaGl0ZWN0dXJlcyBvdmVycmlkZSBtb2R1bGVfYWxs
b2MoKSBiZWNhdXNlIG9mIHZhcmlvdXMKPiBjb25zdHJhaW50cyB3aGVyZSB0aGUgZXhlY3V0YWJs
ZSBtZW1vcnkgY2FuIGJlIGxvY2F0ZWQgYW5kIHRoaXMgY2F1c2VzCj4gYWRkaXRpb25hbCBvYnN0
YWNsZXMgZm9yIGltcHJvdmVtZW50cyBvZiBjb2RlIGFsbG9jYXRpb24uCj4KPiBTdGFydCBzcGxp
dHRpbmcgY29kZSBhbGxvY2F0aW9uIGZyb20gbW9kdWxlcyBieSBpbnRyb2R1Y2luZyBleGVjbWVt
X2FsbG9jKCkKPiBhbmQgZXhlY21lbV9mcmVlKCkgQVBJcy4KPgo+IEluaXRpYWxseSwgZXhlY21l
bV9hbGxvYygpIGlzIGEgd3JhcHBlciBmb3IgbW9kdWxlX2FsbG9jKCkgYW5kCj4gZXhlY21lbV9m
cmVlKCkgaXMgYSByZXBsYWNlbWVudCBvZiBtb2R1bGVfbWVtZnJlZSgpIHRvIGFsbG93IHVwZGF0
aW5nIGFsbAo+IGNhbGwgc2l0ZXMgdG8gdXNlIHRoZSBuZXcgQVBJcy4KPgo+IFNpbmNlIGFyY2hp
dGVjdHVyZXMgZGVmaW5lIGRpZmZlcmVudCByZXN0cmljdGlvbnMgb24gcGxhY2VtZW50LAo+IHBl
cm1pc3Npb25zLCBhbGlnbm1lbnQgYW5kIG90aGVyIHBhcmFtZXRlcnMgZm9yIG1lbW9yeSB0aGF0
IGNhbiBiZSB1c2VkIGJ5Cj4gZGlmZmVyZW50IHN1YnN5c3RlbXMgdGhhdCBhbGxvY2F0ZSBleGVj
dXRhYmxlIG1lbW9yeSwgZXhlY21lbV9hbGxvYygpIHRha2VzCj4gYSB0eXBlIGFyZ3VtZW50LCB0
aGF0IHdpbGwgYmUgdXNlZCB0byBpZGVudGlmeSB0aGUgY2FsbGluZyBzdWJzeXN0ZW0gYW5kIHRv
Cj4gYWxsb3cgYXJjaGl0ZWN0dXJlcyBkZWZpbmUgcGFyYW1ldGVycyBmb3IgcmFuZ2VzIHN1aXRh
YmxlIGZvciB0aGF0Cj4gc3Vic3lzdGVtLgo+Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzLgo+Cj4g
U2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCAoSUJNKSA8cnBwdEBrZXJuZWwub3JnPgo+IEFj
a2VkLWJ5OiBNYXNhbWkgSGlyYW1hdHN1IChHb29nbGUpIDxtaGlyYW1hdEBrZXJuZWwub3JnPgoK
QWNrZWQtYnk6IFNvbmcgTGl1IDxzb25nQGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
