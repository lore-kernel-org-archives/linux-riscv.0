Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A5DC77B7A
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 21:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L0KIz/PXm5g3ND3JGS5PlXmMeWknN0vB8CUWg11scWo=; b=WbzPHt2W5TqIPe
	IgPQqZcdysmh9fSq7zTYX0QPWsBVU/kGKbmm2asvSBl9MILoTl7UEpBYmSqB+1SwKwdhfwdKb7RN7
	H0lY4Hu2xP+kln8gzcGXw6FMbCY5wz3rEuflPnSAD7pvIwjrfOFqMBGUyAiR4PZb4h0GyGxKg4X2r
	DDFC35na8ZFLtm9Z8f9lO45mABjWG2SEV3BEGxrtEDFTw8V0DQnOk2FG20jzVZXvTEFsbs9UPV7nm
	OxuvQVVq6XHio+WDwa6E5hv+C0Z+b65B8Ewo6w3jlMuNVAwFZdNkRryVCSQI/U1io55/0HVUBCm5s
	kTgBjfvcsLVWeZwxzRUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5YXj-00ActQ-1c;
	Sat, 03 Jun 2023 21:12:11 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5YXe-00Acqq-2t;
	Sat, 03 Jun 2023 21:12:08 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b1b30445cfso21840051fa.1;
        Sat, 03 Jun 2023 14:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685826722; x=1688418722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywQUs5Fiz0nF2jpbvNI9hUxAw7fBwSlpxtNbhNWOdKQ=;
        b=RDS3HF6Dzg4udc+gzR1ge+A8FipEjdhBSdULq7dQD2UyV6dgjBvuZgGerD6vUs2YSm
         VDnqI9KNtr2Dk7Dcagvb3z7MHB6yFn9dZVHE0avEHhNOnZSxu+haoNYcH+DbvcdZqhp2
         V/2FcSs+Og/LSo+4chvosoksvs7WCJCCw38bmEWjYWWbCKP1NNCl8K5ura9Sf0w8P5PP
         7V+264OxyeQzdq0h0Oa1oSNUiGbjJiqkYN3172ascXs+vGBmB8K0oc564ajmaECysFRA
         O+qDRdpmwpV7013SWgjBPZmxYgAbk4/aYxoKzE2wIVyrPNGanFSOTGWVNORuh+LwDAsi
         f1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685826722; x=1688418722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ywQUs5Fiz0nF2jpbvNI9hUxAw7fBwSlpxtNbhNWOdKQ=;
        b=UPEWGY/syhh+zD8QrDgdopqWCJi1znmpUGFpi+con0P8hesDWLNQl7EhgNodrL01A+
         g+mczNPFK0nHG5prQo+JckzkOPmN7BUvW2UC4NrAJh7TPQqn8XdDmi2gGMczYiQMHzCi
         uJ6Z/jI7IM5brZv4jRs/mzYa+sEsB++vyTr/6CMJbxkdsN3CslU1ZZrRqUlrbl1kQfHp
         hUR1ZAzYQKf0ENZkcdPS7XzPkPj29CO1oNmEX1EIwvtdeCo77OhMKQ2FqIzsQXYxojHZ
         ydoxQLoxuu5C0BrlDDtWJrZ+WubeoTNDOVwft+66vWVm9EjXQLdG8vopsFKG5haGxjg8
         uwBg==
X-Gm-Message-State: AC+VfDyWznMxfn3AXRnL4RUGgo4FyOBgtgZx3epPLp3NJSIomnFfIhWb
	jcIStz7bCwKV2t+m+w89G8/RWXDtsGbJjZpypWY=
