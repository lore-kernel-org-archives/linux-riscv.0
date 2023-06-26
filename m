Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF3BEB64D7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 09:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XQ4li+ClA/XsyCTnLbMFgbMXfdwEBUCI2NcKlouBHVw=; b=4Jk1EeZUvs4T5B
	N2Z/icKOawemII88iUvtyoQ8VTX6kxqCY2vMb/W/EBZ32aUCdGs/HJj+cUPP+sdTHoNJvfymNKO7u
	TylayNnhdvIAM/yZCFY7lzq1fQ7YC3QWMymbVnI15ad/cMLpc7cCmf6PLHnXcgCEyoKs6xaIlIj34
	q5Pnezu2wGJdEVxIvv7AW6S+BnMjQoPPUzeWQEYKNlazzB/pLWb+QMc58gPdWbMGDxm+WAfLNxGxH
	gvESr6YTFPg9g832lu7q4+vVwJEBeM3Xi0JdASJW+IZVh90LNleIAQ2Rjf2AZTbzWEp2CAKn45018
	5I9SnyftsJJqLNPzt11A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDivO-009mSc-1D;
	Mon, 26 Jun 2023 09:54:22 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDivJ-009mPg-2T;
	Mon, 26 Jun 2023 09:54:19 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b6994a8ce3so16956531fa.1;
        Mon, 26 Jun 2023 02:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687773253; x=1690365253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BkJiT0hPCVGufk3wfK9OYfFQLFeH4WpXrH92jiyy/So=;
        b=LI5UZd6nWq3K7Pk9RsvstakVLfRy9rPrPfGF9Jxi7xqsukDqd54gYlmkO8NO2qWlHY
         laEGLm0NqwaArg2B0U1mb2ZrqnQ9DVwimD6R9fGkz1Yd2PDLrxg65lZLZigg5lTSIx2l
         56OJh1znTXpgfq6PeFjAtc4vfilcMyYO/Wyxt9uZPzTfS51DnEEvSczgbxwfbCIBHHC0
         7ypRQx2o2pgmpeEfRoHRRO1a/N4rztkHAi5QRE7HA32OEPIVtwvl4zPvnFeZBbFS9Pc3
         +XHYPCfQMMO7KjwgAec1IpnT5/TZoHL4STHkcCNJVmExNECcWBSghyv+4KQ48cIUrCZM
         M6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687773253; x=1690365253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BkJiT0hPCVGufk3wfK9OYfFQLFeH4WpXrH92jiyy/So=;
        b=YoI1oJgeNhmVZ8MqKZKGoDtCMLwRIzEwkzJGKbP2+pBVXv0AuJWuXI8SnkJF9KIMJa
         bbhJ/sGG9SoYsJeGO+GA+VR8Y9+hAJgAtIcrO209AhfU1PfzRDfdw8fRKXWzFTsH0KiJ
         jkowae5jtMhZ/V7ltQ79q60ZQnzl4C3MuYnS12a44vWkuk5FTwchQo68xDm/q0dsOVTS
         qY7KEUXO5eQrm1CcktTd6ceNVrqJ9J/B5u9tJ/HAgoFV6JR1OWhqxZ9cXvrV7AF20Ym+
         yk7MQk9JaiOYsKU1whbzijpxIM1I0Wx1uDbx6irPnaNWJnjcpJUWiqEmMH+ejBXCdvsW
         T3hQ==
X-Gm-Message-State: AC+VfDwJZQIhm1E3YJ+JXYAMK2/skb4UOJ2rSoOhO9GBbsNBUM5ZsS8o
	/F8DeuG5879gYogn4mdHu3GFd5G9cUITliMj3rk=
X-Google-Smtp-Source: ACHHUZ67jMr16NDRNLWv9518HCJB3Am5wfZo0UzBIm/hvCg0LmCzdDMhboQHv94rDq5VEGtQPY2hBiRv+xQ6CfYSFdg=
X-Received: by 2002:a2e:9183:0:b0:2b4:6e21:637e with SMTP id
 f3-20020a2e9183000000b002b46e21637emr13282046ljg.16.1687773253077; Mon, 26
 Jun 2023 02:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-3-rppt@kernel.org>
 <f9a7eebe-d36e-4587-b99d-35d4edefdd14@app.fastmail.com> <20230618080027.GA52412@kernel.org>
 <a17c65c6-863f-4026-9c6f-a04b659e9ab4@app.fastmail.com> <20230625161417.GK52412@kernel.org>
 <90161ac9-3ca0-4c72-b1c4-ab1293e55445@app.fastmail.com> <20230625174257.GL52412@kernel.org>
 <20230625180741.jrrtkq55c4jrqh3t@moria.home.lan> <CAPhsuW45gmtCVgA0mg6X87x5EOzSmVqq3SCMSR6agyiukiJvEQ@mail.gmail.com>
