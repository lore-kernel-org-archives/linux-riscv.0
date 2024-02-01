Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30CDC48286
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 18:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3qPs8CDOWFsyteJ9gSQTXlC16f2CyFdV895bv3KYHv8=; b=dr9ngXK7r/1K1m
	LZqhhUWtwz8c/L0NfSDL1Ff82paF5aIEU0lrUvBY4Dd2/fjhB/fWdboAS2chs7+n4b1Fwvl0Zi5R8
	BT/sZzFI6YvKpe+xoqkBP5BSjFPoAvMqokV5IaJM7PXr1EOxDi5E0tQPAkwExr9+Y0tyJ1u3K+dFW
	W4xm2NzrzMj6b3F9TwNI89XCNzHC7nFISOlU9rMEr5FqPuDazGCXwBxUUnfThFSo6HsAbvHYiy+xU
	WJl4hLThB8DJOAUBvqnKJ7MwKkLnhmhSd4E+nhWuuyCn2eejY62Th8IZNgDP4jIh7gmi7NmzNqWgf
	rlWyaZEf4HVCWkPHaPUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbWP-00000008xMr-3rO7;
	Thu, 01 Feb 2024 18:10:45 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbWL-00000008xL8-3k4l;
	Thu, 01 Feb 2024 18:10:43 +0000
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3be92d2ccb6so113130b6e.1;
        Thu, 01 Feb 2024 10:10:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706811040; x=1707415840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t7K2m1hjkCVzp42ssBbLht83KsIxMJIS717mDSy4hWI=;
        b=n5tD0A3rVSoMbQX+LbfwN/aCU55zEvGQXp18kSb4rFpulBKoAu1p4zBpqi0rF3F29D
         e1yZPE3c9wPP1WwnoL6L45mQAsgp9GB4v8tKUQmlRSoUGPNYGUCyhNM4E+qtirVDyr6X
         fmOa56NweUxlJW2fen8nnU1BUsphRc3Urv5gEAaursLzJ5Itbl+zm1/2jYM+OcwRCJtS
         SQ0si8DgCHN3cSKEJNScx+dOaq5400o9KOsGcYfQT1YoyN2IyCYX/95qrph5I4ktMk62
         1n52IBl364AfTX25wmaviXdB2WHEtI7+sClGiyzvaycmdWrrkKSVh9YlJX4D8p7iAU9K
         7XnA==
X-Gm-Message-State: AOJu0YwTXA8Q1Y8EpbiIpnDftZWMSkcg6YMTpA56n9uXIfKZ5U8zUcFq
	B/kxLXa6mk16jOQ5AxpadIHvnnjXM5YK57dWmebLvKz50mt5ooreKjvYHtEr8hVUtQcGRVZLDw1
	t177zr9gm5gzvDoduHcYvwpNMz08=
X-Google-Smtp-Source: AGHT+IGhgYJn6KsHi/QptCtDQVi4EiETT3Ordm1Cq+9U5IBgGQtd4dFzNprS6Moq70ompSbbd8eAwusq2WaBH+MGmvk=
X-Received: by 2002:a05:6870:828a:b0:218:d68f:fe29 with SMTP id
 q10-20020a056870828a00b00218d68ffe29mr3483142oae.3.1706811039953; Thu, 01 Feb
 2024 10:10:39 -0800 (PST)
MIME-Version: 1.0
References: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
 <CAJZ5v0j6Veze8xDFKTbVZ5=WAfmLdeJ8NXRnh9kwCZgyaDdgew@mail.gmail.com> <ZbiQ/tO/odnJCBD1@sunil-laptop>
In-Reply-To: <ZbiQ/tO/odnJCBD1@sunil-laptop>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 1 Feb 2024 19:10:28 +0100
Message-ID: <CAJZ5v0gnH0uPEM0q9VzJOg2Z_7bOP9XdQbOttpRtnkLGej45Sw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 00/17] RISC-V: ACPI: Add external interrupt
 controller support
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Bjorn Helgaas <bhelgaas@google.com>, Haibo Xu <haibo1.xu@intel.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Andrew Jones <ajones@ventanamicro.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_101041_960231_2758A8D9 
X-CRM114-Status: GOOD (  34.19  )
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

