Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC18E784BE
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 01:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ihm8i0t5DK5UthZFMCOzx7oBetNidM3OeoUL4fU8oHE=; b=cW/MvT9iCm19Q0
	JzAquR7CQSj9ONP49mZVny8XZrVkzPUBHAG7UxOFMQOB0AAKtse+Or5kUFVvSG4lTnTdFC6ioeuV5
	nSGSThgSHTD8x6c3+SdsZyReMAmaxlufeewtUJBiW69ThnSXDiiZtiNWB9VTAWW0OrXnh7jUF79n+
	Kp4sm5uqGWL2AZ+2GyDCr3hmKzOoudYsEBMHZZNLTsd3vCEeV7F0Mq1rN1/q4ZuSyFDjpW0FB/jsd
	AJP0UTYM2b+huf4n9tZYDpBs/gOlm0+fAbCBFQpzV1nb+aDCI16sZWTpPOzJejr+sUrjXznagf46I
	kzch0bLWHWvIiy/521Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va21I-00000003BoK-2ElI;
	Mon, 29 Dec 2025 01:26:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va21G-00000003Bmn-1WBn
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 01:25:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FE6F44473
	for <linux-riscv@lists.infradead.org>; Mon, 29 Dec 2025 01:25:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01CE1C2BCB0
	for <linux-riscv@lists.infradead.org>; Mon, 29 Dec 2025 01:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766971557;
	bh=QcHUIuYE7RQs56jGjmqpy2oUOjx983YRYnPBuaD4boU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KZuXxQnTWZjo6Lof5URsYlUjW0kwpYMb41Lqh7FwvUUm9w1vnlBjwPxtNvEcQ4tet
	 xmbWdsyOlecjZiWdQ3OFYCXytV323wGrcpIwVCzMSP0WxMEv4p/59MZY+eJkJWKz/9
	 rHd0dU5C4eZqkItfe0w2njo8Ppk0fIVPjJIAtf9k9mvQgTl6eAaFB3RhXp4Ouin/m2
	 8Xo6lYrybspCjJYNWuiBoY18l0zZprRiO3vj4+HjBHpxL7iGOgtyhyQVt1xe5ngKuk
	 BeergKRsgklh8YNSbG3a/Qk9qDKSXVlKWvaYLTpqByfmGWpzi+yyXyI2KK5D3PZ9XS
	 AAjY/KtRm5xHg==
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa4so6744674f8f.1
        for <linux-riscv@lists.infradead.org>; Sun, 28 Dec 2025 17:25:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUa9+IcfVf5RyGSVv1hVIt2ild71/Ur/AS84Nutg/u92fHhWlT48NJ+J3yP7nK+pl4xc8DQyMuNfPsR8w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKeXt843KnrYQXQ3OC8Y+DtbzSAk/wSe36jIoPddtP2oeuuryt
	OLeq1v72GDr53D54Aqw1b5PiFVa3aVgQ9mjRzEJJ+BwG8CnVpsW07QbjGqUhjET2ftoAD7Ws1hI
	y8DMn1lYQbhyV1cBWYziuKNfgRgjjo9A=
X-Google-Smtp-Source: AGHT+IH0/4lM/7b5Nef4Fb6rn6mJpOxGdWgk9AqK9LZQSl+6Va320QICtWgPPv8KCBU6m5HaJgurTChUGp2fBhZ8S4E=
X-Received: by 2002:a05:6000:2308:b0:430:ff0c:35f9 with SMTP id
 ffacd0b85a97d-4324e50d989mr31524498f8f.48.1766971554637; Sun, 28 Dec 2025
 17:25:54 -0800 (PST)
MIME-Version: 1.0
References: <20251228124001.3624742-1-rppt@kernel.org> <20251228124001.3624742-6-rppt@kernel.org>
In-Reply-To: <20251228124001.3624742-6-rppt@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 29 Dec 2025 09:25:42 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSMLhnqQeZB=oEwLGzXfJwxPh+vJvTuz-OFGrwJi5uPSA@mail.gmail.com>
X-Gm-Features: AQt7F2ovPXIqQiKDAgz2Iigjc3UdRKj7ty_Tsln8fN_MKzmJJ5LWRy6ejtLdRVA
Message-ID: <CAJF2gTSMLhnqQeZB=oEwLGzXfJwxPh+vJvTuz-OFGrwJi5uPSA@mail.gmail.com>
Subject: Re: [PATCH 05/28] csky: introduce arch_zone_limits_init()
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alex Shi <alexs@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	"David S. Miller" <davem@davemloft.net>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, 
	Michal Simek <monstr@monstr.eu>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>, 
	Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, x86@kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-cxl@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_172558_444307_E81EB67E 
X-CRM114-Status: GOOD (  17.98  )
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

