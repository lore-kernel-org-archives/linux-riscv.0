Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301B7C2BD09
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 02:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GXrtXfziWKWuAPmT/lAZeuK/QTzI1qQND3W0VgooP0Y=; b=BIHem9lzcQyZdX
	9RguSKdbVJjq/LGok2vXpTATOrGA+mUovWVIsSOAyJiQXZoH2cNTHxkWOts28rzgXkw7ZjgDhnXZ8
	GHyl4NncNJJCs3idBkGJPVtHeTT2u5sPZdhzMIekOmQAAgwEptD7SPr8e664Nv1uAd7W9BtEGh0Z4
	ZP5IOkU4G52gv5S7SZA7TdqncHE3dg++X3IsSL33XkAg4Z8WTmBfObpqbHy32SAIEJ9A3luXCGrQ+
	4FAeK1eDcwE2NJVz/W82QIJws9cHoqvwvtPrhQ3dyHO7glqMPF/Z/qoyvssgAfMdCG2pSBXCYpszv
	/39dQoe6IYO09aqsTFCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLw5S-00000001LuB-1y5r;
	Tue, 25 Jun 2024 02:39:14 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLw5P-00000001Ltj-0gnj
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 02:39:13 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e02e4eb5c3dso4055237276.3
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 19:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719283150; x=1719887950; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x4nK+m/TEmRPZdUwZe7j9O1ig+33bNCxGNefCYINg2Q=;
        b=bYInWPvXXawtg7DK33A6OP8YOogzlO9XVCkbNjgoYWb0yImkUMwYO7Po+62nNcnmE6
         p++T0JhQtPczw3tS7wcKFp3iJBcUGsMkXoZuMInWgnIr7VMdWUljP9b6RAV2VnxDwJmM
         G8s5D8fq5Y65FvlWy0ChIwauciWps8XwE7ZjtYR0bM2YN7oh8r9qKd5GvqMIhhTKPBfr
         w1bR4xadpiMptf63RzK7EugzPsKPuej2U7Bt/7dosW/wguFbMWuFwidHRj+upRMlpRPr
         stIfaCzxfAmc3jZWCF2iw5EjBKuhSc541TJ+d4wSsNo3OYHGOwOOMc4ABxV8o3kCmKW2
         aFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719283150; x=1719887950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x4nK+m/TEmRPZdUwZe7j9O1ig+33bNCxGNefCYINg2Q=;
        b=LmBZHQqD7Ymm8LvKEkB/A+ZRzuq2n0Ve+Qbum3fULXiY3aiv/lS5H3kTgt5WfIOaTm
         KBzp2Nk5cU43DXz0m06Hn6BSr01isQC5ZyD3BLeeVwcsbaEr8RBFUZd+sS0DUaxZ0cWY
         j4ge3vPf7MJ5CWRtk5yeSPPhSxGvKEva9kTYmBvCP3aETUBer8hF9vszX2wcNEbmd566
         F+8f/RaG/MahKu4YDD8KD+sIxvBvk9fWwCNGhTlrF4oT+Yth8pP6HFhWiJ/gTSM3jbij
         9TKByRceDod3AMb39i+E5M/4mV9SOhsUiZWmt2ptPE8S5jDbWQ0lCaILfe6deyT9eubM
         nbDA==
X-Forwarded-Encrypted: i=1; AJvYcCUTyD24638hQMc9WIrNDbneVRvfS6sJG0WN7xHWldCSWbYZpp9+nXUrlUkqMKUOlr3srIbKVqaZFZGK+1+cqsad+c4FhV7OQPFvHmBqk1h/
X-Gm-Message-State: AOJu0YwHnk+cndp51u0H3P3QgYG5xnQn1Ok1sz/mM8Wh0wnN+NsTn+JD
	rdaWW6UndCbBQNofK6mShpgLesq8uaP/VDm898WghFrhSGr6mSdREfCAxbd+y2oDFbLOrRcxg0P
	X2ok3SCX/97rSirJPwJ86LmpOUmuLVWvrAj7YKQ==
X-Google-Smtp-Source: AGHT+IHKSN058g/QcX941p8tcRKTOzJPr409onokITSLEzi+0NUbHeNvo0EJpY+vaEpFjSnmhZzP/QtohyABMy5Rmf8=
X-Received: by 2002:a25:abcb:0:b0:e02:bab0:2b11 with SMTP id
 3f1490d57ef6-e02fc37b011mr6929278276.59.1719283149931; Mon, 24 Jun 2024
 19:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240624082141.153871-1-alexghiti@rivosinc.com> <CABgGipXR6ETkH0w-8GG8uBtKbG5jvD0VHz-A-VnXFPgvqrd6Lw@mail.gmail.com>
