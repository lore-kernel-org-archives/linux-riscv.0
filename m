Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158E7EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 02:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NX5ZHjv5zmA+9OE/xzwwoif23CcyFzSBMAh8qHizSzI=; b=kW/oObW0loLk7z
	4hJpTvSP4FZYeRaXLiy36VAjykkSsL/TFnfeZnLDhW+e+hZtupCTHb0uoe1kv7J/FIlhm4xyGztJ2
	Z2IqvBACgoEySqMrZEDTO/dL0iMRRDKTLKZmXC9VRzoh9Lfs0EZyRX9a9Wrc/QtOkW843uqMw3fS7
	Xlu6IzciWB4adXyWbdiVblORr9e496wQtmACmAYKmxxD3YvTZfm8t+W6KoTCnbT+0GAKCvB1XKQ4f
	LzzKMycTPKAnjTJxrD/SOxSJbuqjgf7+sB3akFwcurlCGjW0U+1HW4y0SBJGlY5W0NiuzN02xuLYj
	OLpIlmy6/RoUquGHAnyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRkZY-00BNfJ-1A;
	Fri, 04 Aug 2023 02:29:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRkZV-00BNed-0M
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 02:29:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 25FA861EDD
	for <linux-riscv@lists.infradead.org>; Fri,  4 Aug 2023 02:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B661C433C7
	for <linux-riscv@lists.infradead.org>; Fri,  4 Aug 2023 02:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691116183;
	bh=zWadd+nLUkzK7Qkbi0JVFnWY+DZxXhVnu+uRMkl4cvM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rWbHkLeF5jvoprucAQG1R8Avh37uG37xxu2sUcV+o8GF/yDfwXphZkafQmlfmRv1l
	 H3MwogSRVk7Ke2F/Jy79Rxn6wnArkuVcymJB/Fa9RSgbiVpgtQ30b7yPCKqUfw0CU+
	 JwhX35MVy5+gtiDt+FwkLIiC+VZLZOL7+HhWUfiazF2QQkNVwy4gqCHGFrvjuiNUSk
	 ZdfgsWnovVcT793V5y7tnuv/6L/8z4FnumDs1ZS5MI0fELD7jp25SNiNbXrVIEMWEx
	 5aFLFrwdSNwhAM6k9FDrzbRiE3YM1qTRp0b1w+rikRpmnKkco47/4r29Vz6hfomA/6
	 i0atXJuJUqZNA==
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3179ed1dfbbso1439319f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 19:29:43 -0700 (PDT)
X-Gm-Message-State: AOJu0YzhW6p4mAnu/KgceAcIeOWeO6TIViKwbDrngUUUjWsiDKE8Brhq
	v9yb3GRE4d5AQdHofdqWjIYfsA8AUJt52x86j3c=
X-Google-Smtp-Source: AGHT+IEkPAXOGnXrKYu3Sb56FrbeQ2U7eXDYfeJXqFRBo1QS/XiQ3WATCmqBu/Ez1NjatdFQ6vwQ4mjmPIWf98kZesc=
X-Received: by 2002:adf:ebcc:0:b0:317:6a07:83a7 with SMTP id
 v12-20020adfebcc000000b003176a0783a7mr217303wrn.38.1691116181741; Thu, 03 Aug
 2023 19:29:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230803051401.710236-2-leobras@redhat.com> <CAJF2gTShfMzVZw5TVqBvLNAzEBMzhWxNGC9JS70euPcKKN85zQ@mail.gmail.com>
 <CAJ6HWG5mzxN=txnbdi-=c+=wLsDfSe7Me+1DQE79ZX0NN6U1_g@mail.gmail.com>
In-Reply-To: <CAJ6HWG5mzxN=txnbdi-=c+=wLsDfSe7Me+1DQE79ZX0NN6U1_g@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 4 Aug 2023 10:29:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTag3hR7ZgM8o+yk+0Ox3A+xm4jAVTikAA0HqXQFKayRA@mail.gmail.com>
Message-ID: <CAJF2gTTag3hR7ZgM8o+yk+0Ox3A+xm4jAVTikAA0HqXQFKayRA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/3] Deduplicate RISCV cmpxchg.h and atomic.c macros
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_192945_337302_4343E1C7 
X-CRM114-Status: GOOD (  38.03  )
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