T24gVHVlLCBKYW4gMzAsIDIwMjQgYXQgNzowMuKAr0FNIFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgRGVjIDE5LCAyMDIzIGF0IDA2OjUwOjE5
UE0gKzAxMDAsIFJhZmFlbCBKLiBXeXNvY2tpIHdyb3RlOgo+ID4gT24gVHVlLCBEZWMgMTksIDIw
MjMgYXQgNjo0NeKAr1BNIFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPiB3cm90
ZToKPiA+ID4KPiA+ID4gVGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciB0aGUgYmVsb3cgRUNS
IGFwcHJvdmVkIGJ5IEFTV0cuCj4gPiA+IDEpIE1BRFQgLSBodHRwczovL2RyaXZlLmdvb2dsZS5j
b20vZmlsZS9kLzFvTUdQeU9ENThKYVBnTWwxcEthc1QtVktzSUtpYTd6Ui92aWV3P3VzcD1zaGFy
aW5nCj4gPiA+Cj4gPiA+IFRoZSBzZXJpZXMgcHJpbWFyaWx5IGVuYWJsZXMgaXJxY2hpcCBkcml2
ZXJzIGZvciBSSVNDLVYgQUNQSSBiYXNlZAo+ID4gPiBwbGF0Zm9ybXMuCj4gPiA+Cj4gPiA+IFRo
ZSBzZXJpZXMgY2FuIGJlIGJyb2FkbHkgY2F0ZWdvcml6ZWQgbGlrZSBiZWxvdy4KPiA+ID4KPiA+
ID4gMSkgUENJIEFDUEkgcmVsYXRlZCBmdW5jdGlvbnMgYXJlIG1pZ3JhdGVkIGZyb20gYXJtNjQg
dG8gY29tbW9uIGZpbGUgc28KPiA+ID4gdGhhdCB3ZSBkb24ndCBuZWVkIHRvIGR1cGxpY2F0ZSB0
aGVtIGZvciBSSVNDLVYuCj4gPiA+Cj4gPiA+IDIpIEludHJvZHVjZWQgc3VwcG9ydCBmb3IgZndf
ZGV2bGluayBmb3IgQUNQSSBub2RlcyBmb3IgSVJRIGRlcGVuZGVuY3kuCj4gPiA+IFRoaXMgaGVs
cHMgdG8gc3VwcG9ydCBkZWZlcnJlZCBwcm9iZSBvZiBpbnRlcnJ1cHQgY29udHJvbGxlciBkcml2
ZXJzLgo+ID4gPgo+ID4gPiAzKSBNb2RpZmllZCBwbnBfaXJxKCkgdG8gdHJ5IHJlZ2lzdGVyaW5n
IHRoZSBJUlEgIGFnYWluIGlmIGl0IHNlZXMgaXQgaW4KPiA+ID4gZGlzYWJsZWQgc3RhdGUuIFRo
aXMgc29sdXRpb24gaXMgc2ltaWxhciB0byBob3cKPiA+ID4gcGxhdGZvcm1fZ2V0X2lycV9vcHRp
b25hbCgpIHdvcmtzIGZvciByZWd1bGFyIHBsYXRmb3JtIGRldmljZXMuCj4gPiA+Cj4gPiA+IDQp
IEFkZGVkIHN1cHBvcnQgZm9yIHJlLW9yZGVyaW5nIHRoZSBwcm9iZSBvZiBpbnRlcnJ1cHQgY29u
dHJvbGxlcnMgd2hlbgo+ID4gPiBJUlFDSElQX0FDUElfREVDTEFSRSBpcyB1c2VkLgo+ID4gPgo+
ID4gPiA1KSBBQ1BJIHN1cHBvcnQgYWRkZWQgaW4gUklTQy1WIGludGVycnVwdCBjb250cm9sbGVy
IGRyaXZlcnMuCj4gPiA+Cj4gPiA+IFRoaXMgc2VyaWVzIGlzIGJhc2VkIG9uIEFudXAncyBBSUEg
djExIHNlcmllcy4gU2luY2UgQW51cCdzIEFJQSB2MTEgaXMKPiA+ID4gbm90IG1lcmdlZCB5ZXQg
YW5kIGZpcnN0IHRpbWUgaW50cm9kdWNpbmcgZndfZGV2bGluaywgZGVmZXJyZWQgcHJvYmUgYW5k
Cj4gPiA+IHJlb3JkZXJpbmcgc3VwcG9ydCBmb3IgSVJRQ0hJUCBwcm9iZSwgdGhpcyBzZXJpZXMg
aXMgc3RpbGwga2VwdCBhcyBSRkMuCj4gPiA+IExvb2tpbmcgZm9yd2FyZCBmb3IgdGhlIGZlZWRi
YWNrIQo+ID4gPgo+ID4gPiBDaGFuZ2VzIHNpbmNlIFJGQyB2MjoKPiA+ID4gICAgICAgICAxKSBJ
bnRyb2R1Y2VkIGZ3X2RldmxpbmsgZm9yIEFDUEkgbm9kZXMgZm9yIElSUSBkZXBlbmRlbmN5Lgo+
ID4gPiAgICAgICAgIDIpIERyb3BwZWQgcGF0Y2hlcyBpbiBkcml2ZXJzIHdoaWNoIGFyZSBub3Qg
cmVxdWlyZWQgZHVlIHRvCj4gPiA+ICAgICAgICAgICAgZndfZGV2bGluayBzdXBwb3J0Lgo+ID4g
PiAgICAgICAgIDMpIERyb3BwZWQgcGNpX3NldF9tc2koKSBwYXRjaCBhbmQgYWRkZWQgYSBwYXRj
aCBpbgo+ID4gPiAgICAgICAgICAgIHBjaV9jcmVhdGVfcm9vdF9idXMoKS4KPiA+ID4gICAgICAg
ICA0KSBVcGRhdGVkIHBucF9pcnEoKSBwYXRjaCBzbyB0aGF0IG5vbmUgb2YgdGhlIGFjdHVhbCBQ
TlAKPiA+ID4gICAgICAgICAgICBkcml2ZXJzIG5lZWQgdG8gY2hhbmdlLgo+ID4gPgo+ID4gPiBD
aGFuZ2VzIHNpbmNlIFJGQyB2MToKPiA+ID4gICAgICAgICAxKSBBYmFuZG9uZWQgc3dub2RlIGFw
cHJvYWNoIGFzIHBlciBNYXJjJ3MgZmVlZGJhY2suCj4gPiA+ICAgICAgICAgMikgVG8gY29wZSB1
cCB3aXRoIEFJQSBzZXJpZXMgY2hhbmdlcyB3aGljaCBjaGFuZ2VkIGlycWNoaXAgZHJpdmVyCj4g
PiA+ICAgICAgICAgICAgcHJvYmUgZnJvbSBjb3JlX2luaXRjYWxsKCkgdG8gcGxhdGZvcm1fZHJp
dmVyLCBhZGRlZCBwYXRjaGVzCj4gPiA+ICAgICAgICAgICAgdG8gc3VwcG9ydCBkZWZlcnJlZCBw
cm9iaW5nLgo+ID4gPiAgICAgICAgIDMpIFJlYmFzZWQgb24gdG9wIG9mIEFudXAncyBBSUEgdjEx
IGFuZCBhZGRlZCB0YWdzLgo+ID4gPgo+ID4gPiBUbyB0ZXN0IHRoZSBzZXJpZXMsCj4gPiA+Cj4g
PiA+IDEpIFFlbXUgc2hvdWxkIGJlIGJ1aWx0IHVzaW5nIHRoZSByaXNjdl9hY3BpX2IyX3Y4IGJy
YW5jaCBhdAo+ID4gPiBodHRwczovL2dpdGh1Yi5jb20vdmxzdW5pbC9xZW11LmdpdAo+ID4gPgo+
ID4gPiAyKSBFREsyIHNob3VsZCBiZSBidWlsdCB1c2luZyB0aGUgaW5zdHJ1Y3Rpb25zIGF0Ogo+
ID4gPiBodHRwczovL2dpdGh1Yi5jb20vdGlhbm9jb3JlL2VkazIvYmxvYi9tYXN0ZXIvT3ZtZlBr
Zy9SaXNjVlZpcnQvUkVBRE1FLm1kCj4gPiA+Cj4gPiA+IDMpIEJ1aWxkIExpbnV4IHVzaW5nIHRo
aXMgc2VyaWVzIG9uIHRvcCBvZiBBbnVwJ3MgQUlBIHYxMSBzZXJpZXMuCj4gPiA+Cj4gPiA+IFJ1
biBRZW11Ogo+ID4gPiBxZW11LXN5c3RlbS1yaXNjdjY0IFwKPiA+ID4gIC1NIHZpcnQscGZsYXNo
MD1wZmxhc2gwLHBmbGFzaDE9cGZsYXNoMSxhaWE9YXBsaWMtaW1zaWMgXAo+ID4gPiAgLW0gMkcg
LXNtcCA4IFwKPiA+ID4gIC1zZXJpYWwgbW9uOnN0ZGlvIFwKPiA+ID4gIC1kZXZpY2UgdmlydGlv
LWdwdS1wY2kgLWZ1bGwtc2NyZWVuIFwKPiA+ID4gIC1kZXZpY2UgcWVtdS14aGNpIFwKPiA+ID4g
IC1kZXZpY2UgdXNiLWtiZCBcCj4gPiA+ICAtYmxvY2tkZXYgbm9kZS1uYW1lPXBmbGFzaDAsZHJp
dmVyPWZpbGUscmVhZC1vbmx5PW9uLGZpbGVuYW1lPVJJU0NWX1ZJUlRfQ09ERS5mZCBcCj4gPiA+
ICAtYmxvY2tkZXYgbm9kZS1uYW1lPXBmbGFzaDEsZHJpdmVyPWZpbGUsZmlsZW5hbWU9UklTQ1Zf
VklSVF9WQVJTLmZkIFwKPiA+ID4gIC1uZXRkZXYgdXNlcixpZD1uZXQwIC1kZXZpY2UgdmlydGlv
LW5ldC1wY2ksbmV0ZGV2PW5ldDAgXAo+ID4gPiAgLWtlcm5lbCBhcmNoL3Jpc2N2L2Jvb3QvSW1h
Z2UgXAo+ID4gPiAgLWluaXRyZCByb290ZnMuY3BpbyBcCj4gPiA+ICAtYXBwZW5kICJyb290PS9k
ZXYvcmFtIHJvIGNvbnNvbGU9dHR5UzAgcm9vdHdhaXQgZWFybHljb249dWFydDgyNTAsbW1pbyww
eDEwMDAwMDAwIgo+ID4gPgo+ID4gPiBUbyBib290IHdpdGggQVBMSUMgb25seSwgdXNlIGFpYT1h
cGxpYy4KPiA+ID4gVG8gYm9vdCB3aXRoIFBMSUMsIHJlbW92ZSBhaWE9IG9wdGlvbi4KPiA+ID4K
PiA+ID4gVGhpcyBzZXJpZXMgaXMgYWxzbyBhdmFpbGFibGUgaW4gYWNwaV9iMl92M19yaXNjdl9h
aWFfdjExIGJyYW5jaCBhdAo+ID4gPiBodHRwczovL2dpdGh1Yi5jb20vdmxzdW5pbC9saW51eC5n
aXQKPiA+ID4KPiA+ID4gQmFzZWQtb246IDIwMjMxMDIzMTcyODAwLjMxNTM0My0xLWFwYXRlbEB2
ZW50YW5hbWljcm8uY29tCj4gPiA+IChodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjMx
MDIzMTcyODAwLjMxNTM0My0xLWFwYXRlbEB2ZW50YW5hbWljcm8uY29tLykKPiA+ID4KPiA+ID4g
U3VuaWwgViBMICgxNyk6Cj4gPiA+ICAgYXJtNjQ6IFBDSTogTWlncmF0ZSBBQ1BJIHJlbGF0ZWQg
ZnVuY3Rpb25zIHRvIHBjaS1hY3BpLmMKPiA+ID4gICBSSVNDLVY6IEFDUEk6IEltcGxlbWVudCBQ
Q0kgcmVsYXRlZCBmdW5jdGlvbmFsaXR5Cj4gPiA+ICAgUENJOiBNYWtlIHBjaV9jcmVhdGVfcm9v
dF9idXMoKSBkZWNsYXJlIGl0cyByZWxpYW5jZSBvbiBNU0kgZG9tYWlucwo+ID4gPiAgIEFDUEk6
IEFkZCBmd19kZXZsaW5rIHN1cHBvcnQgZm9yIEFDUEkgZndub2RlIGZvciBJUlEgZGVwZW5kZW5j
eQo+ID4gPiAgIEFDUEk6IGlycTogQWRkIHN1cHBvcnQgZm9yIGRlZmVycmVkIHByb2JlIGluIGFj
cGlfcmVnaXN0ZXJfZ3NpKCkKPiA+ID4gICBwbnAuaDogUmVjb25maWd1cmUgSVJRIGluIHBucF9p
cnEoKSB0byBzdXBwb3J0IGRlZmVycmVkIHByb2JlCj4gPiA+ICAgQUNQSTogc2Nhbi5jOiBBZGQg
d2VhayBhcmNoIHNwZWNpZmljIGZ1bmN0aW9uIHRvIHJlb3JkZXIgdGhlIElSUUNISVAKPiA+ID4g
ICAgIHByb2JlCj4gPiA+ICAgQUNQSTogUklTQy1WOiBJbXBsZW1lbnQgYXJjaCBmdW5jdGlvbiB0
byByZW9yZGVyIGlycWNoaXAgcHJvYmUgZW50cmllcwo+ID4gPiAgIGlycWNoaXA6IHJpc2N2LWlu
dGM6IEFkZCBBQ1BJIHN1cHBvcnQgZm9yIEFJQQo+ID4gPiAgIGlycWNoaXA6IHJpc2N2LWltc2lj
OiBBZGQgQUNQSSBzdXBwb3J0Cj4gPiA+ICAgaXJxY2hpcDogcmlzY3YtYXBsaWM6IEFkZCBBQ1BJ
IHN1cHBvcnQKPiA+ID4gICBpcnFjaGlwOiBpcnEtc2lmaXZlLXBsaWM6IEFkZCBBQ1BJIHN1cHBv
cnQKPiA+ID4gICBBQ1BJOiBidXM6IEFkZCBSSU5UQyBJUlEgbW9kZWwgZm9yIFJJU0MtVgo+ID4g
PiAgIEFDUEk6IGJ1czogQWRkIGFjcGlfcmlzY3ZfaW5pdCBmdW5jdGlvbgo+ID4gPiAgIEFDUEk6
IFJJU0MtVjogQ3JlYXRlIEFQTElDIHBsYXRmb3JtIGRldmljZQo+ID4gPiAgIEFDUEk6IFJJU0Mt
VjogQ3JlYXRlIFBMSUMgcGxhdGZvcm0gZGV2aWNlCj4gPiA+ICAgaXJxY2hpcDogcmlzY3YtaW50
YzogU2V0IEFDUEkgaXJxbW9kZWwKPiA+Cj4gPiBKRllJLCBJIGhhdmUgbm8gY2FwYWNpdHkgdG8g
cHJvdmlkZSBhbnkgZmVlZGJhY2sgb24gdGhpcyB0aWxsIDYuOC1yYzEgaXMgb3V0Lgo+ID4KPiBI
aSBSYWZhZWwsCj4KPiBHZW50bGUgcGluZy4KPgo+IENvdWxkIHlvdSBwbGVhc2UgcHJvdmlkZSBm
ZWVkYmFjayBvbiB0aGUgc2VyaWVzPyBQYXRjaGVzIDQsIDUsIDYsIDcgYW5kCj4gOCBhcmUgYml0
IGNyaXRpY2FsIElNTy4gU28sIEkgcmVhbGx5IGxvb2sgZm9yd2FyZCBmb3IgeW91ciBhbmQgb3Ro
ZXIKPiBBQ1BJIGV4cGVydHMhLgoKVGhlcmUgd2FzIHF1aXRlIGEgYml0IG9mIGRpc2N1c3Npb24g
b24gcGF0Y2ggWzYvMjFdIGFuZCBpdCBzdGlsbCBzZWVtcwpyZWxldmFudCB0byBtZS4KCkFDUEkg
YWN0dWFsbHkgaGFzIGEgd2F5IHRvIGF0IGxlYXN0IGluZGljYXRlIHdoYXQgdGhlIHByb2JlIG9y
ZGVyaW5nCnNob3VsZCBiZSB3aGljaCBpcyBfREVQLgoKVGhlIGN1cnJlbnQgaGFuZGxpbmcgb2Yg
X0RFUCBpbiB0aGUga2VybmVsIG1heSBub3QgYmUgY292ZXJpbmcgdGhpcwpwYXJ0aWN1bGFyIHVz
ZSBjYXNlLCBidXQgSSB3b3VsZCByYXRoZXIgZXh0ZW5kIGl0IChpZiBuZWNlc3NhcnkpCmluc3Rl
YWQgb2YgZG9pbmcgYWxsIG9mIHRoZSAtRVBST0JFX0RFRkVSIGRhbmNlIHdoaWNoIHNlZW1zIGZy
YWdpbGUgdG8KbWUuCgpUaGFua3MhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