X-Google-Smtp-Source: ACHHUZ7QpjsIySl/XiT4DfbanAj3JM5KVAqgA/T1nohoUOzVT96eBA8GwqXTmRgv+kLRpCQJ8cFP5VM7V3QLXDceJ3I=
X-Received: by 2002:a2e:88d6:0:b0:2a7:b986:3481 with SMTP id
 a22-20020a2e88d6000000b002a7b9863481mr1909233ljk.41.1685826722179; Sat, 03
 Jun 2023 14:12:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230601101257.530867-1-rppt@kernel.org> <ZHjDU/mxE+cugpLj@FVFF77S0Q05N.cambridge.arm.com>
 <ZHjgIH3aX9dCvVZc@moria.home.lan> <ZHm3zUUbwqlsZBBF@FVFF77S0Q05N> <CAPhsuW7Euczff_KB70nuH=Hhf2EYHAf=xiQR7mFqVfByhD34XA@mail.gmail.com>
In-Reply-To: <CAPhsuW7Euczff_KB70nuH=Hhf2EYHAf=xiQR7mFqVfByhD34XA@mail.gmail.com>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Sat, 3 Jun 2023 23:11:51 +0200
Message-ID: <CANk7y0jtFA4sKgh2o2gAydLNzOxfZ0r3LVRuzzTGS8Qv0BuJGg@mail.gmail.com>
Subject: Re: [PATCH 00/13] mm: jit/text allocator
To: Song Liu <song@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "David S. Miller" <davem@davemloft.net>, 
	Dinh Nguyen <dinguyen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Russell King <linux@armlinux.org.uk>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_141206_953383_7566B189 
X-CRM114-Status: GOOD (  43.06  )
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