T24gRnJpLCBBdWcgNCwgMjAyMyBhdCAxMDoyMOKAr0FNIExlb25hcmRvIEJyYXMgU29hcmVzIFBh
c3Nvcwo8bGVvYnJhc0ByZWRoYXQuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgQXVnIDMsIDIwMjMg
YXQgOTo1M+KAr1BNIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBP
biBUaHUsIEF1ZyAzLCAyMDIzIGF0IDE6MTTigK9QTSBMZW9uYXJkbyBCcmFzIDxsZW9icmFzQHJl
ZGhhdC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBJIHVuaWZpZWQgcHJldmlvdXMgcGF0Y2hzZXRz
IGludG8gYSBzaW5nbGUgb25lLCBzaW5jZSB0aGUgd29yayBpcyByZWxhdGVkLgo+ID4gPgo+ID4g
PiBXaGlsZSBzdHVkeWluZyByaXNjdidzIGNtcHhjaGcuaCBmaWxlLCBJIGdvdCByZWFsbHkgaW50
ZXJlc3RlZCBpbgo+ID4gPiB1bmRlcnN0YW5kaW5nIGhvdyBSSVNDViBhc20gaW1wbGVtZW50ZWQg
dGhlIGRpZmZlcmVudCB2ZXJzaW9ucyBvZgo+ID4gPiB7Y21wLH14Y2hnLgo+ID4gPgo+ID4gPiBX
aGVuIEkgdW5kZXJzdG9vZCB0aGUgcGF0dGVybiwgaXQgbWFkZSBzZW5zZSBmb3IgbWUgdG8gcmVt
b3ZlIHRoZQo+ID4gPiBkdXBsaWNhdGlvbnMgYW5kIGNyZWF0ZSBtYWNyb3MgdG8gbWFrZSBpdCBl
YXNpZXIgdG8gdW5kZXJzdGFuZCB3aGF0IGV4YWN0bHkKPiA+ID4gY2hhbmdlcyBiZXR3ZWVuIHRo
ZSB2ZXJzaW9uczogSW5zdHJ1Y3Rpb24gc3VmaXhlcyAmIGJhcnJpZXJzLgo+ID4gPgo+ID4gPiBB
bHNvLCBkaWQgdGhlIHNhbWUga2luZCBvZiB3b3JrIG9uIGF0b21pYy5jLgo+ID4gPgo+ID4gPiBO
b3RlIHRvIEd1byBSZW46Cj4gPiA+IEkgZGlkIHNvbWUgZnVydGhlciBpbXByb3ZlbWVudCBhZnRl
ciB5b3VyIHByZXZpb3VzIHJldmlld3MsIHNvIEkgZW5kZWQKPiA+ID4gdXAgYWZyYWlkIGluY2x1
ZGluZyB5b3VyIFJldmlld2VkLWJ5IGJlZm9yZSBjaGVjaGluZyBpZiB0aGUgY2hhbmdlcyBhcmUK
PiA+ID4gb2sgZm9yIHlvdS4gUGxlYXNlIGNoZWNrIGl0IG91dCBhZ2FpbiwgSSBqdXN0IHJlbW92
ZWQgc29tZSBoZWxwZXIgbWFjcm9zCj4gPiA+IHRoYXQgd2VyZSBub3QgYmVpbmcgdXNlZCBlbHNl
d2hlcmUgaW4gdGhlIGtlcm5lbC4KPiA+IEkgZm91bmQgdGhpcyBvcHRpbWl6YXRpb24gaGFzIGNv
bmZsaWN0cyB3aXRoIHRoZSBiZWxvdyBwYXRjaGVzOgo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtcmlzY3YvMjAyMzA4MDIxNjQ3MDEuMTkyNzkxLTE1LWd1b3JlbkBrZXJuZWwub3Jn
Lwo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMzA4MDIxNjQ3MDEu
MTkyNzkxLTUtZ3VvcmVuQGtlcm5lbC5vcmcvCj4gPgo+ID4gSWYgeW91cnMgbWVyZ2VkLCBob3cg
ZG8gd2Ugc3VwcG9ydCB0aGUgaW5saW5lIGNtcHhjaGcveGNoZ19zbWFsbAo+ID4gZnVuY3Rpb24/
Cj4KPiBPaCwgSSBhY3R1YWxseSBpbnRyb2R1Y2VkIG15IHNlcmllcyBzbyBJIGNvdWxkIGludHJv
ZHVjZSBuZXcgeGNoZyBhbmQKPiBjbXB4Y2hnIGZvciBzaXplIDEgYW5kIDIuIElzIHRoYXQgd2hh
dCB5b3VyIHBhdGNoZXMgYXJlIGFib3V0LCByaWdodD8KPgo+IEkgd2FzIHdvcmtpbmcgb24gdGhh
dCB5ZXN0ZXJkYXksIGFuZCBkZWNpZGVkIHRvIHNlbmQgdGhlIHBhdGNoc2V0Cj4gd2l0aG91dCB0
aGVtIGJlY2F1c2UgSSB3YXMgc3RpbGwgbm90IHN1cmUgZW5vdWdoLgo+Cj4gQWJvdXQgaW1wbGVt
ZW50YXRpb24gc3RyYXRlZ3ksIEkgd2FzIGludHJvZHVjaW5nIGEgbmV3IG1hY3JvcyBmb3IgeGNo
Zwo+ICYgY21weGNoZyB3aXRoIGFzbSB3aGljaCB3b3VsZCB3b3JrIGZvciBib3RoIGZvciBzaXpl
IDEgJiBzaXplIDIsIGFuZAo+IHVzZSB0aGUgc3dpdGNoLWNhc2UgdG8gY3JlYXRlIHRoZSBtYXNr
IGFuZCBhbmRfdmFsdWUuCj4KPiBZb3UgdGhpbmsgdGhhdCB3b3JrcyBlbm91Z2g/Ckdvb2QsIGdv
IGFoZWFkLgoKPgo+ID4gSXQncyB2ZXJ5IHN0cnVnZ2xpbmcgdG8gdXNlIG1hY3JvcyB0byBpbXBs
ZW1lbnQgY29tcGxleAo+ID4gZnVuY3Rpb25zLgo+Cj4gSSBhZ3JlZSwgYnV0IHdpdGggdGhpcyB3
ZSBjYW4gYWNoaWV2ZSBtb3JlIGdlbmVyaWMgY29kZSwgd2hpY2ggbWFrZXMKPiBtb3JlIGNsZWFy
IHdoYXQgaXMgdGhlIHBhdHRlcm4gZm9yIGdpdmVuIGZ1bmN0aW9uLgo+Cj4gPiBDb3VsZCB5b3Ug
Y29uc2lkZXIgYSBtb3JlIHJlbGF4ZWQgb3B0aW1pemF0aW9uIGluIHdoaWNoIHdlIGNvdWxkCj4g
PiBpbnNlcnQgaW5saW5lIGNtcHhjaGcveGNoZ19zbWFsbD8KPgo+IFdoYXQgYWJvdXQgdGhpczog
SSBmaW5pc2ggdGhlIHBhdGNoZXMgSSBoYXZlIGJlZW4gd29ya2luZyB3aXRoCj4gKGNtcHhjaGcg
JiB4Y2hnIGZvciBzaXplcyAxIGFuZCAyKSwgYW5kIGlmIHRoZXkgYXJlIGZpbmUgd2UgZXhwYW5k
Cj4gdGhpcyBwYXRjaHNldCB3aXRoIHRoZW0uICBJZiBub3QsIEkgdHJ5IHJlbGF4aW5nIHRoZW0g
YSBsaXR0bGUgc28gd2UKPiBjYW4gbWVyZ2Ugd2l0aCB5b3VyIHNldC4KPgo+IERvZXMgdGhhdCB3
b3JrIGZvciB5b3U/CkdyZWF0LCB5b3UgY291bGQgcHJvdmlkZSBjbXB4Y2hnICYgeGNoZyBmb3Ig
c2l6ZXMgMSBhbmQgMiwgdGhlbiBteQpwYXRjaCBzZXJpZXMgd291bGQgYmFzZSBvbiB5b3Vycy4g
QWZ0ZXIgdGVzdGVkLCBJIHdvdWxkIGdpdmUgeW91ClRlc3RlZC1ieS4KPgo+IEJlc3QgcmVnYXJk
cywKPiBMZW8KPgo+Cj4gPgo+ID4gPgo+ID4gPiBUaGFua3MhCj4gPiA+IExlbwo+ID4gPgo+ID4g
Pgo+ID4gPiBDaGFuZ2VzIHNpbmNlIHNxdWFzaGVkIGNtcHhjaGc6Cj4gPiA+IC0gVW5pZmllZCB3
aXRoIGF0b21pYy5jIHBhdGNoc2V0Cj4gPiA+IC0gUmViYXNlZCBvbiB0b3Agb2YgdG9ydmFsZHMv
bWFzdGVyICh0aGFua3MgQW5kcmVhIFBhcnJpISkKPiA+ID4gLSBSZW1vdmVkIGhlbHBlciBtYWNy
b3MgdGhhdCB3ZXJlIG5vdCBiZWluZyB1c2VkIGVsc2V3aGVyZSBpbiB0aGUga2VybmVsLgo+ID4g
Pgo+ID4gPiBDaGFuZ2VzIHNpbmNlIChjbXB4Y2hnKSBSRkN2MzoKPiA+ID4gLSBTcXVhc2hlZCB0
aGUgNiBvcmlnaW5hbCBwYXRjaGVzIGluIDI6IG9uZSBmb3IgY21weGNoZyBhbmQgb25lIGZvciB4
Y2hnCj4gPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDQwNDE2Mzc0MS4yNzYy
MTY1LTEtbGVvYnJhc0ByZWRoYXQuY29tLwo+ID4gPgo+ID4gPiBDaGFuZ2VzIHNpbmNlIChjbXB4
Y2hnKSBSRkN2MjoKPiA+ID4gLSBGaXhlZCAgbWFjcm9zIHRoYXQgZGVwZW5kIG9uIGhhdmluZyBh
IGxvY2FsIHZhcmlhYmxlIHdpdGggYSBtYWdpYyBuYW1lCj4gPiA+IC0gUHJldmlvdXMgY2FzdCB0
byAobG9uZykgaXMgbm93IG9ubHkgYXBwbGllZCBvbiA0LWJ5dGVzIGNtcHhjaGcKPiA+ID4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwMzIxMDc0MjQ5LjIyMjE2NzQtMS1sZW9icmFz
QHJlZGhhdC5jb20vCj4gPiA+Cj4gPiA+IENoYW5nZXMgc2luY2UgKGNtcHhjaGcpIFJGQ3YxOgo+
ID4gPiAtIEZpeGVkIHBhdGNoIDQvNiBzdWZmaXggZnJvbSAndy5hcXJsJyB0byAnLncuYXFybCcs
IHRvIGF2b2lkIGJ1aWxkIGVycm9yCj4gPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDIzMDMxODA4MDA1OS4xMTA5Mjg2LTEtbGVvYnJhc0ByZWRoYXQuY29tLwo+ID4gPgo+ID4gPgo+
ID4gPiBMZW9uYXJkbyBCcmFzICgzKToKPiA+ID4gICByaXNjdi9jbXB4Y2hnOiBEZWR1cGxpY2F0
ZSB4Y2hnKCkgYXNtIGZ1bmN0aW9ucwo+ID4gPiAgIHJpc2N2L2NtcHhjaGc6IERlZHVwbGljYXRl
IGNtcHhjaGcoKSBhc20gYW5kIG1hY3Jvcwo+ID4gPiAgIHJpc2N2L2F0b21pYy5oIDogRGVkdXBs
aWNhdGUgYXJjaF9hdG9taWMuKgo+ID4gPgo+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9h
dG9taWMuaCAgfCAxNjQgKysrKysrKystLS0tLS0tLQo+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9jbXB4Y2hnLmggfCAzMTggKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4g
PiAgMiBmaWxlcyBjaGFuZ2VkLCAxMjMgaW5zZXJ0aW9ucygrKSwgMzU5IGRlbGV0aW9ucygtKQo+
ID4gPgo+ID4gPiAtLQo+ID4gPiAyLjQxLjAKPiA+ID4KPiA+Cj4gPgo+ID4gLS0KPiA+IEJlc3Qg
UmVnYXJkcwo+ID4gIEd1byBSZW4KPiA+Cj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
