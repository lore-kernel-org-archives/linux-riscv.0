Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546AFC4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 22:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DcLHADclQCbaZ1o8Mg9Oz8iibU+BbMx2PB0U5+fXJgo=; b=WXeP0LB0t7kGHHvVZnJq7KxXzu
	LvR8ZLnTztVAE3kmze3Mtbefa8wDdotz/k2MKUAcBQMfaP9aKRle9pwqSAd8cDjZVYKbXNo5as58q
	3NpdhMw2dUDqQJIPzQXClneE13YAA7B6GddF7V2yJ804x1+Vudc4yfGulw+tGqQnyWYoDFQFSGeJs
	jyliTMBdEb1Fgi4Z7t/sR/1OGzi1YIRVdnWf7WYTnOE6RYvHooY1p82nB+41Jev+gGVw2IjrIdtcT
	L8rgQ7OjLAQoHJROiJoexXd9gPJaf1yQiMz0ApKG6SJ9VxR6fNQOPV6thoP9jNa1YLn4BXZONkPoD
	fUpzV6+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8TEI-009SLP-2y;
	Wed, 29 Nov 2023 22:40:26 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8TEG-009SJK-0G
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 22:40:26 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5ca61d84dc3so6117517b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Nov 2023 14:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701297621; x=1701902421; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LDVeTl61QPCCxPz+sfODK89nbVJMVG6TQMGABDOMFAw=;
        b=A8TrdsqVlSB2vVj0cbQg0CZg/YrdMLGPoQcxd28Ednc63oOOi+g41ccZKPasLgLK+E
         43XC9EMUUccQlK3/IMrX5/UxuAw8QjKh6xgD+3c6ysqE14hnxXd6SnAihDNzNEnuNItp
         on/zq3Eiljy24b0Smrg3Otlc7DOWjYTuryKj9buIrc70ugPMzp1AtjJsI6PDk+SbTzq4
         qtjK6xVuXWeNKC4dO6Sw2dhZN66nnSeMN9PMDxx06B1vybzlQqTY2A9MrQyDcwAwSuEh
         404e1G+NKvYmudE4AdvMUeUQ2Dpz9JKqY0RUxizawf375gTQAQvHRY61odf4BTF3eIrj
         7Yxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701297621; x=1701902421;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LDVeTl61QPCCxPz+sfODK89nbVJMVG6TQMGABDOMFAw=;
        b=KMmc7uAGxvrSoIGtu+SYEzR5iTjWeK5seZ51f1aIFoDMNgIKqdxfgJontzNmAIz3q2
         EUJz4fBePB2gTBDnBpv10BAfA+bBUOI93erHyatoHH4faUJoelVeHE69oEUvXCVM6Uhn
         oE/oSv90AVQ32ExlAlvI+t5OGOKlyV1O3oORNME/6YDIt1P89CbMYHUYbvN+30+Hh8wo
         hW5+yeB+r7GFkcbLdKtMFSF6FQs11OsrWDbYAO2bz3+TniNDYS/gyKTkmWWJJm1P8NoB
         VUWUjM6KRhAAYCzMG3ukkNgmlICAik1qP8unKkafYcEagejVUbD0KVIcxcCtR3U2E6oD
         mE0g==
X-Gm-Message-State: AOJu0YxxyZqYVx+v8e5HGBOrPid/nNYGZ7mJ7Fbxn/s5JaF/dF39POHJ
	O2MTjuMIzjFbHiSpwYVSzh3E9Azl05Q=
X-Google-Smtp-Source: AGHT+IH9RxzmajTLifcNJivXHXF15GYt6RNI6hyz68HWdvvEFKxSVfujRMym9vZDynLvRqNw698SRRht3dY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:842:b0:5cc:cd5e:8f0e with SMTP id
 bz2-20020a05690c084200b005cccd5e8f0emr592433ywb.0.1701297621195; Wed, 29 Nov
 2023 14:40:21 -0800 (PST)