T24gRnJpLCBKdW4gMiwgMjAyMyBhdCA4OjIx4oCvUE0gU29uZyBMaXUgPHNvbmdAa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1biAyLCAyMDIzIGF0IDI6MzXigK9BTSBNYXJrIFJ1dGxh
bmQgPG1hcmsucnV0bGFuZEBhcm0uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIEp1biAwMSwg
MjAyMyBhdCAwMjoxNDo1NlBNIC0wNDAwLCBLZW50IE92ZXJzdHJlZXQgd3JvdGU6Cj4gPiA+IE9u
IFRodSwgSnVuIDAxLCAyMDIzIGF0IDA1OjEyOjAzUE0gKzAxMDAsIE1hcmsgUnV0bGFuZCB3cm90
ZToKPiA+ID4gPiBGb3IgYSB3aGlsZSBJIGhhdmUgd2FudGVkIHRvIGdpdmUga3Byb2JlcyBpdHMg
b3duIGFsbG9jYXRvciBzbyB0aGF0IGl0IGNhbiB3b3JrCj4gPiA+ID4gZXZlbiB3aXRoIENPTkZJ
R19NT0RVTEVTPW4sIGFuZCBzbyB0aGF0IGl0IGRvZXNuJ3QgaGF2ZSB0byB3YXN0ZSBWQSBzcGFj
ZSBpbgo+ID4gPiA+IHRoZSBtb2R1bGVzIGFyZWEuCj4gPiA+ID4KPiA+ID4gPiBHaXZlbiB0aGF0
LCBJIHRoaW5rIHRoZXNlIHNob3VsZCBoYXZlIHRoZWlyIG93biBhbGxvY2F0b3IgZnVuY3Rpb25z
IHRoYXQgY2FuIGJlCj4gPiA+ID4gcHJvdmlkZWQgaW5kZXBlbmRlbnRseSwgZXZlbiBpZiB0aG9z
ZSBoYXBwZW4gdG8gdXNlIGNvbW1vbiBpbmZyYXN0cnVjdHVyZS4KPiA+ID4KPiA+ID4gSG93IG11
Y2ggbWVtb3J5IGNhbiBrcHJvYmVzIGNvbmNlaXZhYmx5IHVzZT8gSSB0aGluayB3ZSBhbHNvIHdh
bnQgdG8gdHJ5Cj4gPiA+IHRvIHB1c2ggYmFjayBvbiBjb21iaW5hdG9yaWFsIG5ldyBhbGxvY2F0
b3JzLCBpZiB3ZSBjYW4uCj4gPgo+ID4gVGhhdCBkZXBlbmRzIG9uIHdobydzIHVzaW5nIGl0LCBh
bmQgaG93IChlLmcuIHZpYSBCUEYpLgo+ID4KPiA+IFRvIGJlIGNsZWFyLCBJJ20gbm90IG5lY2Vz
c2FyaWx5IGFza2luZyBmb3IgZW50aXJlbHkgZGlmZmVyZW50IGFsbG9jYXRvcnMsIGJ1dAo+ID4g
SSBkbyB0aGlua2cgdGhhdCB3ZSB3YW50IHdyYXBwZXJzIHRoYXQgY2FuIGF0IGxlYXN0IHBhc3Mg
ZGlzdGluY3Qgc3RhcnQrZW5kCj4gPiBwYXJhbWV0ZXJzIHRvIGEgY29tbW9uIGFsbG9jYXRvciwg
YW5kIGZvciBhcm02NCdzIG1vZHVsZXMgY29kZSBJJ2QgZXhwZWN0IHRoYXQKPiA+IHdlJ2Qga2Vl
cCB0aGUgcmFuZ2UgZmFsYmxhY2sgbG9naWMgb3V0IG9mIHRoZSBjb21tb24gYWxsY29hdG9yLCBh
bmQganVzdCBjYWxsCj4gPiBpdCB0d2ljZS4KPiA+Cj4gPiA+ID4gPiBTZXZlcmFsIGFyY2hpdGVj
dHVyZXMgb3ZlcnJpZGUgbW9kdWxlX2FsbG9jKCkgYmVjYXVzZSBvZiB2YXJpb3VzCj4gPiA+ID4g
PiBjb25zdHJhaW50cyB3aGVyZSB0aGUgZXhlY3V0YWJsZSBtZW1vcnkgY2FuIGJlIGxvY2F0ZWQg
YW5kIHRoaXMgY2F1c2VzCj4gPiA+ID4gPiBhZGRpdGlvbmFsIG9ic3RhY2xlcyBmb3IgaW1wcm92
ZW1lbnRzIG9mIGNvZGUgYWxsb2NhdGlvbi4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGlzIHNldCBz
cGxpdHMgY29kZSBhbGxvY2F0aW9uIGZyb20gbW9kdWxlcyBieSBpbnRyb2R1Y2luZwo+ID4gPiA+
ID4gaml0X3RleHRfYWxsb2MoKSwgaml0X2RhdGFfYWxsb2MoKSBhbmQgaml0X2ZyZWUoKSBBUElz
LCByZXBsYWNlcyBjYWxsCj4gPiA+ID4gPiBzaXRlcyBvZiBtb2R1bGVfYWxsb2MoKSBhbmQgbW9k
dWxlX21lbWZyZWUoKSB3aXRoIHRoZSBuZXcgQVBJcyBhbmQKPiA+ID4gPiA+IGltcGxlbWVudHMg
Y29yZSB0ZXh0IGFuZCByZWxhdGVkIGFsbG9jYXRpb24gaW4gYSBjZW50cmFsIHBsYWNlLgo+ID4g
PiA+ID4KPiA+ID4gPiA+IEluc3RlYWQgb2YgYXJjaGl0ZWN0dXJlIHNwZWNpZmljIG92ZXJyaWRl
cyBmb3IgbW9kdWxlX2FsbG9jKCksIHRoZQo+ID4gPiA+ID4gYXJjaGl0ZWN0dXJlcyB0aGF0IHJl
cXVpcmUgbm9uLWRlZmF1bHQgYmVoYXZpb3VyIGZvciB0ZXh0IGFsbG9jYXRpb24gbXVzdAo+ID4g
PiA+ID4gZmlsbCBqaXRfYWxsb2NfcGFyYW1zIHN0cnVjdHVyZSBhbmQgaW1wbGVtZW50IGppdF9h
bGxvY19hcmNoX3BhcmFtcygpIHRoYXQKPiA+ID4gPiA+IHJldHVybnMgYSBwb2ludGVyIHRvIHRo
YXQgc3RydWN0dXJlLiBJZiBhbiBhcmNoaXRlY3R1cmUgZG9lcyBub3QgaW1wbGVtZW50Cj4gPiA+
ID4gPiBqaXRfYWxsb2NfYXJjaF9wYXJhbXMoKSwgdGhlIGRlZmF1bHRzIGNvbXBhdGlibGUgd2l0
aCB0aGUgY3VycmVudAo+ID4gPiA+ID4gbW9kdWxlczo6bW9kdWxlX2FsbG9jKCkgYXJlIHVzZWQu
Cj4gPiA+ID4KPiA+ID4gPiBBcyBhYm92ZSwgSSBzdXNwZWN0IHRoYXQgZWFjaCBvZiB0aGUgY2Fs
bHNpdGVzIHNob3VsZCBwcm9iYWJseSBiZSB1c2luZyBjb21tb24KPiA+ID4gPiBpbmZyYXN0cnVj
dHVyZSwgYnV0IEkgZG9uJ3QgdGhpbmsgdGhhdCBhIHNpbmdsZSBqaXRfYWxsb2NfYXJjaF9wYXJh
bXMoKSBtYWtlcwo+ID4gPiA+IHNlbnNlLCBzaW5jZSB0aGUgcGFyYW1ldGVycyBmb3IgZWFjaCBj
YXNlIG1heSBuZWVkIHRvIGJlIGRpc3RpbmN0Lgo+ID4gPgo+ID4gPiBJIGRvbid0IHNlZSBob3cg
dGhhdCBmb2xsb3dzLiBUaGUgd2hvbGUgcG9pbnQgb2YgZnVuY3Rpb24gcGFyYW1ldGVycyBpcwo+
ID4gPiB0aGF0IHRoZXkgbWF5IGJlIGRpZmZlcmVudCA6KQo+ID4KPiA+IFdoYXQgSSBtZWFuIGlz
IHRoYXQgaml0X2FsbG9jX2FyY2hfcGFyYW1zKCkgdHJpZXMgdG8gYWdncmVnYXRlIGNvbW1vbgo+
ID4gcGFyYW1ldGVycywgYnV0IHRoZXkgYXJlbid0IGFjdHVhbGx5IGNvbW1vbiAoZS5nLiB0aGUg
YWN0dWFsIHN0YXJ0K2VuZCByYW5nZQo+ID4gZm9yIGFsbG9jYXRpb24pLgo+ID4KPiA+ID4gQ2Fu
IHlvdSBnaXZlIG1vcmUgZGV0YWlsIG9uIHdoYXQgcGFyYW1ldGVycyB5b3UgbmVlZD8gSWYgdGhl
IG9ubHkgZXh0cmEKPiA+ID4gcGFyYW1ldGVyIGlzIGp1c3QgImRvZXMgdGhpcyBhbGxvY2F0aW9u
IG5lZWQgdG8gbGl2ZSBjbG9zZSB0byBrZXJuZWwKPiA+ID4gdGV4dCIsIHRoYXQncyBub3QgdGhh
dCBiaWcgb2YgYSBkZWFsLgo+ID4KPiA+IE15IHRoaW5raW5nIHdhcyB0aGF0IHdlIGF0IGxlYXN0
IG5lZWQgdGhlIHN0YXJ0ICsgZW5kIGZvciBlYWNoIGNhbGxlci4gVGhhdAo+ID4gbWlnaHQgYmUg
aXQsIHRiaC4KPgo+IElJVUMsIGFybTY0IHVzZXMgVk1BTExPQyBhZGRyZXNzIHNwYWNlIGZvciBC
UEYgcHJvZ3JhbXMuIFRoZSByZWFzb24KPiBpcyBlYWNoIEJQRiBwcm9ncmFtIHVzZXMgYXQgbGVh
c3QgNjRrQiAob25lIHBhZ2UpIG91dCBvZiB0aGUgMTI4TUIKPiBhZGRyZXNzIHNwYWNlLiBQdXJh
bmpheSBNb2hhbiAoQ0MnZWQpIGlzIHdvcmtpbmcgb24gZW5hYmxpbmcKPiBicGZfcHJvZ19wYWNr
IGZvciBhcm02NC4gT25jZSB0aGlzIHdvcmsgaXMgZG9uZSwgbXVsdGlwbGUgQlBGIHByb2dyYW1z
Cj4gd2lsbCBiZSBhYmxlIHRvIHNoYXJlIGEgcGFnZS4gV2lsbCB0aGlzIGltcHJvdmVtZW50IHJl
bW92ZSB0aGUgbmVlZCB0bwo+IHNwZWNpZnkgYSBkaWZmZXJlbnQgYWRkcmVzcyByYW5nZSBmb3Ig
QlBGIHByb2dyYW1zPwoKSGksClRoYW5rcyBmb3IgYWRkaW5nIG1lIHRvIHRoZSBjb252ZXJzYXRp
b24uCgpUaGUgQVJNNjQgQlBGIEpJVCB1c2VkIHRvIGFsbG9jYXRlIHRoZSBtZW1vcnkgdXNpbmcg
bW9kdWxlX2FsbG9jIGJ1dCBpdAp3YXMgbm90IG9wdGltYWwgYmVjYXVzZSBCUEYgcHJvZ3JhbXMg
YW5kIG1vZHVsZXMgd2VyZSBzaGFyaW5nIHRoZSAxMjggTUIKbW9kdWxlIHJlZ2lvbi4gVGhpcyB3
YXMgZml4ZWQgYnkKOTFmYzk1N2M5YjFkICgiYXJtNjQvYnBmOiBkb24ndCBhbGxvY2F0ZSBCUEYg
SklUIHByb2dyYW1zIGluIG1vZHVsZSBtZW1vcnkiKQpJdCBjcmVhdGVkIGEgZGVkaWNhdGVkIDEy
OCBNQiByZWdpb24gc2V0IGFzaWRlIGZvciBCUEYgcHJvZ3JhbXMuCgpCdXQgMTI4TUIgY291bGQg
Z2V0IGV4aGF1c3RlZCBlc3BlY2lhbGx5IHdoZXJlIFBBR0VfU0laRSBpcyA2NEtCIC0gb25lCnBh
Z2UgaXMgbmVlZGVkIHBlciBwcm9ncmFtLiBUaGlzIHJlc3RyaWN0aW9uIHdhcyByZW1vdmVkIGJ5
CmI4OWRkZjRjY2E0MyAoImFybTY0L2JwZjogUmVtb3ZlIDEyOE1CIGxpbWl0IGZvciBCUEYgSklU
IHByb2dyYW1zIikKClNvLCBjdXJyZW50bHkgQlBGIHByb2dyYW1zIGFyZSB1c2luZyBhIGZ1bGwg
cGFnZSBmcm9tIHZtYWxsb2MgKDQgS0IsCjE2IEtCLCBvciA2NCBLQikuClRoaXMgd2FzdGVzIG1l
bW9yeSBhbmQgYWxzbyBjYXVzZXMgaVRMQiBwcmVzc3VyZS4gRW5hYmxpbmcgYnBmX3Byb2dfcGFj
awpmb3IgQVJNNjQgd291bGQgZml4IGl0LiBJIGFtIGRvaW5nIHNvbWUgZmluYWwgdGVzdHMgYW5k
IHdpbGwgc2VuZCB0aGUgcGF0Y2hlcyBpbgoxLTIgZGF5cy4KClRoYW5rcywKUHVyYW5qYXkKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