T24gU3VuLCBEZWMgMjgsIDIwMjUgYXQgODo0MeKAr1BNIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiAiTWlrZSBSYXBvcG9ydCAoTWljcm9zb2Z0KSIgPHJw
cHRAa2VybmVsLm9yZz4KPgo+IE1vdmUgY2FsY3VsYXRpb25zIG9mIHpvbmUgbGltaXRzIHRvIGEg
ZGVkaWNhdGVkIGFyY2hfem9uZV9saW1pdHNfaW5pdCgpCj4gZnVuY3Rpb24uCj4KPiBMYXRlciBN
TSBjb3JlIHdpbGwgdXNlIHRoaXMgZnVuY3Rpb24gYXMgYW4gYXJjaGl0ZWN0dXJlIHNwZWNpZmlj
IGNhbGxiYWNrCj4gZHVyaW5nIG5vZGVzIGFuZCB6b25lcyBpbml0aWFsaXphdGlvbiBhbmQgdGh1
cyB0aGVyZSB3b24ndCBiZSBhIG5lZWQgdG8KPiBjYWxsIGZyZWVfYXJlYV9pbml0KCkgZnJvbSBl
dmVyeSBhcmNoaXRlY3R1cmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IChNaWNy
b3NvZnQpIDxycHB0QGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGFyY2gvY3NreS9rZXJuZWwvc2V0dXAu
YyB8IDEyICsrKysrKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvY3NreS9rZXJuZWwvc2V0dXAuYyBi
L2FyY2gvY3NreS9rZXJuZWwvc2V0dXAuYwo+IGluZGV4IGUwZDZjYTg2ZWE4Yy4uODk2ODgxNWQ5
M2U2IDEwMDY0NAo+IC0tLSBhL2FyY2gvY3NreS9rZXJuZWwvc2V0dXAuYwo+ICsrKyBiL2FyY2gv
Y3NreS9rZXJuZWwvc2V0dXAuYwo+IEBAIC01MSw2ICs1MSwxNCBAQCBzdGF0aWMgdm9pZCBfX2lu
aXQgc2V0dXBfaW5pdHJkKHZvaWQpCj4gIH0KPiAgI2VuZGlmCj4KPiArdm9pZCBfX2luaXQgYXJj
aF96b25lX2xpbWl0c19pbml0KHVuc2lnbmVkIGxvbmcgKm1heF96b25lX3BmbnMpCj4gK3sKPiAr
ICAgICAgIG1heF96b25lX3BmbnNbWk9ORV9OT1JNQUxdID0gbWF4X2xvd19wZm47Cj4gKyNpZmRl
ZiBDT05GSUdfSElHSE1FTQo+ICsgICAgICAgbWF4X3pvbmVfcGZuc1taT05FX0hJR0hNRU1dID0g
bWF4X3BmbjsKPiArI2VuZGlmCj4gK30KPiArCkxHVE0hCgpBY2tlZC1ieTogR3VvIFJlbiA8Z3Vv
cmVuQGtlcm5lbC5vcmc+Cgo+ICBzdGF0aWMgdm9pZCBfX2luaXQgY3NreV9tZW1ibG9ja19pbml0
KHZvaWQpCj4gIHsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgbG93bWVtX3NpemUgPSBQRk5fRE9X
TihMT1dNRU1fTElNSVQgLSBQSFlTX09GRlNFVF9PRkZTRVQpOwo+IEBAIC04MywxMiArOTEsOSBA
QCBzdGF0aWMgdm9pZCBfX2luaXQgY3NreV9tZW1ibG9ja19pbml0KHZvaWQpCj4gICAgICAgICBz
ZXR1cF9pbml0cmQoKTsKPiAgI2VuZGlmCj4KPiAtICAgICAgIG1heF96b25lX3BmbltaT05FX05P
Uk1BTF0gPSBtYXhfbG93X3BmbjsKPiAtCj4gICAgICAgICBtbXVfaW5pdChtaW5fbG93X3Bmbiwg
bWF4X2xvd19wZm4pOwo+Cj4gICNpZmRlZiBDT05GSUdfSElHSE1FTQo+IC0gICAgICAgbWF4X3pv
bmVfcGZuW1pPTkVfSElHSE1FTV0gPSBtYXhfcGZuOwo+Cj4gICAgICAgICBoaWdoc3RhcnRfcGZu
ID0gbWF4X2xvd19wZm47Cj4gICAgICAgICBoaWdoZW5kX3BmbiAgID0gbWF4X3BmbjsKPiBAQCAt
OTcsNiArMTAyLDcgQEAgc3RhdGljIHZvaWQgX19pbml0IGNza3lfbWVtYmxvY2tfaW5pdCh2b2lk
KQo+Cj4gICAgICAgICBkbWFfY29udGlndW91c19yZXNlcnZlKDApOwo+Cj4gKyAgICAgICBhcmNo
X3pvbmVfbGltaXRzX2luaXQobWF4X3pvbmVfcGZuKTsKPiAgICAgICAgIGZyZWVfYXJlYV9pbml0
KG1heF96b25lX3Bmbik7Cj4gIH0KPgo+IC0tCj4gMi41MS4wCj4KCgotLSAKQmVzdCBSZWdhcmRz
CiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