Date: Wed, 29 Nov 2023 14:40:19 -0800
In-Reply-To: <81628606-ca9b-866f-5e71-91001e856871@suse.cz>
Mime-Version: 1.0
References: <92ba7ddd-2bc8-4a8d-bd67-d6614b21914f@intel.com>
 <ZUJVfCkIYYFp5VwG@google.com> <CABgObfaw4Byuzj5J3k48jdwT0HCKXLJNiuaA9H8Dtg+GOq==Sw@mail.gmail.com>
 <ZUJ-cJfofk2d_I0B@google.com> <4ca2253d-276f-43c5-8e9f-0ded5d5b2779@redhat.com>
 <ZULSkilO-tdgDGyT@google.com> <CABgObfbq_Hg0B=jvsSDqYH3CSpX+RsxfwB-Tc-eYF4uq2Qw9cg@mail.gmail.com>
 <ZUPCWfO1iO77-KDA@google.com> <CABgObfa=DH7FySBviF63OS9sVog_wt-AqYgtUAGKqnY5Bizivw@mail.gmail.com>
 <81628606-ca9b-866f-5e71-91001e856871@suse.cz>
Message-ID: <ZWe90784ek9VvHa5@google.com>
Subject: Re: [PATCH v13 17/35] KVM: Add transparent hugepage support for
 dedicated guest memory
From: Sean Christopherson <seanjc@google.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Xu Yilun <yilun.xu@intel.com>, 
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_144024_117582_7B884E79 
X-CRM114-Status: GOOD (  33.02  )
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

