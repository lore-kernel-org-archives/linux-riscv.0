Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A3EC001B0
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 23:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oefXtrNzkWCeMqGyUaqhlpnjqtrNgmbCjd+SgeWlLQU=; b=ID92KKbAul8MEx
	k7ZqiujdOlOTTGKaSkRPEonen7/6aE0Tr6xhO7ssoWOW+dEI10hZh5eLieAQ6abSVJYsP52jF5lk2
	22C6YSpIjwNb7+Jj+VNnm/y0W1cUTOR72RY5vJLfZQs1jKfjyXdOL2vKBhIbB3H1jv9vuNxAFzdnF
	Jnz7O9IrdEM5BnWjIi+8kGQHmHi5vxNrCuVQlk6xARP1QLeUL8bpHcC2rAKcNmf/uQRl+ikyO1VBW
	zU/5CmMeOduOsO60t6h20kB8IvcWbYZaFXl67atfVC2p/PRe3Rdla21QolTwFeAQJ2LrKa2Vr6iL2
	nBSYnIAjGx13vKBMATyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTWQW-003gxz-2k;
	Tue, 08 Aug 2023 23:47:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTWQS-003gxG-2G
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 23:47:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0EA6C62E4A
	for <linux-riscv@lists.infradead.org>; Tue,  8 Aug 2023 23:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78265C433CC
	for <linux-riscv@lists.infradead.org>; Tue,  8 Aug 2023 23:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691538463;
	bh=389UaCJRCPWbGhB538d72pDJuAiVDJ/Ht7Zki/SMrHw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Z7Ax2CJ1h6ttitp46s+XIWct3qdaEHuFoRUIICdcSOQfk5ZGeIoHwmYAcxnTg3nGZ
	 zLzKcMgvEebiIhvKgbEytj99g/mj94rgeGhh1vL/KRSmVyg6JtwbzlBukKkVGFN327
	 On7fungrwYtaOW6Hod6BYnuyzfzNyETzGUHgCfty1Km/V4DeRjdB4B6VapNdI/4Mho
	 kEyK7ZKcLJO7Ulr248KHrhE4L6AHfDjqRN4w/a9mlBMYIH56LJ7bn/w4K5S981dip7
	 GbzyTd6ddQAsTD+9f/NjoRozXmEHh7CTEFsm6jtKSf01ea3P7grGxW/3d06E8xKEXx
	 x+eBNwKsq+x/A==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-99bf8e5ab39so916921966b.2
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 16:47:43 -0700 (PDT)
X-Gm-Message-State: AOJu0YwgJGuK8w6/kBpyiFXCngVBfWzKPvz0QrJ8HiizzggAOI/fVcUI
	V7zGyck+WOdvMy1xYvO7tz8hjQ+FtOpAorprBOY=
X-Google-Smtp-Source: AGHT+IF8GwQocRR0UF6D0EtxHHZUG5eeMP9PHbArq+HL2uAklIhtaIJ4aeif2R8AnJ7MNJZXVG3HcpN5x1NgHJP3sqs=
X-Received: by 2002:a17:906:84:b0:99b:674c:44eb with SMTP id
 4-20020a170906008400b0099b674c44ebmr945758ejc.9.1691538461697; Tue, 08 Aug
 2023 16:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230725132246.817726-1-alexghiti@rivosinc.com>
 <CAJF2gTRm59RAJvSf=L2uqbb3rHnANVheO+yLqrJGuVBh1w8Oug@mail.gmail.com> <ZMtv5+ut5z3pjlFJ@atctrx.andestech.com>
In-Reply-To: <ZMtv5+ut5z3pjlFJ@atctrx.andestech.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 9 Aug 2023 07:47:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRfaHngCtLmuQY967qo_kpitKqYXxDA5bA3FaF5kWz8Mg@mail.gmail.com>
Message-ID: <CAJF2gTRfaHngCtLmuQY967qo_kpitKqYXxDA5bA3FaF5kWz8Mg@mail.gmail.com>
Subject: Re: [PATCH -fixes] riscv: Implement flush_cache_vmap()
To: dylan <dylan@andestech.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_164744_842649_DFB39697 
X-CRM114-Status: GOOD (  36.61  )
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