In-Reply-To: <CAPhsuW45gmtCVgA0mg6X87x5EOzSmVqq3SCMSR6agyiukiJvEQ@mail.gmail.com>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Mon, 26 Jun 2023 11:54:02 +0200
Message-ID: <CANk7y0jcakmuF4e9x8z7ZUra=MPx-=xxb0JZ3RrJ+S9Eb9-0_g@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] mm: introduce execmem_text_alloc() and jit_text_alloc()
To: Song Liu <song@kernel.org>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Mike Rapoport <rppt@kernel.org>, 
	Andy Lutomirski <luto@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Kees Cook <keescook@chromium.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nadav Amit <nadav.amit@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	"Russell King (Oracle)" <linux@armlinux.org.uk>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Will Deacon <will@kernel.org>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, 
	"the arch/x86 maintainers" <x86@kernel.org>, pjt@google.com, torvalds@linux-foundation.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_025417_806556_643BDD44 
X-CRM114-Status: GOOD (  68.18  )
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

T24gTW9uLCBKdW4gMjYsIDIwMjMgYXQgODoxM+KAr0FNIFNvbmcgTGl1IDxzb25nQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Cj4gT24gU3VuLCBKdW4gMjUsIDIwMjMgYXQgMTE6MDfigK9BTSBLZW50IE92
ZXJzdHJlZXQKPiA8a2VudC5vdmVyc3RyZWV0QGxpbnV4LmRldj4gd3JvdGU6Cj4gPgo+ID4gT24g
U3VuLCBKdW4gMjUsIDIwMjMgYXQgMDg6NDI6NTdQTSArMDMwMCwgTWlrZSBSYXBvcG9ydCB3cm90
ZToKPiA+ID4gT24gU3VuLCBKdW4gMjUsIDIwMjMgYXQgMDk6NTk6MzRBTSAtMDcwMCwgQW5keSBM
dXRvbWlyc2tpIHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBPbiBTdW4sIEp1biAyNSwg
MjAyMywgYXQgOToxNCBBTSwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiA+ID4gPiA+IE9uIE1vbiwg
SnVuIDE5LCAyMDIzIGF0IDEwOjA5OjAyQU0gLTA3MDAsIEFuZHkgTHV0b21pcnNraSB3cm90ZToK
PiA+ID4gPiA+Pgo+ID4gPiA+ID4+IE9uIFN1biwgSnVuIDE4LCAyMDIzLCBhdCAxOjAwIEFNLCBN
aWtlIFJhcG9wb3J0IHdyb3RlOgo+ID4gPiA+ID4+ID4gT24gU2F0LCBKdW4gMTcsIDIwMjMgYXQg
MDE6Mzg6MjlQTSAtMDcwMCwgQW5keSBMdXRvbWlyc2tpIHdyb3RlOgo+ID4gPiA+ID4+ID4+IE9u
IEZyaSwgSnVuIDE2LCAyMDIzLCBhdCAxOjUwIEFNLCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+ID4g
PiA+ID4+ID4+ID4gRnJvbTogIk1pa2UgUmFwb3BvcnQgKElCTSkiIDxycHB0QGtlcm5lbC5vcmc+
Cj4gPiA+ID4gPj4gPj4gPgo+ID4gPiA+ID4+ID4+ID4gbW9kdWxlX2FsbG9jKCkgaXMgdXNlZCBl
dmVyeXdoZXJlIGFzIGEgbWVhbiB0byBhbGxvY2F0ZSBtZW1vcnkgZm9yIGNvZGUuCj4gPiA+ID4g
Pj4gPj4gPgo+ID4gPiA+ID4+ID4+ID4gQmVzaWRlIGJlaW5nIHNlbWFudGljYWxseSB3cm9uZywg
dGhpcyB1bm5lY2Vzc2FyaWx5IHRpZXMgYWxsIHN1YnN5c3RlbXMKPiA+ID4gPiA+PiA+PiA+IHRo
YXQgbmVlZCB0byBhbGxvY2F0ZSBjb2RlLCBzdWNoIGFzIGZ0cmFjZSwga3Byb2JlcyBhbmQgQlBG
IHRvIG1vZHVsZXMKPiA+ID4gPiA+PiA+PiA+IGFuZCBwdXRzIHRoZSBidXJkZW4gb2YgY29kZSBh
bGxvY2F0aW9uIHRvIHRoZSBtb2R1bGVzIGNvZGUuCj4gPiA+ID4gPj4gPj4gPgo+ID4gPiA+ID4+
ID4+ID4gU2V2ZXJhbCBhcmNoaXRlY3R1cmVzIG92ZXJyaWRlIG1vZHVsZV9hbGxvYygpIGJlY2F1
c2Ugb2YgdmFyaW91cwo+ID4gPiA+ID4+ID4+ID4gY29uc3RyYWludHMgd2hlcmUgdGhlIGV4ZWN1
dGFibGUgbWVtb3J5IGNhbiBiZSBsb2NhdGVkIGFuZCB0aGlzIGNhdXNlcwo+ID4gPiA+ID4+ID4+
ID4gYWRkaXRpb25hbCBvYnN0YWNsZXMgZm9yIGltcHJvdmVtZW50cyBvZiBjb2RlIGFsbG9jYXRp
b24uCj4gPiA+ID4gPj4gPj4gPgo+ID4gPiA+ID4+ID4+ID4gU3RhcnQgc3BsaXR0aW5nIGNvZGUg
YWxsb2NhdGlvbiBmcm9tIG1vZHVsZXMgYnkgaW50cm9kdWNpbmcKPiA+ID4gPiA+PiA+PiA+IGV4
ZWNtZW1fdGV4dF9hbGxvYygpLCBleGVjbWVtX2ZyZWUoKSwgaml0X3RleHRfYWxsb2MoKSwgaml0
X2ZyZWUoKSBBUElzLgo+ID4gPiA+ID4+ID4+ID4KPiA+ID4gPiA+PiA+PiA+IEluaXRpYWxseSwg
ZXhlY21lbV90ZXh0X2FsbG9jKCkgYW5kIGppdF90ZXh0X2FsbG9jKCkgYXJlIHdyYXBwZXJzIGZv
cgo+ID4gPiA+ID4+ID4+ID4gbW9kdWxlX2FsbG9jKCkgYW5kIGV4ZWNtZW1fZnJlZSgpIGFuZCBq
aXRfZnJlZSgpIGFyZSByZXBsYWNlbWVudHMgb2YKPiA+ID4gPiA+PiA+PiA+IG1vZHVsZV9tZW1m
cmVlKCkgdG8gYWxsb3cgdXBkYXRpbmcgYWxsIGNhbGwgc2l0ZXMgdG8gdXNlIHRoZSBuZXcgQVBJ
cy4KPiA+ID4gPiA+PiA+PiA+Cj4gPiA+ID4gPj4gPj4gPiBUaGUgaW50ZW50aW9uIHNlbWFudGlj
cyBmb3IgbmV3IGFsbG9jYXRpb24gQVBJczoKPiA+ID4gPiA+PiA+PiA+Cj4gPiA+ID4gPj4gPj4g
PiAqIGV4ZWNtZW1fdGV4dF9hbGxvYygpIHNob3VsZCBiZSB1c2VkIHRvIGFsbG9jYXRlIG1lbW9y
eSB0aGF0IG11c3QgcmVzaWRlCj4gPiA+ID4gPj4gPj4gPiAgIGNsb3NlIHRvIHRoZSBrZXJuZWwg
aW1hZ2UsIGxpa2UgbG9hZGFibGUga2VybmVsIG1vZHVsZXMgYW5kIGdlbmVyYXRlZAo+ID4gPiA+
ID4+ID4+ID4gICBjb2RlIHRoYXQgaXMgcmVzdHJpY3RlZCBieSByZWxhdGl2ZSBhZGRyZXNzaW5n
Lgo+ID4gPiA+ID4+ID4+ID4KPiA+ID4gPiA+PiA+PiA+ICogaml0X3RleHRfYWxsb2MoKSBzaG91
bGQgYmUgdXNlZCB0byBhbGxvY2F0ZSBtZW1vcnkgZm9yIGdlbmVyYXRlZCBjb2RlCj4gPiA+ID4g
Pj4gPj4gPiAgIHdoZW4gdGhlcmUgYXJlIG5vIHJlc3RyaWN0aW9ucyBmb3IgdGhlIGNvZGUgcGxh
Y2VtZW50LiBGb3IKPiA+ID4gPiA+PiA+PiA+ICAgYXJjaGl0ZWN0dXJlcyB0aGF0IHJlcXVpcmUg
dGhhdCBhbnkgY29kZSBpcyB3aXRoaW4gY2VydGFpbiBkaXN0YW5jZQo+ID4gPiA+ID4+ID4+ID4g
ICBmcm9tIHRoZSBrZXJuZWwgaW1hZ2UsIGppdF90ZXh0X2FsbG9jKCkgd2lsbCBiZSBlc3NlbnRp
YWxseSBhbGlhc2VkIHRvCj4gPiA+ID4gPj4gPj4gPiAgIGV4ZWNtZW1fdGV4dF9hbGxvYygpLgo+
ID4gPiA+ID4+ID4+ID4KPiA+ID4gPiA+PiA+Pgo+ID4gPiA+ID4+ID4+IElzIHRoZXJlIGFueXRo
aW5nIGluIHRoaXMgc2VyaWVzIHRvIGhlbHAgdXNlcnMgZG8gdGhlIGFwcHJvcHJpYXRlCj4gPiA+
ID4gPj4gPj4gc3luY2hyb25pemF0aW9uIHdoZW4gdGhlIGFjdHVhbGx5IHBvcHVsYXRlIHRoZSBh
bGxvY2F0ZWQgbWVtb3J5IHdpdGgKPiA+ID4gPiA+PiA+PiBjb2RlPyAgU2VlIGhlcmUsIGZvciBl
eGFtcGxlOgo+ID4gPiA+ID4+ID4KPiA+ID4gPiA+PiA+IFRoaXMgc2VyaWVzIG9ubHkgZmFjdG9y
cyBvdXQgdGhlIGV4ZWN1dGFibGUgYWxsb2NhdGlvbnMgZnJvbSBtb2R1bGVzIGFuZAo+ID4gPiA+
ID4+ID4gcHV0cyB0aGVtIGluIGEgY2VudHJhbCBwbGFjZS4KPiA+ID4gPiA+PiA+IEFueXRoaW5n
IGVsc2Ugd291bGQgZ28gb24gdG9wIGFmdGVyIHRoaXMgbGFuZHMuCj4gPiA+ID4gPj4KPiA+ID4g
PiA+PiBIbW0uCj4gPiA+ID4gPj4KPiA+ID4gPiA+PiBPbiB0aGUgb25lIGhhbmQsIHRoZXJlJ3Mg
bm90aGluZyB3cm9uZyB3aXRoIGZhY3RvcmluZyBvdXQgY29tbW9uIGNvZGUuIE9uCj4gPiA+ID4g
Pj4gdGhlIG90aGVyIGhhbmQsIHRoaXMgaXMgcHJvYmFibHkgdGhlIHJpZ2h0IHRpbWUgdG8gYXQg
bGVhc3Qgc3RhcnQKPiA+ID4gPiA+PiB0aGlua2luZyBhYm91dCBzeW5jaHJvbml6YXRpb24sIGF0
IGxlYXN0IHRvIHRoZSBleHRlbnQgdGhhdCBpdCBtaWdodCBtYWtlCj4gPiA+ID4gPj4gdXMgd2Fu
dCB0byBjaGFuZ2UgdGhpcyBBUEkuICAoSSdtIG5vdCBhdCBhbGwgc2F5aW5nIHRoYXQgdGhpcyBz
ZXJpZXMKPiA+ID4gPiA+PiBzaG91bGQgcmVxdWlyZSBjaGFuZ2VzIC0tIEknbSBqdXN0IHNheWlu
ZyB0aGF0IHRoaXMgaXMgYSBnb29kIHRpbWUgdG8KPiA+ID4gPiA+PiB0aGluayBhYm91dCBob3cg
dGhpcyBzaG91bGQgd29yay4pCj4gPiA+ID4gPj4KPiA+ID4gPiA+PiBUaGUgY3VycmVudCBBUElz
LCAqYW5kKiB0aGUgcHJvcG9zZWQgaml0X3RleHRfYWxsb2MoKSBBUEksIGRvbid0IGFjdHVhbGx5
Cj4gPiA+ID4gPj4gbG9vayBsaWtlIHRoZSBvbmUgdGhpbmsgaW4gdGhlIExpbnV4IGVjb3N5c3Rl
bSB0aGF0IGFjdHVhbGx5Cj4gPiA+ID4gPj4gaW50ZWxsaWdlbnRseSBhbmQgZWZmaWNpZW50bHkg
bWFwcyBuZXcgdGV4dCBpbnRvIGFuIGFkZHJlc3Mgc3BhY2U6Cj4gPiA+ID4gPj4gbW1hcCgpLgo+
ID4gPiA+ID4+Cj4gPiA+ID4gPj4gT24geDg2LCB5b3UgY2FuIG1tYXAoKSBhbiBleGlzdGluZyBm
aWxlIGZ1bGwgb2YgZXhlY3V0YWJsZSBjb2RlIFBST1RfRVhFQwo+ID4gPiA+ID4+IGFuZCBqdW1w
IHRvIGl0IHdpdGggbWluaW1hbCBzeW5jaHJvbml6YXRpb24gKGp1c3QgdGhlIHN0YW5kYXJkIGlt
cGxpY2l0Cj4gPiA+ID4gPj4gb3JkZXJpbmcgaW4gdGhlIGtlcm5lbCB0aGF0IHBvcHVsYXRlcyB0
aGUgcGFnZXMgYmVmb3JlIHNldHRpbmcgdXAgdGhlCj4gPiA+ID4gPj4gUFRFcyBhbmQgd2hhdGV2
ZXIgdXNlciBzeW5jaHJvbml6YXRpb24gaXMgbmVlZGVkIHRvIGF2b2lkIGp1bXBpbmcgaW50bwo+
ID4gPiA+ID4+IHRoZSBtYXBwaW5nIGJlZm9yZSBtbWFwKCkgZmluaXNoZXMpLiAgSXQgd29ya3Mg
YWNyb3NzIENQVXMsIGFuZCB0aGUgb25seQo+ID4gPiA+ID4+IHBvc3NpYmxlIHdheSB1c2Vyc3Bh
Y2UgY2FuIHNjcmV3IGl0IHVwIChmb3IgYSByZWFkLW9ubHkgbWFwcGluZyBvZgo+ID4gPiA+ID4+
IHJlYWQtb25seSB0ZXh0LCBhbnl3YXkpIGlzIHRvIGp1bXAgdG8gdGhlIG1hcHBpbmcgdG9vIGVh
cmx5LCBpbiB3aGljaAo+ID4gPiA+ID4+IGNhc2UgdXNlcnNwYWNlIGdldHMgYSBwYWdlIGZhdWx0
LiAgSW5jb2hlcmVuY2UgaXMgaW1wb3NzaWJsZSwgYW5kIG5vIG9uZQo+ID4gPiA+ID4+IG5lZWRz
IHRvICJzZXJpYWxpemUiIChpbiB0aGUgU0RNIHNlbnNlKS4KPiA+ID4gPiA+Pgo+ID4gPiA+ID4+
IEkgdGhpbmsgdGhlIHNhbWUgc2VxdWVuY2UgKGZyb20gdXNlcnNwYWNlJ3MgcGVyc3BlY3RpdmUp
IHdvcmtzIG9uIG90aGVyCj4gPiA+ID4gPj4gYXJjaGl0ZWN0dXJlcywgdG9vLCBhbHRob3VnaCBJ
IHRoaW5rIG1vcmUgY2FjaGUgbWFuYWdlbWVudCBpcyBuZWVkZWQgb24KPiA+ID4gPiA+PiB0aGUg
a2VybmVsJ3MgZW5kLiAgQXMgZmFyIGFzIEkga25vdywgbm8gTGludXggU01QIGFyY2hpdGVjdHVy
ZSBuZWVkcyBhbgo+ID4gPiA+ID4+IElQSSB0byBtYXAgZXhlY3V0YWJsZSB0ZXh0IGludG8gdXNl
cm1vZGUsIGJ1dCBJIGNvdWxkIGVhc2lseSBiZSB3cm9uZy4KPiA+ID4gPiA+PiAoSUlSQyBSSVND
LVYgaGFzIHZlcnkgZGV2ZWxvcGVyLXVuZnJpZW5kbHkgaWNhY2hlIG1hbmFnZW1lbnQsIGJ1dCBJ
IGRvbid0Cj4gPiA+ID4gPj4gcmVtZW1iZXIgdGhlIGRldGFpbHMuKQo+ID4gPiA+ID4+Cj4gPiA+
ID4gPj4gT2YgY291cnNlLCB1c2luZyBwdHJhY2Ugb3IgYW55IG90aGVyIEZPTExfRk9SQ0UgdG8g
bW9kaWZ5IHRleHQgb24geDg2IGlzCj4gPiA+ID4gPj4gcmF0aGVyIGZyYXVnaHQsIGFuZCBJIGJl
dCBtYW55IHRoaW5ncyBkbyBpdCB3cm9uZyB3aGVuIHVzZXJzcGFjZSBpcwo+ID4gPiA+ID4+IG11
bHRpdGhyZWFkZWQuICBCdXQgbm90IGluIHByb2R1Y3Rpb24gYmVjYXVzZSBpdCdzIG1vc3RseSBu
b3QgdXNlZCBpbgo+ID4gPiA+ID4+IHByb2R1Y3Rpb24uKQo+ID4gPiA+ID4+Cj4gPiA+ID4gPj4g
QnV0IGppdF90ZXh0X2FsbG9jKCkgY2FuJ3QgZG8gdGhpcywgYmVjYXVzZSB0aGUgb3JkZXIgb2Yg
b3BlcmF0aW9ucwo+ID4gPiA+ID4+IGRvZXNuJ3QgbWF0Y2guICBXaXRoIGppdF90ZXh0X2FsbG9j
KCksIHRoZSBleGVjdXRhYmxlIG1hcHBpbmcgc2hvd3MgdXAKPiA+ID4gPiA+PiBiZWZvcmUgdGhl
IHRleHQgaXMgcG9wdWxhdGVkLCBzbyB0aGVyZSBpcyBubyBhdG9taWMgY2hhbmdlIGZyb20gbm90
LXRoZXJlCj4gPiA+ID4gPj4gdG8gcG9wdWxhdGVkLWFuZC1leGVjdXRhYmxlLiAgV2hpY2ggbWVh
bnMgdGhhdCB0aGVyZSBpcyBhbiBvcHBvcnR1bml0eQo+ID4gPiA+ID4+IGZvciBDUFVzLCBzcGVj
dWxhdGl2ZWx5IG9yIG90aGVyd2lzZSwgdG8gc3RhcnQgZmlsbGluZyB2YXJpb3VzIGNhY2hlcwo+
ID4gPiA+ID4+IHdpdGggaW50ZXJtZWRpYXRlIHN0YXRlcyBvZiB0aGUgdGV4dCwgd2hpY2ggbWVh
bnMgdGhhdCB2YXJpb3VzCj4gPiA+ID4gPj4gYXJjaGl0ZWN0dXJlcyAoZXZlbiB4ODYhKSBtYXkg
bmVlZCBzZXJpYWxpemF0aW9uLgo+ID4gPiA+ID4+Cj4gPiA+ID4gPj4gRm9yIGVCUEYtIGFuZCBt
b2R1bGUtIGxpa2UgdXNlIGNhc2VzLCB3aGVyZSBKSVR0aW5nL2NvZGUgZ2VuIGlzIHF1aXRlCj4g
PiA+ID4gPj4gY29hcnNlLWdyYWluZWQsIHBlcmhhcHMgc29tZXRoaW5nIHZhZ3VlbHkgbGlrZToK
PiA+ID4gPiA+Pgo+ID4gPiA+ID4+IGppdF90ZXh0X2FsbG9jKCkgLT4gcmV0dXJucyBhIGhhbmRs
ZSBhbmQgYW4gZXhlY3V0YWJsZSB2aXJ0dWFsIGFkZHJlc3MsCj4gPiA+ID4gPj4gYnV0IGRvZXMg
Km5vdCogbWFwIGl0IHRoZXJlCj4gPiA+ID4gPj4gaml0X3RleHRfd3JpdGUoKSAtPiB3cml0ZSB0
byB0aGF0IGhhbmRsZQo+ID4gPiA+ID4+IGppdF90ZXh0X21hcCgpIC0+IG1hcCBpdCBhbmQgc3lu
Y2hyb25pemUgaWYgbmVlZGVkIChubyBzeW5jIG5lZWRlZCBvbgo+ID4gPiA+ID4+IHg4NiwgSSB0
aGluaykKPiA+ID4gPiA+Pgo+ID4gPiA+ID4+IGNvdWxkIGJlIG1vcmUgZWZmaWNpZW50IGFuZC9v
ciBzYWZlci4KPiA+ID4gPiA+Pgo+ID4gPiA+ID4+IChNb2R1bGVzIGNvdWxkIHVzZSB0aGlzIHRv
by4gIEdldHRpbmcgYWx0ZXJuYXRpdmVzIHJpZ2h0IG1pZ2h0IHRha2Ugc29tZQo+ID4gPiA+ID4+
IGZpZGRsaW5nLCBiZWNhdXNlIG9mZiB0aGUgdG9wIG9mIG15IGhlYWQsIHRoaXMgZG9lc24ndCBt
YXRjaCBob3cgaXQgd29ya3MKPiA+ID4gPiA+PiBub3cuKQo+ID4gPiA+ID4+Cj4gPiA+ID4gPj4g
VG8gbWFrZSBhbHRlcm5hdGl2ZXMgZWFzaWVyLCB0aGlzIGNvdWxkIHdvcmssIG1heWJlIChoYXZl
bid0IGZ1bGx5Cj4gPiA+ID4gPj4gdGhvdWdodCBpdCB0aHJvdWdoKToKPiA+ID4gPiA+Pgo+ID4g
PiA+ID4+IGppdF90ZXh0X2FsbG9jKCkKPiA+ID4gPiA+PiBqaXRfdGV4dF9tYXBfcndfaW5wbGFj
ZSgpIC0+IG1hcCBhdCB0aGUgdGFyZ2V0IGFkZHJlc3MsIGJ1dCBSVywgIVgKPiA+ID4gPiA+Pgo+
ID4gPiA+ID4+IHdyaXRlIHRoZSB0ZXh0IGFuZCBhcHBseSBhbHRlcm5hdGl2ZXMKPiA+ID4gPiA+
Pgo+ID4gPiA+ID4+IGppdF90ZXh0X2ZpbmFsaXplKCkgLT4gY2hhbmdlIGZyb20gUlcgdG8gUlgg
KmFuZCBzeW5jaHJvbml6ZSoKPiA+ID4gPiA+Pgo+ID4gPiA+ID4+IGppdF90ZXh0X2ZpbmFsaXpl
KCkgd291bGQgZWl0aGVyIG5lZWQgdG8gd2FpdCBmb3IgUkNVIChwb3NzaWJseSBleHRyYQo+ID4g
PiA+ID4+IGhlYXZ5IHdlaWdodCBSQ1UgdG8gZ2V0ICJzZXJpYWxpemF0aW9uIikgb3Igc2VuZCBh
biBJUEkuCj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhpcyBlc3NlbnRpYWxseSBob3cgbW9kdWxlcyB3
b3JrIG5vdy4gVGhlIG1lbW9yeSBpcyBhbGxvY2F0ZWQgUlcsIHdyaXR0ZW4KPiA+ID4gPiA+IGFu
ZCB1cGRhdGVkIHdpdGggYWx0ZXJuYXRpdmVzIGFuZCB0aGVuIG1hZGUgUk9YIGluIHRoZSBlbmQg
d2l0aCBzZXRfbWVtb3J5Cj4gPiA+ID4gPiBBUElzLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoZSBp
c3N1ZSB3aXRoIG5vdCBoYXZpbmcgdGhlIG1lbW9yeSBtYXBwZWQgWCB3aGVuIGl0J3Mgd3JpdHRl
biBpcyB0aGF0IHdlCj4gPiA+ID4gPiBjYW5ub3QgdXNlIGxhcmdlIHBhZ2VzIHRvIG1hcCBpdC4g
T25lIG9mIHRoZSBnb2FscyBpcyB0byBoYXZlIGV4ZWN1dGFibGUKPiA+ID4gPiA+IG1lbW9yeSBt
YXBwZWQgd2l0aCBsYXJnZSBwYWdlcyBhbmQgbWFrZSBjb2RlIGFsbG9jYXRvciBhYmxlIHRvIGRp
dmlkZSB0aGF0Cj4gPiA+ID4gPiBwYWdlIGFtb25nIHNldmVyYWwgY2FsbGVycy4KPiA+ID4gPiA+
Cj4gPiA+ID4gPiBTbyB0aGUgaWRlYSB3YXMgdGhhdCBqaXRfdGV4dF9hbGxvYygpIHdpbGwgaGF2
ZSBhIGNhY2hlIG9mIGxhcmdlIHBhZ2VzCj4gPiA+ID4gPiBtYXBwZWQgUk9YLCB3aWxsIGFsbG9j
YXRlIG1lbW9yeSBmcm9tIHRob3NlIGNhY2hlcyBhbmQgdGhlcmUgd2lsbCBiZQo+ID4gPiA+ID4g
aml0X3VwZGF0ZSgpIHRoYXQgdXNlcyB0ZXh0IHBva2luZyBmb3Igd3JpdGluZyB0byB0aGF0IG1l
bW9yeS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBVcG9uIGFsbG9jYXRpb24gb2YgYSBsYXJnZSBwYWdl
IHRvIGluY3JlYXNlIHRoZSBjYWNoZSwgdGhhdCBsYXJnZSBwYWdlIHdpbGwKPiA+ID4gPiA+IGJl
ICJpbnZhbGlkYXRlZCIgYnkgZmlsbGluZyBpdCB3aXRoIGJyZWFrcG9pbnQgaW5zdHJ1Y3Rpb25z
IChlLmcgaW50MyBvbgo+ID4gPiA+ID4geDg2KQo+ID4gPiA+Cj4gPiA+ID4gSXMgdGhpcyBhY3R1
YWxseSB2YWxpZD8gIEluIGJldHdlZW4gaW50MyBhbmQgcmVhbCBjb2RlLCB0aGVyZeKAmXMgYQo+
ID4gPiA+IHBvdGVudGlhbCB0b3JuIHJlYWQgb2YgcmVhbCBjb2RlIG1peGVkIHVwIHdpdGggMHhj
Yy4KPiA+ID4KPiA+ID4gWW91IG1lYW4gd2hpbGUgZG9pbmcgdGV4dCBwb2tpbmc/Cj4gPgo+ID4g
SSB0aGluayB3ZSd2ZSBiZWVuIGdldHRpbmcgZGlzdHJhY3RlZCBieSB0ZXh0X3Bva2UoKS4gdGV4
dF9wb2tlKCkgZG9lcwo+ID4gdXBkYXRlcyB2aWEgYSBkaWZmZXJlbnQgdmlydHVhbCBhZGRyZXNz
IHdoaWNoIGludHJvZHVjZSBuZXcKPiA+IHN5bmNocm9uaWF0aW9uIHdyaW5rbGVzLCBidXQgaXQn
cyBub3QgdGhlIG1haW4gaXNzdWUuCj4gPgo+ID4gQXMgX3RoaW5rXyBJIHVuZGVyc3RhbmQgaXQs
IHRoZSByb290IG9mIHRoZSBpc3N1ZSBpcyB0aGF0IHNwZWN1bGF0aXZlCj4gPiBleGVjdXRpb24g
LSBhbmQgdGhhdCBwZXIgQW5keSwgc3BlY3VsYXRpdmUgZXhlY3V0aW9uIGRvZXNuJ3Qgb2JleSBt
ZW1vcnkKPiA+IGJhcnJpZXJzLgo+ID4KPiA+IEkgaGF2ZSBfbm90XyBkdWcgaW50byB0aGUgZGV0
YWlscyBvZiBob3cgcmV0cG9saW5lcyB3b3JrIGFuZCBhbGwgdGhlCj4gPiBzcGVjdHJlIHN0dWZm
IHRoYXQgd2FzIGdvaW5nIG9uLCBidXQgLSByZXRwb2xpbmUgdXNlcyBsZmVuY2UsIGRvZXNuJ3QK
PiA+IGl0PyBBbmQgaWYgc3BlY3VsYXRpdmUgZXhlY3V0aW9uIGlzIHRoZSBpc3N1ZSBoZXJlLCBp
c24ndCByZXRwb2xpbmUgd2hhdAo+ID4gd2UgbmVlZD8KPiA+Cj4gPiBGb3IgdGhpcyBwYXJ0aWN1
bGFyIGlzc3VlLCBJJ20gbm90IHN1cmUgImludmFsaWRhdGUgYnkgZmlsbGluZyB3aXRoCj4gPiBp
bGxlZ2FsIGluc3RydWN0aW9ucyIgbWFrZXMgc2Vuc2UuIEZvciB0aGF0IHRvIHdvcmssIHdvdWxk
IHRoZSBwcm9jZXNzb3IKPiA+IGhhdmUgdG8gZXhlY3V0ZSBhIHNlcmlhbGl6ZSBvcGVyYXRpb24g
YW5kIGEgcmV0cnkgb24gaGl0dGluZyBhbiBpbGxlZ2FsCj4gPiBpbnN0cnVjdGlvbiAtIG9yIHBl
cmhhcHMgd2UgZG8gaW4gdGhlIGludGVycnVwdCBoYW5kbGVyPwo+ID4KPiA+IEJ1dCBpZiBmaWxs
aW5nIHdpdGggaWxsZWdhbCBpbnN0cnVjdGlvbnMgZG9lcyBhY3QgYXMgYSBzcGVjdWxhdGlvbgo+
ID4gYmFycmllciwgdGhlbiB0aGUgaXNzdWUgaXMgdGhhdCBhIHRvcm4gcmVhZCBjb3VsZCBnZW5l
cmF0ZSBhIGxlZ2FsIGJ1dAo+ID4gaW5jb3JyZWN0IGluc3RydWN0aW9uLgo+Cj4gV2hhdCBpcyBh
ICJ0b3JuIHJlYWQiIGhlcmU/IEkgYXNzdW1lIGl0IGlzIGFuIGluc3RydWN0aW9uIHJlYWQgdGhh
dAo+IGdvZXMgYXQgdGhlIHdyb25nIGluc3RydWN0aW9uIGJvdW5kYXJ5IChDSVNDKS4gSWYgdGhp
cyBpcyBjb3JyZWN0LCBkbwo+IHdlIG5lZWQgdG8gaGFuZGxlIHRvcm4gcmVhZCBjYXVzZWQgYnkg
c29mdHdhcmUgYnVnLCBvciBoYXJkd2FyZQo+IGJpdCBmbGlwLCBvciBib3RoPwoKT24gQVJNNjQg
KFJJU0MpLCB0b3JuIHJlYWRzIGNhbid0IGhhcHBlbiBiZWNhdXNlIHRoZSBpbnN0cnVjdGlvbiBm
ZXRjaAppcyB3b3JkIGFsaWduZWQuIElmIHdlIHJlcGxhY2UgdGhlIHdob2xlIGluc3RydWN0aW9u
IGF0b21pY2FsbHkgdGhlbiB0aGVyZQp3b24ndCBiZSBoYWxmIG9sZCAtIGhhbGYgbmV3IGluc3Ry
dWN0aW9uIGZldGNoZXMuCgpUaGFua3MsClB1cmFuamF5CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