T24gTW9uLCBOb3YgMjcsIDIwMjMsIFZsYXN0aW1pbCBCYWJrYSB3cm90ZToKPiBPbiAxMS8yLzIz
IDE2OjQ2LCBQYW9sbyBCb256aW5pIHdyb3RlOgo+ID4gT24gVGh1LCBOb3YgMiwgMjAyMyBhdCA0
OjM44oCvUE0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+IHdyb3RlOgo+
ID4+IEFjdHVhbGx5LCBsb29raW5nIHRoYXQgdGhpcyBhZ2FpbiwgdGhlcmUncyBub3QgYWN0dWFs
bHkgYSBoYXJkIGRlcGVuZGVuY3kgb24gVEhQLgo+ID4+IEEgVEhQLWVuYWJsZWQga2VybmVsIF9w
cm9iYWJseV8gIGdpdmVzIGEgaGlnaGVyIHByb2JhYmlsaXR5IG9mIHVzaW5nIGh1Z2VwYWdlcywK
PiA+PiBidXQgbW9zdGx5IGJlY2F1c2UgVEhQIHNlbGVjdHMgQ09NUEFDVElPTiwgYW5kIEkgc3Vw
cG9zZSBiZWNhdXNlIHVzaW5nIFRIUCBmb3IKPiA+PiBvdGhlciBhbGxvY2F0aW9ucyByZWR1Y2Vz
IG92ZXJhbGwgZnJhZ21lbnRhdGlvbi4KPiA+IAo+ID4gWWVzLCB0aGF0J3Mgd2h5IEkgZGlkbid0
IGV2ZW4gYm90aGVyIGVuYWJsaW5nIGl0IHVubGVzcyBUSFAgaXMKPiA+IGVuYWJsZWQsIGJ1dCBp
dCBtYWtlcyBldmVuIG1vcmUgc2Vuc2UgdG8ganVzdCB0cnkuCj4gPiAKPiA+PiBTbyByYXRoZXIg
dGhhbiBob25vciBLVk1fR1VFU1RfTUVNRkRfQUxMT1dfSFVHRVBBR0UgaWZmIFRIUCBpcyBlbmFi
bGVkLCBJIHRoaW5rCj4gPj4gd2Ugc2hvdWxkIGRvIHRoZSBiZWxvdyAoSSB2ZXJpZmllZCBLVk0g
Y2FuIGNyZWF0ZSBodWdlcGFnZXMgd2l0aCBUSFA9bikuICBXZSdsbAo+ID4+IG5lZWQgYW5vdGhl
ciBjYXBhYmlsaXR5LCBidXQgKGEpIHdlIHByb2JhYmx5IHNob3VsZCBoYXZlIHRoYXQgYW55d2F5
cyBhbmQgKGIpIGl0Cj4gPj4gcHJvdmlkZXMgYSBjbGVhbmVyIHBhdGggdG8gYWRkaW5nIFBVRC1z
aXplZCBodWdlcGFnZSBzdXBwb3J0IGluIHRoZSBmdXR1cmUuCj4gPiAKPiA+IEkgd29uZGVyIGlm
IHdlIG5lZWQgS1ZNX0NBUF9HVUVTVF9NRU1GRF9IVUdFUEFHRV9QTURfU0laRSB0aG91Z2guIFRo
aXMKPiA+IHNob3VsZCBiZSBhIGdlbmVyaWMga2VybmVsIEFQSSBhbmQgaW4gZmFjdCB0aGUgc2l6
ZXMgYXJlIGF2YWlsYWJsZSBpbgo+ID4gYSBub3Qtc28tZnJpZW5kbHkgZm9ybWF0IGluIC9zeXMv
a2VybmVsL21tL2h1Z2VwYWdlcy4KPiA+IAo+ID4gV2Ugc2hvdWxkIGp1c3QgYWRkIC9zeXMva2Vy
bmVsL21tL2h1Z2VwYWdlcy9zaXplcyB0aGF0IGNvbnRhaW5zCj4gPiAiMjA5NzE1MiAxMDczNzQx
ODI0IiBvbiB4ODYgKG9ubHkgdGhlIGZvcm1lciBpZiAxRyBwYWdlcyBhcmUgbm90Cj4gPiBzdXBw
b3J0ZWQpLgo+ID4gCj4gPiBQbHVzOiBpcyB0aGlzIHRoZSBiZXN0IEFQSSBpZiB3ZSBuZWVkIHNv
bWV0aGluZyBlbHNlIGZvciAxRyBwYWdlcz8KPiA+IAo+ID4gTGV0J3MgZHJvcCAqdGhpcyogcGF0
Y2ggYW5kIHByb2NlZWQgaW5jcmVtZW50YWxseS4gKEFnYWluLCB0aGlzIGlzCj4gPiB3aGF0IEkg
d2FudCB0byBkbyB3aXRoIHRoaXMgZmluYWwgcmV2aWV3OiBpZGVudGlmeSBwbGFjZXMgdGhhdCBh
cmUKPiA+IHN0aWwgc3RpY2t5LCBhbmQgZG9uJ3QgbGV0IHRoZW0gYmxvY2sgdGhlIHJlc3QpLgo+
ID4gCj4gPiBDb2luY2lkZW50aWFsbHkgd2UgaGF2ZSBhbiBvcGVuIHNwb3QgbmV4dCB3ZWVrIGF0
IHBsdW1iZXJzLiBMZXQncwo+ID4gZXh0ZW5kIEZ1YWQncyBzZWN0aW9uIHRvIGNvdmVyIG1vcmUg
Z3Vlc3RtZW0gd29yay4KPiAKPiBIaSwKPiAKPiB3YXMgdGhlcmUgYW55IG91dGNvbWUgd3J0IHRo
aXMgb25lPwoKTm8sIHdlIHB1bnRlZCBvbiBodWdlcGFnZSBzdXBwb3J0IGZvciB0aGUgaW5pdGlh
bCBndWVzdF9tZW1mZCBtZXJnZS4gIFdlIGRlZmluaXRlbHkKcGxhbiBvbiBhZGRpbmcgaHVnZWFw
Z2Ugc3VwcG9ydCBzb29uZXIgdGhhbiBsYXRlciwgYnV0IHdlIGhhdmVuJ3QgeWV0IGFncmVlZCBv
bgpleGFjdGx5IHdoYXQgdGhhdCB3aWxsIGxvb2sgbGlrZS4KCj4gQmFzZWQgb24gbXkgZXhwZXJp
ZW5jZSB3aXRoIFRIUCdzIGl0IHdvdWxkIGJlIGJlc3QgaWYgdXNlcnNwYWNlIGRpZG4ndCBoYXZl
Cj4gdG8gb3B0LWluLCBub3IgY2FyZSBhYm91dCB0aGUgc3VwcG9ydGVkIHNpemUuIElmIHRoZSBn
aXZlbiBzaXplIGlzIHVuYWxpZ25lZCwKPiBwcm92aWRlIGEgbWl4IG9mIGxhcmdlIHBhZ2VzIHVw
IHRvIGFuIGFsaWduZWQgc2l6ZSwgYW5kIGZvciB0aGUgcmVzdCBmYWxsYmFjawo+IHRvIGJhc2Ug
cGFnZXMsIHdoaWNoIHNob3VsZCBiZSBiZXR0ZXIgdGhhbiAtRUlOVkFMIG9uIGNyZWF0aW9uIChp
cyBpdAo+IHBvc3NpYmxlIHdpdGggdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24/IEknZCBob3Bl
IHNvIHNvPykuCgpndWVzdF9tZW1mZCBzZXJ2ZXMgYSBkaWZmZXJlbnQgdXNlIGNhc2UgdGhhbiBU
SFAuICBGb3IgbW9kZXJuIFZNcywgYW5kIGVzcGVjaWFsbHkKZm9yIHNsaWNlLW9mLWhhcmR3YXJl
IFZNcyB0aGF0IGFyZSBvbmUgb2YgdGhlIG1haW4gdGFyZ2V0cyBmb3IgZ3Vlc3RfbWVtZmQsIGlm
IG5vdApfdGhlXyBtYWluIHRhcmdldCwgZ3Vlc3QgbWVtb3J5IHNob3VsZCBfYWx3YXlzXyBiZSBi
YWNrZWQgYnkgaHVnZXBhZ2VzIGluIHRoZQpwaHlzaWNhbCBkb21haW4uICBUaGUgYWN0dWFsIGd1
ZXN0IG1hcHBpbmdzIG1pZ2h0IG5vdCBiZSBodWdlLCBlLmcuIHg4NiBuZWVkcyB0bwpkbyBwYXJ0
aWFsIG1hcHBpbmdzIHRvIHNraXAgb3ZlciAobGVnYWN5KSBtZW1vcnkgaG9sZXMsIGJ1dCBLVk0g
YWxyZWFkeSBncmFjZWZ1bGx5CmhhbmRsZXMgdGhhdC4KCkluIG90aGVyIHdvcmRzLCBmb3IgbW9z
dCBndWVzdF9tZW1mZCB1c2UgY2FzZXMsIGlmIHVzZXJzcGFjZSB3YW50cyBodWdlcGFnZXMgYnV0
CktWTSBjYW4ndCBwcm92aWRlIGh1Z2VwYWdlcywgdGhlbiBpdCBpcyBtdWNoIG1vcmUgZGVzaXJh
YmxlIHRvIHJldHVybiBhbiBlcnJvcgp0aGFuIHRvIHNpbGVudGx5IGZhbGwgYmFjayB0byBzbWFs
bCBwYWdlcy4KCkkgMTAwJSBhZ3JlZSB0aGF0IGhhdmluZyB0byBvcHQtaW4gaXMgc3Vib3B0aW1h
bCwgYnV0IElNTyBwcm92aWRpbmcgImVycm9yIG9uIGFuCmluY29tcGF0aWJsZSBjb25maWd1cmF0
aW9uIiBzZW1hbnRpY3Mgd2l0aG91dCByZXF1aXJpbmcgdXNlcnNwYWNlIHRvIG9wdC1pbiBpcyBh
bgpldmVuIHdvcnNlIGV4cGVyaWVuY2UgZm9yIHVzZXJzcGFjZS4KCj4gQSB3YXkgdG8gb3B0LW91
dCBmcm9tIGh1Z2UgcGFnZXMgY291bGQgYmUgdXNlZnVsIGFsdGhvdWdoIHRoZXJlJ3MgYWx3YXlz
IHRoZQo+IHJpc2sgb2Ygc29tZSBpbml0aWFsIHRyb3VibGVzIHJlc3VsdGluZyBpbiB2YXJpb3Vz
IG9ubGluZSBzb3VyY2VzIGNhcmdvLWN1bHQKPiByZWNvbW1lbmRpbmcgdG8gb3B0LW91dCBmb3Jl
dmVyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