In-Reply-To: <CABgGipXR6ETkH0w-8GG8uBtKbG5jvD0VHz-A-VnXFPgvqrd6Lw@mail.gmail.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue, 25 Jun 2024 10:38:59 +0800
Message-ID: <CABgGipWOKqVynXW2OvxP3cfX7dvbjVES8t4epW+f3W11AJLgeA@mail.gmail.com>
Subject: Re: [PATCH -fixes] riscv: patch: Flush the icache right after
 patching to avoid illegal insns
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Puranjay Mohan <puranjay12@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_193911_528462_20E598B8 
X-CRM114-Status: GOOD (  28.23  )
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

T24gTW9uLCBKdW4gMjQsIDIwMjQgYXQgNzo0OeKAr1BNIEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNp
Zml2ZS5jb20+IHdyb3RlOgo+Cj4gSGkgQWxleCwKPgo+IE9uIE1vbiwgSnVuIDI0LCAyMDI0IGF0
IDQ6MjHigK9QTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3Rl
Ogo+ID4KPiA+IFdlIGNhbm5vdCBkZWxheSB0aGUgaWNhY2hlIGZsdXNoIGFmdGVyIHBhdGNoaW5n
IHNvbWUgZnVuY3Rpb25zIGFzIHdlIG1heQo+ID4gaGF2ZSBwYXRjaGVkIGEgZnVuY3Rpb24gdGhh
dCB3aWxsIGdldCBjYWxsZWQgYmVmb3JlIHRoZSBpY2FjaGUgZmx1c2guCj4gPgo+ID4gVGhlIG9u
bHkgd2F5IHRvIGNvbXBsZXRlbHkgYXZvaWQgc3VjaCBzY2VuYXJpbyBpcyBieSBmbHVzaGluZyB0
aGUgaWNhY2hlCj4gPiBhcyBzb29uIGFzIHdlIHBhdGNoIGEgZnVuY3Rpb24uIFRoaXMgd2lsbCBw
cm9iYWJseSBiZSBjb3N0bHkgYXMgd2UgZG9uJ3QKPiA+IGJhdGNoIHRoZSBpY2FjaGUgbWFpbnRl
bmFuY2UgYW55bW9yZS4KPiA+Cj4gPiBGaXhlczogNmNhNDQ1ZDhhZjBlICgicmlzY3Y6IEZpeCBl
YXJseSBmdHJhY2Ugbm9wIHBhdGNoaW5nIikKPiA+IFJlcG9ydGVkLWJ5OiBDb25vciBEb29sZXkg
PGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+ID4gQ2xvc2VzOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1yaXNjdi8yMDI0MDYxMy1sdWJyaWNhbnQtYnJlYXRoLTA2MTE5MmE5NDg5
YUB3ZW5keS8KPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJp
dm9zaW5jLmNvbT4KClJldmlld2VkLWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29t
PgoKPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2Z0cmFjZS5jIHwgIDcgKystLS0tLQo+
ID4gIGFyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMgIHwgMjYgKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9u
cygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9mdHJhY2UuYyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL2Z0cmFjZS5jCj4gPiBpbmRleCA4N2NiZDg2NTc2YjIuLjRiOTVjNTc0
ZmQwNCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2Z0cmFjZS5jCj4gPiArKysg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9mdHJhY2UuYwo+ID4gQEAgLTEyMCw5ICsxMjAsNiBAQCBpbnQg
ZnRyYWNlX2luaXRfbm9wKHN0cnVjdCBtb2R1bGUgKm1vZCwgc3RydWN0IGR5bl9mdHJhY2UgKnJl
YykKPiA+ICAgICAgICAgb3V0ID0gZnRyYWNlX21ha2Vfbm9wKG1vZCwgcmVjLCBNQ09VTlRfQURE
Uik7Cj4gPiAgICAgICAgIG11dGV4X3VubG9jaygmdGV4dF9tdXRleCk7Cj4gPgo+ID4gLSAgICAg
ICBpZiAoIW1vZCkKPiA+IC0gICAgICAgICAgICAgICBsb2NhbF9mbHVzaF9pY2FjaGVfcmFuZ2Uo
cmVjLT5pcCwgcmVjLT5pcCArIE1DT1VOVF9JTlNOX1NJWkUpOwo+ID4gLQo+ID4gICAgICAgICBy
ZXR1cm4gb3V0Owo+ID4gIH0KPiA+Cj4gPiBAQCAtMTU2LDkgKzE1Myw5IEBAIHN0YXRpYyBpbnQg
X19mdHJhY2VfbW9kaWZ5X2NvZGUodm9pZCAqZGF0YSkKPiA+ICAgICAgICAgfSBlbHNlIHsKPiA+
ICAgICAgICAgICAgICAgICB3aGlsZSAoYXRvbWljX3JlYWQoJnBhcmFtLT5jcHVfY291bnQpIDw9
IG51bV9vbmxpbmVfY3B1cygpKQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgY3B1X3JlbGF4
KCk7Cj4gPiAtICAgICAgIH0KPiA+Cj4gPiAtICAgICAgIGxvY2FsX2ZsdXNoX2ljYWNoZV9hbGwo
KTsKPiA+ICsgICAgICAgICAgICAgICBsb2NhbF9mbHVzaF9pY2FjaGVfYWxsKCk7Cj4gPiArICAg
ICAgIH0KPgo+IFNvcnJ5LCBtYXliZSBJIHNob3VsZCBwb2ludCBpdCBvdXQgZGlyZWN0bHkgZWFy
bGllci4gQnV0IEkgZG9uJ3QgdGhpbmsKPiB0aGlzIGRpZmYgY2h1bmsgaXMgcmVxdWlyZWQuIFRo
cmVhZHMgcnVubmluZyBpbiB0aGUgZWxzZSBjbGF1c2UgZnJvbQo+IHN0b3BfbWFjaGluZSBtdXN0
IG5vdCBydW4gaW50byBhbnkgcGF0Y2hhYmxlIGVudHJ5LiBJZiBpdCBydW5zIGludG8gYQo+IHBh
dGNoYWJsZSBlbnRyeSwgcnVubmluZyB0aGUgbG9jYWwgZmVuY2UuaSBpcyBub3QgZ29pbmcgdG8g
Zml4IHRoZQo+IHByb2JsZW0uCgpTb3JyeSwgSSByZWFkIHRoZSBjb2RlIHdyb25nLiBUaGUgbG9j
YWwgZmx1c2ggaXMgbm90IGluIHRoZSB3aGlsZQpsb29wLiBJIGhhdmUgbm8gcHJvYmxlbSB3aXRo
IHRoaXMgY2h1bmsgYWZ0ZXIgcHJvcGVybHkgc2VlaW5nIHRoZW0uCgo+Cj4gPgo+ID4gICAgICAg
ICByZXR1cm4gMDsKPiA+ICB9Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcGF0
Y2guYyBiL2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMKPiA+IGluZGV4IDQwMDc1NjNmYjYwNy4u
YWIwMzczMmQwNmM0IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYwo+
ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYwo+ID4gQEAgLTg5LDYgKzg5LDE0IEBA
IHN0YXRpYyBpbnQgX19wYXRjaF9pbnNuX3NldCh2b2lkICphZGRyLCB1OCBjLCBzaXplX3QgbGVu
KQo+ID4KPiA+ICAgICAgICAgbWVtc2V0KHdhZGRyLCBjLCBsZW4pOwo+ID4KPiA+ICsgICAgICAg
LyoKPiA+ICsgICAgICAgICogV2UgY291bGQgaGF2ZSBqdXN0IHBhdGNoZWQgYSBmdW5jdGlvbiB0
aGF0IGlzIGFib3V0IHRvIGJlCj4gPiArICAgICAgICAqIGNhbGxlZCBzbyBtYWtlIHN1cmUgd2Ug
ZG9uJ3QgZXhlY3V0ZSBwYXJ0aWFsbHkgcGF0Y2hlZAo+ID4gKyAgICAgICAgKiBpbnN0cnVjdGlv
bnMgYnkgZmx1c2hpbmcgdGhlIGljYWNoZSBhcyBzb29uIGFzIHBvc3NpYmxlLgo+ID4gKyAgICAg
ICAgKi8KPiA+ICsgICAgICAgbG9jYWxfZmx1c2hfaWNhY2hlX3JhbmdlKCh1bnNpZ25lZCBsb25n
KXdhZGRyLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHVuc2lnbmVkIGxv
bmcpd2FkZHIgKyBsZW4pOwo+ID4gKwo+ID4gICAgICAgICBwYXRjaF91bm1hcChGSVhfVEVYVF9Q
T0tFMCk7Cj4gPgo+ID4gICAgICAgICBpZiAoYWNyb3NzX3BhZ2VzKQo+ID4gQEAgLTEzNSw2ICsx
NDMsMTQgQEAgc3RhdGljIGludCBfX3BhdGNoX2luc25fd3JpdGUodm9pZCAqYWRkciwgY29uc3Qg
dm9pZCAqaW5zbiwgc2l6ZV90IGxlbikKPiA+Cj4gPiAgICAgICAgIHJldCA9IGNvcHlfdG9fa2Vy
bmVsX25vZmF1bHQod2FkZHIsIGluc24sIGxlbik7Cj4gPgo+ID4gKyAgICAgICAvKgo+ID4gKyAg
ICAgICAgKiBXZSBjb3VsZCBoYXZlIGp1c3QgcGF0Y2hlZCBhIGZ1bmN0aW9uIHRoYXQgaXMgYWJv
dXQgdG8gYmUKPiA+ICsgICAgICAgICogY2FsbGVkIHNvIG1ha2Ugc3VyZSB3ZSBkb24ndCBleGVj
dXRlIHBhcnRpYWxseSBwYXRjaGVkCj4gPiArICAgICAgICAqIGluc3RydWN0aW9ucyBieSBmbHVz
aGluZyB0aGUgaWNhY2hlIGFzIHNvb24gYXMgcG9zc2libGUuCj4gPiArICAgICAgICAqLwo+ID4g
KyAgICAgICBsb2NhbF9mbHVzaF9pY2FjaGVfcmFuZ2UoKHVuc2lnbmVkIGxvbmcpd2FkZHIsCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodW5zaWduZWQgbG9uZyl3YWRkciAr
IGxlbik7Cj4gPiArCj4gPiAgICAgICAgIHBhdGNoX3VubWFwKEZJWF9URVhUX1BPS0UwKTsKPiA+
Cj4gPiAgICAgICAgIGlmIChhY3Jvc3NfcGFnZXMpCj4gPiBAQCAtMTg5LDkgKzIwNSw2IEBAIGlu
dCBwYXRjaF90ZXh0X3NldF9ub3N5bmModm9pZCAqYWRkciwgdTggYywgc2l6ZV90IGxlbikKPiA+
Cj4gPiAgICAgICAgIHJldCA9IHBhdGNoX2luc25fc2V0KHRwLCBjLCBsZW4pOwo+ID4KPiA+IC0g
ICAgICAgaWYgKCFyZXQpCj4gPiAtICAgICAgICAgICAgICAgZmx1c2hfaWNhY2hlX3JhbmdlKCh1
aW50cHRyX3QpdHAsICh1aW50cHRyX3QpdHAgKyBsZW4pOwo+ID4gLQo+ID4gICAgICAgICByZXR1
cm4gcmV0Owo+ID4gIH0KPiA+ICBOT0tQUk9CRV9TWU1CT0wocGF0Y2hfdGV4dF9zZXRfbm9zeW5j
KTsKPiA+IEBAIC0yMjQsOSArMjM3LDYgQEAgaW50IHBhdGNoX3RleHRfbm9zeW5jKHZvaWQgKmFk
ZHIsIGNvbnN0IHZvaWQgKmluc25zLCBzaXplX3QgbGVuKQo+ID4KPiA+ICAgICAgICAgcmV0ID0g
cGF0Y2hfaW5zbl93cml0ZSh0cCwgaW5zbnMsIGxlbik7Cj4gPgo+ID4gLSAgICAgICBpZiAoIXJl
dCkKPiA+IC0gICAgICAgICAgICAgICBmbHVzaF9pY2FjaGVfcmFuZ2UoKHVpbnRwdHJfdCkgdHAs
ICh1aW50cHRyX3QpIHRwICsgbGVuKTsKPiA+IC0KPiA+ICAgICAgICAgcmV0dXJuIHJldDsKPiA+
ICB9Cj4gPiAgTk9LUFJPQkVfU1lNQk9MKHBhdGNoX3RleHRfbm9zeW5jKTsKPiA+IEBAIC0yNTMs
OSArMjYzLDkgQEAgc3RhdGljIGludCBwYXRjaF90ZXh0X2NiKHZvaWQgKmRhdGEpCj4gPiAgICAg
ICAgIH0gZWxzZSB7Cj4gPiAgICAgICAgICAgICAgICAgd2hpbGUgKGF0b21pY19yZWFkKCZwYXRj
aC0+Y3B1X2NvdW50KSA8PSBudW1fb25saW5lX2NwdXMoKSkKPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGNwdV9yZWxheCgpOwo+ID4gLSAgICAgICB9Cj4gPgo+ID4gLSAgICAgICBsb2NhbF9m
bHVzaF9pY2FjaGVfYWxsKCk7Cj4gPiArICAgICAgICAgICAgICAgbG9jYWxfZmx1c2hfaWNhY2hl
X2FsbCgpOwo+ID4gKyAgICAgICB9Cj4gPgo+ID4gICAgICAgICByZXR1cm4gcmV0Owo+ID4gIH0K
PiA+IC0tCj4gPiAyLjM5LjIKPiA+Cj4KPiBUaGFua3MsCj4gQW5keQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