T24gVGh1LCBBdWcgMywgMjAyMyBhdCA1OjE04oCvUE0gZHlsYW4gPGR5bGFuQGFuZGVzdGVjaC5j
b20+IHdyb3RlOgo+Cj4gT24gU3VuLCBKdWwgMzAsIDIwMjMgYXQgMDE6MDg6MTdBTSAtMDQwMCwg
R3VvIFJlbiB3cm90ZToKPiA+IE9uIFR1ZSwgSnVsIDI1LCAyMDIzIGF0IDk6MjLigK9BTSBBbGV4
YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBU
aGUgUklTQy1WIGtlcm5lbCBuZWVkcyBhIHNmZW5jZS52bWEgYWZ0ZXIgYSBwYWdlIHRhYmxlIG1v
ZGlmaWNhdGlvbjogd2UKPiA+ID4gdXNlZCB0byByZWx5IG9uIHRoZSB2bWFsbG9jIGZhdWx0IGhh
bmRsaW5nIHRvIGVtaXQgYW4gc2ZlbmNlLnZtYSwgYnV0Cj4gPiA+IGNvbW1pdCA3ZDMzMzJiZTAx
MWUgKCJyaXNjdjogbW06IFByZS1hbGxvY2F0ZSBQR0QgZW50cmllcyBmb3IKPiA+ID4gdm1hbGxv
Yy9tb2R1bGVzIGFyZWEiKSBnb3QgcmlkIG9mIHRoaXMgcGF0aCBmb3IgNjQtYml0IGtlcm5lbHMs
IHNvIG5vdyB3ZQo+ID4gPiBuZWVkIHRvIGV4cGxpY2l0bHkgZW1pdCBhIHNmZW5jZS52bWEgaW4g
Zmx1c2hfY2FjaGVfdm1hcCgpLgo+ID4gPgo+ID4gPiBOb3RlIHRoYXQgd2UgZG9uJ3QgbmVlZCB0
byBpbXBsZW1lbnQgZmx1c2hfY2FjaGVfdnVubWFwKCkgYXMgdGhlIGdlbmVyaWMKPiA+ID4gY29k
ZSBzaG91bGQgZW1pdCBhIGZsdXNoIHRsYiBhZnRlciB1bm1hcHBpbmcgYSB2bWFsbG9jIHJlZ2lv
bi4KPiA+ID4KPiA+ID4gRml4ZXM6IDdkMzMzMmJlMDExZSAoInJpc2N2OiBtbTogUHJlLWFsbG9j
YXRlIFBHRCBlbnRyaWVzIGZvciB2bWFsbG9jL21vZHVsZXMgYXJlYSIpCj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiA+ID4gLS0t
Cj4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaCB8IDQgKysrKwo+ID4g
PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmggYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2NhY2hlZmx1c2guaAo+ID4gPiBpbmRleCA4MDkxYjhiZjQ4ODMuLmI5M2ZmZGRmOGE2
MSAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgK
PiA+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgKPiA+ID4gQEAg
LTM3LDYgKzM3LDEwIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF9kY2FjaGVfcGFnZShzdHJ1
Y3QgcGFnZSAqcGFnZSkKPiA+ID4gICNkZWZpbmUgZmx1c2hfaWNhY2hlX3VzZXJfcGFnZSh2bWEs
IHBnLCBhZGRyLCBsZW4pIFwKPiA+ID4gICAgICAgICBmbHVzaF9pY2FjaGVfbW0odm1hLT52bV9t
bSwgMCkKPiA+ID4KPiA+ID4gKyNpZmRlZiBDT05GSUdfNjRCSVQKPiA+ID4gKyNkZWZpbmUgZmx1
c2hfY2FjaGVfdm1hcChzdGFydCwgZW5kKSAgIGZsdXNoX3RsYl9rZXJuZWxfcmFuZ2Uoc3RhcnQs
IGVuZCkKPiA+IFNvcnJ5LCBJIGNvdWxkbid0IGFncmVlIHdpdGggdGhlIGFib3ZlIGluIGEgUElQ
VCBjYWNoZSBtYWNoaW5lLiBJdCdzCj4gPiBub3Qgd29ydGggZm9yLgo+ID4KPiA+IEl0IHdvdWxk
IHJlZHVjZSB0aGUgcGVyZm9ybWFuY2Ugb2Ygdm1hcF9wYWdlc19yYW5nZSwKPiA+IGlvcmVtYXBf
cGFnZV9yYW5nZSAuLi4gQVBJLCB3aGljaCBtYXkgY2F1c2Ugc29tZSBkcml2ZXJzJyBwZXJmb3Jt
YW5jZQo+ID4gaXNzdWVzIHdoZW4gdGhleSBpbnN0YWxsL3VuaW5zdGFsbCBtZW1vcnkgZnJlcXVl
bnRseS4KPiA+Cj4KPiBIaSBBbGwsCj4KPiBJIHRoaW5rIGZ1bmN0aW9uYWwgY29ycmVjdG5lc3Mg
c2hvdWxkIGJlIG1vcmUgaW1wb3J0YW50IHRoYW4gc3lzdGVtIHBlcmZvcm1hbmNlCj4gaW4gdGhp
cyBjYXNlLiBUaGUgInByZXZlbnRpdmUiIFNGRU5DRS5WTUEgYmVjYW1lIG5lY2Vzc2FyeSBkdWUg
dG8gdGhlIFJJU0MtVgo+IHNwZWNpZmljYXRpb24gYWxsb3dpbmcgaW52YWxpZGF0aW9uIGVudHJp
ZXMgdG8gYmUgY2FjaGVkIGluIHRoZSBUTEIuCj4KPiBUaGUgcHJvYmxlbVsxXSB3ZSBhcmUgY3Vy
cmVudGx5IGVuY291bnRlcmluZyBpcyBjYXVzZWQgYnkgbm90IHVwZGF0aW5nIHRoZSBUTEIKPiBh
ZnRlciB0aGUgcGFnZSB0YWJsZSBpcyBjcmVhdGVkLCBhbmQgdGhlIHNvbHV0aW9uIHRvIHRoaXMg
cHJvYmxlbSBjYW4gb25seSBiZQo+IHNvbHZlZCBieSB1cGRhdGluZyB0aGUgVExCIGltbWVkaWF0
ZWx5IGFmdGVyIHRoZSBwYWdlIHRhYmxlIGlzIGNyZWF0ZWQuCj4KPiBUaGVyZSBhcmUgY3VycmVu
dGx5IHR3byBwb3NzaWJsZSBhcHByb2FjaGVzIHRvIGZsdXNoIFRMQjoKPiAxLiBGbHVzaCBUTEIg
aW4gZmx1c2hfY2FjaGVfdm1hcCgpCj4gMi4gRmx1c2ggVExCIGluIGFyY2hfc3luY19rZXJuZWxf
bWFwcGluZ3MoKQo+Cj4gQnV0IEknbSBub3QgcXVpdGUgc3VyZSBpZiBpdCdzIGEgZ29vZCBpZGVh
IHRvIG9wZXJhdGUgb24gdGhlIFRMQiBpbnNpZGUgZmx1c2hfY2FjaGVfdm1hcCgpLgo+IFRoZSBu
YW1lIG9mIHRoaXMgZnVuY3Rpb24gaW5kaWNhdGVzIHRoYXQgaXQgc2hvdWxkIGJlIHJlbGF0ZWQg
dG8gY2FjaGUgb3BlcmF0aW9ucywgbWF5YmUKPiBpdCB3b3VsZCBiZSBtb3JlIGFwcHJvcHJpYXRl
IHRvIGRvIFRMQiBmbHVzaCBpbiBhcmNoX3N5bmNfa2VybmVsX21hcHBpbmdzKCk/Cj4KPiBbMV06
IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9saW51eC1yaXNjdi8yMDIzLUF1
Z3VzdC8wMzc1MDMuaHRtbApOb3QgYWxsIG1hY2hpbmVzIG5lZWQgaXQsIGFuZCBzb21lIENQVXMg
cHJldmVudCBQVEUuVj0wIGludG8gVExCCmR1cmluZyBQVFcsIHdoaWNoIGlzIHN0cm9uZ2VyIHRo
YW4gSVNBJ3MgcmVxdWlyZW1lbnQuCgpTbyBjb3VsZCB3ZSBwdXQgYW4gZXJyYXRhIGFsdGVybmF0
aXZlIGhlcmU/Cgo+Cj4gQmVzdCByZWdhcmRzLAo+IER5bGFuCj4KPiA+ID4gKyNlbmRpZgo+ID4g
PiArCj4gPiA+ICAjaWZuZGVmIENPTkZJR19TTVAKPiA+ID4KPiA+ID4gICNkZWZpbmUgZmx1c2hf
aWNhY2hlX2FsbCgpIGxvY2FsX2ZsdXNoX2ljYWNoZV9hbGwoKQo+ID4gPiAtLQo+ID4gPiAyLjM5
LjIKPiA+ID4KPiA+Cj4gPgo+ID4gLS0KPiA+IEJlc3QgUmVnYXJkcwo+ID4gIEd1byBSZW4KPiA+
Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4g
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2CgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
